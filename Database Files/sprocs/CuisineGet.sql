create or alter procedure dbo.CusineGet(@CuisineId int = 0, @CuisineName varchar(50) = '', @All bit = 0)
as
begin
	--code goes here
	select @CuisineName = nullif (@CuisineName, '')

	select c.CuisineID, c.CuisineName
	from Cuisine c
	where c.CuisineID = @CuisineId
	or @All = 1
	or c.CuisineName like '%' + @CuisineName + '%'
	order by c.CuisineName
end
go
-- unit tests
/*
exec CusineGet

exec CusineGet @CuisineName = ''

exec CusineGet @CuisineName = 'a'

exec CusineGet @All = 1

declare @CuisineId int
select top 1 @CuisineId = c.cuisineId from Cuisine c
exec CusineGet @CuisineId = @CuisineId
*/