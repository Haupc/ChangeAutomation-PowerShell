CREATE TABLE [INV].[Bin]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Disable] [bit] NOT NULL,
[Code] [nvarchar] (50) NOT NULL,
[RackId] [uniqueidentifier] NOT NULL
)
GO
ALTER TABLE [INV].[Bin] ADD CONSTRAINT [PK_Bin] PRIMARY KEY CLUSTERED  ([Id])
GO
