CREATE TABLE [INV].[Warehouse]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[Location] [nvarchar] (500) NOT NULL,
[InventoryOrganizationId] [uniqueidentifier] NOT NULL
)
GO
ALTER TABLE [INV].[Warehouse] ADD CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED  ([Id])
GO
