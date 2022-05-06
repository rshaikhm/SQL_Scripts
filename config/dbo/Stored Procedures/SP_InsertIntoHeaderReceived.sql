CREATE PROCEDURE [dbo].[SP_InsertIntoHeaderReceived]
@Inbound_Source_SetupID INT,  
@Filename_Structure_Parts INT,
@FileNameExtentionSubstring VARCHAR(50),
@FileName VARCHAR(250),
@FileReceivedId INT


AS BEGIN  
SET NOCOUNT ON 

 DECLARE @CountHeaderMetadataTableRecords INT
 DECLARE @Header_Column_Name VARCHAR(100) 
 DECLARE @Header_Metadata_Table_ID INT
 DECLARE @File_Part_Name VARCHAR(100) 

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
		   ,@FileReceivedId)
	  
	 SET @CountLoop = @CountLoop + 1
	  
	  END

	  DROP TABLE #Temp_Header_Metadata_Table
	  	
	  PRINT 'if @CountFileNameSplitParts = @Filename_Structure_Parts Ends'
	  END

 	  PRINT 'if @Filename_Structure_Parts = @CountHeaderMetadataTableRecords Ends'
	  END

	  DROP TABLE #TEMP_File_Name_Split

END