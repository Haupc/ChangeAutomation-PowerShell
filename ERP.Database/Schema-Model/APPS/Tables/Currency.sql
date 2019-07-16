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
ALTER TABLE [APPS].[Currency] ADD CONSTRAINT [PK_FunctionalCurrency] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Code_Currency] ON [APPS].[Currency] ([Code])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_FunctionalCurrency] ON [APPS].[Currency] ([CX])
GO
ALTER TABLE [APPS].[Currency] ADD CONSTRAINT [FK_FunctionalCurrency_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
