/*
script de reparación de cola de integracion cuando
un elemento egresado se llena con motivo de cancelación
(Egreso) con número 0 O FECHA INVALIDA

Esto ha ocurrido en viña quillota y chiloe, no se pudo identificar
a traves de código fuente en que momento se inserta mal ese registro
en la COLA_INTEGRACION de RAYEN por tal motivo se prepara este script
la idea es generar un registro en la COLA_INTEGRACION de RAYEN pero esta
vez con el elemento bien formado así será integrado por mirth o
bien por el servicio de windows.

LOS XMLS MAL FORMADOS PARA ESTE CASO SON LOS DE TIPO 4
CANCELACION O EGRESO DE UNA SIC Y QUE CUENTAN CON FECHAS
Y MOTIVO DE CANCELACION 0, LO REALIZAMOS ENTRE FECHAS PARA 
FILTRAR LOS REGISTROS

ESTE ES UN EJEMPLO DE UN XML BIEN FORMADO
<?xml version="1.0" encoding="utf-16"?>
<CancelarSolicitud xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <IdSICEnSistemaDestino>00000697216</IdSICEnSistemaDestino>
  <MotivoCancelacion>22</MotivoCancelacion>
  <Observaciones>USUARIO ATENDIDO POR RESOLUTIVIDAD EL DIA 26/07/2016</Observaciones>
  <FechaCancelacion>2016-08-17T00:00:00</FechaCancelacion>
  <FechaHoraCancelacion>2016-08-17T15:46:33.4662039</FechaHoraCancelacion>
  <Responsable>
    <Id>0</Id>
    <CodigoProfesion>0</CodigoProfesion>
  </Responsable>
</CancelarSolicitud>

*/


--TABLA QUE USAREMOS PARA PROCESAR LOS REGISTROS Y REALIZAR LECTURAS E INSERTS
DECLARE @PROCESAR TABLE (ID_MENSAJE INT, CONTENIDO_XML XML, CODIGO_ESTABLECIMIENTO_ORIGEN VARCHAR(50))
DECLARE @PROCESADA TABLE (ID1  INT IDENTITY, ID INT, VERSION_RAYEN VARCHAR(50), SDD_ID INT, NUMERO_INTENTOS_ENVIO INT, fecha_formateada DATETIME, FECHA_HORA_SERVIDOR DATETIME, ID_MENSAJE int, TIPO_MESNAJE INT, CODIGO_ESTABLECIMIENTO_ORIGEN VARCHAR(50), MOTIVO_CANCELACION INT, CONTENIDO_XML XML)
 
declare @SDD_ID INT
DECLARE @FECHA_INICIO DATETIME, @FECHA_TERMINO DATETIME

/* PARAMETROS QUE SE DEBEN MODIFICAR PARA REALIZAR LA REPARACIÓN */

SET @SDD_ID = 7
SET @FECHA_INICIO = '08-01-2016 00:00.000'
SET @FECHA_TERMINO = '08-31-2016 00:00.000'
--solo para ejemplo
--set @MOTIVO_CANCELACION = 14
--TOMAMOS LOS ELEMENTOS DE LA COLA DE ERROR QUE CUMPLEN CON LA CONDICION

INSERT @PROCESAR
SELECT 
 DISTINCT ID_MENSAJE, CONTENIDO_XML, CODIGO_ESTABLECIMIENTO_ORIGEN
FROM Saydex_integracion..COLA_ERROR_INTEGRACION 
WHERE 
SDD_ID = @SDD_ID 
AND TIPO_MENSAJE = 4 
AND CONTENIDO_XML like '%<FechaCancelacion>0001-01-01T00:00:00</FechaCancelacion>%' 
AND FECHA_HORA_SERVIDOR BETWEEN @FECHA_INICIO AND @FECHA_TERMINO

--la insertamos en la tabla @PROCESADA
INSERT @PROCESADA
SELECT 
MAX(COL.ID) ID,
COL.VERSION_RAYEN,
@SDD_ID SDD_ID,
0 NUMEROS_INTENTOS_ENVIO,
convert(varchar, max(col.FECHA_HORA_SERVIDOR), 126) fecha_formateada,
MAX(COL.FECHA_HORA_SERVIDOR) FECHA_HORA_SERVIDOR,
col.ID_MENSAJE, 
4 TIPO_MESNAJE,
pro.CODIGO_ESTABLECIMIENTO_ORIGEN,
(
	select X_CAUSAL_EGRESO from SOIN_SOLICITUD_INTERCONSULTA where id = col.ID_MENSAJE
 ) motivo_cancleacion,
convert(xml, col.CONTENIDO_XML) XML_ORIGINAL
FROM 
Saydex_integracion..COLA_ERROR_INTEGRACION col 
inner join @PROCESAR pro on pro.ID_MENSAJE = col.ID_MENSAJE 
group by col.ID_MENSAJE, pro.CODIGO_ESTABLECIMIENTO_ORIGEN, col.CONTENIDO_XML, VERSION_RAYEN


