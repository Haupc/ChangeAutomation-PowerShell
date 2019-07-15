CREATE TABLE [HR].[Group]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[OrganizationId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (500) NOT NULL
)
GO
ALTER TABLE [HR].[Group] ADD CONSTRAINT [PK_Group] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Group] ON [HR].[Group] ([CX])
GO
