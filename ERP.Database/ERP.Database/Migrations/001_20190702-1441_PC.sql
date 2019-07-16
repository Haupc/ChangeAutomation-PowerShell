-- <Migration ID="37d01100-75dd-407d-801c-ed9ecdb40e67" />
GO

PRINT N'Creating schemas'
GO
CREATE SCHEMA [AP]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [APPS]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [APPSYS]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [AR]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [HR]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [INV]
AUTHORIZATION [dbo]
GO
PRINT N'Creating [APPS].[SetOfBook]'
GO
CREATE TABLE [APPS].[SetOfBook]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [char] (2) NOT NULL,
[ShortCode] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
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
PRINT N'Creating [APPS].[AccountType]'
GO
CREATE TABLE [APPS].[AccountType]
(
[Id] [uniqueidentifier] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bigint] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[Description] [nvarchar] (500) NULL
)
GO
PRINT N'Creating index [CX_AccountType] on [APPS].[AccountType]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_AccountType] ON [APPS].[AccountType] ([CX])
GO
PRINT N'Creating primary key [PK_AccountType] on [APPS].[AccountType]'
GO
ALTER TABLE [APPS].[AccountType] ADD CONSTRAINT [PK_AccountType] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[Division]'
GO
CREATE TABLE [APPS].[Division]
(
[Id] [uniqueidentifier] NOT NULL,
[LegalEntityId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Code] [nchar] (3) NOT NULL,
[ShortCode] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (50) NOT NULL
)
GO
PRINT N'Creating index [CX_Division] on [APPS].[Division]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Division] ON [APPS].[Division] ([CX])
GO
PRINT N'Creating primary key [PK_Division] on [APPS].[Division]'
GO
ALTER TABLE [APPS].[Division] ADD CONSTRAINT [PK_Division] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [APPS].[Division]'
GO
ALTER TABLE [APPS].[Division] ADD CONSTRAINT [IX_Code_Division] UNIQUE NONCLUSTERED  ([Code], [LegalEntityId])
GO
PRINT N'Creating [APPS].[AssetOrganization]'
GO
CREATE TABLE [APPS].[AssetOrganization]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nchar] (4) NOT NULL,
[ShortCode] [nvarchar] (10) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[DivisionId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
PRINT N'Creating primary key [PK_AssetOrganization] on [APPS].[AssetOrganization]'
GO
ALTER TABLE [APPS].[AssetOrganization] ADD CONSTRAINT [PK_AssetOrganization] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [APPS].[AssetOrganization]'
GO
ALTER TABLE [APPS].[AssetOrganization] ADD CONSTRAINT [IX_Code_AssetOrganization] UNIQUE NONCLUSTERED  ([Code], [DivisionId])
GO
PRINT N'Creating [APPSYS].[User]'
GO
CREATE TABLE [APPSYS].[User]
(
[Id] [uniqueidentifier] NOT NULL,
[Username] [nvarchar] (50) NOT NULL,
[Password] [nvarchar] (50) NOT NULL,
[EmployeeId] [uniqueidentifier] NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[IsSysUser] [bit] NOT NULL,
[IsActive] [bit] NOT NULL,
[Salt] [nvarchar] (50) NULL
)
GO
PRINT N'Creating index [CX_User] on [APPSYS].[User]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_User] ON [APPSYS].[User] ([CX])
GO
PRINT N'Creating primary key [PK_User] on [APPSYS].[User]'
GO
ALTER TABLE [APPSYS].[User] ADD CONSTRAINT [PK_User] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPSYS].[AuditLog]'
GO
CREATE TABLE [APPSYS].[AuditLog]
(
[Id] [uniqueidentifier] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[ClassName] [nvarchar] (500) NOT NULL,
[MethodName] [nvarchar] (500) NOT NULL,
[OldData] [ntext] NULL,
[NewData] [ntext] NOT NULL,
[Time] [datetime] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
PRINT N'Creating index [CX_AuditLog] on [APPSYS].[AuditLog]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_AuditLog] ON [APPSYS].[AuditLog] ([CX])
GO
PRINT N'Creating primary key [PK_AuditLog] on [APPSYS].[AuditLog]'
GO
ALTER TABLE [APPSYS].[AuditLog] ADD CONSTRAINT [PK_AuditLog] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[BusinessGroup]'
GO
CREATE TABLE [APPS].[BusinessGroup]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Code] [char] (2) NOT NULL,
[ShortCode] [nvarchar] (10) NOT NULL,
[Name] [nvarchar] (500) NOT NULL
)
GO
PRINT N'Creating index [CX_BusinessGroup] on [APPS].[BusinessGroup]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_BusinessGroup] ON [APPS].[BusinessGroup] ([CX])
GO
PRINT N'Creating primary key [PK_BusinessGroup] on [APPS].[BusinessGroup]'
GO
ALTER TABLE [APPS].[BusinessGroup] ADD CONSTRAINT [PK_BusinessGroup] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [APPS].[BusinessGroup]'
GO
ALTER TABLE [APPS].[BusinessGroup] ADD CONSTRAINT [IX_Code_BusinessGroup] UNIQUE NONCLUSTERED  ([Code])
GO
PRINT N'Creating [APPS].[Bank]'
GO
CREATE TABLE [APPS].[Bank]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Bank] on [APPS].[Bank]'
GO
ALTER TABLE [APPS].[Bank] ADD CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[ChartOfAccount]'
GO
CREATE TABLE [APPS].[ChartOfAccount]
(
[Id] [uniqueidentifier] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[AccountCode] [nvarchar] (500) NOT NULL,
[AliasCode] [nvarchar] (500) NULL,
[AccountName] [nvarchar] (1000) NOT NULL,
[AccountDescription] [nvarchar] (2000) NULL,
[AccountType] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating index [CX_ChartOfAccount] on [APPS].[ChartOfAccount]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_ChartOfAccount] ON [APPS].[ChartOfAccount] ([CX])
GO
PRINT N'Creating primary key [PK_ChartOfAccount] on [APPS].[ChartOfAccount]'
GO
ALTER TABLE [APPS].[ChartOfAccount] ADD CONSTRAINT [PK_ChartOfAccount] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[CustomerHeader]'
GO
CREATE TABLE [APPS].[CustomerHeader]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Name] [nvarchar] (50) NOT NULL
)
GO
PRINT N'Creating index [CX_CustomerHeader] on [APPS].[CustomerHeader]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_CustomerHeader] ON [APPS].[CustomerHeader] ([CX])
GO
PRINT N'Creating primary key [PK_CustomerHeader] on [APPS].[CustomerHeader]'
GO
ALTER TABLE [APPS].[CustomerHeader] ADD CONSTRAINT [PK_CustomerHeader] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [APPS].[CustomerHeader]'
GO
ALTER TABLE [APPS].[CustomerHeader] ADD CONSTRAINT [IX_Name_CustomerHeader] UNIQUE NONCLUSTERED  ([Name])
GO
PRINT N'Creating [APPS].[HROrganization]'
GO
CREATE TABLE [APPS].[HROrganization]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nchar] (4) NOT NULL,
[ShortCode] [nvarchar] (10) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[DivisionId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
PRINT N'Creating index [CX_Department] on [APPS].[HROrganization]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Department] ON [APPS].[HROrganization] ([CX])
GO
PRINT N'Creating primary key [PK_Department] on [APPS].[HROrganization]'
GO
ALTER TABLE [APPS].[HROrganization] ADD CONSTRAINT [PK_Department] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [APPS].[HROrganization]'
GO
ALTER TABLE [APPS].[HROrganization] ADD CONSTRAINT [IX_Code_Department] UNIQUE NONCLUSTERED  ([Code], [DivisionId])
GO
PRINT N'Creating [APPS].[DescriptiveFledField]'
GO
CREATE TABLE [APPS].[DescriptiveFledField]
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
PRINT N'Creating index [CX_DescriptiveFledField] on [APPS].[DescriptiveFledField]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_DescriptiveFledField] ON [APPS].[DescriptiveFledField] ([CX])
GO
PRINT N'Creating primary key [PK_DescriptiveFledField] on [APPS].[DescriptiveFledField]'
GO
ALTER TABLE [APPS].[DescriptiveFledField] ADD CONSTRAINT [PK_DescriptiveFledField] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[LegalEntity]'
GO
CREATE TABLE [APPS].[LegalEntity]
(
[Id] [uniqueidentifier] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Code] [char] (2) NULL,
[ShortCode] [nchar] (10) NULL,
[Name] [nvarchar] (500) NULL
)
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
PRINT N'Creating [HR].[Employee]'
GO
CREATE TABLE [HR].[Employee]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Code] [nvarchar] (50) NOT NULL,
[DisplayName] [nvarchar] (200) NULL,
[PrimaryEmail] [nvarchar] (500) NULL,
[AlternativeEmail] [nvarchar] (500) NULL,
[DepartmentId] [uniqueidentifier] NOT NULL,
[JobTitleId] [uniqueidentifier] NOT NULL,
[JobLevelId] [uniqueidentifier] NOT NULL,
[JoinDate] [date] NOT NULL,
[EffectiveDate] [date] NULL,
[EndDate] [date] NULL,
[Status] [int] NOT NULL
)
GO
PRINT N'Creating index [CX_Employee] on [HR].[Employee]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Employee] ON [HR].[Employee] ([CX])
GO
PRINT N'Creating primary key [PK_Employee] on [HR].[Employee]'
GO
ALTER TABLE [HR].[Employee] ADD CONSTRAINT [PK_Employee] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [HR].[JobLevel]'
GO
CREATE TABLE [HR].[JobLevel]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[Level] [float] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
PRINT N'Creating index [CX_JobLevel] on [HR].[JobLevel]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_JobLevel] ON [HR].[JobLevel] ([CX])
GO
PRINT N'Creating primary key [PK_JobLevel] on [HR].[JobLevel]'
GO
ALTER TABLE [HR].[JobLevel] ADD CONSTRAINT [PK_JobLevel] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [HR].[JobTitle]'
GO
CREATE TABLE [HR].[JobTitle]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NULL,
[Name] [nvarchar] (500) NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
PRINT N'Creating index [CX_JobTitle] on [HR].[JobTitle]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_JobTitle] ON [HR].[JobTitle] ([CX])
GO
PRINT N'Creating primary key [PK_JobTitle] on [HR].[JobTitle]'
GO
ALTER TABLE [HR].[JobTitle] ADD CONSTRAINT [PK_JobTitle] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [HR].[EmployeeGroup]'
GO
CREATE TABLE [HR].[EmployeeGroup]
(
[EmployeeId] [uniqueidentifier] NOT NULL,
[GroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL
)
GO
PRINT N'Creating index [CX_UserGroup] on [HR].[EmployeeGroup]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_UserGroup] ON [HR].[EmployeeGroup] ([CX])
GO
PRINT N'Creating primary key [PK_UserGroup] on [HR].[EmployeeGroup]'
GO
ALTER TABLE [HR].[EmployeeGroup] ADD CONSTRAINT [PK_UserGroup] PRIMARY KEY NONCLUSTERED  ([EmployeeId], [GroupId])
GO
PRINT N'Creating [HR].[Group]'
GO
CREATE TABLE [HR].[Group]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[OrganizationId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (500) NOT NULL
)
GO
PRINT N'Creating index [CX_Group] on [HR].[Group]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Group] ON [HR].[Group] ([CX])
GO
PRINT N'Creating primary key [PK_Group] on [HR].[Group]'
GO
ALTER TABLE [HR].[Group] ADD CONSTRAINT [PK_Group] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[FiscalCalendar]'
GO
CREATE TABLE [APPS].[FiscalCalendar]
(
[Id] [uniqueidentifier] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Year] [int] NOT NULL,
[StartDate] [datetime] NOT NULL,
[EndDate] [datetime] NOT NULL
)
GO
PRINT N'Creating primary key [PK_FiscalCalendar] on [APPS].[FiscalCalendar]'
GO
ALTER TABLE [APPS].[FiscalCalendar] ADD CONSTRAINT [PK_FiscalCalendar] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[Currency]'
GO
CREATE TABLE [APPS].[Currency]
(
[Id] [uniqueidentifier] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (3) NULL,
[Name] [nvarchar] (500) NULL,
[IsMain] [bit] NOT NULL,
[Disable] [bit] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
PRINT N'Creating index [CX_FunctionalCurrency] on [APPS].[Currency]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_FunctionalCurrency] ON [APPS].[Currency] ([CX])
GO
PRINT N'Creating primary key [PK_FunctionalCurrency] on [APPS].[Currency]'
GO
ALTER TABLE [APPS].[Currency] ADD CONSTRAINT [PK_FunctionalCurrency] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_Code_Currency] on [APPS].[Currency]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Code_Currency] ON [APPS].[Currency] ([Code])
GO
PRINT N'Creating [APPS].[InventoryOrganization]'
GO
CREATE TABLE [APPS].[InventoryOrganization]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nchar] (4) NOT NULL,
[ShortCode] [nvarchar] (10) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[DivisionId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
PRINT N'Creating primary key [PK_InventoryOrganization] on [APPS].[InventoryOrganization]'
GO
ALTER TABLE [APPS].[InventoryOrganization] ADD CONSTRAINT [PK_InventoryOrganization] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [APPS].[InventoryOrganization]'
GO
ALTER TABLE [APPS].[InventoryOrganization] ADD CONSTRAINT [IX_Code_InventoryOrganization] UNIQUE NONCLUSTERED  ([Code], [DivisionId])
GO
PRINT N'Creating [HR].[JobHistory]'
GO
CREATE TABLE [HR].[JobHistory]
(
[Id] [uniqueidentifier] NOT NULL,
[EmployeeId] [uniqueidentifier] NOT NULL,
[DepartmentId] [uniqueidentifier] NOT NULL,
[StartDate] [date] NOT NULL,
[EndDate] [date] NULL,
[Status] [nvarchar] (50) NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
PRINT N'Creating index [CX_JobHistory] on [HR].[JobHistory]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_JobHistory] ON [HR].[JobHistory] ([CX])
GO
PRINT N'Creating primary key [PK_JobHistory] on [HR].[JobHistory]'
GO
ALTER TABLE [HR].[JobHistory] ADD CONSTRAINT [PK_JobHistory] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[KeyFlexField]'
GO
CREATE TABLE [APPS].[KeyFlexField]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[Description] [nvarchar] (500) NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
PRINT N'Creating index [CX_KeyFlexField] on [APPS].[KeyFlexField]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_KeyFlexField] ON [APPS].[KeyFlexField] ([CX])
GO
PRINT N'Creating primary key [PK_KeyFlexField] on [APPS].[KeyFlexField]'
GO
ALTER TABLE [APPS].[KeyFlexField] ADD CONSTRAINT [PK_KeyFlexField] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPSYS].[Notification]'
GO
CREATE TABLE [APPSYS].[Notification]
(
[Id] [uniqueidentifier] NOT NULL,
[Time] [datetime] NOT NULL,
[CX] [bigint] NOT NULL,
[Status] [int] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Content] [ntext] NOT NULL
)
GO
PRINT N'Creating index [CX_Notification] on [APPSYS].[Notification]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Notification] ON [APPSYS].[Notification] ([CX])
GO
PRINT N'Creating primary key [PK_Notification] on [APPSYS].[Notification]'
GO
ALTER TABLE [APPSYS].[Notification] ADD CONSTRAINT [PK_Notification] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPSYS].[Feature]'
GO
CREATE TABLE [APPSYS].[Feature]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (500) NOT NULL,
[Disable] [bit] NOT NULL
)
GO
PRINT N'Creating index [CX_Feature] on [APPSYS].[Feature]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Feature] ON [APPSYS].[Feature] ([CX])
GO
PRINT N'Creating primary key [PK_Feature] on [APPSYS].[Feature]'
GO
ALTER TABLE [APPSYS].[Feature] ADD CONSTRAINT [PK_Feature] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPSYS].[Operation]'
GO
CREATE TABLE [APPSYS].[Operation]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (2000) NOT NULL,
[FeatureId] [uniqueidentifier] NOT NULL,
[Disable] [bit] NOT NULL
)
GO
PRINT N'Creating index [CX_Operation] on [APPSYS].[Operation]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Operation] ON [APPSYS].[Operation] ([CX])
GO
PRINT N'Creating primary key [PK_APPSYS.Operation] on [APPSYS].[Operation]'
GO
ALTER TABLE [APPSYS].[Operation] ADD CONSTRAINT [PK_APPSYS.Operation] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[PaymentMethod]'
GO
CREATE TABLE [APPS].[PaymentMethod]
(
[Id] [uniqueidentifier] NOT NULL,
[MethodName] [nvarchar] (50) NOT NULL,
[AccountName] [nvarchar] (50) NOT NULL,
[Sequence] [int] NOT NULL,
[CX] [bigint] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_PaymentMethod] on [APPS].[PaymentMethod]'
GO
ALTER TABLE [APPS].[PaymentMethod] ADD CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[PaymentTerm]'
GO
CREATE TABLE [APPS].[PaymentTerm]
(
[Id] [uniqueidentifier] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[Day] [int] NOT NULL,
[Default] [bit] NOT NULL,
[Sequence] [int] NOT NULL,
[Disable] [bit] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
PRINT N'Creating index [CX_PaymentTerm] on [APPS].[PaymentTerm]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_PaymentTerm] ON [APPS].[PaymentTerm] ([CX])
GO
PRINT N'Creating primary key [PK_PaymentTerm] on [APPS].[PaymentTerm]'
GO
ALTER TABLE [APPS].[PaymentTerm] ADD CONSTRAINT [PK_PaymentTerm] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[ProjectOrganization]'
GO
CREATE TABLE [APPS].[ProjectOrganization]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nchar] (4) NOT NULL,
[ShortCode] [nvarchar] (10) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[DivisionId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ProjectOrganization] on [APPS].[ProjectOrganization]'
GO
ALTER TABLE [APPS].[ProjectOrganization] ADD CONSTRAINT [PK_ProjectOrganization] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [APPS].[ProjectOrganization]'
GO
ALTER TABLE [APPS].[ProjectOrganization] ADD CONSTRAINT [IX_Code_ProjectOrganization] UNIQUE NONCLUSTERED  ([Code], [DivisionId])
GO
PRINT N'Creating [APPS].[SupplierHeader]'
GO
CREATE TABLE [APPS].[SupplierHeader]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[Name] [nvarchar] (50) NOT NULL
)
GO
PRINT N'Creating index [CX_SupplierHeader] on [APPS].[SupplierHeader]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_SupplierHeader] ON [APPS].[SupplierHeader] ([CX])
GO
PRINT N'Creating primary key [PK_SupplierHeader] on [APPS].[SupplierHeader]'
GO
ALTER TABLE [APPS].[SupplierHeader] ADD CONSTRAINT [PK_SupplierHeader] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[Tax]'
GO
CREATE TABLE [APPS].[Tax]
(
[Id] [uniqueidentifier] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[TaxCode] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[Description] [nvarchar] (500) NULL,
[Percent] [float] NOT NULL,
[Disable] [bit] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Tax] on [APPS].[Tax]'
GO
ALTER TABLE [APPS].[Tax] ADD CONSTRAINT [PK_Tax] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[UnitOfMeasure]'
GO
CREATE TABLE [APPS].[UnitOfMeasure]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[AllowedPrecision] [int] NOT NULL,
[Type] [nvarchar] (50) NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[BusinessGroupId] [uniqueidentifier] NULL
)
GO
PRINT N'Creating primary key [PK_UOM] on [APPS].[UnitOfMeasure]'
GO
ALTER TABLE [APPS].[UnitOfMeasure] ADD CONSTRAINT [PK_UOM] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [APPSYS].[UserProfile]'
GO
CREATE TABLE [APPSYS].[UserProfile]
(
[Id] [uniqueidentifier] NOT NULL,
[Key] [nvarchar] (200) NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Value] [ntext] NOT NULL
)
GO
PRINT N'Creating index [IX_UserProfile] on [APPSYS].[UserProfile]'
GO
CREATE UNIQUE CLUSTERED INDEX [IX_UserProfile] ON [APPSYS].[UserProfile] ([CX])
GO
PRINT N'Creating primary key [PK_UserProfile] on [APPSYS].[UserProfile]'
GO
ALTER TABLE [APPSYS].[UserProfile] ADD CONSTRAINT [PK_UserProfile] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPSYS].[SystemConfiguration]'
GO
CREATE TABLE [APPSYS].[SystemConfiguration]
(
[Key] [nvarchar] (50) NOT NULL,
[Value] [nvarchar] (2000) NOT NULL
)
GO
PRINT N'Creating primary key [PK_SystemConfiguration] on [APPSYS].[SystemConfiguration]'
GO
ALTER TABLE [APPSYS].[SystemConfiguration] ADD CONSTRAINT [PK_SystemConfiguration] PRIMARY KEY CLUSTERED  ([Key])
GO
PRINT N'Creating [APPS].[CostCenter]'
GO
CREATE TABLE [APPS].[CostCenter]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (500) NOT NULL,
[Name] [nvarchar] (500) NULL,
[ParentId] [uniqueidentifier] NOT NULL,
[Disable] [bit] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[ChartOfAccountId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_CostCenter] on [APPS].[CostCenter]'
GO
ALTER TABLE [APPS].[CostCenter] ADD CONSTRAINT [PK_CostCenter] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[GoodItem]'
GO
CREATE TABLE [APPS].[GoodItem]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[InventoryOrganizationId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_GoodItem] on [APPS].[GoodItem]'
GO
ALTER TABLE [APPS].[GoodItem] ADD CONSTRAINT [PK_GoodItem] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [AP].[SupplierHeaderValue]'
GO
CREATE TABLE [AP].[SupplierHeaderValue]
(
[Id] [uniqueidentifier] NOT NULL,
[SupplierId] [uniqueidentifier] NOT NULL,
[SupplierHeaderId] [uniqueidentifier] NULL,
[Value] [nvarchar] (500) NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
PRINT N'Creating index [CX_SupplierHeaderValue] on [AP].[SupplierHeaderValue]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_SupplierHeaderValue] ON [AP].[SupplierHeaderValue] ([CX])
GO
PRINT N'Creating primary key [PK_SupplierHeaderValue] on [AP].[SupplierHeaderValue]'
GO
ALTER TABLE [AP].[SupplierHeaderValue] ADD CONSTRAINT [PK_SupplierHeaderValue] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [AP].[SupplierSite]'
GO
CREATE TABLE [AP].[SupplierSite]
(
[Id] [uniqueidentifier] NOT NULL,
[SupplierId] [uniqueidentifier] NOT NULL,
[DivisionId] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
PRINT N'Creating index [CX_SupplierSite] on [AP].[SupplierSite]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_SupplierSite] ON [AP].[SupplierSite] ([CX])
GO
PRINT N'Creating primary key [PK_SupplierSite] on [AP].[SupplierSite]'
GO
ALTER TABLE [AP].[SupplierSite] ADD CONSTRAINT [PK_SupplierSite] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [AP].[Supplier]'
GO
CREATE TABLE [AP].[Supplier]
(
[Id] [uniqueidentifier] NOT NULL,
[TaxCode] [nvarchar] (50) NULL,
[Name] [nvarchar] (500) NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
PRINT N'Creating primary key [PK_Supplier] on [AP].[Supplier]'
GO
ALTER TABLE [AP].[Supplier] ADD CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [AR].[CustomerSite]'
GO
CREATE TABLE [AR].[CustomerSite]
(
[Id] [uniqueidentifier] NOT NULL,
[CustomerId] [uniqueidentifier] NOT NULL,
[DivisionId] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
PRINT N'Creating index [CX_CustomerSite] on [AR].[CustomerSite]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_CustomerSite] ON [AR].[CustomerSite] ([CX])
GO
PRINT N'Creating primary key [PK_CustomerSite] on [AR].[CustomerSite]'
GO
ALTER TABLE [AR].[CustomerSite] ADD CONSTRAINT [PK_CustomerSite] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [AR].[Customer]'
GO
CREATE TABLE [AR].[Customer]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Customer] on [AR].[Customer]'
GO
ALTER TABLE [AR].[Customer] ADD CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [INV].[Bin]'
GO
CREATE TABLE [INV].[Bin]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[RackId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Bin] on [INV].[Bin]'
GO
ALTER TABLE [INV].[Bin] ADD CONSTRAINT [PK_Bin] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [INV].[Rack]'
GO
CREATE TABLE [INV].[Rack]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[RowId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Rack] on [INV].[Rack]'
GO
ALTER TABLE [INV].[Rack] ADD CONSTRAINT [PK_Rack] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [INV].[Row]'
GO
CREATE TABLE [INV].[Row]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[WarehouseId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Row] on [INV].[Row]'
GO
ALTER TABLE [INV].[Row] ADD CONSTRAINT [PK_Row] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [INV].[Warehouse]'
GO
CREATE TABLE [INV].[Warehouse]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[Location] [nvarchar] (500) NOT NULL,
[InventoryOrganizationId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Warehouse] on [INV].[Warehouse]'
GO
ALTER TABLE [INV].[Warehouse] ADD CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[CustomerGroup]'
GO
CREATE TABLE [dbo].[CustomerGroup]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[LegalEntityId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_CustomerGroup] on [dbo].[CustomerGroup]'
GO
ALTER TABLE [dbo].[CustomerGroup] ADD CONSTRAINT [PK_CustomerGroup] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[Stock]'
GO
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
PRINT N'Creating primary key [PK_Stock] on [dbo].[Stock]'
GO
ALTER TABLE [dbo].[Stock] ADD CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[SupplierGroup]'
GO
CREATE TABLE [dbo].[SupplierGroup]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[LegalEntityId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_SupplierGroup] on [dbo].[SupplierGroup]'
GO
ALTER TABLE [dbo].[SupplierGroup] ADD CONSTRAINT [PK_SupplierGroup] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [APPSYS].[AuditLog]'
GO
ALTER TABLE [APPSYS].[AuditLog] ADD CONSTRAINT [FK_AuditLog_User] FOREIGN KEY ([UserId]) REFERENCES [APPSYS].[User] ([Id])
GO
PRINT N'Adding foreign keys to [APPSYS].[Operation]'
GO
ALTER TABLE [APPSYS].[Operation] ADD CONSTRAINT [FK_Operation_Feature] FOREIGN KEY ([FeatureId]) REFERENCES [APPSYS].[Feature] ([Id])
GO
PRINT N'Adding foreign keys to [APPSYS].[Notification]'
GO
ALTER TABLE [APPSYS].[Notification] ADD CONSTRAINT [FK_Notification_User] FOREIGN KEY ([UserId]) REFERENCES [APPSYS].[User] ([Id])
GO
PRINT N'Adding foreign keys to [APPSYS].[UserProfile]'
GO
ALTER TABLE [APPSYS].[UserProfile] ADD CONSTRAINT [FK_UserProfile_User] FOREIGN KEY ([UserId]) REFERENCES [APPSYS].[User] ([Id])
GO
PRINT N'Adding foreign keys to [APPSYS].[User]'
GO
ALTER TABLE [APPSYS].[User] ADD CONSTRAINT [FK_User_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [HR].[Employee] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[AccountType]'
GO
ALTER TABLE [APPS].[AccountType] ADD CONSTRAINT [FK_AccountType_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[AssetOrganization]'
GO
ALTER TABLE [APPS].[AssetOrganization] ADD CONSTRAINT [FK_AssetOrganization_Division] FOREIGN KEY ([DivisionId]) REFERENCES [APPS].[Division] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Bank]'
GO
ALTER TABLE [APPS].[Bank] ADD CONSTRAINT [FK_Bank_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[CustomerHeader]'
GO
ALTER TABLE [APPS].[CustomerHeader] ADD CONSTRAINT [FK_CustomerHeader_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[DescriptiveFledField]'
GO
ALTER TABLE [APPS].[DescriptiveFledField] ADD CONSTRAINT [FK_DescriptiveFledField_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [HR].[JobLevel]'
GO
ALTER TABLE [HR].[JobLevel] ADD CONSTRAINT [FK_JobLevel_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [HR].[JobTitle]'
GO
ALTER TABLE [HR].[JobTitle] ADD CONSTRAINT [FK_JobTitle_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[KeyFlexField]'
GO
ALTER TABLE [APPS].[KeyFlexField] ADD CONSTRAINT [FK_KeyFlexField_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[SetOfBook]'
GO
ALTER TABLE [APPS].[SetOfBook] ADD CONSTRAINT [FK_SetofBook_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[SupplierHeader]'
GO
ALTER TABLE [APPS].[SupplierHeader] ADD CONSTRAINT [FK_SupplierHeader_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[UnitOfMeasure]'
GO
ALTER TABLE [APPS].[UnitOfMeasure] ADD CONSTRAINT [FK_UnitOfMeasure_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[ChartOfAccount]'
GO
ALTER TABLE [APPS].[ChartOfAccount] ADD CONSTRAINT [FK_ChartOfAccount_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Currency]'
GO
ALTER TABLE [APPS].[Currency] ADD CONSTRAINT [FK_FunctionalCurrency_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[HROrganization]'
GO
ALTER TABLE [APPS].[HROrganization] ADD CONSTRAINT [FK_Department_Division] FOREIGN KEY ([DivisionId]) REFERENCES [APPS].[Division] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[InventoryOrganization]'
GO
ALTER TABLE [APPS].[InventoryOrganization] ADD CONSTRAINT [FK_InventoryOrganization_Division] FOREIGN KEY ([DivisionId]) REFERENCES [APPS].[Division] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[ProjectOrganization]'
GO
ALTER TABLE [APPS].[ProjectOrganization] ADD CONSTRAINT [FK_ProjectOrganization_Division] FOREIGN KEY ([DivisionId]) REFERENCES [APPS].[Division] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Division]'
GO
ALTER TABLE [APPS].[Division] ADD CONSTRAINT [FK_Division_LegalEntity] FOREIGN KEY ([LegalEntityId]) REFERENCES [APPS].[LegalEntity] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[FiscalCalendar]'
GO
ALTER TABLE [APPS].[FiscalCalendar] ADD CONSTRAINT [FK_FiscalCalendar_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [HR].[Employee]'
GO
ALTER TABLE [HR].[Employee] ADD CONSTRAINT [FK_Employee_Department] FOREIGN KEY ([DepartmentId]) REFERENCES [APPS].[HROrganization] ([Id])
GO
ALTER TABLE [HR].[Employee] ADD CONSTRAINT [FK_Employee_JobTitle] FOREIGN KEY ([JobTitleId]) REFERENCES [HR].[JobTitle] ([Id])
GO
ALTER TABLE [HR].[Employee] ADD CONSTRAINT [FK_Employee_JobLevel] FOREIGN KEY ([JobLevelId]) REFERENCES [HR].[JobLevel] ([Id])
GO
PRINT N'Adding foreign keys to [HR].[JobHistory]'
GO
ALTER TABLE [HR].[JobHistory] ADD CONSTRAINT [FK_JobHistory_Department] FOREIGN KEY ([DepartmentId]) REFERENCES [APPS].[HROrganization] ([Id])
GO
ALTER TABLE [HR].[JobHistory] ADD CONSTRAINT [FK_JobHistory_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [HR].[Employee] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[LegalEntity]'
GO
ALTER TABLE [APPS].[LegalEntity] ADD CONSTRAINT [FK_LegalEntity_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[PaymentMethod]'
GO
ALTER TABLE [APPS].[PaymentMethod] ADD CONSTRAINT [FK_PaymentMethod_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[PaymentTerm]'
GO
ALTER TABLE [APPS].[PaymentTerm] ADD CONSTRAINT [FK_PaymentTerm_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Tax]'
GO
ALTER TABLE [APPS].[Tax] ADD CONSTRAINT [FK_Tax_SetofBook1] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [HR].[EmployeeGroup]'
GO
ALTER TABLE [HR].[EmployeeGroup] ADD CONSTRAINT [FK_EmployeeGroup_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [HR].[Employee] ([Id])
GO
ALTER TABLE [HR].[EmployeeGroup] ADD CONSTRAINT [FK_EmployeeGroup_Group] FOREIGN KEY ([GroupId]) REFERENCES [HR].[Group] ([Id])
GO
