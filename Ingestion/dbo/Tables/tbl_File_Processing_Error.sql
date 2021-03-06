CREATE TABLE [dbo].[tbl_File_Processing_Error] (
    [File_Processing_Error_ID]                     INT             NOT NULL,
    [Landing_Contribution_Data_ID]                 INT             NULL,
    [Staging_Contribution_Data_ID]                 INT             NULL,
    [File_received_ID]                             INT             NULL,
    [Inbound_File_Setup_ID]                        INT             NULL,
    [Attribute]                                    VARCHAR (50)    NULL,
    [Check_Date]                                   DATETIME        NULL,
    [SSN]                                          BIGINT          NULL,
    [First_Name]                                   VARCHAR (50)    NULL,
    [Middle_Name]                                  VARCHAR (50)    NULL,
    [Last_Name]                                    VARCHAR (50)    NULL,
    [Title]                                        VARCHAR (50)    NULL,
    [Employee_ID]                                  VARCHAR (50)    NULL,
    [Gender]                                       VARCHAR (20)    NULL,
    [Employee_Status]                              VARCHAR (30)    NULL,
    [Marital_Status]                               VARCHAR (20)    NULL,
    [Company_Or_Division_Code]                     VARCHAR (50)    NULL,
    [Union_Status]                                 VARCHAR (50)    NULL,
    [Address_1]                                    VARCHAR (250)   NULL,
    [Address_2]                                    VARCHAR (250)   NULL,
    [City]                                         VARCHAR (100)   NULL,
    [State]                                        VARCHAR (100)   NULL,
    [Zip]                                          BIGINT          NULL,
    [Birth_Date]                                   DATE            NULL,
    [Hire_Date]                                    DATE            NULL,
    [Termination_Date]                             DATE            NULL,
    [Rehire_Date]                                  DATE            NULL,
    [Gross_Earnings]                               DECIMAL (18, 2) NULL,
    [Pay_Period_Hours]                             DECIMAL (18, 2) NULL,
    [Employee_Deferral]                            DECIMAL (18, 2) NULL,
    [Employee_Roth]                                DECIMAL (18, 2) NULL,
    [Loan_Payments]                                DECIMAL (18, 2) NULL,
    [Employee_After_Tax]                           DECIMAL (18, 2) NULL,
    [Employer_Match]                               DECIMAL (18, 2) NULL,
    [Safe_Harbor_Match]                            DECIMAL (18, 2) NULL,
    [Safe_Harbor_Non_Elective]                     DECIMAL (18, 2) NULL,
    [Qualified_Matching_Contribution]              DECIMAL (18, 2) NULL,
    [Qualified_Non_Elective_Contribution]          DECIMAL (18, 2) NULL,
    [Profit_Sharing]                               DECIMAL (18, 2) NULL,
    [Money_Purchase]                               DECIMAL (18, 2) NULL,
    [Pay_Frequency]                                VARCHAR (50)    NULL,
    [Email]                                        VARCHAR (50)    NULL,
    [Phone_Number]                                 VARCHAR (50)    NULL,
    [Pay_Type]                                     VARCHAR (50)    NULL,
    [Adjusted_Seniority_Date]                      DATE            NULL,
    [Leave_Of_Absence_Begin_Date]                  DATETIME        NULL,
    [Leave_Of_Absence_End_Date]                    DATETIME        NULL,
    [Payroll_Begin_Date]                           DATE            NULL,
    [Payroll_End_Date]                             DATE            NULL,
    [Cost_Center_1_Code]                           VARCHAR (50)    NULL,
    [Cost_Center_2_Code]                           VARCHAR (50)    NULL,
    [Cost_Center_3_Code]                           VARCHAR (50)    NULL,
    [Plan_Earnings]                                DECIMAL (18, 2) NULL,
    [Excluded_Earnings]                            DECIMAL (18, 2) NULL,
    [Section_125]                                  VARCHAR (100)   NULL,
    [Loan_Additional_Principal_Payments]           DECIMAL (18, 2) NULL,
    [Loan_Number]                                  BIGINT          NULL,
    [Rollover]                                     DECIMAL (18, 2) NULL,
    [Rollover_Roth]                                DECIMAL (18, 2) NULL,
    [YTD_Gross_Earnings]                           DECIMAL (18, 2) NULL,
    [Plan_YTD_Earnings]                            DECIMAL (18, 2) NULL,
    [Plan_YTD_Hours]                               DECIMAL (18, 2) NULL,
    [Plan_YTD_Excluded_Earnings]                   DECIMAL (18, 2) NULL,
    [Plan_YTD_Section_125]                         VARCHAR (100)   NULL,
    [Plan_YTD_Employee_Deferral]                   DECIMAL (18, 2) NULL,
    [Plan_YTD_Employee_Roth]                       DECIMAL (18, 2) NULL,
    [Plan_YTD_Employee_After_Tax]                  DECIMAL (18, 2) NULL,
    [Plan_YTD_Loan_Payments]                       DECIMAL (18, 2) NULL,
    [Plan_YTD_Loan_Number]                         BIGINT          NULL,
    [Plan_YTD_Employer_Match]                      DECIMAL (18, 2) NULL,
    [Plan_YTD_Safe_Harbor_Match]                   DECIMAL (18, 2) NULL,
    [Plan_YTD_Qualified_Matching_Contribution]     DECIMAL (18, 2) NULL,
    [Plan_YTD_Safe_Harbor_Non_Elective]            DECIMAL (18, 2) NULL,
    [Plan_YTD_Qualified_Non_Elective_Contribution] DECIMAL (18, 2) NULL,
    [Plan_YTD_Profit_Sharing]                      DECIMAL (18, 2) NULL,
    [Plan_YTD_Money_Purchase]                      DECIMAL (18, 2) NULL,
    [Plan_YTD_Rollover]                            DECIMAL (18, 2) NULL,
    [Plan_YTD_Rollover_Roth]                       DECIMAL (18, 2) NULL,
    [Plan_ID]                                      INT             NULL,
    [Recipient_Vendor_Plan_ID]                     INT             NULL,
    [Detail]                                       VARCHAR (200)   NULL,
    [Employer_EIN]                                 INT             NULL,
    [Employer_Name]                                VARCHAR (100)   NULL,
    [Employer_Plan_ID]                             INT             NULL,
    [Employer_Sub_Plan_ID]                         INT             NULL,
    [Originating_Vendor_ID]                        INT             NULL,
    [Originating_Vendor_Sub_Plan_ID]               INT             NULL,
    [Recipient_Vendor_Sub_Plan_ID]                 INT             NULL,
    [Type_of_Account_403b]                         VARCHAR (50)    NULL,
    [HR_Area_Or_Location_Code]                     VARCHAR (250)   NULL,
    [HR_Sub_Area]                                  VARCHAR (250)   NULL,
    [Adjusted_Date_of_Hire]                        DATE            NULL,
    [Payroll_Mode]                                 VARCHAR (50)    NULL,
    [Contribution_Source_Code_1]                   VARCHAR (50)    NULL,
    [Contribution_Source_Amount_1]                 DECIMAL (18, 2) NULL,
    [Contribution_Source_Code_2]                   VARCHAR (50)    NULL,
    [Contribution_Source_Amount_2]                 DECIMAL (18, 2) NULL,
    [Contribution_Source_Code_3]                   VARCHAR (50)    NULL,
    [Contribution_Source_Amount_3]                 DECIMAL (18, 2) NULL,
    [Contribution_Source_Code_4]                   VARCHAR (50)    NULL,
    [Contribution_Source_Amount_4]                 DECIMAL (18, 2) NULL,
    [Contribution_Source_Code_5]                   VARCHAR (50)    NULL,
    [Contribution_Source_Amount_5]                 DECIMAL (18, 2) NULL,
    [Contribution_Source_Code_6]                   VARCHAR (50)    NULL,
    [Contribution_Source_Amount_6]                 DECIMAL (18, 2) NULL,
    [Contribution_Source_Code_7]                   VARCHAR (50)    NULL,
    [Contribution_Source_Amount_7]                 DECIMAL (18, 2) NULL,
    [Contribution_Source_Code_8]                   VARCHAR (50)    NULL,
    [Contribution_Source_Amount_8]                 DECIMAL (18, 2) NULL,
    [Final_Contribution_Indicator]                 VARCHAR (50)    NULL,
    [Loan_Number_1]                                BIGINT          NULL,
    [Loan_Repayment_Amount_1]                      DECIMAL (18, 2) NULL,
    [Loan_Number_2]                                BIGINT          NULL,
    [Loan_Repayment_Amout_2]                       DECIMAL (18, 2) NULL,
    [Loan_Number_3]                                BIGINT          NULL,
    [Loan_Repayment_Amount_4]                      DECIMAL (18, 2) NULL,
    [Loan_Number_5]                                BIGINT          NULL,
    [Loan_Repayment_Amount_5]                      DECIMAL (18, 2) NULL,
    [Header_Column_1]                              VARCHAR (100)   NULL,
    [Header_Column_2]                              VARCHAR (100)   NULL,
    [Header_Column_3]                              VARCHAR (100)   NULL,
    [Header_Column_4]                              VARCHAR (100)   NULL,
    [Header_Column_5]                              VARCHAR (100)   NULL,
    [Header_Column_6]                              VARCHAR (100)   NULL,
    [Header_Column_7]                              VARCHAR (100)   NULL,
    [Header_Column_8]                              VARCHAR (100)   NULL,
    [Header_Column_9]                              VARCHAR (100)   NULL,
    [Header_Column_10]                             VARCHAR (100)   NULL,
    [Footer_Column_1]                              VARCHAR (100)   NULL,
    [Footer_Column_2]                              VARCHAR (100)   NULL,
    [Footer_Column_3]                              VARCHAR (100)   NULL,
    [Footer_Column_4]                              VARCHAR (100)   NULL,
    [Footer_Column_5]                              VARCHAR (100)   NULL,
    [Footer_Column_6]                              VARCHAR (100)   NULL,
    [Footer_Column_7]                              VARCHAR (100)   NULL,
    [Footer_Column_8]                              VARCHAR (100)   NULL,
    [Footer_Column_9]                              VARCHAR (100)   NULL,
    [Footer_Column_10]                             VARCHAR (100)   NULL,
    [Error_Remark]                                 VARCHAR (50)    NULL,
    [File_Processing_Stage]                        VARCHAR (50)    NULL,
    [Status]                                       VARCHAR (50)    NULL,
    PRIMARY KEY CLUSTERED ([File_Processing_Error_ID] ASC)
);

