-- SM Excellent work! 100% See comment
use HeartyHearthDB
go
/*
Our website development is underway! 
Below is the layout of the pages on our website, please provide the SQL to produce the necessary result sets.

Note: 
a) When the word 'specific' is used, pick one record (of the appropriate type, recipe, meal, etc.) for the query. The way the website works is that a list of items are displayed and then the user picks one and navigates to the "details" page.
b) Whenever you have a record for a specific item include the name of the picture for that item. That is because the website will always show a picture of the item.

Home Page
    One resultset with number of recipes, meals, and cookbooks
*/
SELECT 
    (SELECT COUNT(*) FROM recipe) AS NumberOfRecipes, 
    (SELECT COUNT(*) FROM meal) AS NumberOfMeals, 
    (SELECT COUNT(*) FROM cookbook) AS NumberOfCookbooks

/*
Recipe list page:
    List of all Recipes that are either published or archived, published recipes should appear at the top. 
	Archived recipes should appear gray. Surround the archived recipe with <span style="color:gray">recipe name</span>
    In the resultset show the Recipe with its status, dates it was published and archived (blank if not archived), user, number of calories and number of ingredients.
*/
select distinct RecipeName =  case when r.Recipestatus = 'archive' then CONCAT('<span style="color:gray">',r.recipename,'</span>') else r.recipename end,
 r.Recipestatus, r.PublishDate,  Archivedate = isnull(CONVERT(varchar(10), r.ArchivedDate, 101), ''), s.UserName, r.Calories, Ingredientcount = COUNT (ri.IngredientID)
from Recipe r
join Staff s
on s.StaffID = r.StaffID
JOIN RecipeIngredient ri
on ri.RecipeID = r.RecipeID
join Ingredient i
on i.IngredientID = ri.IngredientID
where r.PublishDate is not null
or r.ArchivedDate is not null
group by r.RecipeName, r.Recipestatus, r.PublishDate, r.ArchivedDate, s.UserName, r.Calories
order by r.Recipestatus

/*
Recipe details page:
    Show for a specific recipe (three result sets):
        a) Recipe header: recipe name, number of calories, number of ingredients and number of steps.
        b) List of ingredients: show the measurement type and ingredient in one column, sorted by sequence. Ex. 1 Teaspoon Salt  
        c) List of prep steps sorted by sequence.
*/

select r.RecipeName, r.Calories
, Ingredientscount = count(distinct ri.RecipeIngredientID)
, instructioncount = count(DISTINCT i.InstructionID)
from Recipe r
join RecipeIngredient ri
on ri.RecipeID = r.RecipeID
join Instruction i
on i.RecipeId = r.RecipeID
where r.RecipeName = 'Apple Yogurt Smoothie'
group by r.RecipeName, r.Calories

select IngredientList= concat (ri.Amount,' ',m.MeasurementType,' ',i.Item)
from Recipe r
join RecipeIngredient ri
on ri.RecipeID = r.RecipeID
join Ingredient i
on i.IngredientID = ri.IngredientID
left join Measurement m
on m.MeasurementID =ri.MeasurementID
where r.RecipeName = 'Apple Yogurt Smoothie'
order by ri.IngredientCode

select i.InstructionDescription
from Recipe r
join Instruction i
on i.RecipeId = r.RecipeID
where r.RecipeName = 'Apple Yogurt Smoothie'
order by i.StepNumber

/*
Meal list page:
    All active meals, meal name, user that created meal, number of calories for the meal, number of courses, and number of recipes per each meal, sorted by name of meal
*/
-- SM -10% You return the number of rows. We need number of courses and recipes
select distinct m.MealName, s.UserName, CalorieTotal= SUM (r.Calories), CourseTotal = COUNT(mc.courseid), NumofRecipes = COUNT(mcr.recipeid)
from Meal m
join Staff s
on s.StaffID = m.StaffID
join MealCourse mc
on mc.MealID = m .MealID
join MealCourseRecipe mcr
on mcr.Mealcourseid = mc.MealCourseID
join Recipe r
on r.RecipeID = mcr.RecipeID
where m.Active = 1
group by m.MealName, s.UserName
/*
Meal details page:
    Show for a specific meal:
        a) Meal header: meal name, user, date created.
        b) List of all recipes. 
            Display in one column the course type, recipe, and for the main course show which dish is the main and which are side. 
			In this format "Course Type: Main\Side dish - Recipe Name. Then main dishes should be bold, using the bold tags as shown below
                ex: 
                    Appetizer: Mixed Greens
                    <b>Main: Main dish - Onion Pastrami Chicken</b>
					Main: Side dish - Roasted cucumbers with mustard
*/
select m.MealName, s.UserName, m.DateCreated
from Meal m
join Staff s
on s.StaffID = m.staffid
where m.MealName = 'Breakfast bash'

