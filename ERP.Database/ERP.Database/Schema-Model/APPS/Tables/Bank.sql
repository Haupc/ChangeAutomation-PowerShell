CREATE TABLE [APPS].[Bank]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL
)
GO
ALTER TABLE [APPS].[Bank] ADD CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED  ([Id])
GO
ALTER TABLE [APPS].[Bank] ADD CONSTRAINT [FK_Bank_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
