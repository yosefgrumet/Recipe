create or alter procedure dbo.RecipeGet(@RecipeId int = 0, @RecipeName varchar(30) = '', @All bit = 0)
as
begin
	--code goes here
	select @RecipeName = nullif(@RecipeName, '')

	select r.RecipeID, r.StaffID, r.CuisineID, r.RecipeName, r.Calories, r.DraftDate, r.PublishDate, r.ArchivedDate, r.Recipestatus, r.RecipeImage
	from Recipe r
	where r.RecipeID = @RecipeId
	or @All = 1
	or r.RecipeName like '%' + @RecipeName + '%'
end
go
-- unit tests
/*

exec RecipeGet

exec RecipeGet @RecipeName = ''

exec RecipeGet @RecipeName = 't'

exec RecipeGet @All = 1

declare @RecipeID int
select top 1 @RecipeID = r.RecipeID from Recipe r
exec RecipeGet @RecipeID = @RecipeID

*/