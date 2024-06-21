using CPUFramework;
using System.Data;
using System.Diagnostics;
using CPUWindowsFormFramework;
using RecipeSystem;

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
            Recipe.Save(dtrecipe);
        }
            private void Delete()
        {
            Recipe.delete(dtrecipe);
            this.Close();
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
