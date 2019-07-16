-- <Migration ID="000131e1-16c7-410c-a7d7-0e10598cb302" />
GO

PRINT N'Dropping foreign keys from [APPS].[Currency]'
GO
ALTER TABLE [APPS].[Currency] DROP CONSTRAINT [FK_FunctionalCurrency_SetofBook]
GO
PRINT N'Dropping foreign keys from [APPS].[DescriptiveFledField]'
GO
ALTER TABLE [APPS].[DescriptiveFledField] DROP CONSTRAINT [FK_DescriptiveFledField_BusinessGroup]
GO
PRINT N'Dropping foreign keys from [APPS].[PaymentMethod]'
GO
ALTER TABLE [APPS].[PaymentMethod] DROP CONSTRAINT [FK_PaymentMethod_SetofBook]
GO
PRINT N'Dropping foreign keys from [APPS].[SetOfBook]'
GO
ALTER TABLE [APPS].[SetOfBook] DROP CONSTRAINT [FK_SetofBook_BusinessGroup]
GO
PRINT N'Dropping foreign keys from [APPS].[ChartOfAccount]'
GO
ALTER TABLE [APPS].[ChartOfAccount] DROP CONSTRAINT [FK_ChartOfAccount_SetofBook]
GO
PRINT N'Dropping foreign keys from [APPS].[FiscalCalendar]'
GO
ALTER TABLE [APPS].[FiscalCalendar] DROP CONSTRAINT [FK_FiscalCalendar_SetofBook]
GO
PRINT N'Dropping foreign keys from [APPS].[LegalEntity]'
GO
ALTER TABLE [APPS].[LegalEntity] DROP CONSTRAINT [FK_LegalEntity_SetofBook]
GO
PRINT N'Dropping foreign keys from [APPS].[PaymentTerm]'
GO
ALTER TABLE [APPS].[PaymentTerm] DROP CONSTRAINT [FK_PaymentTerm_SetofBook]
GO
PRINT N'Dropping foreign keys from [APPS].[Tax]'
GO
ALTER TABLE [APPS].[Tax] DROP CONSTRAINT [FK_Tax_SetofBook1]
GO
PRINT N'Dropping foreign keys from [APPS].[UnitOfMeasure]'
GO
ALTER TABLE [APPS].[UnitOfMeasure] DROP CONSTRAINT [FK_UnitOfMeasure_BusinessGroup]
GO
PRINT N'Dropping constraints from [APPS].[BankAccount]'
GO
ALTER TABLE [APPS].[BankAccount] DROP CONSTRAINT [PK_BankAccount]
GO
PRINT N'Dropping constraints from [APPS].[DescriptiveFledField]'
GO
ALTER TABLE [APPS].[DescriptiveFledField] DROP CONSTRAINT [PK_DescriptiveFledField]
GO
PRINT N'Dropping constraints from [APPS].[GoodItem]'
GO
ALTER TABLE [APPS].[GoodItem] DROP CONSTRAINT [PK_GoodItem]
GO
PRINT N'Dropping constraints from [APPS].[PaymentMethod]'
GO
ALTER TABLE [APPS].[PaymentMethod] DROP CONSTRAINT [PK_PaymentMethod]
GO
PRINT N'Dropping constraints from [APPS].[SetOfBook]'
GO
ALTER TABLE [APPS].[SetOfBook] DROP CONSTRAINT [PK_SetofBook]
GO
PRINT N'Dropping constraints from [APPS].[SetOfBook]'
GO
ALTER TABLE [APPS].[SetOfBook] DROP CONSTRAINT [IX_Code_SetOfBook]
GO
PRINT N'Dropping constraints from [APPS].[UnitOfMeasure]'
GO
ALTER TABLE [APPS].[UnitOfMeasure] DROP CONSTRAINT [PK_UOM]
GO
PRINT N'Dropping index [CX_BankAccount] from [APPS].[BankAccount]'
GO
DROP INDEX [CX_BankAccount] ON [APPS].[BankAccount]
GO
PRINT N'Dropping index [CX_DescriptiveFledField] from [APPS].[DescriptiveFledField]'
GO
DROP INDEX [CX_DescriptiveFledField] ON [APPS].[DescriptiveFledField]
GO
PRINT N'Dropping index [CX_SetofBook] from [APPS].[SetOfBook]'
GO
DROP INDEX [CX_SetofBook] ON [APPS].[SetOfBook]
GO
PRINT N'Dropping [APPS].[GoodItem]'
GO
DROP TABLE [APPS].[GoodItem]
GO
PRINT N'Dropping [APPS].[DescriptiveFledField]'
GO
DROP TABLE [APPS].[DescriptiveFledField]
GO
PRINT N'Rebuilding [APPS].[BankAccount]'
GO
CREATE TABLE [APPS].[RG_Recovery_1_BankAccount]
(
[Id] [uniqueidentifier] NOT NULL,
[BankId] [uniqueidentifier] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[No] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[Description] [nvarchar] (500) NULL
)
GO
INSERT INTO [APPS].[RG_Recovery_1_BankAccount]([Id], [BankId], [SetOfBookId], [CX], [Disable]) SELECT [Id], [BankId], [SetOfBookId], [CX], [Disable] FROM [APPS].[BankAccount]
GO
DROP TABLE [APPS].[BankAccount]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_1_BankAccount]', N'BankAccount', N'OBJECT'
GO
PRINT N'Creating index [CX_BankAccount] on [APPS].[BankAccount]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_BankAccount] ON [APPS].[BankAccount] ([CX])
GO
PRINT N'Creating primary key [PK_BankAccount] on [APPS].[BankAccount]'
GO
ALTER TABLE [APPS].[BankAccount] ADD CONSTRAINT [PK_BankAccount] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Rebuilding [APPS].[SetOfBook]'
GO
CREATE TABLE [APPS].[RG_Recovery_2_SetOfBook]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [char] (2) NOT NULL,
[ShortCode] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CurrencyId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_2_SetOfBook] ON
GO
INSERT INTO [APPS].[RG_Recovery_2_SetOfBook]([Id], [Code], [ShortCode], [Name], [BusinessGroupId], [CX]) SELECT [Id], [Code], [ShortCode], [Name], [BusinessGroupId], [CX] FROM [APPS].[SetOfBook]
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_2_SetOfBook] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[APPS].[SetOfBook]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[APPS].[RG_Recovery_2_SetOfBook]', RESEED, @idVal)
GO
DROP TABLE [APPS].[SetOfBook]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_2_SetOfBook]', N'SetOfBook', N'OBJECT'
GO
PRINT N'Creating index [CX_SetofBook] on [APPS].[SetOfBook]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_SetofBook] ON [APPS].[SetOfBook] ([CX])
GO
PRINT N'Creating primary key [PK_SetofBook] on [APPS].[SetOfBook]'
GO
ALTER TABLE [APPS].[SetOfBook] ADD CONSTRAINT [PK_SetofBook] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [APPS].[SetOfBook]'
GO
ALTER TABLE [APPS].[SetOfBook] ADD CONSTRAINT [IX_Code_SetOfBook] UNIQUE NONCLUSTERED  ([Code], [BusinessGroupId])
GO
PRINT N'Altering [APPS].[ChartOfAccount]'
GO
ALTER TABLE [APPS].[ChartOfAccount] DROP
COLUMN [AccountType]
GO
PRINT N'Altering [APPS].[Currency]'
GO
ALTER TABLE [APPS].[Currency] DROP
COLUMN [IsMain]
GO
EXEC sp_rename N'[APPS].[Currency].[SetOfBookId]', N'BusinessGroupId', N'COLUMN'
GO
PRINT N'Creating [APPS].[DescriptiveFlexField]'
GO
CREATE TABLE [APPS].[DescriptiveFlexField]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NULL,
[Name] [nvarchar] (50) NULL,
[Description] [nvarchar] (50) NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
PRINT N'Creating index [CX_DescriptiveFledField] on [APPS].[DescriptiveFlexField]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_DescriptiveFledField] ON [APPS].[DescriptiveFlexField] ([CX])
GO
PRINT N'Creating primary key [PK_DescriptiveFledField] on [APPS].[DescriptiveFlexField]'
GO
ALTER TABLE [APPS].[DescriptiveFlexField] ADD CONSTRAINT [PK_DescriptiveFledField] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[Item]'
GO
CREATE TABLE [APPS].[Item]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_GoodItem] on [APPS].[Item]'
GO
ALTER TABLE [APPS].[Item] ADD CONSTRAINT [PK_GoodItem] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Rebuilding [APPS].[PaymentMethod]'
GO
CREATE TABLE [APPS].[RG_Recovery_3_PaymentMethod]
(
[Id] [uniqueidentifier] NOT NULL,
[MethodName] [nvarchar] (50) NOT NULL,
[AccountName] [nvarchar] (50) NOT NULL,
[Sequence] [int] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL
)
GO
INSERT INTO [APPS].[RG_Recovery_3_PaymentMethod]([Id], [MethodName], [AccountName], [Sequence], [SetOfBookId], [CX]) SELECT [Id], [MethodName], [AccountName], [Sequence], [SetOfBookId], [CX] FROM [APPS].[PaymentMethod]
GO
DROP TABLE [APPS].[PaymentMethod]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_3_PaymentMethod]', N'PaymentMethod', N'OBJECT'
GO
PRINT N'Creating primary key [PK_PaymentMethod] on [APPS].[PaymentMethod]'
GO
ALTER TABLE [APPS].[PaymentMethod] ADD CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Altering [APPS].[PaymentTerm]'
GO
ALTER TABLE [APPS].[PaymentTerm] DROP
COLUMN [Default]
GO
PRINT N'Rebuilding [APPS].[UnitOfMeasure]'
GO
CREATE TABLE [APPS].[RG_Recovery_4_UnitOfMeasure]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[AllowedPrecision] [int] NOT NULL,
[Type] [nvarchar] (50) NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_4_UnitOfMeasure] ON
GO
INSERT INTO [APPS].[RG_Recovery_4_UnitOfMeasure]([Id], [Name], [AllowedPrecision], [Type], [BusinessGroupId], [CX]) SELECT [Id], [Name], [AllowedPrecision], [Type], [BusinessGroupId], [CX] FROM [APPS].[UnitOfMeasure]
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_4_UnitOfMeasure] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[APPS].[UnitOfMeasure]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[APPS].[RG_Recovery_4_UnitOfMeasure]', RESEED, @idVal)
GO
DROP TABLE [APPS].[UnitOfMeasure]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_4_UnitOfMeasure]', N'UnitOfMeasure', N'OBJECT'
GO
PRINT N'Creating primary key [PK_UOM] on [APPS].[UnitOfMeasure]'
GO
ALTER TABLE [APPS].[UnitOfMeasure] ADD CONSTRAINT [PK_UOM] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[BankAccount]'
GO
ALTER TABLE [APPS].[BankAccount] ADD CONSTRAINT [FK_BankAccount_Bank] FOREIGN KEY ([BankId]) REFERENCES [APPS].[Bank] ([Id])
GO
ALTER TABLE [APPS].[BankAccount] ADD CONSTRAINT [FK_BankAccount_SetOfBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[CostCenter]'
GO
ALTER TABLE [APPS].[CostCenter] ADD CONSTRAINT [FK_CostCenter_ChartOfAccount] FOREIGN KEY ([ChartOfAccountId]) REFERENCES [APPS].[ChartOfAccount] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Currency]'
GO
ALTER TABLE [APPS].[Currency] ADD CONSTRAINT [FK_Currency_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[DescriptiveFlexField]'
GO
ALTER TABLE [APPS].[DescriptiveFlexField] ADD CONSTRAINT [FK_DescriptiveFledField_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Item]'
GO
ALTER TABLE [APPS].[Item] ADD CONSTRAINT [FK_Item_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[PaymentMethod]'
GO
ALTER TABLE [APPS].[PaymentMethod] ADD CONSTRAINT [FK_PaymentMethod_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[SetOfBook]'
GO
ALTER TABLE [APPS].[SetOfBook] ADD CONSTRAINT [FK_SetofBook_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
ALTER TABLE [APPS].[SetOfBook] ADD CONSTRAINT [FK_SetOfBook_Currency] FOREIGN KEY ([CurrencyId]) REFERENCES [APPS].[Currency] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[ChartOfAccount]'
GO
ALTER TABLE [APPS].[ChartOfAccount] ADD CONSTRAINT [FK_ChartOfAccount_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[PaymentTerm]'
GO
ALTER TABLE [APPS].[PaymentTerm] ADD CONSTRAINT [FK_PaymentTerm_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[UnitOfMeasure]'
GO
ALTER TABLE [APPS].[UnitOfMeasure] ADD CONSTRAINT [FK_UnitOfMeasure_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[FiscalCalendar]'
GO
ALTER TABLE [APPS].[FiscalCalendar] ADD CONSTRAINT [FK_FiscalCalendar_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[LegalEntity]'
GO
ALTER TABLE [APPS].[LegalEntity] ADD CONSTRAINT [FK_LegalEntity_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Tax]'
GO
ALTER TABLE [APPS].[Tax] ADD CONSTRAINT [FK_Tax_SetofBook1] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
