-- <Migration ID="74e2f742-91e2-4515-a390-725130d8e412" />
GO

PRINT N'Altering [APPS].[COATemplateDetail]'
GO
ALTER TABLE [APPS].[COATemplateDetail] ADD
[ParentId] [uniqueidentifier] NULL
GO
