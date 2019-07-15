CREATE TABLE [APPSYS].[AuditLog]
(
[Id] [uniqueidentifier] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ClassName] [nvarchar] (500) NOT NULL,
[MethodName] [nvarchar] (500) NOT NULL,
[OldData] [ntext] NULL,
[NewData] [ntext] NOT NULL,
[Time] [datetime] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [APPSYS].[AuditLog] ADD CONSTRAINT [PK_AuditLog] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_AuditLog] ON [APPSYS].[AuditLog] ([CX])
GO
ALTER TABLE [APPSYS].[AuditLog] ADD CONSTRAINT [FK_AuditLog_User] FOREIGN KEY ([UserId]) REFERENCES [APPSYS].[User] ([Id])
GO
