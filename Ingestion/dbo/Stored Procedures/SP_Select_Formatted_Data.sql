CREATE Procedure [dbo].[SP_Select_Formatted_Data]
(
@PayloadReceivedID varchar(30)
)
As
Begin

SELECT SD.[Landing_Contribution_Data_ID]
      ,SD.[Payload_Received_ID]
      ,SD.[Inbound_File_Setup_ID]
      ,SD.[Company_Code]
      ,SD.[Check_Date]
      ,SD.[SSN]
      ,SD.[First_Name]
      ,SD.[Middle_Name]
      ,SD.[Last_Name]
      ,SD.[Title]
      ,SD.[Employee_ID]
      ,SD.[Gender]
      ,SD.[Employee_Status]
      ,SD.[Marital_Status]
      ,SD.[Division_Code]
      ,SD.[Union_Status]
      ,SD.[Address_1]
      ,SD.[Address_2]
      ,SD.[City]
      ,SD.[State]
      ,SD.[Zip]
      ,convert(varchar(50),SD.[Birth_Date],101) as Birth_Date
      ,convert(varchar(50),SD.[Hire_Date],101) as Hire_Date
      ,Convert(varchar(50),SD.[Termination_Date],101) as Termination_Date
      ,convert(varchar(50),SD.[Rehire_Date],101) as Rehire_Date
      ,SD.[Gross_Earnings]
      ,SD.[Pay_Period_Hours]
      ,SD.[Employee_Deferral]
      ,SD.[Employee_Roth]
      ,SD.[Loan_Payments]
      ,SD.[Employee_After_Tax]
      ,SD.[Employer_Match]
      ,SD.[Safe_Harbor_Match]
      ,SD.[Safe_Harbor_Non_Elective]
      ,SD.[Qualified_Matching_Contribution]
      ,SD.[Qualified_Non_Elective_Contribution]
      ,SD.[Profit_Sharing]
      ,SD.[Money_Purchase]
      ,SD.[Pay_Frequency]
      ,SD.[Email]
      ,SD.[Phone_Number]
      ,SD.[Pay_Type]
      ,SD.[Adjusted_Seniority_Date]
      ,SD.[Leave_Of_Absence_Begin_Date]
      ,SD.[Leave_Of_Absence_End_Date]
      ,SD.[Payroll_Begin_Date]
      ,convert(varchar(50),SD.[Payroll_End_Date],101) as Payroll_End_Date
      ,SD.[Cost_Center_1_Code]
      ,SD.[Cost_Center_2_Code]
      ,SD.[Cost_Center_3_Code]
      ,SD.[Plan_Earnings]
      ,SD.[Excluded_Earnings]
      ,SD.[Section_125]
      ,SD.[Loan_Additional_Principal_Payments]
      ,SD.[Loan_Number]
      ,SD.[Rollover]
      ,SD.[Rollover_Roth]
      ,SD.[YTD_Gross_Earnings]
      ,SD.[Plan_YTD_Earnings]
      ,SD.[Plan_YTD_Hours]
      ,SD.[Plan_YTD_Excluded_Earnings]
      ,SD.[Plan_YTD_Section_125]
      ,SD.[Plan_YTD_Employee_Deferral]
      ,SD.[Plan_YTD_Employee_Roth]
      ,SD.[Plan_YTD_Employee_After_Tax]
      ,SD.[Plan_YTD_Loan_Payments]
      ,SD.[Plan_YTD_Loan_Number]
      ,SD.[Plan_YTD_Employer_Match]
      ,SD.[Plan_YTD_Safe_Harbor_Match]
      ,SD.[Plan_YTD_Qualified_Matching_Contribution]
      ,SD.[Plan_YTD_Safe_Harbor_Non_Elective]
      ,SD.[Plan_YTD_Qualified_Non_Elective_Contribution]
      ,SD.[Plan_YTD_Profit_Sharing]
      ,SD.[Plan_YTD_Money_Purchase]
      ,SD.[Plan_YTD_Rollover]
      ,SD.[Plan_YTD_Rollover_Roth]
      ,SD.[Plan_ID]
      ,SD.[Plan_Name]
      ,SD.[Investment_Election]
      ,SD.[Investment_Change_Date]
      ,SD.[Recipient_Vendor_Plan_ID]
      ,SD.[Detail]
      ,SD.[Employer_EIN]
      ,SD.[Employer_Name]
      ,SD.[Employer_Plan_ID]
      ,SD.[Employer_Sub_Plan_ID]
      ,SD.[Originating_Vendor_ID]
      ,SD.[Originating_Vendor_Sub_Plan_ID]
      ,SD.[Recipient_Vendor_Sub_Plan_ID]
      ,SD.[Type_of_Account]
      ,SD.[HR_Area_Or_Location_Code]
      ,SD.[HR_Sub_Area]
      ,SD.[Adjusted_Date_of_Hire]
      ,SD.[Payroll_Mode]
      ,SD.[Contribution_Source_Code_1]
      ,SD.[Contribution_Source_Amount_1]
      ,SD.[Contribution_Source_Code_2]
      ,SD.[Contribution_Source_Amount_2]
      ,SD.[Contribution_Source_Code_3]
      ,SD.[Contribution_Source_Amount_3]
      ,SD.[Contribution_Source_Code_4]
      ,SD.[Contribution_Source_Amount_4]
      ,SD.[Contribution_Source_Code_5]
      ,SD.[Contribution_Source_Amount_5]
      ,SD.[Contribution_Source_Code_6]
      ,SD.[Contribution_Source_Amount_6]
      ,SD.[Contribution_Source_Code_7]
      ,SD.[Contribution_Source_Amount_7]
      ,SD.[Contribution_Source_Code_8]
      ,SD.[Contribution_Source_Amount_8]
      ,SD.[Final_Contribution_Indicator]
      ,SD.[Loan_Number_1]
      ,SD.[Loan_Repayment_Amount_1]
      ,SD.[Loan_Number_2]
      ,SD.[Loan_Repayment_Amout_2]
      ,SD.[Loan_Number_3]
      ,SD.[Loan_Repayment_Amount_3]
      ,SD.[Loan_Number_4]
      ,SD.[Loan_Repayment_Amount_4]
      ,SD.[Loan_Number_5]
      ,SD.[Loan_Repayment_Amount_5]
      ,SD.[OMNI_Field_52]
      ,SD.[OMNI_Field_53]
      ,SD.[OMNI_Field_54]
      ,SD.[OMNI_Field_55]
      ,SD.[OMNI_Field_56]
      ,SD.[OMNI_Field_57]
      ,SD.[OMNI_Field_58]
      ,SD.[OMNI_Field_59]
      ,SD.[OMNI_Field_60]
      ,SD.[OMNI_Field_61]
      ,SD.[OMNI_Field_62]
      ,SD.[OMNI_Field_63]
      ,SD.[OMNI_Field_64]
      ,SD.[OMNI_Field_65]
      ,SD.[OMNI_Field_66]
      ,SD.[OMNI_Field_67]
      ,SD.[Record_Level_1]
      ,SD.[Record_Level_1_Vendor]
      ,SD.[Record_Level_1_File_Release_Time]
      ,SD.[Record_Level_1_Total_Amount_in_File]
      ,SD.[Record_Level_1_Number_of_Contributions]
      ,SD.[Record_Level_1_Datetime]
      ,SD.[Record_Level_1_Number_of_Participants]
      ,SD.[Record_Level_2]
      ,SD.[Record_Level_2_Plan_Name]
      ,SD.[Record_Level_2_Remitter_Plan_Code]
      ,SD.[Record_Level_2_Column_D]
      ,SD.[Record_Level_2_Column_E]
      ,SD.[Record_Level_2_Payroll_Date]
      ,SD.[Record_Level_2_Total_Amount_in_Plan]
      ,SD.[Record_Level_2_Number_of_Participants]
      ,SD.[Record_Level_3]
      ,SD.[Record_Level_3_SSN]
      ,SD.[Record_Level_3_Last_Name]
      ,SD.[Record_Level_3_First_Name]
      ,SD.[Record_Level_3_Remitter_Plan_Code]
      ,SD.[Record_Level_3_Remittance_Type]
      ,SD.[Record_Level_3_Source_Code]
      ,SD.[Record_Level_3_Number_of_Participants]
      ,SD.[Record_Level_3_Column_I]
      ,SD.[Record_Level_3_Amount]
      ,SD.[Record_Level_4]
      ,SD.[Record_Level_4_Plan_Name]
      ,SD.[Record_Level_4_Remitter_Plan_Code]
      ,SD.[Record_Level_4_Column_D]
      ,SD.[Record_Level_4_Column_E]
      ,SD.[Record_Level_4_Payroll_Date]
      ,SD.[Record_Level_4_Total_Amount_in_Plan]
      ,SD.[Record_Level_4_Number_of_Participants]
      ,SD.[Record_Level_5]
      ,SD.[Record_Level_5_Vendor]
      ,SD.[Record_Level_5_File_Release_Time]
      ,SD.[Record_Level_5_Total_Amount_in_File]
      ,SD.[Record_Level_5_Number_of_Contributions]
      ,SD.[Record_Level_5_Datetime]
      ,SD.[Record_Level_5_Number_of_Participants]
      ,SD.[Remittance_Type]
      ,SD.[Contribution_Rate]
      ,SD.[Loan_Balance]
      ,SD.[Comments]
      ,SD.[Header_Column_1]
      ,SD.[Header_Column_2]
      ,SD.[Header_Column_3]
      ,SD.[Header_Column_4]
      ,SD.[Header_Column_5]
      ,SD.[Header_Column_6]
      ,SD.[Header_Column_7]
      ,SD.[Header_Column_8]
      ,SD.[Header_Column_9]
      ,SD.[Header_Column_10]
      ,SD.[Footer_Column_1]
      ,SD.[Footer_Column_2]
      ,SD.[Footer_Column_3]
      ,SD.[Footer_Column_4]
      ,SD.[Footer_Column_5]
      ,SD.[Footer_Column_6]
      ,SD.[Footer_Column_7]
      ,SD.[Footer_Column_8]
      ,SD.[Footer_Column_9]
      ,SD.[Footer_Column_10]
      ,SD.[OMNI_Field_50]
      ,SD.[OMNI_Field_51]
      ,SD.[PAYLOCITY_Field_71]
      ,SD.[PAYLOCITY_Field_72]
      ,SD.[PAYLOCITY_Field_73]
      ,SD.[PAYLOCITY_Field_74]
      ,LC.[Status]
  FROM [dbo].[tbl_Staging_Temp_Data] SD inner join [tbl_Landing_Contribution_Data] LC On SD.[Landing_Contribution_Data_ID]=LC.Landing_Contribution_Data_ID
  where SD.[Payload_Received_ID]=@PayloadReceivedID and LC.status in('Validation Successful')

  End
  