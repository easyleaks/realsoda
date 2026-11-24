using System.Data;
using Npgsql;

static class Program
{
    [STAThread]
    static void Main()
    {
        ApplicationConfiguration.Initialize();
        Application.ThreadException += (s,e) => MessageBox.Show(e.Exception.Message,"Ошибка",MessageBoxButtons.OK,MessageBoxIcon.Error);
        Application.Run(new ShopForm());
    }
}

class ShopForm : Form
{
    string connection = Environment.GetEnvironmentVariable("SHOE_DB") ?? "Host=localhost;Database=chudo_obuv;Username=postgres;Password=1234;Timeout=3";
    FlowLayoutPanel page = new();
    int user;
    string fullName = "", search = "", category = "Все категории", sort = "Без сортировки";
    Dictionary<int,int> cart = new();
    string folder = Path.Combine(AppContext.BaseDirectory,"images");

    public ShopForm()
    {
        Width = 980;
        Height = 760;
        Font = new Font("Calibri",12);
        Icon = new Icon(Path.Combine(folder,"shop.ico"));
        page.Dock = DockStyle.Fill;
        page.AutoScroll = true;
        page.WrapContents = false;
        page.FlowDirection = FlowDirection.TopDown;
        page.Padding = new Padding(12);
        Controls.Add(page);
        Login();
    }

    DataTable Query(string sql, params object[] values)
    {
        using var db = new NpgsqlConnection(connection);
        db.Open();
        using var cmd = new NpgsqlCommand(sql,db);
        for(int i=0;i<values.Length;i++)
            cmd.Parameters.AddWithValue("p"+i,values[i]);
        using var reader = cmd.ExecuteReader();
        var table = new DataTable();
        table.Load(reader);
        return table;
    }

    void Screen(string title)
    {
        Text = "Чудо Обувь | "+title;
        while(page.Controls.Count>0) page.Controls[0].Dispose();
        page.BackColor = Color.White;
        var header = new Label {Text=fullName, Width=880,Height=48,TextAlign=ContentAlignment.MiddleRight};
        page.Controls.Add(header);
    }

    Button ButtonOn(Control parent,string text, Action action)
    {
        var b = new Button {Text=text,AutoSize=true,BackColor=Color.FromArgb(112,178,175)};
        b.Click += (s,e)=>action();
        parent.Controls.Add(b);
        return b;
    }

    void Note(string text) => MessageBox.Show(text,"Информация",MessageBoxButtons.OK,MessageBoxIcon.Information);
    bool Confirm(string text) => MessageBox.Show(text,"Подтверждение",MessageBoxButtons.YesNo,MessageBoxIcon.Warning)==DialogResult.Yes;
    void LabelOn(Control parent,string text) => parent.Controls.Add(new Label {Text=text,AutoSize=true,MaximumSize=new Size(850,0)});
    ComboBox Choices(Control parent,object[] items)
    {
        var box=new ComboBox {DropDownStyle=ComboBoxStyle.DropDownList,Width=240};
        box.Items.AddRange(items);
        if(items.Length>0) box.SelectedIndex=0;
        parent.Controls.Add(box);
        return box;
    }

    PictureBox Photo(string file,int w,int h)
    {
        string path=Path.Combine(folder,file);
        if(!File.Exists(path)) path=Path.Combine(folder,"missing.png");
        var photo=new PictureBox {Width=w,Height=h,SizeMode=PictureBoxSizeMode.Zoom};
        using var img=Image.FromFile(path);
        photo.Image=new Bitmap(img);
        photo.Disposed+=(s,e)=>photo.Image.Dispose();
        return photo;
    }

    void Login()
    {
        user=0;
        fullName=search="";
        category="Все категории";
        sort="Без сортировки";
        cart.Clear();
        Screen("Вход");
        page.Controls.Add(Photo("logo.png",180,90));
        LabelOn(page,"Логин");
        var login=new TextBox {Width=260};
        page.Controls.Add(login);
        ButtonOn(page,"Войти",()=>{
            var data=Query("select p.id,concat_ws(' ',surname,p.name,patronymic),r.name from person p join role r on r.id=p.role_id where login=@p0",login.Text.Trim());
            if(data.Rows.Count==0){Note("Проверьте логин.");return;}
            user=(int)data.Rows[0][0];
            fullName=data.Rows[0][1].ToString();
            Catalog();
        });
        ButtonOn(page,"Войти как гость",Catalog);
    }

