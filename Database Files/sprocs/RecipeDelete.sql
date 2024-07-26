create or alter procedure dbo.RecipeDelete(@RecipeId int)
as
begin
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
end
go
