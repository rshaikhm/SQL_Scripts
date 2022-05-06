CREATE TABLE [dbo].[tbl_Header_Metadata_Table] (
    [Header_Metadata_Table_ID] INT           IDENTITY (1, 1) NOT NULL,
    [Header_Column_Name]       VARCHAR (100) NULL,
    [Header_Column_Meaning]    VARCHAR (100) NULL,
    [IsActive]                 TINYINT       DEFAULT ((1)) NULL,
    [Created_By]               VARCHAR (100) NULL,
    [Created_Date]             DATETIME      NULL,
    [Updated_By]               VARCHAR (100) NULL,
    [Updated_Date]             DATETIME      NULL,
    [Inbound_Source_Setup_ID]  INT           NULL,
    [Sort_Order]               INT           NULL,
    [Column_Format]            VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([Header_Metadata_Table_ID] ASC),
    FOREIGN KEY ([Inbound_Source_Setup_ID]) REFERENCES [dbo].[tbl_Inbound_Source_Setup] ([Inbound_Source_SetupID])
);

