CREATE TABLE [dbo].[tbl_Frequency] (
    [Frequency_ID]       INT                                         IDENTITY (1, 1) NOT NULL,
    [Frequency_Duration] VARCHAR (50)                                NULL,
    [Day]                INT                                         NULL,
    [Time]               TIME (7)                                    NULL,
    [IsActive]           TINYINT                                     DEFAULT ((1)) NULL,
    [Created_By]         VARCHAR (100)                               NULL,
    [Created_Date]       DATETIME                                    NULL,
    [Updated_By]         VARCHAR (100)                               NULL,
    [Updated_Date]       DATETIME                                    NULL,
    [ValidFrom]          DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTill]          DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    PRIMARY KEY CLUSTERED ([Frequency_ID] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTill])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[History_Frequency], DATA_CONSISTENCY_CHECK=ON, HISTORY_RETENTION_PERIOD=1 YEAR));

