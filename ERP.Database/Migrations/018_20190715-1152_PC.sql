-- <Migration ID="a4d7bfff-e3e1-47ce-80aa-22404923ca11" />
GO

PRINT N'Creating [APPS].[Voucher]'
GO
CREATE TABLE [APPS].[Voucher]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[SetOfBookId] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (10) NOT NULL,
[Name] [nvarchar] (200) NOT NULL,
[Description] [nvarchar] (500) NULL,
[DebitAccount] [uniqueidentifier] NULL,
[CreditAccount] [uniqueidentifier] NULL,
[VoucherTypeId] [uniqueidentifier] NULL,
[Disable] [bit] NOT NULL
)
GO
PRINT N'Creating index [CX_Voucher] on [APPS].[Voucher]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Voucher] ON [APPS].[Voucher] ([CX])
GO
PRINT N'Creating primary key [PK_Voucher] on [APPS].[Voucher]'
GO
ALTER TABLE [APPS].[Voucher] ADD CONSTRAINT [PK_Voucher] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [APPS].[VoucherType]'
GO
CREATE TABLE [APPS].[VoucherType]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Code] [nvarchar] (10) NULL,
[Name] [nvarchar] (100) NULL,
[Disable] [bit] NOT NULL
)
GO
PRINT N'Creating index [CX_VoucherType] on [APPS].[VoucherType]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_VoucherType] ON [APPS].[VoucherType] ([CX])
GO
PRINT N'Creating primary key [PK_VoucherType] on [APPS].[VoucherType]'
GO
ALTER TABLE [APPS].[VoucherType] ADD CONSTRAINT [PK_VoucherType] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Voucher]'
GO
ALTER TABLE [APPS].[Voucher] ADD CONSTRAINT [FK_Voucher_VoucherType] FOREIGN KEY ([VoucherTypeId]) REFERENCES [APPS].[VoucherType] ([Id])
GO
ALTER TABLE [APPS].[Voucher] ADD CONSTRAINT [FK_Voucher_SetOfBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
ALTER TABLE [APPS].[Voucher] ADD CONSTRAINT [FK_Voucher_ChartOfAccount_Debit] FOREIGN KEY ([DebitAccount]) REFERENCES [APPS].[ChartOfAccount] ([Id])
GO
ALTER TABLE [APPS].[Voucher] ADD CONSTRAINT [FK_Voucher_ChartOfAccount_Credit] FOREIGN KEY ([CreditAccount]) REFERENCES [APPS].[ChartOfAccount] ([Id])
GO
