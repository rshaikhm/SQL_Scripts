/****** Object:  StoredProcedure [dbo].[SP_InsertIntoFileReceived]    Script Date: 1/25/2021 2:02:03 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
  
/*----------------------------------------------------------------------------  
Created By: Fanisha verma  
Created Date: 30th Dec 2020  
Purpose: To insert record in tbl_File_Received when a file is received in Azure Blob Storage   
------------------------------------------------------------------------------*/  
  
--Exec SP_InsertIntoFileReceived @IngestionType, @EmailId, @FileName, @FileType, @UserName,@StorageLink, @SourceProviderName, @Result 
--Exec SP_InsertIntoFileReceived '3','shelara@pcscapital.com','Omni.txt','6','shelara@pcscapital.com','/tsm','10'  
--Exec SP_InsertIntoFileReceived '1','shelara@pcscapital.com','voya123.csv','11','shelara@pcscapital.com','/tsm','pcs'  
--Exec SP_InsertIntoFileReceived '4','vermaf@pcscapital.com','PAYLOCITY.xlsx','6','verma fanisha','/tsm','10'  

--Exec SP_InsertIntoFileReceived null,'null','omni_05012021_demo12.txt',0,'null','tsm/omni','null',0
--Exec SP_InsertIntoFileReceived null,'null','omni_05012021_demo12.csv',0,'null','tsm/omni','null',0
--Exec SP_InsertIntoFileReceived null,'null','omni_05012021_demo9.txt',0,'null','tsm/SchoolsFirst','null',0

--Exec SP_InsertIntoFileReceived null,'null','voya_05012021_demo11.csv',0,'null','tsm/voya','null',0
--Exec SP_InsertIntoFileReceived null,'null','voya_05012021_demo11.txt',0,'null','tsm/voya','null',0
--Exec SP_InsertIntoFileReceived null,'null','voya_05012021_demo12.csv',0,'null','tsm/SchoolsFirst','null',0
--Exec SP_InsertIntoFileReceived null,'null','voya_05012021_demo13.csv',0,'null','tsm/paylocity','null',0

--Exec SP_InsertIntoFileReceived null,'null','schoolsfirst_20210108_34567.xls',0,'null','tsm/schoolsfirst','null',0 
--Exec SP_InsertIntoFileReceived null,'null','schoolsfirst_20210108_34567.txt',0,'null','tsm/schoolsfirst','null',0 
--Exec SP_InsertIntoFileReceived null,'null','schoolsfirst_20210108_34567.txt',0,'null','tsm/paylocity','null',0 

--Exec SP_InsertIntoFileReceived null,'null','Omni_11012021_39344569866.TXT',0,'null','tsm/omni','null',0
--Exec SP_InsertIntoFileReceived null,'null','Omni_11012021_39342269866.TXT',0,'null','tsm/omni','null',0
--Exec SP_InsertIntoFileReceived null,'null','Omni_11012021_39342999870.TXT',0,'null','tsm/omni','null',0

--Exec SP_InsertIntoFileReceived null,'null','VOYA_18102020_$27292.06.csv',0,'null','tsm/voya','null','null',0,0,0,',', 'NA',  'NA',  'NA',  'NA',  'NA'

  
CREATE PROCEDURE [dbo].[SP_InsertIntoFileReceived]  
@IngestionType INT,  
@EmailId VARCHAR(200) = NULL,  
@FileName VARCHAR(250),
@FileType INT = 0,  
@UserName VARCHAR(50) = NULL,  
@StorageLink VARCHAR(1000) = NULL,  --'tsm/omni'
@SourceProviderName VARCHAR(150) = NULL,  
@ActualFile  VARCHAR(1000) = NULL,
@Result INT = 0 OUTPUT, --1 = INSERT SUCCESS/ 0 = ERROR or FILE EXIST 
@FileReceivedId INT = 0 OUTPUT,
@InboundSourceSetupId INT = 0 OUTPUT,
@Delimiter VARCHAR(50) = NULL OUTPUT,  
@IsColumnHeaderAvailable VARCHAR(50) = NULL OUTPUT,
@FileNameExtension VARCHAR(50) = NULL OUTPUT,
@ContainerName VARCHAR(100) = NULL OUTPUT,
@FolderName VARCHAR(100) = NULL OUTPUT,
@SheetName VARCHAR(100) = NULL OUTPUT
  
