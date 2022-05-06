INSERT INTO tbl_Lookup
(	  
      [Organisation_ID]
      ,[Lookup_Code]
	  ,[Set_Name]
      ,[Short_Name]
      ,[Long_Name]
      ,[Print_Lookup_ID]
      ,[Sort_Order]
      ,[Category]
      ,[System_YN]
      ,[IsActive]
      ,[Created_By]
      ,[Created_Date]
      ,[Updated_By]
      ,[Updated_date]
)
values
(NULL,'EXTERNAL_FTP','TYPE_OF_INGESTION','EXTERNAL_FTP','EXTERNAL_FTP',0,1,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'INTERNAL_FTP','TYPE_OF_INGESTION','INTERNAL_FTP','INTERNAL_FTP',0,2,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'EMAIL','TYPE_OF_INGESTION','EMAIL','EMAIL',0,3,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'PCS_API','TYPE_OF_INGESTION','PCS_API','PCS_API',0,4,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'XLS*','FILE_TYPE','XLS*','EXCEL',0,1,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'TXT','FILE_TYPE','TXT','TEXT',0,2,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'CSV','FILE_TYPE','CSV','COMMA SEPERATED VALUES',0,2,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'JSON','FILE_TYPE','JSON','JSON',0,3,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'PAYROLL_PROVIDER','PAYROLL_PROVIDER','PAYROLL_PROVIDER','PAYROLL_DATA_PROVIDER',0,1,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'SPONSOR','PAYROLL_PROVIDER','SPONSOR','SPONSOR',0,2,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'REMITTER','PAYROLL_PROVIDER','REMITTER','REMITTER',0,3,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE())

insert into [dbo].[tbl_Destination_Setup]
(
      [Destination_URL]
      ,[User_ID]
      ,[Password]
      ,[connection_port]
      ,[destination_folder_path]
      ,[Error_Folder_Path]
      ,[Created_By]
      ,[Created_Date]
      ,[Updated_By]
      ,[Updated_Date]
)
Values
('https://stpayroll360001.blob.core.windows.net/tsm','shelara@pcscapital.com','mindcraft@123','443','/tsm/omni/',NULL,'SYSYTEM,Getdate(),'SYSTEM,gatdate()),
('https://stpayroll360001.blob.core.windows.net/tsm','shelara@pcscapital.com','mindcraft@123','443','/tsm/voya/',NULL,'SYSYTEM,Getdate(),'SYSTEM,gatdate()),
('https://stpayroll360001.blob.core.windows.net/tsm','shelara@pcscapital.com','mindcraft@123','443','/relius/paylocity/',NULL,'SYSYTEM,Getdate(),'SYSTEM,gatdate()),
('https://stpayroll360001.blob.core.windows.net/tsm','shelara@pcscapital.com','mindcraft@123','443','/tsm/schoolsfirst/',NULL,'SYSYTEM,Getdate(),'SYSTEM,gatdate())





insert into tbl_Inbound_Source_Setup
(
	   [Type_Of_Ingestion_LK_ID]
      ,[Source_URL]
      ,[User_ID]
      ,[Password]
      ,[Payroll_Provider_Type_LK_ID]
      ,[Frequency_ID]
      ,[Destination_Setup_ID]
      ,[Connection_Port]
      ,[Source_Folder_Path]
      ,[From_Email_ID]
      ,[API_Name]
      ,[File_Type_LK_ID]
      ,[File_Name_Pattern]
      ,[Payroll_Provider_ID]
      ,[Delimiter]
      ,[Is_Column_Header_Available]
      ,[Is_Header_Row_Available]
      ,[Is_Column_Footer_Header_Available]
      ,[Is_Footer_Row_Available]
      ,[Data_Header_Row]
      ,[Data_Start_Row]
      ,[Footer_Start_Row]
      ,[Hierarchial_Data]
      ,[Get_Or_Put]
      ,[Is_Active]
      ,[Created_By]
      ,[Created_Date]
      ,[Updated_By]
      ,[Updated_Date]
	  ,[Filename_Structure_Parts]
	  ,[Storage_Folder_Name]
      ,[Sheet_Name]
	)
	  values
	(3,NULL,NULL,NULL,10,NULL,1,NULL,NULL,
	'ashish.shelar@pcscapital.com',NULL,'6','OMNI*','1','|','N','Y','N','Y','1','2','0','N',NULL,1,'SYSTEM',getdate(),'SYSTEM',getdate(),'3','relius','Sheet1'),
	(1,'ftp.mindcraft.in/','ashish.shelar@mindcraft.in','mindcraft@123',10,NULL,2,'21','/VOYA',
	'ashish.shelar@mondcraft.co.in',NULL,'11','VOYA*','2',',','N','Y','N','Y','1','2','0','Y',NULL,1,'SYSTEM',getdate(),'SYSTEM',getdate(),'3','relius','Sheet1'),
	(2,'Portal.Azure.Com/','aashish.shelar@pcscapital.com','mindcraft@123',8,NULL,3,'443','/PAYLOCITY',
	NULL,NULL,'6','*PAYLOCITY*','3',',','N','N','N','N','1','2','0','N',NULL,1,'SYSTEM',getdate(),'SYSTEM',getdate(),'3','relius','Sheet1'),
	(4,NULL,NULL,NULL,8,NULL,3,NULL,'/PAYLOCITY',NULL,'pcs-payroll-demographic-contribution-eapi','7','*PAYLOCITY*',
	'3',',','N','N','N','N','1','2','0','N','GET',1,'SYSTEM',getdate(),'SYSTEM',getdate(),'3','relius','Sheet1'),
	(2,NULL,NULL,NULL,10,NULL,2,NULL,'/VOYA',
	NULL,NULL,'11','VOYA','2',',','N','Y','N','N','1','2','0','Y',NULL,1,'SYSTEM',getdate(),'SYSTEM',getdate(),'3','relius','Sheet1'),
	(2,NULL,NULL,NULL,10,NULL,2,NULL,'/VOYA',
	NULL,NULL,'5','voya','2','N/A','N','Y','N','N','1','2','0','Y',NULL,1,'SYSTEM',getdate(),'SYSTEM',getdate(),'3','relius','Sheet1')

	
