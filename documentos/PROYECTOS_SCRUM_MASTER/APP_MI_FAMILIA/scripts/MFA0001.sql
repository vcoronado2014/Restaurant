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

