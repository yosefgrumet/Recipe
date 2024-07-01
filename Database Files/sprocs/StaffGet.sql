create or alter procedure dbo.StaffGet(@StaffId int = 0, @FirstName varchar (20) = '', @LastName varchar (20) = '', @userName varchar (20) = '', @All bit = 0)
as
begin
	--code goes here
	select @FirstName = nullif (@FirstName, '')

	select s.StaffID, s.FirstName, s.LastName, s.UserName
	from Staff s
	where s.StaffID = @StaffId
	or @All = 1
	or (s.LastName <> '' and s.LastName like '%' + @LastName + '%')
end
go
-- unit tests
/*
exec StaffGet

exec StaffGet @FirstName = ''

exec StaffGet @LastName = 'e'

exec StaffGet @All = 1

declare @StaffId int
select top 1 @StaffId = s.StaffId from Staff s
exec StaffGet @StaffId = @StaffId

*/