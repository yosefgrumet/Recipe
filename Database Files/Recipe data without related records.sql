INSERT Recipe(StaffID, CuisineID, RecipeName, Calories, DraftDate, PublishDate, ArchivedDate)
select  3, 2, 'Cinnamon Bun', 200, getdate(), null, null
union select  2, 1, 'Diet Muffin', 70, '2023-01-15', '2023-01-16', '2023-05-19'
union select  1, 1, 'Pancakes', 170, '2023-08-05', '2024-01-16', null
union select  2, 2, 'Chicken on the Bone', 90, '2022-01-25', '2023-05-16', null

SELECT  r.RecipeID, r.RecipeName, r.recipestatus, days = DATEDIFF(DAY, r.ArchivedDate, GETDATE())
    FROM Recipe r
--LEFT JOIN RecipeIngredient ri ON ri.RecipeID = r.RecipeID
--LEFT JOIN Instruction i ON i.RecipeID = r.RecipeID
LEFT JOIN MealCourseRecipe mcr ON mcr.RecipeID = r.RecipeID
--LEFT JOIN CookbookRecipe cr ON cr.RecipeID = r.RecipeID
WHERE --ri.RecipeIngredientID IS NULL
--AND i.InstructionID IS NULL
 mcr.MealCourseRecipeID IS NULL
--AND cr.CookbookRecipeID IS NULL
    and 
	(DATEDIFF(DAY, r.ArchivedDate, GETDATE()) >= 30)
        OR r.RecipeStatus = 'Draft'

		SELECT   r.RecipeID, r.RecipeName, r.recipestatus, days = DATEDIFF(DAY, r.ArchivedDate, GETDATE())
FROM Recipe r
LEFT JOIN MealCourseRecipe mcr ON mcr.RecipeID = r.RecipeID
WHERE mcr.MealCourseRecipeID IS NULL
AND (
    (DATEDIFF(DAY, r.ArchivedDate, GETDATE()) <= 30)
    OR r.RecipeStatus = 'Published'
)