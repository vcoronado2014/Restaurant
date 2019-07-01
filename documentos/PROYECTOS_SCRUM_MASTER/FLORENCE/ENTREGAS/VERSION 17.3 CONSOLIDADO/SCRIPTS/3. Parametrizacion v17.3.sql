--Cambio versión 17.3.sql

--Update version.sql

update Parametros..Configuracion
set Version = '17.3', FechaActualizacion = GETDATE()
GO


--16153_INSERT_INTO_Parametros..TurnosInfQuirurgico.sql

/*-- (02/08/2017) v17.3 - 16153 - MPR - Registro Quirurgico - Incorporar registro de Turno --*/

USE [Parametros]
GO

DECLARE @maxValue as INT = 0
DECLARE @spvar_CodCentro as varchar(5) = XXXXX

-- Obtenemos la ultima clave primaria 
SELECT @maxValue= max(IdTurnoInfQuirurgico) FROM Parametros..TurnosInfQuirurgico

-- Si no hay registros entronces empezamos en el 1 sino en el ultimo + 1
IF (@maxValue IS NULL)
BEGIN
	SET @maxValue =  1
END
ELSE 
BEGIN
	SET @maxValue = @maxValue+1
END


IF NOT EXISTS (SELECT * FROM Parametros..TurnosInfQuirurgico WHERE IdTurnoInfQuirurgico = @maxValue
				AND CodCentro = @spvar_CodCentro)
BEGIN
	INSERT INTO Parametros..TurnosInfQuirurgico ([IdTurnoInfQuirurgico],[CodTurnoInfQuirurgico],[Descripcion],[Orden],[CodCentro])
	VALUES ( @maxValue, 1, '1', 0, @spvar_CodCentro)
END
SET @maxValue = @maxValue+1


IF NOT EXISTS (SELECT * FROM Parametros..TurnosInfQuirurgico WHERE IdTurnoInfQuirurgico = @maxValue
				AND CodCentro = @spvar_CodCentro)
BEGIN
	INSERT INTO Parametros..TurnosInfQuirurgico ([IdTurnoInfQuirurgico],[CodTurnoInfQuirurgico],[Descripcion],[Orden],[CodCentro])
	VALUES ( @maxValue, 2, '2', 1, @spvar_CodCentro)
END
SET @maxValue = @maxValue+1


IF NOT EXISTS (SELECT * FROM Parametros..TurnosInfQuirurgico WHERE IdTurnoInfQuirurgico = @maxValue
				AND CodCentro = @spvar_CodCentro)
BEGIN
	INSERT INTO Parametros..TurnosInfQuirurgico ([IdTurnoInfQuirurgico],[CodTurnoInfQuirurgico],[Descripcion],[Orden],[CodCentro])
	VALUES ( @maxValue, 3, '3', 2, @spvar_CodCentro)
END
SET @maxValue = @maxValue+1


IF NOT EXISTS (SELECT * FROM Parametros..TurnosInfQuirurgico WHERE IdTurnoInfQuirurgico = @maxValue
				AND CodCentro = @spvar_CodCentro)
BEGIN
	INSERT INTO Parametros..TurnosInfQuirurgico ([IdTurnoInfQuirurgico],[CodTurnoInfQuirurgico],[Descripcion],[Orden],[CodCentro])
	VALUES ( @maxValue, 4, '4', 3, @spvar_CodCentro)
END
SET @maxValue = @maxValue+1


IF NOT EXISTS (SELECT * FROM Parametros..TurnosInfQuirurgico WHERE IdTurnoInfQuirurgico = @maxValue
				AND CodCentro = @spvar_CodCentro)
BEGIN
	INSERT INTO Parametros..TurnosInfQuirurgico ([IdTurnoInfQuirurgico],[CodTurnoInfQuirurgico],[Descripcion],[Orden],[CodCentro])
	VALUES ( @maxValue, 5, '5', 4, @spvar_CodCentro)
END
SET @maxValue = @maxValue+1


IF NOT EXISTS (SELECT * FROM Parametros..TurnosInfQuirurgico WHERE IdTurnoInfQuirurgico = @maxValue
				AND CodCentro = @spvar_CodCentro)
