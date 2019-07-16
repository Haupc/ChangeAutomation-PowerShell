CREATE TABLE [INV].[Rack]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[RowId] [uniqueidentifier] NOT NULL
)
GO
ALTER TABLE [INV].[Rack] ADD CONSTRAINT [PK_Rack] PRIMARY KEY CLUSTERED  ([Id])
GO
