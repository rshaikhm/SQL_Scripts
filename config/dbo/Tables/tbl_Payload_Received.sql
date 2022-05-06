CREATE TABLE [dbo].[tbl_Payload_Received] (
    [Payload_Received_ID]     INT                                         IDENTITY (1, 1) NOT NULL,
    [Payload_Name]            VARCHAR (250)                               NULL,
    [Received_Date_And_Time]  DATETIME                                    NULL,
    [Inbound_Source_Setup_ID] INT                                         NULL,
    [Loaded_By]               VARCHAR (150)                               NULL,
    [File_Type_LK_ID]         INT                                         NULL,
    [As_OF_Date]              DATETIME                                    NULL,
    [Actual_File]             VARCHAR (1000)                              NULL,
    [From_Email_ID]           VARCHAR (100)                               NULL,
    [Status]                  VARCHAR (50)                                NULL,
    [Created_By]              VARCHAR (100)                               NULL,
    [Created_Date]            DATETIME                                    NULL,
    [Updated_By]              VARCHAR (100)                               NULL,
    [Updated_Date]            DATETIME                                    NULL,
    [ValidFromFR]             DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTillFR]             DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    [Updated_Payload_ID]      INT                                         NULL,
    [Comment]                 VARCHAR (500)                               NULL,
    PRIMARY KEY CLUSTERED ([Payload_Received_ID] ASC),
    FOREIGN KEY ([File_Type_LK_ID]) REFERENCES [dbo].[tbl_Lookup] ([Lookup_ID]),
    FOREIGN KEY ([Inbound_Source_Setup_ID]) REFERENCES [dbo].[tbl_Inbound_Source_Setup] ([Inbound_Source_SetupID]),
    PERIOD FOR SYSTEM_TIME ([ValidFromFR], [ValidTillFR])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[History_Payload_Received], DATA_CONSISTENCY_CHECK=ON, HISTORY_RETENTION_PERIOD=1 YEAR));

