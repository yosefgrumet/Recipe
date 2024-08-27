create or alter procedure dbo.RecipeDelete(
	@RecipeId int,
	@Message varchar(500) = '' output
	)
as
begin
	declare @return int = 0
	 IF EXISTS (
        SELECT 1
        FROM Recipe r
        WHERE r.RecipeId = @RecipeId
        AND NOT (
            (r.ArchivedDate IS NOT NULL AND DATEDIFF(DAY, r.ArchivedDate, GETDATE()) > 30)
            OR r.RecipeStatus = 'Draft'
        )
    )
	begin
		SET @return = 1;
        SET @Message = 'Cannot delete Recipe. It must be archived for more than 30 days or be in draft state.';
        GOTO finished;
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
