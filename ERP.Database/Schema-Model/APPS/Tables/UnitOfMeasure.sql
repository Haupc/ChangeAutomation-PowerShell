CREATE TABLE [APPS].[UnitOfMeasure]
(
[Id] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[AllowedPrecision] [int] NOT NULL,
[Type] [nvarchar] (50) NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[BusinessGroupId] [uniqueidentifier] NULL
)
GO
ALTER TABLE [APPS].[UnitOfMeasure] ADD CONSTRAINT [PK_UOM] PRIMARY KEY CLUSTERED  ([Id])
GO
ALTER TABLE [APPS].[UnitOfMeasure] ADD CONSTRAINT [FK_UnitOfMeasure_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
