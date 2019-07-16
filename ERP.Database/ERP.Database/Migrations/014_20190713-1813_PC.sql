-- <Migration ID="04cd6b05-ee50-4ad6-859d-8f43f6a858bc" />
GO

PRINT N'Dropping foreign keys from [APPS].[Employee]'
GO
ALTER TABLE [APPS].[Employee] DROP CONSTRAINT [FK_Employee_BusinessGroup]
GO
ALTER TABLE [APPS].[Employee] DROP CONSTRAINT [FK_Employee_JobLevel]
GO
ALTER TABLE [APPS].[Employee] DROP CONSTRAINT [FK_Employee_JobTitle]
GO
PRINT N'Dropping foreign keys from [HR].[EmployeePosition]'
GO
ALTER TABLE [HR].[EmployeePosition] DROP CONSTRAINT [FK_EmployeeGroup_Employee]
GO
PRINT N'Dropping foreign keys from [HR].[JobHistory]'
GO
ALTER TABLE [HR].[JobHistory] DROP CONSTRAINT [FK_JobHistory_Employee]
GO
PRINT N'Dropping foreign keys from [dbo].[StockAdjustment]'
GO
ALTER TABLE [dbo].[StockAdjustment] DROP CONSTRAINT [FK_StockAdjustment_Employee]
GO
PRINT N'Dropping foreign keys from [dbo].[StockRequest]'
GO
ALTER TABLE [dbo].[StockRequest] DROP CONSTRAINT [FK_StockRequest_Employee]
GO
PRINT N'Dropping foreign keys from [APPSYS].[User]'
GO
ALTER TABLE [APPSYS].[User] DROP CONSTRAINT [FK_User_Employee]
GO
PRINT N'Dropping foreign keys from [APPS].[UnitOfMeasure]'
GO
ALTER TABLE [APPS].[UnitOfMeasure] DROP CONSTRAINT [FK_UnitOfMeasure_BusinessGroup]
GO
PRINT N'Dropping foreign keys from [dbo].[StockRequestDetail]'
GO
ALTER TABLE [dbo].[StockRequestDetail] DROP CONSTRAINT [FK_StockRequestDetail_UnitOfMeasure]
GO
PRINT N'Dropping foreign keys from [APPS].[Tax]'
GO
ALTER TABLE [APPS].[Tax] DROP CONSTRAINT [FK_Tax_UnitOfMeasure]
GO
PRINT N'Dropping foreign keys from [APPS].[TaxTemplateDetail]'
GO
ALTER TABLE [APPS].[TaxTemplateDetail] DROP CONSTRAINT [FK_TaxTemplateDetail_UnitOfMeasure]
GO
PRINT N'Dropping constraints from [APPS].[Employee]'
GO
ALTER TABLE [APPS].[Employee] DROP CONSTRAINT [PK_Employee]
GO
PRINT N'Dropping constraints from [APPS].[UnitOfMeasure]'
GO
ALTER TABLE [APPS].[UnitOfMeasure] DROP CONSTRAINT [PK_UOM]
GO
PRINT N'Dropping index [CX_Employee] from [APPS].[Employee]'
GO
DROP INDEX [CX_Employee] ON [APPS].[Employee]
GO
PRINT N'Dropping index [CX_UnitOfMeasure] from [APPS].[UnitOfMeasure]'
GO
DROP INDEX [CX_UnitOfMeasure] ON [APPS].[UnitOfMeasure]
GO
PRINT N'Altering [APPS].[BusinessGroup]'
GO
ALTER TABLE [APPS].[BusinessGroup] ADD
[Description] [nvarchar] (500) NULL
GO
PRINT N'Altering [APPS].[Bank]'
GO
ALTER TABLE [APPS].[Bank] ADD
[Description] [nvarchar] (500) NULL
GO
PRINT N'Altering [APPS].[Currency]'
GO
ALTER TABLE [APPS].[Currency] ADD
[Description] [nvarchar] (500) NULL
GO
PRINT N'Altering [APPS].[Customer]'
GO
ALTER TABLE [APPS].[Customer] ADD
[Address] [nvarchar] (500) NULL,
[TaxCode] [nvarchar] (100) NULL,
[Description] [nvarchar] (500) NULL
GO
PRINT N'Creating [dbo].[CustomerReceiver]'
GO
CREATE TABLE [dbo].[CustomerReceiver]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (100) NOT NULL,
[Email] [nvarchar] (100) NULL,
[Phone] [nvarchar] (20) NOT NULL,
[Address] [nvarchar] (500) NULL,
[CustomerId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_CustomerReceiver] on [dbo].[CustomerReceiver]'
GO
ALTER TABLE [dbo].[CustomerReceiver] ADD CONSTRAINT [PK_CustomerReceiver] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[CustomerBankAccount]'
GO
CREATE TABLE [APPS].[CustomerBankAccount]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Name] [nchar] (10) NOT NULL,
[CustomerId] [uniqueidentifier] NOT NULL,
[BankId] [uniqueidentifier] NOT NULL,
[BankAccountName] [nvarchar] (50) NULL,
[Branch] [nvarchar] (500) NULL,
[ProvinceId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_CustomerBankAccount] on [APPS].[CustomerBankAccount]'
GO
ALTER TABLE [APPS].[CustomerBankAccount] ADD CONSTRAINT [PK_CustomerBankAccount] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[Province]'
GO
CREATE TABLE [APPS].[Province]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (100) NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
PRINT N'Creating primary key [PK_Province] on [APPS].[Province]'
GO
ALTER TABLE [APPS].[Province] ADD CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[CustomerContact]'
GO
CREATE TABLE [APPS].[CustomerContact]
(
[Id] [uniqueidentifier] NOT NULL,
[CustomerId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Phone] [nvarchar] (20) NOT NULL,
[Email] [nvarchar] (100) NULL,
[Address] [nvarchar] (500) NULL,
[Name] [nvarchar] (500) NOT NULL
)
GO
PRINT N'Creating primary key [PK_CustomerContact] on [APPS].[CustomerContact]'
GO
ALTER TABLE [APPS].[CustomerContact] ADD CONSTRAINT [PK_CustomerContact] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Rebuilding [APPS].[Employee]'
GO
CREATE TABLE [APPS].[RG_Recovery_1_Employee]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Code] [nchar] (5) NOT NULL,
[DisplayName] [nvarchar] (100) NOT NULL,
[PrimaryEmail] [nvarchar] (500) NULL,
[AlternativeEmail] [nvarchar] (500) NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[JobTitleId] [uniqueidentifier] NOT NULL,
[JobLevelId] [uniqueidentifier] NOT NULL,
[JoinDate] [date] NOT NULL,
[EffectiveDate] [date] NULL,
[EndDate] [date] NULL,
[Status] [int] NOT NULL,
[Disable] [bit] NOT NULL,
[Gender] [bit] NOT NULL,
[IdNumber] [nvarchar] (20) NULL,
[IssueDate] [date] NULL,
[IssueLocation] [nvarchar] (100) NULL,
[TaxCode] [nvarchar] (100) NULL,
[Salary] [bigint] NULL,
[SalaryFactor] [float] NULL,
[InsuranceSalary] [bigint] NULL,
[NoDependentPerson] [int] NULL,
[BankId] [uniqueidentifier] NULL,
[BankAccount] [nvarchar] (50) NULL,
[BankAccountName] [nvarchar] (50) NULL,
[BankBranch] [nvarchar] (50) NULL,
[BankAddress] [nvarchar] (50) NULL,
[Phone] [nvarchar] (20) NULL,
[ProvinceId] [uniqueidentifier] NULL,
[Description] [nvarchar] (500) NULL
)
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_1_Employee] ON
GO
INSERT INTO [APPS].[RG_Recovery_1_Employee]([Id], [CX], [Code], [DisplayName], [PrimaryEmail], [AlternativeEmail], [BusinessGroupId], [JobTitleId], [JobLevelId], [JoinDate], [EffectiveDate], [EndDate], [Status], [Disable]) SELECT [Id], [CX], [Code], [DisplayName], [PrimaryEmail], [AlternativeEmail], [BusinessGroupId], [JobTitleId], [JobLevelId], [JoinDate], [EffectiveDate], [EndDate], [Status], [Disable] FROM [APPS].[Employee]
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_1_Employee] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[APPS].[Employee]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[APPS].[RG_Recovery_1_Employee]', RESEED, @idVal)
GO
DROP TABLE [APPS].[Employee]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_1_Employee]', N'Employee', N'OBJECT'
GO
PRINT N'Creating index [CX_Employee] on [APPS].[Employee]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Employee] ON [APPS].[Employee] ([CX])
GO
PRINT N'Creating primary key [PK_Employee] on [APPS].[Employee]'
GO
ALTER TABLE [APPS].[Employee] ADD CONSTRAINT [PK_Employee] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Altering [APPS].[JobLevel]'
GO
ALTER TABLE [APPS].[JobLevel] ADD
[Description] [nvarchar] (500) NULL
GO
PRINT N'Altering [APPS].[JobTitle]'
GO
ALTER TABLE [APPS].[JobTitle] ADD
[Description] [nvarchar] (500) NULL
GO
ALTER TABLE [APPS].[JobTitle] ALTER COLUMN [Code] [nvarchar] (50) NOT NULL
GO
PRINT N'Creating [APPS].[EmployeeContact]'
GO
CREATE TABLE [APPS].[EmployeeContact]
(
[Id] [uniqueidentifier] NOT NULL,
[EmployeeId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (50) NOT NULL,
[Email] [nvarchar] (50) NULL,
[Phone] [nvarchar] (50) NOT NULL,
[Address] [nvarchar] (500) NULL
)
GO
PRINT N'Creating primary key [PK_EmployeeContact] on [APPS].[EmployeeContact]'
GO
ALTER TABLE [APPS].[EmployeeContact] ADD CONSTRAINT [PK_EmployeeContact] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Rebuilding [APPS].[UnitOfMeasure]'
GO
CREATE TABLE [APPS].[RG_Recovery_2_UnitOfMeasure]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[Type] [nvarchar] (50) NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (10) NOT NULL,
[Description] [nvarchar] (500) NULL
)
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_2_UnitOfMeasure] ON
GO
INSERT INTO [APPS].[RG_Recovery_2_UnitOfMeasure]([Id], [Name], [Type], [BusinessGroupId], [CX], [Disable]) SELECT [Id], [Name], [Type], [BusinessGroupId], [CX], [Disable] FROM [APPS].[UnitOfMeasure]
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_2_UnitOfMeasure] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[APPS].[UnitOfMeasure]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[APPS].[RG_Recovery_2_UnitOfMeasure]', RESEED, @idVal)
GO
DROP TABLE [APPS].[UnitOfMeasure]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_2_UnitOfMeasure]', N'UnitOfMeasure', N'OBJECT'
GO
PRINT N'Creating index [CX_UnitOfMeasure] on [APPS].[UnitOfMeasure]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_UnitOfMeasure] ON [APPS].[UnitOfMeasure] ([CX])
GO
PRINT N'Creating primary key [PK_UOM] on [APPS].[UnitOfMeasure]'
GO
ALTER TABLE [APPS].[UnitOfMeasure] ADD CONSTRAINT [PK_UOM] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Employee]'
GO
ALTER TABLE [APPS].[Employee] ADD CONSTRAINT [FK_Employee_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
ALTER TABLE [APPS].[Employee] ADD CONSTRAINT [FK_Employee_JobLevel] FOREIGN KEY ([JobLevelId]) REFERENCES [APPS].[JobLevel] ([Id])
GO
ALTER TABLE [APPS].[Employee] ADD CONSTRAINT [FK_Employee_JobTitle] FOREIGN KEY ([JobTitleId]) REFERENCES [APPS].[JobTitle] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[UnitOfMeasure]'
GO
ALTER TABLE [APPS].[UnitOfMeasure] ADD CONSTRAINT [FK_UnitOfMeasure_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[CustomerBankAccount]'
GO
ALTER TABLE [APPS].[CustomerBankAccount] ADD CONSTRAINT [FK_CustomerBankAccount_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [APPS].[Customer] ([Id])
GO
ALTER TABLE [APPS].[CustomerBankAccount] ADD CONSTRAINT [FK_CustomerBankAccount_Province] FOREIGN KEY ([ProvinceId]) REFERENCES [APPS].[Province] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[CustomerContact]'
GO
ALTER TABLE [APPS].[CustomerContact] ADD CONSTRAINT [FK_CustomerContact_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [APPS].[Customer] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Customer]'
GO
ALTER TABLE [APPS].[Customer] ADD CONSTRAINT [FK_Customer_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
ALTER TABLE [APPS].[Customer] ADD CONSTRAINT [FK_Customer_CustomerReceiver] FOREIGN KEY ([Id]) REFERENCES [dbo].[CustomerReceiver] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[EmployeeContact]'
GO
ALTER TABLE [APPS].[EmployeeContact] ADD CONSTRAINT [FK_EmployeeContact_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [APPS].[Employee] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Employee]'
GO
ALTER TABLE [APPS].[Employee] ADD CONSTRAINT [FK_Employee_Bank] FOREIGN KEY ([BankId]) REFERENCES [APPS].[Bank] ([Id])
GO
ALTER TABLE [APPS].[Employee] ADD CONSTRAINT [FK_Employee_Province] FOREIGN KEY ([ProvinceId]) REFERENCES [APPS].[Province] ([Id])
GO
PRINT N'Adding foreign keys to [HR].[EmployeePosition]'
GO
ALTER TABLE [HR].[EmployeePosition] ADD CONSTRAINT [FK_EmployeeGroup_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [APPS].[Employee] ([Id])
GO
PRINT N'Adding foreign keys to [HR].[JobHistory]'
GO
ALTER TABLE [HR].[JobHistory] ADD CONSTRAINT [FK_JobHistory_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [APPS].[Employee] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[StockAdjustment]'
GO
ALTER TABLE [dbo].[StockAdjustment] ADD CONSTRAINT [FK_StockAdjustment_Employee] FOREIGN KEY ([RequesterId]) REFERENCES [APPS].[Employee] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[StockRequest]'
GO
ALTER TABLE [dbo].[StockRequest] ADD CONSTRAINT [FK_StockRequest_Employee] FOREIGN KEY ([RequesterId]) REFERENCES [APPS].[Employee] ([Id])
GO
PRINT N'Adding foreign keys to [APPSYS].[User]'
GO
ALTER TABLE [APPSYS].[User] ADD CONSTRAINT [FK_User_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [APPS].[Employee] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[StockRequestDetail]'
GO
ALTER TABLE [dbo].[StockRequestDetail] ADD CONSTRAINT [FK_StockRequestDetail_UnitOfMeasure] FOREIGN KEY ([UnitOfMeasureId]) REFERENCES [APPS].[UnitOfMeasure] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Tax]'
GO
ALTER TABLE [APPS].[Tax] ADD CONSTRAINT [FK_Tax_UnitOfMeasure] FOREIGN KEY ([UnitOfMeasureId]) REFERENCES [APPS].[UnitOfMeasure] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[TaxTemplateDetail]'
GO
ALTER TABLE [APPS].[TaxTemplateDetail] ADD CONSTRAINT [FK_TaxTemplateDetail_UnitOfMeasure] FOREIGN KEY ([UnitOfMeasureId]) REFERENCES [APPS].[UnitOfMeasure] ([Id])
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Bank Account of employee', 'SCHEMA', N'APPS', 'TABLE', N'Employee', 'COLUMN', N'BankAccount'
GO
