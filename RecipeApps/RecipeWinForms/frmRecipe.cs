namespace RecipeWinForms
{
    public partial class frmRecipe : Form
    {
        DataTable dtrecipe;
        public frmRecipe()
        {
            InitializeComponent();
            btnSave.Click += BtnSave_Click;
            btnDelete.Click += BtnDelete_Click;
        }

        

        public void Showform(int RecipeId)
        {
            dtrecipe = Recipe.Load(RecipeId);
            if (RecipeId == 0)
            {
                dtrecipe.Rows.Add();
            }
            DataTable dtcuisines = Recipe.GetCuisineList();
            WindowsFormsUtility.SetControlBinding(txtRecipeName, dtrecipe);
            WindowsFormsUtility.SetListBinding(lstCuisineName, dtcuisines, dtrecipe, "Cuisine");
            WindowsFormsUtility.SetControlBinding(txtCalories, dtrecipe);
            WindowsFormsUtility.SetControlBinding(dtpDraftDate, dtrecipe);
            WindowsFormsUtility.SetControlBinding(txtPublishDate, dtrecipe);
            WindowsFormsUtility.SetControlBinding(txtArchivedDate, dtrecipe);
            WindowsFormsUtility.SetControlBinding(txtRecipeStatus, dtrecipe);
            DataTable dtstaffusername = Recipe.GetStaffList();
            WindowsFormsUtility.SetListBinding(lstUserName, dtstaffusername, dtrecipe, "Staff");
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
