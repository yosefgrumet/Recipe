-- SM 100%
use heartyhearthdb
go 

DELETE CookbookRecipe
delete Cookbook
delete MealCourseRecipe
delete MealCourse
Delete Meal
delete Course
delete RecipeIngredient
delete Instruction
delete Recipe
DELETE Staff
DELETE Ingredient
DELETE Measurement
DELETE Cuisine
GO


;
with x as(
   select DraftDate = '2022-01-01', PublishedDate = '2022-02-01', Cuisine = 'American', RecipeName = 'Chocolate Chip Cookies', 
   Amount = 1, measurement = 'cup', Ingredient = 'sugar',  Calories = 50
   union select '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 0.5, 'cup', 'oil', 25
   union select '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 3, null,'eggs', 20
   union select '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 2, 'cups', 'Flour', 35
   union select '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 1, 'tsp', 'vanilla sugar', 13
   union select '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 2, 'tsp', 'baking powder', 5
   union select '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 0.5, 'tsp', 'baking soda', 5
   union select '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 1, 'cup', 'chocolate chips', 60
   union select '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 3, null, 'granny smith apples', 45
   union select '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 2, 'cups' ,'vanilla yogurt', 70
   union select '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 2, 'tsp', 'sugar', 22
   union select '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 0.5, 'cup', 'orange juice',75
   union select '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 2, 'tbsp', 'honey', 55
   union select '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 5-6, null, 'ice cubes', 0
   union select '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 1, null, 'club bread', 100
   union select '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 4, 'oz', 'butter', 70
   union select '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 8, 'oz', 'shredded cheese', 65
   union select '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 2, 'cloves', 'garlic (crushed)', 10
   union select '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 0.25, 'tsp', 'black pepper', 5
   union select '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 1, 'pinch', 'salt', 2
   union select '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 1, 'stick', 'butter', 85
   union select '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 3, 'cups', 'sugar', 150
   union select '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 2, 'tbsp', 'vanilla pudding', 105
   union select '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 4, null, 'eggs', 25
   union select '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 8, 'oz', 'whipped cream cheese', 97
   union select '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 8, 'oz', 'sour cream cheese', 73
   union select '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 1, 'cups', 'flour', 80 
   union select '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 2, 'tsp', 'baking powder', 5
)
insert Cuisine (CuisineName)
select distinct x.Cuisine
from x

go

;
with x as(
   select DraftDate = '2022-01-01', PublishedDate = '2022-02-01', Cuisine = 'American', RecipeName = 'Chocolate Chip Cookies', 
   Amount = 1, measurement = 'cup', Ingredient = 'sugar',  Calories = 50
   union select '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 0.5, 'cup', 'oil', 25
   union select '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 3, null,'eggs', 20
   union select '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 2, 'cup', 'Flour', 35
   union select '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 1, 'tsp', 'vanilla sugar', 13
   union select '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 2, 'tsp', 'baking powder', 5
   union select '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 0.5, 'tsp', 'baking soda', 5
   union select '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 1, 'cup', 'chocolate chips', 60
   union select '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 3, null, 'granny smith apples', 45
   union select '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 2, 'cup' ,'vanilla yogurt', 70
   union select '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 2, 'tsp', 'sugar', 22
   union select '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 0.5, 'cup', 'orange juice',75
   union select '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 2, 'tbsp', 'honey', 55
   union select '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 5-6, null, 'ice cubes', 0
   union select '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 1, null, 'club bread', 100
   union select '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 4, 'oz', 'butter', 70
   union select '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 8, 'oz', 'shredded cheese', 65
   union select '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 2, 'cloves', 'garlic (crushed)', 10
   union select '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 0.25, 'tsp', 'black pepper', 5
   union select '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 1, 'pinch', 'salt', 2
   union select '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 1, 'stick', 'butter', 85
   union select '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 3, 'cup', 'sugar', 150
   union select '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 2, 'tbsp', 'vanilla pudding', 105
   union select '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 4, null, 'eggs', 25
   union select '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 8, 'oz', 'whipped cream cheese', 97
   union select '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 8, 'oz', 'sour cream cheese', 73
   union select '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 1, 'cup', 'flour', 80 
   union select '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 2, 'tsp', 'baking powder', 5
)
insert Measurement (MeasurementType)
select distinct x.measurement
from x
where x.measurement is not null

go

