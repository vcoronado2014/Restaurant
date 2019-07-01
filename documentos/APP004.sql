USE [RAYEN]
GO
------------------------------------------------------------------------------------------
-- Seccion de creacion de PROCEDIMIENTOS ALMACENADOS
------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[APP0004]') AND type in (N'P', N'PC'))
exec('CREATE procedure [dbo].[APP0004] AS BEGIN SET NOCOUNT ON; END')
GO
/************************************************************************
NOMBRE DEL PROCEDIMIENTO	: APP0004
AUTOR						: JUAN CARLOS VILLALOBOS JARA
FECHA DE CREACIÓN			: 2017-11-30
BASE DE DATOS				: RAYEN

OBJETIVO					: LEER DE LA TABLA ELA_EXAMEN_LABORATORIO POR ELA_ID

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
ALTER PROCEDURE [dbo].[APP0004]
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
		ELA.ATEN_ID as IDATENCION,
		ELA.USP_ID as IDUSUARIOAPS,
		ELA.MFRM_ID,
		MCAM.ID,
		MCAM.ETIQUETA as NOMBRE,
		ISNULL(NULLIF(MCAM.EXPLICACION, ''), MCAM.ETIQUETA) as MCAM_EXPLICACION,
		MCAM.TIPODATO as TIPO_DATO
	from 
	ELA_EXAMEN_LABORATORIO ELA with (nolock)
	inner join (SELECT ID FROM OBTENER_ID(@ELA_IDS)) IDS ON ELA.ID = IDS.ID
	--inner join RAYEN_LABORATORIO..ATFM_ATENCION_FORMULARIO ATFM with (nolock) on ATFM.IDATENCION = ELA.ATEN_ID and ela.MFRM_ID = ATFM.MFRM_ID
	inner join RAYEN_META_DATOS..RL_MFRM_MCAM RL_MM with (nolock) on RL_MM.MFRM_ID = ELA.MFRM_ID
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