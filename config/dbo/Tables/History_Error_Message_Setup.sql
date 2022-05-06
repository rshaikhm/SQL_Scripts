CREATE TABLE [dbo].[History_Error_Message_Setup] (
    [Error_Message_Setup_ID] INT           NOT NULL,
    [Error_Date]             DATETIME      NULL,
    [Error_ID]               INT           NULL,
    [Error_Name]             VARCHAR (500) NULL,
    [Error_Type]             VARCHAR (50)  NULL,
    [Created_By]             VARCHAR (50)  NULL,
    [Updated_By]             VARCHAR (50)  NULL,
    [Created_Date]           DATETIME      NULL,
    [Updated_Date]           DATETIME      NULL,
    [SysStartTime]           DATETIME2 (7) NOT NULL,
    [SysEndTime]             DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_History_Error_Message_Setup]
    ON [dbo].[History_Error_Message_Setup]([SysEndTime] ASC, [SysStartTime] ASC) WITH (DATA_COMPRESSION = PAGE);

