
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[Predmet]'
GO
CREATE TABLE [dbo].[Predmet]
(
[PredmetID] [int] NOT NULL IDENTITY(1, 1),
[Naziv] [nvarchar] (500) COLLATE Slovenian_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_Predmet] on [dbo].[Predmet]'
GO
ALTER TABLE [dbo].[Predmet] ADD CONSTRAINT [PK_Predmet] PRIMARY KEY CLUSTERED  ([PredmetID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[Termin]'
GO
CREATE TABLE [dbo].[Termin]
(
[TerminID] [int] NOT NULL IDENTITY(1, 1),
[PredmetID] [int] NOT NULL,
[Zacetek] [datetime] NULL,
[Konec] [datetime] NULL,
[Opis] [nvarchar] (500) COLLATE Slovenian_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_Termin] on [dbo].[Termin]'
GO
ALTER TABLE [dbo].[Termin] ADD CONSTRAINT [PK_Termin] PRIMARY KEY CLUSTERED  ([TerminID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[Termin]'
GO
ALTER TABLE [dbo].[Termin] ADD CONSTRAINT [FK_Termin_Predmet] FOREIGN KEY ([PredmetID]) REFERENCES [dbo].[Predmet] ([PredmetID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
COMMIT TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
DECLARE @Success AS BIT
SET @Success = 1
SET NOEXEC OFF
IF (@Success = 1) PRINT 'The database update succeeded'
ELSE BEGIN
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
	PRINT 'The database update failed'
END
GO
