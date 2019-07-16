CREATE TABLE [APPS].[SetOfBook]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [char] (2) NOT NULL,
[ShortCode] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [APPS].[SetOfBook] ADD CONSTRAINT [PK_SetofBook] PRIMARY KEY NONCLUSTERED  ([Id])
GO
ALTER TABLE [APPS].[SetOfBook] ADD CONSTRAINT [IX_Code_SetOfBook] UNIQUE NONCLUSTERED  ([Code], [BusinessGroupId])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_SetofBook] ON [APPS].[SetOfBook] ([CX])
GO
ALTER TABLE [APPS].[SetOfBook] ADD CONSTRAINT [FK_SetofBook_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
