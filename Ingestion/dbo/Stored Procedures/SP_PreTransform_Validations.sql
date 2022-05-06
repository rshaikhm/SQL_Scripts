-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[SP_PreTransform_Validations]
(
   @PayloadReceivedID varchar(30)

)

AS
BEGIN

    SET NOCOUNT ON

	Declare @LandingID int
	

 DECLARE MY_CURSOR CURSOR   
LOCAL STATIC READ_ONLY FORWARD_ONLY  
FOR   
	SELECT Landing_Contribution_Data_ID
	FROM dbo.tbl_Landing_Contribution_Data  
	where  Payload_Received_ID = @PayloadReceivedID
	order by Landing_Contribution_Data_ID  
	  
  
OPEN MY_CURSOR  
FETCH NEXT FROM MY_CURSOR INTO @LandingID
WHILE @@FETCH_STATUS = 0  
BEGIN   
------------------------ @Gross_Earnings
declare @Gross_Earnings varchar(30)
Set @Gross_Earnings =(select Gross_Earnings from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Gross_Earnings))=0 and @Gross_Earnings is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Gross Earnings: Not A Number','Gross_Earnings','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END


-------------------------------@Pay_Period_Hours
declare @Pay_Period_Hours varchar(30)
Set @Pay_Period_Hours =(select Pay_Period_Hours from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Pay_Period_Hours))=0 and @Pay_Period_Hours is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Pay Period Hours: Not A Number','Pay_Period_Hours','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END
------------------------------------ @Employee_Deferral
 declare @Employee_Deferral varchar(30)
Set @Employee_Deferral =(select Employee_Deferral from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Employee_Deferral))=0 and @Employee_Deferral is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Employee Deferral: Not A Number','Employee_Deferral','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

----------------------------------------@Employee_Roth
declare @Employee_Roth varchar(30)
Set @Employee_Roth =(select Employee_Roth from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Employee_Roth))=0 and @Employee_Roth is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Employee Roth: Not A Number','Employee_Roth','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

-------------------Loan_Payments
declare @Loan_Payments varchar(30)
Set @Loan_Payments =(select Loan_Payments from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Loan_Payments))=0 and @Loan_Payments is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Loan Payments: Not A Number','Loan_Payments','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

-------------Employee_After_Tax
declare @Employee_After_Tax varchar(30)
Set @Employee_After_Tax =(select Employee_After_Tax from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Employee_After_Tax))=0 and @Employee_After_Tax is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Employee After Tax: Not A Number','Employee_After_Tax','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

-------------------Employer_Match
declare @Employer_Match varchar(30)
Set @Employer_Match =(select Employer_Match from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Employer_Match))=0 and @Employer_Match is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Employer Match: Not A Number','Employer_Match','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

-------------Safe_Harbor_Match
declare @Safe_Harbor_Match varchar(30)
Set @Safe_Harbor_Match =(select Safe_Harbor_Match from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Safe_Harbor_Match))=0 and @Safe_Harbor_Match is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Safe Harbor Match: Not A Number','Safe_Harbor_Match','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

-------------------Safe_Harbor_Non_Elective
declare @Safe_Harbor_Non_Elective varchar(30)
Set @Safe_Harbor_Non_Elective =(select Safe_Harbor_Non_Elective from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Safe_Harbor_Non_Elective))=0 and @Safe_Harbor_Non_Elective is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Safe Harbor Non Elective: Not A Number','Safe_Harbor_Non_Elective','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

-------------Qualified_Matching_Contribution
declare @Qualified_Matching_Contribution varchar(30)
Set @Qualified_Matching_Contribution =(select Qualified_Matching_Contribution from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Qualified_Matching_Contribution))=0 and @Qualified_Matching_Contribution is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Qualified Matching Contribution: Not A Number','Qualified_Matching_Contribution','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END
 
-------------------Qualified_Non_Elective_Contribution
declare @Qualified_Non_Elective_Contribution varchar(30)
Set @Qualified_Non_Elective_Contribution =(select Qualified_Non_Elective_Contribution from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Qualified_Non_Elective_Contribution))=0 and @Qualified_Non_Elective_Contribution is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Qualified Non Elective Cotribution: Not A Number','Qualified_Non_Elective_Contribution','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

-------------Profit_Sharing
declare @Profit_Sharing varchar(30)
Set @Profit_Sharing =(select Profit_Sharing from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Profit_Sharing))=0 and @Profit_Sharing is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Profit Sharing: Not A Number','Profit_Sharing','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

-------------------Money_Purchase
declare @Money_Purchase varchar(30)
Set @Money_Purchase =(select Money_Purchase from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Money_Purchase))=0 and @Money_Purchase is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Money Purchase: Not A Number','Money_Purchase','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

-------------Contribution_Source_Amount_1
declare @Contribution_Source_Amount_1 varchar(30)
Set @Contribution_Source_Amount_1 =(select Contribution_Source_Amount_1 from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Contribution_Source_Amount_1))=0 and @Contribution_Source_Amount_1 is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Contribution Source Amount 1: Not A Number','Contribution_Source_Amount_1','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END


-------------------Contribution_Source_Amount_2
declare @Contribution_Source_Amount_2 varchar(30)
Set @Contribution_Source_Amount_2 =(select Contribution_Source_Amount_2 from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Contribution_Source_Amount_2))=0 and @Contribution_Source_Amount_2 is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Contribution Source Amount 2: Not A Number','Contribution_Source_Amount_2','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

-------------Contribution_Source_Amount_3
declare @Contribution_Source_Amount_3 varchar(30)
Set @Contribution_Source_Amount_3 =(select Contribution_Source_Amount_3 from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Contribution_Source_Amount_3))=0 and @Contribution_Source_Amount_3 is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Contribution Source Amount 3: Not A Number','Contribution_Source_Amount_3','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