BEGIN
	INSERT INTO Parametros..TurnosInfQuirurgico ([IdTurnoInfQuirurgico],[CodTurnoInfQuirurgico],[Descripcion],[Orden],[CodCentro])
	VALUES ( @maxValue, 6, 'Volante', 5, @spvar_CodCentro)
END
GO



--16153_INSERT_INTO_Parametros_ParametrizadorCampos.sql

/*--(03/08/2017) - v17.3 - 16153 - MPR - Registro Quirurgico - Incorporar registro de Turno --*/

USE [Parametros]
GO

IF NOT EXISTS (SELECT * FROM Parametros..ParametrizadorCampos WHERE Tabla = 'TurnosInfQuirurgico'
				AND Campo = 'IdTurnoInfQuirurgico')
BEGIN
	INSERT INTO Parametros..ParametrizadorCampos ([Tabla],[Campo],[Descripcion],[TipoDato],
	[DatoExtra],[Filtro],[Nulo],[Orden],[Primaria])
	VALUES ( 'TurnosInfQuirurgico', 'IdTurnoInfQuirurgico', 'IdTurnoInfQuirurgico', 'I', NULL, 1, 0, 1, 1)
END

IF NOT EXISTS (SELECT * FROM Parametros..ParametrizadorCampos WHERE Tabla = 'TurnosInfQuirurgico'
				AND Campo = 'CodCentro')
BEGIN
	INSERT INTO Parametros..ParametrizadorCampos ([Tabla],[Campo],[Descripcion],[TipoDato],
	[DatoExtra],[Filtro],[Nulo],[Orden],[Primaria])
	VALUES ( 'TurnosInfQuirurgico', 'CodTurnoInfQuirurgico', 'CodTurnoInfQuirurgico', 'I', NULL, 1, 0, 2, 0)
END

IF NOT EXISTS (SELECT * FROM Parametros..ParametrizadorCampos WHERE Tabla = 'TurnosInfQuirurgico'
				AND Campo = 'Descripcion')
BEGIN
	INSERT INTO Parametros..ParametrizadorCampos ([Tabla],[Campo],[Descripcion],[TipoDato],
	[DatoExtra],[Filtro],[Nulo],[Orden],[Primaria])
	VALUES ( 'TurnosInfQuirurgico', 'Descripcion', 'Descripcion', 'S', 50, 1, 1, 3, 0)
END

IF NOT EXISTS (SELECT * FROM Parametros..ParametrizadorCampos WHERE Tabla = 'TurnosInfQuirurgico'
				AND Campo = 'Orden')
BEGIN
	INSERT INTO Parametros..ParametrizadorCampos ([Tabla],[Campo],[Descripcion],[TipoDato],
	[DatoExtra],[Filtro],[Nulo],[Orden],[Primaria])
	VALUES ( 'TurnosInfQuirurgico', 'Orden', 'Orden', 'I', NULL, 1, 0, 4, 0)
END

IF NOT EXISTS (SELECT * FROM Parametros..ParametrizadorCampos WHERE Tabla = 'TurnosInfQuirurgico'
				AND Campo = 'CodCentro')
BEGIN
	INSERT INTO Parametros..ParametrizadorCampos ([Tabla],[Campo],[Descripcion],[TipoDato],
	[DatoExtra],[Filtro],[Nulo],[Orden],[Primaria])
	VALUES ( 'TurnosInfQuirurgico', 'CodCentro', 'CodCentro', 'S', 5, 1, 0, 5, 0)
END
GO



--16153_INSERT_INTO_Parametros_ParametrizadorTablas.sql

/*--(03/08/2017) - v17.3 - 16153 - MPR - Registro Quirurgico - Incorporar registro de Turno --*/

USE [Parametros]
GO

IF NOT EXISTS (SELECT * FROM Parametros..ParametrizadorTablas WHERE Tabla = 'TurnosInfQuirurgico')
BEGIN
	INSERT INTO Parametros..ParametrizadorTablas ([Tabla],[Descripcion],[SPNombre],
	[SPParametros],[Nuevo],[Editar],[Eliminar],[EdicionMasiva],[Importar],[Exportar],
	 [EliminacionMasiva],[Ayuda])
	VALUES ( 'TurnosInfQuirurgico', 'TurnosInfQuirurgico', NULL, NULL, 1, 1, 1, 1, 1 ,1, 1, NULL)
