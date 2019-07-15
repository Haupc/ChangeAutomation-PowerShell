CREATE TABLE [APPS].[HROrganization]
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
ALTER TABLE [APPS].[HROrganization] ADD CONSTRAINT [PK_Department] PRIMARY KEY NONCLUSTERED  ([Id])
GO
ALTER TABLE [APPS].[HROrganization] ADD CONSTRAINT [IX_Code_Department] UNIQUE NONCLUSTERED  ([Code], [DivisionId])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Department] ON [APPS].[HROrganization] ([CX])
GO
ALTER TABLE [APPS].[HROrganization] ADD CONSTRAINT [FK_Department_Division] FOREIGN KEY ([DivisionId]) REFERENCES [APPS].[Division] ([Id])
GO
