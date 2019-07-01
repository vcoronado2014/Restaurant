USE [RAYEN]
GO
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AGW0009]') AND type = N'P') 
	--Se crea encabezado vacio del SP en caso de ser nuevo
	exec('CREATE PROCEDURE [dbo].[AGW0009] AS BEGIN SET NOCOUNT ON; END')
GO
/****** Object:  StoredProcedure [dbo].[AGW0009]    Script Date: 15-06-2018 16:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************
NOMBRE DEL PROCEDIMIENTO: AGW0009
AUTOR: Gonzalo Carrasco
FECHA DE CREACIÓN: 08/04/2016
BASE DE DATOS: AGENDAWEB
OBJETIVO: Obtiene disponibilidad de cupos de un nodo
FECHA DE MODIFICACIÓN: 04/05/2016
USUARIO DE MODIFICACIÓN: Francisco Poblete
MOTIVO DE MODIFICACIÓN: Hora inicio depende del servidor
FECHA DE MODIFICACIÓN: 20/03/2017
USUARIO DE MODIFICACIÓN: VICTOR CORONADO
MOTIVO DE MODIFICACIÓN: JOIN CON INSTRUMENTO PARA OBTENER EL INSTRUMENTO Y NO LA ESPECIALIDAD
----------------------------------------------------------------------------------------------
FECHA DE MODIFICACIÓN: 20/05/2018
USUARIO DE MODIFICACIÓN: VICTOR CORONADO
MOTIVO DE MODIFICACIÓN: SE MAPEA CON TABLA RL_TAW_ST PARA OBTENER SECTORES TRANSVERSALES
-----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
FECHA DE MODIFICACIÓN: 15/06/2018
USUARIO DE MODIFICACIÓN: VICTOR CORONADO
MOTIVO DE MODIFICACIÓN: SE MAPEA CON TABLAS DE RESTRICCION
-----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
FECHA DE MODIFICACIÓN: 22/06/2018
USUARIO DE MODIFICACIÓN: VICTOR CORONADO
MOTIVO DE MODIFICACIÓN: SE REPARA RETORNO DEL SP.
-----------------------------------------------------------------------------------------------
VISADO POR (QA): 
FECHA APROBACIÓN QA: 
COMENTARIOS QA: 
VISADO POR (DBA): 
FECHA APROBACIÓN DBA: 
COMENTARIOS DBA: 
TABLAS INVOLUCRADAS: SGH_SEGMENTOS_HORARIOS, CPO_CUPO, FNP_FUNCIONARIO_PRESTADOR, ESP_ESPECIALIDAD, TDA_TIPO_DE_ATENCION
***********************************************************************/

ALTER procedure [dbo].[AGW0009]
(
  @NOD_IDS varchar(max),
  @FECHA_ENTERA_CONSULTA INT,
  @USP_ID INT
)
AS 
BEGIN

declare @FECHA_TERMINO DATETIME, @FECHA_INICIO DATETIME 
SET @FECHA_INICIO = GETDATE()
SET @FECHA_TERMINO = DATEADD(DAY, 30, @FECHA_INICIO)


create table #resultados
(
	ID_CUPO int,
	FECHA VARCHAR(10),
	HORA VARCHAR(10),
	ID_NODO int,
	ID_MEDICO  int,
	INS_ID int,
	TAW_ID int
)

declare @sexo int, @fecha_nac datetime, @edad_usuario int, @edad int, @SEC_ID INT
select 
	@fecha_nac = FECHA_DE_NACIMIENTO, 
	@sexo = HL7_0001_U_id, 
	@edad_usuario = dbo.ObtenerEdadUsuario(FECHA_DE_NACIMIENTO, GETDATE()),
	@edad =  @edad_usuario /1000000
from USP_USUARIO_APS where ID = @USP_ID

print @edad