select Meal= case when c.CourseName = 'Appetizer' then CONCAT(c.CourseName,': ',r.RecipeName)
when c.CourseName = 'Main course' and mcr.maindish = 1 then CONCAT('<b>',c.CourseName,': Main dish - ',r.RecipeName,'</b>')
when c.CourseName = 'Main course' and mcr.maindish = 0 then CONCAT(c.CourseName,': Side dish - ',r.RecipeName)
end
from Meal m
join Staff s
on s.StaffID = m.staffid
join MealCourse mc
on mc.MealID = m.MealID
join Course c
on c.CourseID = mc.CourseID
join MealCourseRecipe mcr
on mcr.Mealcourseid = mc.MealCourseID
join Recipe r
on r.RecipeID = mcr.RecipeID
where m.MealName = 'Breakfast bash'
order by c.CourseOrder, mcr.maindish desc

/*
Cookbook list page:
    Show all active cookbooks with author and number of recipes per book. Sorted by book name.
*/

select c.CookbookName, s.UserName, Recipes = COUNT(RecipeID)
FROM Cookbook C
join Staff s
on s.StaffID = c.Staffid
join CookbookRecipe cr
on cr.CookbookID = c.CookbookID
where c.Active = 1
group by c.CookbookName, s.UserName
order by c.CookbookName

/*
Cookbook details page:
    Show for specific cookbook:
    a) Cookbook header: cookbook name, user, date created, price, number of recipes.
    b) List of all recipes in the correct order. Include recipe name, cuisine and number of ingredients and steps.  Note: User will click on recipe to see all ingredients and steps.
*/
select c.CookbookName, s.UserName, c.Datecreated, c.Price, NumofRecipes = COUNT(cr.RecipeID)
from Cookbook c
join Staff s
on s.StaffID = c.Staffid
join CookbookRecipe cr
on cr.CookbookID = c.CookbookID
where c.CookbookName = 'Treats for two'
group by c.CookbookName, s.UserName, c.Datecreated, c.Price

select r.RecipeName, cu.CuisineName, NumofIngredients = COUNT(distinct ri.IngredientID), NumofSteps = COUNT(distinct i.InstructionID)
from Cookbook c
join Staff s
on s.StaffID = c.Staffid
join CookbookRecipe cr
on cr.CookbookID = c.CookbookID
join Recipe r
on r.RecipeID = cr.RecipeID
join Cuisine cu
on cu.CuisineID = r.CuisineID
JOIN RecipeIngredient ri
on ri.RecipeID = r.RecipeID
join Instruction i
on i.RecipeId = r.RecipeID
where c.CookbookName = 'Treats for two'
group by r.RecipeName, cu.CuisineName

/*
April Fools Page:
    On April 1st we have a page with a joke cookbook. For that page provide the following.
    a) A list of all the recipes that are in all cookbooks. The recipe name should be the reverse of the real name with the first letter capitalized and all others lower case.
        There are matching pictures for those names, include the reversed picture names so that we can show the joke pictures.
        Note: ".jpg" file extension must be at the end of the reversed picture name EX: Recipe_Seikooc_pihc_etalocohc.jpg
    b) When the user clicks on any recipe they should see a spoof steps lists showing the step instructions for the LAST step of EACH recipe in the system. No sequence required.
        Hint: Use CTE
*/
SELECT recipe = CONCAT (REVERSE(upper(SUBSTRING(r.RecipeName,LEN(r.RecipeName),1)))
,REVERSE(LOWER(SUBSTRING(r.RecipeName,1,LEN(r.RecipeName)-1)))), Picture = replace(CONCAT (REVERSE(upper(SUBSTRING(r.RecipeName,LEN(r.RecipeName),1)))
,REVERSE(LOWER(SUBSTRING(r.RecipeName,1,LEN(r.RecipeName)-1))),'.jpeg'),' ','-')
FROM Cookbook c
join CookbookRecipe cr
on cr.CookbookID = c.CookbookID
join Recipe r
on r.RecipeID = cr.RecipeID

