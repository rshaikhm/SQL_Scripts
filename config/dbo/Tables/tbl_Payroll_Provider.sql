CREATE TABLE [dbo].[tbl_Payroll_Provider] (
    [Payroll_Provider_ID]         INT                                                IDENTITY (1, 1) NOT NULL,
    [Payroll_Provider_Type_LK_ID] INT                                                NULL,
    [Payroll_Provider_Name]       VARCHAR (50)                                       NULL,
    [IsActive]                    TINYINT                                            DEFAULT ((1)) NULL,
    [Created_By]                  VARCHAR (50)                                       NULL,
    [Updated_By]                  VARCHAR (50)                                       NULL,
    [Created_Date]                DATETIME                                           NULL,
    [Updated_Date]                DATETIME                                           NULL,
    [SysStartTime]                DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN CONSTRAINT [DF_SysStartpp] DEFAULT (sysutcdatetime()) NOT NULL,
    [SysEndTime]                  DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   CONSTRAINT [DF_SysEndpp] DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    [Payroll_Provider_Code]       VARCHAR (30)                                       NULL,
    PRIMARY KEY CLUSTERED ([Payroll_Provider_ID] ASC),
    FOREIGN KEY ([Payroll_Provider_Type_LK_ID]) REFERENCES [dbo].[tbl_Lookup] ([Lookup_ID]),
    PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[History_Payroll_Provider], DATA_CONSISTENCY_CHECK=ON));