END

GO



--16156_INSERT_INTO_Parametros..Constantes.sql

/*--  v17.3 - 16156 - MMM - Constante a los estados del tratamiento farmacológico en el DAU --*/

DECLARE
	@CodCentro CHAR(5) = XXXXX,
	@ValorConstante BIT = 1 

IF NOT EXISTS (SELECT * FROM Parametros..Constantes WHERE NombreConstante='m_bolVerEstadoFarmacosDAU' AND CentroRef = @CodCentro)
BEGIN

	INSERT INTO Parametros..Constantes(
		NombreConstante, 
		ValorConstante, 
		DescripcionConstante, 
		Eliminado, 
		CentroRef, 
		FechaCreacion, 
		VersionCreacion
	) VALUES ( 
		'm_bolVerEstadoFarmacosDAU', 
		@ValorConstante, 
		'Indica si se visualizará el estado de los fármacos desde el informe e impresión DAU', 
		0, 
		@CodCentro, 
		GETDATE(), 
		'17.3'
	)	
	
END	
GO



--18454_INSERT_INTO_Parametros..Codigos.sql

/*-- (17/08/2017) v17.3 - 18454 - MPR - Modificaciones a Interconsultas Internas --*/

USE [Parametros]
GO

IF NOT EXISTS (SELECT * FROM Parametros..Codigos WHERE Tabla = 'EstMotivoConsulta'
				AND Descripcion = 'Evaluación por Profesional')
BEGIN
	INSERT INTO Parametros..Codigos ([Tabla],[Codigo],[Descripcion],[Posicion],[ClaveIncentivo],[LibreEleccion],[Borrado])
	VALUES ( 'EstMotivoConsulta', 2, 'Evaluación por Profesional', 2, NULL, NULL, 0)
END

IF NOT EXISTS (SELECT * FROM Parametros..Codigos WHERE Tabla = 'EstPorqueConsulta'
				AND Descripcion = 'Completar tratamiento')
BEGIN
	INSERT INTO Parametros..Codigos ([Tabla],[Codigo],[Descripcion],[Posicion],[ClaveIncentivo],[LibreEleccion],[Borrado])
	VALUES ( 'EstPorqueConsulta', 2, 'Completar tratamiento', 2, NULL, NULL, 0)
END

IF NOT EXISTS (SELECT * FROM Parametros..Codigos WHERE Tabla = 'EstPorqueConsulta'
				AND Descripcion = 'Otros')
BEGIN
	INSERT INTO Parametros..Codigos ([Tabla],[Codigo],[Descripcion],[Posicion],[ClaveIncentivo],[LibreEleccion],[Borrado])
	VALUES ( 'EstPorqueConsulta', 3, 'Otros', 3, NULL, NULL, 0)
END

GO



--18461_INSERT_INTO_Parametros..Permisos.sql

/*--(14/07/2017) - v17.3 - 18461 - MPR - Creacion de camas por el Aplicativo validado --*/

USE [Parametros]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DECLARE @spvar_ProyAplicacion as varchar(21) = 'Mantenimiento'
DECLARE @spvar_NIFUsuario as char(8) = XXXXXXXX
DECLARE @spvar_FormAplicacion as varchar(30) = 'FNuevaCama'
DECLARE @spvar_MascaraPermisos as varchar(30) = '-2'
DECLARE @spvar_Timestamp as datetime = getdate()
DECLARE @spvar_DatosUsuario as varchar(30) = NULL

IF NOT EXISTS (SELECT * FROM Parametros..Permisos where ProyAplicacion = @spvar_ProyAplicacion and NIFUsuario = @spvar_NIFUsuario and FormAplicacion = @spvar_FormAplicacion)
BEGIN

INSERT INTO Parametros..Permisos 
(
 ProyAplicacion,
 NIFUsuario,
 FormAplicacion,
 MascaraPermisos,
 Timestamp,
 DatosUsuario
)
 VALUES
( 
 @spvar_ProyAplicacion,
 @spvar_NIFUsuario,
 @spvar_FormAplicacion,
 @spvar_MascaraPermisos,
 @spvar_Timestamp,
 @spvar_DatosUsuario
) 
END
GO



