USE [RAYEN]

GO
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MFA0001]') AND type = N'P') 
	--Se crea encabezado vacio del SP en caso de ser nuevo
	exec('CREATE PROCEDURE [dbo].[MFA0001] AS BEGIN SET NOCOUNT ON; END')
GO
/************************************************************************                              
NOMBRE DEL PROCEDIMIENTO	: MFA0001                              
AUTOR						: Víctor Coronado
FECHA DE CREACIÓN			: 06-07-2017 
BASE DE DATOS				: RAYEN                        

OBJETIVO					: Obtiene las atenciones realizadas a un Usuario APS para mi Familia

FECHA DE MODIFICACIÓN		: 
USUARIO DE MODIFICACIÓN	: 
MOTIVO DE MODIFICACIÓN		: 

VISADO POR (QA)  		:   
FECHA APROBACIÓN QA 		:   
COMENTARIOS QA     		:                             

VISADO POR (DBA)  		:   
FECHA APROBACIÓN DBA 		:   
COMENTARIOS DBA     		:                
                              
TABLAS INVOLUCRADAS 		: DATE_DIAGNOSTICOS_ATENCION, ATEN_ATENCION, 
							  DIAG_DIAGNOSTICO, CIT_CITA, TDA_TIPO_DE_ATENCION

***********************************************************************/
ALTER procedure [dbo].[MFA0001]
(
	@USP_ID int
) 
as
Begin
	select diag.CODIGO_ESTANDAR, diag.DESCRIPCION, aten.FECHA_HORA_INICIO, tda.NOMBRE
	from DATE_DIAGNOSTICOS_ATENCION dated
	inner join ATEN_ATENCION aten on dated.ATEN_ID = aten.Id
	inner join DIAG_DIAGNOSTICO diag on dated.DIAG_ID = diag.ID
	inner join CIT_CITA cit on cit.ID = aten.CIT_ID
	inner join TDA_TIPO_DE_ATENCION tda on tda.ID = cit.TDA_ID
	where dated.USP_ID = @USP_ID and dated.ESTADO_DIAGNOSTICO = 2 and dated.ELIMINADO = 0
end

GO

	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MFA0002]') AND type = N'P') 
	--Se crea encabezado vacio del SP en caso de ser nuevo
	exec('CREATE PROCEDURE [dbo].[MFA0002] AS BEGIN SET NOCOUNT ON; END')
GO

/************************************************************************                              
NOMBRE DEL PROCEDIMIENTO	: MFA0002                              
AUTOR						: Víctor Coronado
FECHA DE CREACIÓN			: 06-07-2017 
BASE DE DATOS				: RAYEN                        

OBJETIVO					: Obtiene los alimentos futuros para un Usuario APS mi Familia

FECHA DE MODIFICACIÓN		: 
USUARIO DE MODIFICACIÓN	: 
MOTIVO DE MODIFICACIÓN		: 

VISADO POR (QA)  		:   
FECHA APROBACIÓN QA 		:   
COMENTARIOS QA     		:                             

VISADO POR (DBA)  		:   
FECHA APROBACIÓN DBA 		:   
COMENTARIOS DBA     		:                
                              
TABLAS INVOLUCRADAS 		: USP_USUARIO_APS, EALI_ENTREGA_ALIMENTO, 
							  ALIE_ALIMENTO_ENTREGAR, ARTI_ARTICULO

***********************************************************************/
ALTER PROCEDURE [dbo].[MFA0002]
(
	@USP_ID INT
)
AS
BEGIN

--DECLARE @USP_ID INT
--SET @USP_ID = 11356028


SELECT 
		ARTI.CODIGO_INTERNO AS CODIGO_ALIMENTO,
		ARTI.NOMBRE_GENERICO AS NOMBRE_ALIMENTO,		
		ALIE.CANTIDAD_ENTREGAR - ALIE.SALDO_PENDIENTE AS CANTIDAD_DESPACHO,
		ISNULL(EALI.FECHA_PROXIMO_DESPACHO,GETDATE()) AS FECHA_ENTREGA,
		EALI.ESTADO AS ESTADO_ENTREGA		
