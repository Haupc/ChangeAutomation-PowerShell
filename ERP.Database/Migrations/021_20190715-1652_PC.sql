-- <Migration ID="b5ee5e2b-cbec-4117-88ee-bbbbc1aedaef" />
GO

PRINT N'Altering [APPS].[SetOfBook]'
GO
ALTER TABLE [APPS].[SetOfBook] ADD
[ChartOfAccountTemplateId] [uniqueidentifier] NULL,
[EnvironmentTaxTemplateId] [uniqueidentifier] NULL,
[ExportTaxTemplateId] [uniqueidentifier] NULL,
[ImportTaxTemplateId] [uniqueidentifier] NULL,
[NaturalResourceTaxTemplateId] [uniqueidentifier] NULL,
[SpecialConsumptionTaxTemplateId] [uniqueidentifier] NULL,
[ValueAddedTaxTemplateId] [uniqueidentifier] NULL
GO
PRINT N'Creating [APPS].[EnumMasterData]'
GO
CREATE TABLE [APPS].[EnumMasterData]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Key] [nvarchar] (10) NOT NULL,
[Value] [nvarchar] (100) NOT NULL
)
GO
PRINT N'Creating index [CX_EnumMasterData] on [APPS].[EnumMasterData]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_EnumMasterData] ON [APPS].[EnumMasterData] ([CX])
GO
PRINT N'Creating primary key [PK_EnumMasterData] on [APPS].[EnumMasterData]'
GO
ALTER TABLE [APPS].[EnumMasterData] ADD CONSTRAINT [PK_EnumMasterData] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Altering [APPS].[ChartOfAccount]'
GO
ALTER TABLE [APPS].[ChartOfAccount] ADD
[Characteristic] [uniqueidentifier] NULL
GO
PRINT N'Altering [APPS].[CustomerContact]'
GO
PRINT N'Adding foreign keys to [APPS].[ChartOfAccount]'
GO
ALTER TABLE [APPS].[ChartOfAccount] ADD CONSTRAINT [FK_ChartOfAccount_EnumMasterData] FOREIGN KEY ([Characteristic]) REFERENCES [APPS].[EnumMasterData] ([Id])
GO
