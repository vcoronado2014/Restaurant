USE [RAYEN]
GO
/****** Object:  StoredProcedure [dbo].[AGW0009]    Script Date: 20/05/2018 14:02:35 ******/
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
as
begin

declare @HORA_ACTUAL VARCHAR(8)
SET @HORA_ACTUAL = CONVERT(VARCHAR, GETDATE(), 108)
--

declare @FECHA_TERMINO DATETIME, @FECHA_INICIO DATETIME

SET @FECHA_INICIO = CONVERT(VARCHAR, GETDATE(), 111)
SET @FECHA_INICIO = @FECHA_INICIO + ' ' + @HORA_ACTUAL
SET @FECHA_TERMINO = DATEADD(DAY, 30, @FECHA_INICIO)

declare @SEC_ID INT
SET @SEC_ID = (
	SELECT TOP 1 USN.SEC_ID 
	FROM USN_USUARIO_NODO USN 
	INNER JOIN dbo.OBTENER_ID_Coma(@NOD_IDS) ids ON ids.ID = USN.NOD_ID
	WHERE USN.ELIMINADO = 0 AND USN.ACTIVO = 1 AND USN.USP_ID = @USP_ID
)

select
  CPO.ID AS ID_CUPO,
  CAST(CONVERT(VARCHAR, CPO.FECHA_HORA_INICIO, 112) AS VARCHAR(10)) as FECHA,
  CAST(CONVERT(VARCHAR, CPO.FECHA_HORA_INICIO, 8) AS VARCHAR(10)) as HORA,
  SGH.NOD_ID as ID_NODO,
  SGH.FNP_ID  as ID_MEDICO,
  FNP.NOMBRES as NOMBRES_MEDICO,
  FNP.APELLIDO_PATERNO AS APELLIDO_PATERNO_MEDICO,
  FNP.APELLIDO_MATERNO  AS APELLIDO_MATERNO_MEDICO,
  ins.ID as ID_ESPECIALIDAD,
  INS.NOMBRE AS ESPECIALIDAD,
  --esp.ID AS ID_ESPECIALIDAD,
  --esp.NOMBRE  AS ESPECIALIDAD,
  taw.ID AS ID_TIPO_ATENCION,
  taw.NOMBRE AS TIPO_ATENCION
  
from 
  RAYEN..SGH_SEGMENTOS_HORARIOS 
  SGH inner join rayen..CPO_CUPO CPO on SGH.ID=CPO.SGH_ID
  inner join FNP_FUNCIONARIO_PRESTADOR FNP on  SGH.FNP_ID = FNP.ID
  inner join dbo.OBTENER_ID_Coma(@NOD_IDS) ids on ids.ID = SGH.NOD_ID
  inner join dbo.ESP_ESPECIALIDAD esp on esp.ID = SGH.ESP_ID
  inner join dbo.TAW_TIPO_ATENCION_WEB taw on taw.ID = SGH.TAW_ID
  inner join INS_INSTRUMENTO ins on ins.ID = SGH.INS_ID
where 
  CPO.FECHA_HORA_INICIO >= @FECHA_INICIO
  and CPO.ESTADO_CUPO =0
  --and CPO.FECHA_HORA_INICIO <=@FECHA_TERMINO
  and SGH.BLOQUEADO=0 
  and SGH.es_disponible_web=1 
  AND CPO.ELIMINADO = 0
  AND SGH.ELIMINADO = 0
  AND SGH.SEC_ID = @SEC_ID

end

