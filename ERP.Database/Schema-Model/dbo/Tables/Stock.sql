CREATE TABLE [dbo].[Stock]
(
[Id] [uniqueidentifier] NOT NULL,
[GoodItemId] [uniqueidentifier] NOT NULL,
[WarehouseId] [uniqueidentifier] NOT NULL,
[Quantity] [decimal] (18, 4) NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL
)
GO
ALTER TABLE [dbo].[Stock] ADD CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED  ([Id])
GO
