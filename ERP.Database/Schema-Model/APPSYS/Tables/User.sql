CREATE TABLE [APPSYS].[User]
(
[Id] [uniqueidentifier] NOT NULL,
[Username] [nvarchar] (50) NOT NULL,
[Password] [nvarchar] (50) NOT NULL,
[EmployeeId] [uniqueidentifier] NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[IsSysUser] [bit] NOT NULL,
[IsActive] [bit] NOT NULL,
[Salt] [nvarchar] (50) NULL
)
GO
ALTER TABLE [APPSYS].[User] ADD CONSTRAINT [PK_User] PRIMARY KEY NONCLUSTERED  ([Id])
GO
CREATE UNIQUE CLUSTERED INDEX [CX_User] ON [APPSYS].[User] ([CX])
GO
ALTER TABLE [APPSYS].[User] ADD CONSTRAINT [FK_User_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [HR].[Employee] ([Id])
GO
