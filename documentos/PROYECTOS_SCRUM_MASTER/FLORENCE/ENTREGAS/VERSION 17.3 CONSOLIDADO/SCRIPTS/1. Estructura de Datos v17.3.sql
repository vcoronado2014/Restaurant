--15986_ALTER_TABLE_Hclinica_DocumentosEscaneados.sql

/*--(09/08/2017) - v17.3 - 15986 - MPR - Recoleccion de evidencia en documentos escaneados --*/

USE [Hclinica]
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'DniUsuarioEscanea' 
					 AND table_name = 'DocumentosEscaneados')
BEGIN
	ALTER TABLE Hclinica..DocumentosEscaneados ADD DniUsuarioEscanea CHAR(8) NULL;
END

GO



--16147_ALTER_TABLE_HClinica_Ecogrf.sql

/*-- (24/08/2017) v17.3 - 16147 - MPR - Mejoras Urgencia Maternidad y Partograma --*/

USE [Hclinica]
GO

IF NOT EXISTS(
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Ecogrf' AND COLUMN_NAME = 'EdadGestacional'
)
BEGIN
	ALTER TABLE Ecogrf ADD EdadGestacional VARCHAR(10) NULL;
END

IF NOT EXISTS(
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Ecogrf' AND COLUMN_NAME = 'Estado'
)
BEGIN
	ALTER TABLE Ecogrf ADD Estado BIT NULL;
END

IF NOT EXISTS(
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Ecogrf' AND COLUMN_NAME = 'Peso'
)
BEGIN
	ALTER TABLE Ecogrf ADD Peso INT NULL;
END

IF NOT EXISTS(
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Ecogrf' AND COLUMN_NAME = 'AnatomiaPatologica'
)
BEGIN
	ALTER TABLE Ecogrf ADD AnatomiaPatologica VARCHAR(1000) NULL;
END

GO



--16147_ALTER_TABLE_HClinica_InformeGinecologico.sql

/*-- (24/08/2017) v17.3 - 16147 - MPR - Mejoras Urgencia Maternidad y Partograma --*/

USE [Hclinica]
GO

IF NOT EXISTS(
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'InformeGinecologico' AND COLUMN_NAME = 'PesoInicial'
)
BEGIN
	ALTER TABLE InformeGinecologico ADD PesoInicial INT NULL;
END

IF NOT EXISTS(
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'InformeGinecologico' AND COLUMN_NAME = 'PesoFinal'
)
BEGIN
	ALTER TABLE InformeGinecologico ADD PesoFinal INT NULL;
END

IF NOT EXISTS(
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'InformeGinecologico' AND COLUMN_NAME = 'Talla'
)
BEGIN
	ALTER TABLE InformeGinecologico ADD Talla INT NULL;
END
GO



--16147_ALTER_TABLE_HClinica_Partograma.sql

/*-- (24/08/2017) v17.3 - 16147 - MPR - Mejoras Urgencia Maternidad y Partograma --*/

USE [Hclinica]
GO

IF NOT EXISTS(
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Partograma' AND COLUMN_NAME = 'MonitorizacionFetal'
)
BEGIN
	ALTER TABLE Partograma ADD MonitorizacionFetal VARCHAR(200) NULL;
END

IF NOT EXISTS(
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Partograma' AND COLUMN_NAME = 'ResponsableTexto'
)
BEGIN
	ALTER TABLE Partograma ADD ResponsableTexto VARCHAR(200) NULL;
END

IF NOT EXISTS(
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Partograma' AND COLUMN_NAME = 'FecAmniorrexis'
)
BEGIN
	ALTER TABLE Partograma ADD FecAmniorrexis SMALLDATETIME NULL;
END

IF NOT EXISTS(
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Partograma' AND COLUMN_NAME = 'Amniorrexis'
)
BEGIN
	ALTER TABLE Partograma ADD Amniorrexis CHAR(1) NULL;
END

IF NOT EXISTS(
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Partograma' AND COLUMN_NAME = 'LiqAmniotico'
)
BEGIN
	ALTER TABLE Partograma ADD LiqAmniotico CHAR(1) NULL;
END


GO



--16148_ALTER_TABLE_Parametros_BloqueoQuirofanos.sql

--V17.3 - 16148 - ASM - Bloqueo de pabellón por intervalos de horarios

USE Parametros
GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'BloqueoQuirofanos' AND COLUMN_NAME = 'Intervalos')
BEGIN
ALTER TABLE BloqueoQuirofanos
ADD Intervalos BIT NOT NULL DEFAULT 0
END
GO



