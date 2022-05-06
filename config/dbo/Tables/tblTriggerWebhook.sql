CREATE TABLE [dbo].[tblTriggerWebhook] (
    [TriggerWebhookID] INT           IDENTITY (1, 1) NOT NULL,
    [TriggerMessage]   VARCHAR (255) NULL,
    [IsActive]         CHAR (1)      NULL,
    [CreateDttm]       DATETIME      NULL,
    [UpdateDttm]       DATETIME      NULL,
    [CreateUserId]     VARCHAR (255) NULL,
    [UpdateUserId]     VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([TriggerWebhookID] ASC)
);