Insert Into tbl_payroll_provider
([Payroll_Provider_Type_LK_ID]
      ,[Payroll_Provider_Name]
      ,[IsActive]
      ,[Created_By]
      ,[Updated_By]
      ,[Created_Date]
      ,[Updated_Date])
	values 
	(10,'OMNI',1,'SYSTEM','SYSTEM',getdate(),getdate()),
	(10,'VOYA',1,'SYSTEM','SYSTEM',getdate(),getdate()),
	(8,'PAYLOCITY',1,'SYSTEM','SYSTEM',getdate(),getdate())


            
  insert into [dbo].[tbl_Master_Metadata_Mapping]
  ([Inbound_Source_Setup_ID]
      ,[Mapping_Name]
      ,[IsActive]
      ,[Created_By]
      ,[Created_Date]
      ,[Updated_By]
      ,[Updated_Date])
values  (1,'OMNI',1,'SYSTEM',getdate(),'SYSTEM',getdate()),
		(2,'VOYA',1,'SYSTEM',getdate(),'SYSTEM',getdate()),
		(3,'PAYLOCITY',1,'SYSTEM',getdate(),'SYSTEM',getdate())



insert into  [dbo].[tbl_Metadata_Mapping]
(	[Master_Metadata_Mapping_ID]
      ,[Inbound_Source_Setup_ID]
      ,[Source_Column_Name]
      ,[Destination_Table_name]
      ,[Destination_Column_Name]
      ,[Source_Data_Type]
      ,[Column_Order]
      ,[Format]
      ,[IsActive]
      ,[Created_By]
      ,[Created_Date]
      ,[Updated_By]
      ,[Updated_Date]
)
--------PAYLOCITY--------------
values
(3,3,'Paylocity Company Code','tbl_Landing_Contribution_Data','Paylocity_Company_Code',NULL,1,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'First Name','tbl_Landing_Contribution_Data','First_Name',NULL,2,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Middle Name','tbl_Landing_Contribution_Data','Middle_Name',NULL,3,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Last Name','tbl_Landing_Contribution_Data','Last_Name',NULL,4,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Title','tbl_Landing_Contribution_Data','Title',NULL,5,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'SSN','tbl_Landing_Contribution_Data','SSN',NULL,6,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Employee ID','tbl_Landing_Contribution_Data','Employee_ID',NULL,7,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Gender','tbl_Landing_Contribution_Data','Gender',NULL,8,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Employee Status','tbl_Landing_Contribution_Data','Employee_Status',NULL,9,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Marital Status','tbl_Landing_Contribution_Data','Marital_Status',NULL,10,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Pay Type','tbl_Landing_Contribution_Data','Pay_Type',NULL,11,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Union Status','tbl_Landing_Contribution_Data','Union_Status',NULL,12,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Address 1','tbl_Landing_Contribution_Data','Address_1',NULL,13,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Address 2','tbl_Landing_Contribution_Data','Address_2',NULL,14,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'City','tbl_Landing_Contribution_Data','City',NULL,15,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'State','tbl_Landing_Contribution_Data','State',NULL,16,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Zip','tbl_Landing_Contribution_Data','Zip',NULL,17,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Birth Date','tbl_Landing_Contribution_Data','Birth_Date',NULL,18,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Hire Date','tbl_Landing_Contribution_Data','Hire_Date',NULL,19,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Rehire Date','tbl_Landing_Contribution_Data','Rehire_Date',NULL,20,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Adjusted Seniority Date','tbl_Landing_Contribution_Data','Adjusted_Seniority_Date',NULL,21,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Termination Date','tbl_Landing_Contribution_Data','Termination_Date',NULL,22,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Leave of Absence Begin Date','tbl_Landing_Contribution_Data','Leave_Of_Absence_Begin_Date',NULL,23,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Leave of Absence End Date','tbl_Landing_Contribution_Data','Leave_Of_Absence_End_Date',NULL,24,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Check Date','tbl_Landing_Contribution_Data','Check_Date',NULL,25,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Payroll Begin Date','tbl_Landing_Contribution_Data','Payroll_Begin_Date',NULL,26,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Payroll End Date','tbl_Landing_Contribution_Data','Payroll_End_Date',NULL,27,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Payroll Frequency','tbl_Landing_Contribution_Data','Pay_Frequency',NULL,28,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Cost Center 1 Code','tbl_Landing_Contribution_Data','Cost_Center_1_Code',NULL,29,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Cost Center 2 Code','tbl_Landing_Contribution_Data','Cost_Center_2_Code',NULL,30,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Cost Center 3 Code','tbl_Landing_Contribution_Data','Cost_Center_3_Code',NULL,31,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Gross Earnings','tbl_Landing_Contribution_Data','Gross_Earnings',NULL,32,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan Earnings','tbl_Landing_Contribution_Data','Plan_Earnings',NULL,33,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Hours','tbl_Landing_Contribution_Data','Pay_Period_Hours',NULL,34,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Excluded Earnings','tbl_Landing_Contribution_Data','Excluded_Earnings',NULL,35,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Section 125','tbl_Landing_Contribution_Data','Section_125',NULL,36,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Employee Deferral','tbl_Landing_Contribution_Data','Employee_Deferral',NULL,37,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Employee Roth','tbl_Landing_Contribution_Data','Employee_Roth',NULL,38,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Employee After Tax','tbl_Landing_Contribution_Data','Employee_After_Tax',NULL,39,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Loan Payments','tbl_Landing_Contribution_Data','Loan_Payments',NULL,40,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Loan Additional Principal Payments','tbl_Landing_Contribution_Data','Loan_Additional_Principal_Payments',NULL,41,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Loan Number','tbl_Landing_Contribution_Data','Loan_Number',NULL,42,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Employer Match','tbl_Landing_Contribution_Data','Employer_Match',NULL,43,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Safe Harbor Match','tbl_Landing_Contribution_Data','Safe_Harbor_Match',NULL,44,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Qualified Matching Contribution','tbl_Landing_Contribution_Data','Qualified_Matching_Contribution',NULL,45,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Safe Harbor Non-Elective','tbl_Landing_Contribution_Data','Safe_Harbor_Non_Elective',NULL,46,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Qualified Non-Elective Contribution','tbl_Landing_Contribution_Data','Qualified_Non_Elective_Contribution',NULL,47,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Profit Sharing','tbl_Landing_Contribution_Data','Profit_Sharing',NULL,48,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Money Purchase','tbl_Landing_Contribution_Data','Money_Purchase',NULL,49,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Rollover','tbl_Landing_Contribution_Data','Rollover',NULL,50,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Rollover Roth','tbl_Landing_Contribution_Data','Rollover_Roth',NULL,51,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'YTD Gross Earnings','tbl_Landing_Contribution_Data','YTD_Gross_Earnings',NULL,52,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan YTD Earnings','tbl_Landing_Contribution_Data','Plan_YTD_Earnings',NULL,53,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan YTD Hours','tbl_Landing_Contribution_Data','Plan_YTD_Hours',NULL,54,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan YTD Excluded Earnings','tbl_Landing_Contribution_Data','Plan_YTD_Excluded_Earnings',NULL,55,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan YTD Section 125','tbl_Landing_Contribution_Data','Plan_YTD_Section_125',NULL,56,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan YTD Employee Deferral','tbl_Landing_Contribution_Data','Plan_YTD_Employee_Deferral',NULL,57,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan YTD Employee Roth','tbl_Landing_Contribution_Data','Plan_YTD_Employee_Roth',NULL,58,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan YTD Employee After Tax','tbl_Landing_Contribution_Data','Plan_YTD_Employee_After_Tax',NULL,59,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan YTD Loan Payments','tbl_Landing_Contribution_Data','Plan_YTD_Loan_Payments',NULL,60,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan YTD Loan Number','tbl_Landing_Contribution_Data','Plan_YTD_Loan_Number',NULL,61,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan YTD Employer Match','tbl_Landing_Contribution_Data','Plan_YTD_Employer_Match',NULL,62,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan YTD Safe Harbor Match','tbl_Landing_Contribution_Data','Plan_YTD_Safe_Harbor_Match',NULL,63,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan YTD Qualified Matching Contribution','tbl_Landing_Contribution_Data','Plan_YTD_Qualified_Matching_Contribution',NULL,64,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan YTD Safe Harbor Non-Elective','tbl_Landing_Contribution_Data','Plan_YTD_Safe_Harbor_Non_Elective',NULL,65,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan YTD Qualified Non-Elective Contribution','tbl_Landing_Contribution_Data','Plan_YTD_Qualified_Non_Elective_Contribution',NULL,66,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan YTD Profit Sharing','tbl_Landing_Contribution_Data','Plan_YTD_Profit_Sharing',NULL,67,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan YTD Money Purchase','tbl_Landing_Contribution_Data','Plan_YTD_Money_Purchase',NULL,68,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan YTD Rollover','tbl_Landing_Contribution_Data','Plan_YTD_Rollover',NULL,69,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan YTD Rollover Roth','tbl_Landing_Contribution_Data','Plan_YTD_Rollover_Roth',NULL,70,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Plan ID','tbl_Landing_Contribution_Data','Plan_ID',NULL,71,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'InboundSourceSetupID','tbl_Landing_Contribution_Data','Inbound_File_Setup_ID',NULL,72,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'FileReceivedID','tbl_Landing_Contribution_Data','File_received_ID',NULL,73,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Prop_71','tbl_Landing_Contribution_Data',NULL,NULL,74,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Prop_72','tbl_Landing_Contribution_Data',NULL,NULL,75,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Prop_73','tbl_Landing_Contribution_Data',NULL,NULL,76,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(3,3,'Prop_74','tbl_Landing_Contribution_Data',NULL,NULL,77,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE())

----------------------OMNI--------------------

(1,1,'Prop_0','tbl_Landing_Contribution_Data','Detail',NULL,1,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_1','tbl_Landing_Contribution_Data','Employer_Name',NULL,2,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_2','tbl_Landing_Contribution_Data','Employer_EIN',NULL,3,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_3','tbl_Landing_Contribution_Data','Employer_Plan_ID',NULL,4,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_4','tbl_Landing_Contribution_Data','Employer_Sub_Plan_ID',NULL,5,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_5','tbl_Landing_Contribution_Data','Originating_Vendor_ID',NULL,6,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_6','tbl_Landing_Contribution_Data','Originating_Vendor_Sub_Plan_ID',NULL,7,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_7','tbl_Landing_Contribution_Data','Recipient_Vendor_Plan_ID',NULL,8,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_8','tbl_Landing_Contribution_Data','Recipient_Vendor_Sub_Plan_ID',NULL,9,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_9','tbl_Landing_Contribution_Data','Type_of_Account',NULL,10,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_10','tbl_Landing_Contribution_Data','Pay_Frequency',NULL,11,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_11','tbl_Landing_Contribution_Data','SSN',NULL,12,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_12','tbl_Landing_Contribution_Data','Employee_ID',NULL,13,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_13','tbl_Landing_Contribution_Data','First_Name',NULL,14,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_14','tbl_Landing_Contribution_Data','Middle_Name',NULL,15,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_15','tbl_Landing_Contribution_Data','Last_Name',NULL,16,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_16','tbl_Landing_Contribution_Data','Birth_Date',NULL,17,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_17','tbl_Landing_Contribution_Data','Gender',NULL,18,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_18','tbl_Landing_Contribution_Data','HR_Area_Or_Location_Code',NULL,19,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_19','tbl_Landing_Contribution_Data','HR_Sub_Area',NULL,20,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_20','tbl_Landing_Contribution_Data','Hire_Date',NULL,21,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_21','tbl_Landing_Contribution_Data','Rehire_Date',NULL,22,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_22','tbl_Landing_Contribution_Data','Payroll_Mode',NULL,23,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_23','tbl_Landing_Contribution_Data','Payroll_End_Date',NULL,24,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_24','tbl_Landing_Contribution_Data','Contribution_Source_Code_1',NULL,25,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_25','tbl_Landing_Contribution_Data','Contribution_Source_Amount_1',NULL,26,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_26','tbl_Landing_Contribution_Data','Contribution_Source_Code_2',NULL,27,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_27','tbl_Landing_Contribution_Data','Contribution_Source_Amount_2',NULL,28,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_28','tbl_Landing_Contribution_Data','Contribution_Source_Code_3',NULL,29,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_29','tbl_Landing_Contribution_Data','Contribution_Source_Amount_3',NULL,30,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_30','tbl_Landing_Contribution_Data','Contribution_Source_Code_4',NULL,31,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_31','tbl_Landing_Contribution_Data','Contribution_Source_Amount_4',NULL,32,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_32','tbl_Landing_Contribution_Data','Contribution_Source_Code_5',NULL,33,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_33','tbl_Landing_Contribution_Data','Contribution_Source_Amount_5',NULL,34,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_34','tbl_Landing_Contribution_Data','Contribution_Source_Code_6',NULL,35,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_35','tbl_Landing_Contribution_Data','Contribution_Source_Amount_6',NULL,36,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_36','tbl_Landing_Contribution_Data','Contribution_Source_Code_7',NULL,37,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_37','tbl_Landing_Contribution_Data','Contribution_Source_Amount_7',NULL,38,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_38','tbl_Landing_Contribution_Data','Contribution_Source_Code_8',NULL,39,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_39','tbl_Landing_Contribution_Data','Contribution_Source_Amount_8',NULL,40,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_40','tbl_Landing_Contribution_Data','Final_Contribution_Indicator',NULL,41,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_41','tbl_Landing_Contribution_Data','Loan_Number_1',NULL,42,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_42','tbl_Landing_Contribution_Data','Loan_Repayment_Amount_1',NULL,43,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_43','tbl_Landing_Contribution_Data','Loan_Number_2',NULL,44,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_44','tbl_Landing_Contribution_Data','Loan_Repayment_Amout_2',NULL,45,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_45','tbl_Landing_Contribution_Data','Loan_Number_3',NULL,46,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_46','tbl_Landing_Contribution_Data','Loan_Repayment_Amount_4',NULL,47,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_47','tbl_Landing_Contribution_Data','Loan_Number_5',NULL,48,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_48','tbl_Landing_Contribution_Data','Loan_Repayment_Amount_5',NULL,49,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_49','tbl_Landing_Contribution_Data','OMNI_Field_50',NULL,50,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_50','tbl_Landing_Contribution_Data','OMNI_Field_51',NULL,51,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_51','tbl_Landing_Contribution_Data','OMNI_Field_52',NULL,52,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_52','tbl_Landing_Contribution_Data','OMNI_Field_53',NULL,53,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_53','tbl_Landing_Contribution_Data','OMNI_Field_54',NULL,54,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_54','tbl_Landing_Contribution_Data','OMNI_Field_55',NULL,55,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_55','tbl_Landing_Contribution_Data','OMNI_Field_56',NULL,56,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_56','tbl_Landing_Contribution_Data','OMNI_Field_57',NULL,57,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_57','tbl_Landing_Contribution_Data','OMNI_Field_58',NULL,58,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_58','tbl_Landing_Contribution_Data','OMNI_Field_59',NULL,59,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_59','tbl_Landing_Contribution_Data','OMNI_Field_60',NULL,60,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_60','tbl_Landing_Contribution_Data','OMNI_Field_61',NULL,61,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_61','tbl_Landing_Contribution_Data','OMNI_Field_62',NULL,62,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_62','tbl_Landing_Contribution_Data','OMNI_Field_63',NULL,63,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_63','tbl_Landing_Contribution_Data','OMNI_Field_64',NULL,64,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_64','tbl_Landing_Contribution_Data','OMNI_Field_65',NULL,65,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_65','tbl_Landing_Contribution_Data','OMNI_Field_66',NULL,66,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_66','tbl_Landing_Contribution_Data','OMNI_Field_67',NULL,67,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_67','tbl_Landing_Contribution_Data','Header_Column_1',NULL,901,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_68','tbl_Landing_Contribution_Data','Header_Column_2',NULL,902,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_69','tbl_Landing_Contribution_Data','Header_Column_3',NULL,903,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_70','tbl_Landing_Contribution_Data','Header_Column_4',NULL,904,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_71','tbl_Landing_Contribution_Data','Header_Column_5',NULL,905,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_72','tbl_Landing_Contribution_Data','Header_Column_6',NULL,906,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_73','tbl_Landing_Contribution_Data','Header_Column_7',NULL,907,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_74','tbl_Landing_Contribution_Data','Header_Column_8',NULL,908,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_75','tbl_Landing_Contribution_Data','Header_Column_9',NULL,909,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_76','tbl_Landing_Contribution_Data','Header_Column_10',NULL,910,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_77','tbl_Landing_Contribution_Data','Footer_Column_1',NULL,1001,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_78','tbl_Landing_Contribution_Data','Footer_Column_2',NULL,1002,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_79','tbl_Landing_Contribution_Data','Footer_Column_3',NULL,1003,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_80','tbl_Landing_Contribution_Data','Footer_Column_4',NULL,1004,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_81','tbl_Landing_Contribution_Data','Footer_Column_5',NULL,1005,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_82','tbl_Landing_Contribution_Data','Inbound_File_Setup_ID',NULL,68,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(1,1,'Prop_83','tbl_Landing_Contribution_Data','File_received_ID',NULL,69,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE())

------------------------------VOYA-------------------------------------------------------------------

(2,2,'Prop_0','tbl_Landing_Contribution_Data','Record_Level_1',NULL,1,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_1','tbl_Landing_Contribution_Data','Record_Level_1_Vendor',NULL,2,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_2','tbl_Landing_Contribution_Data','Record_Level_1_File_Release_Time',NULL,3,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_3','tbl_Landing_Contribution_Data','Record_Level_1_Total_Amount_in_File',NULL,4,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_4','tbl_Landing_Contribution_Data','Record_Level_1_Number_of_Contributions',NULL,5,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_5','tbl_Landing_Contribution_Data','Record_Level_1_Datetime',NULL,6,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_6','tbl_Landing_Contribution_Data','Record_Level_1_Number_of_Participants',NULL,7,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_7','tbl_Landing_Contribution_Data','Record_Level_2',NULL,8,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_8','tbl_Landing_Contribution_Data','Record_Level_2_Plan_Name',NULL,9,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_9','tbl_Landing_Contribution_Data','Record_Level_2_Remitter_Plan_Code',NULL,10,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_10','tbl_Landing_Contribution_Data','Record_Level_2_Prop__D',NULL,11,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_11','tbl_Landing_Contribution_Data','Record_Level_2_Prop__E',NULL,12,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_12','tbl_Landing_Contribution_Data','Record_Level_2_Payroll_Date',NULL,13,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_13','tbl_Landing_Contribution_Data','Record_Level_2_Total_Amount_in_Plan',NULL,14,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_14','tbl_Landing_Contribution_Data','Record_Level_2_Number_of_Participants',NULL,15,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_15','tbl_Landing_Contribution_Data','Record_Level_3',NULL,16,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_16','tbl_Landing_Contribution_Data','Record_Level_3_SSN',NULL,17,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_17','tbl_Landing_Contribution_Data','Record_Level_3_Last_Name',NULL,18,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_18','tbl_Landing_Contribution_Data','Record_Level_3_First_Name',NULL,19,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_19','tbl_Landing_Contribution_Data','Record_Level_3_Remitter_Plan_Code',NULL,20,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_20','tbl_Landing_Contribution_Data','Record_Level_3_Remittance_Type',NULL,21,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_21','tbl_Landing_Contribution_Data','Record_Level_3_Source_Code',NULL,22,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_22','tbl_Landing_Contribution_Data','Record_Level_3_Number_of_Participants',NULL,23,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_23','tbl_Landing_Contribution_Data','Record_Level_3_Prop__I',NULL,24,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_24','tbl_Landing_Contribution_Data','Record_Level_3_Amount',NULL,25,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_25','tbl_Landing_Contribution_Data','Record_Level_4',NULL,26,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_26','tbl_Landing_Contribution_Data','Record_Level_4_Plan_Name',NULL,27,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_27','tbl_Landing_Contribution_Data','Record_Level_4_Remitter_Plan_Code',NULL,28,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_28','tbl_Landing_Contribution_Data','Record_Level_4_Prop__D',NULL,29,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_29','tbl_Landing_Contribution_Data','Record_Level_4_Prop__E',NULL,30,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_30','tbl_Landing_Contribution_Data','Record_Level_4_Payroll_Date',NULL,31,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_31','tbl_Landing_Contribution_Data','Record_Level_4_Total_Amount_in_Plan',NULL,32,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_32','tbl_Landing_Contribution_Data','Record_Level_4_Number_of_Participants',NULL,33,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_33','tbl_Landing_Contribution_Data','Record_Level_5',NULL,34,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_34','tbl_Landing_Contribution_Data','Record_Level_5_Vendor',NULL,35,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_35','tbl_Landing_Contribution_Data','Record_Level_5_File_Release_Time',NULL,36,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_36','tbl_Landing_Contribution_Data','Record_Level_5_Total_Amount_in_File',NULL,37,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_37','tbl_Landing_Contribution_Data','Record_Level_5_Number_of_Contributions',NULL,38,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_38','tbl_Landing_Contribution_Data','Record_Level_5_Datetime',NULL,39,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'Prop_39','tbl_Landing_Contribution_Data','Record_Level_5_Number_of_Participants',NULL,40,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'InboundSourceSetupID','tbl_Landing_Contribution_Data','Inbound_File_Setup_ID',NULL,41,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,2,'FileReceivedID','tbl_Landing_Contribution_Data','File_received_ID',NULL,42,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE())

-------------------------VOYA EXCEL

(2,11,'Prop_0','tbl_Landing_Contribution_Data','Record_Level_1',NULL,1,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_1','tbl_Landing_Contribution_Data','Record_Level_1_Vendor',NULL,2,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_2','tbl_Landing_Contribution_Data','Record_Level_1_File_Release_Time',NULL,3,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_3','tbl_Landing_Contribution_Data','Record_Level_1_Total_Amount_in_File',NULL,4,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_4','tbl_Landing_Contribution_Data','Record_Level_1_Number_of_Contributions',NULL,5,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_5','tbl_Landing_Contribution_Data','Record_Level_1_Datetime',NULL,6,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_6','tbl_Landing_Contribution_Data','Record_Level_1_Number_of_Participants',NULL,7,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_7','tbl_Landing_Contribution_Data','Record_Level_2',NULL,8,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_8','tbl_Landing_Contribution_Data','Record_Level_2_Plan_Name',NULL,9,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_9','tbl_Landing_Contribution_Data','Record_Level_2_Remitter_Plan_Code',NULL,10,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_10','tbl_Landing_Contribution_Data','Record_Level_2_Column_D',NULL,11,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_11','tbl_Landing_Contribution_Data','Record_Level_2_Column_E',NULL,12,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_12','tbl_Landing_Contribution_Data','Record_Level_2_Payroll_Date',NULL,13,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_13','tbl_Landing_Contribution_Data','Record_Level_2_Total_Amount_in_Plan',NULL,14,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_14','tbl_Landing_Contribution_Data','Record_Level_2_Number_of_Participants',NULL,15,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_15','tbl_Landing_Contribution_Data','Record_Level_3',NULL,16,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_16','tbl_Landing_Contribution_Data','Record_Level_3_SSN',NULL,17,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_17','tbl_Landing_Contribution_Data','Record_Level_3_Last_Name',NULL,18,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_18','tbl_Landing_Contribution_Data','Record_Level_3_First_Name',NULL,19,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_19','tbl_Landing_Contribution_Data','Record_Level_3_Remitter_Plan_Code',NULL,20,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_20','tbl_Landing_Contribution_Data','Record_Level_3_Remittance_Type',NULL,21,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_21','tbl_Landing_Contribution_Data','Record_Level_3_Source_Code',NULL,22,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_22','tbl_Landing_Contribution_Data','Record_Level_3_Number_of_Participants',NULL,23,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_23','tbl_Landing_Contribution_Data','Record_Level_3_Column_I',NULL,24,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_24','tbl_Landing_Contribution_Data','Record_Level_3_Amount',NULL,25,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_25','tbl_Landing_Contribution_Data','Record_Level_4',NULL,26,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_26','tbl_Landing_Contribution_Data','Record_Level_4_Plan_Name',NULL,27,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_27','tbl_Landing_Contribution_Data','Record_Level_4_Remitter_Plan_Code',NULL,28,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_28','tbl_Landing_Contribution_Data','Record_Level_4_Column_D',NULL,29,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_29','tbl_Landing_Contribution_Data','Record_Level_4_Column_E',NULL,30,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_30','tbl_Landing_Contribution_Data','Record_Level_4_Payroll_Date',NULL,31,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_31','tbl_Landing_Contribution_Data','Record_Level_4_Total_Amount_in_Plan',NULL,32,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_32','tbl_Landing_Contribution_Data','Record_Level_4_Number_of_Participants',NULL,33,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_33','tbl_Landing_Contribution_Data','Record_Level_5',NULL,34,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_34','tbl_Landing_Contribution_Data','Record_Level_5_Vendor',NULL,35,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_35','tbl_Landing_Contribution_Data','Record_Level_5_File_Release_Time',NULL,36,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_36','tbl_Landing_Contribution_Data','Record_Level_5_Total_Amount_in_File',NULL,37,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_37','tbl_Landing_Contribution_Data','Record_Level_5_Number_of_Contributions',NULL,38,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_38','tbl_Landing_Contribution_Data','Record_Level_5_Datetime',NULL,39,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'Prop_39','tbl_Landing_Contribution_Data','Record_Level_5_Number_of_Participants',NULL,40,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'InboundSourceSetupID','tbl_Landing_Contribution_Data','Inbound_File_Setup_ID',NULL,41,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(2,11,'FileReceivedID','tbl_Landing_Contribution_Data','File_received_ID',NULL,42,NULL,1,'SYSTEM',GETDATE(),'SYSTEM',GETDATE())



---------------Ingestion_Lookup----------------------------------
insert into tbl_Ingestion_Lookup
(
[Lookup_Name]
      ,[Lookup_Value]
      ,[IsActive]
      ,[Created_By]
      ,[Created_Date]
      ,[Updated_By]
      ,[Updated_date]
)
values
('Relius Marital Status','M','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius Marital Status','S','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius Marital Status','D','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius Marital Status','W','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius Marital Status','H','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius Marital Status','O','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('LandingMaritalStatus','Married','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('LandingMaritalStatus','Single','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('LandingMaritalStatus','Divorced','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('LandingMaritalStatus','Widowed','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('LandingMaritalStatus','Head of Household','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('LandingMaritalStatus','Other','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius Union Status','Y','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius Union Status','N','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','AL','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','AK','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','AZ','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','AR','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','CA','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','CO','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','CT','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','DE','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','DC','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','FL','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','GA','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','HI','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','ID','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','IL','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','IN','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','IA','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','KS','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','KY','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','LA','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','ME','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','MD','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','MA','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','MI','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','MN','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','MS','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','MO','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','MT','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','NE','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','NV','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','NH','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','NJ','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','NM','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','NY','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','NC','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','ND','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','OH','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','OK','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','OR','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','PA','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','RI','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','SC','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','SD','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','TN','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','TX','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','UT','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','VT','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','VA','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','WA','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','WV','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','WI','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius State','WY','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius Gender','M','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius Gender','F','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius Pay Frequency','W','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius Pay Frequency','B','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius Pay Frequency','S','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius Pay Frequency','M','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius Pay Frequency','A','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Relius Remittance Type','C','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing Union Status','YES','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing Union Status','NO','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing Gender','MALE','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing Gender','FEMALE','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing Pay Frequency','Weekly','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing Pay Frequency','Biweekly','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing Pay Frequency','Semimonthly','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing Pay Frequency','Monthly','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing Pay Frequency','Annually','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Alabama','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Alaska','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Arizona','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Arkansas','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','California','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Colorado','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Connecticut','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Delaware','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','District of Columbia','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Florida','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Georgia','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Hawaii','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Idaho','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Illinois','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Indiana','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Iowa','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Kansas','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Kentucky','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Louisiana','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Maine','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Maryland','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Massachusetts','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Michigan','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Minnesota','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Mississippi','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Missouri','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Montana','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Nebraska','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Nevada','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','New Hampshire','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','New Jersey','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','New Mexico','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','New York','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','North Carolina','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','North Dakota','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Ohio','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Oklahoma','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Oregon','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Pennsylvania','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Rhode Island','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','South Carolina','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','South Dakota','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Tennessee','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Texas','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Utah','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Vermont','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Virginia','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Washington','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','West Virginia','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Wisconsin','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing State','Wyoming','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
('Landing Remittance Type','TBD','1','SYSTEM',GETDATE(),'SYSTEM',GETDATE())

----------Enumeration Data--------------

  insert into [dbo].[tbl_Enumeration_Data]
  (
		[Column_Name]  
      ,[Actual_value]
      ,[Proposed_Value]
      ,[Created_By]
      ,[Created_Date]
      ,[Updated_By]
      ,[Updated_Date]
      
)
VALUES
('Union_Status','YES','Y','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('Union_Status','NO','N','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Alabama','AL','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Alaska','AK','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Arizona','AZ','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Arkansas','AR','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','California','CA','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Colorado','CO','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Connecticut','CT','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Delaware','DE','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','District of Columbia','DC','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Florida','FL','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Georgia','GA','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Hawaii','HI','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Idaho','ID','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Illinois','IL','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Indiana','IN','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Iowa','IA','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Kansas','KS','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Kentucky','KY','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Louisiana','LA','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Maine','ME','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Maryland','MD','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Massachusetts','MA','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Michigan','MI','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Minnesota','MN','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Mississippi','MS','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Missouri','MO','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Montana','MT','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Nebraska','NE','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Nevada','NV','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','New Hampshire','NH','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','New Jersey','NJ','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','New Mexico','NM','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','New York','NY','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','North Carolina','NC','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','North Dakota','ND','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Ohio','OH','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Oklahoma','OK','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Oregon','OR','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Pennsylvania','PA','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Rhode Island','RI','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','South Carolina','SC','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','South Dakota','SD','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Tennessee','TN','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Texas','TX','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Utah','UT','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Vermont','VT','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Virginia','VA','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Washington','WA','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','West Virginia','WV','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Wisconsin','WI','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('State','Wyoming','WY','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('Pay_Frequency','Weekly','W','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('Pay_Frequency','Biweekly','B','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('Pay_Frequency','Semimonthly','S','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('Pay_Frequency','Monthly','M','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('Pay_Frequency','Annually','A','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('Gender','Male','M','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('Gender','Female','F','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('Marital_Status','Married','M','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('Marital_Status','Single','S','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('Marital_Status','Divorced','D','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('Marital_Status','Widowed','W','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('Marital_Status','Head of Household','H','SYSTEM',Getdate(),'SYSTEM',Getdate()),
('Marital_Status','Other','O','SYSTEM',Getdate(),'SYSTEM',Getdate()),
