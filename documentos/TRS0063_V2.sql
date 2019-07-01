USE [RAYEN]
GO
/****** Object:  StoredProcedure [dbo].[TRS0063]    Script Date: 09-05-2016 11:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec TRS0063 @NOD_ID=2411,@FECHA_INICIO='2014-05-01 00:00:00',@FECHA_TERMINO='2014-05-23 23:59:59',@NOD_ID_DESTINO=0,@SOIN_ANTIGUA=2,@ESP_ID=0,@ESAD_ID=0,@UINS_ID=0
/*-----------------------------------------------------------*
** NOMBRE SISTEMA: RAYEN 
**
** NOMBRE DEL OBJETO:  [dbo].[TRS0063]
**
** VER: 1.0.0.1
**
** DESCRIPCION:  INFORME SIC
**
** AUTOR: Felipe Nieto
**
** FECHA DE CREACION: Junio 2010
** Modificacion: 25-06-2010, Se agregar el campo NODO_DESTINO al resultado de la consulta
** Modificaci�n 11-02-2014, Juan C. Villalobos se utiliza variable SOIN_OTRO_NODO
**
**
** FECHA MODIFICACI�N	: 20-09-2016
** DESARROLLADOR		: V�CTOR CORONADO.
** MOTIVO				: SE CAMBIA FNP_ID2 POR FNP_ID EN BASE AL REQUERIMIENTO 109098
**
**-----------------------------------------------------------*/

ALTER PROCEDURE [dbo].[TRS0063]
(
@NOD_ID int,
@FECHA_INICIO datetime,
@FECHA_TERMINO datetime,
@ESP_ID int,
@UINS_ID int,
@NOD_ID_DESTINO int,
@SOIN_ANTIGUA smallint,
@ESAD_ID int,
@SOIN_OTRO_NODO int = null,
@DIAG_PRINCIPAL smallint = NULL
)
AS
BEGIN


DECLARE
@FECHA_INICIO_ENTERA INT, 
@FECHA_TERMINO_ENTERA INT


set @FECHA_INICIO_ENTERA = CONVERT(varchar, @FECHA_INICIO,112)
set @FECHA_TERMINO_ENTERA = CONVERT(varchar, @FECHA_TERMINO,112)

if (@SOIN_OTRO_NODO = 1)
begin
	if (@SOIN_ANTIGUA = 0)
begin
SELECT
      B.RUT,
      B.NOMBRE_FORMATEADO,
      B.NOMBRE AS NOMBRE_USP,
      B.APELLIDO_PATERNO,
      B.APELLIDO_MATERNO,
      B.DESCRIPCION_SEX AS DESCRIPCION,
      B.DESCRIPCION_DIAG AS DESCRIPCION,
      B.RAZON_SOCIAL,
      case when NOD02.RAZON_SOCIAL IS NULL THEN NOD03.RAZON_SOCIAL ELSE NOD02.RAZON_SOCIAL END AS NODO_DESTINO,
      B.NOMBRE_ESPECIALIDAD AS NOMBRE,
      B.FECHA_HORA,
      B.ESTADO,
      B.FECHA_HORA_ENVIO,
      B.ES_GES,
      B.FECHA_HORA_ENTERA, 
	  B.NOMBRE_FORMATEADO_FNP,
	  (SELECT ISNULL(STUFF((SELECT ', '+INST.NOMBRE FROM INS_INSTRUMENTO INST INNER JOIN RL_FNPINS RL ON (RL.INS_ID = INST.ID) WHERE RL.ID = B.FNP_ID FOR XML PATH('')), 1,2,''),'Administrativo')) AS TIPO_FNP
	  --'PRUEBA' AS TIPO_FNP
      FROM