--18485_INSERT_INTO_Parametros_ParametrizadorCampos.sql

/*--(21/06/2017) - v17.3 - 18485 - MPR - Seguridad en adjuntar documentos --*/

USE [Parametros]
GO

IF NOT EXISTS (SELECT * FROM Parametros..ParametrizadorCampos WHERE Tabla = 'CentrosSalud'
				AND Campo = 'Usuario')
BEGIN
	INSERT INTO Parametros..ParametrizadorCampos ([Tabla],[Campo],[Descripcion],[TipoDato],
	[DatoExtra],[Filtro],[Nulo],[Orden],[Primaria])
	VALUES ( 'CentrosSalud', 'Usuario', 'Usuario', 'S', 50, 1, 1, 64, 0)
END

IF NOT EXISTS (SELECT * FROM Parametros..ParametrizadorCampos WHERE Tabla = 'CentrosSalud'
				AND Campo = 'Password')
BEGIN
	INSERT INTO Parametros..ParametrizadorCampos ([Tabla],[Campo],[Descripcion],[TipoDato],
	[DatoExtra],[Filtro],[Nulo],[Orden],[Primaria])
	VALUES ( 'CentrosSalud', 'Password', 'Password', 'S', 50, 1, 1, 65, 0)
END

IF NOT EXISTS (SELECT * FROM Parametros..ParametrizadorCampos WHERE Tabla = 'CentrosSalud'
				AND Campo = 'Dominio')
BEGIN
	INSERT INTO Parametros..ParametrizadorCampos ([Tabla],[Campo],[Descripcion],[TipoDato],
	[DatoExtra],[Filtro],[Nulo],[Orden],[Primaria])
	VALUES ( 'CentrosSalud', 'Dominio', 'Dominio', 'S', 100, 1, 1, 66, 0)
END

IF NOT EXISTS (SELECT * FROM Parametros..ParametrizadorCampos WHERE Tabla = 'CentrosSalud'
				AND Campo = 'RequiereCredenciales')
BEGIN
	INSERT INTO Parametros..ParametrizadorCampos ([Tabla],[Campo],[Descripcion],[TipoDato],
	[DatoExtra],[Filtro],[Nulo],[Orden],[Primaria])
	VALUES ( 'CentrosSalud', 'RequiereCredenciales', 'RequiereCredenciales', 'B', NULL, 1, 0, 67, 0)
END
GO



--19248_INSERT_INTO_Parametros..SolicitudTrasladoAcompanyante.sql

/*-- (25/08/2017) v17.3 - 19248 - MPR - Modificaciones en Solicitud de Traslado Externa desde 
										Admision e Historia Clinica --*/

USE [Parametros]
GO

DECLARE @maxValue as INT = 0
DECLARE @spvar_CodCentro as varchar(5) = XXXXX

-- Obtenemos la ultima clave primaria 
SELECT @maxValue= max(IdAcompanyante) FROM Parametros..SolicitudTrasladoAcompanyante

-- Si no hay registros entronces empezamos en el 1 sino en el ultimo + 1
IF (@maxValue IS NULL)
BEGIN
	SET @maxValue =  1
END
ELSE 
BEGIN
	SET @maxValue = @maxValue+1
END

IF NOT EXISTS (SELECT * FROM Parametros..SolicitudTrasladoAcompanyante WHERE CodAcompanyante = 1
				AND CodCentro = @spvar_CodCentro)
BEGIN
	INSERT INTO Parametros..SolicitudTrasladoAcompanyante ([IdAcompanyante],[CodAcompanyante],[DescAcompanyante],[Orden],[Eliminado], [CodCentro])
	VALUES ( @maxValue, 1, 'Familiar',0, 0, @spvar_CodCentro)
END
SET @maxValue = @maxValue+1


IF NOT EXISTS (SELECT * FROM Parametros..SolicitudTrasladoAcompanyante WHERE CodAcompanyante = 2
				AND CodCentro = @spvar_CodCentro)
BEGIN
	INSERT INTO Parametros..SolicitudTrasladoAcompanyante ([IdAcompanyante],[CodAcompanyante],[DescAcompanyante],[Orden],[Eliminado], [CodCentro])
	VALUES ( @maxValue, 2, 'Cuidador', 1, 0, @spvar_CodCentro)