;
with x as(
   select FirstName=  'Victoria', LastName= 'Dwek', DraftDate = '2022-01-01', PublishedDate = '2022-02-01', Cuisine = 'American', RecipeName = 'Chocolate Chip Cookies', 
   Amount = 1, measurement = 'cup', Ingredient = 'sugar',  Calories = 50, Ingredientcode = 1
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 0.5, 'cup', 'oil', 25, 2
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 3, null,'eggs', 20, 3
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 2, 'cups', 'Flour', 35, 4
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 1, 'tsp', 'vanilla sugar', 13, 5
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 2, 'tsp', 'baking powder', 5, 6
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 0.5, 'tsp', 'baking soda', 5,7
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 1, 'cup', 'chocolate chips', 60, 8
   union select 'Victoria', 'Dwek', '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 3, null, 'granny smith apples', 45, 1
   union select 'Victoria', 'Dwek', '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 2, 'cups' ,'vanilla yogurt', 70, 2
   union select 'Victoria', 'Dwek', '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 2, 'tsp', 'sugar', 22, 3
   union select 'Victoria', 'Dwek', '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 0.5, 'cup', 'orange juice',75, 4
   union select 'Victoria', 'Dwek', '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 2, 'tbsp', 'honey', 55, 5
   union select 'Victoria', 'Dwek', '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 5-6, null, 'ice cubes', 0, 6
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 1, null, 'club bread', 100, 1
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 4, 'oz', 'butter', 70, 2
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 8, 'oz', 'shredded cheese', 65, 3
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 2, 'cloves', 'garlic (crushed)', 10, 4
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 0.25, 'tsp', 'black pepper', 5, 5
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 1, 'pinch', 'salt', 2, 6
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 1, 'stick', 'butter', 85, 1
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 3, 'cups', 'sugar', 150, 2
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 2, 'tbsp', 'vanilla pudding', 105, 3
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 4, null, 'eggs', 25, 4
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 8, 'oz', 'whipped cream cheese', 97, 5
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 8, 'oz', 'sour cream cheese', 73, 6
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 1, 'cups', 'flour', 80, 7 
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 2, 'tsp', 'baking powder', 5, 8 
)
insert Ingredient (Item)
select distinct x.Ingredient
from x


go

;
with x as(
   select FirstName=  'Victoria', LastName= 'Dwek', DraftDate = '2022-01-01', PublishedDate = '2022-02-01', Cuisine = 'American', RecipeName = 'Chocolate Chip Cookies', 
   Amount = 1, measurement = 'cup', Ingredient = 'sugar',  Calories = 50, Ingredientcode = 1
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 0.5, 'cup', 'oil', 25, 2
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 3, null,'eggs', 20, 3
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 2, 'cups', 'Flour', 35, 4
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 1, 'tsp', 'vanilla sugar', 13, 5
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 2, 'tsp', 'baking powder', 5, 6
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 0.5, 'tsp', 'baking soda', 5,7
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 1, 'cup', 'chocolate chips', 60, 8
   union select 'Victoria', 'Dwek', '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 3, null, 'granny smith apples', 45, 1
   union select 'Victoria', 'Dwek', '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 2, 'cups' ,'vanilla yogurt', 70, 2
   union select 'Victoria', 'Dwek', '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 2, 'tsp', 'sugar', 22, 3
   union select 'Victoria', 'Dwek', '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 0.5, 'cup', 'orange juice',75, 4
   union select 'Victoria', 'Dwek', '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 2, 'tbsp', 'honey', 55, 5
   union select 'Victoria', 'Dwek', '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 5-6, null, 'ice cubes', 0, 6
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 1, null, 'club bread', 100, 1
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 4, 'oz', 'butter', 70, 2
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 8, 'oz', 'shredded cheese', 65, 3
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 2, 'cloves', 'garlic (crushed)', 10, 4
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 0.25, 'tsp', 'black pepper', 5, 5
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 1, 'pinch', 'salt', 2, 6
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 1, 'stick', 'butter', 85, 1
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 3, 'cups', 'sugar', 150, 2
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 2, 'tbsp', 'vanilla pudding', 105, 3
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 4, null, 'eggs', 25, 4
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 8, 'oz', 'whipped cream cheese', 97, 5
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 8, 'oz', 'sour cream cheese', 73, 6
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 1, 'cups', 'flour', 80, 7 
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 2, 'tsp', 'baking powder', 5, 8 
)
insert Staff(FirstName, LastName, UserName)
SELECT distinct x.FirstName, x.LastName, CONCAT(x.FirstName,x.LastName,'@heartyhearth')
from x

