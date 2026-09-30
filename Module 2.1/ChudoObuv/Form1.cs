using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Windows.Forms;

namespace ChudoObuv
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            string iconPath = Path.Combine(Application.StartupPath, "Resources", "app.ico");

            if (File.Exists(iconPath))
            {
                Icon = new Icon(iconPath);
            }

            pictureLogo.Image = ProductCard.LoadImage("logo.png");
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            RefreshCatalog();
        }

        private void buttonRefresh_Click(object sender, EventArgs e)
        {
            RefreshCatalog();
        }

        private void RefreshCatalog()
        {
            buttonRefresh.Enabled = false;
            UseWaitCursor = true;

            try
            {
                string settingsPath = Path.Combine(Application.StartupPath, "connection.txt");
                string connectionString = File.ReadAllText(settingsPath).Trim();

                if (connectionString.Contains("ТВОЙ_ПАРОЛЬ"))
                {
                    throw new InvalidOperationException("Укажите пароль PostgreSQL в файле connection.txt рядом с приложением.");
                }

                using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
                {
                    connection.Open();
                    LoadCatalog(connection, DateTime.Today);
                }
            }
            catch (Exception ex)
            {
                labelStatus.Text = "Каталог не загружен. Проверьте подключение к базе.";
                MessageBox.Show(this, "Не удалось загрузить каталог.\n" + ex.Message,
                    "Чудо Обувь", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                UseWaitCursor = false;
                buttonRefresh.Enabled = true;
            }
        }

        private void LoadCatalog(NpgsqlConnection connection, DateTime calculationDate)
        {
            HashSet<(string, string)> orderedProducts = GetProductsOrderedLastMonth(connection, calculationDate);
            string sql = @"
                SELECT p.product_name, p.manufacturer, p.category_name,
                       p.composition, p.price, p.image_file,
                       COALESCE(SUM(s.quantity), 0) AS total_quantity
                FROM public.products p
                LEFT JOIN public.stock s
                    ON s.product_name = p.product_name
                   AND s.manufacturer = p.manufacturer
                GROUP BY p.product_name, p.manufacturer, p.category_name,
                         p.composition, p.price, p.image_file
                ORDER BY p.product_name, p.manufacturer";

            using (NpgsqlCommand command = new NpgsqlCommand(sql, connection))
            using (NpgsqlDataReader reader = command.ExecuteReader())
            {
                flowCatalog.SuspendLayout();

                try
                {
                    while (flowCatalog.Controls.Count > 0)
                    {
                        Control oldCard = flowCatalog.Controls[0];
                        flowCatalog.Controls.Remove(oldCard);
                        oldCard.Dispose();
                    }

                    while (reader.Read())
                    {
                        string productName = reader.GetString(0);
                        string manufacturer = reader.GetString(1);
                        string categoryName = reader.GetString(2);
                        string composition = reader.IsDBNull(3) ? "" : reader.GetString(3);
                        decimal price = reader.GetDecimal(4);
                        string imageFile = reader.IsDBNull(5) ? "" : reader.GetString(5);
                        int totalQuantity = Convert.ToInt32(reader.GetValue(6));
                        bool wasOrderedLastMonth = orderedProducts.Contains((productName, manufacturer));
                        decimal finalPrice = PriceCalculator.CalculatePrice(price, wasOrderedLastMonth);
                        ProductCard card = new ProductCard();
                        card.SetData(productName, manufacturer, categoryName, composition,
                            finalPrice, imageFile, totalQuantity);
                        flowCatalog.Controls.Add(card);
                    }
                }
                finally
                {
                    flowCatalog.ResumeLayout();
                }
            }

            labelStatus.Text = "Моделей в каталоге: " + flowCatalog.Controls.Count;
            ResizeCards();
        }

        private HashSet<(string, string)> GetProductsOrderedLastMonth(NpgsqlConnection connection, DateTime calculationDate)
        {
            HashSet<(string, string)> result = new HashSet<(string, string)>();
            DateTime periodStart = PriceCalculator.GetPreviousMonthStart(calculationDate);
            DateTime periodEnd = periodStart.AddMonths(1);
            string sql = @"
                SELECT DISTINCT oi.product_name, oi.manufacturer
                FROM public.order_items oi
                JOIN public.orders o ON o.order_no = oi.order_no
                WHERE o.order_date >= @periodStart
                  AND o.order_date < @periodEnd";

            using (NpgsqlCommand command = new NpgsqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue("periodStart", NpgsqlDbType.Date, periodStart);
                command.Parameters.AddWithValue("periodEnd", NpgsqlDbType.Date, periodEnd);

                using (NpgsqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        result.Add((reader.GetString(0), reader.GetString(1)));
                    }
                }
            }

            return result;
        }

        private void flowCatalog_SizeChanged(object sender, EventArgs e)
        {
            ResizeCards();
        }

        private void ResizeCards()
        {
            int cardWidth = flowCatalog.ClientSize.Width - flowCatalog.Padding.Horizontal
                - SystemInformation.VerticalScrollBarWidth - 4;

            foreach (Control card in flowCatalog.Controls)
            {
                card.Width = Math.Max(700, cardWidth);
            }
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            pictureLogo.Image?.Dispose();
            Icon?.Dispose();
        }
    }
}