AS BEGIN  
SET NOCOUNT ON  
 
DECLARE @Inbound_Source_SetupID INT  
DECLARE @FileExitsCount VARCHAR(50)  
DECLARE @FileNamePatternSubstring VARCHAR(50)  
DECLARE @FileNameExtentionSubstring VARCHAR(50)
DECLARE @StorageLinkSubstring VARCHAR(50)
DECLARE @FileTypeExists_LookupID INT  
DECLARE @Header_Metadata_Table_ID INT
DECLARE @Header_Column_Name VARCHAR(100) 
DECLARE @Sort_Order INT
DECLARE @Filename_Structure_Parts INT
DECLARE @File_Part_Name VARCHAR(100) 
DECLARE @File_Received_ID INT
DECLARE @CountHeaderMetadataTableRecords INT

SET @Result = 0  
SET @FileReceivedId = 0
SET @InboundSourceSetupId = 0
SET @Delimiter = 'NA' 
SET @IsColumnHeaderAvailable = 'N'
SET @FileTypeExists_LookupID = 0
SET @FileNameExtension = ''
SET @ContainerName = ''
SET @FolderName = ''
SET @SheetName = ''

  
---If FileName is already present in tbl_File_Received then No changes else Insert in the table  
SET @FileExitsCount = (SELECT COUNT(*) FROM dbo.tbl_File_Received NOLOCK WHERE UPPER(File_Name)=UPPER(@FileName))  
PRINT '@FileExitsCount: ' + @FileExitsCount  
  