(SELECT 
	SOIN.ID AS ID,
    SOIN.NOD2_ID AS NOD2_ID,
    case when SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO is not null then
          case when LEN(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO) = 5 then
                SUBSTRING(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO,1,2)+'-'+SUBSTRING(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO,3,len(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO))
          else
                SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO
          end         
    else
          SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO
    end AS X_CODIGO_ESTABLECIMIENTO_DESTINO, 
	USP.RUT, 
	RTRIM(USP.APELLIDO_PATERNO) + ' ' + RTRIM(USP.APELLIDO_MATERNO) + ', ' + RTRIM(USP.NOMBRES) AS NOMBRE_FORMATEADO, 
	USP.NOMBRES AS NOMBRE, 
	USP.APELLIDO_PATERNO, 
	USP.APELLIDO_MATERNO,
	SEX.DESCRIPCION AS DESCRIPCION_SEX, 
	DIAG.DESCRIPCION AS DESCRIPCION_DIAG, 
	NODO1.RAZON_SOCIAL, 
	--NOD02.RAZON_SOCIAL AS NODO_DESTINO, 
	ESP.NOMBRE AS NOMBRE_ESPECIALIDAD, 
	CONVERT(VARCHAR,SOIN.FECHA_HORA,103) + ' ' + CONVERT(VARCHAR,SOIN.FECHA_HORA,108) AS FECHA_HORA, 
CASE
WHEN SOIN.ESTADO = 0 THEN 'Ninguno' 
WHEN SOIN.ESTADO = 1 THEN 'Solicitud no existe' 
WHEN SOIN.ESTADO = 2 THEN 'Enviada' 
WHEN SOIN.ESTADO = 3 THEN 'Cita Agendada' 
WHEN SOIN.ESTADO = 4 THEN 'Con cita Confirmada'
WHEN SOIN.ESTADO = 5 THEN 'Atendido' 
WHEN SOIN.ESTADO = 6 THEN 'No Atendido' 
WHEN SOIN.ESTADO = 7 THEN 'Rechazada por el establecimiento de destino'
WHEN SOIN.ESTADO = 8 THEN 'Caducada' 
WHEN SOIN.ESTADO = 9 THEN 'Cita cancelada' 
WHEN SOIN.ESTADO = 10 THEN 'Bloqueada' 
WHEN SOIN.ESTADO = 11 THEN 'Finalizada' 
WHEN SOIN.ESTADO = 12 THEN 'No se present� a la cita' 
WHEN SOIN.ESTADO = 13 THEN 'Nueva' 
WHEN SOIN.ESTADO = 14 THEN 'Nueva Hora Solicitud' 
WHEN SOIN.ESTADO = 15 THEN 'Aceptada en Establecimiento Destino' 
WHEN SOIN.ESTADO = 16 THEN 'Cancelada en Establecimiento Destino'
WHEN SOIN.ESTADO = 17 THEN 'Llego Para La Cita' 
WHEN SOIN.ESTADO = 18 THEN 'Diagnostico Confirmado' 
WHEN SOIN.ESTADO = 19 THEN 'Alta' 
WHEN SOIN.ESTADO = 20 THEN 'Egresada' 
WHEN SOIN.ESTADO = 22 THEN 'Confirmada Por Paciente' 
WHEN SOIN.ESTADO = 23 THEN 'Cita Cancelada Por No Ubicaci�n Del Paciente' 
WHEN SOIN.ESTADO = 24 THEN 'No Pertinente Origen' 
WHEN SOIN.ESTADO = 25 THEN 'En Revision Origen' 
WHEN SOIN.ESTADO = 26 THEN 'Re Emitida' 
WHEN SOIN.ESTADO = 27 THEN 'RechazadaPorPaciente' 
WHEN SOIN.ESTADO = 28 THEN 'Solicitud Observada Destino' 
WHEN SOIN.ESTADO = 29 THEN 'Cancelada' 
WHEN SOIN.ESTADO = 30 THEN 'Rechazada por sistema' 
END ESTADO,
isnull(convert(varchar,SOIN.FECHA_HORA_ENVIO_CONTRALOR, 105), ' - ') as FECHA_HORA_ENVIO,
CASE WHEN SOIN.ES_GES = 1 THEN 'SI' ELSE 'NO' END ES_GES,
FECHA_HORA_ENTERA AS FECHA_HORA_ENTERA, 
--agregado por coronado
--el fnpid2 es el funcionario ejecutor
RTRIM(fnp.APELLIDO_PATERNO) + ' ' + RTRIM(fnp.APELLIDO_MATERNO) + ', ' + RTRIM(fnp.NOMBRES) AS NOMBRE_FORMATEADO_FNP,
FNP.ID AS FNP_ID

FROM SOIN_SOLICITUD_INTERCONSULTA SOIN 
INNER JOIN USP_USUARIO_APS USP ON (SOIN.USP_ID = USP.ID) 
INNER JOIN HL7_0001_U SEX ON (USP.HL7_0001_U_ID = SEX.ID) 
INNER JOIN ESP_ESPECIALIDAD ESP ON (ESP.ID = SOIN.ESP_ID) 
INNER JOIN NOD_NODO NODO1 ON (NODO1.ID = SOIN.NOD1_ID)/*NOD1_ID establecimiento local*/
INNER JOIN RL_SOIN_DIAG RL ON (RL.SOIN_ID = SOIN.ID) 
INNER JOIN DIAG_DIAGNOSTICO DIAG ON (RL.DIAG_ID = DIAG.ID)
--agregado por coronado
inner join FNP_FUNCIONARIO_PRESTADOR fnp on (fnp.ID = SOIN.FNP_ID) 
--LEFT  JOIN NOD_NODO NOD02 ON (NOD02.ID = SOIN.NOD2_ID)
WHERE 
FECHA_HORA_ENTERA BETWEEN @FECHA_INICIO_ENTERA AND @FECHA_TERMINO_ENTERA
AND (SOIN.NOD1_ID = @NOD_ID OR SOIN.NOD_ID_EMITE = @NOD_ID)
AND SOIN.ELIMINADO = 0
AND SOIN.ESAD_ID IS NULL
--AND (@ESTADO = 0 or case coalesce(@ESTADO,0) when 0 then -1 else SOIN.ESTADO end = @ESTADO)
AND (@ESP_ID = 0 or case coalesce(ESP.ID ,0) when 0 then -1 else ESP.ID end = @ESP_ID)
AND (@NOD_ID_DESTINO = 0 or case coalesce(SOIN.NOD2_ID,0) when 0 then -1 else SOIN.NOD2_ID end = @NOD_ID_DESTINO)
AND (@DIAG_PRINCIPAL = 0 or case coalesce(RL.ES_PRINCIPAL,0) when 0 then -1 else RL.ES_PRINCIPAL end = @DIAG_PRINCIPAL)) B
LEFT  JOIN NOD_NODO NOD02 ON (NOD02.ID = B.NOD2_ID)
LEFT  JOIN NOD_NODO NOD03 ON (NOD03.CODIGO_DEIS = B.X_CODIGO_ESTABLECIMIENTO_DESTINO)
order by FECHA_HORA_ENTERA DESC
end

else if (@SOIN_ANTIGUA = 2)
begin
SELECT
      B.RUT,
      B.NOMBRE_FORMATEADO,
      B.NOMBRE AS NOMBRE_USP,
      B.APELLIDO_PATERNO,
      B.APELLIDO_MATERNO,
      B.DESCRIPCION_SEX AS DESCRIPCION,
      B.DESCRIPCION_DIAG AS DESCRIPCION,
      B.RAZON_SOCIAL,
      case when NOD02.RAZON_SOCIAL IS NULL THEN NOD03.RAZON_SOCIAL ELSE NOD02.RAZON_SOCIAL END AS NODO_DESTINO,
      B.NOMBRE_ESPECIALIDAD AS NOMBRE,
      B.FECHA_HORA,
      B.ESTADO,
      B.FECHA_HORA_ENVIO,
      B.ES_GES,
      B.FECHA_HORA_ENTERA,
	  B.NOMBRE_FORMATEADO_FNP,
	  (SELECT ISNULL(STUFF((SELECT ', '+INST.NOMBRE FROM INS_INSTRUMENTO INST INNER JOIN RL_FNPINS RL ON (RL.INS_ID = INST.ID) WHERE RL.ID = B.FNP_ID FOR XML PATH('')), 1,2,''),'Administrativo')) AS TIPO_FNP
      FROM
