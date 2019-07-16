CREATE TABLE [HR].[JobHistory]
(
[Id] [uniqueidentifier] NOT NULL,
[EmployeeId] [uniqueidentifier] NOT NULL,
[DepartmentId] [uniqueidentifier] NOT NULL,
[StartDate] [date] NOT NULL,
[EndDate] [date] NULL,
[Status] [nvarchar] (50) NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [HR].[JobHistory] ADD CONSTRAINT [PK_JobHistory] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_JobHistory] ON [HR].[JobHistory] ([CX])
GO
ALTER TABLE [HR].[JobHistory] ADD CONSTRAINT [FK_JobHistory_Department] FOREIGN KEY ([DepartmentId]) REFERENCES [APPS].[HROrganization] ([Id])
GO
ALTER TABLE [HR].[JobHistory] ADD CONSTRAINT [FK_JobHistory_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [HR].[Employee] ([Id])
GO
