CREATE procedure [dbo].[SP_LandingTable_Status_Update]
(
 @PayloadReceivedID varchar(50)
)

As
Begin
--------------UpdateStatusOfLandingTable
Update tbl_Landing_Contribution_Data
 set Status='Validation Successful'
 where Status is NULL and  Payload_Received_ID=@PayloadReceivedID

 

 Select 1

 End