(SELECT 
	SOIN.ID AS ID,
    SOIN.NOD2_ID AS NOD2_ID,
    case when SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO is not null then
          case when LEN(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO) = 5 then
                SUBSTRING(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO,1,2)+'-'+SUBSTRING(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO,3,len(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO))
          else
                SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO
          end         
    else
          SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO
    end AS X_CODIGO_ESTABLECIMIENTO_DESTINO, 
	USP.RUT, 
	RTRIM(USP.APELLIDO_PATERNO) + ' ' + RTRIM(USP.APELLIDO_MATERNO) + ', ' + RTRIM(USP.NOMBRES) AS NOMBRE_FORMATEADO, 
	USP.NOMBRES AS NOMBRE, 
	USP.APELLIDO_PATERNO, 
	USP.APELLIDO_MATERNO,
	SEX.DESCRIPCION AS DESCRIPCION_SEX, 
	DIAG.DESCRIPCION AS DESCRIPCION_DIAG, 
	NODO1.RAZON_SOCIAL, 
	--NOD02.RAZON_SOCIAL AS NODO_DESTINO, 
	case when SOIN.ESP_ID is null and SOIN.ESAD_ID IS NOT NULL THEN ESAD.NOMBRE_ESPECIALIDAD 
	WHEN SOIN.ESP_ID is NOT null and SOIN.ESAD_ID IS NOT NULL THEN ESAD.NOMBRE_ESPECIALIDAD 
	ELSE ESP.NOMBRE END NOMBRE_ESPECIALIDAD, 
CONVERT(VARCHAR,SOIN.FECHA_HORA,103) + ' ' + CONVERT(VARCHAR,SOIN.FECHA_HORA,108) AS FECHA_HORA, 
CASE
WHEN SOIN.ESTADO = 0 THEN 'Ninguno' 
WHEN SOIN.ESTADO = 1 THEN 'Solicitud no existe' 
WHEN SOIN.ESTADO = 2 THEN 'Enviada' 
WHEN SOIN.ESTADO = 3 THEN 'Cita Agendada' 
WHEN SOIN.ESTADO = 4 THEN 'Con cita Confirmada'
WHEN SOIN.ESTADO = 5 THEN 'Atendido' 
WHEN SOIN.ESTADO = 6 THEN 'No Atendido' 
WHEN SOIN.ESTADO = 7 THEN 'Rechazada por el establecimiento de destino'
WHEN SOIN.ESTADO = 8 THEN 'Caducada' 
WHEN SOIN.ESTADO = 9 THEN 'Cita cancelada' 
WHEN SOIN.ESTADO = 10 THEN 'Bloqueada' 
WHEN SOIN.ESTADO = 11 THEN 'Finalizada' 
WHEN SOIN.ESTADO = 12 THEN 'No se present� a la cita' 
WHEN SOIN.ESTADO = 13 THEN 'Nueva' 
WHEN SOIN.ESTADO = 14 THEN 'Nueva Hora Solicitud' 
WHEN SOIN.ESTADO = 15 THEN 'Aceptada en Establecimiento Destino' 
WHEN SOIN.ESTADO = 16 THEN 'Cancelada en Establecimiento Destino'
WHEN SOIN.ESTADO = 17 THEN 'Llego Para La Cita' 
WHEN SOIN.ESTADO = 18 THEN 'Diagnostico Confirmado' 
WHEN SOIN.ESTADO = 19 THEN 'Alta' 
WHEN SOIN.ESTADO = 20 THEN 'Egresada' 
WHEN SOIN.ESTADO = 22 THEN 'Confirmada Por Paciente' 
WHEN SOIN.ESTADO = 23 THEN 'Cita Cancelada Por No Ubicaci�n Del Paciente' 
WHEN SOIN.ESTADO = 24 THEN 'No Pertinente Origen' 
WHEN SOIN.ESTADO = 25 THEN 'En Revision Origen' 
WHEN SOIN.ESTADO = 26 THEN 'Re Emitida' 
WHEN SOIN.ESTADO = 27 THEN 'RechazadaPorPaciente' 
WHEN SOIN.ESTADO = 28 THEN 'Solicitud Observada Destino' 
WHEN SOIN.ESTADO = 29 THEN 'Cancelada' 
WHEN SOIN.ESTADO = 30 THEN 'Rechazada por sistema' 
END ESTADO,
isnull(convert(varchar,SOIN.FECHA_HORA_ENVIO_CONTRALOR, 105), ' - ') as FECHA_HORA_ENVIO,
CASE WHEN SOIN.ES_GES = 1 THEN 'SI' ELSE 'NO' END ES_GES,
FECHA_HORA_ENTERA AS FECHA_HORA_ENTERA,
--agregado por coronado
--el fnpid2 es el funcionario ejecutor
RTRIM(fnp.APELLIDO_PATERNO) + ' ' + RTRIM(fnp.APELLIDO_MATERNO) + ', ' + RTRIM(fnp.NOMBRES) AS NOMBRE_FORMATEADO_FNP,
FNP.ID AS FNP_ID
FROM SOIN_SOLICITUD_INTERCONSULTA SOIN 
INNER JOIN USP_USUARIO_APS USP ON (SOIN.USP_ID = USP.ID) 
INNER JOIN HL7_0001_U SEX ON (USP.HL7_0001_U_ID = SEX.ID) 
INNER JOIN NOD_NODO NODO1 ON (NODO1.ID = SOIN.NOD1_ID)/*NOD1_ID establecimiento local*/
INNER JOIN RL_SOIN_DIAG RL ON (RL.SOIN_ID = SOIN.ID) 
INNER JOIN DIAG_DIAGNOSTICO DIAG ON (RL.DIAG_ID = DIAG.ID) 
LEFT  JOIN ESAD_ESPECIALIDAD_UNIDAD ESAD on ESAD.ID = SOIN.ESAD_ID
LEFT  JOIN ESP_ESPECIALIDAD ESP on ESP.ID = SOIN.ESP_ID
--LEFT  JOIN NOD_NODO NOD02 ON (NOD02.ID = SOIN.NOD2_ID)
--agregado por coronado
inner join FNP_FUNCIONARIO_PRESTADOR fnp on (fnp.ID = SOIN.FNP_ID) 
WHERE 
FECHA_HORA_ENTERA BETWEEN @FECHA_INICIO_ENTERA AND @FECHA_TERMINO_ENTERA
AND (SOIN.NOD1_ID = @NOD_ID OR SOIN.NOD_ID_EMITE = @NOD_ID)
AND SOIN.ELIMINADO = 0
AND (@NOD_ID_DESTINO = 0 or case coalesce(SOIN.NOD2_ID,0) when 0 then -1 else SOIN.NOD2_ID end = @NOD_ID_DESTINO)
AND (@DIAG_PRINCIPAL = 0 or case coalesce(RL.ES_PRINCIPAL,0) when 0 then -1 else RL.ES_PRINCIPAL end = @DIAG_PRINCIPAL)) B
LEFT  JOIN NOD_NODO NOD02 ON (NOD02.ID = B.NOD2_ID)
LEFT  JOIN NOD_NODO NOD03 ON (NOD03.CODIGO_DEIS = B.X_CODIGO_ESTABLECIMIENTO_DESTINO)
order by FECHA_HORA_ENTERA DESC
end

else
begin 
SELECT
      B.RUT,
      B.NOMBRE_FORMATEADO,
      B.NOMBRE AS NOMBRE_USP,
      B.APELLIDO_PATERNO,
      B.APELLIDO_MATERNO,
      B.DESCRIPCION_SEX AS DESCRIPCION,
      B.DESCRIPCION_DIAG AS DESCRIPCION,
      B.RAZON_SOCIAL,
      case when NOD02.RAZON_SOCIAL IS NULL THEN NOD03.RAZON_SOCIAL ELSE NOD02.RAZON_SOCIAL END AS NODO_DESTINO,
      B.NOMBRE_ESPECIALIDAD AS NOMBRE,
      B.FECHA_HORA,
      B.ESTADO,
      B.FECHA_HORA_ENVIO,
      B.ES_GES,
      B.FECHA_HORA_ENTERA,
	  B.NOMBRE_FORMATEADO_FNP,
	  (SELECT ISNULL(STUFF((SELECT ', '+INST.NOMBRE FROM INS_INSTRUMENTO INST INNER JOIN RL_FNPINS RL ON (RL.INS_ID = INST.ID) WHERE RL.ID = B.FNP_ID FOR XML PATH('')), 1,2,''),'Administrativo')) AS TIPO_FNP
      FROM
