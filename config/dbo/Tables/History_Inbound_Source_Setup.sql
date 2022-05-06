CREATE TABLE [dbo].[History_Inbound_Source_Setup] (
    [Inbound_Source_SetupID]            INT           NOT NULL,
    [Type_Of_Ingestion_LK_ID]           INT           NULL,
    [Source_URL]                        VARCHAR (500) NULL,
    [User_ID]                           VARCHAR (50)  NULL,
    [Password]                          VARCHAR (50)  NULL,
    [Payroll_Provider_Type_LK_ID]       INT           NULL,
    [Frequency_ID]                      INT           NULL,
    [Destination_Setup_ID]              INT           NULL,
    [Connection_Port]                   VARCHAR (100) NULL,
    [Source_Folder_Path]                VARCHAR (500) NULL,
    [From_Email_ID]                     VARCHAR (100) NULL,
    [API_Name]                          VARCHAR (500) NULL,
    [File_Type_LK_ID]                   INT           NULL,
    [File_Name_Pattern]                 VARCHAR (200) NULL,
    [Payroll_Provider_ID]               INT           NULL,
    [Delimiter]                         VARCHAR (50)  NULL,
    [Is_Column_Header_Available]        CHAR (1)      NULL,
    [Is_Header_Row_Available]           CHAR (1)      NULL,
    [Is_Column_Footer_Header_Available] CHAR (1)      NULL,
    [Is_Footer_Row_Available]           CHAR (1)      NULL,
    [Data_Header_Row]                   INT           NULL,
    [Data_Start_Row]                    INT           NULL,
    [Footer_Start_Row]                  INT           NULL,
    [Hierarchial_Data]                  CHAR (1)      NULL,
    [Get_Or_Put]                        VARCHAR (10)  NULL,
    [Is_Active]                         TINYINT       NULL,
    [Created_By]                        VARCHAR (100) NULL,
    [Created_Date]                      DATETIME      NULL,
    [Updated_By]                        VARCHAR (100) NULL,
    [Updated_Date]                      DATETIME      NULL,
    [SysStartTime]                      DATETIME2 (7) NOT NULL,
    [SysEndTime]                        DATETIME2 (7) NOT NULL,
    [Filename_Structure_Parts]          INT           NULL,
    [Storage_Folder_Name]               VARCHAR (100) NULL,
    [Sheet_Name]                        VARCHAR (50)  NULL
);


GO
CREATE CLUSTERED INDEX [ix_History_Inbound_Source_Setup]
    ON [dbo].[History_Inbound_Source_Setup]([SysEndTime] ASC, [SysStartTime] ASC) WITH (DATA_COMPRESSION = PAGE);

