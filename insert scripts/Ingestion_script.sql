/****** Object:  Database [pcs-sqldb-Ingestion-payroll360-dev]    Script Date: 3/12/2021 8:49:03 AM ******/
CREATE DATABASE [pcs-sqldb-Ingestion-payroll360-dev]  (EDITION = 'Standard', SERVICE_OBJECTIVE = 'ElasticPool', MAXSIZE = 250 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET  MULTI_USER 
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET ENCRYPTION ON
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET QUERY_STORE = ON
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[tbl_Enumeration_Data]    Script Date: 3/12/2021 8:49:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Enumeration_Data](
	[Enumeration_Data_ID] [int] IDENTITY(1,1) NOT NULL,
	[Column_Name] [varchar](100) NULL,
	[Actual_value] [varchar](100) NULL,
	[Proposed_Value] [varchar](100) NULL,
	[IsActive] [tinyint] NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Enumeration_Data_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vw_Enumeration_Union_Status]    Script Date: 3/12/2021 8:49:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_Enumeration_Union_Status]
AS
SELECT        Actual_value, Proposed_Value
FROM            dbo.tbl_Enumeration_Data
WHERE        (Column_Name = 'Union_Status') AND (IsActive = 1)
GO
/****** Object:  View [dbo].[Vw_Enumeration_State]    Script Date: 3/12/2021 8:49:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_Enumeration_State]
AS
SELECT        Actual_value, Proposed_Value
FROM            dbo.tbl_Enumeration_Data
WHERE        (Column_Name = 'State') AND (IsActive = 1)
GO
/****** Object:  View [dbo].[Vw_Enumeration_Pay_Frequency]    Script Date: 3/12/2021 8:49:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_Enumeration_Pay_Frequency]
AS
SELECT        Actual_value, Proposed_Value
FROM            dbo.tbl_Enumeration_Data
WHERE        (Column_Name = 'Pay_Frequency') AND (IsActive = 1)
GO
/****** Object:  View [dbo].[Vw_Enumeration_Gender]    Script Date: 3/12/2021 8:49:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_Enumeration_Gender]
AS
SELECT        Actual_value, Proposed_Value
FROM            dbo.tbl_Enumeration_Data
WHERE        (Column_Name = 'Gender') AND (IsActive = 1)
GO
/****** Object:  View [dbo].[Vw_Enumeration_Marital_Status]    Script Date: 3/12/2021 8:49:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_Enumeration_Marital_Status]
AS
SELECT        Actual_value, Proposed_Value
FROM            dbo.tbl_Enumeration_Data
WHERE        (Column_Name = 'Marital_Status') AND (IsActive = 1)
GO
/****** Object:  Table [dbo].[tbl_Data_Error_Log]    Script Date: 3/12/2021 8:49:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Data_Error_Log](
	[Data_Error_Log_ID] [int] IDENTITY(1,1) NOT NULL,
	[Landing_Contribution_Data_ID] [bigint] NULL,
	[Staging_Contribution_Data_ID] [bigint] NULL,
	[Error_Type] [varchar](100) NULL,
	[Error_Description] [varchar](500) NULL,
	[Error_Column_Name] [varchar](50) NULL,
	[Error_Status] [char](1) NULL,
	[Resolution_Date] [date] NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_date] [datetime] NULL,
	[File_received_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Data_Error_Log_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Ingestion_Lookup]    Script Date: 3/12/2021 8:49:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Ingestion_Lookup](
	[Ingestion_Lookup_ID] [int] IDENTITY(1,1) NOT NULL,
	[Lookup_Name] [varchar](100) NULL,
	[Lookup_Value] [varchar](100) NULL,
	[IsActive] [char](1) NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Ingestion_Lookup_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Landing_Contribution_Data]    Script Date: 3/12/2021 8:49:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Landing_Contribution_Data](
	[Landing_Contribution_Data_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[File_received_ID] [int] NULL,
	[Inbound_File_Setup_ID] [int] NULL,
	[Paylocity_Company_Code] [varchar](100) NULL,
	[Check_Date] [varchar](100) NULL,
	[SSN] [varchar](100) NULL,
	[First_Name] [varchar](100) NULL,
	[Middle_Name] [varchar](100) NULL,
	[Last_Name] [varchar](100) NULL,
	[Title] [varchar](100) NULL,
	[Employee_ID] [varchar](100) NULL,
	[Gender] [varchar](100) NULL,
	[Employee_Status] [varchar](100) NULL,
	[Marital_Status] [varchar](100) NULL,
	[Division_Code] [varchar](100) NULL,
	[Union_Status] [varchar](100) NULL,
	[Address_1] [varchar](250) NULL,
	[Address_2] [varchar](250) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[Zip] [varchar](100) NULL,
	[Birth_Date] [varchar](100) NULL,
	[Hire_Date] [varchar](100) NULL,
	[Termination_Date] [varchar](100) NULL,
	[Rehire_Date] [varchar](100) NULL,
	[Gross_Earnings] [varchar](100) NULL,
	[Pay_Period_Hours] [varchar](100) NULL,
	[Employee_Deferral] [varchar](100) NULL,
	[Employee_Roth] [varchar](100) NULL,
	[Loan_Payments] [varchar](100) NULL,
	[Employee_After_Tax] [varchar](100) NULL,
	[Employer_Match] [varchar](100) NULL,
	[Safe_Harbor_Match] [varchar](100) NULL,
	[Safe_Harbor_Non_Elective] [varchar](100) NULL,
	[Qualified_Matching_Contribution] [varchar](100) NULL,
	[Qualified_Non_Elective_Contribution] [varchar](100) NULL,
	[Profit_Sharing] [varchar](100) NULL,
	[Money_Purchase] [varchar](100) NULL,
	[Pay_Frequency] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Phone_Number] [varchar](100) NULL,
	[Pay_Type] [varchar](100) NULL,
	[Adjusted_Seniority_Date] [varchar](100) NULL,
	[Leave_Of_Absence_Begin_Date] [varchar](100) NULL,
	[Leave_Of_Absence_End_Date] [varchar](100) NULL,
	[Payroll_Begin_Date] [varchar](100) NULL,
	[Payroll_End_Date] [varchar](100) NULL,
	[Cost_Center_1_Code] [varchar](100) NULL,
	[Cost_Center_2_Code] [varchar](100) NULL,
	[Cost_Center_3_Code] [varchar](100) NULL,
	[Plan_Earnings] [varchar](100) NULL,
	[Excluded_Earnings] [varchar](100) NULL,
	[Section_125] [varchar](100) NULL,
	[Loan_Additional_Principal_Payments] [varchar](100) NULL,
	[Loan_Number] [varchar](100) NULL,
	[Rollover] [varchar](100) NULL,
	[Rollover_Roth] [varchar](100) NULL,
	[YTD_Gross_Earnings] [varchar](100) NULL,
	[Plan_YTD_Earnings] [varchar](100) NULL,
	[Plan_YTD_Hours] [varchar](100) NULL,
	[Plan_YTD_Excluded_Earnings] [varchar](100) NULL,
	[Plan_YTD_Section_125] [varchar](100) NULL,
	[Plan_YTD_Employee_Deferral] [varchar](100) NULL,
	[Plan_YTD_Employee_Roth] [varchar](100) NULL,
	[Plan_YTD_Employee_After_Tax] [varchar](100) NULL,
	[Plan_YTD_Loan_Payments] [varchar](100) NULL,
	[Plan_YTD_Loan_Number] [varchar](100) NULL,
	[Plan_YTD_Employer_Match] [varchar](100) NULL,
	[Plan_YTD_Safe_Harbor_Match] [varchar](100) NULL,
	[Plan_YTD_Qualified_Matching_Contribution] [varchar](100) NULL,
	[Plan_YTD_Safe_Harbor_Non_Elective] [varchar](100) NULL,
	[Plan_YTD_Qualified_Non_Elective_Contribution] [varchar](100) NULL,
	[Plan_YTD_Profit_Sharing] [varchar](100) NULL,
	[Plan_YTD_Money_Purchase] [varchar](100) NULL,
	[Plan_YTD_Rollover] [varchar](100) NULL,
	[Plan_YTD_Rollover_Roth] [varchar](100) NULL,
	[Plan_ID] [varchar](100) NULL,
	[Plan_Name] [varchar](100) NULL,
	[Investment_Election] [varchar](100) NULL,
	[Investment_Change_Date] [varchar](100) NULL,
	[Recipient_Vendor_Plan_ID] [varchar](100) NULL,
	[Detail] [varchar](250) NULL,
	[Employer_EIN] [varchar](100) NULL,
	[Employer_Name] [varchar](100) NULL,
	[Employer_Plan_ID] [varchar](100) NULL,
	[Employer_Sub_Plan_ID] [varchar](100) NULL,
	[Originating_Vendor_ID] [varchar](100) NULL,
	[Originating_Vendor_Sub_Plan_ID] [varchar](100) NULL,
	[Recipient_Vendor_Sub_Plan_ID] [varchar](100) NULL,
	[Type_of_Account] [varchar](100) NULL,
	[HR_Area_Or_Location_Code] [varchar](250) NULL,
	[HR_Sub_Area] [varchar](250) NULL,
	[Adjusted_Date_of_Hire] [varchar](100) NULL,
	[Payroll_Mode] [varchar](100) NULL,
	[Contribution_Source_Code_1] [varchar](100) NULL,
	[Contribution_Source_Amount_1] [varchar](100) NULL,
	[Contribution_Source_Code_2] [varchar](100) NULL,
	[Contribution_Source_Amount_2] [varchar](100) NULL,
	[Contribution_Source_Code_3] [varchar](100) NULL,
	[Contribution_Source_Amount_3] [varchar](100) NULL,
	[Contribution_Source_Code_4] [varchar](100) NULL,
	[Contribution_Source_Amount_4] [varchar](100) NULL,
	[Contribution_Source_Code_5] [varchar](100) NULL,
	[Contribution_Source_Amount_5] [varchar](100) NULL,
	[Contribution_Source_Code_6] [varchar](100) NULL,
	[Contribution_Source_Amount_6] [varchar](100) NULL,
	[Contribution_Source_Code_7] [varchar](100) NULL,
	[Contribution_Source_Amount_7] [varchar](100) NULL,
	[Contribution_Source_Code_8] [varchar](100) NULL,
	[Contribution_Source_Amount_8] [varchar](100) NULL,
	[Final_Contribution_Indicator] [varchar](100) NULL,
	[Loan_Number_1] [varchar](100) NULL,
	[Loan_Repayment_Amount_1] [varchar](100) NULL,
	[Loan_Number_2] [varchar](100) NULL,
	[Loan_Repayment_Amout_2] [varchar](100) NULL,
	[Loan_Number_3] [varchar](100) NULL,
	[Loan_Repayment_Amount_3] [varchar](100) NULL,
	[Loan_Number_4] [varchar](100) NULL,
	[Loan_Repayment_Amount_4] [varchar](100) NULL,
	[Loan_Number_5] [varchar](100) NULL,
	[Loan_Repayment_Amount_5] [varchar](100) NULL,
	[OMNI_Field_52] [varchar](100) NULL,
	[OMNI_Field_53] [varchar](100) NULL,
	[OMNI_Field_54] [varchar](100) NULL,
	[OMNI_Field_55] [varchar](100) NULL,
	[OMNI_Field_56] [varchar](100) NULL,
	[OMNI_Field_57] [varchar](100) NULL,
	[OMNI_Field_58] [varchar](100) NULL,
	[OMNI_Field_59] [varchar](100) NULL,
	[OMNI_Field_60] [varchar](100) NULL,
	[OMNI_Field_61] [varchar](100) NULL,
	[OMNI_Field_62] [varchar](100) NULL,
	[OMNI_Field_63] [varchar](100) NULL,
	[OMNI_Field_64] [varchar](100) NULL,
	[OMNI_Field_65] [varchar](100) NULL,
	[OMNI_Field_66] [varchar](100) NULL,
	[OMNI_Field_67] [varchar](100) NULL,
	[Record_Level_1] [varchar](100) NULL,
	[Record_Level_1_Vendor] [varchar](100) NULL,
	[Record_Level_1_File_Release_Time] [varchar](100) NULL,
	[Record_Level_1_Total_Amount_in_File] [varchar](100) NULL,
	[Record_Level_1_Number_of_Contributions] [varchar](100) NULL,
	[Record_Level_1_Datetime] [varchar](100) NULL,
	[Record_Level_1_Number_of_Participants] [varchar](100) NULL,
	[Record_Level_2] [varchar](100) NULL,
	[Record_Level_2_Plan_Name] [varchar](100) NULL,
	[Record_Level_2_Remitter_Plan_Code] [varchar](100) NULL,
	[Record_Level_2_Column_D] [varchar](100) NULL,
	[Record_Level_2_Column_E] [varchar](100) NULL,
	[Record_Level_2_Payroll_Date] [varchar](100) NULL,
	[Record_Level_2_Total_Amount_in_Plan] [varchar](100) NULL,
	[Record_Level_2_Number_of_Participants] [varchar](100) NULL,
	[Record_Level_3] [varchar](100) NULL,
	[Record_Level_3_SSN] [varchar](100) NULL,
	[Record_Level_3_Last_Name] [varchar](100) NULL,
	[Record_Level_3_First_Name] [varchar](100) NULL,
	[Record_Level_3_Remitter_Plan_Code] [varchar](100) NULL,
	[Record_Level_3_Remittance_Type] [varchar](100) NULL,
	[Record_Level_3_Source_Code] [varchar](100) NULL,
	[Record_Level_3_Number_of_Participants] [varchar](100) NULL,
	[Record_Level_3_Column_I] [varchar](100) NULL,
	[Record_Level_3_Amount] [varchar](100) NULL,
	[Record_Level_4] [varchar](100) NULL,
	[Record_Level_4_Plan_Name] [varchar](100) NULL,
	[Record_Level_4_Remitter_Plan_Code] [varchar](100) NULL,
	[Record_Level_4_Column_D] [varchar](100) NULL,
	[Record_Level_4_Column_E] [varchar](100) NULL,
	[Record_Level_4_Payroll_Date] [varchar](100) NULL,
	[Record_Level_4_Total_Amount_in_Plan] [varchar](100) NULL,
	[Record_Level_4_Number_of_Participants] [varchar](100) NULL,
	[Record_Level_5] [varchar](100) NULL,
	[Record_Level_5_Vendor] [varchar](100) NULL,
	[Record_Level_5_File_Release_Time] [varchar](100) NULL,
	[Record_Level_5_Total_Amount_in_File] [varchar](100) NULL,
	[Record_Level_5_Number_of_Contributions] [varchar](100) NULL,
	[Record_Level_5_Datetime] [varchar](100) NULL,
	[Record_Level_5_Number_of_Participants] [varchar](100) NULL,
	[Remittance_Type] [varchar](100) NULL,
	[Contribution_Rate] [varchar](100) NULL,
	[Loan_Balance] [varchar](100) NULL,
	[Comments] [varchar](100) NULL,
	[Header_Column_1] [varchar](100) NULL,
	[Header_Column_2] [varchar](100) NULL,
	[Header_Column_3] [varchar](100) NULL,
	[Header_Column_4] [varchar](100) NULL,
	[Header_Column_5] [varchar](100) NULL,
	[Header_Column_6] [varchar](100) NULL,
	[Header_Column_7] [varchar](100) NULL,
	[Header_Column_8] [varchar](100) NULL,
	[Header_Column_9] [varchar](100) NULL,
	[Header_Column_10] [varchar](100) NULL,
	[Footer_Column_1] [varchar](100) NULL,
	[Footer_Column_2] [varchar](100) NULL,
	[Footer_Column_3] [varchar](100) NULL,
	[Footer_Column_4] [varchar](100) NULL,
	[Footer_Column_5] [varchar](100) NULL,
	[Footer_Column_6] [varchar](100) NULL,
	[Footer_Column_7] [varchar](100) NULL,
	[Footer_Column_8] [varchar](100) NULL,
	[Footer_Column_9] [varchar](100) NULL,
	[Footer_Column_10] [varchar](100) NULL,
	[OMNI_Field_50] [varchar](100) NULL,
	[OMNI_Field_51] [varchar](100) NULL,
	[PAYLOCITY_Field_71] [varchar](100) NULL,
	[PAYLOCITY_Field_72] [varchar](100) NULL,
	[PAYLOCITY_Field_73] [varchar](100) NULL,
	[PAYLOCITY_Field_74] [varchar](100) NULL,
	[Status] [varchar](50) NULL,
	[Annual_Salary] [varchar](100) NULL,
	[Employee_Badge_Clock_Number] [varchar](100) NULL,
	[Employee_EEOClass] [varchar](100) NULL,
	[Employee_Job_Title] [varchar](100) NULL,
	[Employee_Position] [varchar](100) NULL,
	[Employee_Supervisor] [varchar](100) NULL,
	[Employee_Supervisor_ID] [varchar](100) NULL,
	[Employee_Type] [varchar](100) NULL,
	[Employee_Tax_Form] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Landing_Contribution_Data_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Staging_Contribution_Data]    Script Date: 3/12/2021 8:49:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Staging_Contribution_Data](
	[Staging_Contribution_Data_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Landing_Contribution_Data_ID] [bigint] NULL,
	[File_received_ID] [int] NULL,
	[Inbound_File_Setup_ID] [int] NULL,
	[Company_Code] [varchar](50) NULL,
	[Check_Date] [date] NULL,
	[SSN] [varchar](50) NULL,
	[First_Name] [varchar](50) NULL,
	[Middle_Name] [varchar](50) NULL,
	[Last_Name] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[Employee_ID] [varchar](50) NULL,
	[Gender] [varchar](20) NULL,
	[Employee_Status] [varchar](30) NULL,
	[Marital_Status] [varchar](20) NULL,
	[Division_Code] [varchar](50) NULL,
	[Union_Status] [varchar](50) NULL,
	[Address_1] [varchar](250) NULL,
	[Address_2] [varchar](250) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[Zip] [varchar](50) NULL,
	[Birth_Date] [varchar](50) NULL,
	[Hire_Date] [varchar](50) NULL,
	[Termination_Date] [varchar](50) NULL,
	[Rehire_Date] [varchar](50) NULL,
	[Gross_Earnings] [decimal](18, 2) NULL,
	[Pay_Period_Hours] [decimal](18, 2) NULL,
	[Employee_Deferral] [decimal](18, 2) NULL,
	[Employee_Roth] [decimal](18, 2) NULL,
	[Loan_Payments] [decimal](18, 2) NULL,
	[Employee_After_Tax] [decimal](18, 2) NULL,
	[Employer_Match] [decimal](18, 2) NULL,
	[Safe_Harbor_Match] [decimal](18, 2) NULL,
	[Safe_Harbor_Non_Elective] [decimal](18, 2) NULL,
	[Qualified_Matching_Contribution] [decimal](18, 2) NULL,
	[Qualified_Non_Elective_Contribution] [decimal](18, 2) NULL,
	[Profit_Sharing] [decimal](18, 2) NULL,
	[Money_Purchase] [decimal](18, 2) NULL,
	[Pay_Frequency] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone_Number] [varchar](50) NULL,
	[Pay_Type] [varchar](50) NULL,
	[Adjusted_Seniority_Date] [date] NULL,
	[Leave_Of_Absence_Begin_Date] [datetime] NULL,
	[Leave_Of_Absence_End_Date] [datetime] NULL,
	[Payroll_Begin_Date] [date] NULL,
	[Payroll_End_Date] [varchar](50) NULL,
	[Cost_Center_1_Code] [varchar](50) NULL,
	[Cost_Center_2_Code] [varchar](50) NULL,
	[Cost_Center_3_Code] [varchar](50) NULL,
	[Plan_Earnings] [decimal](18, 2) NULL,
	[Excluded_Earnings] [decimal](18, 2) NULL,
	[Section_125] [varchar](100) NULL,
	[Loan_Additional_Principal_Payments] [decimal](18, 2) NULL,
	[Loan_Number] [bigint] NULL,
	[Rollover] [decimal](18, 2) NULL,
	[Rollover_Roth] [decimal](18, 2) NULL,
	[YTD_Gross_Earnings] [decimal](18, 2) NULL,
	[Plan_YTD_Earnings] [decimal](18, 2) NULL,
	[Plan_YTD_Hours] [decimal](18, 2) NULL,
	[Plan_YTD_Excluded_Earnings] [decimal](18, 2) NULL,
	[Plan_YTD_Section_125] [varchar](100) NULL,
	[Plan_YTD_Employee_Deferral] [decimal](18, 2) NULL,
	[Plan_YTD_Employee_Roth] [decimal](18, 2) NULL,
	[Plan_YTD_Employee_After_Tax] [decimal](18, 2) NULL,
	[Plan_YTD_Loan_Payments] [decimal](18, 2) NULL,
	[Plan_YTD_Loan_Number] [bigint] NULL,
	[Plan_YTD_Employer_Match] [decimal](18, 2) NULL,
	[Plan_YTD_Safe_Harbor_Match] [decimal](18, 2) NULL,
	[Plan_YTD_Qualified_Matching_Contribution] [decimal](18, 2) NULL,
	[Plan_YTD_Safe_Harbor_Non_Elective] [decimal](18, 2) NULL,
	[Plan_YTD_Qualified_Non_Elective_Contribution] [decimal](18, 2) NULL,
	[Plan_YTD_Profit_Sharing] [decimal](18, 2) NULL,
	[Plan_YTD_Money_Purchase] [decimal](18, 2) NULL,
	[Plan_YTD_Rollover] [decimal](18, 2) NULL,
	[Plan_YTD_Rollover_Roth] [decimal](18, 2) NULL,
	[Plan_ID] [varchar](30) NULL,
	[Plan_Name] [varchar](100) NULL,
	[Investment_Election] [varchar](100) NULL,
	[Investment_Change_Date] [date] NULL,
	[Recipient_Vendor_Plan_ID] [varchar](30) NULL,
	[Detail] [varchar](500) NULL,
	[Employer_EIN] [int] NULL,
	[Employer_Name] [varchar](100) NULL,
	[Employer_Plan_ID] [int] NULL,
	[Employer_Sub_Plan_ID] [int] NULL,
	[Originating_Vendor_ID] [int] NULL,
	[Originating_Vendor_Sub_Plan_ID] [int] NULL,
	[Recipient_Vendor_Sub_Plan_ID] [int] NULL,
	[Type_of_Account] [varchar](50) NULL,
	[HR_Area_Or_Location_Code] [varchar](250) NULL,
	[HR_Sub_Area] [varchar](250) NULL,
	[Adjusted_Date_of_Hire] [date] NULL,
	[Payroll_Mode] [varchar](50) NULL,
	[Contribution_Source_Code_1] [varchar](50) NULL,
	[Contribution_Source_Amount_1] [decimal](18, 2) NULL,
	[Contribution_Source_Code_2] [varchar](50) NULL,
	[Contribution_Source_Amount_2] [decimal](18, 2) NULL,
	[Contribution_Source_Code_3] [varchar](50) NULL,
	[Contribution_Source_Amount_3] [decimal](18, 2) NULL,
	[Contribution_Source_Code_4] [varchar](50) NULL,
	[Contribution_Source_Amount_4] [decimal](18, 2) NULL,
	[Contribution_Source_Code_5] [varchar](50) NULL,
	[Contribution_Source_Amount_5] [decimal](18, 2) NULL,
	[Contribution_Source_Code_6] [varchar](50) NULL,
	[Contribution_Source_Amount_6] [decimal](18, 2) NULL,
	[Contribution_Source_Code_7] [varchar](50) NULL,
	[Contribution_Source_Amount_7] [decimal](18, 2) NULL,
	[Contribution_Source_Code_8] [varchar](50) NULL,
	[Contribution_Source_Amount_8] [decimal](18, 2) NULL,
	[Final_Contribution_Indicator] [varchar](50) NULL,
	[Loan_Number_1] [bigint] NULL,
	[Loan_Repayment_Amount_1] [decimal](18, 2) NULL,
	[Loan_Number_2] [bigint] NULL,
	[Loan_Repayment_Amout_2] [decimal](18, 2) NULL,
	[Loan_Number_3] [bigint] NULL,
	[Loan_Repayment_Amount_3] [decimal](18, 2) NULL,
	[Loan_Number_4] [bigint] NULL,
	[Loan_Repayment_Amount_4] [decimal](18, 2) NULL,
	[Loan_Number_5] [bigint] NULL,
	[Loan_Repayment_Amount_5] [decimal](18, 2) NULL,
	[OMNI_Field_52] [varchar](100) NULL,
	[OMNI_Field_53] [varchar](100) NULL,
	[OMNI_Field_54] [varchar](100) NULL,
	[OMNI_Field_55] [varchar](100) NULL,
	[OMNI_Field_56] [varchar](100) NULL,
	[OMNI_Field_57] [varchar](100) NULL,
	[OMNI_Field_58] [varchar](100) NULL,
	[OMNI_Field_59] [varchar](100) NULL,
	[OMNI_Field_60] [varchar](100) NULL,
	[OMNI_Field_61] [varchar](100) NULL,
	[OMNI_Field_62] [varchar](100) NULL,
	[OMNI_Field_63] [varchar](100) NULL,
	[OMNI_Field_64] [varchar](100) NULL,
	[OMNI_Field_65] [varchar](100) NULL,
	[OMNI_Field_66] [varchar](100) NULL,
	[OMNI_Field_67] [varchar](100) NULL,
	[Record_Level_1] [int] NULL,
	[Record_Level_1_Vendor] [varchar](100) NULL,
	[Record_Level_1_File_Release_Time] [time](7) NULL,
	[Record_Level_1_Total_Amount_in_File] [decimal](18, 2) NULL,
	[Record_Level_1_Number_of_Contributions] [int] NULL,
	[Record_Level_1_Datetime] [datetime] NULL,
	[Record_Level_1_Number_of_Participants] [int] NULL,
	[Record_Level_2] [int] NULL,
	[Record_Level_2_Plan_Name] [varchar](100) NULL,
	[Record_Level_2_Remitter_Plan_Code] [varchar](100) NULL,
	[Record_Level_2_Column_D] [varchar](100) NULL,
	[Record_Level_2_Column_E] [varchar](100) NULL,
	[Record_Level_2_Payroll_Date] [varchar](50) NULL,
	[Record_Level_2_Total_Amount_in_Plan] [decimal](18, 2) NULL,
	[Record_Level_2_Number_of_Participants] [int] NULL,
	[Record_Level_3] [int] NULL,
	[Record_Level_3_SSN] [varchar](10) NULL,
	[Record_Level_3_Last_Name] [varchar](100) NULL,
	[Record_Level_3_First_Name] [varchar](100) NULL,
	[Record_Level_3_Remitter_Plan_Code] [varchar](100) NULL,
	[Record_Level_3_Remittance_Type] [varchar](100) NULL,
	[Record_Level_3_Source_Code] [varchar](100) NULL,
	[Record_Level_3_Number_of_Participants] [int] NULL,
	[Record_Level_3_Column_I] [varchar](50) NULL,
	[Record_Level_3_Amount] [decimal](18, 2) NULL,
	[Record_Level_4] [int] NULL,
	[Record_Level_4_Plan_Name] [varchar](100) NULL,
	[Record_Level_4_Remitter_Plan_Code] [varchar](100) NULL,
	[Record_Level_4_Column_D] [varchar](100) NULL,
	[Record_Level_4_Column_E] [varchar](100) NULL,
	[Record_Level_4_Payroll_Date] [date] NULL,
	[Record_Level_4_Total_Amount_in_Plan] [decimal](18, 2) NULL,
	[Record_Level_4_Number_of_Participants] [int] NULL,
	[Record_Level_5] [int] NULL,
	[Record_Level_5_Vendor] [varchar](100) NULL,
	[Record_Level_5_File_Release_Time] [time](7) NULL,
	[Record_Level_5_Total_Amount_in_File] [decimal](18, 2) NULL,
	[Record_Level_5_Number_of_Contributions] [int] NULL,
	[Record_Level_5_Datetime] [datetime] NULL,
	[Record_Level_5_Number_of_Participants] [int] NULL,
	[Remittance_Type] [varchar](100) NULL,
	[Contribution_Rate] [decimal](18, 2) NULL,
	[Loan_Balance] [decimal](18, 2) NULL,
	[Comments] [varchar](100) NULL,
	[Header_Column_1] [varchar](100) NULL,
	[Header_Column_2] [varchar](100) NULL,
	[Header_Column_3] [varchar](100) NULL,
	[Header_Column_4] [varchar](100) NULL,
	[Header_Column_5] [varchar](100) NULL,
	[Header_Column_6] [varchar](100) NULL,
	[Header_Column_7] [varchar](100) NULL,
	[Header_Column_8] [varchar](100) NULL,
	[Header_Column_9] [varchar](100) NULL,
	[Header_Column_10] [varchar](100) NULL,
	[Footer_Column_1] [varchar](100) NULL,
	[Footer_Column_2] [varchar](100) NULL,
	[Footer_Column_3] [varchar](100) NULL,
	[Footer_Column_4] [varchar](100) NULL,
	[Footer_Column_5] [varchar](100) NULL,
	[Footer_Column_6] [varchar](100) NULL,
	[Footer_Column_7] [varchar](100) NULL,
	[Footer_Column_8] [varchar](100) NULL,
	[Footer_Column_9] [varchar](100) NULL,
	[Footer_Column_10] [varchar](100) NULL,
	[OMNI_Field_50] [varchar](100) NULL,
	[OMNI_Field_51] [varchar](100) NULL,
	[PAYLOCITY_Field_71] [varchar](100) NULL,
	[PAYLOCITY_Field_72] [varchar](100) NULL,
	[PAYLOCITY_Field_73] [varchar](100) NULL,
	[PAYLOCITY_Field_74] [varchar](100) NULL,
	[Status] [varchar](100) NULL,
	[Annual_Salary] [decimal](18, 2) NULL,
	[Employee_Badge_Clock_Number] [varchar](100) NULL,
	[Employee_EEOClass] [varchar](100) NULL,
	[Employee_Job_Title] [varchar](100) NULL,
	[Employee_Position] [varchar](100) NULL,
	[Employee_Supervisor] [varchar](100) NULL,
	[Employee_Supervisor_ID] [varchar](100) NULL,
	[Employee_Type] [varchar](100) NULL,
	[Employee_Tax_Form] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Staging_Contribution_Data_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Staging_Temp_Data]    Script Date: 3/12/2021 8:49:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Staging_Temp_Data](
	[Landing_Contribution_Data_ID] [bigint] NULL,
	[File_received_ID] [int] NULL,
	[Inbound_File_Setup_ID] [int] NULL,
	[Company_Code] [varchar](50) NULL,
	[Check_Date] [date] NULL,
	[SSN] [varchar](50) NULL,
	[First_Name] [varchar](50) NULL,
	[Middle_Name] [varchar](50) NULL,
	[Last_Name] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[Employee_ID] [varchar](50) NULL,
	[Gender] [varchar](20) NULL,
	[Employee_Status] [varchar](30) NULL,
	[Marital_Status] [varchar](20) NULL,
	[Division_Code] [varchar](50) NULL,
	[Union_Status] [varchar](50) NULL,
	[Address_1] [varchar](250) NULL,
	[Address_2] [varchar](250) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[Zip] [varchar](50) NULL,
	[Birth_Date] [date] NULL,
	[Hire_Date] [date] NULL,
	[Termination_Date] [date] NULL,
	[Rehire_Date] [date] NULL,
	[Gross_Earnings] [decimal](18, 2) NULL,
	[Pay_Period_Hours] [decimal](18, 2) NULL,
	[Employee_Deferral] [decimal](18, 2) NULL,
	[Employee_Roth] [decimal](18, 2) NULL,
	[Loan_Payments] [decimal](18, 2) NULL,
	[Employee_After_Tax] [decimal](18, 2) NULL,
	[Employer_Match] [decimal](18, 2) NULL,
	[Safe_Harbor_Match] [decimal](18, 2) NULL,
	[Safe_Harbor_Non_Elective] [decimal](18, 2) NULL,
	[Qualified_Matching_Contribution] [decimal](18, 2) NULL,
	[Qualified_Non_Elective_Contribution] [decimal](18, 2) NULL,
	[Profit_Sharing] [decimal](18, 2) NULL,
	[Money_Purchase] [decimal](18, 2) NULL,
	[Pay_Frequency] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone_Number] [varchar](50) NULL,
	[Pay_Type] [varchar](50) NULL,
	[Adjusted_Seniority_Date] [date] NULL,
	[Leave_Of_Absence_Begin_Date] [datetime] NULL,
	[Leave_Of_Absence_End_Date] [datetime] NULL,
	[Payroll_Begin_Date] [date] NULL,
	[Payroll_End_Date] [date] NULL,
	[Cost_Center_1_Code] [varchar](50) NULL,
	[Cost_Center_2_Code] [varchar](50) NULL,
	[Cost_Center_3_Code] [varchar](50) NULL,
	[Plan_Earnings] [decimal](18, 2) NULL,
	[Excluded_Earnings] [decimal](18, 2) NULL,
	[Section_125] [varchar](100) NULL,
	[Loan_Additional_Principal_Payments] [decimal](18, 2) NULL,
	[Loan_Number] [bigint] NULL,
	[Rollover] [decimal](18, 2) NULL,
	[Rollover_Roth] [decimal](18, 2) NULL,
	[YTD_Gross_Earnings] [decimal](18, 2) NULL,
	[Plan_YTD_Earnings] [decimal](18, 2) NULL,
	[Plan_YTD_Hours] [decimal](18, 2) NULL,
	[Plan_YTD_Excluded_Earnings] [decimal](18, 2) NULL,
	[Plan_YTD_Section_125] [varchar](100) NULL,
	[Plan_YTD_Employee_Deferral] [decimal](18, 2) NULL,
	[Plan_YTD_Employee_Roth] [decimal](18, 2) NULL,
	[Plan_YTD_Employee_After_Tax] [decimal](18, 2) NULL,
	[Plan_YTD_Loan_Payments] [decimal](18, 2) NULL,
	[Plan_YTD_Loan_Number] [bigint] NULL,
	[Plan_YTD_Employer_Match] [decimal](18, 2) NULL,
	[Plan_YTD_Safe_Harbor_Match] [decimal](18, 2) NULL,
	[Plan_YTD_Qualified_Matching_Contribution] [decimal](18, 2) NULL,
	[Plan_YTD_Safe_Harbor_Non_Elective] [decimal](18, 2) NULL,
	[Plan_YTD_Qualified_Non_Elective_Contribution] [decimal](18, 2) NULL,
	[Plan_YTD_Profit_Sharing] [decimal](18, 2) NULL,
	[Plan_YTD_Money_Purchase] [decimal](18, 2) NULL,
	[Plan_YTD_Rollover] [decimal](18, 2) NULL,
	[Plan_YTD_Rollover_Roth] [decimal](18, 2) NULL,
	[Plan_ID] [varchar](30) NULL,
	[Plan_Name] [varchar](100) NULL,
	[Investment_Election] [varchar](100) NULL,
	[Investment_Change_Date] [date] NULL,
	[Recipient_Vendor_Plan_ID] [varchar](30) NULL,
	[Detail] [varchar](500) NULL,
	[Employer_EIN] [int] NULL,
	[Employer_Name] [varchar](100) NULL,
	[Employer_Plan_ID] [int] NULL,
	[Employer_Sub_Plan_ID] [int] NULL,
	[Originating_Vendor_ID] [int] NULL,
	[Originating_Vendor_Sub_Plan_ID] [int] NULL,
	[Recipient_Vendor_Sub_Plan_ID] [int] NULL,
	[Type_of_Account] [varchar](50) NULL,
	[HR_Area_Or_Location_Code] [varchar](250) NULL,
	[HR_Sub_Area] [varchar](250) NULL,
	[Adjusted_Date_of_Hire] [date] NULL,
	[Payroll_Mode] [varchar](50) NULL,
	[Contribution_Source_Code_1] [varchar](50) NULL,
	[Contribution_Source_Amount_1] [decimal](18, 2) NULL,
	[Contribution_Source_Code_2] [varchar](50) NULL,
	[Contribution_Source_Amount_2] [decimal](18, 2) NULL,
	[Contribution_Source_Code_3] [varchar](50) NULL,
	[Contribution_Source_Amount_3] [decimal](18, 2) NULL,
	[Contribution_Source_Code_4] [varchar](50) NULL,
	[Contribution_Source_Amount_4] [decimal](18, 2) NULL,
	[Contribution_Source_Code_5] [varchar](50) NULL,
	[Contribution_Source_Amount_5] [decimal](18, 2) NULL,
	[Contribution_Source_Code_6] [varchar](50) NULL,
	[Contribution_Source_Amount_6] [decimal](18, 2) NULL,
	[Contribution_Source_Code_7] [varchar](50) NULL,
	[Contribution_Source_Amount_7] [decimal](18, 2) NULL,
	[Contribution_Source_Code_8] [varchar](50) NULL,
	[Contribution_Source_Amount_8] [decimal](18, 2) NULL,
	[Final_Contribution_Indicator] [varchar](50) NULL,
	[Loan_Number_1] [bigint] NULL,
	[Loan_Repayment_Amount_1] [decimal](18, 2) NULL,
	[Loan_Number_2] [bigint] NULL,
	[Loan_Repayment_Amout_2] [decimal](18, 2) NULL,
	[Loan_Number_3] [bigint] NULL,
	[Loan_Repayment_Amount_3] [decimal](18, 2) NULL,
	[Loan_Number_4] [bigint] NULL,
	[Loan_Repayment_Amount_4] [decimal](18, 2) NULL,
	[Loan_Number_5] [bigint] NULL,
	[Loan_Repayment_Amount_5] [decimal](18, 2) NULL,
	[OMNI_Field_52] [varchar](100) NULL,
	[OMNI_Field_53] [varchar](100) NULL,
	[OMNI_Field_54] [varchar](100) NULL,
	[OMNI_Field_55] [varchar](100) NULL,
	[OMNI_Field_56] [varchar](100) NULL,
	[OMNI_Field_57] [varchar](100) NULL,
	[OMNI_Field_58] [varchar](100) NULL,
	[OMNI_Field_59] [varchar](100) NULL,
	[OMNI_Field_60] [varchar](100) NULL,
	[OMNI_Field_61] [varchar](100) NULL,
	[OMNI_Field_62] [varchar](100) NULL,
	[OMNI_Field_63] [varchar](100) NULL,
	[OMNI_Field_64] [varchar](100) NULL,
	[OMNI_Field_65] [varchar](100) NULL,
	[OMNI_Field_66] [varchar](100) NULL,
	[OMNI_Field_67] [varchar](100) NULL,
	[Record_Level_1] [int] NULL,
	[Record_Level_1_Vendor] [varchar](100) NULL,
	[Record_Level_1_File_Release_Time] [time](7) NULL,
	[Record_Level_1_Total_Amount_in_File] [decimal](18, 2) NULL,
	[Record_Level_1_Number_of_Contributions] [int] NULL,
	[Record_Level_1_Datetime] [datetime] NULL,
	[Record_Level_1_Number_of_Participants] [int] NULL,
	[Record_Level_2] [int] NULL,
	[Record_Level_2_Plan_Name] [varchar](100) NULL,
	[Record_Level_2_Remitter_Plan_Code] [varchar](100) NULL,
	[Record_Level_2_Column_D] [varchar](100) NULL,
	[Record_Level_2_Column_E] [varchar](100) NULL,
	[Record_Level_2_Payroll_Date] [date] NULL,
	[Record_Level_2_Total_Amount_in_Plan] [decimal](18, 2) NULL,
	[Record_Level_2_Number_of_Participants] [int] NULL,
	[Record_Level_3] [int] NULL,
	[Record_Level_3_SSN] [varchar](10) NULL,
	[Record_Level_3_Last_Name] [varchar](100) NULL,
	[Record_Level_3_First_Name] [varchar](100) NULL,
	[Record_Level_3_Remitter_Plan_Code] [varchar](100) NULL,
	[Record_Level_3_Remittance_Type] [varchar](100) NULL,
	[Record_Level_3_Source_Code] [varchar](100) NULL,
	[Record_Level_3_Number_of_Participants] [int] NULL,
	[Record_Level_3_Column_I] [varchar](50) NULL,
	[Record_Level_3_Amount] [decimal](18, 2) NULL,
	[Record_Level_4] [int] NULL,
	[Record_Level_4_Plan_Name] [varchar](100) NULL,
	[Record_Level_4_Remitter_Plan_Code] [varchar](100) NULL,
	[Record_Level_4_Column_D] [varchar](100) NULL,
	[Record_Level_4_Column_E] [varchar](100) NULL,
	[Record_Level_4_Payroll_Date] [date] NULL,
	[Record_Level_4_Total_Amount_in_Plan] [decimal](18, 2) NULL,
	[Record_Level_4_Number_of_Participants] [int] NULL,
	[Record_Level_5] [int] NULL,
	[Record_Level_5_Vendor] [varchar](100) NULL,
	[Record_Level_5_File_Release_Time] [time](7) NULL,
	[Record_Level_5_Total_Amount_in_File] [decimal](18, 2) NULL,
	[Record_Level_5_Number_of_Contributions] [int] NULL,
	[Record_Level_5_Datetime] [datetime] NULL,
	[Record_Level_5_Number_of_Participants] [int] NULL,
	[Remittance_Type] [varchar](100) NULL,
	[Contribution_Rate] [decimal](18, 2) NULL,
	[Loan_Balance] [decimal](18, 2) NULL,
	[Comments] [varchar](100) NULL,
	[Header_Column_1] [varchar](100) NULL,
	[Header_Column_2] [varchar](100) NULL,
	[Header_Column_3] [varchar](100) NULL,
	[Header_Column_4] [varchar](100) NULL,
	[Header_Column_5] [varchar](100) NULL,
	[Header_Column_6] [varchar](100) NULL,
	[Header_Column_7] [varchar](100) NULL,
	[Header_Column_8] [varchar](100) NULL,
	[Header_Column_9] [varchar](100) NULL,
	[Header_Column_10] [varchar](100) NULL,
	[Footer_Column_1] [varchar](100) NULL,
	[Footer_Column_2] [varchar](100) NULL,
	[Footer_Column_3] [varchar](100) NULL,
	[Footer_Column_4] [varchar](100) NULL,
	[Footer_Column_5] [varchar](100) NULL,
	[Footer_Column_6] [varchar](100) NULL,
	[Footer_Column_7] [varchar](100) NULL,
	[Footer_Column_8] [varchar](100) NULL,
	[Footer_Column_9] [varchar](100) NULL,
	[Footer_Column_10] [varchar](100) NULL,
	[OMNI_Field_50] [varchar](100) NULL,
	[OMNI_Field_51] [varchar](100) NULL,
	[PAYLOCITY_Field_71] [varchar](100) NULL,
	[PAYLOCITY_Field_72] [varchar](100) NULL,
	[PAYLOCITY_Field_73] [varchar](100) NULL,
	[PAYLOCITY_Field_74] [varchar](100) NULL,
	[Status] [varchar](100) NULL,
	[Annual_Salary] [decimal](18, 2) NULL,
	[Employee_Badge_Clock_Number] [varchar](100) NULL,
	[Employee_EEOClass] [varchar](100) NULL,
	[Employee_Job_Title] [varchar](100) NULL,
	[Employee_Position] [varchar](100) NULL,
	[Employee_Supervisor] [varchar](100) NULL,
	[Employee_Supervisor_ID] [varchar](100) NULL,
	[Employee_Type] [varchar](100) NULL,
	[Employee_Tax_Form] [varchar](100) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Data_Error_Log] ADD  DEFAULT ('N') FOR [Error_Status]
GO
ALTER TABLE [dbo].[tbl_Enumeration_Data] ADD  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  StoredProcedure [dbo].[SP_Clean_Staging_Temp_Data]    Script Date: 3/12/2021 8:49:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Clean_Staging_Temp_Data]
(
@FileReceivedID varchar(30)
)
As
Begin

Delete from dbo.tbl_Staging_Temp_Data where File_received_ID=@FileReceivedID

Select 1

End
GO
/****** Object:  StoredProcedure [dbo].[SP_LandingTable_Status_Update]    Script Date: 3/12/2021 8:49:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_LandingTable_Status_Update]
(
 @filereceivedID varchar(50)
)

As
Begin
--------------UpdateStatusOfLandingTable
Update tbl_Landing_Contribution_Data
 set Status='Validation Successful'
 where Status is NULL and  file_received_id=@filereceivedID

 

 Select 1

 End
GO
/****** Object:  StoredProcedure [dbo].[SP_PreTransform_Validations]    Script Date: 3/12/2021 8:49:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[SP_PreTransform_Validations]
(
   @filereceivedID varchar(30)

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
	where  file_received_id = @filereceivedID
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Gross_Earnings','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Pay_Period_Hours','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Employee_Deferral','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Employee_Roth','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Loan_Payments','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Employee_After_Tax','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Employer_Match','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Safe_Harbor_Match','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Safe_Harbor_Non_Elective','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Qualified_Matching_Contribution','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Qualified_Non_Elective_Contribution','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Profit_Sharing','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Money_Purchase','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Contribution_Source_Amount_1','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Contribution_Source_Amount_2','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Contribution_Source_Amount_3','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Contribution_Source_Amount_4','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Contribution_Source_Amount_5','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Contribution_Source_Amount_6','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Contribution_Source_Amount_7','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Contribution_Source_Amount_8','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Loan_Repayment_Amount_1','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Loan_Repayment_Amout_2','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Loan_Repayment_Amount_3','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Loan_Repayment_Amount_4','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Loan_Repayment_Amount_5','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
	 ([Landing_Contribution_Data_ID] ,[Error_Type],[Error_Description],[Error_Column_Name],[Created_By],[Created_Date],[Updated_By],[Updated_date],[File_received_ID])
	 values(@LandingID,'ERROR','Not A Number','Record_Level_3_Amount','SYSTEM',Getdate(),'SYSTEM',Getdate(),@filereceivedID);
	  
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
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Formatted_Data]    Script Date: 3/12/2021 8:49:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Select_Formatted_Data]
(
@FileReceivedID varchar(30)
)
As
Begin

SELECT SD.[Landing_Contribution_Data_ID]
      ,SD.[File_received_ID]
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
  where SD.[File_received_ID]=@FileReceivedID and LC.status in('Validation Successful')

  End
  
GO
ALTER DATABASE [pcs-sqldb-Ingestion-payroll360-dev] SET  READ_WRITE 
GO