(SELECT 
	SOIN.ID AS ID,
    SOIN.NOD2_ID AS NOD2_ID,
    case when SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO is not null then
          case when LEN(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO) = 5 then
                SUBSTRING(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO,1,2)+'-'+SUBSTRING(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO,3,len(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO))
          else
                SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO
          end         
    else
          SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO
    end AS X_CODIGO_ESTABLECIMIENTO_DESTINO, 
	USP.RUT, 
	RTRIM(USP.APELLIDO_PATERNO) + ' ' + RTRIM(USP.APELLIDO_MATERNO) + ', ' + RTRIM(USP.NOMBRES) AS NOMBRE_FORMATEADO, 
	USP.NOMBRES AS NOMBRE, 
	USP.APELLIDO_PATERNO, 
	USP.APELLIDO_MATERNO,
	SEX.DESCRIPCION AS DESCRIPCION_SEX, 
	DIAG.DESCRIPCION AS DESCRIPCION_DIAG, 
	NODO1.RAZON_SOCIAL, 
	--NOD02.RAZON_SOCIAL AS NODO_DESTINO, 
	ESAD.NOMBRE_ESPECIALIDAD, 
	CONVERT(VARCHAR,SOIN.FECHA_HORA,103) + ' ' + CONVERT(VARCHAR,SOIN.FECHA_HORA,108) AS FECHA_HORA, 
CASE
WHEN SOIN.ESTADO = 0 THEN 'Ninguno' 
WHEN SOIN.ESTADO = 1 THEN 'Solicitud no existe' 
WHEN SOIN.ESTADO = 2 THEN 'Enviada' 
WHEN SOIN.ESTADO = 3 THEN 'Cita Agendada' 
WHEN SOIN.ESTADO = 4 THEN 'Con cita Confirmada'
WHEN SOIN.ESTADO = 5 THEN 'Atendido' 
WHEN SOIN.ESTADO = 6 THEN 'No Atendido' 
WHEN SOIN.ESTADO = 7 THEN 'Rechazada por el establecimiento de destino'
WHEN SOIN.ESTADO = 8 THEN 'Caducada' 
WHEN SOIN.ESTADO = 9 THEN 'Cita cancelada' 
WHEN SOIN.ESTADO = 10 THEN 'Bloqueada' 
WHEN SOIN.ESTADO = 11 THEN 'Finalizada' 
WHEN SOIN.ESTADO = 12 THEN 'No se present� a la cita' 
WHEN SOIN.ESTADO = 13 THEN 'Nueva' 
WHEN SOIN.ESTADO = 14 THEN 'Nueva Hora Solicitud' 
WHEN SOIN.ESTADO = 15 THEN 'Aceptada en Establecimiento Destino' 
WHEN SOIN.ESTADO = 16 THEN 'Cancelada en Establecimiento Destino'
WHEN SOIN.ESTADO = 17 THEN 'Llego Para La Cita' 
WHEN SOIN.ESTADO = 18 THEN 'Diagnostico Confirmado' 
WHEN SOIN.ESTADO = 19 THEN 'Alta' 
WHEN SOIN.ESTADO = 20 THEN 'Egresada' 
WHEN SOIN.ESTADO = 22 THEN 'Confirmada Por Paciente' 
WHEN SOIN.ESTADO = 23 THEN 'Cita Cancelada Por No Ubicaci�n Del Paciente' 
WHEN SOIN.ESTADO = 24 THEN 'No Pertinente Origen' 
WHEN SOIN.ESTADO = 25 THEN 'En Revision Origen' 
WHEN SOIN.ESTADO = 26 THEN 'Re Emitida' 
WHEN SOIN.ESTADO = 27 THEN 'RechazadaPorPaciente' 
WHEN SOIN.ESTADO = 28 THEN 'Solicitud Observada Destino' 
WHEN SOIN.ESTADO = 29 THEN 'Cancelada' 
WHEN SOIN.ESTADO = 30 THEN 'Rechazada por sistema' 
END ESTADO,
isnull(convert(varchar,SOIN.FECHA_HORA_ENVIO_CONTRALOR, 105), ' - ') as FECHA_HORA_ENVIO,
CASE WHEN SOIN.ES_GES = 1 THEN 'SI' ELSE 'NO' END ES_GES,
FECHA_HORA_ENTERA AS FECHA_HORA_ENTERA,
--agregado por coronado
--el fnpid2 es el funcionario ejecutor
RTRIM(fnp.APELLIDO_PATERNO) + ' ' + RTRIM(fnp.APELLIDO_MATERNO) + ', ' + RTRIM(fnp.NOMBRES) AS NOMBRE_FORMATEADO_FNP,
FNP.ID AS FNP_ID
FROM SOIN_SOLICITUD_INTERCONSULTA SOIN 
INNER JOIN USP_USUARIO_APS USP ON (SOIN.USP_ID = USP.ID) 
INNER JOIN HL7_0001_U SEX ON (USP.HL7_0001_U_ID = SEX.ID) 
INNER JOIN NOD_NODO NODO1 ON (NODO1.ID = SOIN.NOD1_ID)/*NOD1_ID establecimiento local*/
INNER JOIN RL_SOIN_DIAG RL ON (RL.SOIN_ID = SOIN.ID) 
INNER JOIN DIAG_DIAGNOSTICO DIAG ON (RL.DIAG_ID = DIAG.ID) 
INNER JOIN ESAD_ESPECIALIDAD_UNIDAD ESAD on ESAD.ID = SOIN.ESAD_ID
--LEFT  JOIN NOD_NODO NOD02 ON (NOD02.ID = SOIN.NOD2_ID)
--agregado por coronado
inner join FNP_FUNCIONARIO_PRESTADOR fnp on (fnp.ID = SOIN.FNP_ID) 
WHERE 
FECHA_HORA_ENTERA BETWEEN @FECHA_INICIO_ENTERA AND @FECHA_TERMINO_ENTERA
AND (SOIN.NOD1_ID = @NOD_ID OR SOIN.NOD_ID_EMITE = @NOD_ID)
--AND (@ESTADO = 0 or case coalesce(SOIN.ESTADO,0) when 0 then -1 else SOIN.ESTADO end = @ESTADO)
AND (@ESAD_ID = 0 or case coalesce(SOIN.ESAD_ID ,0) when 0 then -1 else SOIN.ESAD_ID end = @ESAD_ID)
AND (@NOD_ID_DESTINO = 0 or case coalesce(SOIN.NOD2_ID,0) when 0 then -1 else SOIN.NOD2_ID end = @NOD_ID_DESTINO)
AND (@UINS_ID = 0 or case coalesce(ESAD.UINS_ID ,0) when 0 then -1 else ESAD.UINS_ID end = @UINS_ID)
AND (@DIAG_PRINCIPAL = 0 or case coalesce(RL.ES_PRINCIPAL,0) when 0 then -1 else RL.ES_PRINCIPAL end = @DIAG_PRINCIPAL)) B
LEFT  JOIN NOD_NODO NOD02 ON (NOD02.ID = B.NOD2_ID)
LEFT  JOIN NOD_NODO NOD03 ON (NOD03.CODIGO_DEIS = B.X_CODIGO_ESTABLECIMIENTO_DESTINO)
order by FECHA_HORA_ENTERA DESC
end