FROM RAYEN..USP_USUARIO_APS USP WITH (NOLOCK)
INNER JOIN RAYEN..EALI_ENTREGA_ALIMENTO EALI WITH (NOLOCK)ON USP.ID=EALI.USP_ID
INNER JOIN RAYEN..ALIE_ALIMENTO_ENTREGAR ALIE WITH (NOLOCK)ON ALIE.EALI_ID=EALI.ID
INNER JOIN RAYEN..ARTI_ARTICULO ARTI WITH (NOLOCK)ON ALIE.ARTI_ID=ARTI.ID
WHERE 
		USP.ID =@USP_ID
		AND EALI.ESTADO IN (1,2) 
		AND EALI.EALI_ID IS NOT NULL
		AND ALIE.CANTIDAD_ENTREGAR > 0 
		AND EALI.ELIMINADO=0 
		AND ALIE.ELIMINADO=0 
		AND EALI.FECHA_PROXIMO_DESPACHO >= GETDATE()
END

GO
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[APP0001]') AND type = N'P') 
	--Se crea encabezado vacio del SP en caso de ser nuevo
	exec('CREATE PROCEDURE [dbo].[APP0001] AS BEGIN SET NOCOUNT ON; END')
GO
/************************************************************************
NOMBRE DEL PROCEDIMIENTO	: APP0001
AUTOR						: CARLOS SILVA
FECHA DE CREACIÓN			: 2017-11-30
BASE DE DATOS				: RAYEN

OBJETIVO					: LEER DE LA TABLA NODOS_APPS

Fecha de modificación		: 
Usuario de modificación		:
Motivo de modificación		: 

VISADO POR (QA)  			: 
FECHA APROBACIÓN QA 		: 
COMENTARIOS QA     			: 

VISADO POR (DBA)  			: 
FECHA APROBACIÓN DBA 		: 
COMENTARIOS DBA     		: 

TABLAS INVOLUCRADAS 		:	NODOS_APPS

***********************************************************************/
ALTER PROCEDURE [dbo].[APP0001]
(
@latitude DECIMAL(15,8) ,--='-33.437774',
@longitude DECIMAL(15,8),--='-70.644160',
@distance INT,--='10000',
@cat INT,--='3', de 0 a 4 siendo 0 = 1
@cont int =1

) AS
BEGIN 

/*******************************************************************/ 
while (@cont<3)
begin
DECLARE @g1 geography
declare @pointAsText1 varchar(50)
set @g1 = geography::STGeomFromText('POINT(' + convert(varchar(50), @latitude) + ' ' +
convert(varchar(50), @longitude) + ')', 4326)
SELECT 
GEOLOCALIZACION.STDistance(@g1) Distance
INTO #UNO
FROM NODOS_APPS N
WHERE
N.LAT IS NOT NULL
and GEOLOCALIZACION.STDistance(@g1) <= @distance
and N.ACTIVO = 1
ORDER BY
GEOLOCALIZACION.STDistance(@g1)
SELECT COUNT(*) T INTO #T FROM #UNO

SELECT @cont= t FROM #T

if (@cont>=3)
begin

set @distance=@distance
select * into #dos from #uno
end
else
begin
set @distance=@distance+@distance
end

DROP TABLE
#UNO,#T
end
drop table #dos

/************************************************************************************/

DECLARE @g geography
declare @pointAsText varchar(50)
--BEGIN 
set @g = geography::STGeomFromText('POINT(' + convert(varchar(50), @latitude) + ' ' +
convert(varchar(50), @longitude) + ')', 4326)

SELECT 
COD_DEIS,
COD_REG,
REGION,
SS_ID,
SS,
NIVEL_ATEN,
ID_NIVEL_ATEN,
ID_NODO,
RAZON_SOCIAL,
COM_ID,
COMUNA,
DIRECCION,
TELEFONO,
CL_SAPU,
OBSERVACION,
ACTIVO,
ES_RAYEN,
HH_LUN_VIE,
HH_SAB_DOM,
LAT,LON,
GEOLOCALIZACION.STDistance(@g) Distance

