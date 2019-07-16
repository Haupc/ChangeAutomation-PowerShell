CREATE TABLE [AR].[CustomerSite]
(
[Id] [uniqueidentifier] NOT NULL,
[CustomerId] [uniqueidentifier] NOT NULL,
[DivisionId] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
ALTER TABLE [AR].[CustomerSite] ADD CONSTRAINT [PK_CustomerSite] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_CustomerSite] ON [AR].[CustomerSite] ([CX])
GO
