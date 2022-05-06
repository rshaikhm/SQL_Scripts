CREATE TABLE [dbo].[tbl_Enumeration_Data] (
    [Enumeration_Data_ID] INT           IDENTITY (1, 1) NOT NULL,
    [Column_Name]         VARCHAR (100) NULL,
    [Actual_value]        VARCHAR (100) NULL,
    [Proposed_Value]      VARCHAR (100) NULL,
    [IsActive]            TINYINT       DEFAULT ((1)) NULL,
    [Created_By]          VARCHAR (100) NULL,
    [Created_Date]        DATETIME      NULL,
    [Updated_By]          VARCHAR (100) NULL,
    [Updated_Date]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Enumeration_Data_ID] ASC)
);

