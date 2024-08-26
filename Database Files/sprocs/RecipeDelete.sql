create or alter procedure dbo.RecipeDelete(
	@RecipeId int,
	@Message varchar(500) = '' output
	)
as
begin
	declare @return int = 0
	if exists(select * from Recipe r where r.RecipeId = @RecipeId 
		AND r.ArchivedDate IS NOT NULL
        AND DATEDIFF(DAY, r.ArchivedDate, GETDATE()) >= 30
		Or r.Recipestatus <> 'Draft')
	begin
		select @return = 1,
		@Message = 'Cannot delete Recipe that is archived for more than 30 days or is currently drafted.'
		goto finished
	end
	begin try
		begin tran
		delete Instruction where RecipeId = @RecipeId
		delete RecipeIngredient where RecipeId = @RecipeId
		delete Recipe where RecipeId = @RecipeId
		commit
	end try
	begin catch
		rollback;
		throw
	end catch

	finished:
	return @return
end
go
