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
ALTER TABLE [APPS].[AccountType] ADD CONSTRAINT [PK_AccountType] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_AccountType] ON [APPS].[AccountType] ([CX])
GO
ALTER TABLE [APPS].[AccountType] ADD CONSTRAINT [FK_AccountType_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