--16153_ALTER_TABLE_Hclinica_InformeQuirurgico.sql

/*-- (02/08/2017) v17.3 - 16153 - MPR - Registro Quirurgico - Incorporar registro de Turno --*/

USE [HClinica]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Agregar columna
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'IdTurnoInfQuirurgico' 
					 AND table_name = 'InformeQuirurgico')
BEGIN
	ALTER TABLE HClinica..InformeQuirurgico ADD IdTurnoInfQuirurgico int NULL;
END
GO



--16153_CREATE_TABLE_Parametros_TurnosInfQuirurgico.sql


/*-- (02/08/2017) v17.3 - 16153 - MPR - Registro Quirurgico - Incorporar registro de Turno --*/

USE [Parametros]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TurnosInfQuirurgico]') AND type in (N'U'))
BEGIN

	CREATE TABLE [dbo].[TurnosInfQuirurgico](
		[IdTurnoInfQuirurgico] [int] NOT NULL,	
		[CodTurnoInfQuirurgico] [int] NOT NULL,
		[Descripcion] [varchar](50) NOT NULL,
		[Orden] [int] NOT NULL,
		[CodCentro] [char](5) NOT NULL,
	
	 CONSTRAINT [PK_TurnosInfQuirurgico] PRIMARY KEY CLUSTERED 
	(
		[IdTurnoInfQuirurgico] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	
END

GO


GO



--16489_ALTER_TABLE_HClinica..Diuresis.sql

--(21/08/2017) - V17.3 - 16489 - APB - Volumen ingerido de Control de Ingesta a Balances

USE [Hclinica]
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = 'Diuresis' AND column_name = 'Diuresis' AND DATA_TYPE = 'smallint')
BEGIN
	ALTER TABLE Hclinica..Diuresis ALTER COLUMN Diuresis DECIMAL(10,2) NOT NULL
END
GO



--16489_ALTER_TABLE_Historico..Diuresis.sql

--(21/08/2017) - V17.3 - 16489 - APB - Volumen ingerido de Control de Ingesta a Balances

USE [Historico]
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = 'Diuresis' AND column_name = 'Diuresis' AND DATA_TYPE = 'smallint')
BEGIN
	ALTER TABLE Historico..Diuresis ALTER COLUMN Diuresis DECIMAL(10,2) NOT NULL
END
GO



--16489_ALTER_TABLE_Historificacion..HClinica_Diuresis.sql

--(21/08/2017) - V17.3 - 16489 - APB - Volumen ingerido de Control de Ingesta a Balances

USE [Historificacion]
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = 'HClinica_Diuresis' AND column_name = 'Diuresis' AND DATA_TYPE = 'smallint')
BEGIN
	ALTER TABLE Historificacion..HClinica_Diuresis ALTER COLUMN Diuresis DECIMAL(10,2) NOT NULL
END
GO



--16489_ALTER_TABLE_Ingresos..ControlIngesta.sql

--(21/08/2017) - V17.3 - 16489 - APB - Volumen ingerido de Control de Ingesta a Balances

USE [Ingresos]
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = 'ControlIngesta' AND column_name = 'EnBalance')
BEGIN
	ALTER TABLE Ingresos..ControlIngesta ADD EnBalance BIT DEFAULT 0
END
GO



--18451_ALTER_TABLE_Consultas_DerivacionConsultas.sql

/*--(23/08/2017) - v17.3 - 18451 - FCB - Ingresar observación al motivo de egreso en SIC --*/


USE [Consultas]
GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'RUNProfEgreso' 
					 AND table_name = 'DerivacionConsultas')
BEGIN
	ALTER TABLE Consultas..DerivacionConsultas ADD RUNProfEgreso varchar(9) NULL;
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'NomProfEgreso' 
					 AND table_name = 'DerivacionConsultas')
BEGIN
	ALTER TABLE Consultas..DerivacionConsultas ADD NomProfEgreso   varchar(80) NULL;
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'ObservacionEgreso ' 
					 AND table_name = 'DerivacionConsultas')
BEGIN
	ALTER TABLE Consultas..DerivacionConsultas ADD ObservacionEgreso  varchar(500) NULL;
END



GO



--18451_ALTER_TABLE_Consultas_DerivacionConsultasBorrados.sql

/*--(23/08/2017) - v17.3 - 18451 - FCB - Ingresar observación al motivo de egreso en SIC --*/


USE [Consultas]
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'RUNProfEgreso' 
					 AND table_name = 'DerivacionConsultasBorrados')
