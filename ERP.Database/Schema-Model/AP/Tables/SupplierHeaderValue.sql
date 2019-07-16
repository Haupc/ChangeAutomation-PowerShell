CREATE TABLE [AP].[SupplierHeaderValue]
(
[Id] [uniqueidentifier] NOT NULL,
[SupplierId] [uniqueidentifier] NOT NULL,
[SupplierHeaderId] [uniqueidentifier] NULL,
[Value] [nvarchar] (500) NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [AP].[SupplierHeaderValue] ADD CONSTRAINT [PK_SupplierHeaderValue] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_SupplierHeaderValue] ON [AP].[SupplierHeaderValue] ([CX])
GO