end

else /*Comienzo sino SOIN_OTRO_NODO */

if (@SOIN_ANTIGUA = 0)
begin
SELECT
      B.RUT,
      B.NOMBRE_FORMATEADO,
      B.NOMBRE AS NOMBRE_USP,
      B.APELLIDO_PATERNO,
      B.APELLIDO_MATERNO,
      B.DESCRIPCION_SEX AS DESCRIPCION,
      B.DESCRIPCION_DIAG AS DESCRIPCION,
      B.RAZON_SOCIAL,
      case when NOD02.RAZON_SOCIAL IS NULL THEN NOD03.RAZON_SOCIAL ELSE NOD02.RAZON_SOCIAL END AS NODO_DESTINO,
      B.NOMBRE_ESPECIALIDAD AS NOMBRE,
      B.FECHA_HORA,
      B.ESTADO,
      B.FECHA_HORA_ENVIO,
      B.ES_GES,
      B.FECHA_HORA_ENTERA,
	  B.NOMBRE_FORMATEADO_FNP,
	  (SELECT ISNULL(STUFF((SELECT ', '+INST.NOMBRE FROM INS_INSTRUMENTO INST INNER JOIN RL_FNPINS RL ON (RL.INS_ID = INST.ID) WHERE RL.ID = B.FNP_ID FOR XML PATH('')), 1,2,''),'Administrativo')) AS TIPO_FNP
      FROM
(SELECT 
	SOIN.ID AS ID,
    SOIN.NOD2_ID AS NOD2_ID,
    case when SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO is not null then
          case when LEN(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO) = 5 then
                SUBSTRING(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO,1,2)+'-'+SUBSTRING(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO,3,len(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO))
          else
                SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO
          end         
    else
          SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO
    end AS X_CODIGO_ESTABLECIMIENTO_DESTINO, 
	USP.RUT, 
	RTRIM(USP.APELLIDO_PATERNO) + ' ' + RTRIM(USP.APELLIDO_MATERNO) + ', ' + RTRIM(USP.NOMBRES) AS NOMBRE_FORMATEADO, 
	USP.NOMBRES AS NOMBRE, 
	USP.APELLIDO_PATERNO, 
	USP.APELLIDO_MATERNO,
	SEX.DESCRIPCION AS DESCRIPCION_SEX, 
	DIAG.DESCRIPCION AS DESCRIPCION_DIAG, 
	NODO1.RAZON_SOCIAL, 
	--NOD02.RAZON_SOCIAL AS NODO_DESTINO, 
	ESP.NOMBRE AS NOMBRE_ESPECIALIDAD, 
	CONVERT(VARCHAR,SOIN.FECHA_HORA,103) + ' ' + CONVERT(VARCHAR,SOIN.FECHA_HORA,108) AS FECHA_HORA, 
CASE
WHEN SOIN.ESTADO = 0 THEN 'Ninguno' 
WHEN SOIN.ESTADO = 1 THEN 'Solicitud no existe' 
WHEN SOIN.ESTADO = 2 THEN 'Enviada' 
WHEN SOIN.ESTADO = 3 THEN 'Cita Agendada' 
WHEN SOIN.ESTADO = 4 THEN 'Con cita Confirmada'
WHEN SOIN.ESTADO = 5 THEN 'Atendido' 
WHEN SOIN.ESTADO = 6 THEN 'No Atendido' 
WHEN SOIN.ESTADO = 7 THEN 'Rechazada por el establecimiento de destino'
WHEN SOIN.ESTADO = 8 THEN 'Caducada' 
WHEN SOIN.ESTADO = 9 THEN 'Cita cancelada' 
WHEN SOIN.ESTADO = 10 THEN 'Bloqueada' 
WHEN SOIN.ESTADO = 11 THEN 'Finalizada' 
WHEN SOIN.ESTADO = 12 THEN 'No se present� a la cita' 
WHEN SOIN.ESTADO = 13 THEN 'Nueva' 
WHEN SOIN.ESTADO = 14 THEN 'Nueva Hora Solicitud' 
WHEN SOIN.ESTADO = 15 THEN 'Aceptada en Establecimiento Destino' 
WHEN SOIN.ESTADO = 16 THEN 'Cancelada en Establecimiento Destino'
WHEN SOIN.ESTADO = 17 THEN 'Llego Para La Cita' 
WHEN SOIN.ESTADO = 18 THEN 'Diagnostico Confirmado' 
WHEN SOIN.ESTADO = 19 THEN 'Alta' 
WHEN SOIN.ESTADO = 20 THEN 'Egresada' 
WHEN SOIN.ESTADO = 22 THEN 'Confirmada Por Paciente' 
WHEN SOIN.ESTADO = 23 THEN 'Cita Cancelada Por No Ubicaci�n Del Paciente' 
WHEN SOIN.ESTADO = 24 THEN 'No Pertinente Origen' 
WHEN SOIN.ESTADO = 25 THEN 'En Revision Origen' 
WHEN SOIN.ESTADO = 26 THEN 'Re Emitida' 
WHEN SOIN.ESTADO = 27 THEN 'RechazadaPorPaciente' 
WHEN SOIN.ESTADO = 28 THEN 'Solicitud Observada Destino' 
WHEN SOIN.ESTADO = 29 THEN 'Cancelada' 
WHEN SOIN.ESTADO = 30 THEN 'Rechazada por sistema' 
END ESTADO,
isnull(convert(varchar,SOIN.FECHA_HORA_ENVIO_CONTRALOR, 105), ' - ') as FECHA_HORA_ENVIO,
CASE WHEN SOIN.ES_GES = 1 THEN 'SI' ELSE 'NO' END ES_GES,
FECHA_HORA_ENTERA AS FECHA_HORA_ENTERA,
--agregado por coronado
--el fnpid2 es el funcionario ejecutor
RTRIM(fnp.APELLIDO_PATERNO) + ' ' + RTRIM(fnp.APELLIDO_MATERNO) + ', ' + RTRIM(fnp.NOMBRES) AS NOMBRE_FORMATEADO_FNP,
FNP.ID AS FNP_ID
FROM SOIN_SOLICITUD_INTERCONSULTA SOIN 
INNER JOIN USP_USUARIO_APS USP ON (SOIN.USP_ID = USP.ID) 
INNER JOIN HL7_0001_U SEX ON (USP.HL7_0001_U_ID = SEX.ID) 
INNER JOIN ESP_ESPECIALIDAD ESP ON (ESP.ID = SOIN.ESP_ID) 
INNER JOIN NOD_NODO NODO1 ON (NODO1.ID = SOIN.NOD1_ID)/*NOD1_ID establecimiento local*/
INNER JOIN RL_SOIN_DIAG RL ON (RL.SOIN_ID = SOIN.ID) 
INNER JOIN DIAG_DIAGNOSTICO DIAG ON (RL.DIAG_ID = DIAG.ID) 
--LEFT  JOIN NOD_NODO NOD02 ON (NOD02.ID = SOIN.NOD2_ID)
--agregado por coronado
inner join FNP_FUNCIONARIO_PRESTADOR fnp on (fnp.ID = SOIN.FNP_ID) 
WHERE 
FECHA_HORA_ENTERA BETWEEN @FECHA_INICIO_ENTERA AND @FECHA_TERMINO_ENTERA
AND SOIN.NOD1_ID = @NOD_ID
AND SOIN.ELIMINADO = 0
AND SOIN.ESAD_ID IS NULL
--AND (@ESTADO = 0 or case coalesce(@ESTADO,0) when 0 then -1 else SOIN.ESTADO end = @ESTADO)
AND (@ESP_ID = 0 or case coalesce(ESP.ID ,0) when 0 then -1 else ESP.ID end = @ESP_ID)
AND (@NOD_ID_DESTINO = 0 or case coalesce(SOIN.NOD2_ID,0) when 0 then -1 else SOIN.NOD2_ID end = @NOD_ID_DESTINO)
AND (@DIAG_PRINCIPAL = 0 or case coalesce(RL.ES_PRINCIPAL,0) when 0 then -1 else RL.ES_PRINCIPAL end = @DIAG_PRINCIPAL)) B
LEFT  JOIN NOD_NODO NOD02 ON (NOD02.ID = B.NOD2_ID)
LEFT  JOIN NOD_NODO NOD03 ON (NOD03.CODIGO_DEIS = B.X_CODIGO_ESTABLECIMIENTO_DESTINO)
order by FECHA_HORA_ENTERA DESC
end

