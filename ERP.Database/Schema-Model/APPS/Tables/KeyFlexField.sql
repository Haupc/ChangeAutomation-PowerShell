CREATE TABLE [APPS].[KeyFlexField]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[Description] [nvarchar] (500) NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
ALTER TABLE [APPS].[KeyFlexField] ADD CONSTRAINT [PK_KeyFlexField] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_KeyFlexField] ON [APPS].[KeyFlexField] ([CX])
GO
ALTER TABLE [APPS].[KeyFlexField] ADD CONSTRAINT [FK_KeyFlexField_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
