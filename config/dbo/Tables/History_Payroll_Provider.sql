CREATE TABLE [dbo].[History_Payroll_Provider] (
    [Payroll_Provider_ID]         INT           NOT NULL,
    [Payroll_Provider_Type_LK_ID] INT           NULL,
    [Payroll_Provider_Name]       VARCHAR (50)  NULL,
    [IsActive]                    TINYINT       NULL,
    [Created_By]                  VARCHAR (50)  NULL,
    [Updated_By]                  VARCHAR (50)  NULL,
    [Created_Date]                DATETIME      NULL,
    [Updated_Date]                DATETIME      NULL,
    [SysStartTime]                DATETIME2 (7) NOT NULL,
    [SysEndTime]                  DATETIME2 (7) NOT NULL,
    [Payroll_Provider_Code]       VARCHAR (30)  NULL
);


GO
CREATE CLUSTERED INDEX [ix_History_Payroll_Provider]
    ON [dbo].[History_Payroll_Provider]([SysEndTime] ASC, [SysStartTime] ASC) WITH (DATA_COMPRESSION = PAGE);

