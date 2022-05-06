CREATE TABLE [dbo].[tbl_Destination_Setup] (
    [Destination_Setup_ID]    INT                                                IDENTITY (1, 1) NOT NULL,
    [Destination_URL]         VARCHAR (500)                                      NULL,
    [User_ID]                 VARCHAR (50)                                       NULL,
    [Password]                VARCHAR (50)                                       NULL,
    [connection_port]         VARCHAR (100)                                      NULL,
    [destination_folder_path] VARCHAR (500)                                      NULL,
    [Error_Folder_Path]       VARCHAR (50)                                       NULL,
    [SysStartTime]            DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN CONSTRAINT [DF_SysStartds] DEFAULT (sysutcdatetime()) NOT NULL,
    [SysEndTime]              DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   CONSTRAINT [DF_SysEndds] DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    [Created_By]              VARCHAR (100)                                      NULL,
    [Created_Date]            DATETIME                                           NULL,
    [Updated_By]              VARCHAR (100)                                      NULL,
    [Updated_Date]            DATETIME                                           NULL,
    PRIMARY KEY CLUSTERED ([Destination_Setup_ID] ASC),
    PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[History_Destination_Setup], DATA_CONSISTENCY_CHECK=ON));

