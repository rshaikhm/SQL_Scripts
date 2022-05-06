
--EXEC SP_GetFileTpeIDFromFileName 'HGHFG.TXT',0, null

CREATE PROCEDURE [dbo].[SP_GetFileTpeIDFromFileName]  
@FileName VARCHAR(1000) = NULL,  
@FileType INT = 0 OUTPUT,
@FileExtension VARCHAR(1000) = NULL OUTPUT
  
AS BEGIN  
SET NOCOUNT ON  

 DECLARE @FileNameExtentionSubstring VARCHAR(50)
 DECLARE @FileTypeExists_LookupID INT 

 SET @FileType = 0
 SET @FileExtension = 'NA'

 SET @FileNameExtentionSubstring = (SELECT UPPER(REVERSE(LEFT(REVERSE(@FileName), CHARINDEX('.', REVERSE(@FileName)) - 1)))) 

  SET @FileTypeExists_LookupID = (  
  SELECT TOP 1 L.Lookup_ID FROM [dbo].[tbl_Lookup] L  
  WHERE SUBSTRING(UPPER(L.Short_Name),1,3) = UPPER(SUBSTRING(@FileNameExtentionSubstring,1,3)) 
  AND UPPER(L.IsActive)= UPPER('Y') )

IF(@FileTypeExists_LookupID IS NOT NULL)  
BEGIN 

SET @FileType = @FileTypeExists_LookupID
SET @FileExtension = @FileNameExtentionSubstring
  SELECT @FileType AS FileType, @FileExtension AS FileExtension

END  
ELSE
  SELECT @FileType AS FileType, @FileExtension AS FileExtension
END


