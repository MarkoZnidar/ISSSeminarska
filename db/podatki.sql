
		
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)

PRINT(N'Drop constraints from [dbo].[Termin]')
ALTER TABLE [dbo].[Termin] NOCHECK CONSTRAINT [FK_Termin_Predmet]

PRINT(N'Add 7 rows to [dbo].[Predmet]')
SET IDENTITY_INSERT [dbo].[Predmet] ON
INSERT INTO [dbo].[Predmet] ([PredmetID], [Naziv]) VALUES (1, N'Elektronsko poslovanje')
INSERT INTO [dbo].[Predmet] ([PredmetID], [Naziv]) VALUES (2, N'Strokovna terminologija v tujem jeziku')
INSERT INTO [dbo].[Predmet] ([PredmetID], [Naziv]) VALUES (3, N'Izdelava spletnih strani')
INSERT INTO [dbo].[Predmet] ([PredmetID], [Naziv]) VALUES (4, N'Raèunalništvo in informatika')
INSERT INTO [dbo].[Predmet] ([PredmetID], [Naziv]) VALUES (5, N'Osnove zgradbe in delovanja raèunalniških sistemov')
INSERT INTO [dbo].[Predmet] ([PredmetID], [Naziv]) VALUES (6, N'Poslovno komuniciranje in vodenje')
INSERT INTO [dbo].[Predmet] ([PredmetID], [Naziv]) VALUES (7, N'Ekonomika podjetja')
SET IDENTITY_INSERT [dbo].[Predmet] OFF

PRINT(N'Add 39 rows to [dbo].[Termin]')
SET IDENTITY_INSERT [dbo].[Termin] ON
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (1, 1, '2016-10-14 16:15:00.000', '2016-10-14 21:00:00.000', N'EPO Predavanje')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (2, 1, '2016-10-21 16:15:00.000', '2016-10-21 19:00:00.000', N'EPO - Vaje Skupina 1')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (3, 1, '2016-10-21 19:00:00.000', '2016-10-21 21:30:00.000', N'EPO - Vaje Skupina 2')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (4, 1, '2016-10-28 16:15:00.000', '2016-10-28 19:00:00.000', N'EPO - Vaje Skupina 1')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (5, 1, '2016-10-28 19:00:00.000', '2016-10-28 21:30:00.000', N'EPO - Vaje Skupina 2')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (6, 1, '2016-11-11 16:15:00.000', '2016-11-11 19:00:00.000', N'EPO - Vaje Skupina 1')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (7, 1, '2016-11-11 19:00:00.000', '2016-11-11 21:30:00.000', N'EPO - Vaje Skupina 2')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (8, 2, '2016-11-17 00:00:00.000', '2016-11-24 00:00:00.000', N'STJ - Teden 1')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (9, 2, '2016-11-24 00:00:00.000', '2016-12-01 00:00:00.000', N'STJ - Teden 2')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (10, 2, '2016-12-01 00:00:00.000', '2016-12-08 00:00:00.000', N'STJ - Teden 3')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (11, 2, '2016-12-08 00:00:00.000', '2016-12-14 00:00:00.000', N'STJ - Teden 4')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (12, 3, '2016-12-19 16:15:00.000', '2016-12-19 19:00:00.000', N'ISS Predavanje')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (13, 3, '2016-12-20 16:15:00.000', '2016-12-20 19:00:00.000', N'ISS Vaje Skupina 1')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (14, 3, '2016-12-20 19:00:00.000', '2016-12-20 21:30:00.000', N'ISS Vaje Skupina 2')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (15, 3, '2017-01-05 16:15:00.000', '2017-01-05 19:00:00.000', N'ISS Vaje Skupina 1')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (16, 3, '2017-01-05 19:00:00.000', '2017-01-05 21:30:00.000', N'ISS Vaje Skupina 2')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (17, 3, '2017-01-14 16:15:00.000', '2017-01-05 19:00:00.000', N'ISS Vaje Skupina 1')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (18, 3, '2017-01-14 19:00:00.000', '2017-01-14 21:30:00.000', N'ISS Vaje Skupina 2')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (19, 4, '2017-01-16 00:00:00.000', '2017-01-23 00:00:00.000', N'RAI - Teden 1')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (20, 4, '2017-01-23 00:00:00.000', '2017-01-30 00:00:00.000', N'RAI - Teden 2')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (21, 4, '2017-01-30 00:00:00.000', '2017-02-06 00:00:00.000', N'RAI - Teden 3')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (22, 4, '2017-02-06 00:00:00.000', '2017-02-12 00:00:00.000', N'RAI - Teden 4')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (23, 4, '2017-02-10 16:15:00.000', '2017-02-10 19:00:00.000', N'RAI - Vaje Skupina 1')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (24, 4, '2017-02-10 21:00:00.000', '2017-02-10 21:30:00.000', N'RAI - Vaje Skupina 2')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (25, 5, '2017-02-13 16:15:00.000', '2017-02-13 19:00:00.000', N'ORS Predavanje')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (26, 5, '2017-02-17 16:15:00.000', '2017-02-17 19:00:00.000', N'ORS Vaje Skupina 1')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (27, 5, '2017-02-17 19:00:00.000', '2017-02-17 21:30:00.000', N'ORS Vaje Skupina 2')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (31, 5, '2017-03-06 16:15:00.000', '2017-03-06 19:00:00.000', N'ORS Vaje Skupina 1')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (32, 5, '2017-03-06 19:00:00.000', '2017-03-06 21:30:00.000', N'ORS Vaje Skupina 2')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (33, 5, '2017-03-10 16:15:00.000', '2017-03-10 19:00:00.000', N'ORS Vaje Skupina 1')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (34, 5, '2017-03-10 19:00:00.000', '2017-03-10 21:30:00.000', N'ORS Vaje Skupina 2')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (35, 6, '2017-03-13 00:00:00.000', '2017-03-20 00:00:00.000', N'PKV Teden 1')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (36, 6, '2017-03-20 00:00:00.000', '2017-03-27 00:00:00.000', N'PKV Teden 2')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (37, 6, '2017-03-27 00:00:00.000', '2017-04-03 00:00:00.000', N'PKV Teden 3')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (38, 6, '2017-04-03 00:00:00.000', '2017-04-09 00:00:00.000', N'PKV Teden 4')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (39, 7, '2017-04-10 00:00:00.000', '2017-04-17 00:00:00.000', N'EP Teden 1')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (41, 7, '2017-04-17 00:00:00.000', '2017-04-24 00:00:00.000', N'EP Teden 2')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (42, 7, '2017-04-24 00:00:00.000', '2017-05-01 00:00:00.000', N'EP Teden 3')
INSERT INTO [dbo].[Termin] ([TerminID], [PredmetID], [Zacetek], [Konec], [Opis]) VALUES (43, 7, '2017-05-01 00:00:00.000', '2017-05-08 00:00:00.000', N'EP Teden 4')
SET IDENTITY_INSERT [dbo].[Termin] OFF

PRINT(N'Add constraints to [dbo].[Termin]')
ALTER TABLE [dbo].[Termin] WITH CHECK CHECK CONSTRAINT [FK_Termin_Predmet]
COMMIT TRANSACTION
GO
