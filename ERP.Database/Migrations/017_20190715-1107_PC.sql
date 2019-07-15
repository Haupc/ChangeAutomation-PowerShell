-- <Migration ID="0fed7890-40a1-4edb-9f64-dce7d5a991df" />
GO

PRINT N'Dropping foreign keys from [APPS].[CustomerReceiver]'
GO
ALTER TABLE [APPS].[CustomerReceiver] DROP CONSTRAINT [FK_CustomerReceiver_Customer]
GO
PRINT N'Dropping foreign keys from [APPS].[SupplierReceiver]'
GO
ALTER TABLE [APPS].[SupplierReceiver] DROP CONSTRAINT [FK_SupplierReceiver_Supplier]
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
[Description] [nvarchar] (500) NULL
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
