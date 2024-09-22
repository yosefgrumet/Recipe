create or alter proc dbo.RecipeUpdate(
	@RecipeID int output,
	@StaffID int,
	@CuisineID int,
	@RecipeName varchar (30),
	@Calories int,
	@DraftDate datetime,
	@PublishDate datetime,
	@ArchivedDate datetime,
	@Recipestatus varchar (9),
	@RecipeImage varchar (8000),
	@Message varchar(500) = '' output
)
as
begin
	declare @return int = 0

	select @RecipeID = isnull(@RecipeID,0), @PublishDate = nullif(@PublishDate, 0), @ArchivedDate = nullif(@ArchivedDate, 0)

	if @RecipeID = 0 
	begin
		insert Recipe(StaffID, CuisineID, RecipeName, Calories, DraftDate, PublishDate, ArchivedDate)
		values(@StaffID, @CuisineID, @RecipeName, @Calories, @DraftDate, @PublishDate, @ArchivedDate)

		select @RecipeId = SCOPE_IDENTITY()
	end
	else
	begin
		update Recipe
		set
	StaffID = @StaffID,
	CuisineID = @CuisineID,
	RecipeName = @RecipeName,
	Calories = @Calories,
	DraftDate = @DraftDate,
	PublishDate = @PublishDate,
	ArchivedDate = @ArchivedDate
	where RecipeId = @RecipeId
end	

	--finished
	return @return
end
go