-- <Migration ID="6c0376d3-6692-4368-b269-6de8ba5fc8e5" />
GO

PRINT N'Creating [dbo].[Table_1]'
GO
CREATE TABLE [dbo].[Table_1]
(
[ID] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Table_1] on [dbo].[Table_1]'
GO
ALTER TABLE [dbo].[Table_1] ADD CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED  ([ID])
GO