END
SET @maxValue = @maxValue+1


IF NOT EXISTS (SELECT * FROM Parametros..SolicitudTrasladoAcompanyante WHERE CodAcompanyante = 3
				AND CodCentro = @spvar_CodCentro)
BEGIN
	INSERT INTO Parametros..SolicitudTrasladoAcompanyante ([IdAcompanyante],[CodAcompanyante],[DescAcompanyante],[Orden],[Eliminado], [CodCentro])
	VALUES ( @maxValue, 3, 'Técnico Paramédico (Tens)', 2, 0, @spvar_CodCentro)
END
SET @maxValue = @maxValue+1


IF NOT EXISTS (SELECT * FROM Parametros..SolicitudTrasladoAcompanyante WHERE CodAcompanyante = 4
				AND CodCentro = @spvar_CodCentro)
BEGIN
	INSERT INTO Parametros..SolicitudTrasladoAcompanyante ([IdAcompanyante],[CodAcompanyante],[DescAcompanyante],[Orden],[Eliminado], [CodCentro])
	VALUES ( @maxValue, 4, 'Enfermera', 3, 0, @spvar_CodCentro)
END
SET @maxValue = @maxValue+1


IF NOT EXISTS (SELECT * FROM Parametros..SolicitudTrasladoAcompanyante WHERE CodAcompanyante = 5
				AND CodCentro = @spvar_CodCentro)
BEGIN
	INSERT INTO Parametros..SolicitudTrasladoAcompanyante ([IdAcompanyante],[CodAcompanyante],[DescAcompanyante],[Orden],[Eliminado], [CodCentro])
	VALUES ( @maxValue, 5, 'Médico', 4, 0, @spvar_CodCentro)
END
SET @maxValue = @maxValue+1


IF NOT EXISTS (SELECT * FROM Parametros..SolicitudTrasladoAcompanyante WHERE CodAcompanyante = 6
				AND CodCentro = @spvar_CodCentro)
BEGIN
	INSERT INTO Parametros..SolicitudTrasladoAcompanyante ([IdAcompanyante],[CodAcompanyante],[DescAcompanyante],[Orden],[Eliminado], [CodCentro])
	VALUES ( @maxValue, 6, 'Matrona', 5, 0, @spvar_CodCentro)
END
SET @maxValue = @maxValue+1


IF NOT EXISTS (SELECT * FROM Parametros..SolicitudTrasladoAcompanyante WHERE CodAcompanyante = 7
				AND CodCentro = @spvar_CodCentro)
BEGIN
	INSERT INTO Parametros..SolicitudTrasladoAcompanyante ([IdAcompanyante],[CodAcompanyante],[DescAcompanyante],[Orden],[Eliminado], [CodCentro])
	VALUES ( @maxValue, 7, 'No informado', 6, 0, @spvar_CodCentro)
END
SET @maxValue = @maxValue+1


IF NOT EXISTS (SELECT * FROM Parametros..SolicitudTrasladoAcompanyante WHERE CodAcompanyante = 8
				AND CodCentro = @spvar_CodCentro)
BEGIN
	INSERT INTO Parametros..SolicitudTrasladoAcompanyante ([IdAcompanyante],[CodAcompanyante],[DescAcompanyante],[Orden],[Eliminado], [CodCentro])
	VALUES ( @maxValue, 8, 'Otro', 7, 0, @spvar_CodCentro)
END
SET @maxValue = @maxValue+1
GO



--19248_INSERT_INTO_Parametros_ParametrizadorCampos.sql

/*-- (25/08/2017) v17.3 - 19248 - MPR - Modificaciones en Solicitud de Traslado Externa desde 
										Admision e Historia Clinica --*/

USE [Parametros]
GO

IF NOT EXISTS (SELECT * FROM Parametros..ParametrizadorCampos WHERE Tabla = 'SolicitudTrasladoAcompanyante'
				AND Campo = 'IdAcompanyante')
BEGIN
	INSERT INTO Parametros..ParametrizadorCampos ([Tabla],[Campo],[Descripcion],[TipoDato],
	[DatoExtra],[Filtro],[Nulo],[Orden],[Primaria])
	VALUES ( 'SolicitudTrasladoAcompanyante', 'IdAcompanyante', 'IdAcompanyante', 'I', NULL, 1, 0, 0, 1)
