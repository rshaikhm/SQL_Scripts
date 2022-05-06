CREATE TABLE [dbo].[History_Control_Table] (
    [Control_Table_ID]            INT             NOT NULL,
    [File_Received_ID]            INT             NULL,
    [File_Row_Count]              INT             NULL,
    [File_header1_row_count]      INT             NULL,
    [File_footer1_row_count]      INT             NULL,
    [File_header2_row_count]      INT             NULL,
    [File_footer2_row_count]      INT             NULL,
    [File_header3_row_count]      INT             NULL,
    [File_footer3_row_count]      INT             NULL,
    [Acquisition_Row_Count]       INT             NULL,
    [Cleansing_Row_Count]         INT             NULL,
    [Acquisition_Error_Row_Count] INT             NULL,
    [Cleansing_Error_Row_Count]   INT             NULL,
    [Status]                      VARCHAR (10)    NULL,
    [File_header1_Control_Amount] DECIMAL (18, 2) NULL,
    [File_footer1_Control_Amount] DECIMAL (18, 2) NULL,
    [File_header2_Control_Amount] DECIMAL (18, 2) NULL,
    [File_footer2_Control_Amount] DECIMAL (18, 2) NULL,
    [File_header3_Control_Amount] DECIMAL (18, 2) NULL,
    [File_footer3_Control_Amount] DECIMAL (18, 2) NULL,
    [Acquisition_control_Amount]  DECIMAL (18, 2) NULL,
    [Cleansing_Control_Amount]    DECIMAL (18, 2) NULL,
    [Created_By]                  VARCHAR (50)    NULL,
    [Updated_By]                  VARCHAR (50)    NULL,
    [Created_Date]                DATETIME        NULL,
    [Updated_Date]                DATETIME        NULL,
    [SysStartTime]                DATETIME2 (7)   NOT NULL,
    [SysEndTime]                  DATETIME2 (7)   NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_History_Control_Table]
    ON [dbo].[History_Control_Table]([SysEndTime] ASC, [SysStartTime] ASC) WITH (DATA_COMPRESSION = PAGE);

