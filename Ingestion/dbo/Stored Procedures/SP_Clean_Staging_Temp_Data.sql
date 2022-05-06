CREATE Procedure [dbo].[SP_Clean_Staging_Temp_Data]
(
@PayloadReceivedID varchar(30)
)
As
Begin

Delete from dbo.tbl_Staging_Temp_Data where Payload_Received_ID=@PayloadReceivedID

Select 1

End