/*¿Seguros que es el primer sector del usuario?*/
SELECT TOP 1 @SEC_ID = USN.SEC_ID 
FROM USN_USUARIO_NODO USN 
INNER JOIN dbo.OBTENER_ID_Coma(@NOD_IDS) ids ON ids.ID = USN.NOD_ID
WHERE USN.ELIMINADO = 0 AND USN.ACTIVO = 1 and USN.ES_INSCRITO = 1 AND USN.USP_ID = @USP_ID

insert into #resultados (ID_CUPO, FECHA, HORA, ID_NODO, ID_MEDICO, INS_ID, TAW_ID)
select
       CPO.ID AS ID_CUPO,
       CAST(CONVERT(VARCHAR, CPO.FECHA_HORA_INICIO, 112) AS VARCHAR(10)) as FECHA,
       CAST(CONVERT(VARCHAR, CPO.FECHA_HORA_INICIO, 8) AS VARCHAR(10)) as HORA,
       SGH.NOD_ID as ID_NODO,
       SGH.FNP_ID  as ID_MEDICO,
       SGH.INS_ID,
       SGH.TAW_ID
	   --SGH.SEC_ID
	   --,SGH.TDA_ID
	   --,RL.*
	   --,RET.*
from 
       SGH_SEGMENTOS_HORARIOS SGH 
       inner join dbo.OBTENER_ID_Coma(@NOD_IDS) ids on ids.ID = SGH.NOD_ID and SGH.ELIMINADO = 0 and SGH.FECHA_ENTERA >= convert(varchar, @FECHA_INICIO, 112)
       inner join CPO_CUPO CPO on SGH.ID = CPO.SGH_ID and CPO.ELIMINADO = 0
       left outer join RL_RET_TDA RL on RL.TDA_ID = SGH.TDA_ID
       left outer join RET_RESTRICCION_EDAD_TDA RET on rl.RET_ID = RET.ID
where 
       /*Condiciones generales*/
       CPO.FECHA_HORA_INICIO >= @FECHA_INICIO
       and CPO.ESTADO_CUPO = 0
       and SGH.ES_DISPONIBLE_WEB = 1 
       AND SGH.ELIMINADO = 0
       AND SGH.TAW_ID is not null
       AND ((not exists(SELECT 1 FROM RL_TAW_ST RL WHERE RL.TAW_ID = SGH.TAW_ID AND RL.ELIMINADO = 0) AND SGH.SEC_ID = @SEC_ID) 
             or (exists(SELECT 1 FROM RL_TAW_ST RL WHERE RL.TAW_ID = SGH.TAW_ID AND RL.ELIMINADO = 0)))
       /*Condiciones por Restriccion de TDA*/
       AND ((RET.SEXO_ID IS NULL) OR (RET.SEXO_ID = @SEXO) OR (RET.SEXO_ID = 9))
       AND (RET.EDAD_SUPERIOR IS NULL OR RET.EDAD_SUPERIOR >= @edad) AND (RET.EDAD_INFERIOR IS NULL OR RET.EDAD_INFERIOR <= @edad)

select 
       r.ID_CUPO, 
       r.FECHA, 
       r.HORA, 
       r.ID_NODO, 
       r.ID_MEDICO, 
       FNP.NOMBRES as NOMBRES_MEDICO,
       FNP.APELLIDO_PATERNO AS APELLIDO_PATERNO_MEDICO,
       FNP.APELLIDO_MATERNO  AS APELLIDO_MATERNO_MEDICO,
       INS.ID as ID_ESPECIALIDAD,
       INS.NOMBRE AS ESPECIALIDAD,
       --r.TAW_ID,
       --TAW.NOMBRE
	    taw.ID AS ID_TIPO_ATENCION,
		taw.NOMBRE AS TIPO_ATENCION
from #resultados r
inner join FNP_FUNCIONARIO_PRESTADOR FNP on  r.ID_MEDICO = FNP.ID
inner join INS_INSTRUMENTO ins on INS.ID = r.INS_ID
inner join dbo.TAW_TIPO_ATENCION_WEB TAW on taw.ID = r.TAW_ID


drop table #resultados




END