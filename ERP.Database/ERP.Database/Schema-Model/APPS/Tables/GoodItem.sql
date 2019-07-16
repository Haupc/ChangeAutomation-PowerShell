CREATE TABLE [APPS].[GoodItem]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[InventoryOrganizationId] [uniqueidentifier] NOT NULL
)
GO
ALTER TABLE [APPS].[GoodItem] ADD CONSTRAINT [PK_GoodItem] PRIMARY KEY CLUSTERED  ([Id])
GO
