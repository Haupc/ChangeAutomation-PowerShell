CREATE TABLE [APPS].[Tax]
(
[Id] [uniqueidentifier] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[TaxCode] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[Description] [nvarchar] (500) NULL,
[Percent] [float] NOT NULL,
[Disable] [bit] NOT NULL
)
GO
ALTER TABLE [APPS].[Tax] ADD CONSTRAINT [PK_Tax] PRIMARY KEY CLUSTERED  ([Id])
GO
ALTER TABLE [APPS].[Tax] ADD CONSTRAINT [FK_Tax_SetofBook1] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