END

IF NOT EXISTS (SELECT * FROM Parametros..ParametrizadorCampos WHERE Tabla = 'SolicitudTrasladoAcompanyante'
				AND Campo = 'CodAcompanyante')
BEGIN
	INSERT INTO Parametros..ParametrizadorCampos ([Tabla],[Campo],[Descripcion],[TipoDato],
	[DatoExtra],[Filtro],[Nulo],[Orden],[Primaria])
	VALUES ( 'SolicitudTrasladoAcompanyante', 'CodAcompanyante', 'CodAcompanyante', 'I', NULL, 1, 0, 1, 0)
END

IF NOT EXISTS (SELECT * FROM Parametros..ParametrizadorCampos WHERE Tabla = 'SolicitudTrasladoAcompanyante'
				AND Campo = 'DescAcompanyante')
BEGIN
	INSERT INTO Parametros..ParametrizadorCampos ([Tabla],[Campo],[Descripcion],[TipoDato],
	[DatoExtra],[Filtro],[Nulo],[Orden],[Primaria])
	VALUES ( 'SolicitudTrasladoAcompanyante', 'DescAcompanyante', 'DescAcompanyante', 'S', 100, 1, 0, 2, 0)
END

IF NOT EXISTS (SELECT * FROM Parametros..ParametrizadorCampos WHERE Tabla = 'SolicitudTrasladoAcompanyante'
				AND Campo = 'Orden')
BEGIN
	INSERT INTO Parametros..ParametrizadorCampos ([Tabla],[Campo],[Descripcion],[TipoDato],
	[DatoExtra],[Filtro],[Nulo],[Orden],[Primaria])
	VALUES ( 'SolicitudTrasladoAcompanyante', 'Orden', 'Orden', 'I', NULL, 1, 0, 3, 0)
END

IF NOT EXISTS (SELECT * FROM Parametros..ParametrizadorCampos WHERE Tabla = 'SolicitudTrasladoAcompanyante'
				AND Campo = 'Eliminado')
BEGIN
	INSERT INTO Parametros..ParametrizadorCampos ([Tabla],[Campo],[Descripcion],[TipoDato],
	[DatoExtra],[Filtro],[Nulo],[Orden],[Primaria])
	VALUES ( 'SolicitudTrasladoAcompanyante', 'Eliminado', 'Eliminado', 'B', NULL, 1, 0, 4, 0)
END

IF NOT EXISTS (SELECT * FROM Parametros..ParametrizadorCampos WHERE Tabla = 'SolicitudTrasladoAcompanyante'
				AND Campo = 'CodCentro')
BEGIN
	INSERT INTO Parametros..ParametrizadorCampos ([Tabla],[Campo],[Descripcion],[TipoDato],
	[DatoExtra],[Filtro],[Nulo],[Orden],[Primaria])
	VALUES ( 'SolicitudTrasladoAcompanyante', 'CodCentro', 'CodCentro', 'S', 5, 1, 0, 5, 0)
END
GO



--19248_INSERT_INTO_Parametros_ParametrizadorTablas.sql

/*-- (25/08/2017) v17.3 - 19248 - MPR - Modificaciones en Solicitud de Traslado Externa desde 
										Admision e Historia Clinica --*/

USE [Parametros]
GO

IF NOT EXISTS (SELECT * FROM Parametros..ParametrizadorTablas WHERE Tabla = 'SolicitudTrasladoAcompanyante')
BEGIN
	INSERT INTO Parametros..ParametrizadorTablas ([Tabla],[Descripcion],[SPNombre],
	[SPParametros],[Nuevo],[Editar],[Eliminar],[EdicionMasiva],[Importar],[Exportar],
	 [EliminacionMasiva],[Ayuda])
	VALUES ( 'SolicitudTrasladoAcompanyante', 'SolicitudTrasladoAcompanyante', NULL, NULL, 1, 1, 1, 1, 1 ,1, 1, NULL)
END

GO



--19362_INSERT_INTO_Parametros..EstSolTrans.sql

/*-- (22/08/2017) v17.3 - 19362 - MPR - Gestor de Solicitudes de Traslado --*/