--SELECT * FROM @PROCESADA

DECLARE @CONTADOR INT, @MAX INT
SET @MAX = (SELECT COUNT(*) FROM @PROCESADA)
SET @CONTADOR = 1


	


WHILE (@CONTADOR <= @MAX)
BEGIN

	DECLARE @MOTIVO_STR VARCHAR(MAX), @fecha datetime, @fecha_hora datetime, @fecha_sin datetime
		if @SDD_ID = 47
	begin
	SET @MOTIVO_STR = (
		select 
		case MOTIVO_CANCELACION 
		when 20 then 0 
		when 5 then 1
		when 6 then 2
		when 7 then 3 
		when 2 then 4
		when 8 then 5
		when 4 then 6 
		when 3 then 7
		when 17 then 8
		when 1 then 10 
		when 11 then 11
		when 14 then 12
		when 18 then 13 
		when 19 then 14
		when 21 then 15
		when 22 then 16 
		when 0 then 17
		when 24 then 18
		end 
		
		from @PROCESADA WHERE ID1 = @CONTADOR
	)
	end

	if @SDD_ID = 20
	begin
	SET @MOTIVO_STR = (
		select 
		case MOTIVO_CANCELACION 
		when 0 then 0 
		when 1 then 9
		when 10 then 8
		when 11 then 11 
		when 12 then 51
		when 13 then 52
		when 14 then 12 
		when 15 then 13
		when 16 then 14
		when 17 then 8 
		when 18 then 13
		when 19 then 14
		when 2 then 4 
		when 21 then 15
		when 22 then 16
		when 23 then 17 
		when 3 then 7
		when 4 then 6
		when 5 then 1
		when 6 then 2 
		when 7 then 3
		when 8 then 5
		when 9 then 10
		end 
		
		from @PROCESADA WHERE ID1 = @CONTADOR
	)
	end

	if @SDD_ID = 7
	begin
	SET @MOTIVO_STR = (
		select 
		case MOTIVO_CANCELACION 
		when 0 then 0 
		when 1 then 9
		when 10 then 8
		when 11 then 11 
		when 12 then 51
		when 13 then 52
		when 14 then 12 
		when 15 then 13
		when 16 then 14
		when 17 then 8 
		when 18 then 13
		when 19 then 14
		when 2 then 4 
		when 21 then 15
		when 22 then 16
		when 23 then 17 
		when 3 then 7
		when 4 then 6
		when 5 then 1
		when 6 then 2 
		when 7 then 3
		when 8 then 5
		when 9 then 10
		when 20 then 0
		end 
		
		from @PROCESADA WHERE ID1 = @CONTADOR
	)
	end
	set @fecha = (select fecha_formateada from @PROCESADA WHERE ID1 = @CONTADOR)
	set @fecha_sin = CONVERT(varchar, @fecha, 126) 

	declare @xml_doc xml
	set @xml_doc = (select contenido_xml from @PROCESADA WHERE ID1 = @CONTADOR)

	--select @xml_doc

	SET @xml_doc.modify('  
	  replace value of (/CancelarSolicitud/MotivoCancelacion/text())[1]  
	  with     sql:variable("@MOTIVO_STR")  
	') ;

	SET @xml_doc.modify('  
	  replace value of (/CancelarSolicitud/FechaCancelacion/text())[1]  
	  with     sql:variable("@fecha_sin")  
	') ;

	SET @xml_doc.modify('  
	  replace value of (/CancelarSolicitud/FechaHoraCancelacion/text())[1]  
	  with     sql:variable("@fecha_sin")  
	') ;

	--este es el xml que se debe guardar ahora en la cola de integracion de rayen
	--select @xml_doc
	update @PROCESADA set CONTENIDO_XML = @xml_doc where ID1 = @CONTADOR

	SET @CONTADOR = @CONTADOR + 1

END

--esta es la query ya procesada
SELECT * FROM @PROCESADA

--AHORA REALIZAMOS UN INSERT A LA COLA DE INTEGRACION

INSERT INTO RAYEN..COLA_INTEGRACION 
(ID, TIPO_MENSAJE, CONTENIDO_XML, ID_MENSAJE, CODIGO_ESTABLECIMIENTO_ORIGEN, NUMERO_INTENTOS_ENVIO, VERSION_RAYEN, FECHA_HORA_SERVIDOR)
SELECT ID, TIPO_MESNAJE, CONVERT(VARCHAR(MAX), CONTENIDO_XML), ID_MENSAJE, CODIGO_ESTABLECIMIENTO_ORIGEN, NUMERO_INTENTOS_ENVIO, VERSION_RAYEN, FECHA_HORA_SERVIDOR FROM @PROCESADA


