CREATE TABLE [dbo].[tbl_Error_Master] (
    [Error_Message_Setup_ID] INT           IDENTITY (1, 1) NOT NULL,
    [Error_Code]             VARCHAR (50)  NULL,
    [Error_Category]         VARCHAR (100) NULL,
    [Error_msg]              VARCHAR (500) NULL,
    [Error_Type_ID]          INT           NULL,
    [Created_By]             VARCHAR (100) NULL,
    [Created_Date]           DATETIME      NULL,
    [Updated_By]             VARCHAR (100) NULL,
    [Updated_date]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Error_Message_Setup_ID] ASC)
);

