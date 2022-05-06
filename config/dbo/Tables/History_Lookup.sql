CREATE TABLE [dbo].[History_Lookup] (
    [Lookup_ID]       INT           NOT NULL,
    [Lookup_Code]     VARCHAR (50)  NULL,
    [Organisation_ID] INT           NULL,
    [Set_Name]        VARCHAR (100) NULL,
    [Short_Name]      VARCHAR (100) NULL,
    [Long_Name]       VARCHAR (200) NULL,
    [Print_Lookup_ID] INT           NULL,
    [Sort_Order]      TINYINT       NULL,
    [Category]        VARCHAR (50)  NULL,
    [System_YN]       CHAR (1)      NULL,
    [IsActive]        CHAR (1)      NULL,
    [Created_By]      VARCHAR (50)  NULL,
    [Created_Date]    DATETIME      NULL,
    [Updated_By]      VARCHAR (50)  NULL,
    [Updated_date]    DATETIME      NULL,
    [SysStartTime]    DATETIME2 (7) NOT NULL,
    [SysEndTime]      DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_History_Lookup]
    ON [dbo].[History_Lookup]([SysEndTime] ASC, [SysStartTime] ASC) WITH (DATA_COMPRESSION = PAGE);

