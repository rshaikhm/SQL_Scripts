CREATE TABLE [dbo].[History_Frequency] (
    [Frequency_ID]       INT           NOT NULL,
    [Frequency_Duration] VARCHAR (50)  NULL,
    [Day]                INT           NULL,
    [Time]               TIME (7)      NULL,
    [IsActive]           TINYINT       NULL,
    [Created_By]         VARCHAR (100) NULL,
    [Created_Date]       DATETIME      NULL,
    [Updated_By]         VARCHAR (100) NULL,
    [Updated_Date]       DATETIME      NULL,
    [ValidFrom]          DATETIME2 (7) NOT NULL,
    [ValidTill]          DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_History_Frequency]
    ON [dbo].[History_Frequency]([ValidTill] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

