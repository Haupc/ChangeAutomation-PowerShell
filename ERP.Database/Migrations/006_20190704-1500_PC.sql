-- <Migration ID="f72418af-4d73-4e1f-b785-fde3072be56b" />
GO

PRINT N'Dropping foreign keys from [HR].[Employee]'
GO
ALTER TABLE [HR].[Employee] DROP CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [HR].[Employee] DROP CONSTRAINT [FK_Employee_JobLevel]
GO
ALTER TABLE [HR].[Employee] DROP CONSTRAINT [FK_Employee_JobTitle]
GO
PRINT N'Dropping foreign keys from [HR].[JobHistory]'
GO
ALTER TABLE [HR].[JobHistory] DROP CONSTRAINT [FK_JobHistory_Department]
GO
PRINT N'Dropping foreign keys from [HR].[JobLevel]'
GO
ALTER TABLE [HR].[JobLevel] DROP CONSTRAINT [FK_JobLevel_BusinessGroup]
GO
PRINT N'Dropping foreign keys from [HR].[JobTitle]'
GO
ALTER TABLE [HR].[JobTitle] DROP CONSTRAINT [FK_JobTitle_BusinessGroup]
GO
PRINT N'Dropping constraints from [HR].[JobLevel]'
GO
ALTER TABLE [HR].[JobLevel] DROP CONSTRAINT [PK_JobLevel]
GO
PRINT N'Dropping constraints from [HR].[JobTitle]'
GO
ALTER TABLE [HR].[JobTitle] DROP CONSTRAINT [PK_JobTitle]
GO
PRINT N'Dropping index [CX_JobLevel] from [HR].[JobLevel]'
GO
DROP INDEX [CX_JobLevel] ON [HR].[JobLevel]
GO
PRINT N'Dropping index [CX_JobTitle] from [HR].[JobTitle]'
GO
DROP INDEX [CX_JobTitle] ON [HR].[JobTitle]
GO
PRINT N'Altering [HR].[Employee]'
GO
EXEC sp_rename N'[HR].[Employee].[DepartmentId]', N'BusinessGroupId', N'COLUMN'
GO
PRINT N'Rebuilding [HR].[JobLevel]'
GO
CREATE TABLE [HR].[RG_Recovery_1_JobLevel]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[Level] [float] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
SET IDENTITY_INSERT [HR].[RG_Recovery_1_JobLevel] ON
GO
INSERT INTO [HR].[RG_Recovery_1_JobLevel]([Id], [BusinessGroupId], [Level], [CX]) SELECT [Id], [BusinessGroupId], [Level], [CX] FROM [HR].[JobLevel]
GO
SET IDENTITY_INSERT [HR].[RG_Recovery_1_JobLevel] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[HR].[JobLevel]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[HR].[RG_Recovery_1_JobLevel]', RESEED, @idVal)
GO
DROP TABLE [HR].[JobLevel]
GO
EXEC sp_rename N'[HR].[RG_Recovery_1_JobLevel]', N'JobLevel', N'OBJECT'
GO
PRINT N'Creating index [CX_JobLevel] on [HR].[JobLevel]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_JobLevel] ON [HR].[JobLevel] ([CX])
GO
PRINT N'Creating primary key [PK_JobLevel] on [HR].[JobLevel]'
GO
ALTER TABLE [HR].[JobLevel] ADD CONSTRAINT [PK_JobLevel] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Rebuilding [HR].[JobTitle]'
GO
CREATE TABLE [HR].[RG_Recovery_2_JobTitle]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NULL,
[Name] [nvarchar] (500) NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
SET IDENTITY_INSERT [HR].[RG_Recovery_2_JobTitle] ON
GO
INSERT INTO [HR].[RG_Recovery_2_JobTitle]([Id], [BusinessGroupId], [Code], [Name], [CX]) SELECT [Id], [BusinessGroupId], [Code], [Name], [CX] FROM [HR].[JobTitle]
GO
SET IDENTITY_INSERT [HR].[RG_Recovery_2_JobTitle] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[HR].[JobTitle]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[HR].[RG_Recovery_2_JobTitle]', RESEED, @idVal)
GO
DROP TABLE [HR].[JobTitle]
GO
EXEC sp_rename N'[HR].[RG_Recovery_2_JobTitle]', N'JobTitle', N'OBJECT'
GO
PRINT N'Creating index [CX_JobTitle] on [HR].[JobTitle]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_JobTitle] ON [HR].[JobTitle] ([CX])
GO
PRINT N'Creating primary key [PK_JobTitle] on [HR].[JobTitle]'
GO
ALTER TABLE [HR].[JobTitle] ADD CONSTRAINT [PK_JobTitle] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Altering [HR].[JobHistory]'
GO
ALTER TABLE [HR].[JobHistory] DROP
COLUMN [DepartmentId]
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
PRINT N'Adding foreign keys to [HR].[JobLevel]'
GO
ALTER TABLE [HR].[JobLevel] ADD CONSTRAINT [FK_JobLevel_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
PRINT N'Adding foreign keys to [HR].[JobTitle]'
GO
ALTER TABLE [HR].[JobTitle] ADD CONSTRAINT [FK_JobTitle_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