    const string Products = @"select p.*,c.name category,k.name kind,m.name maker,
        (select coalesce(sum(qty),0) from stock where product_id=p.id) available,
        exists(select 1 from line l join stock s on s.id=l.stock_id join orders o on o.id=l.order_id
        where s.product_id=p.id and o.day>=date_trunc('month',current_date)-interval '1 month'
        and o.day<date_trunc('month',current_date)) sold
        from product p join category c on c.id=p.category_id join kind k on k.id=p.kind_id join maker m on m.id=p.maker_id";
    decimal Price(DataRow row)
    {
        decimal price=Convert.ToDecimal(row["price"]);
        if(!(bool)row["sold"]) price*=0.75m;
        return price;
    }

    void Catalog()
    {
        var goods=Query(Products);
        Screen("Каталог");
        page.Controls.Add(Photo("logo.png",140,64));
        var bar=new FlowLayoutPanel {Width=890,AutoSize=true};
        page.Controls.Add(bar);
        ButtonOn(bar,"Выход",()=>{if(cart.Count==0 || Confirm("Выйти и очистить корзину?"))Login();});
        if(user!=0) ButtonOn(bar,"Корзина",Basket);
        var cards=new FlowLayoutPanel {Width=895,AutoSize=true,FlowDirection=FlowDirection.TopDown,WrapContents=false};
        void ShowCards()
        {
            while(cards.Controls.Count>0) cards.Controls[0].Dispose();
            var rows=goods.AsEnumerable().Where(r=>(category=="Все категории" || category==r["category"].ToString()) &&
                (r["name"]+" "+r["description"]).Contains(search,StringComparison.OrdinalIgnoreCase));
            if(sort=="Цена ↑") rows=rows.OrderBy(Price);
            if(sort=="Цена ↓") rows=rows.OrderByDescending(Price);
            foreach(var r in rows)
            {
                long count=Convert.ToInt64(r["available"]);
                var card=new FlowLayoutPanel {Width=865,AutoSize=true,AutoSizeMode=AutoSizeMode.GrowAndShrink,WrapContents=false,MinimumSize=new Size(865,115),BackColor=count<=3?Color.FromArgb(255,128,128):Color.FromArgb(210,246,231)};
                cards.Controls.Add(card);
                card.Controls.Add(Photo(r["image"].ToString(),110,100));
                var label=new Label {AutoSize=true,MaximumSize=new Size(720,0),Text=$"{r["category"]} | {r["name"]} | {r["maker"]}\n{r["material"]}\nЦена: {Price(r):N2} ₽     Наличие: {(count>5?"много":"мало")}"};
                card.Controls.Add(label);
                foreach(Control child in card.Controls) child.Click+=(s,e)=>Details(r);
                card.Click+=(s,e)=>Details(r);
            }
        }
        if(user!=0)
        {
            var filters=new FlowLayoutPanel {Width=890,AutoSize=true};
            page.Controls.Add(filters);
            var input=new TextBox {Width=270,Text=search,PlaceholderText="Наименование или описание"};
            filters.Controls.Add(input);
            var categories=Choices(filters,new[]{"Все категории"}.Concat(goods.AsEnumerable().Select(r=>r["category"].ToString()).Distinct()).ToArray());
            categories.SelectedItem=category;
            var prices=Choices(filters,new[]{"Без сортировки","Цена ↑","Цена ↓"});
            prices.SelectedItem=sort;
            input.TextChanged+=(s,e)=>{search=input.Text;ShowCards();};
            categories.SelectedIndexChanged+=(s,e)=>{category=categories.Text;ShowCards();};
            prices.SelectedIndexChanged+=(s,e)=>{sort=prices.Text;ShowCards();};
        }
        page.Controls.Add(cards);
        ShowCards();
    }