USE [Parametros]
GO

IF NOT EXISTS (SELECT * FROM Parametros..EstSolTrans WHERE DesEstSolTran = 'Enviado')
BEGIN
	INSERT INTO Parametros..EstSolTrans ([DesEstSolTran],[Eliminado])
	VALUES ( 'Enviado', 0)
END

IF NOT EXISTS (SELECT * FROM Parametros..EstSolTrans WHERE DesEstSolTran = 'Rechazado')
BEGIN
	INSERT INTO Parametros..EstSolTrans ([DesEstSolTran],[Eliminado])
	VALUES ( 'Rechazado', 0)
END

IF NOT EXISTS (SELECT * FROM Parametros..EstSolTrans WHERE DesEstSolTran = 'Retorno')
BEGIN
	INSERT INTO Parametros..EstSolTrans ([DesEstSolTran],[Eliminado])
	VALUES ( 'Retorno', 0)
END

IF EXISTS (SELECT * FROM Parametros..EstSolTrans WHERE DesEstSolTran = 'Anulado')
BEGIN
	UPDATE Parametros..EstSolTrans 
	SET DesEstSolTran = 'Anulado/Cancelado'
	WHERE DesEstSolTran='Anulado'
END
GO



--19362_INSERT_INTO_Parametros..PermisosTipos.sql

/*-- (22/08/2017) v17.3 - 19362 - MPR - Gestor de Solicitudes de Traslado --*/

USE [Parametros]
GO

IF NOT EXISTS (SELECT * FROM Parametros..PermisosTipos WHERE Codigo = 55)
BEGIN
	INSERT INTO Parametros..PermisosTipos ([Codigo],[Descripcion],[Eliminado])
	VALUES (55, 'Cancelar Solicitud Traslado', NULL)
END

GO



--19362_INSERT_INTO_PermisosFormulario_FListSolTraslado.sql

/*-- (22/08/2017) v17.3 - 19362 - MPR - Gestor de Solicitudes de Traslado --*/
/*
-------------------- SCRIPT PERMISOS TIPO PERMISOSPANTALLAS ----------------------
*/

/* DATO QUE INSERTA EL CLIENTE */
DECLARE @CodCentro AS CHAR(6) = XXXXXX

/*DATO A INSERTAR*/
DECLARE	@FormAplicacion AS VARCHAR(30) = 'FListSolTraslado',
		@FormAplicacionFromVinculo AS VARCHAR(30) = NULL, -- Solo rellenar si el NOMBRE DEL FORMULARIO CON EL QUE VINCULAMOS EL PERMISO es distinto
		@ProyAplicacion AS VARCHAR(21) = 'Admision',
		@NombreForm AS VARCHAR(100) = 'Lista de Trabajo de Solicitudes de Traslado', -- Nombre descriptivo del formulario Titulo que aparece en Florence.
		@MascaraPermisos AS VARCHAR(30) = '-255',
		@NombreModulo AS VARCHAR(100) = 'Admision',
		@NombreMenuP AS VARCHAR(100) = 'mnuListasTrab', 
		@NombreMenuS AS VARCHAR(100) = 'mnuListaTrabajoSolicitudesTraslado',
		@DescripcionModulo AS VARCHAR(100), --Solo es necesario si no existe el modulo
		@DescripcionMenuP AS VARCHAR(100), --Solo es necesario si no existe el menu principal
		@DescripcionMenuS AS VARCHAR(100) = 'Solicitudes de Traslado', --Solo es necesario si no existe el menu secundario
		@idModulo AS INT,
		@idMenuPrincipal AS INT,
		@idMenuSecundario AS INT,
		@idPermisoPantalla AS INT,
		@IdFormulario AS INT
		
--MODULO
SELECT @idModulo = idModulo FROM Parametros..ModuloFlorence WHERE NombreModulo = @NombreModulo AND CodCentro = @CodCentro

IF @idModulo IS NULL --Si el modulo no existe lo creamos
BEGIN
	SELECT @idModulo = MAX(idModulo)+1 FROM Parametros..ModuloFlorence
	INSERT INTO Parametros..ModuloFlorence
		SELECT @idModulo, @NombreModulo, @DescripcionModulo, 0, @CodCentro 
END		

