namespace RecipeWinForms
{
    partial class frmRecipe
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
            tblMain = new TableLayoutPanel();
            lblRecipeName = new Label();
            txtRecipeName = new TextBox();
            lblRecipeStatus = new Label();
            txtRecipeStatus = new TextBox();
            lblArchivedDate = new Label();
            txtArchivedDate = new TextBox();
            txtPublishDate = new TextBox();
            lblPublishDate = new Label();
            txtDraftDate = new TextBox();
            lblDraftDate = new Label();
            lblCalories = new Label();
            txtCalories = new TextBox();
            lblCuisine = new Label();
            txtCuisineName = new TextBox();
            lblStaffFirstName = new Label();
            txtStaffFirstName = new TextBox();
            lblStaffLastName = new Label();
            txtStaffLastName = new TextBox();
            tblMain.SuspendLayout();
            SuspendLayout();
            // 
            // tblMain
            // 
            tblMain.ColumnCount = 2;
            tblMain.ColumnStyles.Add(new ColumnStyle());
            tblMain.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100F));
            tblMain.Controls.Add(lblRecipeName, 0, 0);
            tblMain.Controls.Add(txtRecipeName, 1, 0);
            tblMain.Controls.Add(lblRecipeStatus, 0, 6);
            tblMain.Controls.Add(txtRecipeStatus, 1, 6);
            tblMain.Controls.Add(lblArchivedDate, 0, 5);
            tblMain.Controls.Add(txtArchivedDate, 1, 5);
            tblMain.Controls.Add(txtPublishDate, 1, 4);
            tblMain.Controls.Add(lblPublishDate, 0, 4);
            tblMain.Controls.Add(txtDraftDate, 1, 3);
            tblMain.Controls.Add(lblDraftDate, 0, 3);
            tblMain.Controls.Add(lblCalories, 0, 2);
            tblMain.Controls.Add(txtCalories, 1, 2);
            tblMain.Controls.Add(lblCuisine, 0, 1);
            tblMain.Controls.Add(txtCuisineName, 1, 1);
            tblMain.Controls.Add(lblStaffFirstName, 0, 7);
            tblMain.Controls.Add(txtStaffFirstName, 1, 7);
            tblMain.Controls.Add(lblStaffLastName, 0, 8);
            tblMain.Controls.Add(txtStaffLastName, 1, 8);
            tblMain.Dock = DockStyle.Fill;
            tblMain.Location = new Point(0, 0);
            tblMain.Name = "tblMain";
            tblMain.RowCount = 9;
            tblMain.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblMain.Size = new Size(801, 416);
            tblMain.TabIndex = 0;
            // 
            // lblRecipeName
            // 
            lblRecipeName.Anchor = AnchorStyles.Left;
            lblRecipeName.AutoSize = true;
            lblRecipeName.Location = new Point(3, 6);
            lblRecipeName.Name = "lblRecipeName";
            lblRecipeName.Size = new Size(126, 28);
            lblRecipeName.TabIndex = 0;
            lblRecipeName.Text = "Recipe Name";
            // 
            // txtRecipeName
            // 
            txtRecipeName.Dock = DockStyle.Fill;
            txtRecipeName.Location = new Point(159, 3);
            txtRecipeName.Name = "txtRecipeName";
            txtRecipeName.Size = new Size(639, 34);
            txtRecipeName.TabIndex = 7;
            // 
            // lblRecipeStatus
            // 
            lblRecipeStatus.Anchor = AnchorStyles.Left;
            lblRecipeStatus.AutoSize = true;
            lblRecipeStatus.Location = new Point(3, 246);
            lblRecipeStatus.Name = "lblRecipeStatus";
            lblRecipeStatus.Size = new Size(127, 28);
            lblRecipeStatus.TabIndex = 5;
            lblRecipeStatus.Text = "Recipe Status";
            // 
            // txtRecipeStatus
            // 
            txtRecipeStatus.Dock = DockStyle.Fill;
            txtRecipeStatus.Location = new Point(159, 243);
            txtRecipeStatus.Name = "txtRecipeStatus";
            txtRecipeStatus.Size = new Size(639, 34);
            txtRecipeStatus.TabIndex = 12;
            // 
            // lblArchivedDate
            // 
            lblArchivedDate.Anchor = AnchorStyles.Left;
            lblArchivedDate.AutoSize = true;
            lblArchivedDate.Location = new Point(3, 206);
            lblArchivedDate.Name = "lblArchivedDate";
            lblArchivedDate.Size = new Size(135, 28);
            lblArchivedDate.TabIndex = 4;
            lblArchivedDate.Text = "Archived Date";
            // 
            // txtArchivedDate
            // 
            txtArchivedDate.Dock = DockStyle.Fill;
            txtArchivedDate.Location = new Point(159, 203);
            txtArchivedDate.Name = "txtArchivedDate";
            txtArchivedDate.Size = new Size(639, 34);
            txtArchivedDate.TabIndex = 11;
            // 
            // txtPublishDate
            // 
            txtPublishDate.Dock = DockStyle.Fill;
            txtPublishDate.Location = new Point(159, 163);
            txtPublishDate.Name = "txtPublishDate";
            txtPublishDate.Size = new Size(639, 34);
            txtPublishDate.TabIndex = 10;
            // 
            // lblPublishDate
            // 
            lblPublishDate.Anchor = AnchorStyles.Left;
            lblPublishDate.AutoSize = true;
            lblPublishDate.Location = new Point(3, 166);
            lblPublishDate.Name = "lblPublishDate";
            lblPublishDate.Size = new Size(121, 28);
            lblPublishDate.TabIndex = 3;
            lblPublishDate.Text = "Publish Date";
            // 
            // txtDraftDate
            // 
            txtDraftDate.Dock = DockStyle.Fill;
            txtDraftDate.Location = new Point(159, 123);
            txtDraftDate.Name = "txtDraftDate";
            txtDraftDate.Size = new Size(639, 34);
            txtDraftDate.TabIndex = 9;
            // 
            // lblDraftDate
            // 
            lblDraftDate.Anchor = AnchorStyles.Left;
            lblDraftDate.AutoSize = true;
            lblDraftDate.Location = new Point(3, 126);
            lblDraftDate.Name = "lblDraftDate";
            lblDraftDate.Size = new Size(102, 28);
            lblDraftDate.TabIndex = 2;
            lblDraftDate.Text = "Draft Date";
            // 
            // lblCalories
            // 
            lblCalories.Anchor = AnchorStyles.Left;
            lblCalories.AutoSize = true;
            lblCalories.Location = new Point(3, 86);
            lblCalories.Name = "lblCalories";
            lblCalories.Size = new Size(81, 28);
            lblCalories.TabIndex = 1;
            lblCalories.Text = "Calories";
            // 
            // txtCalories
            // 
            txtCalories.Dock = DockStyle.Fill;
            txtCalories.Location = new Point(159, 83);
            txtCalories.Name = "txtCalories";
            txtCalories.Size = new Size(639, 34);
            txtCalories.TabIndex = 8;
            // 
            // lblCuisine
            // 
            lblCuisine.Anchor = AnchorStyles.Left;
            lblCuisine.AutoSize = true;
            lblCuisine.Location = new Point(3, 46);
            lblCuisine.Name = "lblCuisine";
            lblCuisine.Size = new Size(74, 28);
            lblCuisine.TabIndex = 14;
            lblCuisine.Text = "Cuisine";
            // 
            // txtCuisineName
            // 
            txtCuisineName.Dock = DockStyle.Fill;
            txtCuisineName.Location = new Point(159, 43);
            txtCuisineName.Name = "txtCuisineName";
            txtCuisineName.Size = new Size(639, 34);
            txtCuisineName.TabIndex = 15;
            // 
            // lblStaffFirstName
            // 
            lblStaffFirstName.Anchor = AnchorStyles.Left;
            lblStaffFirstName.AutoSize = true;
            lblStaffFirstName.Location = new Point(3, 286);
            lblStaffFirstName.Name = "lblStaffFirstName";
            lblStaffFirstName.Size = new Size(150, 28);
            lblStaffFirstName.TabIndex = 16;
            lblStaffFirstName.Text = "Staff First Name";
            // 
            // txtStaffFirstName
            // 
            txtStaffFirstName.Dock = DockStyle.Fill;
            txtStaffFirstName.Location = new Point(159, 283);
            txtStaffFirstName.Name = "txtStaffFirstName";
            txtStaffFirstName.Size = new Size(639, 34);
            txtStaffFirstName.TabIndex = 17;
            // 
            // lblStaffLastName
            // 
            lblStaffLastName.Anchor = AnchorStyles.Left;
            lblStaffLastName.AutoSize = true;
            lblStaffLastName.Location = new Point(3, 354);
            lblStaffLastName.Name = "lblStaffLastName";
            lblStaffLastName.Size = new Size(147, 28);
            lblStaffLastName.TabIndex = 18;
            lblStaffLastName.Text = "Staff Last Name";
            // 
            // txtStaffLastName
            // 
            txtStaffLastName.Dock = DockStyle.Fill;
            txtStaffLastName.Location = new Point(159, 323);
            txtStaffLastName.Name = "txtStaffLastName";
            txtStaffLastName.Size = new Size(639, 34);
            txtStaffLastName.TabIndex = 19;
            // 
            // frmRecipe
            // 
            AutoScaleDimensions = new SizeF(11F, 28F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(801, 416);
            Controls.Add(tblMain);
            Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point, 0);
            Margin = new Padding(4);
            Name = "frmRecipe";
            Text = "Recipe";
            tblMain.ResumeLayout(false);
            tblMain.PerformLayout();
            ResumeLayout(false);
        }

        #endregion

        private TableLayoutPanel tblMain;
        private Label lblRecipeName;
        private Label lblCalories;
        private Label lblDraftDate;
        private Label lblPublishDate;
        private Label lblArchivedDate;
        private Label lblRecipeStatus;
        private TextBox txtRecipeName;
        private TextBox txtCalories;
        private TextBox txtDraftDate;
        private TextBox txtPublishDate;
        private TextBox txtArchivedDate;
        private TextBox txtRecipeStatus;
        private Label lblCuisine;
        private TextBox txtCuisineName;
        private Label lblStaffFirstName;
        private TextBox txtStaffFirstName;
        private Label lblStaffLastName;
        private TextBox txtStaffLastName;
    }
}