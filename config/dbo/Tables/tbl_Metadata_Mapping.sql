CREATE TABLE [dbo].[tbl_Metadata_Mapping] (
    [Metadata_Mapping_ID]        INT                                                IDENTITY (1, 1) NOT NULL,
    [Master_Metadata_Mapping_ID] INT                                                NULL,
    [Inbound_Source_Setup_ID]    INT                                                NULL,
    [Source_Column_Name]         VARCHAR (100)                                      NULL,
    [Destination_Table_name]     VARCHAR (100)                                      NULL,
    [Destination_Column_Name]    VARCHAR (100)                                      NULL,
    [Source_Data_Type]           VARCHAR (50)                                       NULL,
    [Column_Order]               INT                                                NULL,
    [Format]                     VARCHAR (50)                                       NULL,
    [IsActive]                   TINYINT                                            DEFAULT ((1)) NULL,
    [Created_By]                 VARCHAR (100)                                      NULL,
    [Created_Date]               DATETIME                                           NULL,
    [Updated_By]                 VARCHAR (100)                                      NULL,
    [Updated_Date]               DATETIME                                           NULL,
    [SysStartTime]               DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN CONSTRAINT [DF_SysStartmm] DEFAULT (sysutcdatetime()) NOT NULL,
    [SysEndTime]                 DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   CONSTRAINT [DF_SysEndmm] DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    [Source_Type]                VARCHAR (50)                                       NULL,
    [Source_Table_Name]          VARCHAR (100)                                      NULL,
    PRIMARY KEY CLUSTERED ([Metadata_Mapping_ID] ASC),
    FOREIGN KEY ([Inbound_Source_Setup_ID]) REFERENCES [dbo].[tbl_Inbound_Source_Setup] ([Inbound_Source_SetupID]),
    FOREIGN KEY ([Master_Metadata_Mapping_ID]) REFERENCES [dbo].[tbl_Master_Metadata_Mapping] ([Master_Metadata_Mapping_ID]),
    PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[History_Metadata_Mapping], DATA_CONSISTENCY_CHECK=ON));

