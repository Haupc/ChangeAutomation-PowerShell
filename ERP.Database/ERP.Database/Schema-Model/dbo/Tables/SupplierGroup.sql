CREATE TABLE [dbo].[SupplierGroup]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[LegalEntityId] [uniqueidentifier] NOT NULL
)
GO
ALTER TABLE [dbo].[SupplierGroup] ADD CONSTRAINT [PK_SupplierGroup] PRIMARY KEY CLUSTERED  ([Id])
GO