;
with x as(
   select FirstName=  'Victoria', LastName= 'Dwek', DraftDate = '2022-01-01', PublishedDate = '2022-02-01', Archivedate = null, Cuisine = 'American', RecipeName = 'Chocolate Chip Cookies', 
   Amount = 1, measurement = 'cup', Ingredient = 'sugar',  Calories = 50
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', null, 'American', 'Chocolate Chip Cookies', 0.5, 'cup', 'oil', 25
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', null, 'American', 'Chocolate Chip Cookies', 3, null,'eggs', 20
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', null, 'American', 'Chocolate Chip Cookies', 2, 'cups', 'Flour', 35
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', null, 'American', 'Chocolate Chip Cookies', 1, 'tsp', 'vanilla sugar', 13
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', null, 'American', 'Chocolate Chip Cookies', 2, 'tsp', 'baking powder', 5
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', null, 'American', 'Chocolate Chip Cookies', 0.5, 'tsp', 'baking soda', 5
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', null, 'American', 'Chocolate Chip Cookies', 1, 'cup', 'chocolate chips', 60
   union select 'Victoria', 'Dwek', '2022-01-24', null, '2022-02-25', 'French', 'Apple Yogurt Smoothie', 3, null, 'granny smith apples', 45
   union select 'Victoria', 'Dwek', '2022-01-24', null, '2022-02-25', 'French', 'Apple Yogurt Smoothie', 2, 'cups' ,'vanilla yogurt', 70
   union select 'Victoria', 'Dwek', '2022-01-24', null, '2022-02-25', 'French', 'Apple Yogurt Smoothie', 2, 'tsp', 'sugar', 22
   union select 'Victoria', 'Dwek', '2022-01-24', null, '2022-02-25', 'French', 'Apple Yogurt Smoothie', 0.5, 'cup', 'orange juice',75
   union select 'Victoria', 'Dwek', '2022-01-24', null, '2022-02-25', 'French', 'Apple Yogurt Smoothie', 2, 'tbsp', 'honey', 55
   union select 'Victoria', 'Dwek', '2022-01-24', null, '2022-02-25', 'French', 'Apple Yogurt Smoothie', 5-6, null, 'ice cubes', 0
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', null, 'English', 'Cheese Bread', 1, null, 'club bread', 100
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', null, 'English', 'Cheese Bread', 4, 'oz', 'butter', 70
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', null, 'English', 'Cheese Bread', 8, 'oz', 'shredded cheese', 65
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', null, 'English', 'Cheese Bread', 2, 'cloves', 'garlic (crushed)', 10
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', null, 'English', 'Cheese Bread', 0.25, 'tsp', 'black pepper', 5
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', null, 'English', 'Cheese Bread', 1, 'pinch', 'salt', 2
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', null, 'American', 'Butter Muffins', 1, 'stick', 'butter', 85
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', null, 'American', 'Butter Muffins', 3, 'cups', 'sugar', 150
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', null, 'American', 'Butter Muffins', 2, 'tbsp', 'vanilla pudding', 105
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', null, 'American', 'Butter Muffins', 4, null, 'eggs', 25
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', null, 'American', 'Butter Muffins', 8, 'oz', 'whipped cream cheese', 97
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', null, 'American', 'Butter Muffins', 8, 'oz', 'sour cream cheese', 73
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', null, 'American', 'Butter Muffins', 1, 'cups', 'flour', 80 
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', null, 'American', 'Butter Muffins', 2, 'tsp', 'baking powder', 5
)
INSERT Recipe(StaffID, CuisineID, RecipeName, Calories, DraftDate, PublishDate, ArchivedDate)
select distinct s.StaffID, c.CuisineID, x.RecipeName, sum(x.Calories), x.DraftDate, x.PublishedDate, x.Archivedate
from x
join Staff s
on s.FirstName = x.FirstName
and s.LastName = x.LastName
join Cuisine c
on c.CuisineName = x.Cuisine
group by s.StaffID, c.CuisineID, x.RecipeName, x.DraftDate, x.PublishedDate, x.Archivedate

go

