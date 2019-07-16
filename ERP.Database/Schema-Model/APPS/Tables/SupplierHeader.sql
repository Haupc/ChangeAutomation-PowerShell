CREATE TABLE [APPS].[SupplierHeader]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[Name] [nvarchar] (50) NOT NULL
)
GO
ALTER TABLE [APPS].[SupplierHeader] ADD CONSTRAINT [PK_SupplierHeader] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_SupplierHeader] ON [APPS].[SupplierHeader] ([CX])
GO
ALTER TABLE [APPS].[SupplierHeader] ADD CONSTRAINT [FK_SupplierHeader_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
