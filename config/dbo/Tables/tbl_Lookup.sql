CREATE TABLE [dbo].[tbl_Lookup] (
    [Lookup_ID]       INT                                                IDENTITY (1, 1) NOT NULL,
    [Lookup_Code]     VARCHAR (50)                                       NULL,
    [Organisation_ID] INT                                                DEFAULT (NULL) NULL,
    [Set_Name]        VARCHAR (100)                                      NULL,
    [Short_Name]      VARCHAR (100)                                      NULL,
    [Long_Name]       VARCHAR (200)                                      DEFAULT (NULL) NULL,
    [Print_Lookup_ID] INT                                                NULL,
    [Sort_Order]      TINYINT                                            DEFAULT (NULL) NULL,
    [Category]        VARCHAR (50)                                       DEFAULT (NULL) NULL,
    [System_YN]       CHAR (1)                                           DEFAULT ('Y') NULL,
    [IsActive]        CHAR (1)                                           DEFAULT ('Y') NULL,
    [Created_By]      VARCHAR (50)                                       DEFAULT ('SYSTEM') NULL,
    [Created_Date]    DATETIME                                           DEFAULT (getdate()) NULL,
    [Updated_By]      VARCHAR (50)                                       DEFAULT (NULL) NULL,
    [Updated_date]    DATETIME                                           DEFAULT (NULL) NULL,
    [SysStartTime]    DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN CONSTRAINT [DF_SysStartlk] DEFAULT (sysutcdatetime()) NOT NULL,
    [SysEndTime]      DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   CONSTRAINT [DF_SysEndlk] DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    PRIMARY KEY CLUSTERED ([Lookup_ID] ASC),
    PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[History_Lookup], DATA_CONSISTENCY_CHECK=ON));

