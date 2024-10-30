create or alter function dbo.MealWithCalories(@MealId int)
returns varchar(40)
as 
begin
	declare @value varchar(40) = ''
	SELECT @value = CONCAT(m.MealName, ' has ', SUM(r.Calories), ' total calories')
FROM Meal m
JOIN MealCourse mc ON m.MealID = mc.MealID
JOIN MealCourseRecipe mcr ON mc.MealCourseID = mcr.MealCourseID
JOIN Recipe r ON mcr.RecipeID = r.RecipeID
GROUP BY m.MealName
ORDER BY m.MealName;

	return @value
end
go
select MeealWithCalories = dbo.MealWithCalories(m.MealID)
from Meal m