BEGIN
	ALTER TABLE Consultas..DerivacionConsultasBorrados ADD RUNProfEgreso varchar(9) NULL;
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'NomProfEgreso' 
					 AND table_name = 'DerivacionConsultasBorrados')
BEGIN
	ALTER TABLE Consultas..DerivacionConsultasBorrados ADD NomProfEgreso   varchar(80) NULL;
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'ObservacionEgreso ' 
					 AND table_name = 'DerivacionConsultasBorrados')
BEGIN
	ALTER TABLE Consultas..DerivacionConsultasBorrados ADD ObservacionEgreso  varchar(500) NULL;
END


GO



--18451_ALTER_TABLE_Consultas_Episodiosconsultas.sql

/*--(23/08/2017) - v17.3 - 18451 - FCB - Ingresar observación al motivo de egreso en SIC --*/

USE [Consultas]
GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'RUNProfEgreso' 
					 AND table_name = 'Episodioconsultas')
BEGIN
	ALTER TABLE Consultas..Episodioconsultas ADD RUNProfEgreso varchar(9) NULL;
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'NomProfEgreso' 
					 AND table_name = 'Episodioconsultas')
BEGIN
	ALTER TABLE Consultas..Episodioconsultas ADD NomProfEgreso   varchar(80) NULL;
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'ObservacionEgreso ' 
					 AND table_name = 'Episodioconsultas')
BEGIN
	ALTER TABLE Consultas..Episodioconsultas ADD ObservacionEgreso  varchar(500) NULL;
END


GO



--18451_ALTER_TABLE_Consultas_EpisodiosconsultasBorrados.sql

/*--(23/08/2017) - v17.3 - 18451 - FCB - Ingresar observación al motivo de egreso en SIC --*/


USE [Consultas]
GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'RUNProfEgreso' 
					 AND table_name = 'EpisodioconsultasBorrados')
BEGIN
	ALTER TABLE Consultas..EpisodioconsultasBorrados ADD RUNProfEgreso varchar(9) NULL;
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'NomProfEgreso' 
					 AND table_name = 'EpisodioconsultasBorrados')
BEGIN
	ALTER TABLE Consultas..EpisodioconsultasBorrados ADD NomProfEgreso   varchar(80) NULL;
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'ObservacionEgreso ' 
					 AND table_name = 'EpisodioconsultasBorrados')
BEGIN
	ALTER TABLE Consultas..EpisodioconsultasBorrados ADD ObservacionEgreso  varchar(500) NULL;
END


GO



--18451_ALTER_TABLE_Consultas_HistoricoEpisodioConsultas.sql

/*--(23/08/2017) - v17.3 - 18451 - FCB - Ingresar observación al motivo de egreso en SIC --*/


USE [Consultas]
GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'RUNProfEgreso' 
					 AND table_name = 'HistoricoEpisodioConsultas')
BEGIN
	ALTER TABLE Consultas..HistoricoEpisodioConsultas ADD RUNProfEgreso varchar(9) NULL;
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'NomProfEgreso' 
					 AND table_name = 'HistoricoEpisodioConsultas')
BEGIN
	ALTER TABLE Consultas..HistoricoEpisodioConsultas ADD NomProfEgreso   varchar(80) NULL;
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'ObservacionEgreso ' 
					 AND table_name = 'HistoricoEpisodioConsultas')
BEGIN
	ALTER TABLE Consultas..HistoricoEpisodioConsultas ADD ObservacionEgreso  varchar(500) NULL;
END


GO



--18451_ALTER_TABLE_Inter_HIS_Consell_PropuestasEliminadas.sql

/*--(23/08/2017) - v17.3 - 18451 - FCB - Ingresar observación al motivo de egreso en SIC --*/


USE [Inter_his_consell]
GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'RUNProfEgreso' 
					 AND table_name = 'PropuestasEliminadas')
BEGIN
	ALTER TABLE Inter_his_consell..PropuestasEliminadas ADD RUNProfEgreso varchar(9) NULL;
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'NomProfEgreso' 
					 AND table_name = 'PropuestasEliminadas')
BEGIN
	ALTER TABLE Inter_his_consell..PropuestasEliminadas ADD NomProfEgreso   varchar(80) NULL;
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'ObservacionEgreso' 
					 AND table_name = 'PropuestasEliminadas')
BEGIN
	ALTER TABLE Inter_his_consell..PropuestasEliminadas ADD ObservacionEgreso  varchar(500) NULL;