    void Details(DataRow r)
    {
        var stock=Query("select id,size,qty from stock where product_id=@p0 order by size",r["id"]);
        Screen("Карточка товара");
        page.Controls.Add(Photo(r["image"].ToString(),220,165));
        LabelOn(page,$"{r["name"]}\n{r["category"]}, {r["kind"]}\n{r["maker"]}\n{r["description"]}\n{r["material"]}\nЦена: {Price(r):N2} ₽");
        LabelOn(page,"Размерный ряд: "+string.Join(", ",stock.AsEnumerable().Select(x=>x["size"])));
        var available=stock.AsEnumerable().Where(x=>(int)x["qty"]>0).ToArray();
        if(user!=0 && available.Length>0)
        {
            LabelOn(page,"Доступный размер");
            var size=Choices(page,available.Select(x=>(object)x["size"]).ToArray());
            LabelOn(page,"Количество пар");
            var qty=new NumericUpDown {Minimum=1,Maximum=(int)available[0]["qty"],ReadOnly=true};
            page.Controls.Add(qty);
            size.SelectedIndexChanged+=(s,e)=>qty.Maximum=(int)available[size.SelectedIndex]["qty"];
            ButtonOn(page,"Добавить в корзину",()=>{
                var item=available[size.SelectedIndex];
                int id=(int)item["id"];
                int total=cart.GetValueOrDefault(id)+(int)qty.Value;
                if(total>(int)item["qty"]){Note("С учётом корзины пар недостаточно.");return;}
                cart[id]=total;
                Basket();
            });
        }
        ButtonOn(page,"Назад",Catalog);
    }

    void Basket()
    {
        Screen("Корзина");
        var goods=Query(Products);
        decimal sum=0;
        foreach(var pair in cart)
        {
            var row=Query("select product_id,size,qty from stock where id=@p0",pair.Key).Rows[0];
            var model=goods.AsEnumerable().First(x=>Equals(x["id"],row["product_id"]));
            sum+=Price(model)*pair.Value;
            LabelOn(page,$"{model["name"]}, размер {row["size"]}, {Price(model):N2} ₽ за пару");
            var qty=new NumericUpDown {Minimum=1,Maximum=Math.Max(pair.Value,(int)row["qty"]),Value=pair.Value,ReadOnly=true};
            page.Controls.Add(qty);
            ButtonOn(page,"Изменить количество",()=>{cart[pair.Key]=(int)qty.Value;Basket();});
            ButtonOn(page,"Убрать",()=>{cart.Remove(pair.Key);Basket();});
        }
        LabelOn(page,$"Итого: {sum:N2} ₽");
        if(cart.Count>0) ButtonOn(page,"Оформить заказ",()=>{
            if(!Confirm("Подтвердить оформление заказа?"))return;
            using var db=new NpgsqlConnection(connection);
            db.Open();
            using var tx=db.BeginTransaction();
            using var cmd=new NpgsqlCommand("insert into orders(day,person_id) values(current_date,@client) returning id",db,tx);
            cmd.Parameters.AddWithValue("client",user);
            int order=(int)cmd.ExecuteScalar();
            foreach(var pair in cart)
            {
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("id",pair.Key);
                cmd.Parameters.AddWithValue("qty",pair.Value);
                cmd.CommandText="update stock set qty=qty-@qty where id=@id and qty>=@qty returning product_id";
                var product=cmd.ExecuteScalar();
                if(product==null){Note("Остаток изменился. Проверьте корзину.");return;}
                cmd.Parameters.AddWithValue("price",Price(goods.AsEnumerable().First(x=>Equals(x["id"],product))));
                cmd.Parameters.AddWithValue("order",order);
                cmd.CommandText="insert into line(order_id,stock_id,qty,price) values(@order,@id,@qty,@price)";
                cmd.ExecuteNonQuery();
            }
            tx.Commit();
            cart.Clear();
            Note("Заказ №"+order+" оформлен.");
            Catalog();
        });
        if(cart.Count>0) ButtonOn(page,"Отменить заказ",()=>{if(Confirm("Очистить корзину?")){cart.Clear();Catalog();}});
        ButtonOn(page,"В каталог",Catalog);
    }

}

