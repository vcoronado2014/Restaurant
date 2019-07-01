use RAYEN
go
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[URG0148]') AND type = N'P') 
	--Se crea encabezado vacio del SP en caso de ser nuevo
	exec('CREATE PROCEDURE [dbo].[URG0148] AS BEGIN SET NOCOUNT ON; END')
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/************************************************************************
NOMBRE DEL PROCEDIMIENTO: URG0148
AUTOR: V�ctor Coronado
FECHA DE CREACI�N: 27/06/2019
BASE DE DATOS: RAYEN
OBJETIVO: Obtiene tipos de atencion que se usaran en urgencia web.
FECHA DE MODIFICACI�N: 
USUARIO DE MODIFICACI�N:  
MOTIVO DE MODIFICACI�N: 
VISADO POR (QA): 
FECHA APROBACI�N QA: 
COMENTARIOS QA: 
VISADO POR (DBA): 
FECHA APROBACI�N DBA: 
COMENTARIOS DBA: 
TABLAS INVOLUCRADAS: RL_ACT_URG, ATEN_ATENCION
***********************************************************************/

ALTER PROCEDURE [dbo].[URG0148]

AS

BEGIN
select
	act.ID,
	act.NOMBRE,
	rl.ACTIVO_URGENCIA,
	rl.TIPO
from 
	ACT_ACTIVIDAD act inner join RL_ACT_URG rl on act.ID = rl.ACT_ID and rl.ACTIVO_URGENCIA = 1

END
