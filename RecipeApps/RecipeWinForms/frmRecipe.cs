using CPUFramework;
using System.Data;

namespace RecipeWinForms
{
    public partial class frmRecipe : Form
    {
        public frmRecipe()
        {
            InitializeComponent();
        }
        public void Showform(int RecipeId)
        {
            string sql = "select r.*, c.CuisineName from Recipe r join Cuisine c on r.CuisineID = c.CuisineID where r.RecipeId = " + RecipeId.ToString();
            DataTable dt = SQLUtility.GetDataTable(sql);
            txtRecipeName.DataBindings.Add("Text", dt, "RecipeName");
            txtCuisineName.DataBindings.Add("Text", dt, "CuisineName");
            txtCalories.DataBindings.Add("Text", dt, "Calories");
            txtDraftDate.DataBindings.Add("Text", dt, "DraftDate");
            txtPublishDate.DataBindings.Add("Text", dt, "PublishDate");
            txtArchivedDate.DataBindings.Add("Text", dt, "ArchivedDate");
            txtRecipeStatus.DataBindings.Add("Text", dt, "RecipeStatus");
            this.Show();
        }
    }
}
