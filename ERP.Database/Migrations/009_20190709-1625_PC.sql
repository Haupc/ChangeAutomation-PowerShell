-- <Migration ID="4a6458a4-827c-4a1f-9ce9-ef091cbfc925" />
GO

PRINT N'Dropping foreign keys from [APPS].[CostCenter]'
GO
ALTER TABLE [APPS].[CostCenter] DROP CONSTRAINT [FK_CostCenter_ChartOfAccount]
GO
PRINT N'Dropping foreign keys from [APPS].[CustomerHeader]'
GO
ALTER TABLE [APPS].[CustomerHeader] DROP CONSTRAINT [FK_CustomerHeader_BusinessGroup]
GO
PRINT N'Dropping foreign keys from [APPS].[DescriptiveFlexField]'
GO
ALTER TABLE [APPS].[DescriptiveFlexField] DROP CONSTRAINT [FK_DescriptiveFledField_BusinessGroup]
GO
PRINT N'Dropping foreign keys from [APPS].[FiscalCalendar]'
GO
ALTER TABLE [APPS].[FiscalCalendar] DROP CONSTRAINT [FK_FiscalCalendar_SetofBook]
GO
PRINT N'Dropping foreign keys from [APPS].[KeyFlexField]'
GO
ALTER TABLE [APPS].[KeyFlexField] DROP CONSTRAINT [FK_KeyFlexField_BusinessGroup]
GO
PRINT N'Dropping foreign keys from [APPS].[SupplierHeader]'
GO
ALTER TABLE [APPS].[SupplierHeader] DROP CONSTRAINT [FK_SupplierHeader_BusinessGroup]
GO
PRINT N'Dropping foreign keys from [dbo].[StockAdjustmentReason]'
GO
ALTER TABLE [dbo].[StockAdjustmentReason] DROP CONSTRAINT [FK_StockAdjustmentReason_LegalEntity]
GO
PRINT N'Dropping foreign keys from [dbo].[StockAdjustment]'
GO
ALTER TABLE [dbo].[StockAdjustment] DROP CONSTRAINT [FK_StockAdjustment_StockAdjustmentReason]
GO
PRINT N'Dropping constraints from [APPS].[CostCenter]'
GO
ALTER TABLE [APPS].[CostCenter] DROP CONSTRAINT [PK_CostCenter]
GO
PRINT N'Dropping constraints from [APPS].[CustomerHeader]'
GO
ALTER TABLE [APPS].[CustomerHeader] DROP CONSTRAINT [PK_CustomerHeader]
GO
PRINT N'Dropping constraints from [APPS].[CustomerHeader]'
GO
ALTER TABLE [APPS].[CustomerHeader] DROP CONSTRAINT [IX_Name_CustomerHeader]
GO
PRINT N'Dropping constraints from [APPS].[DescriptiveFlexField]'
GO
ALTER TABLE [APPS].[DescriptiveFlexField] DROP CONSTRAINT [PK_DescriptiveFledField]
GO
PRINT N'Dropping constraints from [APPS].[DescriptiveFlexField]'
GO
ALTER TABLE [APPS].[DescriptiveFlexField] DROP CONSTRAINT [IX_DescriptiveFlexField]
GO
PRINT N'Dropping constraints from [APPS].[FiscalCalendar]'
GO
ALTER TABLE [APPS].[FiscalCalendar] DROP CONSTRAINT [PK_FiscalCalendar]
GO
PRINT N'Dropping constraints from [APPS].[KeyFlexField]'
GO
ALTER TABLE [APPS].[KeyFlexField] DROP CONSTRAINT [PK_KeyFlexField]
GO
PRINT N'Dropping constraints from [APPS].[KeyFlexField]'
GO
ALTER TABLE [APPS].[KeyFlexField] DROP CONSTRAINT [IX_KeyFlexField]
GO
PRINT N'Dropping constraints from [APPS].[SupplierHeader]'
GO
ALTER TABLE [APPS].[SupplierHeader] DROP CONSTRAINT [PK_SupplierHeader]
GO
PRINT N'Dropping constraints from [AP].[SupplierHeaderValue]'
GO
ALTER TABLE [AP].[SupplierHeaderValue] DROP CONSTRAINT [PK_SupplierHeaderValue]
GO
PRINT N'Dropping constraints from [dbo].[StockAdjustmentReason]'
GO
ALTER TABLE [dbo].[StockAdjustmentReason] DROP CONSTRAINT [PK_StockAdjustmentReason]
GO
PRINT N'Dropping constraints from [dbo].[StockAdjustment]'
GO
ALTER TABLE [dbo].[StockAdjustment] DROP CONSTRAINT [PK_StockAdjustment]
GO
PRINT N'Dropping constraints from [dbo].[StockRequestDetail]'
GO
ALTER TABLE [dbo].[StockRequestDetail] DROP CONSTRAINT [PK_StockRequestDetail]
GO
PRINT N'Dropping constraints from [dbo].[Stock]'
GO
ALTER TABLE [dbo].[Stock] DROP CONSTRAINT [PK_Stock]
GO
PRINT N'Dropping index [CX_CostCenter] from [APPS].[CostCenter]'
GO
DROP INDEX [CX_CostCenter] ON [APPS].[CostCenter]
GO
PRINT N'Dropping index [CX_CustomerHeader] from [APPS].[CustomerHeader]'
GO
DROP INDEX [CX_CustomerHeader] ON [APPS].[CustomerHeader]
GO
PRINT N'Dropping index [CX_DescriptiveFledField] from [APPS].[DescriptiveFlexField]'
GO
DROP INDEX [CX_DescriptiveFledField] ON [APPS].[DescriptiveFlexField]
GO
PRINT N'Dropping index [CX_FiscalCalendar] from [APPS].[FiscalCalendar]'
GO
DROP INDEX [CX_FiscalCalendar] ON [APPS].[FiscalCalendar]
GO
PRINT N'Dropping index [CX_KeyFlexField] from [APPS].[KeyFlexField]'
GO
DROP INDEX [CX_KeyFlexField] ON [APPS].[KeyFlexField]
GO
PRINT N'Dropping index [CX_SupplierHeader] from [APPS].[SupplierHeader]'
GO
DROP INDEX [CX_SupplierHeader] ON [APPS].[SupplierHeader]
GO
PRINT N'Dropping index [CX_SupplierHeaderValue] from [AP].[SupplierHeaderValue]'
GO
DROP INDEX [CX_SupplierHeaderValue] ON [AP].[SupplierHeaderValue]
GO
PRINT N'Dropping [AP].[SupplierHeaderValue]'
GO
DROP TABLE [AP].[SupplierHeaderValue]
GO
PRINT N'Dropping [APPS].[SupplierHeader]'
GO
DROP TABLE [APPS].[SupplierHeader]
GO
PRINT N'Dropping [APPS].[KeyFlexField]'
GO
DROP TABLE [APPS].[KeyFlexField]
GO
PRINT N'Dropping [APPS].[FiscalCalendar]'
GO
DROP TABLE [APPS].[FiscalCalendar]
GO
PRINT N'Dropping [APPS].[DescriptiveFlexField]'
GO
DROP TABLE [APPS].[DescriptiveFlexField]
GO
PRINT N'Dropping [APPS].[CustomerHeader]'
GO
DROP TABLE [APPS].[CustomerHeader]
GO
PRINT N'Creating [APPS].[FiscalYear]'
GO
CREATE TABLE [APPS].[FiscalYear]
(
[Id] [uniqueidentifier] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[StartDate] [datetime] NOT NULL,
[EndDate] [datetime] NOT NULL,
[Status] [int] NOT NULL CONSTRAINT [DF_FiscalYear_Status] DEFAULT ((0))
)
GO
PRINT N'Creating index [CX_FiscalCalendar] on [APPS].[FiscalYear]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_FiscalCalendar] ON [APPS].[FiscalYear] ([CX])
GO
PRINT N'Creating primary key [PK_FiscalCalendar] on [APPS].[FiscalYear]'
GO
ALTER TABLE [APPS].[FiscalYear] ADD CONSTRAINT [PK_FiscalCalendar] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[AccountingPeriod]'
GO
CREATE TABLE [APPS].[AccountingPeriod]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[FiscalYearId] [uniqueidentifier] NOT NULL,
[StartPeriod] [date] NOT NULL,
[EndPeriod] [date] NOT NULL,
[Status] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_AccountingPeriod] on [APPS].[AccountingPeriod]'
GO
ALTER TABLE [APPS].[AccountingPeriod] ADD CONSTRAINT [PK_AccountingPeriod] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Altering [APPS].[ChartOfAccount]'
GO
ALTER TABLE [APPS].[ChartOfAccount] ADD
[ParentId] [uniqueidentifier] NULL
GO
PRINT N'Creating [APPS].[COATemplate]'
GO
CREATE TABLE [APPS].[COATemplate]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (500) NOT NULL,
[ParentId] [uniqueidentifier] NULL
)
GO
PRINT N'Creating index [CX_COATemplate] on [APPS].[COATemplate]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_COATemplate] ON [APPS].[COATemplate] ([CX])
GO
PRINT N'Creating primary key [PK_COATemplate] on [APPS].[COATemplate]'
GO
ALTER TABLE [APPS].[COATemplate] ADD CONSTRAINT [PK_COATemplate] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[COATemplateDetail]'
GO
CREATE TABLE [APPS].[COATemplateDetail]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[COATemplateId] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[Description] [nvarchar] (500) NOT NULL
)
GO
PRINT N'Creating index [CX_COATemplateDetail] on [APPS].[COATemplateDetail]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_COATemplateDetail] ON [APPS].[COATemplateDetail] ([CX])
GO
PRINT N'Creating primary key [PK_COATemplateDetail] on [APPS].[COATemplateDetail]'
GO
ALTER TABLE [APPS].[COATemplateDetail] ADD CONSTRAINT [PK_COATemplateDetail] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Rebuilding [APPS].[CostCenter]'
GO
CREATE TABLE [APPS].[RG_Recovery_1_CostCenter]
(
[Id] [uniqueidentifier] NOT NULL,
[Disable] [bit] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Code] [nvarchar] (500) NOT NULL,
[Name] [nvarchar] (500) NULL,
[ParentId] [uniqueidentifier] NOT NULL,
[ChartOfAccountId] [uniqueidentifier] NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL
)
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_1_CostCenter] ON
GO
INSERT INTO [APPS].[RG_Recovery_1_CostCenter]([Id], [Disable], [CX], [Code], [Name], [ParentId], [ChartOfAccountId]) SELECT [Id], [Disable], [CX], [Code], [Name], [ParentId], [ChartOfAccountId] FROM [APPS].[CostCenter]
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_1_CostCenter] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[APPS].[CostCenter]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[APPS].[RG_Recovery_1_CostCenter]', RESEED, @idVal)
GO
DROP TABLE [APPS].[CostCenter]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_1_CostCenter]', N'CostCenter', N'OBJECT'
GO
PRINT N'Creating index [CX_CostCenter] on [APPS].[CostCenter]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_CostCenter] ON [APPS].[CostCenter] ([CX])
GO
PRINT N'Creating primary key [PK_CostCenter] on [APPS].[CostCenter]'
GO
ALTER TABLE [APPS].[CostCenter] ADD CONSTRAINT [PK_CostCenter] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Rebuilding [dbo].[StockAdjustmentReason]'
GO
CREATE TABLE [dbo].[RG_Recovery_2_StockAdjustmentReason]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[LegalEntityId] [uniqueidentifier] NOT NULL,
[Reason] [nvarchar] (500) NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_2_StockAdjustmentReason] ON
GO
INSERT INTO [dbo].[RG_Recovery_2_StockAdjustmentReason]([Id], [CX], [Disable], [LegalEntityId], [Reason]) SELECT [Id], [CX], [Disable], [LegalEntityId], [Reason] FROM [dbo].[StockAdjustmentReason]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_2_StockAdjustmentReason] OFF
GO
DROP TABLE [dbo].[StockAdjustmentReason]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_2_StockAdjustmentReason]', N'StockAdjustmentReason', N'OBJECT'
GO
PRINT N'Creating index [CX_StockAdjustmentReason] on [dbo].[StockAdjustmentReason]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_StockAdjustmentReason] ON [dbo].[StockAdjustmentReason] ([Id])
GO
PRINT N'Creating primary key [PK_StockAdjustmentReason] on [dbo].[StockAdjustmentReason]'
GO
ALTER TABLE [dbo].[StockAdjustmentReason] ADD CONSTRAINT [PK_StockAdjustmentReason] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[TaxTemplate]'
GO
CREATE TABLE [APPS].[TaxTemplate]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (500) NOT NULL,
[Type] [nvarchar] (50) NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating index [CX_TaxTemplate] on [APPS].[TaxTemplate]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_TaxTemplate] ON [APPS].[TaxTemplate] ([CX])
GO
PRINT N'Creating primary key [PK_TemplateTax] on [APPS].[TaxTemplate]'
GO
ALTER TABLE [APPS].[TaxTemplate] ADD CONSTRAINT [PK_TemplateTax] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[TaxTemplateDetail]'
GO
CREATE TABLE [APPS].[TaxTemplateDetail]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[TaxTemplateId] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[UnitOfMeasureId] [uniqueidentifier] NOT NULL,
[Rate] [decimal] (18, 4) NOT NULL,
[Description] [nvarchar] (500) NULL
)
GO
PRINT N'Creating index [CX_TaxTemplateDetail] on [APPS].[TaxTemplateDetail]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_TaxTemplateDetail] ON [APPS].[TaxTemplateDetail] ([Id])
GO
PRINT N'Creating primary key [PK_TemplateTaxDetail] on [APPS].[TaxTemplateDetail]'
GO
ALTER TABLE [APPS].[TaxTemplateDetail] ADD CONSTRAINT [PK_TemplateTaxDetail] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating index [CX_StockAdjustment] on [dbo].[StockAdjustment]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_StockAdjustment] ON [dbo].[StockAdjustment] ([CX])
GO
PRINT N'Creating index [CX_StockRequestDetail] on [dbo].[StockRequestDetail]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_StockRequestDetail] ON [dbo].[StockRequestDetail] ([CX])
GO
PRINT N'Creating index [CX_Stock] on [dbo].[Stock]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Stock] ON [dbo].[Stock] ([CX])
GO
PRINT N'Creating primary key [PK_StockAdjustment] on [dbo].[StockAdjustment]'
GO
ALTER TABLE [dbo].[StockAdjustment] ADD CONSTRAINT [PK_StockAdjustment] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating primary key [PK_StockRequestDetail] on [dbo].[StockRequestDetail]'
GO
ALTER TABLE [dbo].[StockRequestDetail] ADD CONSTRAINT [PK_StockRequestDetail] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating primary key [PK_Stock] on [dbo].[Stock]'
GO
ALTER TABLE [dbo].[Stock] ADD CONSTRAINT [PK_Stock] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[CostCenter]'
GO
ALTER TABLE [APPS].[CostCenter] ADD CONSTRAINT [FK_CostCenter_ChartOfAccount] FOREIGN KEY ([ChartOfAccountId]) REFERENCES [APPS].[ChartOfAccount] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[FiscalYear]'
GO
ALTER TABLE [APPS].[FiscalYear] ADD CONSTRAINT [FK_FiscalCalendar_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[StockAdjustmentReason]'
GO
ALTER TABLE [dbo].[StockAdjustmentReason] ADD CONSTRAINT [FK_StockAdjustmentReason_LegalEntity] FOREIGN KEY ([LegalEntityId]) REFERENCES [APPS].[LegalEntity] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[StockAdjustment]'
GO
ALTER TABLE [dbo].[StockAdjustment] ADD CONSTRAINT [FK_StockAdjustment_StockAdjustmentReason] FOREIGN KEY ([AdjustmentReasonId]) REFERENCES [dbo].[StockAdjustmentReason] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[AccountingPeriod]'
GO
ALTER TABLE [APPS].[AccountingPeriod] ADD CONSTRAINT [FK_AccountingPeriod_FiscalYear] FOREIGN KEY ([FiscalYearId]) REFERENCES [APPS].[FiscalYear] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[COATemplateDetail]'
GO
ALTER TABLE [APPS].[COATemplateDetail] ADD CONSTRAINT [FK_COATemplateDetail_COATemplate] FOREIGN KEY ([COATemplateId]) REFERENCES [APPS].[COATemplate] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[COATemplate]'
GO
ALTER TABLE [APPS].[COATemplate] ADD CONSTRAINT [FK_COATemplate_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[CostCenter]'
GO
ALTER TABLE [APPS].[CostCenter] ADD CONSTRAINT [FK_CostCenter_SetOfBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[TaxTemplateDetail]'
GO
ALTER TABLE [APPS].[TaxTemplateDetail] ADD CONSTRAINT [FK_TaxTemplateDetail_TaxTemplate] FOREIGN KEY ([TaxTemplateId]) REFERENCES [APPS].[TaxTemplate] ([Id])
GO
ALTER TABLE [APPS].[TaxTemplateDetail] ADD CONSTRAINT [FK_TaxTemplateDetail_UnitOfMeasure] FOREIGN KEY ([UnitOfMeasureId]) REFERENCES [APPS].[UnitOfMeasure] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[TaxTemplate]'
GO
ALTER TABLE [APPS].[TaxTemplate] ADD CONSTRAINT [FK_TaxTemplate_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'0 = CLOSE, 1 = OPEN', 'SCHEMA', N'APPS', 'TABLE', N'AccountingPeriod', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'MS_Description', N'0 = CLOSE, 1 = OPEN', 'SCHEMA', N'APPS', 'TABLE', N'FiscalYear', 'COLUMN', N'Status'
GO
