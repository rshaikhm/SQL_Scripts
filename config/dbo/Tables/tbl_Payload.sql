CREATE TABLE [dbo].[tbl_Payload] (
    [Payload_ID]          INT            IDENTITY (1, 1) NOT NULL,
    [Payload]             VARCHAR (1000) NULL,
    [API_Name]            VARCHAR (500)  NULL,
    [Status]              VARCHAR (50)   NULL,
    [IsActive]            TINYINT        DEFAULT ((1)) NULL,
    [Created_By]          VARCHAR (100)  NULL,
    [Created_Date]        DATETIME       NULL,
    [Updated_By]          VARCHAR (100)  NULL,
    [Updated_Date]        DATETIME       NULL,
    [Payload_Received_ID] INT            NULL,
    PRIMARY KEY CLUSTERED ([Payload_ID] ASC),
    FOREIGN KEY ([Payload_Received_ID]) REFERENCES [dbo].[tbl_Payload_Received] ([Payload_Received_ID])
);

