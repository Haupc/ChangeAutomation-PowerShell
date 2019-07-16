-- <Migration ID="211d82d3-3e2e-4318-8860-eb1bd3fa5143" />
GO

PRINT N'Altering [APPS].[Division]'
GO
EXEC sp_rename N'[APPS].[Division].[ShortCode]', N'ShortName', N'COLUMN'
GO
PRINT N'Altering [APPS].[AssetOrganization]'
GO
EXEC sp_rename N'[APPS].[AssetOrganization].[ShortCode]', N'ShortName', N'COLUMN'
GO
PRINT N'Altering [APPS].[BusinessGroup]'
GO
EXEC sp_rename N'[APPS].[BusinessGroup].[ShortCode]', N'ShortName', N'COLUMN'
GO
PRINT N'Altering [APPS].[SetOfBook]'
GO
EXEC sp_rename N'[APPS].[SetOfBook].[ShortCode]', N'ShortName', N'COLUMN'
GO
PRINT N'Altering [APPS].[HROrganization]'
GO
EXEC sp_rename N'[APPS].[HROrganization].[ShortCode]', N'ShortName', N'COLUMN'
GO
PRINT N'Altering [APPS].[LegalEntity]'
GO
EXEC sp_rename N'[APPS].[LegalEntity].[ShortCode]', N'ShortName', N'COLUMN'
GO
PRINT N'Altering [APPS].[InventoryOrganization]'
GO
EXEC sp_rename N'[APPS].[InventoryOrganization].[ShortCode]', N'ShortName', N'COLUMN'
GO
PRINT N'Altering [APPS].[ProjectOrganization]'
GO
EXEC sp_rename N'[APPS].[ProjectOrganization].[ShortCode]', N'ShortName', N'COLUMN'
GO
