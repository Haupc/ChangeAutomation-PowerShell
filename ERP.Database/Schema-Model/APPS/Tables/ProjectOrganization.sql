CREATE TABLE [APPS].[ProjectOrganization]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nchar] (4) NOT NULL,
[ShortCode] [nvarchar] (10) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[DivisionId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
ALTER TABLE [APPS].[ProjectOrganization] ADD CONSTRAINT [PK_ProjectOrganization] PRIMARY KEY NONCLUSTERED  ([Id])
GO
ALTER TABLE [APPS].[ProjectOrganization] ADD CONSTRAINT [IX_Code_ProjectOrganization] UNIQUE NONCLUSTERED  ([Code], [DivisionId])
GO
ALTER TABLE [APPS].[ProjectOrganization] ADD CONSTRAINT [FK_ProjectOrganization_Division] FOREIGN KEY ([DivisionId]) REFERENCES [APPS].[Division] ([Id])
GO
