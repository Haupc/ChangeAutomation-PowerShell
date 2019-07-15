CREATE TABLE [APPS].[FiscalCalendar]
(
[Id] [uniqueidentifier] NOT NULL,
[SetOfBookId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Year] [int] NOT NULL,
[StartDate] [datetime] NOT NULL,
[EndDate] [datetime] NOT NULL
)
GO
ALTER TABLE [APPS].[FiscalCalendar] ADD CONSTRAINT [PK_FiscalCalendar] PRIMARY KEY CLUSTERED  ([Id])
GO
ALTER TABLE [APPS].[FiscalCalendar] ADD CONSTRAINT [FK_FiscalCalendar_SetofBook] FOREIGN KEY ([SetOfBookId]) REFERENCES [APPS].[SetOfBook] ([Id])
GO
