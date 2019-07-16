CREATE TABLE [APPS].[AssetOrganization]
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
ALTER TABLE [APPS].[AssetOrganization] ADD CONSTRAINT [PK_AssetOrganization] PRIMARY KEY NONCLUSTERED  ([Id])
GO
ALTER TABLE [APPS].[AssetOrganization] ADD CONSTRAINT [IX_Code_AssetOrganization] UNIQUE NONCLUSTERED  ([Code], [DivisionId])
GO
ALTER TABLE [APPS].[AssetOrganization] ADD CONSTRAINT [FK_AssetOrganization_Division] FOREIGN KEY ([DivisionId]) REFERENCES [APPS].[Division] ([Id])
GO
