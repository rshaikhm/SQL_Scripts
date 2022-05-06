CREATE TABLE [dbo].[tbl_Plan] (
    [Plan_ID]      VARCHAR (30)   NOT NULL,
    [Company_Code] VARCHAR (30)   NULL,
    [DER_Name]     VARCHAR (1000) NULL,
    [IsActive]     TINYINT        DEFAULT ((1)) NULL,
    [Created_By]   VARCHAR (100)  NULL,
    [Created_Date] DATETIME       NULL,
    [Updated_By]   VARCHAR (100)  NULL,
    [Updated_Date] DATETIME       NULL,
    [TaskGroupID]  INT            NULL,
    [TaskID]       INT            NULL,
    PRIMARY KEY CLUSTERED ([Plan_ID] ASC)
);

