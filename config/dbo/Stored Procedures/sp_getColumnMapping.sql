CREATE procedure [dbo].[sp_getColumnMapping]
  
  @inboundSourceSetupID int
AS
BEGIN
  DECLARE @json_construct varchar(MAX) = '{"type": "TabularTranslator", "mappings": {X}}';
  DECLARE @json VARCHAR(MAX);
    
  SET @json = (
    SELECT
        c.[Source_Column_Name] AS 'source.name', 
        c.[Destination_Column_Name] AS 'sink.name' 
    FROM dbo.[tbl_Metadata_Mapping] as c 
  WHERE c.[Inbound_Source_Setup_ID] = @inboundSourceSetupID
    AND c.[Destination_Table_name] = 'tbl_Landing_Contribution_Data'
	AND c.[Column_Order]<900 
    FOR JSON PATH );
 
    SELECT REPLACE(@json_construct,'{X}', @json) AS json_output;
END