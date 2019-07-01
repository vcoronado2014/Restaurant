USE [RAYEN]
GO

/****** Object:  StoredProcedure [dbo].[REP0082_VALOR_ATENCION_LARGO_ALCANCE]    Script Date: 13-10-2016 16:49:44 ******/
DROP PROCEDURE [dbo].[REP0082_VALOR_ATENCION_LARGO_ALCANCE]
GO

/****** Object:  StoredProcedure [dbo].[REP0082_VALOR_ATENCION_LARGO_ALCANCE]    Script Date: 13-10-2016 16:49:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/************************************************************************                              
NOMBRE DEL PROCEDIMIENTO	: REP0082_VALOR_ATENCION_LARGO_ALCANCE                               
AUTOR						: 
FECHA DE CREACIÓN			: 
BASE DE DATOS				: RAYEN                             

OBJETIVO					:

FECHA DE MODIFICACIÓN		: 28-06-2016
USUARIO DE MODIFICACIÓN		: Corrige error en reporte de impresion de formularios clinicos
MOTIVO DE MODIFICACIÓN		: Jaime León

FECHA DE MODIFICACIÓN		: 13-10-2016
USUARIO DE MODIFICACIÓN		: Corrige error por rechazo de QA en preproducción, se cambio inner join por left join 
							: para que considerara todos los datos de las atención que debe procesar.
MOTIVO DE MODIFICACIÓN		: Víctor Coronado.

VISADO POR (QA)  			:   
FECHA APROBACIÓN QA 		:   
COMENTARIOS QA     			:                             

VISADO POR (DBA)  			:   
FECHA APROBACIÓN DBA 		:   
COMENTARIOS DBA     		:                
                              
TABLAS INVOLUCRADAS 		:
***********************************************************************/
CREATE procedure [dbo].[REP0082_VALOR_ATENCION_LARGO_ALCANCE]
(
	@usuarioAtencion as UsuarioAtencionFormulario readonly,
	@camposFormulario as MetacamposDesdeFormulario readonly,
	@nod_id int,
	@mfrm_id int,
	@INI int,
	@FIN int
)
as
begin

		
	declare @sql NVARCHAR(max), @TIPO_DATO smallint, @cont smallint = 0, @rowMax int, @nombreTabla sysname
	declare @tiposDatos table (row int identity, TIPO_DATO smallint)

	CREATE TABLE #RESULTADOS
	(
		USP_ID int,
		ATEN_ID int,
		DESCRIPCION sysname,
		VALOR varchar(5000),
		FECHA datetime,
		ESNULO smallint
	)
	
	insert into @tiposDATOS (TIPO_DATO)
	select distinct TIPO_DATO from @camposFormulario
	set @rowMax = SCOPE_IDENTITY()
	
	
	DECLARE @ParmDefinition nvarchar(500);
	set @ParmDefinition = N'@VAR_NOD_ID int, @VAR_MFRM_ID int, @VAR_INI int, @VAR_FIN int, @usuarioAtencionTabla as UsuarioAtencionFormulario readonly, @camposFormularioTabla as MetacamposDesdeFormulario readonly'
	
	
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
								when 7 then 'VLST_VALOR_ENTERO_LISTA' --
								when 8 then 'VALF_VALOR_ALFA' end
		
		IF(@TIPO_DATO != 7)
		begin
			set @sql = N'
			insert into #RESULTADOS (USP_ID, VALOR, DESCRIPCION, ATEN_ID, FECHA, ESNULO)
			SELECT
			VALOR.USP_ID,
			<VALOR>,
			alf.Descripcion ETIQUETA,
			0 ATEN_ID,
			VALOR.FECHA,
			VALOR.ESNULO
			FROM RAYEN_DATOS_CLINICOS..<TABLA_VALOR> VALOR
			LEFT JOIN (SELECT 
							VALOR.USP_ID,
							VALOR.MCAM_ID,
							MAX (VALOR.FECHA) AS FECHA
						FROM RAYEN_DATOS_CLINICOS..<TABLA_VALOR> VALOR
							 INNER JOIN @usuarioAtencionTabla ATEN ON VALOR.USP_ID=ATEN.USP_ID and (VALOR.FECHA <= ATEN.FECHA_ATENCION or ATEN.ATEN_ID = VALOR.ATEN_ID)
						WHERE
							NOD_ID = @VAR_NOD_ID AND
							MFRM_ID = @VAR_MFRM_ID AND
							FECHA_ENTERA <= convert(varchar, aten.FECHA_ATENCION,112) and
							VALOR.ELIMINADO = 0
						GROUP BY
						VALOR.USP_ID,VALOR.MCAM_ID) AS RESUL ON VALOR.USP_ID = RESUL.USP_ID AND VALOR.FECHA = RESUL.FECHA AND VALOR.MCAM_ID=RESUL.MCAM_ID
			INNER JOIN @camposFormularioTabla ALF ON VALOR.MCAM_ID=ALF.MCAM_ID
			--INNER JOIN @usuarioAtencionTabla ATEN ON VALOR.USP_ID=ATEN.USP_ID --and valor.FECHA = ATEN.FECHA_ATENCION
			<valorLista>
			where
			VALOR.MFRM_ID = @VAR_MFRM_ID 
			AND NOD_ID = @VAR_NOD_ID 
			and VALOR.ELIMINADO = 0
			and valor.esnulo = 0
			Group by 
			VALOR.USP_ID,
			<VALOR>,
			alf.Descripcion, VALOR.FECHA ,VALOR.ESNULO'
			
			
			set @sql = REPLACE(@sql, '<TABLA_VALOR>', @nombreTabla);
			if (@TIPO_DATO = 2)
				set @sql = REPLACE(@sql, '<VALOR>', 'case when VALOR.VALOR = 1 then ''SI'' else ''NO'' end')
			else if (@TIPO_DATO = 4)
				set @sql = REPLACE(@sql, '<VALOR>', 'convert(varchar,VALOR.VALOR,105)');
			else if (@TIPO_DATO = 5)
				set @sql = REPLACE(@sql, '<VALOR>', 'convert(varchar,VALOR.VALOR,105) + '' '' + convert(varchar,VALOR.VALOR,108)');
			else if (@TIPO_DATO = 0)
				set @sql = REPLACE(@sql, '<VALOR>', 'VLIS.DESCRIPCION');
			else
				set @sql = REPLACE(@sql, '<VALOR>', 'VALOR.VALOR');
				
			if (@TIPO_DATO = 0)
				set @sql = REPLACE(@sql, '<valorLista>', 'LEFT JOIN RAYEN_META_DATOS..VLIS_VALOR_LISTA VLIS ON VALOR.VALOR = VLIS.ID' + CHAR(13));
			else
				set @sql = REPLACE(@sql, '<valorLista>', '');
			
			begin try
			EXECUTE sp_executesql @sql, @ParmDefinition, 
                      @VAR_NOD_ID = @nod_id, 
                      @VAR_MFRM_ID = @mfrm_id, 
                      @VAR_INI = @INI, 
                      @VAR_FIN = @FIN, 
                      @usuarioAtencionTabla = @usuarioAtencion, 
                      @camposFormularioTabla = @camposFormulario
			end try
			begin catch
				print @sql
				print error_message()
			end catch
		end
	end
	
	select  
				USP_ID,
				ATEN_ID,
				DESCRIPCION,
				STUFF((
						SELECT DISTINCT
						',' + VALOR			
						FROM #RESULTADOS RES 
						WHERE RES.DESCRIPCION = RESULTADOS.DESCRIPCION and RES.USP_ID = RESULTADOS.USP_ID AND RES.ATEN_ID = RESULTADOS.ATEN_ID 
						FOR XML PATH('')			
				),1,1,'') AS VALOR,
				MAX(FECHA) AS FECHA 
		from #RESULTADOS RESULTADOS
		GROUP BY 
				USP_ID,
				ATEN_ID,
				DESCRIPCION	
				
	drop table #RESULTADOS
end



GO

