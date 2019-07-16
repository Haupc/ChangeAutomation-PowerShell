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
ALTER TABLE [APPS].[PaymentMethod] ADD CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED  ([Id])
GO
ALTER TABLE [APPS].[PaymentMethod] ADD CONSTRAINT [FK_PaymentMethod_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
