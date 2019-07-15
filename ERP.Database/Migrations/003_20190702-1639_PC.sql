-- <Migration ID="a2ab3973-7c4e-4681-8a86-a803cffdf83e" />
GO

PRINT N'Dropping constraints from [INV].[Bin]'
GO
ALTER TABLE [INV].[Bin] DROP CONSTRAINT [PK_Bin]
GO
PRINT N'Dropping constraints from [INV].[Rack]'
GO
ALTER TABLE [INV].[Rack] DROP CONSTRAINT [PK_Rack]
GO
PRINT N'Dropping constraints from [INV].[Row]'
GO
ALTER TABLE [INV].[Row] DROP CONSTRAINT [PK_Row]
GO
PRINT N'Dropping [INV].[Row]'
GO
DROP TABLE [INV].[Row]
GO
PRINT N'Dropping [INV].[Rack]'
GO
DROP TABLE [INV].[Rack]
GO
PRINT N'Dropping [INV].[Bin]'
GO
DROP TABLE [INV].[Bin]
GO
PRINT N'Creating [INV].[BinLocation]'
GO
CREATE TABLE [INV].[BinLocation]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[Row] [nvarchar] (500) NOT NULL,
[Rack] [nvarchar] (500) NULL,
[Bin] [nvarchar] (500) NULL,
[WarehouseId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Bin] on [INV].[BinLocation]'
GO
ALTER TABLE [INV].[BinLocation] ADD CONSTRAINT [PK_Bin] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [INV].[BinLocation]'
GO
ALTER TABLE [INV].[BinLocation] ADD CONSTRAINT [FK_BinLocation_Warehouse] FOREIGN KEY ([WarehouseId]) REFERENCES [INV].[Warehouse] ([Id])
GO