;
with x as(
   select StepNumber = 1, Cuisine = 'American', RecipeName = 'Chocolate Chip Cookies', Instruction = 'combine sugar, oil and eggs in a bowl'
   union select 2, 'American', 'Chocolate Chip Cookies', 'mix well'
   union select 3, 'American', 'Chocolate Chip Cookies', 'add flour, vanilla sugar, baking powder and baking soda'
   union select 4, 'American', 'Chocolate Chip Cookies', 'beat for 5 minutes'
   union select 5, 'American', 'Chocolate Chip Cookies', 'add chocolate chips'
   union select 6, 'American', 'Chocolate Chip Cookies', 'freeze for 1-2 hours'
   union select 7, 'American', 'Chocolate Chip Cookies', 'roll into balls and place spread out on a cookie sheet'
   union select 8, 'American', 'Chocolate Chip Cookies', 'bake on 350 for 10 min.'
   union select 1, 'French', 'Apple Yogurt Smoothie', 'Peel the apples and dice'
   union select 2, 'French', 'Apple Yogurt Smoothie', 'Combine all ingredients in bowl except for apples and ice cubes'
   union select 3, 'French', 'Apple Yogurt Smoothie', 'mix until smooth'
   union select 4, 'French', 'Apple Yogurt Smoothie', 'add apples and ice cubes'
   union select 5, 'French', 'Apple Yogurt Smoothie', 'pour into glasses.'
   union select 1, 'English', 'Cheese Bread', 'Slit bread every 3/4 inch'
   union select 2, 'English', 'Cheese Bread', 'Combine all ingredients in bowl'
   union select 3, 'English', 'Cheese Bread', 'fill slits with cheese mixture'
   union select 4, 'English', 'Cheese Bread', 'wrap bread into a foil and bake for 30 minutes.'
   union select 1, 'American', 'Butter Muffins', 'Cream butter with sugars'
   union select 2, 'American', 'Butter Muffins', 'Add eggs and mix well'
   union select 3, 'American', 'Butter Muffins', 'Slowly add rest of ingredients and mix well'
   union select 4, 'American', 'Butter Muffins', 'fill muffin pans 3/4 full and bake for 30 minutes.'
)
insert Instruction(RecipeId, StepNumber, InstructionDescription)
select distinct  r.RecipeID, x.StepNumber, x.Instruction 
from x
join Recipe r
on r.RecipeName = x.RecipeName

go

;
with x as(
   select FirstName=  'Victoria', LastName= 'Dwek', DraftDate = '2022-01-01', PublishedDate = '2022-02-01', Cuisine = 'American', RecipeName = 'Chocolate Chip Cookies', 
   Amount = 1, measurement = 'cup', Ingredient = 'sugar',  Calories = 50, Ingredientcode = 1
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 0.5, 'cup', 'oil', 25, 2
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 3, null,'eggs', 20, 3
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 2, 'cup', 'Flour', 35, 4
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 1, 'tsp', 'vanilla sugar', 13, 5
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 2, 'tsp', 'baking powder', 5, 6
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 0.5, 'tsp', 'baking soda', 5,7
   union select 'Victoria', 'Dwek', '2022-01-01', '2022-02-01', 'American', 'Chocolate Chip Cookies', 1, 'cup', 'chocolate chips', 60, 8
   union select 'Victoria', 'Dwek', '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 3, null, 'granny smith apples', 45, 1
   union select 'Victoria', 'Dwek', '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 2, 'cup' ,'vanilla yogurt', 70, 2
   union select 'Victoria', 'Dwek', '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 2, 'tsp', 'sugar', 22, 3
   union select 'Victoria', 'Dwek', '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 0.5, 'cup', 'orange juice',75, 4
   union select 'Victoria', 'Dwek', '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 2, 'tbsp', 'honey', 55, 5
   union select 'Victoria', 'Dwek', '2022-01-24', '2022-02-15', 'French', 'Apple Yogurt Smoothie', 6, null, 'ice cubes', 0, 6
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 1, null, 'club bread', 100, 1
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 4, 'oz', 'butter', 70, 2
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 8, 'oz', 'shredded cheese', 65, 3
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 2, 'cloves', 'garlic (crushed)', 10, 4
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 0.25, 'tsp', 'black pepper', 5, 5
   union select 'Miriam', 'Pascal', '2022-02-03', '2022-02-27', 'English', 'Cheese Bread', 1, 'pinch', 'salt', 2, 6
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 1, 'stick', 'butter', 85, 1
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 3, 'cup', 'sugar', 150, 2
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 2, 'tbsp', 'vanilla pudding', 105, 3
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 4, null, 'eggs', 25, 4
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 8, 'oz', 'whipped cream cheese', 97, 5
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 8, 'oz', 'sour cream cheese', 73, 6
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 1, 'cup', 'flour', 80, 7 
   union select 'Efraim', 'Harari', '2022-02-10', '2022-03-03', 'American', 'Butter Muffins', 2, 'tsp', 'baking powder', 5, 8 
)
insert RecipeIngredient (RecipeID, Amount, MeasurementID, IngredientID, IngredientCode)
select r.RecipeID, x.Amount, m.MeasurementID, i.IngredientID, x.Ingredientcode
from x
join Recipe r
on r.RecipeName = x.RecipeName
left join Measurement m
on m.MeasurementType = x.measurement
join Ingredient i
on i.Item = x.Ingredient

