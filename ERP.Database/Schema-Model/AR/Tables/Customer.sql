CREATE TABLE [AR].[Customer]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL
)
GO
ALTER TABLE [AR].[Customer] ADD CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED  ([Id])
GO
