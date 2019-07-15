CREATE TABLE [APPS].[CostCenter]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (500) NOT NULL,
[Name] [nvarchar] (500) NULL,
[ParentId] [uniqueidentifier] NOT NULL,
[Disable] [bit] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[ChartOfAccountId] [uniqueidentifier] NOT NULL
)
GO
ALTER TABLE [APPS].[CostCenter] ADD CONSTRAINT [PK_CostCenter] PRIMARY KEY CLUSTERED  ([Id])
GO
