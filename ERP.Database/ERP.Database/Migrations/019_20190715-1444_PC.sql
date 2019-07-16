-- <Migration ID="9f1884ae-a2a1-4e3c-92ba-6ee1221da46a" />
GO

PRINT N'Dropping foreign keys from [APPS].[CustomerBankAccount]'
GO
ALTER TABLE [APPS].[CustomerBankAccount] DROP CONSTRAINT [FK_CustomerBankAccount_Bank]
GO
ALTER TABLE [APPS].[CustomerBankAccount] DROP CONSTRAINT [FK_CustomerBankAccount_Customer]
GO
PRINT N'Dropping foreign keys from [APPS].[CustomerContact]'
GO
ALTER TABLE [APPS].[CustomerContact] DROP CONSTRAINT [FK_CustomerContact_Customer]
GO
PRINT N'Dropping foreign keys from [APPS].[CustomerReceiver]'
GO
--ALTER TABLE [APPS].[CustomerReceiver] DROP CONSTRAINT [FK_CustomerReceiver_Customer]
GO
PRINT N'Dropping foreign keys from [APPS].[LegalEntity]'
GO
ALTER TABLE [APPS].[LegalEntity] DROP CONSTRAINT [FK_LegalEntity_SetofBook]
GO
PRINT N'Dropping foreign keys from [APPS].[Division]'
GO
ALTER TABLE [APPS].[Division] DROP CONSTRAINT [FK_Division_LegalEntity]
GO
PRINT N'Dropping foreign keys from [dbo].[StockAdjustmentReason]'
GO
ALTER TABLE [dbo].[StockAdjustmentReason] DROP CONSTRAINT [FK_StockAdjustmentReason_LegalEntity]
GO
PRINT N'Dropping foreign keys from [APPS].[SupplierReceiver]'
GO
--ALTER TABLE [APPS].[SupplierReceiver] DROP CONSTRAINT [FK_SupplierReceiver_Supplier]
--GO
PRINT N'Dropping foreign keys from [APPS].[Voucher]'
GO
ALTER TABLE [APPS].[Voucher] DROP CONSTRAINT [FK_Voucher_SetOfBook]
GO
--PRINT N'Dropping constraints from [APPS].[CustomerReceiver]'
--GO
--ALTER TABLE [APPS].[CustomerReceiver] DROP CONSTRAINT [PK_CustomerReceiver]
--GO
PRINT N'Dropping constraints from [APPS].[LegalEntity]'
GO
ALTER TABLE [APPS].[LegalEntity] DROP CONSTRAINT [PK_LegalEntity]
GO
PRINT N'Dropping constraints from [APPS].[LegalEntity]'
GO
ALTER TABLE [APPS].[LegalEntity] DROP CONSTRAINT [IX_Code_LegalEntity]
GO
--PRINT N'Dropping constraints from [APPS].[SupplierReceiver]'
--GO
--ALTER TABLE [APPS].[SupplierReceiver] DROP CONSTRAINT [PK_SupplierReceiver]
--GO
PRINT N'Dropping constraints from [dbo].[CustomerGroup]'
GO
ALTER TABLE [dbo].[CustomerGroup] DROP CONSTRAINT [PK_CustomerGroup]
GO
PRINT N'Dropping constraints from [dbo].[SupplierGroup]'
GO
ALTER TABLE [dbo].[SupplierGroup] DROP CONSTRAINT [PK_SupplierGroup]
GO
PRINT N'Dropping index [CX_LegalEntity] from [APPS].[LegalEntity]'
GO
DROP INDEX [CX_LegalEntity] ON [APPS].[LegalEntity]
GO
PRINT N'Dropping [dbo].[CustomerGroup]'
GO
DROP TABLE [dbo].[CustomerGroup]
GO
--PRINT N'Dropping [APPS].[SupplierReceiver]'
--GO
--DROP TABLE [APPS].[SupplierReceiver]
--GO
--PRINT N'Dropping [APPS].[CustomerReceiver]'
--GO
--DROP TABLE [APPS].[CustomerReceiver]
--GO
PRINT N'Altering [APPS].[CustomerBankAccount]'
GO
ALTER TABLE [APPS].[CustomerBankAccount] ADD
[AccountNumber] [nvarchar] (50) NULL,
[AccountName] [nvarchar] (500) NULL
GO
ALTER TABLE [APPS].[CustomerBankAccount] DROP
COLUMN [Name],
COLUMN [BankAccountName]
GO
EXEC sp_rename N'[APPS].[CustomerBankAccount].[CustomerId]', N'CustomerDetailId', N'COLUMN'
GO
EXEC sp_rename N'[APPS].[CustomerBankAccount].[BankBranch]', N'Branch', N'COLUMN'
GO
ALTER TABLE [APPS].[CustomerBankAccount] ALTER COLUMN [BankId] [uniqueidentifier] NULL
GO
PRINT N'Rebuilding [APPS].[LegalEntity]'
GO
CREATE TABLE [APPS].[RG_Recovery_1_LegalEntity]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[Code] [char] (2) NOT NULL,
[ShortName] [nvarchar] (500) NULL,
[Name] [nvarchar] (500) NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL
)
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_1_LegalEntity] ON
GO
INSERT INTO [APPS].[RG_Recovery_1_LegalEntity]([Id], [CX], [Disable], [SetOfBookId], [Code], [ShortName], [Name]) SELECT [Id], [CX], [Disable], [SetOfBookId], [Code], [ShortName], [Name] FROM [APPS].[LegalEntity]
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_1_LegalEntity] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[APPS].[LegalEntity]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[APPS].[RG_Recovery_1_LegalEntity]', RESEED, @idVal)
GO
DROP TABLE [APPS].[LegalEntity]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_1_LegalEntity]', N'LegalEntity', N'OBJECT'
GO
PRINT N'Creating index [CX_LegalEntity] on [APPS].[LegalEntity]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_LegalEntity] ON [APPS].[LegalEntity] ([CX])
GO
PRINT N'Creating primary key [PK_LegalEntity] on [APPS].[LegalEntity]'
GO
ALTER TABLE [APPS].[LegalEntity] ADD CONSTRAINT [PK_LegalEntity] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [APPS].[LegalEntity]'
GO
ALTER TABLE [APPS].[LegalEntity] ADD CONSTRAINT [IX_Code_LegalEntity] UNIQUE NONCLUSTERED  ([Code], [SetOfBookId])
GO
PRINT N'Altering [APPS].[EmployeeContact]'
GO
--ALTER TABLE [APPS].[EmployeeContact] ADD
--[Description] [nvarchar] (500) NULL
--GO
PRINT N'Altering [APPS].[SupplierContact]'
PRINT N'Altering [APPS].[CustomerContact]'
GO
EXEC sp_rename N'[APPS].[CustomerContact].[CustomerId]', N'CustomerDetailId', N'COLUMN'
GO
PRINT N'Creating [APPS].[CustomerDetail]'
GO
CREATE TABLE [APPS].[CustomerDetail]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[CustomerId] [uniqueidentifier] NOT NULL,
[CustomerGroupId] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[PaymentTermId] [uniqueidentifier] NULL,
[MaxDebtDays] [int] NULL,
[MaxDebtAmount] [float] NULL,
[StaffInCharge] [uniqueidentifier] NULL
)
GO
PRINT N'Creating primary key [PK_CustomerDetail] on [APPS].[CustomerDetail]'
GO
ALTER TABLE [APPS].[CustomerDetail] ADD CONSTRAINT [PK_CustomerDetail] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[CustomerGroup]'
GO
CREATE TABLE [APPS].[CustomerGroup]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[LegalEntityId] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_CustomerGroup] on [APPS].[CustomerGroup]'
GO
ALTER TABLE [APPS].[CustomerGroup] ADD CONSTRAINT [PK_CustomerGroup] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Rebuilding [dbo].[SupplierGroup]'
GO
CREATE TABLE [dbo].[RG_Recovery_2_SupplierGroup]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[LegalEntityId] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_2_SupplierGroup] ON
GO
INSERT INTO [dbo].[RG_Recovery_2_SupplierGroup]([Id], [CX], [Disable], [Name], [LegalEntityId]) SELECT [Id], [CX], [Disable], [Name], [LegalEntityId] FROM [dbo].[SupplierGroup]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_2_SupplierGroup] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[dbo].[SupplierGroup]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[dbo].[RG_Recovery_2_SupplierGroup]', RESEED, @idVal)
GO
DROP TABLE [dbo].[SupplierGroup]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_2_SupplierGroup]', N'SupplierGroup', N'OBJECT'
GO
PRINT N'Creating primary key [PK_SupplierGroup] on [dbo].[SupplierGroup]'
GO
ALTER TABLE [dbo].[SupplierGroup] ADD CONSTRAINT [PK_SupplierGroup] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[LegalEntity]'
GO
ALTER TABLE [APPS].[LegalEntity] ADD CONSTRAINT [FK_LegalEntity_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[CustomerBankAccount]'
GO
ALTER TABLE [APPS].[CustomerBankAccount] ADD CONSTRAINT [FK_CustomerBankAccount_Bank] FOREIGN KEY ([BankId]) REFERENCES [APPS].[Bank] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Division]'
GO
ALTER TABLE [APPS].[Division] ADD CONSTRAINT [FK_Division_LegalEntity] FOREIGN KEY ([LegalEntityId]) REFERENCES [APPS].[LegalEntity] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[StockAdjustmentReason]'
GO
ALTER TABLE [dbo].[StockAdjustmentReason] ADD CONSTRAINT [FK_StockAdjustmentReason_LegalEntity] FOREIGN KEY ([LegalEntityId]) REFERENCES [APPS].[LegalEntity] ([Id])
GO
