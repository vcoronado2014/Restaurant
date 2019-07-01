
USE [BDWebLun]
GO
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RELUN0001]') AND type = N'P') 
	--Se crea encabezado vacio del SP en caso de ser nuevo
	exec('CREATE PROCEDURE [dbo].[RELUN0001] AS BEGIN SET NOCOUNT ON; END')
GO
/****** Object:  StoredProcedure [dbo].[RELUN0001]    Script Date: 01-06-2018 16:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************
NOMBRE DEL PROCEDIMIENTO: RELUN0001
AUTOR: Victor Coronado
FECHA DE CREACIÓN: 05/07/2018
BASE DE DATOS: BDWEBLUN
OBJETIVO: ENTREGA LA CANTIDAD DE LICENCIAS UTILIZADAS PARA UNA ENTIDAD CONTRATANTE DEPENDIENDO EL TIPO CONTRATO
FECHA DE MODIFICACIÓN: 
USUARIO DE MODIFICACIÓN: 
MOTIVO DE MODIFICACIÓN: 
VISADO POR (QA): 
FECHA APROBACIÓN QA: 
COMENTARIOS QA: 
VISADO POR (DBA): 
FECHA APROBACIÓN DBA: 
COMENTARIOS DBA: 
TABLAS INVOLUCRADAS: RELUN_REGISTRO_LUN, RLUN_REBALSE_LUN
***********************************************************************/


ALTER procedure RELUN0001
(
	@ECOL_ID INT
)
AS 
BEGIN
	--OBTENCION DE LOS TIPOS DE CONTRATOS
	DECLARE @TIPO_CONTRATO INT
	SET @TIPO_CONTRATO = (SELECT TIPO_CONTRATANTE FROM ENCO_ENTIDAD_CONTRATANTE_LUN WHERE ID = @ECOL_ID)
	/*
	TIPO_CONTRATO = 0 LUN NOMBRADA
	TIPO_CONTRATO = 1 LICENCIA REASIGNADA
	TIPO_CONTRATO = 2 LICENCIA CONCURRENTE
	*/
	IF (@TIPO_CONTRATO = 0)
		BEGIN
			select COUNT(*) AS UTILIZADAS from RELUN_REGISTRO_LUN where ECOL_ID = @ECOL_ID and ACTIVO = 1 and ELIMINADO = 0 and   (FECHA_BAJA >= GETDATE() or FECHA_BAJA is null)
		END
	IF (@TIPO_CONTRATO = 1)
		BEGIN
			select COUNT(*) AS UTILIZADAS from RELUN_REGISTRO_LUN where ECOL_ID = @ECOL_ID and ACTIVO = 1 and ELIMINADO = 0 and   (FECHA_BAJA >= GETDATE() or FECHA_BAJA is null)
		END
	IF (@TIPO_CONTRATO = 2)
		BEGIN
			SELECT TOTAL_LICENCIAS_INICIAL AS UTILIZADAS FROM RLUN_REBALSE_LUN WHERE ECOL_ID = @ECOL_ID
		END
END

GO
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RELUN0002]') AND type = N'P') 
	--Se crea encabezado vacio del SP en caso de ser nuevo
	exec('CREATE PROCEDURE [dbo].[RELUN0002] AS BEGIN SET NOCOUNT ON; END')
GO
/****** Object:  StoredProcedure [dbo].[RELUN0002]    Script Date: 09-07-2018 16:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************
NOMBRE DEL PROCEDIMIENTO: RELUN0002
AUTOR: Victor Coronado
FECHA DE CREACIÓN: 09/07/2018
BASE DE DATOS: BDWEBLUN
OBJETIVO: modifica una licencia
FECHA DE MODIFICACIÓN: 
USUARIO DE MODIFICACIÓN: 
MOTIVO DE MODIFICACIÓN: 
VISADO POR (QA): 
FECHA APROBACIÓN QA: 
COMENTARIOS QA: 
VISADO POR (DBA): 
FECHA APROBACIÓN DBA: 
COMENTARIOS DBA: 
TABLAS INVOLUCRADAS: RELUN_REGISTRO_LUN
***********************************************************************/


