CREATE TABLE [APPSYS].[UserProfile]
(
[Id] [uniqueidentifier] NOT NULL,
[Key] [nvarchar] (200) NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Value] [ntext] NOT NULL
)
GO
ALTER TABLE [APPSYS].[UserProfile] ADD CONSTRAINT [PK_UserProfile] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [IX_UserProfile] ON [APPSYS].[UserProfile] ([CX])
GO
ALTER TABLE [APPSYS].[UserProfile] ADD CONSTRAINT [FK_UserProfile_User] FOREIGN KEY ([UserId]) REFERENCES [APPSYS].[User] ([Id])
GO
