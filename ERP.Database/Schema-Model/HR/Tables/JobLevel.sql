CREATE TABLE [HR].[JobLevel]
(
[Id] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[Level] [float] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [HR].[JobLevel] ADD CONSTRAINT [PK_JobLevel] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_JobLevel] ON [HR].[JobLevel] ([CX])
GO
ALTER TABLE [HR].[JobLevel] ADD CONSTRAINT [FK_JobLevel_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