-------------------Contribution_Source_Amount_4
declare @Contribution_Source_Amount_4 varchar(30)
Set @Contribution_Source_Amount_4 =(select Contribution_Source_Amount_4 from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Contribution_Source_Amount_4))=0 and @Contribution_Source_Amount_4 is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Contribution Source Amount 4: Not A Number','Contribution_Source_Amount_4','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

-------------Contribution_Source_Amount_5
declare @Contribution_Source_Amount_5 varchar(30)
Set @Contribution_Source_Amount_5 =(select Contribution_Source_Amount_5 from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Contribution_Source_Amount_5))=0 and @Contribution_Source_Amount_5 is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Contribution Source Amount 5: Not A Number','Contribution_Source_Amount_5','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END


-------------Contribution_Source_Amount_6
declare @Contribution_Source_Amount_6 varchar(30)
Set @Contribution_Source_Amount_6 =(select Contribution_Source_Amount_6 from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Contribution_Source_Amount_6))=0 and @Contribution_Source_Amount_6 is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Contribution Source Amount 6: Not A Number','Contribution_Source_Amount_6','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

-------------------Contribution_Source_Amount_7
declare @Contribution_Source_Amount_7 varchar(30)
Set @Contribution_Source_Amount_7 =(select Contribution_Source_Amount_7 from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Contribution_Source_Amount_7))=0 and @Contribution_Source_Amount_7 is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Contribution Source Amount 7: Not A Number','Contribution_Source_Amount_7','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

-------------Contribution_Source_Amount_8
declare @Contribution_Source_Amount_8 varchar(30)
Set @Contribution_Source_Amount_8 =(select Contribution_Source_Amount_8 from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Contribution_Source_Amount_8))=0 and @Contribution_Source_Amount_8 is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Contribution Source Amount 8: Not A Number','Contribution_Source_Amount_8','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

-------------------Loan_Repayment_Amount_1
declare @Loan_Repayment_Amount_1 varchar(30)
Set @Loan_Repayment_Amount_1 =(select Loan_Repayment_Amount_1 from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Loan_Repayment_Amount_1))=0 and @Loan_Repayment_Amount_1 is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Loan Repayment Amount 1: Not A Number','Loan_Repayment_Amount_1','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

-------------Loan_Repayment_Amout_2
declare @Loan_Repayment_Amout_2 varchar(30)
Set @Loan_Repayment_Amout_2 =(select Loan_Repayment_Amout_2 from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Loan_Repayment_Amout_2))=0 and @Loan_Repayment_Amout_2 is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Loan Repayment Amount 2: Not A Number','Loan_Repayment_Amout_2','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

-------------------Loan_Repayment_Amount_3
declare @Loan_Repayment_Amount_3 varchar(30)
Set @Loan_Repayment_Amount_3 =(select Loan_Repayment_Amount_3 from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Loan_Repayment_Amount_3))=0 and @Loan_Repayment_Amount_3 is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Loan Repayment Amount 3: Not A Number','Loan_Repayment_Amount_3','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

-------------Loan_Repayment_Amount_4
declare @Loan_Repayment_Amount_4 varchar(30)
Set @Loan_Repayment_Amount_4 =(select Loan_Repayment_Amount_4 from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Loan_Repayment_Amount_4))=0 and @Loan_Repayment_Amount_4 is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Loan Repayment Amount 4: Not A Number','Loan_Repayment_Amount_4','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END


-------------Loan_Repayment_Amount_5
declare @Loan_Repayment_Amount_5 varchar(30)
Set @Loan_Repayment_Amount_5 =(select Loan_Repayment_Amount_5 from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Loan_Repayment_Amount_5))=0 and @Loan_Repayment_Amount_5 is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Loan Repayment Amount 5: Not A Number','Loan_Repayment_Amount_5','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END



-------------Record_Level_3_Amount
declare @Record_Level_3_Amount varchar(30)
Set @Record_Level_3_Amount =(select Record_Level_3_Amount from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if (select ISNUMERIC (@Record_Level_3_Amount))=0 and @Record_Level_3_Amount is not null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid Record Level 3 Amount: Not A Number','Record_Level_3_Amount','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END


----------------Birth_Date---------------

declare @Birth_Date varchar(50)
Set @Birth_Date =(select Birth_Date from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if  @Birth_Date is null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid or NULL Birth Date','Birth_Date','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

----------------Hire_Date---------------

declare @Hire_Date varchar(50)
Set @Hire_Date =(select Hire_Date from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if  @Hire_Date is null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid or NULL Hire Date','Hire_Date','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END

----------------Payroll_End_Date---------------

declare @Payroll_End_Date varchar(50)
Set @Payroll_End_Date =(select Payroll_End_Date from dbo.tbl_Landing_Contribution_Data where Landing_Contribution_Data_ID=@LandingID)

if  @Payroll_End_Date is null
 
BEGIN

	 Insert into tbl_Data_Error_Log
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[Payload_Received_ID])
	 values(@LandingID,'ERROR','Invalid or NULL Payroll End Date','Payroll_End_Date','SYSTEM',Getdate(),'SYSTEM',Getdate(),@PayloadReceivedID);
	  
	Update  tbl_Landing_Contribution_Data
	set Status='ERROR'
	where Landing_Contribution_Data_ID=@LandingID
 
END




 
 FETCH NEXT FROM MY_CURSOR INTO @LandingID  
end  
CLOSE MY_CURSOR  
DEALLOCATE MY_CURSOR  
 
Select 'Pretransform Validation Done' 
 
END
