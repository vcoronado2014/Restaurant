USE RAYEN 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REP0087]') AND type = N'P') 
	exec('CREATE PROCEDURE [dbo].[REP0087] AS BEGIN SET NOCOUNT ON; END')
GO
/************************************************************************                              
NOMBRE DEL PROCEDIMIENTO	: REP0087                               
AUTOR						: 
FECHA DE CREACI‡N			: 
BASE DE DATOS				: RAYEN                             

OBJETIVO					: Reporte Inasistentes a la entrega de alimentos

FECHA DE MODIFICACI‡N		: 2016-06-20
USUARIO DE MODIFICACI‡N		: ILICH LETELIER
MOTIVO DE MODIFICACI‡N		: SE CONSUME TELEFONO DE TUS

FECHA DE MODIFICACI‡N		: 2016-06-22
USUARIO DE MODIFICACI‡N		: VICTOR CORONADO
MOTIVO DE MODIFICACI‡N		: SE CONSUME TELEFONO DE TUS Y SE AGREGAN MEJORAS A LA QUERY

FECHA DE MODIFICACI‡N		: 2016-07-08
USUARIO DE MODIFICACI‡N		: VICTOR CORONADO
MOTIVO DE MODIFICACI‡N		: SE MODIFICA QUERY DEBIDO A RECHAZO POR CORTE DEL NUMERO DE TELEFONO

VISADO POR (QA)  			:   
FECHA APROBACI‡N QA 		:   
COMENTARIOS QA     			:                             

VISADO POR (DBA)  			:   
FECHA APROBACI‡N DBA 		:   
COMENTARIOS DBA     		:                
                              
TABLAS INVOLUCRADAS 		:EALI_ENTREGA_ALIMENTO, FAM_FAMILIA, bode_bodega, usp_usuario_aps
***********************************************************************/
ALTER procedure [dbo].[REP0087]
(
--declare
	@PALI_ID  int = NULL,
	@NOD_ID int,
	@BOD_ID int = NULL,
	@FECHA_INICIO datetime,
	@FECHA_TERMINO  datetime, 
	@EDAD_INICIO int = NULL,
	@EDAD_TERMINO int = NULL  	
)
AS 
BEGIN
DECLARE @FECHA_INICIO_entera int, @FECHA_TERMINO_entera int

IF (@EDAD_INICIO = 0)
BEGIN
	SET @EDAD_INICIO = 0	
END

IF (@EDAD_TERMINO = 0)
BEGIN	
	SET @EDAD_TERMINO = 150000000
END

set @FECHA_INICIO_entera = CONVERT(varchar, @FECHA_INICIO, 112)
set @FECHA_TERMINO_entera = CONVERT(varchar, @FECHA_TERMINO, 112)

create table #EALI_ENTREGA_ALIMENTO
(
	USP_ID int, 
	NOD_ID int,
	PALI_ID int,
	BODE_ID int, 
	FECHA_PROXIMO_DESPACHO datetime,
	EDAD_USUARIO int
)
insert into #EALI_ENTREGA_ALIMENTO
select 
	usp_id,
	NOD_ID,
	PALI_ID, 
	BODE_ID, 
	FECHA_PROXIMO_DESPACHO, 	
	EDAD_USUARIO
from 
	EALI_ENTREGA_ALIMENTO with(nolock)
where 
	NOD_ID = @nod_id and
	FECHA_PROXIMO_DESPACHO_ENTERA between @FECHA_INICIO_entera and @FECHA_TERMINO_entera 
	
create table #USUARIOS (USP_ID int)
insert into #USUARIOS
select USP_ID from EALI_ENTREGA_ALIMENTO with (nolock) where eliminado=0   	
	AND NOD_ID=@nod_id  AND FECHA_ENTERA between @FECHA_INICIO_entera AND @FECHA_TERMINO_entera


