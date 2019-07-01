USE [RAYEN]
GO
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AGW0002]') AND type = N'P') 
	--Se crea encabezado vacio del SP en caso de ser nuevo
	exec('CREATE PROCEDURE [dbo].[AGW0002] AS BEGIN SET NOCOUNT ON; END')
GO
/****** Object:  StoredProcedure [dbo].[AGW0002]    Script Date: 21-05-2018 16:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/************************************************************************
NOMBRE DEL PROCEDIMIENTO: AGW0002
AUTOR: Gonzalo Carrasco
FECHA DE CREACIÓN: 08/04/2016
BASE DE DATOS: AGENDAWEB
OBJETIVO: Inserta telefonos a un paciente
FECHA DE MODIFICACIÓN: 
USUARIO DE MODIFICACIÓN:  
MOTIVO DE MODIFICACIÓN: 
----------------------------------------------------------------------------------------------
FECHA DE MODIFICACIÓN: 20/05/2018
USUARIO DE MODIFICACIÓN: VICTOR CORONADO
MOTIVO DE MODIFICACIÓN: SE CONTROLA RESPUESTA -1 Al EXISTIR EL TELEFONO DEL USP
-----------------------------------------------------------------------------------------------
VISADO POR (QA): 
FECHA APROBACIÓN QA: 
COMENTARIOS QA: 
VISADO POR (DBA): 
FECHA APROBACIÓN DBA: 
COMENTARIOS DBA: 
TABLAS INVOLUCRADAS: TUS_TELEFONO_USUARIO
***********************************************************************/

ALTER PROCEDURE [dbo].[AGW0002]      
(       
@TELEFONO_DESCRIPCION VARCHAR(50),    
@TIPO_TELEFONO INT,    
@ETIQUETA_TELEFONO VARCHAR(50),    
@USP_ID INT,    
@CODIGO_PAIS VARCHAR(10),    
@CODIGO_AREA VARCHAR(10),    
@RESPUESTA INT OUT    
    
)      
AS      
BEGIN      
      
       DECLARE @TELEFONO varchar(20);
       DECLARE @CODIGOAREA INT;

       IF NOT EXISTS ( SELECT ID FROM [dbo].[TUS_TELEFONO_USUARIO] WHERE ETIQUETA_TELEFONO = @ETIQUETA_TELEFONO AND USP_ID = @USP_ID)  
       BEGIN  

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

       INSERT INTO [dbo].[TUS_TELEFONO_USUARIO]    
                       ([TELEFONO_DESCRIPCION]    
                       ,[TIPO_TELEFONO]    
                       ,[ETIQUETA_TELEFONO]    
                       ,[USP_ID]    
                       ,[ELIMINADO]    
                       ,[CODIGO_PAIS]    
                       ,[CODIGO_AREA]
                ,[FECHA_HORA_SERVIDOR]
                ,[FECHA_HORA_SERVIDOR_ENTERA])    
              VALUES    
                       (@TELEFONO    
                       ,@TIPO_TELEFONO    
                       ,@ETIQUETA_TELEFONO    
                       ,@USP_ID    
                       ,0    
                       ,@CODIGO_PAIS    
                       ,@CODIGOAREA
                ,GETDATE()
                ,(convert(bigint,year(GETDATE()))*10000000000+month(GETDATE())*100000000+day(GETDATE())*1000000+DATEPART(HOUR, GETDATE())*10000+DATEPART(MINUTE, GETDATE())*100+DATEPART(SECOND, GETDATE())))
               
       SET @RESPUESTA = SCOPE_IDENTITY();    
    
       SELECT @RESPUESTA AS RESPUESTA    
       END

       IF ( @TELEFONO_DESCRIPCION <> '' AND @ETIQUETA_TELEFONO = 'MOVIL_FICHA_FAMILIAR')
       BEGIN

       INSERT INTO [dbo].[TUS_TELEFONO_USUARIO]    
                       ([TELEFONO_DESCRIPCION]    
                       ,[TIPO_TELEFONO]    
                       ,[ETIQUETA_TELEFONO]    
                       ,[USP_ID]    
                       ,[ELIMINADO]    
                       ,[CODIGO_PAIS]    
                       ,[CODIGO_AREA]
                ,[FECHA_HORA_SERVIDOR]
                ,[FECHA_HORA_SERVIDOR_ENTERA])    
              VALUES    
                       (CONVERT(INTEGER, SUBSTRING(@TELEFONO_DESCRIPCION,2,8))
                       ,@TIPO_TELEFONO    
                       ,@ETIQUETA_TELEFONO    
                       ,@USP_ID    
                       ,0    
                       ,@CODIGO_PAIS    
                       ,9
               ,GETDATE()
                ,(convert(bigint,year(GETDATE()))*10000000000+month(GETDATE())*100000000+day(GETDATE())*1000000+DATEPART(HOUR, GETDATE())*10000+DATEPART(MINUTE, GETDATE())*100+DATEPART(SECOND, GETDATE())))
               
       SET @RESPUESTA = SCOPE_IDENTITY();    
    
       SELECT @RESPUESTA AS RESPUESTA    
       END

       END  
       ELSE  
       BEGIN  
             declare @ID_TUS int
             set @ID_TUS = (SELECT ID FROM [dbo].[TUS_TELEFONO_USUARIO] WHERE ETIQUETA_TELEFONO = @ETIQUETA_TELEFONO AND USP_ID = @USP_ID)

             if @ID_TUS > 0
                    begin
                           -- debemos actualizar
                           --select * from TUS_TELEFONO_USUARIO
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
                           update [dbo].[TUS_TELEFONO_USUARIO] set 
                           TELEFONO_DESCRIPCION = @TELEFONO,
                           TIPO_TELEFONO = @TIPO_TELEFONO,
                           ETIQUETA_TELEFONO = @ETIQUETA_TELEFONO,
                           USP_ID = @USP_ID,
                           ELIMINADO = 0,
                           CODIGO_PAIS = @CODIGO_PAIS,
                           CODIGO_AREA = @CODIGO_AREA,
                           FECHA_HORA_SERVIDOR = GETDATE(),
                           FECHA_HORA_SERVIDOR_ENTERA = (convert(bigint,year(GETDATE()))*10000000000+month(GETDATE())*100000000+day(GETDATE())*1000000+DATEPART(HOUR, GETDATE())*10000+DATEPART(MINUTE, GETDATE())*100+DATEPART(SECOND, GETDATE()))
                           where
                           ID = @ID_TUS

                           --respuesta

                           SET @RESPUESTA = @ID_TUS    
    
                           SELECT @RESPUESTA AS RESPUESTA   

                    end
                    else
                    begin
                    --enviamos -1
                           SET @RESPUESTA = -1    
    
                           SELECT @RESPUESTA AS RESPUESTA    
                    end

       END  
    
END

end



GO