END



GO



--18463_ALTER_TABLE_Ingresos_EpisodioHospitalizacion.sql

/*--(14/06/2017) - v17.3 - 18463 - SGH - Información de Pacientes en Episodio de Hospitalizado (igual a POC) --*/

USE [Ingresos]
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'InfoPaciente' 
					 AND table_name = 'EpisodioHospitalizacion')
BEGIN
	ALTER TABLE Ingresos..EpisodioHospitalizacion ADD InfoPaciente varchar(4000);
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'dniInfoPacMed' 
					 AND table_name = 'EpisodioHospitalizacion')
BEGIN
	ALTER TABLE Ingresos..EpisodioHospitalizacion ADD dniInfoPacMed char(8);
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'dniInfoPacEnf' 
					 AND table_name = 'EpisodioHospitalizacion')
BEGIN
	ALTER TABLE Ingresos..EpisodioHospitalizacion ADD dniInfoPacEnf char(8);
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'FInfoPaciente' 
					 AND table_name = 'EpisodioHospitalizacion')
BEGIN
	ALTER TABLE Ingresos..EpisodioHospitalizacion ADD FInfoPaciente smalldatetime;
END


GO



--18485_ALTER_TABLE_Parametros_CentrosSalud.sql

/*--(21/06/2017) - v17.3 - 18485 - MPR - Seguridad en adjuntar documentos --*/

USE [Parametros]
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'Usuario' 
					 AND table_name = 'CentrosSalud')
BEGIN
	ALTER TABLE Parametros..CentrosSalud ADD Usuario varchar(50) NULL;
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'Password' 
					 AND table_name = 'CentrosSalud')
BEGIN
	ALTER TABLE Parametros..CentrosSalud ADD Password varchar(50) NULL;
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'Dominio' 
					 AND table_name = 'CentrosSalud')
BEGIN
	ALTER TABLE Parametros..CentrosSalud ADD Dominio varchar(100) NULL;
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'RequiereCredenciales' 
					 AND table_name = 'CentrosSalud')
BEGIN
	ALTER TABLE Parametros..CentrosSalud ADD RequiereCredenciales bit NOT NULL DEFAULT (0);
END

GO



--18491_CREATE_INDEX_Hclinica_HCRegistroAccesos.sql

/*-- (07/08/2017) v17.3 - 18491 - MPR - Creacion de Ã­ndices en HCRegistroAcceso --*/
USE [Hclinica]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS ( SELECT  [object_id] FROM sys.indexes WHERE name = 'NonClusteredIndex1_HCRegistroAccesos' ) 
BEGIN
--Agregar Ã­ndice en orden asc que no es llave primaria para acelerar las bÃºsquedas
CREATE NONCLUSTERED INDEX [NonClusteredIndex1_HCRegistroAccesos] ON [dbo].[HCRegistroAccesos]
(
	[FechaServidor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END
GO
GO



--19248_ALTER_TABLE_HClinica_SolicitudTraslado.sql

/*-- (24/08/2017) v17.3 - 19248 - MPR - Modificaciones en Solicitud de Traslado Externa desde 
										Admision e Historia Clinica --*/

USE [Hclinica]
GO

IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'SolicitudTraslado'
			   AND COLUMN_NAME = 'CodAcompanyante'
)
BEGIN
	ALTER TABLE SolicitudTraslado ADD CodAcompanyante INT NULL;
END

IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'SolicitudTraslado'
			   AND COLUMN_NAME = 'DNIMedicoTraslada'
)
BEGIN
	ALTER TABLE SolicitudTraslado ADD DNIMedicoTraslada CHAR(8) NULL;
END

IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'SolicitudTraslado'
			   AND COLUMN_NAME = 'DNIEnfermeraTraslada'
)
BEGIN
	ALTER TABLE SolicitudTraslado ADD DNIEnfermeraTraslada CHAR(8) NULL;
END

IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'SolicitudTraslado'
			   AND COLUMN_NAME = 'NombreMedicoRecibe'
)
BEGIN
	ALTER TABLE SolicitudTraslado ADD NombreMedicoRecibe VARCHAR(200) NULL;
END

IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'SolicitudTraslado'
			   AND COLUMN_NAME = 'NombreEnfermeraRecibe'
)
BEGIN
	ALTER TABLE SolicitudTraslado ADD NombreEnfermeraRecibe VARCHAR(200) NULL;
END

IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'SolicitudTraslado'
			   AND COLUMN_NAME = 'NombreMatronaRecibe'
)
BEGIN
	ALTER TABLE SolicitudTraslado ADD NombreMatronaRecibe VARCHAR(200) NULL;
END
GO



--19248_CREATE_TABLE_Parametros_SolicitudTrasladoAcompanyante.sql

/*-- (25/08/2017) v17.3 - 19248 - MPR - Modificaciones en Solicitud de Traslado Externa desde 
										Admision e Historia Clinica --*/
USE [Parametros]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitudTrasladoAcompanyante]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[SolicitudTrasladoAcompanyante]
	(
		[IdAcompanyante] [INTEGER] NOT NULL,
		[CodAcompanyante] [INTEGER] NOT NULL,
		[DescAcompanyante] [VARCHAR](100) NOT NULL,
		[Orden] [INTEGER] NOT NULL,
		[Eliminado] [BIT] NOT NULL DEFAULT 0,
		[CodCentro] [CHAR] (5) NOT NULL

		CONSTRAINT [PK_SolicitudTrasladoAcompanyante] PRIMARY KEY CLUSTERED 
		(
			[IdAcompanyante] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO



--19362_ALTER_TABLE_HClinica_SolicitudTraslado.sql

/*-- (22/08/2017) v17.3 - 19362 - MPR - Gestor de Solicitudes de Traslado --*/

USE [Hclinica]
GO

IF NOT EXISTS(
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'SolicitudTraslado' AND COLUMN_NAME = 'DNIProfesional'
)
BEGIN
	ALTER TABLE SolicitudTraslado ADD DNIProfesional CHAR(8) NULL;
END
GO



--19362_CREATE_TABLE_HClinica_ObservacionesST.sql

/*-- (22/08/2017) v17.3 - 19362 - MPR - Gestor de Solicitudes de Traslado --*/
USE [HClinica]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ObservacionesST]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[ObservacionesST]
	(
		[IdObservacion] [INTEGER] IDENTITY(1,1) NOT NULL ,
		[IdSolicitudTraslado] [BIGINT] NOT NULL,
		[FechaObservacion] [SMALLDATETIME] NOT NULL,
		[Descripcion] [VARCHAR](300) NULL,
		[DNIUsuario] [CHAR] (8) NULL,
		[IdEstSolTrans] [TINYINT] NOT NULL

		CONSTRAINT [PK_ObservacionesST] PRIMARY KEY CLUSTERED 
		(
			[IdObservacion] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO



--19362_CREATE_TABLE_HClinica_TrazabilidadST.sql

/*-- (22/08/2017) v17.3 - 19362 - MPR - Gestor de Solicitudes de Traslado --*/
USE [HClinica]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TrazabilidadST]') AND type in (N'U'))
BEGIN

	CREATE TABLE [dbo].[TrazabilidadST]
	(
		[IdMovimiento] [INTEGER] IDENTITY(1,1) NOT NULL ,
		[IdSolicitudTraslado] [BIGINT] NOT NULL,
		[FechaCambio] [SMALLDATETIME] NOT NULL,
		[FechaRegistro] [SMALLDATETIME] NOT NULL,
		[Descripcion] [VARCHAR](300) NULL,
		[NIFUsuario] [CHAR](9) NULL,
		[IdEstSolTrans] [TINYINT] NOT NULL
	
		CONSTRAINT [PK_TrazabilidadST] PRIMARY KEY CLUSTERED 
		(
			[IdMovimiento] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO



--19364_ALTER_TABLE_HClinica_Exitus.sql

--V17.3 - 19364 - ASM - Revertir estado de fallecimiento del paciente

USE HClinica
GO

IF NOT EXISTS(
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Exitus' AND COLUMN_NAME = 'DniMedicoActivacion'
)
BEGIN
	ALTER TABLE Exitus
	ADD DniMedicoActivacion CHAR(8)
END

IF NOT EXISTS(
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Exitus' AND COLUMN_NAME = 'F_Activacion'
)
BEGIN
	ALTER TABLE Exitus
	ADD F_Activacion SMALLDATETIME
END
GO



--19364_CREATE_TABLE_Historificacion_HClinica_Exitus.sql

--V17.3 - 19364 - ASM - Revertir estado de fallecimiento del paciente

USE Historificacion
GO

IF NOT EXISTS
(
	SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'HClinica_Exitus'
)
BEGIN
	CREATE TABLE HClinica_Exitus
	(
		IdExitus INTEGER PRIMARY KEY IDENTITY,
		CodPaciente CHAR(16) NOT NULL,
		CodHistoria CHAR(8) NULL,
		MotivoInmediato CHAR(6) NULL,
		MotivoIntermedio CHAR(6) NULL,
		MotivoFundamental CHAR(6) NULL,
		Obs VARCHAR(max) NULL,
		Usuario CHAR(8) NULL,
		DNIMedico CHAR(8) NULL,
		RegistroHC  BIT NOT NULL,
		Folio BIGINT NULL,
		DniMedicoActivacion CHAR(8),
		F_Activacion SMALLDATETIME,
		F_Historificacion SMALLDATETIME
	)
END
GO
--CONSOLIDACION
--16147_ALTER_TABLE_HClinica_Ecogrf.sql

/*-- (24/08/2017) v17.3r1 - 16147 - MPR/FCB/APB - Mejoras Urgencia Maternidad y Partograma --*/

USE [Hclinica]
GO

IF EXISTS(SELECT *
		  FROM INFORMATION_SCHEMA.COLUMNS
		  WHERE TABLE_NAME = 'Ecogrf' AND COLUMN_NAME = 'EdadGestacional')
BEGIN
	ALTER TABLE Hclinica..Ecogrf DROP COLUMN EdadGestacional;
END

IF NOT EXISTS(SELECT *
			  FROM INFORMATION_SCHEMA.COLUMNS
			  WHERE TABLE_NAME = 'Ecogrf' AND COLUMN_NAME = 'Estado')
BEGIN
	ALTER TABLE Hclinica..Ecogrf ADD Estado BIT NULL;
END

IF NOT EXISTS(SELECT *
			  FROM INFORMATION_SCHEMA.COLUMNS
			  WHERE TABLE_NAME = 'Ecogrf' AND COLUMN_NAME = 'Peso')
	BEGIN
		ALTER TABLE Hclinica..Ecogrf ADD Peso DECIMAL(6,2) NULL;
	END
ELSE
	IF EXISTS(SELECT *
			  FROM INFORMATION_SCHEMA.COLUMNS
			  WHERE TABLE_NAME = 'Ecogrf' AND COLUMN_NAME = 'Peso' AND DATA_TYPE = 'decimal' AND NUMERIC_SCALE = 0)
	BEGIN
		ALTER TABLE Hclinica..Ecogrf ALTER COLUMN Peso DECIMAL(6,2) NULL;
	END

IF NOT EXISTS(SELECT *
		      FROM INFORMATION_SCHEMA.COLUMNS
			  WHERE TABLE_NAME = 'Ecogrf' AND COLUMN_NAME = 'AnatomiaPatologica')
BEGIN
	ALTER TABLE Hclinica..Ecogrf ADD AnatomiaPatologica VARCHAR(1000) NULL;
END

IF NOT EXISTS(SELECT *
			  FROM INFORMATION_SCHEMA.COLUMNS
			  WHERE TABLE_NAME = 'Ecogrf' AND COLUMN_NAME = 'EGSemanas')
BEGIN
	ALTER TABLE Hclinica..Ecogrf ADD EGSemanas TINYINT NULL;
END

IF NOT EXISTS(SELECT *
		      FROM INFORMATION_SCHEMA.COLUMNS
		      WHERE TABLE_NAME = 'Ecogrf' AND COLUMN_NAME = 'EGDias')
BEGIN
	ALTER TABLE Hclinica..Ecogrf ADD EGDias TINYINT NULL;
END

GO



--16147_ALTER_TABLE_HClinica_InformeGinecologico.sql

/*-- (24/08/2017) v17.3r1 - 16147 - MPR/FCB/APB - Mejoras Urgencia Maternidad y Partograma --*/

USE [Hclinica]
GO

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS	WHERE TABLE_NAME = 'InformeGinecologico' AND COLUMN_NAME = 'PesoInicial')
	BEGIN
		ALTER TABLE Hclinica..InformeGinecologico ADD PesoInicial DECIMAL(6,2) NULL;
	END
ELSE
	IF EXISTS(SELECT *
		      FROM INFORMATION_SCHEMA.COLUMNS
			  WHERE TABLE_NAME = 'InformeGinecologico' AND COLUMN_NAME = 'PesoInicial' AND DATA_TYPE = 'decimal' AND NUMERIC_SCALE = 0)
	BEGIN
		ALTER TABLE Hclinica..InformeGinecologico ALTER COLUMN PesoInicial DECIMAL(6,2) NULL;
	END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS	WHERE TABLE_NAME = 'InformeGinecologico' AND COLUMN_NAME = 'PesoFinal')
	BEGIN
		ALTER TABLE Hclinica..InformeGinecologico ADD PesoFinal DECIMAL(6,2) NULL;
	END
ELSE
	IF EXISTS(SELECT *
		      FROM INFORMATION_SCHEMA.COLUMNS
			  WHERE TABLE_NAME = 'InformeGinecologico' AND COLUMN_NAME = 'PesoFinal' AND DATA_TYPE = 'decimal' AND NUMERIC_SCALE = 0)
	BEGIN
		ALTER TABLE Hclinica..InformeGinecologico ALTER COLUMN PesoFinal DECIMAL(6,2) NULL; 
	END


IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS	WHERE TABLE_NAME = 'InformeGinecologico' AND COLUMN_NAME = 'Talla')
	BEGIN
		ALTER TABLE Hclinica..InformeGinecologico ADD Talla DECIMAL(6,2) NULL;
	END
ELSE
	IF EXISTS(SELECT *
		      FROM INFORMATION_SCHEMA.COLUMNS
			  WHERE TABLE_NAME = 'InformeGinecologico' AND COLUMN_NAME = 'Talla' AND DATA_TYPE = 'decimal' AND NUMERIC_SCALE = 0)
	BEGIN
		ALTER TABLE Hclinica..InformeGinecologico ALTER COLUMN Talla DECIMAL(6,2) NULL; 
	END

GO



--16147_ALTER_TABLE_HClinica_Partograma.sql

/*-- (24/08/2017) v17.3r1 - 16147 - MPR/FCB/APB - Mejoras Urgencia Maternidad y Partograma --*/

USE [Hclinica]
GO

IF NOT EXISTS(
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Partograma' AND COLUMN_NAME = 'MonitorizacionFetal'
)
BEGIN
	ALTER TABLE Partograma ADD MonitorizacionFetal VARCHAR(200) NULL;
END

IF NOT EXISTS(
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Partograma' AND COLUMN_NAME = 'ResponsableTexto'
)
BEGIN
	ALTER TABLE Partograma ADD ResponsableTexto VARCHAR(200) NULL;
END

IF NOT EXISTS(
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Partograma' AND COLUMN_NAME = 'FecAmniorrexis'
)
BEGIN
	ALTER TABLE Partograma ADD FecAmniorrexis SMALLDATETIME NULL;
END

IF NOT EXISTS(
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Partograma' AND COLUMN_NAME = 'Amniorrexis'
)
BEGIN
	ALTER TABLE Partograma ADD Amniorrexis CHAR(1) NULL;
END

IF NOT EXISTS(
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Partograma' AND COLUMN_NAME = 'LiqAmniotico'
)
BEGIN
	ALTER TABLE Partograma ADD LiqAmniotico CHAR(1) NULL;
END

GO



--16152_ALTER_TABLE_Consultas..CapituloQPreopera.sql

/*--(03/10/2017) - v17.3r1 - 16152 - MMM - Agregar estado de Diagnósticos en solicitud de pabellón --*/


USE [Consultas]
GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'Estado ' 
					 AND table_name = 'CapituloQPreopera')