IF(@FileExitsCount=0)  
 BEGIN  
  
  SET @FileNamePatternSubstring=(SELECT UPPER(SUBSTRING(@FileName, 0, CHARINDEX('_',@FileName))))  
  SET @FileNameExtentionSubstring = (SELECT UPPER(REVERSE(LEFT(REVERSE(@FileName), CHARINDEX('.', REVERSE(@FileName)) - 1)))) 
  SET @StorageLinkSubstring  = (SELECT UPPER(REVERSE(LEFT(REVERSE(TRIM('/' FROM @StorageLink)), CHARINDEX('/', REVERSE(TRIM('/' FROM @StorageLink))) - 1)))) ----tsm/omni

  SET @ContainerName = LOWER(TRIM('/' FROM (SELECT TRIM(LOWER(@StorageLinkSubstring) FROM LOWER(TRIM('/' FROM @StorageLink)) )))) ----tsm
  SET @FolderName  =  LOWER(TRIM('/' FROM @StorageLinkSubstring)) ---omni

   PRINT '@ContainerName: ' + @ContainerName
   PRINT '@FolderName: ' + @FolderName
  
  IF(@FileNamePatternSubstring='')    
  BEGIN  
   PRINT 'null @FileNamePatternSubstring encounter'  
   SET @FileNamePatternSubstring=(SELECT UPPER(SUBSTRING(@FileName, 0, CHARINDEX('.',@FileName))))  
  END  

  PRINT '@FileNamePatternSubstring: ' + @FileNamePatternSubstring

  IF(@StorageLinkSubstring='')  
  BEGIN  
   PRINT 'null @StorageLinkSubstring encounter'  
   SET @StorageLinkSubstring=(SELECT CHARINDEX(@FileNamePatternSubstring, UPPER(@StorageLinkSubstring)))
  END 

  PRINT '@StorageLinkSubstring: ' + @StorageLinkSubstring

  IF(@FileNameExtentionSubstring='')    
  BEGIN  
   PRINT 'null @FileNameExtentionSubstring encounter'  
   SET @FileNameExtension=''; 
  END  
  ELSE
  BEGIN
    PRINT 'Not null  @FileNameExtentionSubstring encounter'  
	IF(UPPER(SUBSTRING(@FileNameExtentionSubstring,1,3)) = 'XLS')
	 BEGIN
	 SET @FileNameExtension = 'excel'; 
	 END
	ELSE
	BEGIN
	SET @FileNameExtension = LOWER(@FileNameExtentionSubstring)
	END
  END

  PRINT '@FileNameExtentionSubstring: '
  PRINT @FileNameExtentionSubstring

  PRINT '@FileNameExtension: ' + @FileNameExtension
  
  PRINT '@Inbound_Source_SetupID: '   
  PRINT @Inbound_Source_SetupID

  PRINT '@FileTypeExists_LookupID: '   
  PRINT @FileTypeExists_LookupID

  PRINT '@FileName: '
  PRINT @FileName
      
  PRINT 'begin1'  
  
  SET @FileTypeExists_LookupID = (  
  SELECT TOP 1 L.Lookup_ID FROM [dbo].[tbl_Lookup] L  
  WHERE SUBSTRING(UPPER(L.Short_Name),1,3) = UPPER(SUBSTRING(@FileNameExtentionSubstring,1,3)) 
  AND UPPER(L.IsActive)= UPPER('Y') )
  
  PRINT 'end1' 
  
 IF(@FileTypeExists_LookupID > 0)
 BEGIN

  PRINT 'begin2'   

  SELECT @Inbound_Source_SetupID = I.Inbound_Source_SetupID, 
  @Filename_Structure_Parts = I.Filename_Structure_Parts,
  @Delimiter = I.Delimiter,
  @IsColumnHeaderAvailable = I.Is_Column_Header_Available,
  @SheetName = I.Sheet_Name
  FROM [dbo].[tbl_Inbound_Source_Setup] I 
  WHERE UPPER(@FileName) LIKE '%' + UPPER(TRIM('*' FROM I.File_Name_Pattern)) + '%'
  AND UPPER(TRIM('/' FROM I.Storage_Folder_Name)) LIKE UPPER(TRIM('/' FROM @StorageLink )) -- LIKE @StorageLinkSubstring
  AND I.Is_Active = 1
  -- AND I.File_TypE_LK_ID = @FileTypeExists_LookupID
  -- AND UPPER(TRIM('*' FROM I.File_Name_Pattern)) LIKE @FileNamePatternSubstring
	
  PRINT 'end2'  

  PRINT '@Inbound_Source_SetupID'
  PRINT  @Inbound_Source_SetupID
  
  PRINT '@FileTypeExists_LookupID'   
  PRINT  @FileTypeExists_LookupID 
  
  PRINT '@Filename_Structure_Parts'   
  PRINT  @Filename_Structure_Parts 
  
  IF(@Inbound_Source_SetupID IS NOT NULL)  
  BEGIN  
  
  SET @InboundSourceSetupId = @Inbound_Source_SetupID

  PRINT 'IF BEGIN---'
	
  INSERT INTO dbo.tbl_File_Received(  
        [File_Name]  
         ,[Received_Date_And_Time]  
         ,[Inbound_Source_Setup_ID]  
         ,[Loaded_By]-- the person who provided source @SourceProviderName  
         ,[File_Type_LK_ID]-- @FileType -- Values: Excel, Delimiter etc.  
         ,[As_OF_Date]  
         ,[Actual_File]-- @StorageLink-link of azure storage blob  
         ,[Status]-- Values -received/processed/error  
         ,[Created_By]-- @UserName param  
         ,[Created_Date]  
         ,[Updated_By]  
         ,[Updated_Date])  
        Values(@FileName,CURRENT_TIMESTAMP,@Inbound_Source_SetupID,'SYSTEM',@FileTypeExists_LookupID,  
         GETDATE(),@StorageLink,'RECEIVED', 'SYSTEM', GETDATE(),'SYSTEM', GETDATE())  

		SET @File_Received_ID = (SELECT F.File_Received_ID  FROM dbo. tbl_File_Received F WHERE F.File_Name=@FileName )

		SET @FileReceivedId = @File_Received_ID

		 PRINT '@File_Received_ID'
		 PRINT @File_Received_ID

  PRINT 'IF ENDS---'

  ---Code to enter header received starts
	  PRINT 'Code to enter header received starts' 

	  IF(@Filename_Structure_Parts IS NOT NULL AND @Filename_Structure_Parts > 0)
	  BEGIN
	   PRINT 'IF @Filename_Structure_Parts STARTS---'

	  SELECT H.Header_Metadata_Table_ID,
	   H.Header_Column_Name,
	   H.Column_Format,
	   H.Sort_Order
      INTO #Temp_Header_Metadata_Table
	  FROM [dbo].[tbl_Header_Metadata_Table] H
	  WHERE H.Inbound_Source_Setup_ID = @Inbound_Source_SetupID 
	  AND H.IsActive = 1

	  SET @CountHeaderMetadataTableRecords =
	  (SELECT COUNT(H.Header_Metadata_Table_ID)
	  FROM [dbo].[tbl_Header_Metadata_Table] H
	  WHERE H.Inbound_Source_Setup_ID = @Inbound_Source_SetupID 
	  AND H.IsActive = 1)

	  CREATE TABLE #TEMP_File_Name_Split
	  (RowID INT IDENTITY(1,1) NOT NULL,
	  FileNamePart VARCHAR(50) NOT NULL)

	  PRINT '@CountHeaderMetadataTableRecords'
	  PRINT @CountHeaderMetadataTableRecords
	  
	  IF(@Filename_Structure_Parts = @CountHeaderMetadataTableRecords)
	  BEGIN

	  PRINT 'if @Filename_Structure_Parts = @CountHeaderMetadataTableRecords Starts'

	  DECLARE @FileNameExtentionSubstringWithDot VARCHAR(50)
	  DECLARE @FileNameWithoutExtension VARCHAR(150)
	  DECLARE @CountFileNameSplitParts INT

	  SET @FileNameExtentionSubstringWithDot = '.' + @FileNameExtentionSubstring
	  SET @FileNameWithoutExtension = (SELECT REPLACE(@FileName, @FileNameExtentionSubstringWithDot, ''))

	  PRINT '@FileNameExtentionSubstringWithDot: '
	  PRINT @FileNameExtentionSubstringWithDot

	  PRINT '@FileNameWithoutExtension'
	  PRINT @FileNameWithoutExtension

	  INSERT INTO #TEMP_File_Name_Split(FileNamePart)
	  SELECT VALUE	 
	  FROM STRING_SPLIT(@FileNameWithoutExtension , '_')

	  SET @CountFileNameSplitParts = (SELECT COUNT(*) FROM #TEMP_File_Name_Split)

	  PRINT '@CountFileNameSplitParts'
	  PRINT @CountFileNameSplitParts

	  IF(@CountFileNameSplitParts = @Filename_Structure_Parts)
	  BEGIN

	  PRINT 'if @CountFileNameSplitParts = @Filename_Structure_Parts Starts'

	  DECLARE @CountLoop INT
	  SET @CountLoop = 1
	  
	  WHILE(@CountLoop < = @CountFileNameSplitParts)
	  BEGIN

	  SELECT @Header_Column_Name = T.Header_Column_Name,  
	  @Header_Metadata_Table_ID = T.Header_Metadata_Table_ID,
	  @Header_Column_Name = T.Header_Column_Name
	  FROM #Temp_Header_Metadata_Table T
	  WHERE T.Sort_Order = @CountLoop

	  SET @File_Part_Name =
	  (SELECT F.FileNamePart
	  FROM #TEMP_File_Name_Split F
	  WHERE F.RowID = @CountLoop)

	   PRINT  '@Header_Column_Name: '
	   PRINT @Header_Column_Name

	   PRINT '@Header_Metadata_Table_ID : '
	   PRINT @Header_Metadata_Table_ID

	   PRINT '@Header_Column_Name : '
	   PRINT @Header_Column_Name

	   PRINT '@File_Part_Name : '
	   PRINT @File_Part_Name	   

	  INSERT INTO [dbo].[tbl_Header_Received]
           ([Header_Metadata_Table_ID]
		   ,[Header_Name]
           ,[Header_Type]
           ,[IsActive]
           ,[Created_By]
           ,[Created_Date]
           ,[Updated_By]
           ,[Updated_Date]
           ,[Inbound_Source_Setup_ID]
           ,[File_Received_ID])
     VALUES
           ( @Header_Metadata_Table_ID
		   ,@File_Part_Name
           ,@Header_Column_Name
           ,1
           ,'SYSTEM'
           ,GETDATE()
           ,'SYSTEM'
           ,GETDATE()
           ,@Inbound_Source_SetupID
		   ,@File_Received_ID)
	  
	 SET @CountLoop = @CountLoop + 1
	  
	  END

	  DROP TABLE #Temp_Header_Metadata_Table
	  	
	  PRINT 'if @CountFileNameSplitParts = @Filename_Structure_Parts Ends'
	  END

 	  PRINT 'if @Filename_Structure_Parts = @CountHeaderMetadataTableRecords Ends'
	  END

	  DROP TABLE #TEMP_File_Name_Split
		   
	  PRINT 'IF @Filename_Structure_Parts ENDS---'
	  END

	  PRINT 'Code to enter header received ends' 
	  ---Code to enter header received ends
	   
     SET @Result=1  
	 SELECT @Result AS Result, @FileReceivedId AS FileReceivedID, @InboundSourceSetupId AS InboundSourceSetupID, @Delimiter AS Delimiter, @IsColumnHeaderAvailable AS IsColumnHeaderAvailable, @FileNameExtension AS FileExtension, @SheetName AS SheetName, @ContainerName AS ContainerName, @FolderName AS FolderName
    END 

ELSE  
   BEGIN   
	 SET @Result=0 --- No insert as the condition did not match
	 SELECT @Result AS Result, @FileReceivedId AS FileReceivedID, @InboundSourceSetupId AS InboundSourceSetupID, @Delimiter AS Delimiter, @IsColumnHeaderAvailable AS IsColumnHeaderAvailable, @FileNameExtension AS FileExtension, @SheetName AS SheetName, @ContainerName AS ContainerName, @FolderName AS FolderName
   END  

END  
  
ELSE  
  BEGIN   
	SET @Result = 0 --- No insert as the File name exists
	SELECT @Result AS Result, @FileReceivedId AS FileReceivedID, @InboundSourceSetupId AS InboundSourceSetupID, @Delimiter AS Delimiter, @IsColumnHeaderAvailable AS IsColumnHeaderAvailable, @FileNameExtension AS FileExtension, @SheetName AS SheetName, @ContainerName AS ContainerName, @FolderName AS FolderName
  END  
  
END
ELSE  
  BEGIN   
	SET @Result = 0 --- No insert as the File name exists
	SELECT @Result AS Result, @FileReceivedId AS FileReceivedID, @InboundSourceSetupId AS InboundSourceSetupID, @Delimiter AS Delimiter, @IsColumnHeaderAvailable AS IsColumnHeaderAvailable, @FileNameExtension AS FileExtension,  @SheetName AS SheetName, @ContainerName AS ContainerName, @FolderName AS FolderName
  END  
END
