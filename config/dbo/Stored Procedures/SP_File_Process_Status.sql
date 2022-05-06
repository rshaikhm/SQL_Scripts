CREATE Procedure [dbo].[SP_File_Process_Status]
(
@Payload_Received_ID int,
@Status varchar(30)
)
as
begin
update [dbo]. [tbl_Payload_Received]
  set Status=@Status
  where Payload_Received_ID=@Payload_Received_ID

Select 1

End
