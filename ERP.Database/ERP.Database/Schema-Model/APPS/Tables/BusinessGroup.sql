CREATE TABLE [APPS].[BusinessGroup]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Code] [char] (2) NOT NULL,
[ShortCode] [nvarchar] (10) NOT NULL,
[Name] [nvarchar] (500) NOT NULL
)
GO
ALTER TABLE [APPS].[BusinessGroup] ADD CONSTRAINT [PK_BusinessGroup] PRIMARY KEY NONCLUSTERED  ([Id])
GO
ALTER TABLE [APPS].[BusinessGroup] ADD CONSTRAINT [IX_Code_BusinessGroup] UNIQUE NONCLUSTERED  ([Code])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_BusinessGroup] ON [APPS].[BusinessGroup] ([CX])
GO
