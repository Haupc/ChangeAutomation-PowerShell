-- <Migration ID="c96c86b3-bfe6-4929-9f40-5036ed8ee391" />
GO

PRINT N'Dropping foreign keys from [APPS].[Customer]'
GO
ALTER TABLE [APPS].[Customer] DROP CONSTRAINT [FK_Customer_CustomerReceiver]
GO
PRINT N'Dropping constraints from [dbo].[CustomerReceiver]'
GO
ALTER TABLE [dbo].[CustomerReceiver] DROP CONSTRAINT [PK_CustomerReceiver]
GO
PRINT N'Dropping [dbo].[CustomerReceiver]'
GO
DROP TABLE [dbo].[CustomerReceiver]
GO
PRINT N'Creating [APPS].[CustomerReceiver]'
GO
CREATE TABLE [APPS].[CustomerReceiver]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (100) NOT NULL,
[Email] [nvarchar] (100) NULL,
[Phone] [nvarchar] (20) NOT NULL,
[Address] [nvarchar] (500) NULL,
[CustomerId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_CustomerReceiver] on [APPS].[CustomerReceiver]'
GO
ALTER TABLE [APPS].[CustomerReceiver] ADD CONSTRAINT [PK_CustomerReceiver] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Customer]'
GO
ALTER TABLE [APPS].[Customer] ADD CONSTRAINT [FK_Customer_CustomerReceiver] FOREIGN KEY ([Id]) REFERENCES [APPS].[CustomerReceiver] ([Id])
GO
