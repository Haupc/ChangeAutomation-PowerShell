-- <Migration ID="a377a10f-c2d9-480d-8a2d-5778d88fe381" />
GO

PRINT N'Dropping foreign keys from [APPSYS].[Notification]'
GO
ALTER TABLE [APPSYS].[Notification] DROP CONSTRAINT [FK_Notification_User]
GO
PRINT N'Dropping foreign keys from [APPSYS].[UserProfile]'
GO
ALTER TABLE [APPSYS].[UserProfile] DROP CONSTRAINT [FK_UserProfile_User]
GO
PRINT N'Dropping foreign keys from [APPS].[BankAccount]'
GO
ALTER TABLE [APPS].[BankAccount] DROP CONSTRAINT [FK_BankAccount_Bank]
GO
ALTER TABLE [APPS].[BankAccount] DROP CONSTRAINT [FK_BankAccount_SetOfBook]
GO
PRINT N'Dropping foreign keys from [APPS].[Currency]'
GO
ALTER TABLE [APPS].[Currency] DROP CONSTRAINT [FK_Currency_BusinessGroup]
GO
PRINT N'Dropping foreign keys from [APPS].[SetOfBook]'
GO
ALTER TABLE [APPS].[SetOfBook] DROP CONSTRAINT [FK_SetOfBook_Currency]
GO
PRINT N'Dropping foreign keys from [APPS].[Item]'
GO
ALTER TABLE [APPS].[Item] DROP CONSTRAINT [FK_Item_BusinessGroup]
GO
PRINT N'Dropping foreign keys from [APPS].[PaymentMethod]'
GO
ALTER TABLE [APPS].[PaymentMethod] DROP CONSTRAINT [FK_PaymentMethod_SetofBook]
GO
PRINT N'Dropping foreign keys from [APPS].[SupplierHeader]'
GO
ALTER TABLE [APPS].[SupplierHeader] DROP CONSTRAINT [FK_SupplierHeader_BusinessGroup]
GO
PRINT N'Dropping foreign keys from [APPS].[Tax]'
GO
ALTER TABLE [APPS].[Tax] DROP CONSTRAINT [FK_Tax_SetofBook1]
GO
PRINT N'Dropping foreign keys from [HR].[EmployeeGroup]'
GO
ALTER TABLE [HR].[EmployeeGroup] DROP CONSTRAINT [FK_EmployeeGroup_Employee]
GO
ALTER TABLE [HR].[EmployeeGroup] DROP CONSTRAINT [FK_EmployeeGroup_Group]
GO
PRINT N'Dropping foreign keys from [HR].[Employee]'
GO
ALTER TABLE [HR].[Employee] DROP CONSTRAINT [FK_Employee_BusinessGroup]
GO
ALTER TABLE [HR].[Employee] DROP CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [HR].[Employee] DROP CONSTRAINT [FK_Employee_JobLevel]
GO
ALTER TABLE [HR].[Employee] DROP CONSTRAINT [FK_Employee_JobTitle]
GO
PRINT N'Dropping foreign keys from [HR].[JobHistory]'
GO
ALTER TABLE [HR].[JobHistory] DROP CONSTRAINT [FK_JobHistory_Employee]
GO
PRINT N'Dropping foreign keys from [APPSYS].[User]'
GO
ALTER TABLE [APPSYS].[User] DROP CONSTRAINT [FK_User_Employee]
GO
PRINT N'Dropping foreign keys from [INV].[BinLocation]'
GO
ALTER TABLE [INV].[BinLocation] DROP CONSTRAINT [FK_BinLocation_Warehouse]
GO
PRINT N'Dropping foreign keys from [APPS].[AssetOrganization]'
GO
ALTER TABLE [APPS].[AssetOrganization] DROP CONSTRAINT [FK_AssetOrganization_Division]
GO
PRINT N'Dropping constraints from [APPSYS].[Notification]'
GO
ALTER TABLE [APPSYS].[Notification] DROP CONSTRAINT [PK_Notification]
GO
PRINT N'Dropping constraints from [APPSYS].[UserProfile]'
GO
ALTER TABLE [APPSYS].[UserProfile] DROP CONSTRAINT [PK_UserProfile]
GO
PRINT N'Dropping constraints from [APPS].[AssetOrganization]'
GO
ALTER TABLE [APPS].[AssetOrganization] DROP CONSTRAINT [IX_Code_AssetOrganization]
GO
PRINT N'Dropping constraints from [APPS].[BankAccount]'
GO
ALTER TABLE [APPS].[BankAccount] DROP CONSTRAINT [PK_BankAccount]
GO
PRINT N'Dropping constraints from [APPS].[CostCenter]'
GO
ALTER TABLE [APPS].[CostCenter] DROP CONSTRAINT [PK_CostCenter]
GO
PRINT N'Dropping constraints from [APPS].[Currency]'
GO
ALTER TABLE [APPS].[Currency] DROP CONSTRAINT [PK_FunctionalCurrency]
GO
PRINT N'Dropping constraints from [APPS].[FiscalCalendar]'
GO
ALTER TABLE [APPS].[FiscalCalendar] DROP CONSTRAINT [PK_FiscalCalendar]
GO
PRINT N'Dropping constraints from [APPS].[Item]'
GO
ALTER TABLE [APPS].[Item] DROP CONSTRAINT [PK_GoodItem]
GO
PRINT N'Dropping constraints from [APPS].[PaymentMethod]'
GO
ALTER TABLE [APPS].[PaymentMethod] DROP CONSTRAINT [PK_PaymentMethod]
GO
PRINT N'Dropping constraints from [APPS].[SupplierHeader]'
GO
ALTER TABLE [APPS].[SupplierHeader] DROP CONSTRAINT [PK_SupplierHeader]
GO
PRINT N'Dropping constraints from [APPS].[Tax]'
GO
ALTER TABLE [APPS].[Tax] DROP CONSTRAINT [PK_Tax]
GO
PRINT N'Dropping constraints from [APPS].[UnitOfMeasure]'
GO
ALTER TABLE [APPS].[UnitOfMeasure] DROP CONSTRAINT [PK_UOM]
GO
PRINT N'Dropping constraints from [AR].[Customer]'
GO
ALTER TABLE [AR].[Customer] DROP CONSTRAINT [PK_Customer]
GO
PRINT N'Dropping constraints from [HR].[EmployeeGroup]'
GO
ALTER TABLE [HR].[EmployeeGroup] DROP CONSTRAINT [PK_UserGroup]
GO
PRINT N'Dropping constraints from [HR].[Employee]'
GO
ALTER TABLE [HR].[Employee] DROP CONSTRAINT [PK_Employee]
GO
PRINT N'Dropping constraints from [HR].[Group]'
GO
ALTER TABLE [HR].[Group] DROP CONSTRAINT [PK_Group]
GO
PRINT N'Dropping constraints from [INV].[BinLocation]'
GO
ALTER TABLE [INV].[BinLocation] DROP CONSTRAINT [PK_Bin]
GO
PRINT N'Dropping constraints from [INV].[Warehouse]'
GO
ALTER TABLE [INV].[Warehouse] DROP CONSTRAINT [PK_Warehouse]
GO
PRINT N'Dropping constraints from [dbo].[CustomerGroup]'
GO
ALTER TABLE [dbo].[CustomerGroup] DROP CONSTRAINT [PK_CustomerGroup]
GO
PRINT N'Dropping constraints from [dbo].[Stock]'
GO
ALTER TABLE [dbo].[Stock] DROP CONSTRAINT [PK_Stock]
GO
PRINT N'Dropping constraints from [dbo].[SupplierGroup]'
GO
ALTER TABLE [dbo].[SupplierGroup] DROP CONSTRAINT [PK_SupplierGroup]
GO
PRINT N'Dropping index [IX_Code_Currency] from [APPS].[Currency]'
GO
DROP INDEX [IX_Code_Currency] ON [APPS].[Currency]
GO
PRINT N'Dropping index [CX_Notification] from [APPSYS].[Notification]'
GO
DROP INDEX [CX_Notification] ON [APPSYS].[Notification]
GO
PRINT N'Dropping index [IX_UserProfile] from [APPSYS].[UserProfile]'
GO
DROP INDEX [IX_UserProfile] ON [APPSYS].[UserProfile]
GO
PRINT N'Dropping index [CX_BankAccount] from [APPS].[BankAccount]'
GO
DROP INDEX [CX_BankAccount] ON [APPS].[BankAccount]
GO
PRINT N'Dropping index [CX_FunctionalCurrency] from [APPS].[Currency]'
GO
DROP INDEX [CX_FunctionalCurrency] ON [APPS].[Currency]
GO
PRINT N'Dropping index [CX_SupplierHeader] from [APPS].[SupplierHeader]'
GO
DROP INDEX [CX_SupplierHeader] ON [APPS].[SupplierHeader]
GO
PRINT N'Dropping index [CX_UserGroup] from [HR].[EmployeeGroup]'
GO
DROP INDEX [CX_UserGroup] ON [HR].[EmployeeGroup]
GO
PRINT N'Dropping index [CX_Employee] from [HR].[Employee]'
GO
DROP INDEX [CX_Employee] ON [HR].[Employee]
GO
PRINT N'Dropping index [CX_Group] from [HR].[Group]'
GO
DROP INDEX [CX_Group] ON [HR].[Group]
GO
PRINT N'Dropping [HR].[Group]'
GO
DROP TABLE [HR].[Group]
GO
PRINT N'Dropping [HR].[EmployeeGroup]'
GO
DROP TABLE [HR].[EmployeeGroup]
GO
PRINT N'Rebuilding [APPS].[BankAccount]'
GO
CREATE TABLE [APPS].[RG_Recovery_1_BankAccount]
(
[Id] [uniqueidentifier] NOT NULL,
[BankId] [uniqueidentifier] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[No] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[Description] [nvarchar] (500) NULL
)
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_1_BankAccount] ON
GO
INSERT INTO [APPS].[RG_Recovery_1_BankAccount]([Id], [BankId], [SetOfBookId], [CX], [Disable], [No], [Name], [Description]) SELECT [Id], [BankId], [SetOfBookId], [CX], [Disable], [No], [Name], [Description] FROM [APPS].[BankAccount]
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_1_BankAccount] OFF
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
PRINT N'Rebuilding [INV].[Warehouse]'
GO
CREATE TABLE [INV].[RG_Recovery_2_Warehouse]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[Location] [nvarchar] (500) NOT NULL,
[InventoryOrganizationId] [uniqueidentifier] NOT NULL
)
GO
SET IDENTITY_INSERT [INV].[RG_Recovery_2_Warehouse] ON
GO
INSERT INTO [INV].[RG_Recovery_2_Warehouse]([Id], [CX], [Disable], [Code], [Name], [Location], [InventoryOrganizationId]) SELECT [Id], [CX], [Disable], [Code], [Name], [Location], [InventoryOrganizationId] FROM [INV].[Warehouse]
GO
SET IDENTITY_INSERT [INV].[RG_Recovery_2_Warehouse] OFF
GO
DROP TABLE [INV].[Warehouse]
GO
EXEC sp_rename N'[INV].[RG_Recovery_2_Warehouse]', N'Warehouse', N'OBJECT'
GO
PRINT N'Creating primary key [PK_Warehouse] on [INV].[Warehouse]'
GO
ALTER TABLE [INV].[Warehouse] ADD CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Rebuilding [INV].[BinLocation]'
GO
CREATE TABLE [INV].[RG_Recovery_3_BinLocation]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Row] [nvarchar] (500) NOT NULL,
[Rack] [nvarchar] (500) NULL,
[Bin] [nvarchar] (500) NULL,
[WarehouseId] [uniqueidentifier] NOT NULL
)
GO
SET IDENTITY_INSERT [INV].[RG_Recovery_3_BinLocation] ON
GO
INSERT INTO [INV].[RG_Recovery_3_BinLocation]([Id], [CX], [Disable], [Row], [Rack], [Bin], [WarehouseId]) SELECT [Id], [CX], [Disable], [Row], [Rack], [Bin], [WarehouseId] FROM [INV].[BinLocation]
GO
SET IDENTITY_INSERT [INV].[RG_Recovery_3_BinLocation] OFF
GO
DROP TABLE [INV].[BinLocation]
GO
EXEC sp_rename N'[INV].[RG_Recovery_3_BinLocation]', N'BinLocation', N'OBJECT'
GO
PRINT N'Creating primary key [PK_Bin] on [INV].[BinLocation]'
GO
ALTER TABLE [INV].[BinLocation] ADD CONSTRAINT [PK_Bin] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Altering [APPS].[ChartOfAccount]'
GO
ALTER TABLE [APPS].[ChartOfAccount] ALTER COLUMN [AccountCode] [nvarchar] (100) NOT NULL
GO
PRINT N'Adding constraints to [APPS].[ChartOfAccount]'
GO
ALTER TABLE [APPS].[ChartOfAccount] ADD CONSTRAINT [IX_ChartOfAccount] UNIQUE NONCLUSTERED  ([AccountCode])
GO
PRINT N'Rebuilding [APPS].[Currency]'
GO
CREATE TABLE [APPS].[RG_Recovery_4_Currency]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (3) NULL,
[Name] [nvarchar] (500) NULL,
[Disable] [bit] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Sequence] [int] NOT NULL
)
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_4_Currency] ON
GO
INSERT INTO [APPS].[RG_Recovery_4_Currency]([Id], [BusinessGroupId], [Code], [Name], [Disable], [CX]) SELECT [Id], [BusinessGroupId], [Code], [Name], [Disable], [CX] FROM [APPS].[Currency]
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_4_Currency] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[APPS].[Currency]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[APPS].[RG_Recovery_4_Currency]', RESEED, @idVal)
GO
DROP TABLE [APPS].[Currency]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_4_Currency]', N'Currency', N'OBJECT'
GO
PRINT N'Creating index [CX_FunctionalCurrency] on [APPS].[Currency]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_FunctionalCurrency] ON [APPS].[Currency] ([CX])
GO
PRINT N'Creating primary key [PK_FunctionalCurrency] on [APPS].[Currency]'
GO
ALTER TABLE [APPS].[Currency] ADD CONSTRAINT [PK_FunctionalCurrency] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [APPS].[Currency]'
GO
ALTER TABLE [APPS].[Currency] ADD CONSTRAINT [IX_Code_Currency] UNIQUE NONCLUSTERED  ([Code])
GO
PRINT N'Rebuilding [HR].[Employee]'
GO
CREATE TABLE [HR].[RG_Recovery_5_Employee]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Code] [nvarchar] (50) NOT NULL,
[DisplayName] [nvarchar] (200) NULL,
[PrimaryEmail] [nvarchar] (500) NULL,
[AlternativeEmail] [nvarchar] (500) NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[JobTitleId] [uniqueidentifier] NOT NULL,
[JobLevelId] [uniqueidentifier] NOT NULL,
[JoinDate] [date] NOT NULL,
[EffectiveDate] [date] NULL,
[EndDate] [date] NULL,
[Status] [int] NOT NULL,
[Disable] [bit] NOT NULL
)
GO
SET IDENTITY_INSERT [HR].[RG_Recovery_5_Employee] ON
GO
INSERT INTO [HR].[RG_Recovery_5_Employee]([Id], [CX], [Code], [DisplayName], [PrimaryEmail], [AlternativeEmail], [BusinessGroupId], [JobTitleId], [JobLevelId], [JoinDate], [EffectiveDate], [EndDate], [Status]) SELECT [Id], [CX], [Code], [DisplayName], [PrimaryEmail], [AlternativeEmail], [BusinessGroupId], [JobTitleId], [JobLevelId], [JoinDate], [EffectiveDate], [EndDate], [Status] FROM [HR].[Employee]
GO
SET IDENTITY_INSERT [HR].[RG_Recovery_5_Employee] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[HR].[Employee]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[HR].[RG_Recovery_5_Employee]', RESEED, @idVal)
GO
DROP TABLE [HR].[Employee]
GO
EXEC sp_rename N'[HR].[RG_Recovery_5_Employee]', N'Employee', N'OBJECT'
GO
PRINT N'Creating index [CX_Employee] on [HR].[Employee]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Employee] ON [HR].[Employee] ([CX])
GO
PRINT N'Creating primary key [PK_Employee] on [HR].[Employee]'
GO
ALTER TABLE [HR].[Employee] ADD CONSTRAINT [PK_Employee] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [HR].[EmployeePosition]'
GO
CREATE TABLE [HR].[EmployeePosition]
(
[EmployeeId] [uniqueidentifier] NOT NULL,
[PositionId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
PRINT N'Creating index [CX_UserGroup] on [HR].[EmployeePosition]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_UserGroup] ON [HR].[EmployeePosition] ([CX])
GO
PRINT N'Creating primary key [PK_UserGroup] on [HR].[EmployeePosition]'
GO
ALTER TABLE [HR].[EmployeePosition] ADD CONSTRAINT [PK_UserGroup] PRIMARY KEY NONCLUSTERED  ([EmployeeId], [PositionId])
GO
PRINT N'Creating [HR].[Position]'
GO
CREATE TABLE [HR].[Position]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[DivisionId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (500) NOT NULL
)
GO
PRINT N'Creating index [CX_Group] on [HR].[Position]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Group] ON [HR].[Position] ([CX])
GO
PRINT N'Creating primary key [PK_Group] on [HR].[Position]'
GO
ALTER TABLE [HR].[Position] ADD CONSTRAINT [PK_Group] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Rebuilding [APPS].[Item]'
GO
CREATE TABLE [APPS].[RG_Recovery_6_Item]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (100) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL
)
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_6_Item] ON
GO
INSERT INTO [APPS].[RG_Recovery_6_Item]([Id], [CX], [Disable], [Code], [Name], [BusinessGroupId]) SELECT [Id], [CX], [Disable], [Code], [Name], [BusinessGroupId] FROM [APPS].[Item]
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_6_Item] OFF
GO
DROP TABLE [APPS].[Item]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_6_Item]', N'Item', N'OBJECT'
GO
PRINT N'Creating index [CX_Item] on [APPS].[Item]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Item] ON [APPS].[Item] ([CX])
GO
PRINT N'Creating primary key [PK_GoodItem] on [APPS].[Item]'
GO
ALTER TABLE [APPS].[Item] ADD CONSTRAINT [PK_GoodItem] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [APPS].[Item]'
GO
ALTER TABLE [APPS].[Item] ADD CONSTRAINT [IX_Item] UNIQUE NONCLUSTERED  ([Code], [BusinessGroupId])
GO
PRINT N'Rebuilding [APPSYS].[Notification]'
GO
CREATE TABLE [APPSYS].[RG_Recovery_7_Notification]
(
[Id] [uniqueidentifier] NOT NULL,
[Time] [datetime] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Status] [int] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Content] [ntext] NOT NULL
)
GO
SET IDENTITY_INSERT [APPSYS].[RG_Recovery_7_Notification] ON
GO
INSERT INTO [APPSYS].[RG_Recovery_7_Notification]([Id], [Time], [CX], [Status], [UserId], [Content]) SELECT [Id], [Time], [CX], [Status], [UserId], [Content] FROM [APPSYS].[Notification]
GO
SET IDENTITY_INSERT [APPSYS].[RG_Recovery_7_Notification] OFF
GO
DROP TABLE [APPSYS].[Notification]
GO
EXEC sp_rename N'[APPSYS].[RG_Recovery_7_Notification]', N'Notification', N'OBJECT'
GO
PRINT N'Creating index [CX_Notification] on [APPSYS].[Notification]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Notification] ON [APPSYS].[Notification] ([CX])
GO
PRINT N'Creating primary key [PK_Notification] on [APPSYS].[Notification]'
GO
ALTER TABLE [APPSYS].[Notification] ADD CONSTRAINT [PK_Notification] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Rebuilding [APPS].[PaymentMethod]'
GO
CREATE TABLE [APPS].[RG_Recovery_8_PaymentMethod]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[MethodName] [nvarchar] (50) NOT NULL,
[Sequence] [int] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL
)
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_8_PaymentMethod] ON
GO
INSERT INTO [APPS].[RG_Recovery_8_PaymentMethod]([Id], [CX], [Disable], [MethodName], [Sequence], [SetOfBookId]) SELECT [Id], [CX], [Disable], [MethodName], [Sequence], [SetOfBookId] FROM [APPS].[PaymentMethod]
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_8_PaymentMethod] OFF
GO
DROP TABLE [APPS].[PaymentMethod]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_8_PaymentMethod]', N'PaymentMethod', N'OBJECT'
GO
PRINT N'Creating index [CX_PaymentMethod] on [APPS].[PaymentMethod]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_PaymentMethod] ON [APPS].[PaymentMethod] ([CX])
GO
PRINT N'Creating primary key [PK_PaymentMethod] on [APPS].[PaymentMethod]'
GO
ALTER TABLE [APPS].[PaymentMethod] ADD CONSTRAINT [PK_PaymentMethod] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Rebuilding [APPS].[SupplierHeader]'
GO
CREATE TABLE [APPS].[RG_Recovery_9_SupplierHeader]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Name] [nvarchar] (50) NOT NULL
)
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_9_SupplierHeader] ON
GO
INSERT INTO [APPS].[RG_Recovery_9_SupplierHeader]([Id], [BusinessGroupId], [CX], [Disable], [Name]) SELECT [Id], [BusinessGroupId], [CX], [Disable], [Name] FROM [APPS].[SupplierHeader]
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_9_SupplierHeader] OFF
GO
DROP TABLE [APPS].[SupplierHeader]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_9_SupplierHeader]', N'SupplierHeader', N'OBJECT'
GO
PRINT N'Creating index [CX_SupplierHeader] on [APPS].[SupplierHeader]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_SupplierHeader] ON [APPS].[SupplierHeader] ([CX])
GO
PRINT N'Creating primary key [PK_SupplierHeader] on [APPS].[SupplierHeader]'
GO
ALTER TABLE [APPS].[SupplierHeader] ADD CONSTRAINT [PK_SupplierHeader] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Rebuilding [APPS].[Tax]'
GO
CREATE TABLE [APPS].[RG_Recovery_10_Tax]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[Rate] [decimal] (18, 4) NOT NULL,
[Description] [nvarchar] (500) NULL,
[Percent] [float] NOT NULL
)
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_10_Tax] ON
GO
INSERT INTO [APPS].[RG_Recovery_10_Tax]([Id], [CX], [Disable], [SetOfBookId], [Code], [Name], [Description], [Percent]) SELECT [Id], [CX], [Disable], [SetOfBookId], [TaxCode], [Name], [Description], [Percent] FROM [APPS].[Tax]
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_10_Tax] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[APPS].[Tax]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[APPS].[RG_Recovery_10_Tax]', RESEED, @idVal)
GO
DROP TABLE [APPS].[Tax]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_10_Tax]', N'Tax', N'OBJECT'
GO
PRINT N'Creating index [CX_Tax] on [APPS].[Tax]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Tax] ON [APPS].[Tax] ([CX])
GO
PRINT N'Creating primary key [PK_Tax] on [APPS].[Tax]'
GO
ALTER TABLE [APPS].[Tax] ADD CONSTRAINT [PK_Tax] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Rebuilding [APPSYS].[UserProfile]'
GO
CREATE TABLE [APPSYS].[RG_Recovery_11_UserProfile]
(
[Id] [uniqueidentifier] NOT NULL,
[Key] [nvarchar] (200) NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Value] [ntext] NOT NULL
)
GO
SET IDENTITY_INSERT [APPSYS].[RG_Recovery_11_UserProfile] ON
GO
INSERT INTO [APPSYS].[RG_Recovery_11_UserProfile]([Id], [Key], [UserId], [CX], [Value]) SELECT [Id], [Key], [UserId], [CX], [Value] FROM [APPSYS].[UserProfile]
GO
SET IDENTITY_INSERT [APPSYS].[RG_Recovery_11_UserProfile] OFF
GO
DROP TABLE [APPSYS].[UserProfile]
GO
EXEC sp_rename N'[APPSYS].[RG_Recovery_11_UserProfile]', N'UserProfile', N'OBJECT'
GO
PRINT N'Creating index [CX_UserProfile] on [APPSYS].[UserProfile]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_UserProfile] ON [APPSYS].[UserProfile] ([CX])
GO
PRINT N'Creating primary key [PK_UserProfile] on [APPSYS].[UserProfile]'
GO
ALTER TABLE [APPSYS].[UserProfile] ADD CONSTRAINT [PK_UserProfile] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Altering [APPSYS].[SystemConfiguration]'
GO
ALTER TABLE [APPSYS].[SystemConfiguration] ADD
[CX] [bigint] NOT NULL IDENTITY(1, 1)
GO
PRINT N'Rebuilding [AR].[Customer]'
GO
CREATE TABLE [AR].[RG_Recovery_12_Customer]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL
)
GO
SET IDENTITY_INSERT [AR].[RG_Recovery_12_Customer] ON
GO
INSERT INTO [AR].[RG_Recovery_12_Customer]([Id], [BusinessGroupId], [CX], [Disable], [Code], [Name]) SELECT [Id], [BusinessGroupId], [CX], [Disable], [Code], [Name] FROM [AR].[Customer]
GO
SET IDENTITY_INSERT [AR].[RG_Recovery_12_Customer] OFF
GO
DROP TABLE [AR].[Customer]
GO
EXEC sp_rename N'[AR].[RG_Recovery_12_Customer]', N'Customer', N'OBJECT'
GO
PRINT N'Creating primary key [PK_Customer] on [AR].[Customer]'
GO
ALTER TABLE [AR].[Customer] ADD CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Rebuilding [dbo].[CustomerGroup]'
GO
CREATE TABLE [dbo].[RG_Recovery_13_CustomerGroup]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[LegalEntityId] [uniqueidentifier] NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_13_CustomerGroup] ON
GO
INSERT INTO [dbo].[RG_Recovery_13_CustomerGroup]([Id], [CX], [Disable], [Name], [LegalEntityId]) SELECT [Id], [CX], [Disable], [Name], [LegalEntityId] FROM [dbo].[CustomerGroup]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_13_CustomerGroup] OFF
GO
DROP TABLE [dbo].[CustomerGroup]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_13_CustomerGroup]', N'CustomerGroup', N'OBJECT'
GO
PRINT N'Creating primary key [PK_CustomerGroup] on [dbo].[CustomerGroup]'
GO
ALTER TABLE [dbo].[CustomerGroup] ADD CONSTRAINT [PK_CustomerGroup] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Rebuilding [dbo].[Stock]'
GO
CREATE TABLE [dbo].[RG_Recovery_14_Stock]
(
[Id] [uniqueidentifier] NOT NULL,
[GoodItemId] [uniqueidentifier] NOT NULL,
[WarehouseId] [uniqueidentifier] NOT NULL,
[Quantity] [decimal] (18, 4) NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_14_Stock] ON
GO
INSERT INTO [dbo].[RG_Recovery_14_Stock]([Id], [GoodItemId], [WarehouseId], [Quantity], [CX], [Disable]) SELECT [Id], [GoodItemId], [WarehouseId], [Quantity], [CX], [Disable] FROM [dbo].[Stock]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_14_Stock] OFF
GO
DROP TABLE [dbo].[Stock]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_14_Stock]', N'Stock', N'OBJECT'
GO
PRINT N'Creating primary key [PK_Stock] on [dbo].[Stock]'
GO
ALTER TABLE [dbo].[Stock] ADD CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Rebuilding [dbo].[SupplierGroup]'
GO
CREATE TABLE [dbo].[RG_Recovery_15_SupplierGroup]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[LegalEntityId] [uniqueidentifier] NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_15_SupplierGroup] ON
GO
INSERT INTO [dbo].[RG_Recovery_15_SupplierGroup]([Id], [CX], [Disable], [Name], [LegalEntityId]) SELECT [Id], [CX], [Disable], [Name], [LegalEntityId] FROM [dbo].[SupplierGroup]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_15_SupplierGroup] OFF
GO
DROP TABLE [dbo].[SupplierGroup]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_15_SupplierGroup]', N'SupplierGroup', N'OBJECT'
GO
PRINT N'Creating primary key [PK_SupplierGroup] on [dbo].[SupplierGroup]'
GO
ALTER TABLE [dbo].[SupplierGroup] ADD CONSTRAINT [PK_SupplierGroup] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [APPS].[AssetOrganization]'
GO
ALTER TABLE [APPS].[AssetOrganization] ADD CONSTRAINT [CX_Code_AssetOrganization] UNIQUE CLUSTERED  ([Code], [DivisionId])
GO
PRINT N'Creating index [CX_CostCenter] on [APPS].[CostCenter]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_CostCenter] ON [APPS].[CostCenter] ([CX])
GO
PRINT N'Creating index [CX_FiscalCalendar] on [APPS].[FiscalCalendar]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_FiscalCalendar] ON [APPS].[FiscalCalendar] ([CX])
GO
PRINT N'Creating index [CX_InventoryOrganization] on [APPS].[InventoryOrganization]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_InventoryOrganization] ON [APPS].[InventoryOrganization] ([CX])
GO
PRINT N'Creating index [CX_ProjectOrganization] on [APPS].[ProjectOrganization]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_ProjectOrganization] ON [APPS].[ProjectOrganization] ([CX])
GO
PRINT N'Creating index [CX_UnitOfMeasure] on [APPS].[UnitOfMeasure]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_UnitOfMeasure] ON [APPS].[UnitOfMeasure] ([CX])
GO
PRINT N'Creating primary key [PK_CostCenter] on [APPS].[CostCenter]'
GO
ALTER TABLE [APPS].[CostCenter] ADD CONSTRAINT [PK_CostCenter] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [APPS].[DescriptiveFlexField]'
GO
ALTER TABLE [APPS].[DescriptiveFlexField] ADD CONSTRAINT [IX_DescriptiveFlexField] UNIQUE NONCLUSTERED  ([Code], [BusinessGroupId])
GO
PRINT N'Creating primary key [PK_FiscalCalendar] on [APPS].[FiscalCalendar]'
GO
ALTER TABLE [APPS].[FiscalCalendar] ADD CONSTRAINT [PK_FiscalCalendar] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [APPS].[KeyFlexField]'
GO
ALTER TABLE [APPS].[KeyFlexField] ADD CONSTRAINT [IX_KeyFlexField] UNIQUE NONCLUSTERED  ([Code], [BusinessGroupId])
GO
PRINT N'Creating primary key [PK_UOM] on [APPS].[UnitOfMeasure]'
GO
ALTER TABLE [APPS].[UnitOfMeasure] ADD CONSTRAINT [PK_UOM] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [APPSYS].[Notification]'
GO
ALTER TABLE [APPSYS].[Notification] ADD CONSTRAINT [FK_Notification_User] FOREIGN KEY ([UserId]) REFERENCES [APPSYS].[User] ([Id])
GO
PRINT N'Adding foreign keys to [APPSYS].[UserProfile]'
GO
ALTER TABLE [APPSYS].[UserProfile] ADD CONSTRAINT [FK_UserProfile_User] FOREIGN KEY ([UserId]) REFERENCES [APPSYS].[User] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[BankAccount]'
GO
ALTER TABLE [APPS].[BankAccount] ADD CONSTRAINT [FK_BankAccount_Bank] FOREIGN KEY ([BankId]) REFERENCES [APPS].[Bank] ([Id])
GO
ALTER TABLE [APPS].[BankAccount] ADD CONSTRAINT [FK_BankAccount_SetOfBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Currency]'
GO
ALTER TABLE [APPS].[Currency] ADD CONSTRAINT [FK_Currency_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Item]'
GO
ALTER TABLE [APPS].[Item] ADD CONSTRAINT [FK_Item_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[PaymentMethod]'
GO
ALTER TABLE [APPS].[PaymentMethod] ADD CONSTRAINT [FK_PaymentMethod_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[SupplierHeader]'
GO
ALTER TABLE [APPS].[SupplierHeader] ADD CONSTRAINT [FK_SupplierHeader_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Tax]'
GO
ALTER TABLE [APPS].[Tax] ADD CONSTRAINT [FK_Tax_SetofBook1] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [HR].[EmployeePosition]'
GO
ALTER TABLE [HR].[EmployeePosition] ADD CONSTRAINT [FK_EmployeeGroup_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [HR].[Employee] ([Id])
GO
ALTER TABLE [HR].[EmployeePosition] ADD CONSTRAINT [FK_EmployeeGroup_Group] FOREIGN KEY ([PositionId]) REFERENCES [HR].[Position] ([Id])
GO
PRINT N'Adding foreign keys to [HR].[Employee]'
GO
ALTER TABLE [HR].[Employee] ADD CONSTRAINT [FK_Employee_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
ALTER TABLE [HR].[Employee] ADD CONSTRAINT [FK_Employee_Department] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[HROrganization] ([Id])
GO
ALTER TABLE [HR].[Employee] ADD CONSTRAINT [FK_Employee_JobLevel] FOREIGN KEY ([JobLevelId]) REFERENCES [HR].[JobLevel] ([Id])
GO
ALTER TABLE [HR].[Employee] ADD CONSTRAINT [FK_Employee_JobTitle] FOREIGN KEY ([JobTitleId]) REFERENCES [HR].[JobTitle] ([Id])
GO
PRINT N'Adding foreign keys to [HR].[Position]'
GO
ALTER TABLE [HR].[Position] ADD CONSTRAINT [FK_Position_Division] FOREIGN KEY ([DivisionId]) REFERENCES [APPS].[Division] ([Id])
GO
PRINT N'Adding foreign keys to [INV].[BinLocation]'
GO
ALTER TABLE [INV].[BinLocation] ADD CONSTRAINT [FK_BinLocation_Warehouse] FOREIGN KEY ([WarehouseId]) REFERENCES [INV].[Warehouse] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[AssetOrganization]'
GO
ALTER TABLE [APPS].[AssetOrganization] ADD CONSTRAINT [FK_AssetOrganization_Division] FOREIGN KEY ([DivisionId]) REFERENCES [APPS].[Division] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[SetOfBook]'
GO
ALTER TABLE [APPS].[SetOfBook] ADD CONSTRAINT [FK_SetOfBook_Currency] FOREIGN KEY ([CurrencyId]) REFERENCES [APPS].[Currency] ([Id])
GO
PRINT N'Adding foreign keys to [HR].[JobHistory]'
GO
ALTER TABLE [HR].[JobHistory] ADD CONSTRAINT [FK_JobHistory_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [HR].[Employee] ([Id])
GO
PRINT N'Adding foreign keys to [APPSYS].[User]'
GO
ALTER TABLE [APPSYS].[User] ADD CONSTRAINT [FK_User_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [HR].[Employee] ([Id])
GO