select 
	(NOMBRES + ' ' + APELLIDO_PATERNO + ' ' + APELLIDO_MATERNO) as NombreUsuario,
	RUT,
	FECHA_DE_NACIMIENTO as FechaNacimiento, 
	dbo.edad_exacta(FECHA_DE_NACIMIENTO,getdate()) as EdadActual,
	(DIRECCION + ' '+ usp1.CASA + ' ' +  VILLA_O_POBLACION) as direccion,
	--cambiado por victor coronado
	--(usp_usuario_aps.TELEFONO1 + ' ' + usp_usuario_aps.TELEFONO2) as fono,
	REPLACE(
	REPLACE(
	ISNULL(STUFF((SELECT ' - '+ (
	case when CODIGO_PAIS is null then '' when CODIGO_PAIS = '0' then '' 
		when TELEFONO_DESCRIPCION is null then '' 
		when TELEFONO_DESCRIPCION = '0' then ''
		when len(TELEFONO_DESCRIPCION) < 5 then ''
	 else convert(varchar(50),CODIGO_PAIS) end  
	+ case when CODIGO_AREA is null then '' when CODIGO_AREA = '0' then '' when CODIGO_AREA = '00' then '' 
		when TELEFONO_DESCRIPCION is null then '' 
		when TELEFONO_DESCRIPCION = '0' then ''
		when len(TELEFONO_DESCRIPCION) < 5 then ''
	else convert(varchar(50),CODIGO_AREA) end
	+ case when TELEFONO_DESCRIPCION is null then '' when len(TELEFONO_DESCRIPCION) < 5 then '' else TELEFONO_DESCRIPCION end
	) 
	FROM TUS_TELEFONO_USUARIO TUS
	--WHERE TUS.TIPO_TELEFONO IN (1,2,3,4) and TUS.ELIMINADO = 0 and tus.USP_ID = usp1.ID FOR XML PATH('')), 1,3,''),'SIN INFORMACION'), '20;', ''), '&#x', ' ')  as fono,        
	WHERE TUS.TIPO_TELEFONO IN (1,2,3,4) and TUS.ELIMINADO = 0 and tus.USP_ID = usp1.ID FOR XML PATH('')), 1,1,''),'SIN INFORMACION'), '20;', ''), '&#x', ' ')  as fono,        
		
	sec_sector.nombre as Sector,
	FAM_FAMILIA.CODIGO_FAMILIA as CodigoFamilia,
	FECHA_PROXIMO_DESPACHO as FechaARetirar,
	bode_bodega.nombre as bodega 
from 
	#EALI_ENTREGA_ALIMENTO EALI with (nolock) 
	Inner join usp_usuario_aps usp1  with (nolock) on usp1.id=EALI.USP_ID and usp1.activo=1  
	Inner join FAM_FAMILIA with (nolock) on usp1.FAM_ID=FAM_FAMILIA.id and FAM_FAMILIA.eliminado=0 
	Inner join sec_sector with (nolock) on sec_sector.id=FAM_FAMILIA.sec_id  
	Inner join bode_bodega with (nolock) on bode_bodega.id = EALI.BODE_ID

where 
	sec_sector.eliminado=0 AND 		
	PALI_ID = case when @PALI_ID = 0 then PALI_ID else @PALI_ID end and
	EDAD_USUARIO between  @EDAD_INICIO AND @EDAD_TERMINO  AND 	
	bode_bodega.id = case when @BOD_ID = 0 then BODE_BODEGA.ID else @BOD_ID end and
	usp1.ID not in (select USP_ID from #USUARIOS)
group by  
	usp1.ID,
	NOMBRES,
	APELLIDO_PATERNO,
	APELLIDO_MATERNO,
	RUT,
	FECHA_DE_NACIMIENTO ,
	DIRECCION ,
	usp1.CASA, 
	bode_bodega.NOMBRE,
	VILLA_O_POBLACION,
	usp1.TELEFONO1,
	usp1.TELEFONO2,
	sec_sector.nombre,
	CODIGO_FAMILIA ,
	FECHA_PROXIMO_DESPACHO 


drop table #EALI_ENTREGA_ALIMENTO, #USUARIOS

END


