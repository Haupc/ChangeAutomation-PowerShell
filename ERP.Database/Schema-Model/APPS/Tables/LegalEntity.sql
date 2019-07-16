CREATE TABLE [APPS].[LegalEntity]
(
[Id] [uniqueidentifier] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Code] [char] (2) NULL,
[ShortCode] [nchar] (10) NULL,
[Name] [nvarchar] (500) NULL
)
GO
ALTER TABLE [APPS].[LegalEntity] ADD CONSTRAINT [PK_LegalEntity] PRIMARY KEY NONCLUSTERED  ([Id])
GO
ALTER TABLE [APPS].[LegalEntity] ADD CONSTRAINT [IX_Code_LegalEntity] UNIQUE NONCLUSTERED  ([Code], [SetOfBookId])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_LegalEntity] ON [APPS].[LegalEntity] ([CX])
GO
ALTER TABLE [APPS].[LegalEntity] ADD CONSTRAINT [FK_LegalEntity_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
