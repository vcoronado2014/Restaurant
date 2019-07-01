USE [BDWebLun]
GO
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LGU0001]') AND type = N'P') 
	--Se crea encabezado vacio del SP en caso de ser nuevo
	exec('CREATE PROCEDURE [dbo].[LGU0001] AS BEGIN SET NOCOUNT ON; END')
GO
/****** Object:  StoredProcedure [dbo].[AGW0001]    Script Date: 21-05-2018 16:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************
NOMBRE DEL PROCEDIMIENTO: LGU0001
AUTOR: Maria Paz Rojas
FECHA DE CREACIÓN: 25/05/2018
BASE DE DATOS: BDWEBLUN
OBJETIVO: INSERTAR UN ELEMENTO EN LA TABLA LGU_LOGIN_USUARIO
FECHA DE MODIFICACIÓN: 
USUARIO DE MODIFICACIÓN: 
MOTIVO DE MODIFICACIÓN: 
VISADO POR (QA): 
FECHA APROBACIÓN QA: 
COMENTARIOS QA: 
VISADO POR (DBA): 
FECHA APROBACIÓN DBA: 
COMENTARIOS DBA: 
TABLAS INVOLUCRADAS: LGU_LOGIN_USUARIO
***********************************************************************/


ALTER procedure LGU0001
(
       @NOMBRE_USUARIO VARCHAR(250),
       @ECOL_ID INT,
       @ROL varchar(250),
       @TOKEN VARCHAR(500)
)
AS
BEGIN


INSERT INTO [dbo].[LGU_LOGIN_USUARIO]
           ([FECHA_HORA_LOGIN]
           ,[NOMBRE_USUARIO]
           ,[ECOL_ID]
           ,[ROL_ID]
           ,[TOKEN]
           ,[FECHA_ENTERA])
     VALUES
           (
            GETDATE()
           ,@NOMBRE_USUARIO
           ,@ECOL_ID 
           ,@ROL 
           ,@TOKEN 
           ,CONVERT(VARCHAR(10), GETDATE(), 112)
                )
END
