CREATE TABLE [APPSYS].[Operation]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (2000) NOT NULL,
[FeatureId] [uniqueidentifier] NOT NULL,
[Disable] [bit] NOT NULL
)
GO
ALTER TABLE [APPSYS].[Operation] ADD CONSTRAINT [PK_APPSYS.Operation] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Operation] ON [APPSYS].[Operation] ([CX])
GO
ALTER TABLE [APPSYS].[Operation] ADD CONSTRAINT [FK_Operation_Feature] FOREIGN KEY ([FeatureId]) REFERENCES [APPSYS].[Feature] ([Id])
GO
