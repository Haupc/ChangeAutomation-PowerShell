CREATE TABLE [APPSYS].[SystemConfiguration]
(
[Key] [nvarchar] (50) NOT NULL,
[Value] [nvarchar] (2000) NOT NULL
)
GO
ALTER TABLE [APPSYS].[SystemConfiguration] ADD CONSTRAINT [PK_SystemConfiguration] PRIMARY KEY CLUSTERED  ([Key])
GO
