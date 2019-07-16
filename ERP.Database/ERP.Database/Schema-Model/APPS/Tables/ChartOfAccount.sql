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
ALTER TABLE [APPS].[ChartOfAccount] ADD CONSTRAINT [PK_ChartOfAccount] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_ChartOfAccount] ON [APPS].[ChartOfAccount] ([CX])
GO
ALTER TABLE [APPS].[ChartOfAccount] ADD CONSTRAINT [FK_ChartOfAccount_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