else if (@SOIN_ANTIGUA = 2)
begin
SELECT
      B.RUT,
      B.NOMBRE_FORMATEADO,
      B.NOMBRE AS NOMBRE_USP,
      B.APELLIDO_PATERNO,
      B.APELLIDO_MATERNO,
      B.DESCRIPCION_SEX AS DESCRIPCION,
      B.DESCRIPCION_DIAG AS DESCRIPCION,
      B.RAZON_SOCIAL,
      case when NOD02.RAZON_SOCIAL IS NULL THEN NOD03.RAZON_SOCIAL ELSE NOD02.RAZON_SOCIAL END AS NODO_DESTINO,
      B.NOMBRE_ESPECIALIDAD AS NOMBRE,
      B.FECHA_HORA,
      B.ESTADO,
      B.FECHA_HORA_ENVIO,
      B.ES_GES,
      B.FECHA_HORA_ENTERA,
	  --AGREGADO POR CORONADO
	  B.NOMBRE_FORMATEADO_FNP,
	  (SELECT ISNULL(STUFF((SELECT ', '+INST.NOMBRE FROM INS_INSTRUMENTO INST INNER JOIN RL_FNPINS RL ON (RL.INS_ID = INST.ID) WHERE RL.ID = B.FNP_ID FOR XML PATH('')), 1,2,''),'Administrativo')) AS TIPO_FNP
      FROM
