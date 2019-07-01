USE [RAYEN]
GO

/****** Object:  StoredProcedure [dbo].[GLB0155]    Script Date: 18-08-2016 14:55:03 ******/
DROP PROCEDURE [dbo].[GLB0155]
GO

/****** Object:  StoredProcedure [dbo].[GLB0155]    Script Date: 18-08-2016 14:55:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


---------------------------------------------------------------------------------------------------------------------------
/*-----------------------------------------------------------*
** NOMBRE SISTEMA: RAYEN 
**
** NOMBRE DEL OBJETO:  [dbo].[GLB0155]
**
** VER: 1.0.0.1
**
** DESCRIPCION: Informe Enfermedades Respiratorias
**
** AUTOR: Felipe Nieto
**
** FECHA DE Modificacion: 13 - Julio - 2010
**-------------------------------------------------------------
**
** DESCRIPCION: MNODIFICACION DEL INFORME SEG�N REQ.
** 120576 DONDE SE SUGIERE AGREGAR JOIN CON ATEN_ATENCION
**
** MODIFICADOR: V�CTOR CORONADO
**
** FECHA DE Modificacion: 18 - Agosto - 2016

**
**-----------------------------------------------------------*/

---------------------------------------------------------------------------------------------------------------------------

--exec GLB0155 @FECHA_INICIO='2015-06-01 00:00:00',@FECHA_TERMINO='2015-06-30 23:59:59',@NOD_ID=2411

CREATE    PROCEDURE [dbo].[GLB0155]
(
@NOD_ID INT,
@FECHA_INICIO DATETIME,
@FECHA_TERMINO DATETIME
)
AS

BEGIN

		declare
		@fecha_inicio_entera int,@fecha_termino_entera int
		
		set @fecha_inicio_entera = CONVERT(varchar, @Fecha_Inicio, 112)
		set @fecha_termino_entera = CONVERT(varchar, @Fecha_Termino, 112)

DECLARE @REM1 TABLE ( EDAD_INICIAL INT, EDAD_FINAL INT)
DECLARE @REM1_DEF TABLE (NEUMO INT, ASMA INT, SBO INT, IRA INT, TOTAL INT)

DECLARE
   @IDS1 VARCHAR(200), 
   @IDS2 VARCHAR(200), 
   @IDS3 VARCHAR(200), 
   @IDS4 VARCHAR(200), 
   @todos varchar(1000),
   @EDAD_INICIAL INT, 
   @EDAD_FINAL INT, 
   @NEUMO INT, 
   @ASMA INT, 
   @SBO INT, 
   @IRA INT, 
   @TOTAL INT

/*RANGO EDADES*/
INSERT INTO @REM1 VALUES ( 0,  5)
INSERT INTO @REM1 VALUES ( 6, 12)
INSERT INTO @REM1 VALUES (13, 19)
INSERT INTO @REM1 VALUES (20, 59)
INSERT INTO @REM1 VALUES (60, 150)

/*DIAGNOSTICOS*/
SET @IDS1='4271;4272;4273;4274;4275;4276;4277;4278;4279;4280;4281;4261;4262;4263;4264;4265;4266;4291;4292;4293;4294;4295;4296'
SET @IDS2='4392;4393;4394;4395;4396'
SET @IDS3='4297;4298;4299;4300;4301;4302;4303;4304;4305;4306;4307;4308;4309;4310;4311;4371;4372;4373;4374;4375;4376'
SET @IDS4='4224;4225;4226;4227;4228;4229;4230;4231;4232;4233;4234;4235;4236;4237;4238;4239;4240;4241;4242;4243;4244;4245'

set @todos = @IDS1 + ';' + @IDS2 + ';' + @IDS3 + ';' + @IDS4

declare @tabla table (diag_id int, edad int)

insert into @tabla
SELECT 
	DATE_DIAGNOSTICOS_ATENCION.DIAG_ID, 
	(YEAR(DATEDIFF(day, USP_USUARIO_APS.FECHA_DE_NACIMIENTO, DATE_DIAGNOSTICOS_ATENCION.FECHA))-1900)
FROM 
	DATE_DIAGNOSTICOS_ATENCION with (nolock) 
	inner JOIN USP_USUARIO_APS with (nolock) 
	ON DATE_DIAGNOSTICOS_ATENCION.USP_ID = USP_USUARIO_APS.ID 
	inner JOIN ATEN_ATENCION with (nolock) ON DATE_DIAGNOSTICOS_ATENCION.ATEN_ID=ATEN_ATENCION.ID
WHERE 
	(DATE_DIAGNOSTICOS_ATENCION.ELIMINADO = 0) AND 
	(USP_USUARIO_APS.ELIMINADO = 0) AND 
	(ATEN_ATENCION.NOD_ID = @NOD_ID) AND
	--(USP_USUARIO_APS.NOD_ID = @NOD_ID) AND 
	--(DATE_DIAGNOSTICOS_ATENCION.FECHA BETWEEN @FECHA_INICIO AND @FECHA_TERMINO) AND 
	(DATE_DIAGNOSTICOS_ATENCION.FECHA_ENTERA between @fecha_inicio_entera and @fecha_termino_entera) and
	(DATE_DIAGNOSTICOS_ATENCION.DIAG_ID IN (SELECT ID FROM OBTENER_ID(@todos))) 


DECLARE ALFA CURSOR FOR SELECT EDAD_INICIAL, EDAD_FINAL FROM @REM1
OPEN ALFA

FETCH NEXT FROM ALFA INTO @EDAD_INICIAL, @EDAD_FINAL 
WHILE (@@FETCH_STATUS = 0 )
BEGIN
   SELECT @NEUMO = COALESCE(COUNT(*),0) FROM @tabla WHERE edad between @EDAD_INICIAL AND @EDAD_FINAL AND (DIAG_ID IN (SELECT ID FROM OBTENER_ID(@IDS1))) 
   SELECT @ASMA  = COALESCE(COUNT(*),0) FROM @tabla WHERE edad between @EDAD_INICIAL AND @EDAD_FINAL AND (DIAG_ID IN (SELECT ID FROM OBTENER_ID(@IDS2))) 
   SELECT @SBO   = COALESCE(COUNT(*),0) FROM @tabla WHERE edad between @EDAD_INICIAL AND @EDAD_FINAL AND (DIAG_ID IN (SELECT ID FROM OBTENER_ID(@IDS3))) 
   SELECT @IRA   = COALESCE(COUNT(*),0) FROM @tabla WHERE edad between @EDAD_INICIAL AND @EDAD_FINAL AND (DIAG_ID IN (SELECT ID FROM OBTENER_ID(@IDS4))) 
   SET    @TOTAL = @NEUMO + @ASMA + @SBO + @IRA
   INSERT INTO @REM1_DEF VALUES (@NEUMO, @ASMA, @SBO, @IRA, @TOTAL)
   FETCH NEXT FROM ALFA INTO @EDAD_INICIAL, @EDAD_FINAL 
END

CLOSE ALFA
DEALLOCATE ALFA

SELECT NEUMO, ASMA, SBO, IRA, TOTAL FROM @REM1_DEF


END




GO