;
with x as (select Course ='Hors Doeuvre', CourseOrder = 1
union select 'Soup', 2
union select 'Appetizer', 3
union select 'Salad', 4
union select 'Main course', 5
union select 'Dessert', 6
union select 'Mignardise', 7
) 
insert Course (CourseName, Courseorder)
SELECT x.Course, x.CourseOrder
from x

GO

;
with x as ( select MealName = 'Breakfast bash', FirstName=  'Efraim', LastName= 'Harari'
union select 'Lunch special', 'Victoria', 'Dwek'
union select 'Super Supper', 'Miriam', 'Pascal'
)
insert Meal(MealName, StaffID, Active, DateCreated) 
select x.MealName, s.StaffID, 1, '04-01-2022'
from x
join Staff s
on s.FirstName = x.FirstName
and s.LastName = x.LastName

go

;
with x as (select MealName = 'Breakfast bash', FirstName=  'Victoria', LastName= 'Dwek',  Course = 'Main course', Recipe = 'Cheese Bread'
union select 'Breakfast bash', 'Victoria', 'Dwek', 'Main course',  'Butter Muffins'
union select 'Breakfast bash', 'Victoria', 'Dwek', 'Appetizer', 'Apple Yogurt Smoothie' 
union select 'Lunch special', 'Victoria', 'Dwek', 'Appetizer', 'Cheese Bread'
union select 'Super Supper', 'Miriam', 'Pascal', 'Dessert', 'Chocolate Chip Cookies'
)
insert MealCourse(MealID, CourseID)
SELECT distinct m.MealID, c.CourseID
from x
join Meal m
on m.MealName = x.MealName
join Course c
on c.CourseName = x.Course

GO

;
with x as (select MealName = 'Breakfast bash', FirstName=  'Victoria', LastName= 'Dwek',  Course = 'Main course', Recipe = 'Cheese Bread', MainDish = 1
union select 'Breakfast bash', 'Victoria', 'Dwek', 'Main course',  'Butter Muffins', 0
union select 'Breakfast bash', 'Victoria', 'Dwek', 'Appetizer', 'Apple Yogurt Smoothie' , 0
union select 'Lunch special', 'Victoria', 'Dwek', 'Appetizer', 'Cheese Bread', 1
union select 'Super Supper', 'Miriam', 'Pascal', 'Dessert', 'Chocolate Chip Cookies', 0
)
insert MealCourseRecipe (MealCourseID, RecipeID, MainDish)
select mc.MealCourseID, r.RecipeID, x.MainDish
from x
join Meal m
on m.MealName = x.MealName
join Course c
on c.CourseName = x.Course
join MealCourse mc
on mc.CourseID =c.CourseID
join Recipe r
on r.RecipeName = x.Recipe

GO

;
with x as (select CookbookName = 'Treats for two', price= 30.00, recipes = 'Chocolate Chip Cookies', Created = '05-01-22', Active = 1, FirstName=  'Efraim', LastName= 'Harari'
union select 'Treats for two', 30.00, 'Apple Yogurt Smoothie', '05-01-22', 1, 'Efraim', 'Harari'
union select 'Treats for two', 30.00, 'Cheese Bread', '05-01-22', 1, 'Efraim', 'Harari'
union select 'Treats for two', 30.00, 'Butter Muffins', '05-01-22', 1, 'Efraim', 'Harari'
)
insert Cookbook(CookbookName, Staffid, Price, Datecreated, Active)
select distinct x.CookbookName, s.StaffID, x.price, x.Created, x.Active
from x
join Staff s
on s.FirstName = x.FirstName
and s.LastName = x.LastName

GO

;
with x as (select CookbookName = 'Treats for two', price= 30.00, recipes = 'Chocolate Chip Cookies', Created = '05-01-22', Active = 1, code =1
union select 'Treats for two', 30.00, 'Apple Yogurt Smoothie', '05-01-22', 1, 2
union select 'Treats for two', 30.00, 'Cheese Bread', '05-01-22', 1, 3
union select 'Treats for two', 30.00, 'Butter Muffins', '05-01-22', 1, 4
)
insert CookbookRecipe (recipesequence, CookbookID, RecipeID)
select ROW_NUMBER() over (order by RecipeName), cb.CookbookID, r.RecipeID
from x
join Cookbook cb
on cb.CookbookName = x.CookbookName
join Recipe r
on r.RecipeName = x.recipes


