CREATE TABLE [APPSYS].[Feature]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (500) NOT NULL,
[Disable] [bit] NOT NULL
)
GO
ALTER TABLE [APPSYS].[Feature] ADD CONSTRAINT [PK_Feature] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Feature] ON [APPSYS].[Feature] ([CX])
GO
