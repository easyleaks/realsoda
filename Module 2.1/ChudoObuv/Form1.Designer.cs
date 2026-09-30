using System.Drawing;
using System.Windows.Forms;

namespace ChudoObuv
{
    partial class Form1
    {
        private System.ComponentModel.IContainer components = null;
        private Panel panelHeader;
        private PictureBox pictureLogo;
        private Label labelTitle;
        private Button buttonRefresh;
        private FlowLayoutPanel flowCatalog;
        private Label labelStatus;

        protected override void Dispose(bool disposing)
        {
            if (disposing && components != null)
            {
                components.Dispose();
            }

            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            panelHeader = new Panel();
            pictureLogo = new PictureBox();
            labelTitle = new Label();
            buttonRefresh = new Button();
            flowCatalog = new FlowLayoutPanel();
            labelStatus = new Label();
            panelHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureLogo).BeginInit();
            SuspendLayout();

            panelHeader.BackColor = Color.FromArgb(210, 246, 231);
            panelHeader.Dock = DockStyle.Top;
            panelHeader.Height = 84;
            panelHeader.Controls.Add(pictureLogo);
            panelHeader.Controls.Add(labelTitle);
            panelHeader.Controls.Add(buttonRefresh);

            pictureLogo.Location = new Point(12, 4);
            pictureLogo.Size = new Size(76, 76);
            pictureLogo.SizeMode = PictureBoxSizeMode.Zoom;
            pictureLogo.TabStop = false;

            labelTitle.AutoSize = true;
            labelTitle.Font = new Font("Calibri", 18F, FontStyle.Bold);
            labelTitle.Location = new Point(104, 26);
            labelTitle.Text = "Каталог товаров";

            buttonRefresh.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            buttonRefresh.BackColor = Color.FromArgb(112, 178, 175);
            buttonRefresh.FlatStyle = FlatStyle.Flat;
            buttonRefresh.Location = new Point(798, 24);
            buttonRefresh.Size = new Size(130, 36);
            buttonRefresh.Text = "Обновить";
            buttonRefresh.UseVisualStyleBackColor = false;
            buttonRefresh.Click += buttonRefresh_Click;

            flowCatalog.AutoScroll = true;
            flowCatalog.BackColor = Color.White;
            flowCatalog.Dock = DockStyle.Fill;
            flowCatalog.FlowDirection = FlowDirection.TopDown;
            flowCatalog.Padding = new Padding(12);
            flowCatalog.WrapContents = false;
            flowCatalog.SizeChanged += flowCatalog_SizeChanged;

            labelStatus.Dock = DockStyle.Bottom;
            labelStatus.Height = 30;
            labelStatus.Padding = new Padding(12, 5, 0, 0);
            labelStatus.Text = "Загрузка каталога...";

            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.White;
            ClientSize = new Size(940, 700);
            Font = new Font("Calibri", 10F);
            MinimumSize = new Size(800, 550);
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Чудо Обувь — каталог товаров";
            Controls.Add(flowCatalog);
            Controls.Add(labelStatus);
            Controls.Add(panelHeader);
            Load += Form1_Load;
            FormClosed += Form1_FormClosed;
            panelHeader.ResumeLayout(false);
            panelHeader.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)pictureLogo).EndInit();
            ResumeLayout(false);
        }
    }
}
