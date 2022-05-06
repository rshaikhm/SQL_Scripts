CREATE TABLE [dbo].[tbl_Header_Received] (
    [Header_Received_ID]       INT           IDENTITY (1, 1) NOT NULL,
    [Header_Metadata_Table_ID] INT           NULL,
    [Header_Name]              VARCHAR (250) NULL,
    [Header_Type]              VARCHAR (50)  NULL,
    [IsActive]                 TINYINT       DEFAULT ((1)) NULL,
    [Created_By]               VARCHAR (100) NULL,
    [Created_Date]             DATETIME      NULL,
    [Updated_By]               VARCHAR (100) NULL,
    [Updated_Date]             DATETIME      NULL,
    [Inbound_Source_Setup_ID]  INT           NULL,
    [File_Received_ID]         INT           NULL,
    PRIMARY KEY CLUSTERED ([Header_Received_ID] ASC),
    FOREIGN KEY ([File_Received_ID]) REFERENCES [dbo].[tbl_File_Received] ([File_Received_ID]),
    FOREIGN KEY ([Header_Metadata_Table_ID]) REFERENCES [dbo].[tbl_Header_Metadata_Table] ([Header_Metadata_Table_ID]),
    FOREIGN KEY ([Inbound_Source_Setup_ID]) REFERENCES [dbo].[tbl_Inbound_Source_Setup] ([Inbound_Source_SetupID])
);

