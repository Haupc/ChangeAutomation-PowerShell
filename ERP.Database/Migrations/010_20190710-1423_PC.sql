-- <Migration ID="38d4d1f5-5da8-44f0-9e99-bd8c65642f79" />
GO

PRINT N'Dropping foreign keys from [APPS].[Tax]'
GO
ALTER TABLE [APPS].[Tax] DROP CONSTRAINT [FK_Tax_SetofBook1]
GO
PRINT N'Dropping foreign keys from [dbo].[Stock]'
GO
ALTER TABLE [dbo].[Stock] DROP CONSTRAINT [FK_Stock_Item]
GO
ALTER TABLE [dbo].[Stock] DROP CONSTRAINT [FK_Stock_InventoryOrganization]
GO
PRINT N'Dropping constraints from [APPS].[Tax]'
GO
ALTER TABLE [APPS].[Tax] DROP CONSTRAINT [PK_Tax]
GO
PRINT N'Dropping constraints from [dbo].[Stock]'
GO
ALTER TABLE [dbo].[Stock] DROP CONSTRAINT [PK_Stock]
GO
PRINT N'Dropping index [CX_Tax] from [APPS].[Tax]'
GO
DROP INDEX [CX_Tax] ON [APPS].[Tax]
GO
PRINT N'Dropping index [CX_Stock] from [dbo].[Stock]'
GO
DROP INDEX [CX_Stock] ON [dbo].[Stock]
GO
PRINT N'Dropping [dbo].[Stock]'
GO
DROP TABLE [dbo].[Stock]
GO
PRINT N'Altering [APPS].[CostCenter]'
GO
ALTER TABLE [APPS].[CostCenter] ALTER COLUMN [ParentId] [uniqueidentifier] NULL
GO
PRINT N'Altering [APPS].[UnitOfMeasure]'
GO
ALTER TABLE [APPS].[UnitOfMeasure] DROP
COLUMN [AllowedPrecision]
GO
PRINT N'Rebuilding [APPS].[Tax]'
GO
CREATE TABLE [APPS].[RG_Recovery_1_Tax]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[Rate] [decimal] (18, 4) NOT NULL,
[Description] [nvarchar] (500) NULL,
[UnitOfMeasureId] [uniqueidentifier] NULL,
[Type] [nvarchar] (50) NOT NULL
)
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_1_Tax] ON
GO
INSERT INTO [APPS].[RG_Recovery_1_Tax]([Id], [CX], [Disable], [SetOfBookId], [Code], [Name], [Rate], [Description]) SELECT [Id], [CX], [Disable], [SetOfBookId], [Code], [Name], [Rate], [Description] FROM [APPS].[Tax]
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_1_Tax] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[APPS].[Tax]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[APPS].[RG_Recovery_1_Tax]', RESEED, @idVal)
GO
DROP TABLE [APPS].[Tax]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_1_Tax]', N'Tax', N'OBJECT'
GO
PRINT N'Creating index [CX_Tax] on [APPS].[Tax]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Tax] ON [APPS].[Tax] ([CX])
GO
PRINT N'Creating primary key [PK_Tax] on [APPS].[Tax]'
GO
ALTER TABLE [APPS].[Tax] ADD CONSTRAINT [PK_Tax] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[InventoryTransaction]'
GO
CREATE TABLE [dbo].[InventoryTransaction]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[ChartOfAccountId] [uniqueidentifier] NOT NULL,
[DocumentNumber] [nvarchar] (50) NOT NULL,
[Type] [int] NOT NULL CONSTRAINT [DF_StockDetail_Type] DEFAULT ((0)),
[CostPrice] [decimal] (18, 4) NOT NULL
)
GO
PRINT N'Creating primary key [PK_StockDetail] on [dbo].[InventoryTransaction]'
GO
ALTER TABLE [dbo].[InventoryTransaction] ADD CONSTRAINT [PK_StockDetail] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Tax]'
GO
ALTER TABLE [APPS].[Tax] ADD CONSTRAINT [FK_Tax_SetofBook1] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Tax]'
GO
ALTER TABLE [APPS].[Tax] ADD CONSTRAINT [FK_Tax_UnitOfMeasure] FOREIGN KEY ([UnitOfMeasureId]) REFERENCES [APPS].[UnitOfMeasure] ([Id])
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Type = VAT, ENV, IMP, SPEC, TNCN', 'SCHEMA', N'APPS', 'TABLE', N'Tax', 'COLUMN', N'Type'
GO
EXEC sp_addextendedproperty N'MS_Description', N'1 = INPUT, 2 = OUTPUT', 'SCHEMA', N'dbo', 'TABLE', N'InventoryTransaction', 'COLUMN', N'Type'
GO
