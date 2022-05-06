CREATE TABLE [dbo].[History_Master_Metadata_Mapping] (
    [Master_Metadata_Mapping_ID] INT           NOT NULL,
    [Inbound_Source_Setup_ID]    INT           NULL,
    [Mapping_Name]               VARCHAR (100) NULL,
    [IsActive]                   TINYINT       NULL,
    [Created_By]                 VARCHAR (100) NULL,
    [Created_Date]               DATETIME      NULL,
    [Updated_By]                 VARCHAR (100) NULL,
    [Updated_Date]               DATETIME      NULL,
    [SysStartTime]               DATETIME2 (7) NOT NULL,
    [SysEndTime]                 DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_History_Master_Metadata_Mapping]
    ON [dbo].[History_Master_Metadata_Mapping]([SysEndTime] ASC, [SysStartTime] ASC) WITH (DATA_COMPRESSION = PAGE);

