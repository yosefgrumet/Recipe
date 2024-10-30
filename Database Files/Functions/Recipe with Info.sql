create or alter function dbo.RecipewithInfo(@RecipeId int)
returns varchar(100)
as 
begin
	declare @value varchar(100) = ''
	SELECT @value = CONCAT(
		r.RecipeName, 
		' (', cu.CuisineName, ') ',
		'has ', COUNT(ri.RecipeIngredientID), ' ingredients and ', 
		COUNT(i.InstructionID), ' steps'
	)
	FROM Recipe r
	JOIN Cuisine cu ON r.CuisineID = cu.CuisineID
	LEFT JOIN RecipeIngredient ri ON r.RecipeID = ri.RecipeID
	LEFT JOIN Instruction i ON r.RecipeID = i.RecipeID
	WHERE r.RecipeID = @RecipeID
	GROUP BY r.RecipeName, cu.CuisineName
	
	return @value
end
go
select RecipeInfo = dbo.RecipewithInfo(r.RecipeID)
from Recipe r