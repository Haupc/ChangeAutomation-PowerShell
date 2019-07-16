CREATE TABLE [APPSYS].[Notification]
(
[Id] [uniqueidentifier] NOT NULL,
[Time] [datetime] NOT NULL,
[CX] [bigint] NOT NULL,
[Status] [int] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Content] [ntext] NOT NULL
)
GO
ALTER TABLE [APPSYS].[Notification] ADD CONSTRAINT [PK_Notification] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Notification] ON [APPSYS].[Notification] ([CX])
GO
ALTER TABLE [APPSYS].[Notification] ADD CONSTRAINT [FK_Notification_User] FOREIGN KEY ([UserId]) REFERENCES [APPSYS].[User] ([Id])
GO
