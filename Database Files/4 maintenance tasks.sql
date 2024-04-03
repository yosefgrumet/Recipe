-- SM Excellent! 100%
use heartyhearthdb
go
--Note: some of these scripts are needed for specific items, when the instructions say "specific" pick one item in your data and specify it in the where clause using a unique value that identifies it, do not use the primary key.

--1) Sometimes when a staff member is fired. We need to eradicate everything from that user in our system. Write the SQL to delete a specific user and all the user's related records.
delete cr
from Staff s
join Cookbook c
on c.Staffid = s.Staffid
join CookbookRecipe cr
on cr.CookbookID = c.CookbookID
where s.UserName = 'EfraimHarari@heartyhearth'

delete c
from Staff s
join Cookbook c
on c.Staffid = s.Staffid
where s.UserName = 'EfraimHarari@heartyhearth'

delete mcr
from Staff s
join Meal m
on s.StaffID = m.StaffID
join MealCourse mc
on mc.MealID = m.MealID
join MealCourseRecipe mcr
on mcr.MealCourseId = mc.MealCourseID
where s.UserName = 'EfraimHarari@heartyhearth'

delete mc
from Staff s
join Meal m
on s.StaffID = m.StaffID
join MealCourse mc
on mc.MealID = m.MealID
where s.UserName = 'EfraimHarari@heartyhearth'

delete m
from Staff s
join Meal m
on s.StaffID = m.StaffID
where s.UserName = 'EfraimHarari@heartyhearth'


--delete cr
--from Staff s
--join Recipe r
--on r.StaffID = s.StaffID
--join CookbookRecipe cr
--on cr.RecipeID = r.RecipeID
--where s.UserName = 'EfraimHarari@heartyhearth'
--
--delete mcr
--from Staff s
--join Recipe r
--on r.StaffID = s.StaffID
--join MealCourseRecipe mcr
--on mcr.RecipeID = r.RecipeID
--where s.UserName = 'EfraimHarari@heartyhearth'

delete i
from Staff s
join Recipe r
on r.StaffID = s.StaffID
join Instruction i
on i.RecipeId = r.RecipeId
where s.UserName = 'EfraimHarari@heartyhearth'

delete ri
from Staff s
join Recipe r
on r.StaffID = s.StaffID
join RecipeIngredient ri
on ri.RecipeID = r.RecipeID
where s.UserName = 'EfraimHarari@heartyhearth'

delete r 
from Staff s
join Recipe r
on r.StaffID = s.StaffID
where s.UserName = 'EfraimHarari@heartyhearth'

delete s
from staff s
where s.UserName = 'EfraimHarari@heartyhearth'

go
--2) Sometimes we want to clone a recipe as a starting point and then edit it. For example we have a complex recipe (steps and ingredients) and want to make a modified version. Write the SQL that clones a specific recipe, add " - clone" to its name.

;
with x as (
    select *
    from Recipe r
    where r.RecipeName = 'Chocolate Chip Cookies'
)
insert Recipe (StaffID, CuisineID, RecipeName, Calories, DraftDate )
SELECT x.StaffID, x.CuisineID, CONCAT(x.RecipeName,' - clone'),x.Calories, x.DraftDate 
from x

;
with x as (
    select r.RecipeID, i.InstructionDescription, i.StepNumber, r.StaffID
    from Instruction i
    join Recipe r
    on r.RecipeID = i.RecipeId
    where r.RecipeName = 'Chocolate Chip Cookies'
)
INSERT Instruction (RecipeId, StepNumber, InstructionDescription)
select r.RecipeId, x.StepNumber, x.InstructionDescription
from x
join Recipe r
on r.StaffID = x.StaffID
where r.RecipeName = 'Chocolate Chip Cookies - clone'

;
with x as (
    select ri.Amount, ri.IngredientCode, ri.IngredientID, ri.RecipeID, ri.MeasurementID, r.StaffID
    from RecipeIngredient ri
    join Instruction i
    on i.RecipeId = ri.RecipeID
    join Recipe r
    on r.RecipeID = i.RecipeId
    where r.RecipeName = 'Chocolate Chip Cookies'
)
INSERT RecipeIngredient (RecipeID, IngredientID, MeasurementID, Amount, IngredientCode )
select distinct r.RecipeID, x.IngredientID, x.MeasurementID, x.Amount, x.IngredientCode
from x
join Recipe r
on r.StaffID = x.StaffID
where r.RecipeName = 'Chocolate Chip Cookies - clone'

go

