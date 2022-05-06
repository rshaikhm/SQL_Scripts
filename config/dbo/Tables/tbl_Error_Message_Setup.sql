CREATE TABLE [dbo].[tbl_Error_Message_Setup] (
    [Error_Message_Setup_ID] INT                                                IDENTITY (1, 1) NOT NULL,
    [Error_Date]             DATETIME                                           NULL,
    [Error_ID]               INT                                                NULL,
    [Error_Name]             VARCHAR (500)                                      NULL,
    [Error_Type]             VARCHAR (50)                                       NULL,
    [Created_By]             VARCHAR (50)                                       NULL,
    [Updated_By]             VARCHAR (50)                                       NULL,
    [Created_Date]           DATETIME                                           NULL,
    [Updated_Date]           DATETIME                                           NULL,
    [SysStartTime]           DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN CONSTRAINT [DF_SysStartems] DEFAULT (sysutcdatetime()) NOT NULL,
    [SysEndTime]             DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   CONSTRAINT [DF_SysEndems] DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    PRIMARY KEY CLUSTERED ([Error_Message_Setup_ID] ASC),
    PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[History_Error_Message_Setup], DATA_CONSISTENCY_CHECK=ON));

