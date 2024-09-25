using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using CPUFramework;

namespace RecipeSystem
{
    public class Recipe
    {
        public static DataTable SearchRecipes(string Recipe)
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSQLCommand("RecipeGet");
            cmd.Parameters["@RecipeName"].Value = Recipe;
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }
        public static DataTable Load(int recipeid)
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSQLCommand("RecipeGet");
            cmd.Parameters["@RecipeId"].Value = recipeid;
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }
        public static DataTable GetCuisineList()
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSQLCommand("CuisineGet");
            cmd.Parameters["@All"].Value = 1;
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }
        public static DataTable GetStaffList()
        {
            DataTable dt = new();
            SqlCommand cmd = SQLUtility.GetSQLCommand("StaffGet");
            cmd.Parameters["@All"].Value = 1;
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }
        public static void Save(DataTable dtrecipe)
        {
            if (dtrecipe.Rows.Count == 0)
            {
                throw new Exception("Cannot call Recipe Save method because there are no rows in the table");
            }

            DataRow r = dtrecipe.Rows[0];
            SQLUtility.SaveDataRow(r, "RecipeUpdate");

        }
        public static void delete(DataTable dtrecipe)
        {
            int id = (int)dtrecipe.Rows[0]["RecipeID"];
            SqlCommand cmd = SQLUtility.GetSQLCommand("recipedelete");
            SQLUtility.SetParamValue(cmd, "@recipeid", id);
            SQLUtility.ExecuteSQL(cmd);
        }
    }
}
