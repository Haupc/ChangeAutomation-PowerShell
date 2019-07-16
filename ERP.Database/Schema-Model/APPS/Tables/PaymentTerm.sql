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
ALTER TABLE [APPS].[PaymentTerm] ADD CONSTRAINT [PK_PaymentTerm] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_PaymentTerm] ON [APPS].[PaymentTerm] ([CX])
GO
ALTER TABLE [APPS].[PaymentTerm] ADD CONSTRAINT [FK_PaymentTerm_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