/*
3) We offer users an option to auto-create a recipe book containing all of their recipes. 
Write a SQL script that creates the book for a specific user and fills it with their recipes.
The name of the book should be Recipes by Firstname Lastname. 
The prices should be the number of recipes times $1.33
Sequence the book by recipe name.

Tip: To get a unique sequential number for each row in the result set use the ROW_NUMBER() function. See Microsoft Docs.
	 The following can be a column in your select statement: Sequence = ROW_NUMBER() over (order by colum name) , replace column name with the name of the column that the row number should be sorted
*/

;
with x as (
select cookbookname = CONCAT('Recipes by', ' ', s.FirstName,' ', s.LastName), Price = count(r.RecipeID) * 1.33 , active= 1,Datecreated= '05-01-2022', staff = s.StaffID
from Recipe r
join Staff s
on s.StaffID = r.StaffID
where s.FirstName = 'Victoria'
and s.LastName = 'Dwek'
group by s.FirstName, s.LastName, s.StaffID
)
insert Cookbook (Staffid, CookbookName, Price, Active, Datecreated)
select x.staff, x.CookbookName, x.Price, x.Active, x.Datecreated
from x

insert CookbookRecipe(recipesequence, CookbookID, RecipeID)
select SequenceNumber = ROW_NUMBER() over (order by r.RecipeName), CookbookID , r.RecipeID
from Cookbook c
join Recipe r
on r.StaffID = c.Staffid
join Staff s
on s.StaffID = r.StaffID
where c.CookbookName = CONCAT('Recipes by', ' ', s.FirstName,' ', s.LastName)

--select * from Cookbook

/*
4) Sometimes the calorie count of of an ingredient changes and we need to change the calories for all recipes that use that ingredient.
Our staff nutritionist will specify the amount to change per measurement type, and of course multiply the amount by the quantity of the ingredient.
For example, the calorie count of butter went down by 2 per ounce, and 10 for a stick of butter. 
Write an update statement that changes the number of calories of a recipe for a specific ingredient. 
The statement should include at least two measurement types, like the example above. 
*/
update r
set calories = case when i.Item = 'butter' and m.MeasurementType = 'oz' then (r.Calories - 2) * ri.Amount
when i.Item = 'butter' and m.MeasurementType = 'stick' then r.Calories - 10
else r.Calories
end
from Recipe r
join RecipeIngredient ri
on ri.RecipeID = r.RecipeID
join Measurement m
on m.MeasurementID = ri.MeasurementID
join Ingredient i
on i.IngredientID = ri.IngredientID

/*
5) We need to send out alerts to users that have recipes sitting in draft longer the average amount of time all recipes have taken to be published.
Produce a result set that has 4 columns (Data values in brackets should be replaced with actual data)
	User First Name, 
	User Last Name, 
	email address (first initial + lastname@heartyhearth.com),
	Alert: 
		Your recipe [recipe name] is sitting in draft for [X] hours.
		That is [Z] hours more than the average [Y] hours all other recipes took to be published.
*/

;
with x as (
	select Average=  AVG(DATEDIFF(hour,r.DraftDate,r.PublishDate))
	from Recipe r
)
select s.FirstName, s.LastName, Email = CONCAT(SUBSTRING(s.FirstName,1,1),s.LastName,'@heartyhearth.com'),
		Alert= CONCAT('Your recipe ', r.RecipeName,' is sitting in draft for ', DATEDIFF(hour,r.DraftDate,CURRENT_TIMESTAMP),' hours. ',
		'That is ', DATEDIFF(hour,r.DraftDate,CURRENT_TIMESTAMP) - x.Average,
		 ' hours more than the average ', x.Average,' hours all other recipes took to be published.')
from x
join Recipe r
on datediff(hour,r.DraftDate,r.PublishDate) > x.Average
join Staff s
on s.StaffID = r.StaffID

/*
6) We want to send out marketing emails for books. Produce a result set with one row and one column "Email Body" as specified below.
The email should have a unique guid link to follow, which should be shown in the format specified. 

Email Body:
Order cookbooks from HeartyHearth.com! We have [X] books for sale, average prices is [Y]. You can order all for 25% discount, for a total of [Z].
Click <a href = "www.heartyhearth.com/order/[GUID]">here</a> to order.
*/

select EmailBody=
concat ('Order cookbooks from ','HeartyHearth.com','! ','We have ', count(c.CookbookName),' books for sale, average prices is ',
convert(decimal(10,2),AVG(c.price)) ,'. ', 'You can order all for 25% discount, for a total of ', convert(decimal(10,2),sum(c.price) * 0.75),'. ',
'Click <a href = ', 'www.heartyhearth.com/order/',NEWID(),'>here</a> to order.')
from cookbook c
