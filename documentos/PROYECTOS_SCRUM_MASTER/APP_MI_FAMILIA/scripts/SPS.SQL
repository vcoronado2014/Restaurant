USE [RAYEN]
GO
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MFA0001]') AND type = N'P') 
	--Se crea encabezado vacio del SP en caso de ser nuevo
	exec('CREATE PROCEDURE [dbo].[MFA0001] AS BEGIN SET NOCOUNT ON; END')
GO
/****** Object:  StoredProcedure [dbo].[MFA0001]    Script Date: 06-07-2018 16:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************                              
NOMBRE DEL PROCEDIMIENTO	: MFA0001                              
AUTOR						: Víctor Coronado
FECHA DE CREACIÓN			: 06-07-2017 
BASE DE DATOS				: RAYEN                        

OBJETIVO					: Obtiene las atenciones realizadas a un Usuario APS para mi Familia

FECHA DE MODIFICACIÓN		: 17-07-2018
USUARIO DE MODIFICACIÓN	: 		Victor Coronado
MOTIVO DE MODIFICACIÓN		: Se agrega el atenId para poder unir los farmacos en uso

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
	select 
	diag.CODIGO_ESTANDAR, 
	diag.DESCRIPCION, 
	aten.FECHA_HORA_INICIO, 
	tda.NOMBRE,
	aten.ID
	from DATE_DIAGNOSTICOS_ATENCION dated
	inner join ATEN_ATENCION aten on dated.ATEN_ID = aten.Id
	inner join DIAG_DIAGNOSTICO diag on dated.DIAG_ID = diag.ID
	inner join CIT_CITA cit on cit.ID = aten.CIT_ID
	inner join TDA_TIPO_DE_ATENCION tda on tda.ID = cit.TDA_ID
	where dated.USP_ID = @USP_ID and dated.ESTADO_DIAGNOSTICO = 2 and dated.ELIMINADO = 0
end

GO
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MFA0003]') AND type = N'P') 
	--Se crea encabezado vacio del SP en caso de ser nuevo
	exec('CREATE PROCEDURE [dbo].[MFA0003] AS BEGIN SET NOCOUNT ON; END')
GO
/****** Object:  StoredProcedure [dbo].[MFA0003]    Script Date: 06-07-2018 16:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************                              
NOMBRE DEL PROCEDIMIENTO	: MFA0003                              
AUTOR						: Víctor Coronado
FECHA DE CREACIÓN			: 17-07-2017 
BASE DE DATOS				: RAYEN                        

OBJETIVO					: Obtiene los farmacos de 

FECHA DE MODIFICACIÓN		: 17-07-2018
USUARIO DE MODIFICACIÓN	: 		Victor Coronado
MOTIVO DE MODIFICACIÓN		: Extrae información sobre medicamentos entregados por USP_ID.

VISADO POR (QA)  		:   
FECHA APROBACIÓN QA 		:   
COMENTARIOS QA     		:                             

VISADO POR (DBA)  		:   
FECHA APROBACIÓN DBA 		:   
COMENTARIOS DBA     		:                
                              
TABLAS INVOLUCRADAS 		: RCTA_RECETA
                          PRES_PRESCRIPCION 
		                  UNIA_UNIDAD_ADMINISTRACION
		                  UNID_UNIDAD
		                  ATEN_ATENCION
		                  INS_INSTRUMENTO
		                  FNP_FUNCIONARIO_PRESTADOR	

***********************************************************************/
alter procedure [dbo].[MFA0003]
(
	@USP_ID INT,
	@FECHA_INICIO INT,
	@FECHA_TERMINO INT
)
AS
BEGIN
	declare @intervalos table (id int, descripcion varchar(20) collate Modern_Spanish_CI_AI)
	insert into @intervalos (descripcion, id) values 
	('Ninguna',0),
	('segundos',1),
	('minutos',2),
	('horas',3),
	('días',4),
	('semanas',5),
	('meses',6),
	('anos',7),
	('veces',8)

	SELECT  
		RCTA.ID, RCTA.rcta_id RECETA_ID, RCTA.estado ESTADO,
		CASE WHEN pres.descripcion = '' OR pres.descripcion IS NULL THEN 
									 DESCRIPCION_ARTICULO+ ' : '+LTRIM(STR(DOSIS_UNITARIA))+' '+ unid.DESCRIPCION + ' cada '+LTRIM(STR(INTERVALO))+' '+inter.descripcion+ ' por '+LTRIM(STR(DURACION_DIAS))+' '+Duracion.descripcion 
		else pres.descripcion    
		END DESCRIPCION, 
		LTRIM(STR(PRES.TOTAL_RECETADO - PRES.SALDO_PENDIENTE))+' '+ unid.DESCRIPCION CANTIDAD,
		RCTA.FECHA_GENERACION	FECHA_ENTREGA,
		LTRIM(STR(PRES.SALDO_PENDIENTE))+' '+ unid.DESCRIPCION PENDIENTE,
		LTRIM(STR(PRES.DOSIS_UNITARIA))+' '+ unid.DESCRIPCION DOSIS_UNITARIA,
		'Cada '+ LTRIM(STR(INTERVALO)) +' '+inter.descripcion Cada_Cuanto,
		LTRIM(STR(DURACION_DIAS))+' '+Duracion.descripcion Duracion,
		case when isnull(aten.INS_ID,0) != 0 then ins.NOMBRE else 'Sin Atención' end Profesional,
		case when isnull(aten.FNP_ID,0) != 0 then 'Dr(a): ' + fnp1.NOMBRES + ' ' + fnp1.APELLIDO_PATERNO else 'Dr(a): ' + fnp2.NOMBRES + ' ' + fnp2.APELLIDO_PATERNO end Profesional,
		ATEN.ID ATEN_ID
	FROM 
		RCTA_RECETA RCTA WITH (NOLOCK)
		INNER JOIN PRES_PRESCRIPCION PRES WITH (NOLOCK) ON PRES.RCTA_ID = RCTA.ID  
		left join UNIA_UNIDAD_ADMINISTRACION unia with (nolock) on unia.ID = pres.UNIA_ID
		left join UNID_UNIDAD unid with (nolock) on unid.ID = unia.UNID_ID
		left join @intervalos inter on inter.id = TIPO_UNIDAD_INTERVALO
		left join @intervalos Duracion on Duracion.id = TIPO_UNIDAD_DURACION	
		left join ATEN_ATENCION aten on aten.ID = RCTA.ATEN_ID
		left join INS_INSTRUMENTO ins on ins.ID = aten.INS_ID
		left join FNP_FUNCIONARIO_PRESTADOR fnp1 on fnp1.ID = aten.FNP_ID
		left join FNP_FUNCIONARIO_PRESTADOR fnp2 on fnp2.ID = RCTA.FNP_ID
	WHERE 
		RCTA.ELIMINADO = 0 
	AND 1 = (SELECT TOP 1 1 FROM PRES_PRESCRIPCION PRES WHERE PRES.RCTA_ID = RCTA.ID) 
	AND RCTA.FECHA_GENERACION_ENTERA >= @FECHA_INICIO AND RCTA.FECHA_GENERACION_ENTERA < = @FECHA_TERMINO  
	AND RCTA.USP_ID = @USP_ID 
	AND RCTA.ES_EXTERNA = 0 
	AND RCTA.RCTA_ID IS NULL
	AND RCTA.ESTADO NOT IN(2,4)
END

GO