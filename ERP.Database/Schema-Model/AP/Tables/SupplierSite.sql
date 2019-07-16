CREATE TABLE [AP].[SupplierSite]
(
[Id] [uniqueidentifier] NOT NULL,
[SupplierId] [uniqueidentifier] NOT NULL,
[DivisionId] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
ALTER TABLE [AP].[SupplierSite] ADD CONSTRAINT [PK_SupplierSite] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_SupplierSite] ON [AP].[SupplierSite] ([CX])
GO
