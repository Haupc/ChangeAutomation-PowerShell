-- <Migration ID="eefcf28f-5a84-42bc-b73e-dd39cb41cb59" />
GO

PRINT N'Dropping foreign keys from [APPS].[AccountType]'
GO
ALTER TABLE [APPS].[AccountType] DROP CONSTRAINT [FK_AccountType_SetofBook]
GO
PRINT N'Dropping constraints from [APPS].[AccountType]'
GO
ALTER TABLE [APPS].[AccountType] DROP CONSTRAINT [PK_AccountType]
GO
PRINT N'Dropping constraints from [APPS].[Bank]'
GO
ALTER TABLE [APPS].[Bank] DROP CONSTRAINT [PK_Bank]
GO
PRINT N'Dropping constraints from [AP].[Supplier]'
GO
ALTER TABLE [AP].[Supplier] DROP CONSTRAINT [PK_Supplier]
GO
PRINT N'Dropping index [CX_AccountType] from [APPS].[AccountType]'
GO
DROP INDEX [CX_AccountType] ON [APPS].[AccountType]
GO
PRINT N'Dropping [APPS].[AccountType]'
GO
DROP TABLE [APPS].[AccountType]
GO
PRINT N'Creating [APPS].[BankAccount]'
GO
CREATE TABLE [APPS].[BankAccount]
(
[Id] [uniqueidentifier] NOT NULL,
[BankId] [uniqueidentifier] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL
)
GO
PRINT N'Creating index [CX_BankAccount] on [APPS].[BankAccount]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_BankAccount] ON [APPS].[BankAccount] ([CX])
GO
PRINT N'Creating primary key [PK_BankAccount] on [APPS].[BankAccount]'
GO
ALTER TABLE [APPS].[BankAccount] ADD CONSTRAINT [PK_BankAccount] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating index [CX_Bank] on [APPS].[Bank]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Bank] ON [APPS].[Bank] ([CX])
GO
PRINT N'Creating index [CX_Supplier] on [AP].[Supplier]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Supplier] ON [AP].[Supplier] ([CX])
GO
PRINT N'Creating primary key [PK_Bank] on [APPS].[Bank]'
GO
ALTER TABLE [APPS].[Bank] ADD CONSTRAINT [PK_Bank] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating primary key [PK_Supplier] on [AP].[Supplier]'
GO
ALTER TABLE [AP].[Supplier] ADD CONSTRAINT [PK_Supplier] PRIMARY KEY NONCLUSTERED  ([Id])
GO