BEGIN
	ALTER TABLE Consultas..CapituloQPreopera ADD Estado INT NULL;
END

GO



--16152_ALTER_TABLE_Consultas..CapituloQuirurgico.sql

/*--(10/10/2017) - v17.3r1 - 16152 - MMM - Agregar estado de Diagnósticos en solicitud de pabellón --*/


USE [Consultas]
GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'Estado ' 
					 AND table_name = 'CapituloQuirurgico')
BEGIN
	ALTER TABLE Consultas..CapituloQuirurgico ADD Estado int NULL;
END

GO



--16152_ALTER_TABLE_HClinica..InformeQuirurgico.sql

/*--(16/10/2017) - v17.3r1 - 16152 - MMM - Agregar estado de Diagnósticos en solicitud de pabellón --*/


USE [Hclinica]
GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'Estado' 
					 AND table_name = 'InformeQuirurgico')
BEGIN
	ALTER TABLE Hclinica..InformeQuirurgico ADD Estado INT NULL;
END


GO



--16152_ALTER_TABLE_Ingresos..CapituloQPreopera.sql

/*--(23/10/2017) - v17.3r1 - 16152 - MMM - Agregar estado de Diagnósticos en solicitud de pabellón --*/


USE [Ingresos]
GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'Estado ' 
					 AND table_name = 'CapituloQPreopera')
