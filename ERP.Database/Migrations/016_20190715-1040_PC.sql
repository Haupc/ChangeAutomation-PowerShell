-- <Migration ID="a3421d16-1bd4-4efd-abd6-392706be463b" />
GO

PRINT N'Dropping foreign keys from [APPS].[CustomerBankAccount]'
GO
ALTER TABLE [APPS].[CustomerBankAccount] DROP CONSTRAINT [FK_CustomerBankAccount_Customer]
GO
ALTER TABLE [APPS].[CustomerBankAccount] DROP CONSTRAINT [FK_CustomerBankAccount_Province]
GO
PRINT N'Dropping foreign keys from [APPS].[Customer]'
GO
ALTER TABLE [APPS].[Customer] DROP CONSTRAINT [FK_Customer_BusinessGroup]
GO
ALTER TABLE [APPS].[Customer] DROP CONSTRAINT [FK_Customer_CustomerReceiver]
GO
PRINT N'Dropping foreign keys from [APPS].[CustomerContact]'
GO
ALTER TABLE [APPS].[CustomerContact] DROP CONSTRAINT [FK_CustomerContact_Customer]
GO
PRINT N'Dropping constraints from [APPS].[CustomerBankAccount]'
GO
ALTER TABLE [APPS].[CustomerBankAccount] DROP CONSTRAINT [PK_CustomerBankAccount]
GO
PRINT N'Dropping constraints from [APPS].[Customer]'
GO
ALTER TABLE [APPS].[Customer] DROP CONSTRAINT [PK_Customer]
GO
PRINT N'Dropping constraints from [APPS].[Supplier]'
GO
ALTER TABLE [APPS].[Supplier] DROP CONSTRAINT [PK_Supplier]
GO
PRINT N'Dropping index [CX_Supplier] from [APPS].[Supplier]'
GO
DROP INDEX [CX_Supplier] ON [APPS].[Supplier]
GO
PRINT N'Rebuilding [APPS].[Customer]'
GO
CREATE TABLE [APPS].[RG_Recovery_1_Customer]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[Address] [nvarchar] (500) NULL,
[TaxCode] [nvarchar] (100) NULL,
[Description] [nvarchar] (500) NULL,
[Status] [int] NOT NULL
)
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_1_Customer] ON
GO
INSERT INTO [APPS].[RG_Recovery_1_Customer]([Id], [BusinessGroupId], [CX], [Disable], [Code], [Name], [Address], [TaxCode], [Description]) SELECT [Id], [BusinessGroupId], [CX], [Disable], [Code], [Name], [Address], [TaxCode], [Description] FROM [APPS].[Customer]
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_1_Customer] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[APPS].[Customer]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[APPS].[RG_Recovery_1_Customer]', RESEED, @idVal)
GO
DROP TABLE [APPS].[Customer]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_1_Customer]', N'Customer', N'OBJECT'
GO
PRINT N'Creating primary key [PK_Customer] on [APPS].[Customer]'
GO
ALTER TABLE [APPS].[Customer] ADD CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Rebuilding [APPS].[CustomerBankAccount]'
GO
CREATE TABLE [APPS].[RG_Recovery_2_CustomerBankAccount]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (100) NOT NULL,
[CustomerId] [uniqueidentifier] NOT NULL,
[BankId] [uniqueidentifier] NOT NULL,
[BankAccountName] [nvarchar] (50) NOT NULL,
[BankBranch] [nvarchar] (500) NOT NULL,
[ProvinceId] [uniqueidentifier] NOT NULL
)
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_2_CustomerBankAccount] ON
GO
INSERT INTO [APPS].[RG_Recovery_2_CustomerBankAccount]([Id], [CX], [Name], [CustomerId], [BankId], [BankAccountName], [ProvinceId]) SELECT [Id], [CX], [Name], [CustomerId], [BankId], [BankAccountName], [ProvinceId] FROM [APPS].[CustomerBankAccount]
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_2_CustomerBankAccount] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[APPS].[CustomerBankAccount]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[APPS].[RG_Recovery_2_CustomerBankAccount]', RESEED, @idVal)
GO
DROP TABLE [APPS].[CustomerBankAccount]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_2_CustomerBankAccount]', N'CustomerBankAccount', N'OBJECT'
GO
PRINT N'Creating primary key [PK_CustomerBankAccount] on [APPS].[CustomerBankAccount]'
GO
ALTER TABLE [APPS].[CustomerBankAccount] ADD CONSTRAINT [PK_CustomerBankAccount] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Rebuilding [APPS].[Supplier]'
GO
CREATE TABLE [APPS].[RG_Recovery_3_Supplier]
(
[Id] [uniqueidentifier] NOT NULL,
[TaxCode] [nvarchar] (50) NULL,
[Name] [nvarchar] (500) NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Status] [int] NOT NULL,
[Address] [nvarchar] (500) NULL,
[Description] [nvarchar] (500) NULL,
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (50) NOT NULL
)
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_3_Supplier] ON
GO
INSERT INTO [APPS].[RG_Recovery_3_Supplier]([Id], [TaxCode], [Name], [BusinessGroupId], [CX]) SELECT [Id], [TaxCode], [Name], [BusinessGroupId], [CX] FROM [APPS].[Supplier]
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_3_Supplier] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[APPS].[Supplier]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[APPS].[RG_Recovery_3_Supplier]', RESEED, @idVal)
GO
DROP TABLE [APPS].[Supplier]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_3_Supplier]', N'Supplier', N'OBJECT'
GO
PRINT N'Creating index [CX_Supplier] on [APPS].[Supplier]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Supplier] ON [APPS].[Supplier] ([CX])
GO
PRINT N'Creating primary key [PK_Supplier] on [APPS].[Supplier]'
GO
ALTER TABLE [APPS].[Supplier] ADD CONSTRAINT [PK_Supplier] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[SupplierBankAccount]'
GO
CREATE TABLE [APPS].[SupplierBankAccount]
(
[Id] [uniqueidentifier] NOT NULL,
[SupplierId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (100) NOT NULL,
[BankId] [uniqueidentifier] NOT NULL,
[BankAccountName] [nvarchar] (20) NOT NULL,
[BankBranch] [nvarchar] (100) NOT NULL,
[ProvinceId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_SupplierBankAccount] on [APPS].[SupplierBankAccount]'
GO
ALTER TABLE [APPS].[SupplierBankAccount] ADD CONSTRAINT [PK_SupplierBankAccount] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[SupplierContact]'
GO
CREATE TABLE [APPS].[SupplierContact]
(
[Id] [uniqueidentifier] NOT NULL,
[SupplierId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Phone] [nvarchar] (20) NOT NULL,
[Email] [nvarchar] (100) NULL,
[Address] [nvarchar] (500) NULL,
[Name] [nvarchar] (500) NOT NULL
)
GO
PRINT N'Creating primary key [PK_SupplierContact] on [APPS].[SupplierContact]'
GO
ALTER TABLE [APPS].[SupplierContact] ADD CONSTRAINT [PK_SupplierContact] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[SupplierReceiver]'
GO
CREATE TABLE [APPS].[SupplierReceiver]
(
[Id] [uniqueidentifier] NOT NULL,
[SupplierId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Name] [nchar] (10) NOT NULL,
[Email] [nvarchar] (100) NULL,
[Phone] [nvarchar] (20) NOT NULL,
[Address] [nvarchar] (500) NULL
)
GO
PRINT N'Creating primary key [PK_SupplierReceiver] on [APPS].[SupplierReceiver]'
GO
ALTER TABLE [APPS].[SupplierReceiver] ADD CONSTRAINT [PK_SupplierReceiver] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[CustomerBankAccount]'
GO
ALTER TABLE [APPS].[CustomerBankAccount] ADD CONSTRAINT [FK_CustomerBankAccount_Bank] FOREIGN KEY ([BankId]) REFERENCES [APPS].[Bank] ([Id])
GO
ALTER TABLE [APPS].[CustomerBankAccount] ADD CONSTRAINT [FK_CustomerBankAccount_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [APPS].[Customer] ([Id])
GO
ALTER TABLE [APPS].[CustomerBankAccount] ADD CONSTRAINT [FK_CustomerBankAccount_Province] FOREIGN KEY ([ProvinceId]) REFERENCES [APPS].[Province] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[CustomerReceiver]'
GO
ALTER TABLE [APPS].[CustomerReceiver] ADD CONSTRAINT [FK_CustomerReceiver_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [APPS].[Customer] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Customer]'
GO
ALTER TABLE [APPS].[Customer] ADD CONSTRAINT [FK_Customer_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[SupplierBankAccount]'
GO
ALTER TABLE [APPS].[SupplierBankAccount] ADD CONSTRAINT [FK_SupplierBankAccount_Supplier] FOREIGN KEY ([SupplierId]) REFERENCES [APPS].[Supplier] ([Id])
GO
ALTER TABLE [APPS].[SupplierBankAccount] ADD CONSTRAINT [FK_SupplierBankAccount_Bank] FOREIGN KEY ([BankId]) REFERENCES [APPS].[Bank] ([Id])
GO
ALTER TABLE [APPS].[SupplierBankAccount] ADD CONSTRAINT [FK_SupplierBankAccount_Province] FOREIGN KEY ([ProvinceId]) REFERENCES [APPS].[Province] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[SupplierContact]'
GO
ALTER TABLE [APPS].[SupplierContact] ADD CONSTRAINT [FK_SupplierContact_Supplier] FOREIGN KEY ([SupplierId]) REFERENCES [APPS].[Supplier] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[SupplierReceiver]'
GO
ALTER TABLE [APPS].[SupplierReceiver] ADD CONSTRAINT [FK_SupplierReceiver_Supplier] FOREIGN KEY ([SupplierId]) REFERENCES [APPS].[Supplier] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Supplier]'
GO
ALTER TABLE [APPS].[Supplier] ADD CONSTRAINT [FK_Supplier_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[CustomerContact]'
GO
ALTER TABLE [APPS].[CustomerContact] ADD CONSTRAINT [FK_CustomerContact_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [APPS].[Customer] ([Id])
GO
