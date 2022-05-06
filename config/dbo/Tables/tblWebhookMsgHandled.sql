CREATE TABLE [dbo].[tblWebhookMsgHandled] (
    [MessageHandledID] INT           IDENTITY (1, 1) NOT NULL,
    [HandledMessage]   VARCHAR (255) NULL,
    [IsActive]         CHAR (1)      NULL,
    [CreateDttm]       DATETIME      NULL,
    [UpdateDttm]       DATETIME      NULL,
    [CreateUserId]     VARCHAR (255) NULL,
    [UpdateUserId]     VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([MessageHandledID] ASC)
);

