namespace RecipeWinForms
{
    partial class frmSearch
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            tblmain = new TableLayoutPanel();
            tblsearch = new TableLayoutPanel();
            lblRecipe = new Label();
            txtRecipe = new TextBox();
            btnSearch = new Button();
            gRecipe = new DataGridView();
            btnNew = new Button();
            tblmain.SuspendLayout();
            tblsearch.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)gRecipe).BeginInit();
            SuspendLayout();
            // 
            // tblmain
            // 
            tblmain.ColumnCount = 1;
            tblmain.ColumnStyles.Add(new ColumnStyle());
            tblmain.Controls.Add(tblsearch, 0, 0);
            tblmain.Controls.Add(gRecipe, 0, 1);
            tblmain.Dock = DockStyle.Fill;
            tblmain.Location = new Point(0, 0);
            tblmain.Name = "tblmain";
            tblmain.RowCount = 2;
            tblmain.RowStyles.Add(new RowStyle(SizeType.Percent, 13.5555553F));
            tblmain.RowStyles.Add(new RowStyle(SizeType.Percent, 86.44444F));
            tblmain.Size = new Size(800, 450);
            tblmain.TabIndex = 0;
            // 
            // tblsearch
            // 
            tblsearch.ColumnCount = 4;
            tblsearch.ColumnStyles.Add(new ColumnStyle());
            tblsearch.ColumnStyles.Add(new ColumnStyle());
            tblsearch.ColumnStyles.Add(new ColumnStyle());
            tblsearch.ColumnStyles.Add(new ColumnStyle());
            tblsearch.Controls.Add(lblRecipe, 0, 0);
            tblsearch.Controls.Add(txtRecipe, 1, 0);
            tblsearch.Controls.Add(btnSearch, 2, 0);
            tblsearch.Controls.Add(btnNew, 3, 0);
            tblsearch.Dock = DockStyle.Fill;
            tblsearch.Location = new Point(3, 3);
            tblsearch.Name = "tblsearch";
            tblsearch.RowCount = 1;
            tblsearch.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));
            tblsearch.Size = new Size(794, 55);
            tblsearch.TabIndex = 0;
            // 
            // lblRecipe
            // 
            lblRecipe.Anchor = AnchorStyles.Left;
            lblRecipe.AutoEllipsis = true;
            lblRecipe.AutoSize = true;
            lblRecipe.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point, 0);
            lblRecipe.Location = new Point(3, 13);
            lblRecipe.Name = "lblRecipe";
            lblRecipe.Size = new Size(69, 28);
            lblRecipe.TabIndex = 0;
            lblRecipe.Text = "Recipe";
            // 
            // txtRecipe
            // 
            txtRecipe.Anchor = AnchorStyles.Left;
            txtRecipe.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point, 0);
            txtRecipe.Location = new Point(78, 10);
            txtRecipe.Name = "txtRecipe";
            txtRecipe.Size = new Size(125, 34);
            txtRecipe.TabIndex = 1;
            // 
            // btnSearch
            // 
            btnSearch.Anchor = AnchorStyles.Left;
            btnSearch.AutoSize = true;
            btnSearch.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point, 0);
            btnSearch.Location = new Point(209, 8);
            btnSearch.Name = "btnSearch";
            btnSearch.Size = new Size(94, 38);
            btnSearch.TabIndex = 2;
            btnSearch.Text = "Search";
            btnSearch.UseVisualStyleBackColor = true;
            // 
            // gRecipe
            // 
            gRecipe.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            gRecipe.Dock = DockStyle.Fill;
            gRecipe.Location = new Point(3, 64);
            gRecipe.Name = "gRecipe";
            gRecipe.RowHeadersWidth = 51;
            gRecipe.Size = new Size(794, 383);
            gRecipe.TabIndex = 1;
            // 
            // btnNew
            // 
            btnNew.Anchor = AnchorStyles.Left;
            btnNew.AutoSize = true;
            btnNew.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point, 0);
            btnNew.Location = new Point(309, 8);
            btnNew.Name = "btnNew";
            btnNew.Size = new Size(94, 38);
            btnNew.TabIndex = 3;
            btnNew.Text = "&New";
            btnNew.UseVisualStyleBackColor = true;
            // 
            // frmSearch
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(tblmain);
            Name = "frmSearch";
            Text = "Recipe Search";
            tblmain.ResumeLayout(false);
            tblsearch.ResumeLayout(false);
            tblsearch.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)gRecipe).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private TableLayoutPanel tblmain;
        private TableLayoutPanel tblsearch;
        private Label lblRecipe;
        private TextBox txtRecipe;
        private Button btnSearch;
        private DataGridView gRecipe;
        private Button btnNew;
    }
}