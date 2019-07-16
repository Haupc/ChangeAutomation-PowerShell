CREATE TABLE [INV].[Row]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[WarehouseId] [uniqueidentifier] NOT NULL
)
GO
ALTER TABLE [INV].[Row] ADD CONSTRAINT [PK_Row] PRIMARY KEY CLUSTERED  ([Id])
GO