(SELECT 
	SOIN.ID AS ID,
    SOIN.NOD2_ID AS NOD2_ID,
    case when SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO is not null then
          case when LEN(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO) = 5 then
                SUBSTRING(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO,1,2)+'-'+SUBSTRING(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO,3,len(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO))
          else
                SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO
          end         
    else
          SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO
    end AS X_CODIGO_ESTABLECIMIENTO_DESTINO, 
	USP.RUT, 
	RTRIM(USP.APELLIDO_PATERNO) + ' ' + RTRIM(USP.APELLIDO_MATERNO) + ', ' + RTRIM(USP.NOMBRES) AS NOMBRE_FORMATEADO, 
	USP.NOMBRES AS NOMBRE, 
	USP.APELLIDO_PATERNO, 
	USP.APELLIDO_MATERNO,
	SEX.DESCRIPCION AS DESCRIPCION_SEX, 
	DIAG.DESCRIPCION AS DESCRIPCION_DIAG, 
	NODO1.RAZON_SOCIAL, 
	--NOD02.RAZON_SOCIAL AS NODO_DESTINO, 
case when SOIN.ESP_ID is null and SOIN.ESAD_ID IS NOT NULL THEN ESAD.NOMBRE_ESPECIALIDAD 
WHEN SOIN.ESP_ID is NOT null and SOIN.ESAD_ID IS NOT NULL THEN ESAD.NOMBRE_ESPECIALIDAD 
ELSE ESP.NOMBRE END NOMBRE_ESPECIALIDAD, 
CONVERT(VARCHAR,SOIN.FECHA_HORA,103) + ' ' + CONVERT(VARCHAR,SOIN.FECHA_HORA,108) AS FECHA_HORA, 
CASE
WHEN SOIN.ESTADO = 0 THEN 'Ninguno' 
WHEN SOIN.ESTADO = 1 THEN 'Solicitud no existe' 
WHEN SOIN.ESTADO = 2 THEN 'Enviada' 
WHEN SOIN.ESTADO = 3 THEN 'Cita Agendada' 
WHEN SOIN.ESTADO = 4 THEN 'Con cita Confirmada'
WHEN SOIN.ESTADO = 5 THEN 'Atendido' 
WHEN SOIN.ESTADO = 6 THEN 'No Atendido' 
WHEN SOIN.ESTADO = 7 THEN 'Rechazada por el establecimiento de destino'
WHEN SOIN.ESTADO = 8 THEN 'Caducada' 
WHEN SOIN.ESTADO = 9 THEN 'Cita cancelada' 
WHEN SOIN.ESTADO = 10 THEN 'Bloqueada' 
WHEN SOIN.ESTADO = 11 THEN 'Finalizada' 
WHEN SOIN.ESTADO = 12 THEN 'No se present� a la cita' 
WHEN SOIN.ESTADO = 13 THEN 'Nueva' 
WHEN SOIN.ESTADO = 14 THEN 'Nueva Hora Solicitud' 
WHEN SOIN.ESTADO = 15 THEN 'Aceptada en Establecimiento Destino' 
WHEN SOIN.ESTADO = 16 THEN 'Cancelada en Establecimiento Destino'
WHEN SOIN.ESTADO = 17 THEN 'Llego Para La Cita' 
WHEN SOIN.ESTADO = 18 THEN 'Diagnostico Confirmado' 
WHEN SOIN.ESTADO = 19 THEN 'Alta' 
WHEN SOIN.ESTADO = 20 THEN 'Egresada' 
WHEN SOIN.ESTADO = 22 THEN 'Confirmada Por Paciente' 
WHEN SOIN.ESTADO = 23 THEN 'Cita Cancelada Por No Ubicaci�n Del Paciente' 
WHEN SOIN.ESTADO = 24 THEN 'No Pertinente Origen' 
WHEN SOIN.ESTADO = 25 THEN 'En Revision Origen' 
WHEN SOIN.ESTADO = 26 THEN 'Re Emitida' 
WHEN SOIN.ESTADO = 27 THEN 'RechazadaPorPaciente' 
WHEN SOIN.ESTADO = 28 THEN 'Solicitud Observada Destino' 
WHEN SOIN.ESTADO = 29 THEN 'Cancelada' 
WHEN SOIN.ESTADO = 30 THEN 'Rechazada por sistema' 
END ESTADO,
isnull(convert(varchar,SOIN.FECHA_HORA_ENVIO_CONTRALOR, 105), ' - ') as FECHA_HORA_ENVIO,
CASE WHEN SOIN.ES_GES = 1 THEN 'SI' ELSE 'NO' END ES_GES,
FECHA_HORA_ENTERA AS FECHA_HORA_ENTERA,
--agregado por coronado
--el fnpid2 es el funcionario ejecutor
RTRIM(fnp.APELLIDO_PATERNO) + ' ' + RTRIM(fnp.APELLIDO_MATERNO) + ', ' + RTRIM(fnp.NOMBRES) AS NOMBRE_FORMATEADO_FNP,
FNP.ID AS FNP_ID
FROM SOIN_SOLICITUD_INTERCONSULTA SOIN 
INNER JOIN USP_USUARIO_APS USP ON (SOIN.USP_ID = USP.ID) 
INNER JOIN HL7_0001_U SEX ON (USP.HL7_0001_U_ID = SEX.ID) 
INNER JOIN NOD_NODO NODO1 ON (NODO1.ID = SOIN.NOD1_ID)/*NOD1_ID establecimiento local*/
INNER JOIN RL_SOIN_DIAG RL ON (RL.SOIN_ID = SOIN.ID) 
INNER JOIN DIAG_DIAGNOSTICO DIAG ON (RL.DIAG_ID = DIAG.ID) 
LEFT  JOIN ESAD_ESPECIALIDAD_UNIDAD ESAD on ESAD.ID = SOIN.ESAD_ID
LEFT  JOIN ESP_ESPECIALIDAD ESP on ESP.ID = SOIN.ESP_ID
--LEFT  JOIN NOD_NODO NOD02 ON (NOD02.ID = SOIN.NOD2_ID)
--agregado por coronado
inner join FNP_FUNCIONARIO_PRESTADOR fnp on (fnp.ID = SOIN.FNP_ID) 
WHERE 
FECHA_HORA_ENTERA BETWEEN @FECHA_INICIO_ENTERA AND @FECHA_TERMINO_ENTERA
AND SOIN.NOD1_ID = @NOD_ID
AND SOIN.ELIMINADO = 0
AND (@NOD_ID_DESTINO = 0 or case coalesce(SOIN.NOD2_ID,0) when 0 then -1 else SOIN.NOD2_ID end = @NOD_ID_DESTINO)
AND (@DIAG_PRINCIPAL = 0 or case coalesce(RL.ES_PRINCIPAL,0) when 0 then -1 else RL.ES_PRINCIPAL end = @DIAG_PRINCIPAL)) B
LEFT  JOIN NOD_NODO NOD02 ON (NOD02.ID = B.NOD2_ID)
LEFT  JOIN NOD_NODO NOD03 ON (NOD03.CODIGO_DEIS = B.X_CODIGO_ESTABLECIMIENTO_DESTINO)
order by FECHA_HORA_ENTERA DESC
--PRINT 'SI'
end

else
begin 
SELECT
      B.RUT,
      B.NOMBRE_FORMATEADO,
      B.NOMBRE AS NOMBRE_USP,
      B.APELLIDO_PATERNO,
      B.APELLIDO_MATERNO,
      B.DESCRIPCION_SEX AS DESCRIPCION,
      B.DESCRIPCION_DIAG AS DESCRIPCION,
      B.RAZON_SOCIAL,
      case when NOD02.RAZON_SOCIAL IS NULL THEN NOD03.RAZON_SOCIAL ELSE NOD02.RAZON_SOCIAL END AS NODO_DESTINO,
      B.NOMBRE_ESPECIALIDAD AS NOMBRE,
      B.FECHA_HORA,
      B.ESTADO,
      B.FECHA_HORA_ENVIO,
      B.ES_GES,
      B.FECHA_HORA_ENTERA,
	  B.NOMBRE_FORMATEADO_FNP,
	  (SELECT ISNULL(STUFF((SELECT ', '+INST.NOMBRE FROM INS_INSTRUMENTO INST INNER JOIN RL_FNPINS RL ON (RL.INS_ID = INST.ID) WHERE RL.ID = B.FNP_ID FOR XML PATH('')), 1,2,''),'Administrativo')) AS TIPO_FNP
      FROM
