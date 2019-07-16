CREATE TABLE [APPS].[CustomerHeader]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Name] [nvarchar] (50) NOT NULL
)
GO
ALTER TABLE [APPS].[CustomerHeader] ADD CONSTRAINT [PK_CustomerHeader] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_CustomerHeader] ON [APPS].[CustomerHeader] ([CX])
GO
ALTER TABLE [APPS].[CustomerHeader] ADD CONSTRAINT [IX_Name_CustomerHeader] UNIQUE NONCLUSTERED  ([Name])
GO
ALTER TABLE [APPS].[CustomerHeader] ADD CONSTRAINT [FK_CustomerHeader_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
