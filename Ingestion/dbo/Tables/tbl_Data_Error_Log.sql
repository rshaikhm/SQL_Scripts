CREATE TABLE [dbo].[tbl_Data_Error_Log] (
    [Data_Error_Log_ID]            INT           IDENTITY (1, 1) NOT NULL,
    [Landing_Contribution_Data_ID] BIGINT        NULL,
    [Staging_Contribution_Data_ID] BIGINT        NULL,
    [Error_Type]                   VARCHAR (100) NULL,
    [Error_Description]            VARCHAR (500) NULL,
    [Error_Column_Name]            VARCHAR (50)  NULL,
    [Error_Status]                 CHAR (1)      DEFAULT ('N') NULL,
    [Resolution_Date]              DATE          NULL,
    [Created_By]                   VARCHAR (100) NULL,
    [Created_Date]                 DATETIME      NULL,
    [Updated_By]                   VARCHAR (100) NULL,
    [Updated_date]                 DATETIME      NULL,
    [Payload_received_ID]          INT           NULL,
    PRIMARY KEY CLUSTERED ([Data_Error_Log_ID] ASC)
);

