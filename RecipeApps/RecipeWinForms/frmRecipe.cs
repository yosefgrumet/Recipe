namespace RecipeWinForms
{
    public partial class frmRecipe : Form
    {
        DataTable dtrecipe = new DataTable();
        BindingSource bindsource = new BindingSource();
        public frmRecipe()
        {
            InitializeComponent();
            btnSave.Click += BtnSave_Click;
            btnDelete.Click += BtnDelete_Click;
        }

        

        public void Showform(int RecipeId)
        {
            dtrecipe = Recipe.Load(RecipeId);
            bindsource.DataSource = dtrecipe;
            if (RecipeId == 0)
            {
                dtrecipe.Rows.Add();
            }
            DataTable dtcuisines = Recipe.GetCuisineList();
            WindowsFormsUtility.SetControlBinding(txtRecipeName, bindsource);
            WindowsFormsUtility.SetListBinding(lstCuisineName, dtcuisines, dtrecipe, "Cuisine");
            WindowsFormsUtility.SetControlBinding(txtCalories, bindsource);
            WindowsFormsUtility.SetControlBinding(dtpDraftDate, bindsource);
            WindowsFormsUtility.SetControlBinding(txtPublishDate, bindsource);
            WindowsFormsUtility.SetControlBinding(txtArchivedDate, bindsource);
            WindowsFormsUtility.SetControlBinding(txtRecipeStatus, bindsource);
            DataTable dtstaffusername = Recipe.GetStaffList();
            WindowsFormsUtility.SetListBinding(lstUserName, dtstaffusername, dtrecipe, "Staff");

            txtPublishDate.ReadOnly = true;
            txtArchivedDate.ReadOnly = true;
            txtRecipeStatus.ReadOnly = true;

            this.Show();
        }

        private void Save()
        {
            Application.UseWaitCursor = true;
            try
            {
                Recipe.Save(dtrecipe);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Recipe");
            }
            finally
            {
                Application.UseWaitCursor = false;
            }
        }

        private void Delete()
        {
            var response = MessageBox.Show("Are you sure you want to delete this recipe?", "Recipe", MessageBoxButtons.YesNo);
            if (response == DialogResult.No)
            {
                return;
            }
            Application.UseWaitCursor = true;
            try
            {
                Recipe.delete(dtrecipe);
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Recipe");
            }
            finally
            {
                Application.UseWaitCursor = false;
            }
        }
        private void BtnDelete_Click(object? sender, EventArgs e)
        {
            Delete();
        }

        private void BtnSave_Click(object? sender, EventArgs e)
        {
            Save();
        }
    }
}
