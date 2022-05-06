-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE Sp_IsHierarchicalData
(
   @inboundSourceSetupID int,
   @isHierarchy char(1) output,
	@PayrollProviderCode varchar(30) output
)

AS
BEGIN

  select 
  @isHierarchy=[Hierarchial_Data] , @PayrollProviderCode=[Payroll_Provider_Code]
  from tbl_Inbound_Source_Setup inner join tbl_Payroll_Provider on tbl_Inbound_Source_Setup.[Payroll_Provider_ID]=tbl_Payroll_Provider.Payroll_Provider_ID
  where Inbound_Source_SetupID= @inboundSourceSetupID


  select @isHierarchy as IsHierarchy, @PayrollProviderCode as PayrollProviderCode

END
