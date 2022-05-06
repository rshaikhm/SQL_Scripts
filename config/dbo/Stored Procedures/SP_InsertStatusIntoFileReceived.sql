--Exec SP_InsertStatusIntoFileReceived 'vermaf@pcscapital.com','OMNI_1812020New.csv'

CREATE PROCEDURE [dbo].[SP_InsertStatusIntoFileReceived] 
@FromEmailId VARCHAR(200),
@PayloadName VARCHAR(250)

AS BEGIN  
SET NOCOUNT ON  
 
DECLARE @DestinationSetupId INT
DECLARE @InboundSourceSetupId INT
DECLARE @FileExitsCount VARCHAR(50)  
DECLARE @DestinationFolderPath VARCHAR(1000)

SET @FileExitsCount = 0
SET @DestinationSetupId = 0
  
---If PayloadName is already present in tbl_Payload_Received then No changes else Insert in the table  
SET @FileExitsCount = (SELECT COUNT(*) FROM dbo.tbl_Payload_Received NOLOCK WHERE UPPER(Payload_Name) = UPPER(@PayloadName)) 
PRINT '@FileExitsCount: ' + @FileExitsCount  

IF(@FileExitsCount = 0)  
BEGIN 

PRINT 'IF(@FileExitsCount = 0) STARTS'  
  
 SET @DestinationSetupId = (SELECT TOP 1 I.Destination_Setup_ID
							  FROM dbo.tbl_Inbound_Source_Setup  I
							  WHERE UPPER(I.From_Email_ID) = UPPER(@FromEmailId))

 PRINT '@DestinationSetupId'  
 PRINT @DestinationSetupId

IF(@DestinationSetupId > 0)
BEGIN

PRINT 'IF(@DestinationSetupId > 0) STARTS'  

SET @DestinationFolderPath = (SELECT destination_folder_path 
							  FROM [dbo].tbl_Destination_Setup
							  WHERE Destination_Setup_ID = @DestinationSetupId)

 PRINT '@DestinationFolderPath' 
 PRINT @DestinationFolderPath 

SET @InboundSourceSetupId = (SELECT TOP 1 I.Inbound_Source_SetupID
							  FROM dbo.tbl_Inbound_Source_Setup  I
							  WHERE UPPER(I.From_Email_ID) = UPPER(@FromEmailId))

 PRINT '@InboundSourceSetupId' 
 PRINT @InboundSourceSetupId 
	
 INSERT INTO dbo.tbl_Payload_Received(  
        [Payload_Name]  
         ,[Received_Date_And_Time]  
         ,[Inbound_Source_Setup_ID]  
         ,[Loaded_By]-- the person who provided source @SourceProviderName  
         ,[File_Type_LK_ID]-- @FileType -- Values: Excel, Delimiter etc.  
         ,[As_OF_Date]  
         ,[Actual_File]-- @StorageLink-link of azure storage blob  
         ,[Status]-- Values -received/processed/error  
		 ,[From_Email_ID]
         ,[Created_By]-- @UserName param  
         ,[Created_Date]  
         ,[Updated_By]  
         ,[Updated_Date])  
        Values(@PayloadName,CURRENT_TIMESTAMP,@InboundSourceSetupId,'SYSTEM',NULL,  
         GETDATE(), @DestinationFolderPath,'INPROGRESS', @FromEmailId, 'SYSTEM', GETDATE(),'SYSTEM', GETDATE())  

SELECT * FROM dbo.tbl_Payload_Received WHERE Payload_Name = @PayloadName

END
ELSE
BEGIN
PRINT 'IF(@DestinationSetupId > 0) ENDS '  
END
END
ELSE
BEGIN
PRINT 'IF (@FileExitsCount = 0) ENDS ' 
END
END