ALTER procedure RELUN0002
(
	@ID INT,
	@RUN_FUNCIONARIO VARCHAR(20),
	@ACTIVO INT,
	@FECHA_ALTA DATETIME,
	@FECHA_BAJA DATETIME,
	@FECHA_CREACION DATETIME,
	@NOMBRE_FUNCIONARIO VARCHAR(500),
	@PRIMER_APELLIDO VARCHAR(500),
	@SEGUNDO_APELLIDO VARCHAR(500),
	@SEXO INT,
	@ECOL_ID INT,
	@ES_SOBRECUPO INT,
	@USUARIO_CREADOR VARCHAR(500),
	@ES_RAYEN int,
	@ES_RAYEN_COMUNITARIO int,
	@ES_FLORENCE int,
	@ELIMINADO INT
)
AS 
BEGIN
	update RELUN_REGISTRO_LUN set 
		RUN_FUNCIONARIO = @RUN_FUNCIONARIO, 
		ACTIVO = 1, 
		ELIMINADO = 0, 
		FECHA_ALTA = @FECHA_ALTA,
		FECHA_BAJA = @FECHA_BAJA, 
		FECHA_CREACION = @FECHA_CREACION, 
		NOMBRE_FUNCIONARIO = @NOMBRE_FUNCIONARIO, 
		PRIMER_APELLIDO = @PRIMER_APELLIDO,
		SEGUNDO_APELLIDO = @SEGUNDO_APELLIDO,  
		SEXO = @SEXO, 
		ECOL_ID = @ECOL_ID, 
		ES_SOBRECUPO = @ES_SOBRECUPO, 
		USUARIO_CREADOR = @USUARIO_CREADOR,
		ES_RAYEN = @ES_RAYEN, 
		ES_RAYEN_COMUNITARIO = @ES_RAYEN_COMUNITARIO, 
		ES_FLORENCE = @ES_FLORENCE
	WHERE 
		ID = @ID
END

GO
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RELUN0003]') AND type = N'P') 
	--Se crea encabezado vacio del SP en caso de ser nuevo
	exec('CREATE PROCEDURE [dbo].[RELUN0003] AS BEGIN SET NOCOUNT ON; END')
GO
/****** Object:  StoredProcedure [dbo].[RELUN0003]    Script Date: 10-07-2018 16:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************
NOMBRE DEL PROCEDIMIENTO: RELUN0003
AUTOR: Victor Coronado
FECHA DE CREACIÓN: 10/07/2018
BASE DE DATOS: BDWEBLUN, RAYEN
OBJETIVO: Bloquear al usuario Lun en Rayen 
FECHA DE MODIFICACIÓN: 
USUARIO DE MODIFICACIÓN: 
MOTIVO DE MODIFICACIÓN: 
VISADO POR (QA): 
FECHA APROBACIÓN QA: 
COMENTARIOS QA: 
VISADO POR (DBA): 
FECHA APROBACIÓN DBA: 
COMENTARIOS DBA: 
TABLAS INVOLUCRADAS: PFU_PERFIL, LGN_LOGIN
***********************************************************************/


ALTER procedure RELUN0003
(
 
 @run_eliminar varchar(20), 
 @ecol_id int
)
AS 
BEGIN

DECLARE

@CONT INT,
@MAX INT,
@RUN_FUNCIONARIO VARCHAR(50),
@USUARIO_REGISTRADOR VARCHAR(100),
@ID_LUN INT,
@TOT_LUN INT,
@NODO_FNP INT,
@COD_DEIS VARCHAR(10)

DECLARE @MAXLUN INT, @CONTLUN INT

declare @ECOL_ID_1 int, @RUN_FUNCIONARIO_1 varchar(20), @USUARIO_REGISTRADOR_1 varchar(200), @ID_LUN_1 int, @COD_DEIS_1 varchar(20), @FECHA_MOVIMIENTO_1 DATETIME, @contador_eliminados int
DECLARE @LUN TABLE (ID INT IDENTITY, ECOL_ID INT, RUN_FUNCIONARIO VARCHAR(50), FECHA_MOVIMIENTO DATETIME, USUARIO_REGISTRADOR VARCHAR(100), ID_LUN INT, COD_DEIS VARCHAR(10))
DECLARE @LUNELIMINAR TABLE (ID INT IDENTITY, ECOL_ID INT, RUN_FUNCIONARIO VARCHAR(50), FECHA_MOVIMIENTO DATETIME, USUARIO_REGISTRADOR VARCHAR(100), ID_LUN INT, COD_DEIS VARCHAR(10))

INSERT INTO @LUNELIMINAR(ECOL_ID, RUN_FUNCIONARIO, FECHA_MOVIMIENTO, USUARIO_REGISTRADOR, ID_LUN, COD_DEIS)
	SELECT
		   lun.ECOL_ID,
		   lun.RUN_FUNCIONARIO,
		   lun.FECHA_MODIFICACION,
		   lun.USUARIO_CREADOR,
		   lun.ID,
		   rl.cod_deis
	FROM
		   BDWebLun..RELUN_REGISTRO_LUN lun inner join
		   rl_nod_ecol rl on lun.ECOL_ID = rl.ECOL_ID
	where 
		   lun.ECOL_ID = @ecol_id and
		   lun.RUN_FUNCIONARIO = @run_eliminar

SELECT @MAXLUN = COUNT(*) FROM @LUNELIMINAR

set @contador_eliminados = 1

SET @CONTLUN = 1

WHILE (@CONTLUN <= @MAXLUN)