BEGIN
	ALTER TABLE Ingresos..CapituloQPreopera ADD Estado INT NULL;
END
GO



--16152_ALTER_TABLE_Ingresos..CapituloQuirurgico.sql

/*--(23/10/2017) - v17.3r1 - 16152 - MMM - Agregar estado de Diagnósticos en solicitud de pabellón --*/


USE [Ingresos]
GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
			   WHERE column_name = 'Estado ' 
					 AND table_name = 'CapituloQuirurgico')
BEGIN
	ALTER TABLE Ingresos..CapituloQuirurgico ADD Estado int NULL;
END


GO
--CONSOLIDACION
/*-- (24/08/2017) V17.3r1 - 16147 - MPR/FCB/APB - Mejoras Urgencia Maternidad y Partograma --*/
/*-- (07/11/2017) V17.3r2 - 16147 - APB - Mejoras Urgencia Maternidad y Partograma --*/

USE [Hclinica]
GO

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'InformeGinecologico' AND COLUMN_NAME = 'PesoInicial')
	BEGIN
		ALTER TABLE Hclinica..InformeGinecologico ADD PesoInicial DECIMAL(6,2) NULL;
	END
ELSE
	IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'InformeGinecologico' AND COLUMN_NAME = 'PesoInicial' AND DATA_TYPE in ('int','decimal') AND NUMERIC_SCALE = 0)
	BEGIN
		ALTER TABLE Hclinica..InformeGinecologico ALTER COLUMN PesoInicial DECIMAL(6,2) NULL;
	END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS	WHERE TABLE_NAME = 'InformeGinecologico' AND COLUMN_NAME = 'PesoFinal')
	BEGIN
		ALTER TABLE Hclinica..InformeGinecologico ADD PesoFinal DECIMAL(6,2) NULL;
	END
