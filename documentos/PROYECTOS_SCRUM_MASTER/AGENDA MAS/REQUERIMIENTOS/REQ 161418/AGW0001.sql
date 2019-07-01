USE [RAYEN]
GO
/****** Object:  StoredProcedure [dbo].[AGW0001]    Script Date: 23-05-2018 10:39:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/************************************************************************
NOMBRE DEL PROCEDIMIENTO: AGW0001
AUTOR: Gonzalo Carrasco
FECHA DE CREACIÓN: 08/04/2016
BASE DE DATOS: AGENDAWEB
OBJETIVO: Actualiza los emails o telefonos asociados a un paciente
FECHA DE MODIFICACIÓN: 02/05/2016
USUARIO DE MODIFICACIÓN: Francisco Poblete
MOTIVO DE MODIFICACIÓN: Se agregó codigo de area y pais
VISADO POR (QA): 
FECHA APROBACIÓN QA: 
COMENTARIOS QA: 
VISADO POR (DBA): 
FECHA APROBACIÓN DBA: 
COMENTARIOS DBA: 
TABLAS INVOLUCRADAS: USP_USUARIO_APS, TUS_TELEFONO_USUARIO
***********************************************************************/

ALTER PROCEDURE [dbo].[AGW0001]  
(   
 @ID_PACIENTE INT,     
 @EMAIL VARCHAR(MAX),       
 @TELEFONO_DESCRIPCION VARCHAR(MAX),
 @ETIQUETA_TELEFONO VARCHAR(MAX),
 @CODIGO_PAIS INT,
 @CODIGO_AREA INT
)  
AS  
BEGIN  

DECLARE @TELEFONO varchar(20);
DECLARE @CODIGOAREA INT;

IF ( @EMAIL <> '')
BEGIN

UPDATE [dbo].[USP_USUARIO_APS] SET EMAIL = @EMAIL WHERE ID = @ID_PACIENTE

END
  
IF ( @TELEFONO_DESCRIPCION <> '' AND @ETIQUETA_TELEFONO = 'TEL1_FICHA_FAMILIAR')
BEGIN

IF ( CONVERT( INTEGER, SUBSTRING(@TELEFONO_DESCRIPCION, 1, 1) ) = 2)
BEGIN
  SET @TELEFONO = SUBSTRING(@TELEFONO_DESCRIPCION,2, LEN(@TELEFONO_DESCRIPCION) - 1);
  SET @CODIGOAREA = CONVERT(INTEGER, SUBSTRING(@TELEFONO_DESCRIPCION,1,1));
END
IF (CONVERT(INTEGER,SUBSTRING(@TELEFONO_DESCRIPCION, 1, 1)) <> 2)
BEGIN
  SET @TELEFONO = SUBSTRING(@TELEFONO_DESCRIPCION,3,LEN(@TELEFONO_DESCRIPCION)-1);
  SET @CODIGOAREA = CONVERT(INTEGER, SUBSTRING(@TELEFONO_DESCRIPCION,1,2));
END

UPDATE [dbo].[TUS_TELEFONO_USUARIO] 
  SET TELEFONO_DESCRIPCION = @TELEFONO, 
    CODIGO_PAIS = @CODIGO_PAIS, 
    CODIGO_AREA = @CODIGOAREA, 
    FECHA_HORA_SERVIDOR_ENTERA = (convert(bigint,year(GETDATE()))*10000000000+month(GETDATE())*100000000+day(GETDATE())*1000000+DATEPART(HOUR, GETDATE())*10000+DATEPART(MINUTE, GETDATE())*100+DATEPART(SECOND, GETDATE())), 
    FECHA_HORA_SERVIDOR = GETDATE() 
  WHERE USP_ID = @ID_PACIENTE AND 
    ETIQUETA_TELEFONO = @ETIQUETA_TELEFONO

END

IF ( @TELEFONO_DESCRIPCION <> '' AND @ETIQUETA_TELEFONO = 'MOVIL_FICHA_FAMILIAR')
BEGIN

UPDATE [dbo].[TUS_TELEFONO_USUARIO] 
  SET TELEFONO_DESCRIPCION = CONVERT(INTEGER, SUBSTRING(@TELEFONO_DESCRIPCION,2,8)), 
    CODIGO_PAIS = @CODIGO_PAIS, 
    CODIGO_AREA = 9, 
    FECHA_HORA_SERVIDOR_ENTERA = (convert(bigint,year(GETDATE()))*10000000000+month(GETDATE())*100000000+day(GETDATE())*1000000+DATEPART(HOUR, GETDATE())*10000+DATEPART(MINUTE, GETDATE())*100+DATEPART(SECOND, GETDATE())), 
    FECHA_HORA_SERVIDOR = GETDATE() 
  WHERE USP_ID = @ID_PACIENTE AND 
    ETIQUETA_TELEFONO = @ETIQUETA_TELEFONO

END

END