INTO #DATO

FROM NODOS_APPS N

WHERE
N.LAT IS NOT NULL and 
GEOLOCALIZACION.STDistance(@g) <= @distance
and N.ACTIVO = 1
ORDER BY
GEOLOCALIZACION.STDistance(@g)
/*****************************************************************************************/
SELECT ID,USP_ID,NOD_ID,FECHA_HORA_INGRESO
INTO #URG
FROM RAYEN..IURG_INGRESO_URGENCIA EU WITH(NOLOCK)
WHERE EU.NOD_ID IN (SELECT DISTINCT ID_NODO FROM #DATO) AND
EU.FECHA_HORA_INGRESO >= DATEADD(HH,-72,GETDATE()) AND
EU.FECHA_HORA_INGRESO <= GETDATE() 
AND EU.FECHA_HORA_INGRESO IS NOT NULL
UNION ALL            
SELECT ID,USP_ID,NOD_ID,FECHA_HORA_INGRESO
FROM RAYEN..INGS_INGRESO_SAPU SA WITH(NOLOCK)
WHERE SA.NOD_ID IN (SELECT DISTINCT ID_NODO FROM #DATO) AND
SA.FECHA_HORA_INGRESO >= DATEADD(HH,-72,GETDATE()) AND
SA.FECHA_HORA_INGRESO <= GETDATE() 
AND SA.FECHA_HORA_INGRESO IS NOT NULL            
--*******************************************************************************                  
SELECT DISTINCT
P.ID,
EU.NOD_ID AS CENTRO,
DATEDIFF(MINUTE,eu.FECHA_HORA_INGRESO,A.FECHA_HORA_INICIO) AS [ADM_A_ATEN_MEDICA],
CASE xc.Prioridad 
WHEN '0' THEN 'C1' 
WHEN '1' THEN 'C2' 
WHEN '2' THEN 'C3' 
WHEN '3' THEN 'C4' 
WHEN '4' THEN 'C5' 
ELSE '' 
END [TRIAGE]
INTO #INFO
FROM #URG EU WITH(NOLOCK)
inner join RAYEN..USP_USUARIO_APS P WITH(NOLOCK) on EU.USP_ID = P.ID AND P.ELIMINADO=0
left join RAYEN..ATEN_ATENCION A WITH(NOLOCK) on EU.id = A.IURG_ID and A.ELIMINADO = 0
INNER join (
                        select ht.IURG_ID,MAX(ht.FECHA_HORA)FECHA,ht.CATEGORIZACION AS Prioridad
                        from  RAYEN..CUR_CATEGORIZACION_URGENCIA ht WITH(NOLOCK)
                       GROUP BY ht.IURG_ID,ht.CATEGORIZACION
                  ) xc on EU.ID=xc.IURG_ID 
WHERE xc.Prioridad=@cat
--*************************************************************************************************

SELECT CENTRO,TRIAGE,COUNT(TRIAGE)N_TRIAGE,SUM([ADM_A_ATEN_MEDICA])AS TPO 
INTO #TPO
FROM #INFO 
GROUP BY TRIAGE,CENTRO ORDER BY TRIAGE ASC

SELECT 
CENTRO,
case when TRIAGE='' then 'SIN TRIAGE' ELSE TRIAGE END AS TRIAGE,
TPO/N_TRIAGE AS TPO_MINUTE 
INTO #FINAL
FROM #TPO 

ORDER BY CENTRO

SELECT 
--ISNULL(COD_DEIS,'0') COD_DEIS
--,ISNULL(COD_REG,'0') COD_REG
--,ISNULL(REGION,'0')REGION
--,ISNULL(SS_ID,'0')SS_ID
--,ISNULL(SS,'0')SS
--,ISNULL(NIVEL_ATEN,'0')NIVEL_ATEN
--,ISNULL(ID_NIVEL_ATEN,'0')ID_NIVEL_ATEN
--,ISNULL(ID_NODO,'0')ID_NODO
ISNULL(RAZON_SOCIAL,'0')NOMBRE
--,ISNULL(COM_ID,'0')COM_ID
--,ISNULL(COMUNA,'0')COMUNA
,ISNULL(DIRECCION,'0')DIRECCION
,ISNULL(TELEFONO,'0')TELEFONOS
--,ISNULL(CL_SAPU,'0')CL_SAPU
--,ISNULL(OBSERVACION,'0')OBSERVACION
--,ISNULL(ACTIVO,'0')ACTIVO
,ISNULL(ES_RAYEN,'0')ES_RAYEN
,ISNULL(HH_LUN_VIE,'0')HH_LUN_VIE
,ISNULL(HH_SAB_DOM,'0')HH_SAB_DOM
,ISNULL(LAT,'0')LATITUD
,ISNULL(LON,'0')LONGITUD
--,ISNULL(Distance,'0')Distance
--,ISNULL(CENTRO,'0')CENTRO
--,ISNULL(TRIAGE,'0')TRIAGE
,ISNULL(TPO_MINUTE,'0') TIEMPO_ESPERA

FROM #DATO D 
LEFT JOIN #FINAL F ON D.ID_NODO=F.CENTRO

DROP TABLE #URG,#INFO,#TPO,#FINAL,#DATO

END
GO



GO
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[APP0002]') AND type = N'P') 
	--Se crea encabezado vacio del SP en caso de ser nuevo
	exec('CREATE PROCEDURE [dbo].[APP0002] AS BEGIN SET NOCOUNT ON; END')
GO
/************************************************************************
NOMBRE DEL PROCEDIMIENTO	: APP0002
AUTOR						: JUAN CARLOS VILLALOBOS JARA
FECHA DE CREACIÓN			: 2017-11-30
BASE DE DATOS				: RAYEN

OBJETIVO					: LEER DE LA TABLA OALA_ORDEN_ATENCION_LABORATORIO POR USP_ID
								6 MESES HACIA ATRAS

Fecha de modificación		: 
Usuario de modificación		:
Motivo de modificación		: 

VISADO POR (QA)  			: 
FECHA APROBACIÓN QA 		: 
COMENTARIOS QA     			: 

VISADO POR (DBA)  			: 
FECHA APROBACIÓN DBA 		: 
COMENTARIOS DBA     		: 

TABLAS INVOLUCRADAS 		:	OALA_ORDEN_ATENCION_LABORATORIO

***********************************************************************/
ALTER PROCEDURE APP0002
	@USP_ID int
AS
BEGIN	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @TOTAL_MESES int = -6;
	select
		OALA.ID as NUMERO_ORDEN,
		OALA.ESTADO as ESTADO_ORDEN,
		OALA.FECHA_HORA_REGISTRO 
	from RAYEN..OALA_ORDEN_ATENCION_LABORATORIO OALA with (nolock) 
	where
		OALA.ELIMINADO = 0
	and
		OALA.USP_ID = @USP_ID
	and 
		OALA.FECHA_HORA_ENTERA > CAST(CONVERT(varchar(8), DATEADD(month, @TOTAL_MESES, GETDATE()), 112) as int)
	
END
GO

GO
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[APP0003]') AND type = N'P') 
	--Se crea encabezado vacio del SP en caso de ser nuevo
	exec('CREATE PROCEDURE [dbo].[APP0003] AS BEGIN SET NOCOUNT ON; END')
GO
/************************************************************************
NOMBRE DEL PROCEDIMIENTO	: APP0003
AUTOR						: JUAN CARLOS VILLALOBOS JARA
FECHA DE CREACIÓN			: 2017-11-30
BASE DE DATOS				: RAYEN

OBJETIVO					: LEER DE LA TABLA ELA_EXAMEN_LABORATORIO 
								POR OALA_ID

Fecha de modificación		: 
Usuario de modificación		:
Motivo de modificación		: 

VISADO POR (QA)  			: 
FECHA APROBACIÓN QA 		: 
COMENTARIOS QA     			: 

VISADO POR (DBA)  			: 
FECHA APROBACIÓN DBA 		: 
COMENTARIOS DBA     		: 

TABLAS INVOLUCRADAS 		:	ELA_EXAMEN_LABORATORIO
								PDI_PRUEBA_DIAGNOSTICO

***********************************************************************/
ALTER PROCEDURE APP0003
	@OALA_IDS varchar (5000)
AS
BEGIN
	--	[Examenes] => Array
	--		[IdExamen] 
	--		[NombreExamen]
	--		[IdEstado] l
	--		[Estado] 
	--		[FechaSolicitud] dd-mm-yyyy
	--		[FechaMuestra]   dd-mm-yyyyid_est
	--		[FechaResultado] dd-mm-yyyy

	/* ESTADO ENTIDAD RAYEN A LA FECHA 30-11-2017
		Ninguno = 0,		
		EnviadaTomaMuestra = 2,//Enviada
		RechazadaSistemaTomaMuestra = 7,//Rechazada por el establecimiento de destino
		Nueva = 13, //Nueva
		RecibidoTomaMuestra = 15, //AceptadaEstablecimientoDestino
		Cancelada = 29,
		EnviadoAnalisis = 31,
		RecibidoAnalisis = 32,
		RechazoSistemaAnalisis = 33,
		ConResultados = 34
	*/
	SET NOCOUNT ON;

	select
		OALA_ID as ID_ORDEN,
		ELA.ID as ID_EXAMEN,
		PDI.NOMBRE AS NOMBRE_EXAMEN,
		ELA.ESTADO AS ID_ESTADO_EXAMEN,
		case ELA.ESTADO
			when 0 then 'Ninguno'
			when 2 then 'Enviada a toma de muestra'
			when 7 then 'Rechazada por el establecimiento de destino'
			when 13 then 'Nueva'
			when 15 then 'Aceptada por establecimiento de destino'
			when 29 then 'Cancelada'
			when 31 then 'Enviado análisis'
			when 32 then 'Recibido análisis'
			when 33 then 'Rechazo de sistema de análisis'
			when 34 then 'Con resultados'
		end AS ESTADO_EXAMEN,
		ELA.FECHA_GENERACION_EXAMEN,
		ELA.FECHA_HORA_ENVIO_EXAMEN,
		ELA.FECHA_HORA_TOMA_EXAMEN
	from RAYEN..ELA_EXAMEN_LABORATORIO ELA with (nolock)
	inner join (SELECT ID FROM OBTENER_ID(@OALA_IDS)) IDS ON ELA.OALA_ID = IDS.ID
	inner join PDI_PRUEBA_DIAGNOSTICO PDI with (nolock) on PDI.ID = ELA.PDI_ID
	where
		ELA.ELIMINADO = 0
	and
		ELA.ES_EXTERNA = 0 -- no se si aplica
	
END
GO

GO
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[APP0004]') AND type = N'P') 
	--Se crea encabezado vacio del SP en caso de ser nuevo
	exec('CREATE PROCEDURE [dbo].[APP0004] AS BEGIN SET NOCOUNT ON; END')
GO
/************************************************************************
NOMBRE DEL PROCEDIMIENTO	: APP0004
AUTOR						: JUAN CARLOS VILLALOBOS JARA
FECHA DE CREACIÓN			: 2017-11-30
BASE DE DATOS				: RAYEN

OBJETIVO					: LEER DE LA TABLA ELA_EXAMEN_LABORATORIO 
								POR ELA_ID

Fecha de modificación		: 
Usuario de modificación		:
Motivo de modificación		: 

VISADO POR (QA)  			: 
FECHA APROBACIÓN QA 		: 
COMENTARIOS QA     			: 

VISADO POR (DBA)  			: 
FECHA APROBACIÓN DBA 		: 
COMENTARIOS DBA     		: 

TABLAS INVOLUCRADAS 		:	ELA_EXAMEN_LABORATORIO
								PDI_PRUEBA_DIAGNOSTICO

***********************************************************************/
ALTER PROCEDURE APP0004
	@ELA_IDS varchar (5000)
AS
BEGIN
	--			[Resultados] => Array
	--				[IdResultado]
	--				[DescripcionResultado] 
	--				[Resultado] 
	--				[UM] 
	--				[ValoresReferencia]
	--				[Metodo]

	--SET NOCOUNT ON;
	create table #MCAM_FILTRADOS
	(
		ATEN_ID int,
		USP_ID int,
		MFRM_ID int,
		MCAM_ID int,
		MCAM_ETIQUETA varchar(500),
		MCAM_EXPLICACION varchar(1000),
		MCAM_TIPODATO int
	)

	CREATE NONCLUSTERED INDEX IX_T_MCAM_FILTRADOS_
		ON #MCAM_FILTRADOS(MCAM_ID, USP_ID, ATEN_ID, MFRM_ID)
	--GO

	insert into #MCAM_FILTRADOS
	select
		ATFM.IDATENCION,
		ATFM.IDUSUARIOAPS,
		ATFM.MFRM_ID,
		MCAM.ID,
		MCAM.ETIQUETA as NOMBRE,
		ISNULL(NULLIF(MCAM.EXPLICACION, ''), MCAM.ETIQUETA) as MCAM_EXPLICACION,
		MCAM.TIPODATO as TIPO_DATO
	from 
	ELA_EXAMEN_LABORATORIO ELA with (nolock)
	inner join (SELECT ID FROM OBTENER_ID(@ELA_IDS)) IDS ON ELA.ID = IDS.ID
	inner join RAYEN_LABORATORIO..ATFM_ATENCION_FORMULARIO ATFM with (nolock) on ATFM.IDATENCION = ELA.ATEN_ID and ela.MFRM_ID = ATFM.MFRM_ID
	inner join RAYEN_META_DATOS..RL_MFRM_MCAM RL_MM with (nolock) on RL_MM.MFRM_ID = ATFM.MFRM_ID
	inner join RAYEN_META_DATOS..MCAM_META_CAMPO MCAM with (nolock) on MCAM.ID = RL_MM.MCAM_ID
	order by ELA.ID desc

	declare @sql NVARCHAR(max), @TIPO_DATO smallint, @cont smallint = 0, @rowMax int, @nombreTabla sysname
	declare @tiposDatos table (row int identity, TIPO_DATO smallint)

	insert into @tiposDATOS (TIPO_DATO)
	select distinct MCAM_TIPODATO from #MCAM_FILTRADOS
	set @rowMax = SCOPE_IDENTITY()

	CREATE TABLE #RESULTADOS
	(
		USP_ID int,
		ATEN_ID int,
		DESCRIPCION sysname,
		DESCRIPCION_RESULTADO varchar(1000),
		RESULTADO varchar(max),
		DATOS_ADICIONALES_XML xml,
		FECHA datetime
	)

	while @cont < @rowMax
	begin
		set @cont += 1
		select @TIPO_DATO = TIPO_DATO from @tiposDatos where row = @cont
		
		select @nombreTabla = case @TIPO_DATO 
								when 0 then 'VLST_VALOR_ENTERO_LISTA'
								when 1 then 'VALF_VALOR_ALFA'
								when 2 then 'VBOO_VALOR_BOOL'
								when 3 then 'VENT_VALOR_ENTERO'
								when 4 then 'VFEC_VALOR_FECHA'
								when 5 then 'VFEC_VALOR_FECHA'
								when 6 then 'VNUM_VALOR_NUMERICO'
								when 7 then 'VLST_VALOR_ENTERO_LISTA' --g
								when 8 then 'VALF_VALOR_ALFA' end
		
		IF(@TIPO_DATO != 7)
		begin
			set @sql = N'
			insert into #RESULTADOS (USP_ID, ATEN_ID, DESCRIPCION, DESCRIPCION_RESULTADO, RESULTADO, DATOS_ADICIONALES_XML, FECHA)
			SELECT DISTINCT
			valor.USP_ID,
			valor.ATEN_ID,
			alf.MCAM_ETIQUETA,
			alf.MCAM_EXPLICACION,
			<VALOR>,
			cast(valor.ATRIBUTO as nvarchar(max)),
			valor.fecha
			FROM RAYEN_LABORATORIO..<TABLA_VALOR> valor
			INNER JOIN #MCAM_FILTRADOS ALF ON valor.MCAM_ID=ALF.MCAM_ID and valor.USP_ID=ALF.USP_ID and valor.ATEN_ID=ALF.ATEN_ID and valor.MFRM_ID=ALF.MFRM_ID
			where
				VALOR.ELIMINADO = 0
			Group by 
				valor.USP_ID,
				valor.ATEN_ID,
				alf.MCAM_ETIQUETA,
				alf.MCAM_EXPLICACION,
				<VALOR>,
				convert(nvarchar(max),valor.ATRIBUTO),
				valor.FECHA'
			set @sql = REPLACE(@sql, '<TABLA_VALOR>', @nombreTabla);
			if (@TIPO_DATO = 2)
				set @sql = REPLACE(@sql, '<VALOR>', 'case when VALOR.VALOR = 1 then ''SI'' else ''NO'' end')
			else if (@TIPO_DATO = 4)
				set @sql = REPLACE(@sql, '<VALOR>', 'convert(varchar,VALOR.VALOR,105)');
			else if (@TIPO_DATO = 5)
				set @sql = REPLACE(@sql, '<VALOR>', 'convert(varchar,VALOR.VALOR,105) + '' '' + convert(varchar,VALOR.VALOR,108)');
			else if (@TIPO_DATO = 6)
			begin
				set @sql = REPLACE(@sql, '<VALOR>', 'case
													when VALOR.MCAM_ID = 422 then
													replace(CAST(VALOR.VALOR as decimal(18,2)),''.'','','')
													else
													replace(CAST(VALOR.VALOR as varchar),''.'','','')
													end');
			end
			else if (@TIPO_DATO = 0)
				set @sql = REPLACE(@sql, '<VALOR>', 'VLIS.DESCRIPCION');
			else
				set @sql = REPLACE(@sql, '<VALOR>', 'VALOR.VALOR');
				
			if (@TIPO_DATO = 0)
				set @sql = REPLACE(@sql, '<valorLista>', 'LEFT JOIN RAYEN_META_DATOS..VLIS_VALOR_LISTA VLIS ON VALOR.VALOR = VLIS.ID' + CHAR(13));
			else
				set @sql = REPLACE(@sql, '<valorLista>', '');

			begin try
				EXECUTE sp_executesql @sql
			end try
			begin catch
				print @sql
				print error_message()
			end catch
		end
	end
	
	select distinct 
	USP_ID,
	ATEN_ID,
	DESCRIPCION,
	DESCRIPCION_RESULTADO,
	RESULTADO,
	cast(DATOS_ADICIONALES_XML.value('(/DatosAdicionales//Unidad/node())[1]', 'varchar(500)') as varchar(max)) AS UNIDAD_MEDIDA,
	cast(DATOS_ADICIONALES_XML.value('(/DatosAdicionales//MinReferencia/node())[1]', 'varchar(500)') as varchar(max)) AS VALORES_REFERENCIA_MIN,
	cast(DATOS_ADICIONALES_XML.value('(/DatosAdicionales//MaxReferencia/node())[1]', 'varchar(500)') as varchar(max)) AS VALORES_REFERENCIA_MAX,
	cast(DATOS_ADICIONALES_XML.value('(/DatosAdicionales//Referencia/node())[1]', 'varchar(500)') as varchar(max)) AS Referencia,
	FECHA
	from #RESULTADOS
	drop table #RESULTADOS
	drop table #MCAM_FILTRADOS

END
GO
