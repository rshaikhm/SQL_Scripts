﻿CREATE TABLE [dbo].[History_File_Received] (
    [File_Received_ID]        INT            NOT NULL,
    [File_Name]               VARCHAR (250)  NULL,
    [Received_Date_And_Time]  DATETIME       NULL,
    [Inbound_Source_Setup_ID] INT            NULL,
    [Loaded_By]               VARCHAR (150)  NULL,
    [File_Type_LK_ID]         INT            NULL,
    [As_OF_Date]              DATETIME       NULL,
    [Actual_File]             VARCHAR (1000) NULL,
    [Status]                  VARCHAR (50)   NULL,
    [Created_By]              VARCHAR (50)   NULL,
    [Created_Date]            DATETIME       NULL,
    [Updated_By]              VARCHAR (50)   NULL,
    [Updated_Date]            DATETIME       NULL,
    [SysStartTime]            DATETIME2 (7)  NOT NULL,
    [SysEndTime]              DATETIME2 (7)  NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_History_File_Received]
    ON [dbo].[History_File_Received]([SysEndTime] ASC, [SysStartTime] ASC) WITH (DATA_COMPRESSION = PAGE);