BEGIN
	SELECT

		@ECOL_ID_1 = ECOL_ID,

		@RUN_FUNCIONARIO_1 = RUN_FUNCIONARIO,

		@FECHA_MOVIMIENTO_1 = FECHA_MOVIMIENTO,

		@USUARIO_REGISTRADOR_1 = USUARIO_REGISTRADOR,

		@ID_LUN_1 = ID_LUN,

		@COD_DEIS_1 = COD_DEIS

	FROM @LUNELIMINAR  

	WHERE ID = @CONTLUN

       if ((select COUNT(*) from BDWebLun..RL_NOD_ECOL where COD_DEIS = @COD_DEIS_1) > 1)
	   --si existe mas de una entidad contratante
       begin

                    print convert(varchar, @ecol_id_1)

                    if exists (select * from BDWebLun..RELUN_REGISTRO_LUN where ECOL_ID <> @ECOL_ID_1 and RUN_FUNCIONARIO = @RUN_FUNCIONARIO_1)
                    begin
					--ya que existe en otro ecol por eso no se agrega
                           print convert(varchar,'no se agrega ' + @RUN_FUNCIONARIO_1 +' '+ @COD_DEIS_1)
                    end

                    else
                    begin
                           print convert(varchar,'se agrega ' + @RUN_FUNCIONARIO_1 +' '+@COD_DEIS_1)
                           if not exists (select * from @LUN where ECOL_ID = @ECOL_ID_1 and ID_LUN = @ID_LUN_1)
                           begin
							   INSERT INTO @LUN (ECOL_ID, RUN_FUNCIONARIO, FECHA_MOVIMIENTO, USUARIO_REGISTRADOR, ID_LUN, COD_DEIS) values
							   (

							   @ECOL_ID_1,

							   @RUN_FUNCIONARIO_1,

							   @FECHA_MOVIMIENTO_1,

							   @USUARIO_REGISTRADOR_1,

							   @ID_LUN_1,

							   @COD_DEIS_1

							   )
							   set @contador_eliminados = @contador_eliminados + 1
                           end

                    end

       end

          else

          begin

             print convert(varchar,'se agrega ' + @RUN_FUNCIONARIO_1 +' '+@COD_DEIS_1)
			 if not exists (select * from @LUN where ECOL_ID = @ECOL_ID_1 and ID_LUN = @ID_LUN_1)
			 begin
				 INSERT INTO @LUN (ECOL_ID, RUN_FUNCIONARIO, FECHA_MOVIMIENTO, USUARIO_REGISTRADOR, ID_LUN, COD_DEIS) values

				 (

				 @ECOL_ID_1,

				 @RUN_FUNCIONARIO_1,

				 @FECHA_MOVIMIENTO_1,

				 @USUARIO_REGISTRADOR_1,

				 @ID_LUN_1,

				 @COD_DEIS_1

				 )

				 set @contador_eliminados = @contador_eliminados + 1
			 end
       end

	SET @CONTLUN = @CONTLUN + 1

END
 

--select * from @LUN

SELECT @MAX = COUNT(*) FROM @LUN


SET @CONT = 1

WHILE (@CONT <= @MAX)

BEGIN

                   

       SELECT

            @ECOL_ID = ECOL_ID,

            @RUN_FUNCIONARIO = RUN_FUNCIONARIO,

            @USUARIO_REGISTRADOR = USUARIO_REGISTRADOR,

            @ID_LUN = ID_LUN,

            @COD_DEIS = COD_DEIS

       FROM @LUN WHERE ID = @CONT


       SELECT FNP.ID

       INTO #FNP

       FROM RAYEN..FNP_FUNCIONARIO_PRESTADOR FNP

       INNER JOIN

       (

       SELECT ID FROM RAYEN..NOD_NODO WHERE CODIGO_DEIS = @COD_DEIS

       ) NODO_ECOL ON FNP.NOD_ID = NODO_ECOL.ID

       WHERE FNP.RUT = replace(@run_eliminar,'-','')


       PRINT      'Desactivando LOGIN Rut '+@run_eliminar    

       

     UPDATE P SET P.BLOQUEADO = 1

       FROM RAYEN..PFU_PERFIL P

       INNER JOIN

       (

       SELECT L.ID

       FROM RAYEN..LGN_LOGIN L

       INNER JOIN #FNP F ON L.FNP_ID = F.ID

       ) LOGINF ON P.LGN_ID = LOGINF.ID

       PRINT      'Desactivando Funcionario Rut '+@run_eliminar    

       UPDATE F SET F.ELIMINADO = 1

       FROM RAYEN..LGN_LOGIN F

       INNER JOIN #FNP FN ON F.FNP_ID = FN.ID

       DROP TABLE #FNP

      

SET @CONT = @CONT + 1

END

--retorno de las eliminadas
select * from @LUN

END
GO

