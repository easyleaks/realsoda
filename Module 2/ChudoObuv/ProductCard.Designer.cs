using System.Drawing;
using System.Windows.Forms;

namespace ChudoObuv
{
    partial class ProductCard
    {
        private System.ComponentModel.IContainer components = null;
        private TableLayoutPanel tableCard;
        private TableLayoutPanel tableInfo;
        private PictureBox pictureProduct;
        private Label labelTitle;
        private Label labelCategory;
        private Label labelQuantity;
        private Label labelComposition;
        private Label labelPrice;

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                pictureProduct.Image?.Dispose();
                components?.Dispose();
            }

            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            tableCard = new TableLayoutPanel();
            tableInfo = new TableLayoutPanel();
            pictureProduct = new PictureBox();
            labelTitle = new Label();
            labelCategory = new Label();
            labelQuantity = new Label();
            labelComposition = new Label();
            labelPrice = new Label();
            tableCard.SuspendLayout();
            tableInfo.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureProduct).BeginInit();
            SuspendLayout();

            tableCard.ColumnCount = 3;
            tableCard.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 132F));
            tableCard.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100F));
            tableCard.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 140F));
            tableCard.Dock = DockStyle.Fill;
            tableCard.Padding = new Padding(8);
            tableCard.RowCount = 1;
            tableCard.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));
            tableCard.Controls.Add(pictureProduct, 0, 0);
            tableCard.Controls.Add(tableInfo, 1, 0);
            tableCard.Controls.Add(labelPrice, 2, 0);

            pictureProduct.Dock = DockStyle.Fill;
            pictureProduct.SizeMode = PictureBoxSizeMode.Zoom;
            pictureProduct.TabStop = false;

            tableInfo.ColumnCount = 1;
            tableInfo.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100F));
            tableInfo.Dock = DockStyle.Fill;
            tableInfo.Padding = new Padding(8, 0, 5, 0);
            tableInfo.RowCount = 4;
            tableInfo.RowStyles.Add(new RowStyle(SizeType.Absolute, 48F));
            tableInfo.RowStyles.Add(new RowStyle(SizeType.Absolute, 23F));
            tableInfo.RowStyles.Add(new RowStyle(SizeType.Absolute, 23F));
            tableInfo.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));
            tableInfo.Controls.Add(labelTitle, 0, 0);
            tableInfo.Controls.Add(labelCategory, 0, 1);
            tableInfo.Controls.Add(labelQuantity, 0, 2);
            tableInfo.Controls.Add(labelComposition, 0, 3);

            labelTitle.Dock = DockStyle.Fill;
            labelTitle.Font = new Font("Calibri", 11F, FontStyle.Bold);
            labelTitle.TextAlign = ContentAlignment.MiddleLeft;
            labelCategory.Dock = DockStyle.Fill;
            labelCategory.TextAlign = ContentAlignment.MiddleLeft;
            labelQuantity.Dock = DockStyle.Fill;
            labelQuantity.TextAlign = ContentAlignment.MiddleLeft;
            labelComposition.Dock = DockStyle.Fill;
            labelComposition.TextAlign = ContentAlignment.TopLeft;
            labelPrice.Dock = DockStyle.Fill;
            labelPrice.Font = new Font("Calibri", 12F, FontStyle.Bold);
            labelPrice.TextAlign = ContentAlignment.MiddleRight;

            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.White;
            BorderStyle = BorderStyle.FixedSingle;
            Font = new Font("Calibri", 10F);
            Margin = new Padding(0, 0, 0, 10);
            Size = new Size(880, 240);
            Controls.Add(tableCard);
            tableCard.ResumeLayout(false);
            tableInfo.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)pictureProduct).EndInit();
            ResumeLayout(false);
        }
    }
}
