CREATE TABLE [AP].[Supplier]
(
[Id] [uniqueidentifier] NOT NULL,
[TaxCode] [nvarchar] (50) NULL,
[Name] [nvarchar] (500) NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [AP].[Supplier] ADD CONSTRAINT [PK_Supplier] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Supplier] ON [AP].[Supplier] ([CX])
GO