(SELECT 
	SOIN.ID AS ID,
    SOIN.NOD2_ID AS NOD2_ID,
    case when SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO is not null then
          case when LEN(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO) = 5 then
                SUBSTRING(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO,1,2)+'-'+SUBSTRING(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO,3,len(SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO))
          else
                SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO
          end         
    else
          SOIN.X_CODIGO_ESTABLECIMIENTO_DESTINO
    end AS X_CODIGO_ESTABLECIMIENTO_DESTINO, 
	USP.RUT, 
	RTRIM(USP.APELLIDO_PATERNO) + ' ' + RTRIM(USP.APELLIDO_MATERNO) + ', ' + RTRIM(USP.NOMBRES) AS NOMBRE_FORMATEADO, 
	USP.NOMBRES AS NOMBRE, 
	USP.APELLIDO_PATERNO, 
	USP.APELLIDO_MATERNO,
	SEX.DESCRIPCION AS DESCRIPCION_SEX, 
	DIAG.DESCRIPCION AS DESCRIPCION_DIAG, 
	NODO1.RAZON_SOCIAL, 
	--NOD02.RAZON_SOCIAL AS NODO_DESTINO, 
	ESAD.NOMBRE_ESPECIALIDAD, 
	CONVERT(VARCHAR,SOIN.FECHA_HORA,103) + ' ' + CONVERT(VARCHAR,SOIN.FECHA_HORA,108) AS FECHA_HORA, 
CASE
WHEN SOIN.ESTADO = 0 THEN 'Ninguno' 
WHEN SOIN.ESTADO = 1 THEN 'Solicitud no existe' 
WHEN SOIN.ESTADO = 2 THEN 'Enviada' 
WHEN SOIN.ESTADO = 3 THEN 'Cita Agendada' 
WHEN SOIN.ESTADO = 4 THEN 'Con cita Confirmada'
WHEN SOIN.ESTADO = 5 THEN 'Atendido' 
WHEN SOIN.ESTADO = 6 THEN 'No Atendido' 
WHEN SOIN.ESTADO = 7 THEN 'Rechazada por el establecimiento de destino'
WHEN SOIN.ESTADO = 8 THEN 'Caducada' 
WHEN SOIN.ESTADO = 9 THEN 'Cita cancelada' 
WHEN SOIN.ESTADO = 10 THEN 'Bloqueada' 
WHEN SOIN.ESTADO = 11 THEN 'Finalizada' 
WHEN SOIN.ESTADO = 12 THEN 'No se present� a la cita' 
WHEN SOIN.ESTADO = 13 THEN 'Nueva' 
WHEN SOIN.ESTADO = 14 THEN 'Nueva Hora Solicitud' 
WHEN SOIN.ESTADO = 15 THEN 'Aceptada en Establecimiento Destino' 
WHEN SOIN.ESTADO = 16 THEN 'Cancelada en Establecimiento Destino'
WHEN SOIN.ESTADO = 17 THEN 'Llego Para La Cita' 
WHEN SOIN.ESTADO = 18 THEN 'Diagnostico Confirmado' 
WHEN SOIN.ESTADO = 19 THEN 'Alta' 
WHEN SOIN.ESTADO = 20 THEN 'Egresada' 
WHEN SOIN.ESTADO = 22 THEN 'Confirmada Por Paciente' 
WHEN SOIN.ESTADO = 23 THEN 'Cita Cancelada Por No Ubicaci�n Del Paciente' 
WHEN SOIN.ESTADO = 24 THEN 'No Pertinente Origen' 
WHEN SOIN.ESTADO = 25 THEN 'En Revision Origen' 
WHEN SOIN.ESTADO = 26 THEN 'Re Emitida' 
WHEN SOIN.ESTADO = 27 THEN 'RechazadaPorPaciente' 
WHEN SOIN.ESTADO = 28 THEN 'Solicitud Observada Destino' 
WHEN SOIN.ESTADO = 29 THEN 'Cancelada' 
WHEN SOIN.ESTADO = 30 THEN 'Rechazada por sistema' 
END ESTADO,
isnull(convert(varchar,SOIN.FECHA_HORA_ENVIO_CONTRALOR, 105), ' - ') as FECHA_HORA_ENVIO,
CASE WHEN SOIN.ES_GES = 1 THEN 'SI' ELSE 'NO' END ES_GES,
FECHA_HORA_ENTERA AS FECHA_HORA_ENTERA,
--agregado por coronado
--el fnpid2 es el funcionario ejecutor
RTRIM(fnp.APELLIDO_PATERNO) + ' ' + RTRIM(fnp.APELLIDO_MATERNO) + ', ' + RTRIM(fnp.NOMBRES) AS NOMBRE_FORMATEADO_FNP,
FNP.ID AS FNP_ID
FROM SOIN_SOLICITUD_INTERCONSULTA SOIN 
INNER JOIN USP_USUARIO_APS USP ON (SOIN.USP_ID = USP.ID) 
INNER JOIN HL7_0001_U SEX ON (USP.HL7_0001_U_ID = SEX.ID) 
INNER JOIN NOD_NODO NODO1 ON (NODO1.ID = SOIN.NOD1_ID)/*NOD1_ID establecimiento local*/
INNER JOIN RL_SOIN_DIAG RL ON (RL.SOIN_ID = SOIN.ID) 
INNER JOIN DIAG_DIAGNOSTICO DIAG ON (RL.DIAG_ID = DIAG.ID) 
INNER JOIN ESAD_ESPECIALIDAD_UNIDAD ESAD on ESAD.ID = SOIN.ESAD_ID
--LEFT  JOIN NOD_NODO NOD02 ON (NOD02.ID = SOIN.NOD2_ID)
--agregado por coronado
inner join FNP_FUNCIONARIO_PRESTADOR fnp on (fnp.ID = SOIN.FNP_ID) 
WHERE 
FECHA_HORA_ENTERA BETWEEN @FECHA_INICIO_ENTERA AND @FECHA_TERMINO_ENTERA
AND SOIN.NOD1_ID = @NOD_ID
--AND (@ESTADO = 0 or case coalesce(SOIN.ESTADO,0) when 0 then -1 else SOIN.ESTADO end = @ESTADO)
AND (@ESAD_ID = 0 or case coalesce(SOIN.ESAD_ID ,0) when 0 then -1 else SOIN.ESAD_ID end = @ESAD_ID)
AND (@NOD_ID_DESTINO = 0 or case coalesce(SOIN.NOD2_ID,0) when 0 then -1 else SOIN.NOD2_ID end = @NOD_ID_DESTINO)
AND (@UINS_ID = 0 or case coalesce(ESAD.UINS_ID ,0) when 0 then -1 else ESAD.UINS_ID end = @UINS_ID)
AND (@DIAG_PRINCIPAL = 0 or case coalesce(RL.ES_PRINCIPAL,0) when 0 then -1 else RL.ES_PRINCIPAL end = @DIAG_PRINCIPAL)) B
LEFT  JOIN NOD_NODO NOD02 ON (NOD02.ID = B.NOD2_ID)
LEFT  JOIN NOD_NODO NOD03 ON (NOD03.CODIGO_DEIS = B.X_CODIGO_ESTABLECIMIENTO_DESTINO)
order by FECHA_HORA_ENTERA DESC
end
END

