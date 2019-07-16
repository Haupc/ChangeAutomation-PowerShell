-- <Migration ID="3ac0a57f-f205-47d8-8dfb-e38e09667530" />
GO

PRINT N'Dropping foreign keys from [APPSYS].[User]'
GO
ALTER TABLE [APPSYS].[User] DROP CONSTRAINT [FK_User_Employee]
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
PRINT N'Dropping foreign keys from [HR].[Employee]'
GO
ALTER TABLE [HR].[Employee] DROP CONSTRAINT [FK_Employee_BusinessGroup]
GO
ALTER TABLE [HR].[Employee] DROP CONSTRAINT [FK_Employee_JobTitle]
GO
ALTER TABLE [HR].[Employee] DROP CONSTRAINT [FK_Employee_JobLevel]
GO
PRINT N'Dropping foreign keys from [HR].[JobLevel]'
GO
ALTER TABLE [HR].[JobLevel] DROP CONSTRAINT [FK_JobLevel_BusinessGroup]
GO
PRINT N'Dropping foreign keys from [HR].[JobTitle]'
GO
ALTER TABLE [HR].[JobTitle] DROP CONSTRAINT [FK_JobTitle_BusinessGroup]
GO
PRINT N'Dropping constraints from [AP].[Supplier]'
GO
ALTER TABLE [AP].[Supplier] DROP CONSTRAINT [PK_Supplier]
GO
PRINT N'Dropping constraints from [AR].[Customer]'
GO
ALTER TABLE [AR].[Customer] DROP CONSTRAINT [PK_Customer]
GO
PRINT N'Dropping constraints from [HR].[Employee]'
GO
ALTER TABLE [HR].[Employee] DROP CONSTRAINT [PK_Employee]
GO
PRINT N'Dropping constraints from [HR].[JobLevel]'
GO
ALTER TABLE [HR].[JobLevel] DROP CONSTRAINT [PK_JobLevel]
GO
PRINT N'Dropping constraints from [HR].[JobTitle]'
GO
ALTER TABLE [HR].[JobTitle] DROP CONSTRAINT [PK_JobTitle]
GO
PRINT N'Dropping index [CX_Supplier] from [AP].[Supplier]'
GO
DROP INDEX [CX_Supplier] ON [AP].[Supplier]
GO
PRINT N'Dropping index [CX_Employee] from [HR].[Employee]'
GO
DROP INDEX [CX_Employee] ON [HR].[Employee]
GO
PRINT N'Dropping index [CX_JobLevel] from [HR].[JobLevel]'
GO
DROP INDEX [CX_JobLevel] ON [HR].[JobLevel]
GO
PRINT N'Dropping index [CX_JobTitle] from [HR].[JobTitle]'
GO
DROP INDEX [CX_JobTitle] ON [HR].[JobTitle]
GO
PRINT N'Dropping [AR].[Customer]'
GO
DROP TABLE [AR].[Customer]
GO
PRINT N'Dropping [AP].[Supplier]'
GO
DROP TABLE [AP].[Supplier]
GO
PRINT N'Dropping [HR].[JobTitle]'
GO
DROP TABLE [HR].[JobTitle]
GO
PRINT N'Dropping [HR].[JobLevel]'
GO
DROP TABLE [HR].[JobLevel]
GO
PRINT N'Dropping [HR].[Employee]'
GO
DROP TABLE [HR].[Employee]
GO
PRINT N'Creating [APPS].[Employee]'
GO
CREATE TABLE [APPS].[Employee]
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
PRINT N'Creating index [CX_Employee] on [APPS].[Employee]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Employee] ON [APPS].[Employee] ([CX])
GO
PRINT N'Creating primary key [PK_Employee] on [APPS].[Employee]'
GO
ALTER TABLE [APPS].[Employee] ADD CONSTRAINT [PK_Employee] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[JobLevel]'
GO
CREATE TABLE [APPS].[JobLevel]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[Level] [float] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
PRINT N'Creating index [CX_JobLevel] on [APPS].[JobLevel]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_JobLevel] ON [APPS].[JobLevel] ([CX])
GO
PRINT N'Creating primary key [PK_JobLevel] on [APPS].[JobLevel]'
GO
ALTER TABLE [APPS].[JobLevel] ADD CONSTRAINT [PK_JobLevel] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[JobTitle]'
GO
CREATE TABLE [APPS].[JobTitle]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NULL,
[Name] [nvarchar] (500) NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
PRINT N'Creating index [CX_JobTitle] on [APPS].[JobTitle]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_JobTitle] ON [APPS].[JobTitle] ([CX])
GO
PRINT N'Creating primary key [PK_JobTitle] on [APPS].[JobTitle]'
GO
ALTER TABLE [APPS].[JobTitle] ADD CONSTRAINT [PK_JobTitle] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[Customer]'
GO
CREATE TABLE [APPS].[Customer]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Customer] on [APPS].[Customer]'
GO
ALTER TABLE [APPS].[Customer] ADD CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[Supplier]'
GO
CREATE TABLE [APPS].[Supplier]
(
[Id] [uniqueidentifier] NOT NULL,
[TaxCode] [nvarchar] (50) NULL,
[Name] [nvarchar] (500) NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
PRINT N'Creating index [CX_Supplier] on [APPS].[Supplier]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Supplier] ON [APPS].[Supplier] ([CX])
GO
PRINT N'Creating primary key [PK_Supplier] on [APPS].[Supplier]'
GO
ALTER TABLE [APPS].[Supplier] ADD CONSTRAINT [PK_Supplier] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [APPSYS].[User]'
GO
ALTER TABLE [APPSYS].[User] ADD CONSTRAINT [FK_User_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [APPS].[Employee] ([Id])
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
PRINT N'Adding foreign keys to [APPS].[Employee]'
GO
ALTER TABLE [APPS].[Employee] ADD CONSTRAINT [FK_Employee_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
ALTER TABLE [APPS].[Employee] ADD CONSTRAINT [FK_Employee_JobTitle] FOREIGN KEY ([JobTitleId]) REFERENCES [APPS].[JobTitle] ([Id])
GO
ALTER TABLE [APPS].[Employee] ADD CONSTRAINT [FK_Employee_JobLevel] FOREIGN KEY ([JobLevelId]) REFERENCES [APPS].[JobLevel] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[JobLevel]'
GO
ALTER TABLE [APPS].[JobLevel] ADD CONSTRAINT [FK_JobLevel_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[JobTitle]'
GO
ALTER TABLE [APPS].[JobTitle] ADD CONSTRAINT [FK_JobTitle_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
