-- <Migration ID="046a0f01-f60f-47a7-acb2-25565bcb6252" />
GO

PRINT N'Dropping foreign keys from [APPS].[CustomerGroup]'
GO
ALTER TABLE [APPS].[CustomerGroup] DROP CONSTRAINT [FK_CustomerGroup_LegalEntity]
GO
PRINT N'Dropping foreign keys from [APPS].[CustomerDetail]'
GO
ALTER TABLE [APPS].[CustomerDetail] DROP CONSTRAINT [FK_CustomerDetail_CustomerGroup]
GO
PRINT N'Dropping foreign keys from [APPS].[CustomerReceiver]'
GO
ALTER TABLE [APPS].[CustomerReceiver] DROP CONSTRAINT [FK_CustomerReceiver_Customer]
GO
PRINT N'Dropping foreign keys from [APPS].[SupplierReceiver]'
GO
ALTER TABLE [APPS].[SupplierReceiver] DROP CONSTRAINT [FK_SupplierReceiver_Supplier]
GO
PRINT N'Dropping constraints from [APPS].[CustomerGroup]'
GO
ALTER TABLE [APPS].[CustomerGroup] DROP CONSTRAINT [PK_CustomerGroup]
GO
PRINT N'Dropping constraints from [APPS].[CustomerReceiver]'
GO
ALTER TABLE [APPS].[CustomerReceiver] DROP CONSTRAINT [PK_CustomerReceiver]
GO
PRINT N'Dropping constraints from [APPS].[SupplierReceiver]'
GO
ALTER TABLE [APPS].[SupplierReceiver] DROP CONSTRAINT [PK_SupplierReceiver]
GO
PRINT N'Dropping [APPS].[SupplierReceiver]'
GO
DROP TABLE [APPS].[SupplierReceiver]
GO
PRINT N'Dropping [APPS].[CustomerReceiver]'
GO
DROP TABLE [APPS].[CustomerReceiver]
GO
PRINT N'Altering [APPS].[CustomerContact]'
GO
ALTER TABLE [APPS].[CustomerContact] ADD
[ProvinceId] [uniqueidentifier] NULL,
[Description] [nvarchar] (500) NULL
GO
EXEC sp_rename N'[APPS].[CustomerContact].[Name]', N'FullName', N'COLUMN'
GO
ALTER TABLE [APPS].[CustomerContact] ALTER COLUMN [Phone] [nvarchar] (20) NULL
GO
PRINT N'Rebuilding [APPS].[CustomerGroup]'
GO
CREATE TABLE [APPS].[RG_Recovery_1_CustomerGroup]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[Description] [nvarchar] (500) NULL,
[LegalEntityId] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL
)
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_1_CustomerGroup] ON
GO
INSERT INTO [APPS].[RG_Recovery_1_CustomerGroup]([Id], [CX], [Disable], [Name], [LegalEntityId], [BusinessGroupId]) SELECT [Id], [CX], [Disable], [Name], [LegalEntityId], [BusinessGroupId] FROM [APPS].[CustomerGroup]
GO
SET IDENTITY_INSERT [APPS].[RG_Recovery_1_CustomerGroup] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[APPS].[CustomerGroup]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[APPS].[RG_Recovery_1_CustomerGroup]', RESEED, @idVal)
GO
DROP TABLE [APPS].[CustomerGroup]
GO
EXEC sp_rename N'[APPS].[RG_Recovery_1_CustomerGroup]', N'CustomerGroup', N'OBJECT'
GO
PRINT N'Creating primary key [PK_CustomerGroup] on [APPS].[CustomerGroup]'
GO
ALTER TABLE [APPS].[CustomerGroup] ADD CONSTRAINT [PK_CustomerGroup] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Altering [APPS].[EmployeeContact]'
GO
ALTER TABLE [APPS].[EmployeeContact] ADD
[Description] [nvarchar] (500) NULL
GO
PRINT N'Altering [APPS].[SupplierContact]'
GO
ALTER TABLE [APPS].[SupplierContact] ADD
[Description] [nvarchar] (500) NULL
GO
PRINT N'Altering [APPS].[SupplierGroup]'
GO
ALTER TABLE [APPS].[SupplierGroup] ADD
[Code] [nvarchar] (50) NULL,
[Description] [nvarchar] (500) NULL
GO
ALTER TABLE [APPS].[SupplierGroup] ALTER COLUMN [Name] [nvarchar] (500) NULL
GO
PRINT N'Adding foreign keys to [APPS].[CustomerContact]'
GO
ALTER TABLE [APPS].[CustomerContact] ADD CONSTRAINT [FK_CustomerContact_Province] FOREIGN KEY ([ProvinceId]) REFERENCES [APPS].[Province] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[CustomerGroup]'
GO
ALTER TABLE [APPS].[CustomerGroup] ADD CONSTRAINT [FK_CustomerGroup_LegalEntity] FOREIGN KEY ([LegalEntityId]) REFERENCES [APPS].[LegalEntity] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[CustomerDetail]'
GO
ALTER TABLE [APPS].[CustomerDetail] ADD CONSTRAINT [FK_CustomerDetail_CustomerGroup] FOREIGN KEY ([CustomerGroupId]) REFERENCES [APPS].[CustomerGroup] ([Id])
GO