ELSE
	IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'InformeGinecologico' AND COLUMN_NAME = 'PesoFinal' AND DATA_TYPE in ('int','decimal') AND NUMERIC_SCALE = 0)
	BEGIN
		ALTER TABLE Hclinica..InformeGinecologico ALTER COLUMN PesoFinal DECIMAL(6,2) NULL; 
	END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS	WHERE TABLE_NAME = 'InformeGinecologico' AND COLUMN_NAME = 'Talla')
	BEGIN
		ALTER TABLE Hclinica..InformeGinecologico ADD Talla DECIMAL(6,2) NULL;
	END
ELSE
	IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'InformeGinecologico' AND COLUMN_NAME = 'Talla' AND DATA_TYPE in ('int','decimal') AND NUMERIC_SCALE = 0)
	BEGIN
		ALTER TABLE Hclinica..InformeGinecologico ALTER COLUMN Talla DECIMAL(6,2) NULL; 
	END

/*-- (24/08/2017) V17.3r1 - 16147 - MPR/FCB/APB - Mejoras Urgencia Maternidad y Partograma --*/
/*-- (07/11/2017) V17.3r2 - 16147 - APB - Mejoras Urgencia Maternidad y Partograma --*/

USE [Hclinica]
GO

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Ecogrf' AND COLUMN_NAME = 'EdadGestacional')
BEGIN
	ALTER TABLE Hclinica..Ecogrf DROP COLUMN EdadGestacional;
END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Ecogrf' AND COLUMN_NAME = 'Estado')
BEGIN
	ALTER TABLE Hclinica..Ecogrf ADD Estado BIT NULL;
END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Ecogrf' AND COLUMN_NAME = 'Peso')
	BEGIN
		ALTER TABLE Hclinica..Ecogrf ADD Peso DECIMAL(6,2) NULL;
	END
ELSE
	IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Ecogrf' AND COLUMN_NAME = 'Peso' AND DATA_TYPE in ('int','decimal') AND NUMERIC_SCALE = 0)
	BEGIN
		ALTER TABLE Hclinica..Ecogrf ALTER COLUMN Peso DECIMAL(6,2) NULL;
	END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Ecogrf' AND COLUMN_NAME = 'AnatomiaPatologica')
BEGIN
	ALTER TABLE Hclinica..Ecogrf ADD AnatomiaPatologica VARCHAR(1000) NULL;
END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Ecogrf' AND COLUMN_NAME = 'EGSemanas')
BEGIN
	ALTER TABLE Hclinica..Ecogrf ADD EGSemanas TINYINT NULL;
END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Ecogrf' AND COLUMN_NAME = 'EGDias')
BEGIN
	ALTER TABLE Hclinica..Ecogrf ADD EGDias TINYINT NULL;
END






