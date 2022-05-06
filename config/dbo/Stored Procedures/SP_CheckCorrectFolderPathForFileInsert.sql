--EXEC SP_CheckCorrectFolderPathForFileInsert 'tsm/omni', 0

CREATE PROCEDURE [dbo].[SP_CheckCorrectFolderPathForFileInsert]  
@FolderPath VARCHAR(1000) = NULL,  
@Result INT = 0 OUTPUT -- 1 = CORRECT PATH / 0 = INCORRECT PATH 
  

AS BEGIN  
SET NOCOUNT ON  
 
IF( CHARINDEX('ERROR',UPPER(@FolderPath)) > 0  OR  CHARINDEX('ARCHIVE',UPPER(@FolderPath)) > 0  ) 
BEGIN 
 SET @Result = 0
   RAISERROR (15600,-1,-1, 'SP_CheckCorrectFolderPathForFileInsert'); 
   SELECT @Result AS Result 
END  
ELSE
SET @Result = 1
  SELECT @Result AS Result
   
END