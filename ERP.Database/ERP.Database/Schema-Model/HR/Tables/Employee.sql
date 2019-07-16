CREATE TABLE [HR].[Employee]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Code] [nvarchar] (50) NOT NULL,
[DisplayName] [nvarchar] (200) NULL,
[PrimaryEmail] [nvarchar] (500) NULL,
[AlternativeEmail] [nvarchar] (500) NULL,
[DepartmentId] [uniqueidentifier] NOT NULL,
[JobTitleId] [uniqueidentifier] NOT NULL,
[JobLevelId] [uniqueidentifier] NOT NULL,
[JoinDate] [date] NOT NULL,
[EffectiveDate] [date] NULL,
[EndDate] [date] NULL,
[Status] [int] NOT NULL
)
GO
ALTER TABLE [HR].[Employee] ADD CONSTRAINT [PK_Employee] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Employee] ON [HR].[Employee] ([CX])
GO
ALTER TABLE [HR].[Employee] ADD CONSTRAINT [FK_Employee_Department] FOREIGN KEY ([DepartmentId]) REFERENCES [APPS].[HROrganization] ([Id])
GO
ALTER TABLE [HR].[Employee] ADD CONSTRAINT [FK_Employee_JobLevel] FOREIGN KEY ([JobLevelId]) REFERENCES [HR].[JobLevel] ([Id])
GO
ALTER TABLE [HR].[Employee] ADD CONSTRAINT [FK_Employee_JobTitle] FOREIGN KEY ([JobTitleId]) REFERENCES [HR].[JobTitle] ([Id])
GO
