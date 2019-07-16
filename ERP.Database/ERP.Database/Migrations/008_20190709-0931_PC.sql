-- <Migration ID="3bb56e60-b21e-463d-943d-966b31c8ae94" />
GO

PRINT N'Dropping foreign keys from [APPSYS].[Notification]'
GO
ALTER TABLE [APPSYS].[Notification] DROP CONSTRAINT [FK_Notification_User]
GO
PRINT N'Dropping foreign keys from [HR].[Employee]'
GO
ALTER TABLE [HR].[Employee] DROP CONSTRAINT [FK_Employee_Department]
GO
PRINT N'Dropping foreign keys from [INV].[BinLocation]'
GO
ALTER TABLE [INV].[BinLocation] DROP CONSTRAINT [FK_BinLocation_Warehouse]
GO
PRINT N'Dropping constraints from [APPSYS].[Notification]'
GO
ALTER TABLE [APPSYS].[Notification] DROP CONSTRAINT [PK_Notification]
GO
PRINT N'Dropping constraints from [INV].[Warehouse]'
GO
ALTER TABLE [INV].[Warehouse] DROP CONSTRAINT [PK_Warehouse]
GO
PRINT N'Dropping index [CX_Notification] from [APPSYS].[Notification]'
GO
DROP INDEX [CX_Notification] ON [APPSYS].[Notification]
GO
PRINT N'Dropping [INV].[Warehouse]'
GO
DROP TABLE [INV].[Warehouse]
GO
PRINT N'Altering [APPSYS].[AuditLog]'
GO
ALTER TABLE [APPSYS].[AuditLog] ALTER COLUMN [NewData] [ntext] NULL
GO
PRINT N'Altering [APPS].[LegalEntity]'
GO
ALTER TABLE [APPS].[LegalEntity] ALTER COLUMN [ShortName] [nvarchar] (500) NULL
GO
PRINT N'Rebuilding [APPSYS].[Notification]'
GO
CREATE TABLE [APPSYS].[RG_Recovery_1_Notification]
(
[Id] [uniqueidentifier] NOT NULL,
[Time] [datetime] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Unread] [bit] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Content] [ntext] NOT NULL,
[URL] [ntext] NULL
)
GO
SET IDENTITY_INSERT [APPSYS].[RG_Recovery_1_Notification] ON
GO
INSERT INTO [APPSYS].[RG_Recovery_1_Notification]([Id], [Time], [CX], [UserId], [Content]) SELECT [Id], [Time], [CX], [UserId], [Content] FROM [APPSYS].[Notification]
GO
SET IDENTITY_INSERT [APPSYS].[RG_Recovery_1_Notification] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[APPSYS].[Notification]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[APPSYS].[RG_Recovery_1_Notification]', RESEED, @idVal)
GO
DROP TABLE [APPSYS].[Notification]
GO
EXEC sp_rename N'[APPSYS].[RG_Recovery_1_Notification]', N'Notification', N'OBJECT'
GO
PRINT N'Creating index [CX_Notification] on [APPSYS].[Notification]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Notification] ON [APPSYS].[Notification] ([CX])
GO
PRINT N'Creating primary key [PK_Notification] on [APPSYS].[Notification]'
GO
ALTER TABLE [APPSYS].[Notification] ADD CONSTRAINT [PK_Notification] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_Time_Notification] on [APPSYS].[Notification]'
GO
CREATE NONCLUSTERED INDEX [IX_Time_Notification] ON [APPSYS].[Notification] ([Time])
GO
PRINT N'Altering [dbo].[Stock]'
GO
EXEC sp_rename N'[dbo].[Stock].[GoodItemId]', N'ItemId', N'COLUMN'
GO
EXEC sp_rename N'[dbo].[Stock].[WarehouseId]', N'InventoryOrganizationId', N'COLUMN'
GO
PRINT N'Creating [dbo].[StockAdjustment]'
GO
CREATE TABLE [dbo].[StockAdjustment]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[InventoryOrganizationId] [uniqueidentifier] NOT NULL,
[AdjustmentReasonId] [uniqueidentifier] NOT NULL,
[RequesterId] [uniqueidentifier] NOT NULL,
[DocumentDate] [date] NOT NULL,
[Memo] [nvarchar] (500) NOT NULL
)
GO
PRINT N'Creating primary key [PK_StockAdjustment] on [dbo].[StockAdjustment]'
GO
ALTER TABLE [dbo].[StockAdjustment] ADD CONSTRAINT [PK_StockAdjustment] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[StockAdjustmentReason]'
GO
CREATE TABLE [dbo].[StockAdjustmentReason]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[LegalEntityId] [uniqueidentifier] NOT NULL,
[Reason] [nvarchar] (500) NOT NULL
)
GO
PRINT N'Creating primary key [PK_StockAdjustmentReason] on [dbo].[StockAdjustmentReason]'
GO
ALTER TABLE [dbo].[StockAdjustmentReason] ADD CONSTRAINT [PK_StockAdjustmentReason] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[StockRequest]'
GO
CREATE TABLE [dbo].[StockRequest]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[InventoryOrganizationId] [uniqueidentifier] NOT NULL,
[RequesterId] [uniqueidentifier] NOT NULL,
[DocumentDate] [date] NOT NULL,
[DocumentNo] [nvarchar] (200) NOT NULL,
[Reason] [nvarchar] (500) NULL
)
GO
PRINT N'Creating index [CX_StockRequest] on [dbo].[StockRequest]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_StockRequest] ON [dbo].[StockRequest] ([CX])
GO
PRINT N'Creating primary key [PK_StockRequest] on [dbo].[StockRequest]'
GO
ALTER TABLE [dbo].[StockRequest] ADD CONSTRAINT [PK_StockRequest] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[StockRequestDetail]'
GO
CREATE TABLE [dbo].[StockRequestDetail]
(
[Id] [uniqueidentifier] NOT NULL,
[StockRequestId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Disable] [bit] NOT NULL,
[ItemId] [uniqueidentifier] NOT NULL,
[UnitOfMeasureId] [uniqueidentifier] NOT NULL,
[RequestedQuantity] [int] NOT NULL,
[Remark] [nvarchar] (500) NOT NULL
)
GO
PRINT N'Creating primary key [PK_StockRequestDetail] on [dbo].[StockRequestDetail]'
GO
ALTER TABLE [dbo].[StockRequestDetail] ADD CONSTRAINT [PK_StockRequestDetail] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Altering [INV].[BinLocation]'
GO
EXEC sp_rename N'[INV].[BinLocation].[WarehouseId]', N'InventoryOrganizationId', N'COLUMN'
GO
PRINT N'Adding foreign keys to [APPSYS].[Notification]'
GO
ALTER TABLE [APPSYS].[Notification] ADD CONSTRAINT [FK_Notification_User] FOREIGN KEY ([UserId]) REFERENCES [APPSYS].[User] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[StockAdjustment]'
GO
ALTER TABLE [dbo].[StockAdjustment] ADD CONSTRAINT [FK_StockAdjustment_StockAdjustmentReason] FOREIGN KEY ([AdjustmentReasonId]) REFERENCES [dbo].[StockAdjustmentReason] ([Id])
GO
ALTER TABLE [dbo].[StockAdjustment] ADD CONSTRAINT [FK_StockAdjustment_InventoryOrganization] FOREIGN KEY ([InventoryOrganizationId]) REFERENCES [APPS].[InventoryOrganization] ([Id])
GO
ALTER TABLE [dbo].[StockAdjustment] ADD CONSTRAINT [FK_StockAdjustment_Employee] FOREIGN KEY ([RequesterId]) REFERENCES [HR].[Employee] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[StockAdjustmentReason]'
GO
ALTER TABLE [dbo].[StockAdjustmentReason] ADD CONSTRAINT [FK_StockAdjustmentReason_LegalEntity] FOREIGN KEY ([LegalEntityId]) REFERENCES [APPS].[LegalEntity] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[StockRequestDetail]'
GO
ALTER TABLE [dbo].[StockRequestDetail] ADD CONSTRAINT [FK_StockRequestDetail_StockRequest] FOREIGN KEY ([StockRequestId]) REFERENCES [dbo].[StockRequest] ([Id])
GO
ALTER TABLE [dbo].[StockRequestDetail] ADD CONSTRAINT [FK_StockRequestDetail_UnitOfMeasure] FOREIGN KEY ([UnitOfMeasureId]) REFERENCES [APPS].[UnitOfMeasure] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[StockRequest]'
GO
ALTER TABLE [dbo].[StockRequest] ADD CONSTRAINT [FK_StockRequest_InventoryOrganization] FOREIGN KEY ([InventoryOrganizationId]) REFERENCES [APPS].[InventoryOrganization] ([Id])
GO
ALTER TABLE [dbo].[StockRequest] ADD CONSTRAINT [FK_StockRequest_Employee] FOREIGN KEY ([RequesterId]) REFERENCES [HR].[Employee] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[Stock]'
GO
ALTER TABLE [dbo].[Stock] ADD CONSTRAINT [FK_Stock_InventoryOrganization] FOREIGN KEY ([InventoryOrganizationId]) REFERENCES [APPS].[InventoryOrganization] ([Id])
GO
ALTER TABLE [dbo].[Stock] ADD CONSTRAINT [FK_Stock_Item] FOREIGN KEY ([ItemId]) REFERENCES [APPS].[Item] ([Id])
GO
