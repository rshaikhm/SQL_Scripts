CREATE TABLE [dbo].[tbl_Ingestion_Lookup] (
    [Ingestion_Lookup_ID] INT           IDENTITY (1, 1) NOT NULL,
    [Lookup_Name]         VARCHAR (100) NULL,
    [Lookup_Value]        VARCHAR (100) NULL,
    [IsActive]            CHAR (1)      NULL,
    [Created_By]          VARCHAR (100) NULL,
    [Created_Date]        DATETIME      NULL,
    [Updated_By]          VARCHAR (100) NULL,
    [Updated_date]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Ingestion_Lookup_ID] ASC)
);

