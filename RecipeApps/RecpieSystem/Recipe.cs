using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;

namespace RecipeSystem
{
    public class Recipe
    {
        public static DataTable SearchRecipes(string Recipe)
        {
            string sql = "select r.RecipeID, r.RecipeName from Recipe r where r.RecipeName like '%" + Recipe + "%'";

            DataTable dt = SQLUtility.GetDataTable(sql);
            return dt;
        }
        public static DataTable Load(int recipeid)
        {
            string sql = "select r.*, c.CuisineName, s.UserName from Recipe r join Cuisine c on r.CuisineID = c.CuisineID join Staff s on r.StaffID = s.StaffID where r.RecipeId = " + recipeid.ToString();
            return SQLUtility.GetDataTable(sql);
        }
        public static DataTable GetCuisineList()
        {
            return SQLUtility.GetDataTable("select CuisineID, CuisineName from Cuisine");
        }
        public static DataTable GetStaffList()
        {
            return SQLUtility.GetDataTable("select StaffID, UserName from Staff");
        }
        public static void Save(DataTable dtrecipe)
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
        public static void delete(DataTable dtrecipe)
        {
            int id = (int)dtrecipe.Rows[0]["RecipeID"];
            string sql = "delete recipe where RecipeID = " + id;
            SQLUtility.ExecuteSQL(sql);
        }
    }
}
