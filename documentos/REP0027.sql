USE [RAYEN]
GO

/****** Object:  StoredProcedure [dbo].[REP0027]    Script Date: 18-08-2016 16:25:33 ******/
DROP PROCEDURE [dbo].[REP0027]
GO

/****** Object:  StoredProcedure [dbo].[REP0027]    Script Date: 18-08-2016 16:25:33 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO



/*-----------------------------------------------------------*
** NOMBRE SISTEMA: RAYEN 
**
** NOMBRE DEL OBJETO: REP0027
**
** VER: 1.0.0.1
**
** DESCRIPCION: Modificacion de un inner join, el cual permite sacar el campo Etapa de la tabla aten_atencion
**
** AUTOR: Christopher Castro
**
** FECHA DE CREACION: agosto-2008
**
** MODIFICACIONES:
** Ver 1.0.0.2 , 26/08/2008, Christopher Castro : Se agrega  inner join aten_atencion a alfa.
** Ver 1.0.0.2 , 03/09/2008, Christopher Castro : Se agrega  condicion para edad, con lo cual en pacientes menores de 10 años muestra el formato años, meses y días, si es menor de un mes muestra los días y cuando la edad es mayor de 10 años muestra solo los años del usuario
** Ver 1.0.0.3 , 18/08/2016, Víctor Coronado    : Se agrega JOIN con la tabla ATEN_ATENCION según sugerencia de USYM.

**-----------------------------------------------------------*/




CREATE PROCEDURE [dbo].[REP0027]
(
 @NOD_ID INT,
 @FECHA_INICIO DATETIME,
 @FECHA_TERMINO DATETIME
)
/*06 - MONITOREO_INFLUENZA_CASOS_CONFIRMADOS.sql*/
 AS
BEGIN

SET NOCOUNT ON

SELECT
CONVERT(VARCHAR,DATE_DIAGNOSTICOS_ATENCION.FECHA,103) AS 'FECHA',
USP.NOMBRES + '' +  USP.APELLIDO_PATERNO + ' ' + USP.APELLIDO_MATERNO AS 'NOMBRES',

case WHEN date_diagnosticos_atencion.edad_usuario_aps >= 10000000 then 	convert(varchar,date_diagnosticos_atencion.edad_usuario_aps/1000000) + ' Año(s) '
     ELSE case when date_diagnosticos_atencion.edad_usuario_aps < 3023 then convert(varchar,date_diagnosticos_atencion.edad_usuario_aps%10000/100) + ' Dia(s) '
               else
               convert(varchar,date_diagnosticos_atencion.edad_usuario_aps/1000000) + ' Año(s) ' + convert(varchar,date_diagnosticos_atencion.edad_usuario_aps%1000000/10000) + ' Mes(es) ' + convert(varchar,date_diagnosticos_atencion.edad_usuario_aps%10000/100) + ' Dia(s) 'end
 end as 'EDAD',	

USP.NUMERO_DE_FICHA AS 'FICHA',
SEC.NOMBRE AS 'SECTOR'
into #Resultado
FROM USP_USUARIO_APS usp
inner join DATE_DIAGNOSTICOS_ATENCION on
DATE_DIAGNOSTICOS_ATENCION.usp_id = usp.id
--agregado por coro ************************************************************
inner join ATEN_ATENCION aten on DATE_DIAGNOSTICOS_ATENCION.ATEN_ID = aten.ID
--******************************************************************************
LEFT OUTER JOIN FAM_FAMILIA FAM 
ON FAM.ID = USP.FAM_ID
LEFT OUTER JOIN SEC_SECTOR  Sec 
ON FAM.SEC_ID = SEC.ID
WHERE 
aten.NOD_ID = @NOD_ID
--USP.NOD_ID =@NOD_ID
AND DATE_DIAGNOSTICOS_ATENCION.FECHA BETWEEN @FECHA_INICIO AND @FECHA_TERMINO
AND DATE_DIAGNOSTICOS_ATENCION.DIAG_ID IN (4253,4255,4256,4257,4259,4260) 
AND DATE_DIAGNOSTICOS_ATENCION.ESTADO_DIAGNOSTICO = 2 
--***** agregado por coro *************************
and DATE_DIAGNOSTICOS_ATENCION.ELIMINADO = 0
--*************************************************

SELECT * FROM #Resultado

drop table #Resultado


END


GO

