CREATE TABLE [HR].[EmployeeGroup]
(
[EmployeeId] [uniqueidentifier] NOT NULL,
[GroupId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL
)
GO
ALTER TABLE [HR].[EmployeeGroup] ADD CONSTRAINT [PK_UserGroup] PRIMARY KEY NONCLUSTERED  ([EmployeeId], [GroupId])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_UserGroup] ON [HR].[EmployeeGroup] ([CX])
GO
ALTER TABLE [HR].[EmployeeGroup] ADD CONSTRAINT [FK_EmployeeGroup_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [HR].[Employee] ([Id])
GO
ALTER TABLE [HR].[EmployeeGroup] ADD CONSTRAINT [FK_EmployeeGroup_Group] FOREIGN KEY ([GroupId]) REFERENCES [HR].[Group] ([Id])
GO
