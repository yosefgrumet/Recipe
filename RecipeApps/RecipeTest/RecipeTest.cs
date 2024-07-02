using CPUFramework;
using System.Data;

namespace RecipeTest
{
    public class RecipeAppTest
    {
        [SetUp]
        public void Setup()
        {
            DBManager.SetConnectionString("Server=.\\SQLExpress;Database=HeartyHearthDB;Trusted_Connection=true");
        }

        [Test]
        public void ChangeExistingRecipeCalories()
        {
            int recipeid = GetExistingRecipeId();
            Assume.That(recipeid > 0, "No recipes in DB, can't run test");
            int calories = SQLUtility.GetFirstColumnFirstRowValue("select calories from recipe where recipeid = " + recipeid);
            TestContext.WriteLine("calories for recipeid " + recipeid + " is " + calories);
            calories = calories + 5;
            TestContext.WriteLine("change calories to " + calories);

            DataTable dt = Recipe.Load(recipeid);
            dt.Rows[0]["calories"] = calories;
            Recipe.Save(dt);

            int newcalories = SQLUtility.GetFirstColumnFirstRowValue("select calories from recipe where recipeid = " + recipeid);
            Assert.IsTrue(newcalories == calories, "calories for recipe (" + recipeid + ") = " + calories);
            TestContext.WriteLine("calories for recipe (" + recipeid + ") = " + calories);
        }
        [Test]
        public void DeleteRecipe()
        {
            string checkrelated = "SELECT r.RecipeID FROM Recipe r LEFT JOIN RecipeIngredient ri ON ri.RecipeID = r.RecipeID WHERE ri.RecipeIngredientID IS NULL";
            DataTable dt = SQLUtility.GetDataTable(checkrelated); //add here a where clause that limits the results to the type that yuou want...
            //int recipeid = 0;
            if (dt.Rows.Count > 0)
            {
                int recipeid = (int)dt.Rows[0]["recipeid"];
                TestContext.WriteLine("Ensure that app can delete RecipeID: " + recipeid);

                Recipe.delete(dt);
                DataTable dtafterdelete = SQLUtility.GetDataTable("select * from recipe where recipeid = " + recipeid);
                Assert.IsTrue(dtafterdelete.Rows.Count == 0, "record with recipeid " + recipeid + " exists in DB");
                TestContext.WriteLine("record with recipeid " + recipeid + " does not exists in DB");
            }
            else
            {
                TestContext.WriteLine("No recipes found without ingredients.");
            }
        }
        [Test]
        public void InsertNewRecipe()
        {
            DataTable dt = SQLUtility.GetDataTable("select * from recipe where recipeid = 0");
            DataRow r = dt.Rows.Add();
            Assume.That(dt.Rows.Count == 1);
            int Staffid = SQLUtility.GetFirstColumnFirstRowValue("select top 1 staffid from staff");
            Assume.That(Staffid > 0, "Can't run test no staff in the DB");
            int Cuisineid = SQLUtility.GetFirstColumnFirstRowValue("select top 1 cuisineid from cuisine");
            Assume.That(Cuisineid > 0, "Can't run test no cuisine in the DB");

            string uniqueRecipeName = "Hot Dog " + DateTime.Now.ToString();

            r["RecipeName"] = uniqueRecipeName;
            r["Calories"] = 100;
            r["DraftDate"] = DateTime.Now;
            r["StaffID"] = Staffid;
            r["CuisineID"] = Cuisineid;

            Recipe.Save(dt);

            int Newrecipeid = SQLUtility.GetFirstColumnFirstRowValue("select recipeid from recipe where recipename = '" + uniqueRecipeName + "'");
            Assert.IsTrue(Newrecipeid > 0, "The new recipe was not inserted");
            TestContext.WriteLine("Inserted new recipe with Recipe Name: " + uniqueRecipeName);
        }


        [Test]
        public void LoadRecipe()
        {
            int recipeid = GetExistingRecipeId();
            Assume.That(recipeid > 0, "No recipes in DB, can't run test");
            TestContext.WriteLine("existing recipe with id = " + recipeid);
            TestContext.WriteLine("Ensure that app loads recipe " + recipeid);
            DataTable dt = Recipe.Load(recipeid);
            int loadedid = (int)dt.Rows[0]["recipeid"];
            Assert.IsTrue(loadedid == recipeid, (int)dt.Rows[0]["recipeid"] + " <> " + recipeid);
            TestContext.WriteLine("Loaded recipe (" + loadedid + ")");
        }

        [Test]
        public void SearchRecipe()
        {
            string criteria = "a";
            int num = SQLUtility.GetFirstColumnFirstRowValue("select total = count(*) from recipe where recipename like '%" + criteria + "%'");
            Assume.That(num > 0, "There are no recipes that match the search for " + num);
            TestContext.WriteLine(num + " recipes that match " + criteria);
            TestContext.WriteLine("Ensure that recipes search reurns " + num + " rows");

            DataTable dt = Recipe.SearchRecipes(criteria);
            int results = dt.Rows.Count;

            Assert.IsTrue(results == num, "Results of recipe search does not match number of recipes, " + results + " <> " + num);
            TestContext.WriteLine("Number of rows returned by recipe search is " + results);
        }

        private int GetExistingRecipeId()
        {
            return SQLUtility.GetFirstColumnFirstRowValue("select top 1 recipeid from recipe");
        }
    }
}