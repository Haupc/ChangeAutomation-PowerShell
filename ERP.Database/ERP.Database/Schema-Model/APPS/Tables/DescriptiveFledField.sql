CREATE TABLE [APPS].[DescriptiveFledField]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) NULL,
[Name] [nvarchar] (50) NULL,
[Description] [nvarchar] (50) NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL
)
GO
ALTER TABLE [APPS].[DescriptiveFledField] ADD CONSTRAINT [PK_DescriptiveFledField] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_DescriptiveFledField] ON [APPS].[DescriptiveFledField] ([CX])
GO
ALTER TABLE [APPS].[DescriptiveFledField] ADD CONSTRAINT [FK_DescriptiveFledField_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [APPS].[BusinessGroup] ([Id])
GO
