-- <Migration ID="b0192e9b-1d8b-4929-813b-961fa2f82463" />
GO

PRINT N'Creating [dbo].[Table_1]'
GO
CREATE TABLE [dbo].[Table_1]
(
[id] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Table_1] on [dbo].[Table_1]'
GO
ALTER TABLE [dbo].[Table_1] ADD CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED  ([id])
GO
