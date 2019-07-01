USE [BDWebLun]
GO
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LGU0002]') AND type = N'P') 
	--Se crea encabezado vacio del SP en caso de ser nuevo
	exec('CREATE PROCEDURE [dbo].[LGU0002] AS BEGIN SET NOCOUNT ON; END')
GO
/****** Object:  StoredProcedure [dbo].[LGU0002]    Script Date: 21-05-2018 16:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************
NOMBRE DEL PROCEDIMIENTO: LGU0002
AUTOR: Victor Coronado
FECHA DE CREACIÓN: 25/05/2018
BASE DE DATOS: BDWEBLUN
OBJETIVO: ACTUALIZA UN ELEMENTO EN LA TABLA LGU_LOGIN_USUARIO
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


ALTER procedure LGU0002
(
       @NOMBRE_USUARIO VARCHAR(250),
       @ECOL_ID INT,
       @ROL varchar(250),
       @TOKEN VARCHAR(500),
	   @TOKEN_NUEVO VARCHAR(500)
)
AS
BEGIN



UPDATE [dbo].[LGU_LOGIN_USUARIO]
   SET 
      [NOMBRE_USUARIO] = @NOMBRE_USUARIO
      ,[ECOL_ID] = @ECOL_ID
      ,[ROL] = @ROL
      ,[TOKEN] = @TOKEN_NUEVO
      
 WHERE ECOL_ID = @ECOL_ID AND NOMBRE_USUARIO = @NOMBRE_USUARIO AND ROL = @ROL AND TOKEN = @TOKEN



END
