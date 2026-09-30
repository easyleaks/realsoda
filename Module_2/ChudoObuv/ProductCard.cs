using System;
using System.Drawing;
using System.IO;
using System.Windows.Forms;

namespace ChudoObuv
{
    public partial class ProductCard : UserControl
    {
        public ProductCard()
        {
            InitializeComponent();
        }

        public void SetData(string productName, string manufacturer, string categoryName,
            string composition, decimal price, string imageFile, int totalQuantity)
        {
            labelTitle.Text = manufacturer + " | " + productName;
            labelCategory.Text = "Категория: " + categoryName;
            labelComposition.Text = "Состав: " + composition;
            labelPrice.Text = price.ToString("0.00") + " руб.";
            labelQuantity.Text = "Количество: " + (totalQuantity > 5 ? "много" : "мало");
            BackColor = totalQuantity <= 3 ? Color.FromArgb(255, 128, 128) : Color.White;
            pictureProduct.Image?.Dispose();
            pictureProduct.Image = LoadImage(imageFile);
        }

        internal static Image LoadImage(string imageFile)
        {
            string folder = Path.Combine(Application.StartupPath, "Resources");
            string imagePath = Path.Combine(folder, Path.GetFileName(imageFile ?? ""));
            Image image = TryLoadImage(imagePath);

            if (image == null)
            {
                image = TryLoadImage(Path.Combine(folder, "picture.png"));
            }

            return image;
        }

        private static Image TryLoadImage(string imagePath)
        {
            if (!File.Exists(imagePath))
            {
                return null;
            }

            try
            {
                using (Image original = Image.FromFile(imagePath))
                {
                    return new Bitmap(original);
                }
            }
            catch (ArgumentException)
            {
                return null;
            }
            catch (IOException)
            {
                return null;
            }
            catch (UnauthorizedAccessException)
            {
                return null;
            }
        }
    }
}
