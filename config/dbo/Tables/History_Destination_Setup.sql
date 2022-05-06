CREATE TABLE [dbo].[History_Destination_Setup] (
    [Destination_Setup_ID]    INT           NOT NULL,
    [Destination_URL]         VARCHAR (500) NULL,
    [User_ID]                 VARCHAR (50)  NULL,
    [Password]                VARCHAR (50)  NULL,
    [connection_port]         VARCHAR (100) NULL,
    [destination_folder_path] VARCHAR (500) NULL,
    [Error_Folder_Path]       VARCHAR (50)  NULL,
    [SysStartTime]            DATETIME2 (7) NOT NULL,
    [SysEndTime]              DATETIME2 (7) NOT NULL,
    [Created_By]              VARCHAR (100) NULL,
    [Created_Date]            DATETIME      NULL,
    [Updated_By]              VARCHAR (100) NULL,
    [Updated_Date]            DATETIME      NULL
);


GO
CREATE CLUSTERED INDEX [ix_History_Destination_Setup]
    ON [dbo].[History_Destination_Setup]([SysEndTime] ASC, [SysStartTime] ASC) WITH (DATA_COMPRESSION = PAGE);

