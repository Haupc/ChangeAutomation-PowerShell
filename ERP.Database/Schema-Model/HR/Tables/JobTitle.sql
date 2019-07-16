CREATE TABLE [HR].[JobTitle]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NULL,
[Name] [nvarchar] (500) NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [HR].[JobTitle] ADD CONSTRAINT [PK_JobTitle] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_JobTitle] ON [HR].[JobTitle] ([CX])
GO
ALTER TABLE [HR].[JobTitle] ADD CONSTRAINT [FK_JobTitle_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
