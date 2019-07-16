-- <Migration ID="f094403a-3e11-4d8b-89d0-c680cf302395" />
GO

PRINT N'Dropping extended properties'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'APPS', 'TABLE', N'FiscalYear', 'COLUMN', N'Status'
GO
PRINT N'Dropping foreign keys from [APPS].[FiscalYear]'
GO
ALTER TABLE [APPS].[FiscalYear] DROP CONSTRAINT [FK_FiscalCalendar_SetofBook]
GO
PRINT N'Dropping foreign keys from [APPS].[AccountingPeriod]'
GO
ALTER TABLE [APPS].[AccountingPeriod] DROP CONSTRAINT [FK_AccountingPeriod_FiscalYear]
GO
PRINT N'Dropping constraints from [APPS].[FiscalYear]'
GO
ALTER TABLE [APPS].[FiscalYear] DROP CONSTRAINT [PK_FiscalCalendar]
GO
PRINT N'Dropping constraints from [APPS].[FiscalYear]'
GO
ALTER TABLE [APPS].[FiscalYear] DROP CONSTRAINT [DF_FiscalYear_Status]
GO
PRINT N'Dropping index [CX_FiscalCalendar] from [APPS].[FiscalYear]'
GO
DROP INDEX [CX_FiscalCalendar] ON [APPS].[FiscalYear]
GO
PRINT N'Rebuilding [APPS].[FiscalYear]'
GO
CREATE TABLE [APPS].[RG_Recovery_1_FiscalYear]
(
[Id] [uniqueidentifier] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[StartDate] [datetime] NOT NULL,
[EndDate] [datetime] NOT NULL,
[Status] [int] NOT NULL CONSTRAINT [DF_FiscalYear_Status] DEFAULT ((0)),
[InventoryValuationMethod] [nvarchar] (50) NOT NULL
)
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_1_FiscalYear] ON
GO
INSERT INTO [APPS].[RG_Recovery_1_FiscalYear]([Id], [SetOfBookId], [CX], [Disable], [Name], [StartDate], [EndDate], [Status]) SELECT [Id], [SetOfBookId], [CX], [Disable], [Name], [StartDate], [EndDate], [Status] FROM [APPS].[FiscalYear]
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_1_FiscalYear] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[APPS].[FiscalYear]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[APPS].[RG_Recovery_1_FiscalYear]', RESEED, @idVal)
GO
DROP TABLE [APPS].[FiscalYear]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_1_FiscalYear]', N'FiscalYear', N'OBJECT'
GO
PRINT N'Creating index [CX_FiscalCalendar] on [APPS].[FiscalYear]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_FiscalCalendar] ON [APPS].[FiscalYear] ([CX])
GO
PRINT N'Creating primary key [PK_FiscalCalendar] on [APPS].[FiscalYear]'
GO
ALTER TABLE [APPS].[FiscalYear] ADD CONSTRAINT [PK_FiscalCalendar] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[FiscalYear]'
GO
ALTER TABLE [APPS].[FiscalYear] ADD CONSTRAINT [FK_FiscalCalendar_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[AccountingPeriod]'
GO
ALTER TABLE [APPS].[AccountingPeriod] ADD CONSTRAINT [FK_AccountingPeriod_FiscalYear] FOREIGN KEY ([FiscalYearId]) REFERENCES [APPS].[FiscalYear] ([Id])
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'0 = CLOSED, 1 = OPEN, 2 = UNOPEN', 'SCHEMA', N'APPS', 'TABLE', N'FiscalYear', 'COLUMN', N'Status'
GO
