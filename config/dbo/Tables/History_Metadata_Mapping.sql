CREATE TABLE [dbo].[History_Metadata_Mapping] (
    [Metadata_Mapping_ID]        INT           NOT NULL,
    [Master_Metadata_Mapping_ID] INT           NULL,
    [Inbound_Source_Setup_ID]    INT           NULL,
    [Source_Column_Name]         VARCHAR (100) NULL,
    [Destination_Table_name]     VARCHAR (100) NULL,
    [Destination_Column_Name]    VARCHAR (100) NULL,
    [Source_Data_Type]           VARCHAR (50)  NULL,
    [Column_Order]               INT           NULL,
    [Format]                     VARCHAR (50)  NULL,
    [IsActive]                   TINYINT       NULL,
    [Created_By]                 VARCHAR (100) NULL,
    [Created_Date]               DATETIME      NULL,
    [Updated_By]                 VARCHAR (100) NULL,
    [Updated_Date]               DATETIME      NULL,
    [SysStartTime]               DATETIME2 (7) NOT NULL,
    [SysEndTime]                 DATETIME2 (7) NOT NULL,
    [Source_Type]                VARCHAR (50)  NULL,
    [Source_Table_Name]          VARCHAR (100) NULL
);


GO
CREATE CLUSTERED INDEX [ix_History_Metadata_Mapping]
    ON [dbo].[History_Metadata_Mapping]([SysEndTime] ASC, [SysStartTime] ASC) WITH (DATA_COMPRESSION = PAGE);