;
with x as (
select r.RecipeName, ins.InstructionDescription
from Recipe r
join Instruction ins
on ins.RecipeId = r.RecipeID
GROUP by r.RecipeName, ins.InstructionDescription
)
select AprilFools = max (x.InstructionDescription)
from x
GROUP by x.RecipeName

/*
For site administration page:
5 seperate reports
    a) List of how many recipes each user created per status. Show 0 if user has no recipes at all.
    b) List of how many recipes each user created and average amount of days that it took for the user's recipes to be published.
    c) For each user, show three columns: Total number of meals, Total Active meals, Total Inactive meals. Show 0 if none
        Hint: For active/inactive columns, use SUM function with CASE to only include in sum if active/inactive 
    d) For each user, show three columns: Total number of cookbooks, Total Active cookbooks, Total Inactive cookbooks. Show 0 if none
        Hint: For active/inactive columns, use SUM function with CASE to only include in sum if active/inactive 
    e) List of archived recipes that were never published, and how long it took for them to be archived.
*/
select s.UserName, NumofRecipes = COUNT(r.Recipestatus), r.Recipestatus
from Staff s
join Recipe r
on r.StaffID = s.StaffID
group by r.Recipestatus, s.UserName

select s.UserName, NumofRecipes = count (r.RecipeID), AvgdaysToPublish = AVG(DATEDIFF(DAY,r.DraftDate,r.PublishDate))
from Staff s
join Recipe r
on r.StaffID = s.StaffID
where r.publishdate is not null
group by s.UserName, r.DraftDate, r.PublishDate

SELECT s.UserName, NumberofMeals = COUNT(m.MealName), NumActiveMeals = sum(case when m.Active = 1 then 1 else 0 end),
NuminActiveMeals = sum(case when m.Active = 0 then 1 else 0 end)
from Staff s
left join Meal m
on m.StaffID = s.StaffID
group by s.UserName, m.Active

select s.UserName, NumofCookbooks = COUNT(c.CookbookName), NumofActiveCookbooks = sum(case when c.Active = 1 then 1 else 0 end),
NuminActiveCookbooks = sum(case when c.Active = 0 then 1 else 0 end)
from Staff s
left join Cookbook c
on c.Staffid = s.StaffID 
group by s.UserName

-- SM You can use status column to get archived recipes.
select DaysFromDrafttoArchive = DATEDIFF(DAY ,r.DraftDate, r.ArchivedDate)
from Recipe r
where r.PublishDate is null
and r.ArchivedDate is not null

/*
For user dashboard page:
    a) For a specific user, show one result set with the number of recipes, meals, and cookbooks. Each row should have a column with the item name (Ex: Recipes) and a column with the count.
        Tip: If you would like, you can use a CTE to get the User Id once instead of in each union select
    b) List of the user's recipes, display the status and the number of hours between the status it's in and the one before that. Omit recipes in drafted status.
    
    OPTIONAL CHALLENGE QUESTION
    c) Show a list of cuisines and the count of recipes the user has per cuisine, 0 if none
        Hint: For the number of recipes, use count of records that have a staffid or CTE.
*/

;
with x as (
select s.StaffID, r.RecipeName, m.MealName, c.CookbookName
from Staff s 
left join Recipe r
on r.StaffID = s.StaffID
left join Meal m
on m.StaffID = s.StaffID
left join Cookbook c
on c.Staffid = s.StaffID
where s.UserName = 'VictoriaDwek@heartyhearth'
)
select ColumnName = 'Recipe', NumofRecipes = COUNT(x.RecipeName) 
from x
union SELECT ColumnName = 'Meals', NumofMeals = COUNT(x.MealName)
from x
union SELECT ColumnName = 'Cookbooks', NumofCookbooks = COUNT(x.CookbookName)
from x

select r.RecipeName, r.Recipestatus, 
HoursfromPreviousStatus = DATEDIFF(hour, case when r.Recipestatus = 'Published' then r.DraftDate when r.Recipestatus = 'Archive' then
case when r.publishDate is null then r.DraftDate else r.PublishDate end end,
case when r.Recipestatus = 'Published' then r.PublishDate when r.Recipestatus = 'Archive' then r.ArchivedDate end)
from Staff s 
left join Recipe r
on r.StaffID = s.StaffID
left join Meal m
on m.StaffID = s.StaffID
left join Cookbook c
on c.Staffid = s.StaffID
where s.UserName = 'VictoriaDwek@heartyhearth'
and r.Recipestatus <> 'Draft'

