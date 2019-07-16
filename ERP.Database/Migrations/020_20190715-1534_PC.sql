-- <Migration ID="2d25e04d-38ff-4628-ba28-0710fff3cdeb" />
GO

PRINT N'Dropping foreign keys from [APPS].[SupplierBankAccount]'
GO
ALTER TABLE [APPS].[SupplierBankAccount] DROP CONSTRAINT [FK_SupplierBankAccount_Supplier]
GO
PRINT N'Dropping foreign keys from [APPS].[SupplierContact]'
GO
ALTER TABLE [APPS].[SupplierContact] DROP CONSTRAINT [FK_SupplierContact_Supplier]
GO
PRINT N'Dropping foreign keys from [HR].[EmployeePosition]'
GO
ALTER TABLE [HR].[EmployeePosition] DROP CONSTRAINT [FK_EmployeeGroup_Employee]
GO
ALTER TABLE [HR].[EmployeePosition] DROP CONSTRAINT [FK_EmployeeGroup_Group]
GO
PRINT N'Dropping foreign keys from [HR].[Position]'
GO
ALTER TABLE [HR].[Position] DROP CONSTRAINT [FK_Position_Division]
GO
PRINT N'Dropping constraints from [HR].[EmployeePosition]'
GO
ALTER TABLE [HR].[EmployeePosition] DROP CONSTRAINT [PK_UserGroup]
GO
PRINT N'Dropping constraints from [HR].[Position]'
GO
ALTER TABLE [HR].[Position] DROP CONSTRAINT [PK_Group]
GO
PRINT N'Dropping constraints from [dbo].[SupplierGroup]'
GO
ALTER TABLE [dbo].[SupplierGroup] DROP CONSTRAINT [PK_SupplierGroup]
GO
PRINT N'Dropping index [CX_UserGroup] from [HR].[EmployeePosition]'
GO
DROP INDEX [CX_UserGroup] ON [HR].[EmployeePosition]
GO
PRINT N'Dropping index [CX_Group] from [HR].[Position]'
GO
DROP INDEX [CX_Group] ON [HR].[Position]
GO
PRINT N'Dropping [dbo].[SupplierGroup]'
GO
DROP TABLE [dbo].[SupplierGroup]
GO
PRINT N'Dropping [HR].[Position]'
GO
DROP TABLE [HR].[Position]
GO
PRINT N'Dropping [HR].[EmployeePosition]'
GO
DROP TABLE [HR].[EmployeePosition]
GO
PRINT N'Altering [APPS].[CustomerDetail]'
GO
EXEC sp_rename N'[APPS].[CustomerDetail].[StaffInCharge]', N'StaffInChargeId', N'COLUMN'
GO
PRINT N'Creating [APPS].[EmployeePosition]'
GO
CREATE TABLE [APPS].[EmployeePosition]
(
[EmployeeId] [uniqueidentifier] NOT NULL,
[PositionId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1)
)
GO
PRINT N'Creating index [CX_UserGroup] on [APPS].[EmployeePosition]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_UserGroup] ON [APPS].[EmployeePosition] ([CX])
GO
PRINT N'Creating primary key [PK_UserGroup] on [APPS].[EmployeePosition]'
GO
ALTER TABLE [APPS].[EmployeePosition] ADD CONSTRAINT [PK_UserGroup] PRIMARY KEY NONCLUSTERED  ([EmployeeId], [PositionId])
GO
PRINT N'Creating [APPS].[Position]'
GO
CREATE TABLE [APPS].[Position]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[LegalEntityId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (500) NOT NULL
)
GO
PRINT N'Creating index [CX_Group] on [APPS].[Position]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Group] ON [APPS].[Position] ([CX])
GO
PRINT N'Creating primary key [PK_Group] on [APPS].[Position]'
GO
ALTER TABLE [APPS].[Position] ADD CONSTRAINT [PK_Group] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Altering [APPS].[SupplierBankAccount]'
GO
EXEC sp_rename N'[APPS].[SupplierBankAccount].[SupplierId]', N'SupplierDetailId', N'COLUMN'
GO
PRINT N'Creating [APPS].[SupplierDetail]'
GO
CREATE TABLE [APPS].[SupplierDetail]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[SupplierGroupId] [uniqueidentifier] NOT NULL,
[SupplierId] [uniqueidentifier] NOT NULL,
[StaffInChargeId] [uniqueidentifier] NULL
)
GO
PRINT N'Creating primary key [PK_SupplierDetail] on [APPS].[SupplierDetail]'
GO
ALTER TABLE [APPS].[SupplierDetail] ADD CONSTRAINT [PK_SupplierDetail] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Altering [APPS].[SupplierContact]'
GO
EXEC sp_rename N'[APPS].[SupplierContact].[SupplierId]', N'SupplierDetailId', N'COLUMN'
GO
PRINT N'Creating [APPS].[SupplierGroup]'
GO
CREATE TABLE [APPS].[SupplierGroup]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[LegalEntityId] [uniqueidentifier] NOT NULL,
[BusinessGroupId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_SupplierGroup] on [APPS].[SupplierGroup]'
GO
ALTER TABLE [APPS].[SupplierGroup] ADD CONSTRAINT [PK_SupplierGroup] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[EmployeePosition]'
GO
ALTER TABLE [APPS].[EmployeePosition] ADD CONSTRAINT [FK_EmployeeGroup_Group] FOREIGN KEY ([PositionId]) REFERENCES [APPS].[Position] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[CustomerBankAccount]'
GO
ALTER TABLE [APPS].[CustomerBankAccount] ADD CONSTRAINT [FK_CustomerBankAccount_CustomerDetail] FOREIGN KEY ([CustomerDetailId]) REFERENCES [APPS].[CustomerDetail] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[CustomerContact]'
GO
ALTER TABLE [APPS].[CustomerContact] ADD CONSTRAINT [FK_CustomerContact_CustomerDetail] FOREIGN KEY ([CustomerDetailId]) REFERENCES [APPS].[CustomerDetail] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[CustomerDetail]'
GO
ALTER TABLE [APPS].[CustomerDetail] ADD CONSTRAINT [FK_CustomerDetail_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [APPS].[Customer] ([Id])
GO
ALTER TABLE [APPS].[CustomerDetail] ADD CONSTRAINT [FK_CustomerDetail_CustomerGroup] FOREIGN KEY ([CustomerGroupId]) REFERENCES [APPS].[CustomerGroup] ([Id])
GO
ALTER TABLE [APPS].[CustomerDetail] ADD CONSTRAINT [FK_CustomerDetail_Employee] FOREIGN KEY ([StaffInChargeId]) REFERENCES [APPS].[Employee] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[CustomerGroup]'
GO
ALTER TABLE [APPS].[CustomerGroup] ADD CONSTRAINT [FK_CustomerGroup_LegalEntity] FOREIGN KEY ([LegalEntityId]) REFERENCES [APPS].[LegalEntity] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[EmployeePosition]'
GO
ALTER TABLE [APPS].[EmployeePosition] ADD CONSTRAINT [FK_EmployeeGroup_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [APPS].[Employee] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[Position]'
GO
ALTER TABLE [APPS].[Position] ADD CONSTRAINT [FK_Position_LegalEntity] FOREIGN KEY ([LegalEntityId]) REFERENCES [APPS].[LegalEntity] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[SupplierBankAccount]'
GO
ALTER TABLE [APPS].[SupplierBankAccount] ADD CONSTRAINT [FK_SupplierBankAccount_SupplierDetail] FOREIGN KEY ([SupplierDetailId]) REFERENCES [APPS].[SupplierDetail] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[SupplierContact]'
GO
ALTER TABLE [APPS].[SupplierContact] ADD CONSTRAINT [FK_SupplierContact_SupplierDetail] FOREIGN KEY ([SupplierDetailId]) REFERENCES [APPS].[SupplierDetail] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[SupplierDetail]'
GO
ALTER TABLE [APPS].[SupplierDetail] ADD CONSTRAINT [FK_SupplierDetail_SupplierGroup] FOREIGN KEY ([SupplierGroupId]) REFERENCES [APPS].[SupplierGroup] ([Id])
GO
ALTER TABLE [APPS].[SupplierDetail] ADD CONSTRAINT [FK_SupplierDetail_Supplier] FOREIGN KEY ([SupplierId]) REFERENCES [APPS].[Supplier] ([Id])
GO
ALTER TABLE [APPS].[SupplierDetail] ADD CONSTRAINT [FK_SupplierDetail_Employee] FOREIGN KEY ([StaffInChargeId]) REFERENCES [APPS].[Employee] ([Id])
GO
PRINT N'Adding foreign keys to [APPS].[SupplierGroup]'
GO
ALTER TABLE [APPS].[SupplierGroup] ADD CONSTRAINT [FK_SupplierGroup_LegalEntity] FOREIGN KEY ([LegalEntityId]) REFERENCES [APPS].[LegalEntity] ([Id])
GO
