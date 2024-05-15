using CPUFramework;
using System.Data;
using System.Diagnostics;
using CPUWindowsFormFramework;

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
            string sql = "select r.*, c.CuisineName, s.UserName from Recipe r join Cuisine c on r.CuisineID = c.CuisineID join Staff s on r.StaffID = s.StaffID where r.RecipeId = " + RecipeId.ToString();
            dtrecipe = SQLUtility.GetDataTable(sql);
            if (RecipeId == 0)
            {
                dtrecipe.Rows.Add();
            }
            DataTable dtcuisines = SQLUtility.GetDataTable("select CuisineID, CuisineName from Cuisine");
            WindowsFormsUtility.SetControlBinding(txtRecipeName, dtrecipe);
            WindowsFormsUtility.SetListBinding(lstCuisineName, dtcuisines, dtrecipe, "Cuisine");
            WindowsFormsUtility.SetControlBinding(txtCalories, dtrecipe);
            WindowsFormsUtility.SetControlBinding(dtpDraftDate, dtrecipe);
            WindowsFormsUtility.SetControlBinding(txtPublishDate, dtrecipe);
            WindowsFormsUtility.SetControlBinding(txtArchivedDate, dtrecipe);
            WindowsFormsUtility.SetControlBinding(txtRecipeStatus, dtrecipe);
            DataTable dtstaffusername = SQLUtility.GetDataTable("select StaffID, UserName from Staff");
           WindowsFormsUtility.SetListBinding(lstUserName, dtstaffusername, dtrecipe, "Staff");
            this.Show();
        }

        private void Save()
        {
            SQLUtility.DebugPrintDataTable(dtrecipe);
            DataRow r = dtrecipe.Rows[0];
            int id = (int)r["RecipeId"];
            string sql = "";


            if (id > 0)
            {
                sql = string.Join(Environment.NewLine, $"update recipe set",
                    $"RecipeName = '{r["RecipeName"]}',",
                    $"Calories = '{r["Calories"]}',",
                    $"DraftDate = '{r["DraftDate"]}',",
                    $"StaffID = '{r["StaffID"]}'",
                    $"from Recipe r join Staff s on r.StaffID = s.StaffID where RecipeID = {r["RecipeID"]}");
            }
            else
            {
                sql = "insert recipe(StaffID, CuisineID,  RecipeName, Calories, DraftDate) ";
                sql += $"select '{r["StaffID"]}','{r["CuisineID"]}', '{r["RecipeName"]}', {r["Calories"]}, '{r["DraftDate"]}'";
                
            }
            Debug.Print("----");

            SQLUtility.ExecuteSQL(sql);
        }
            private void Delete()
        {
            int id = (int)dtrecipe.Rows[0]["RecipeID"];
            string sql = "delete recipe where RecipeID = " + id;
            SQLUtility.ExecuteSQL(sql);
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
