create or alter procedure dbo.InstructionGet(@InstructionID int = 0, @StepNumber int = 0, @InstructionDescription varchar(300) = '', @All bit = 0 )
as
begin
	--code goes here
	select @InstructionDescription = nullif(@InstructionDescription, '')

	select *
	from Instruction i 
end
go
-- unit tests