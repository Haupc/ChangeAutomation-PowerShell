CREATE TABLE [APPS].[Division]
(
[Id] [uniqueidentifier] NOT NULL,
[LegalEntityId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Code] [nchar] (3) NOT NULL,
[ShortCode] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (50) NOT NULL
)
GO
ALTER TABLE [APPS].[Division] ADD CONSTRAINT [PK_Division] PRIMARY KEY NONCLUSTERED  ([Id])
GO
ALTER TABLE [APPS].[Division] ADD CONSTRAINT [IX_Code_Division] UNIQUE NONCLUSTERED  ([Code], [LegalEntityId])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Division] ON [APPS].[Division] ([CX])
GO
ALTER TABLE [APPS].[Division] ADD CONSTRAINT [FK_Division_LegalEntity] FOREIGN KEY ([LegalEntityId]) REFERENCES [APPS].[LegalEntity] ([Id])
GO