--MENU PRINCIPAL
SELECT @idMenuPrincipal = IdMenuPrincipal FROM Parametros..MenuPrincipalFlorence WHERE NombreMenuPrincipal = @NombreMenuP AND CodCentro = @CodCentro AND IdModulo = @idModulo

IF @idMenuPrincipal IS NULL --Si el menu principal no existe lo creamos
BEGIN
	SELECT @idMenuPrincipal = MAX(IdMenuPrincipal)+1 FROM Parametros..MenuPrincipalFlorence
	INSERT INTO Parametros..MenuPrincipalFlorence
			SELECT @idMenuPrincipal, @NombreMenuP, @DescripcionMenuP, @idModulo, 0, @CodCentro 
END

--MENU SECUNDARIO
SELECT @idMenuSecundario = IdMenuSecundario FROM Parametros..MenuSecundarioFlorence WHERE NombreMenuSecundario = @NombreMenuS AND CodCentro = @CodCentro AND IdModulo = @idModulo AND IdMenuPrincipal = @idMenuPrincipal 

IF @idMenuSecundario IS NULL --Si el menu secundario no existe lo creamos
BEGIN
	SELECT @idMenuSecundario = MAX(idMenuSecundario)+1 FROM Parametros..MenuSecundarioFlorence
	INSERT INTO Parametros..MenuSecundarioFlorence
			SELECT @idMenuSecundario, @NombreMenuS, @DescripcionMenuS, @idMenuPrincipal, @idModulo, 0, @CodCentro 
END

--PERMISO
IF @FormAplicacionFromVinculo IS NOT NULL --Si es distinto del permiso a crear obtenemos su ID.
	SELECT @IdFormulario = IdPermisoPantalla FROM Parametros..PermisosPantallas where ProyAplicacion = @ProyAplicacion AND FormAplicacion = @FormAplicacionFromVinculo

SELECT @idPermisoPantalla = IdPermisoPantalla FROM Parametros..PermisosPantallas where ProyAplicacion = @ProyAplicacion AND FormAplicacion = @FormAplicacion

IF @idPermisoPantalla IS NULL --Si el permiso no existe lo creamos
BEGIN
	SELECT @idPermisoPantalla = MAX(IdPermisoPantalla)+1 FROM Parametros..PermisosPantallas	
	IF @IdFormulario IS NULL --Si el formulario al que asignamos el permisos es el mismo
		SET @IdFormulario = @idPermisoPantalla 
		INSERT INTO Parametros..PermisosPantallas 
		SELECT @idPermisoPantalla, @ProyAplicacion, @FormAplicacion, @MascaraPermisos, @NombreForm, 0, 0, GETDATE(), @IdFormulario, null, null, null 
END

--CAMINO DEL PERMISO
IF NOT EXISTS(SELECT * FROM Parametros..PantallasEnMenuSecundarioFlorence 
			   WHERE IdFormulario = @idPermisoPantalla 
					 AND IdModulo = @idModulo 
					 AND IdMenuPrincipal = @idMenuPrincipal  
					 AND IdMenuSecundario = @idMenuSecundario)
BEGIN
	INSERT INTO Parametros..PantallasEnMenuSecundarioFlorence
		SELECT @idPermisoPantalla, @idModulo, @idMenuPrincipal, @idMenuSecundario			
END
GO

--CONSOLIDACION
--(27/10/2017) - V17.3r1 - 20769 - APB - Constante códigos prestación creación camas

DECLARE @CodCentro AS CHAR(5) = XXXXX
DECLARE @ValorConstante AS BIT = 1

IF NOT EXISTS (SELECT * FROM Parametros..Constantes WHERE NombreConstante = 'm_bolIntegracionCreacionCamas' AND CentroRef = @CodCentro)
BEGIN
	INSERT INTO Parametros..Constantes(NombreConstante, ValorConstante, DescripcionConstante, Eliminado, CentroRef, FechaCreacion, VersionCreacion)
	VALUES ('m_bolIntegracionCreacionCamas', @ValorConstante, 'Indica si los campos de integración con SAP Cód. Facturación Pernocta, Cód. Facturación No Pernocta y Cod. Prestación son requeridos o no', 0, @CodCentro, GETDATE(), '17.3')
END

GO







