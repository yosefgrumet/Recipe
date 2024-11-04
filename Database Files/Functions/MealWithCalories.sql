CREATE OR ALTER FUNCTION dbo.MealWithCalories(@MealId INT)
RETURNS INT
AS 
BEGIN
    DECLARE @totalCalories INT;

    SELECT @totalCalories = SUM(r.Calories)
    FROM Meal m
    JOIN MealCourse mc ON m.MealID = mc.MealID
    JOIN MealCourseRecipe mcr ON mc.MealCourseID = mcr.MealCourseID
    JOIN Recipe r ON mcr.RecipeID = r.RecipeID
    WHERE m.MealID = @MealId;

    RETURN @totalCalories;
END;
GO

SELECT MealName, dbo.MealWithCalories(MealID) AS TotalCalories
FROM Meal;