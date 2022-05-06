CREATE TABLE [dbo].[tbl_File_Received] (
    [File_Received_ID]        INT                                                IDENTITY (1, 1) NOT NULL,
    [File_Name]               VARCHAR (250)                                      NULL,
    [Received_Date_And_Time]  DATETIME                                           NULL,
    [Inbound_Source_Setup_ID] INT                                                NULL,
    [Loaded_By]               VARCHAR (150)                                      NULL,
    [File_Type_LK_ID]         INT                                                NULL,
    [As_OF_Date]              DATETIME                                           NULL,
    [Status]                  VARCHAR (50)                                       NULL,
    [Created_By]              VARCHAR (50)                                       NULL,
    [Created_Date]            DATETIME                                           NULL,
    [Updated_By]              VARCHAR (50)                                       NULL,
    [Updated_Date]            DATETIME                                           NULL,
    [SysStartTime]            DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN CONSTRAINT [DF_SysStartfr] DEFAULT (sysutcdatetime()) NOT NULL,
    [SysEndTime]              DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   CONSTRAINT [DF_SysEndfr] DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    [Actual_File]             VARCHAR (1000)                                     NULL,
    PRIMARY KEY CLUSTERED ([File_Received_ID] ASC),
    FOREIGN KEY ([File_Type_LK_ID]) REFERENCES [dbo].[tbl_Lookup] ([Lookup_ID]),
    PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[MSSQL_TemporalHistoryFor_930102354_94B7404A], DATA_CONSISTENCY_CHECK=ON));

