


  
CREATE PROCEDURE [dbo].[transformvoya]  
@file_received_id numeric, 
@Result INT = 0 OUTPUT
as begin 
  
 
  
UPDATE dbo.tbl_voya SET Parentid = 0, setno = 0 WHERE rowno = 1 and file_received_id = @file_received_id;  
  
UPDATE dbo.tbl_voya SET Parentid = 1, setno = 0 WHERE rowno = 2 and file_received_id = @file_received_id;  
  
UPDATE dbo.tbl_voya SET Parentid = 2, setno = 0 WHERE rowno = 3 and file_received_id = @file_received_id;  
  
UPDATE dbo.tbl_voya SET Parentid = 1, setno = 0 WHERE rowno = 4 and file_received_id = @file_received_id;  
  
UPDATE dbo.tbl_voya SET Parentid = 1, setno = 0 WHERE rowno = 5 and file_received_id = @file_received_id;  
  
DECLARE @Rowno int  
DECLARE @Rowid int  
DECLARE @Setno int  
set @Setno = 1  
  
DECLARE MY_CURSOR CURSOR   
  LOCAL STATIC READ_ONLY FORWARD_ONLY  
FOR   
SELECT rowno,rowid  
FROM dbo.tbl_voya  
where rowno in (2,3,4)  
and file_received_id = @file_received_id
order by rowid  
  
  
OPEN MY_CURSOR  
FETCH NEXT FROM MY_CURSOR INTO @Rowno,@rowid --COLUMN1  
WHILE @@FETCH_STATUS = 0  
BEGIN   
    --Do something with Id here  
 --SELECT @Rowno;  
 --SELECT @Setno;  
   
    IF @Rowno = 2  
    BEGIN  
          
  UPDATE dbo.tbl_voya SET Setno = @Setno WHERE rowid = @Rowid and file_received_id = @file_received_id;  
  --UPDATE dbo.tbl_voya SET Setno = @Setno WHERE Parentid = @Rowno;  
    END  
   
 IF @Rowno = 3  
    begin         
   UPDATE dbo.tbl_voya SET Setno = @Setno WHERE rowid = @Rowid and file_received_id = @file_received_id;  
  --UPDATE dbo.tbl_voya SET Setno = @Setno WHERE Parentid = @Rowno;  
    END  
   
 IF @Rowno = 4  
    BEGIN  
          
  UPDATE dbo.tbl_voya SET Setno = @Setno WHERE rowid = @Rowid and file_received_id = @file_received_id;  
  --UPDATE dbo.tbl_voya SET Setno = @Setno WHERE Parentid = @Rowno;  
  SET @Setno = @Setno + 1;  
  print @Setno;  
    END  
   
 FETCH NEXT FROM MY_CURSOR INTO @Rowno,@rowid; --COLUMN1  
end  
CLOSE MY_CURSOR  
DEALLOCATE MY_CURSOR  
  
select @result as result

--select * from dbo.tbl_voya  
/*select a.*,b.*,c.* ,d.*, e.*
from dbo.tbl_voya a,dbo.tbl_voya b,dbo.tbl_voya c,dbo.tbl_voya d,dbo.tbl_voya e
where a.rowno =3
and a.parentid = b.rowno
and b.rowno =2
and c.rowno=1
and d.rowno=5
and e.rowno=4
and a.setno = b.setno
and c.setno = 0
and b.parentid = c.rowno
and d.setno = 0
and e.parentid = c.rowno
and a.setno = e.setno
and a.file_received_id = b.file_received_id 
and b.file_received_id = c.file_received_id 
and c.file_received_id = d.file_received_id 
and d.file_received_id = e.file_received_id
and a.file_received_id = @file_received_id;*/
-- exec transformvoya 101

end 
