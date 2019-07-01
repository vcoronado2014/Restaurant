USE [RAYEN]
GO

/****** Object:  StoredProcedure [dbo].[INS0001]    Script Date: 11-04-2017 15:37:04 ******/
DROP PROCEDURE [dbo].[INS0001]
GO

/****** Object:  StoredProcedure [dbo].[INS0001]    Script Date: 11-04-2017 15:37:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/************************************************************************                              
NOMBRE DEL PROCEDIMIENTO	:INS0001                               
AUTOR						: 
FECHA DE CREACI�N			:     
BASE DE DATOS				:RAYEN                             

OBJETIVO					:LEER REGISTROS DESDE LA TABLA USP_USUARIO_APS

FECHA DE MODIFICACI�N		:01/10/2009
USUARIO DE MODIFICACI�N		:Christopher Castro 
MOTIVO DE MODIFICACI�N		:Se agrega campo PESO_AL_NACER

FECHA DE MODIFICACI�N		:12/10/2009
USUARIO DE MODIFICACI�N		:Pablo Quezada
MOTIVO DE MODIFICACI�N		:Se agrega campo TIPO_BENEFICIARIO

FECHA DE MODIFICACI�N		:25/11/2010
USUARIO DE MODIFICACI�N		:Christopher Castro
MOTIVO DE MODIFICACI�N		:Se agrega campo ID_RYF, TIPO_BENEFICIARIO

FECHA DE MODIFICACI�N		:16/12/2010
USUARIO DE MODIFICACI�N		:Elias Orellana
MOTIVO DE MODIFICACI�N		:Se agrega campo FECHA_ULTIMA_MODIFICACION 

FECHA DE MODIFICACI�N		:30/08/2011
USUARIO DE MODIFICACI�N		:Christopher Castro
MOTIVO DE MODIFICACI�N		:Se agrega campo INSCRIBE

FECHA DE MODIFICACI�N		:30/08/2011
USUARIO DE MODIFICACI�N		:Christopher Castro
MOTIVO DE MODIFICACI�N		:Se agrega campo ES_ADMISION_BREVE

FECHA DE MODIFICACI�N		:30/08/2011
USUARIO DE MODIFICACI�N		:Christopher Castro
MOTIVO DE MODIFICACI�N		:Se agrega campo ORIGEN_ADMISION_BREVE

FECHA DE MODIFICACI�N		:15/06/2012
USUARIO DE MODIFICACI�N		:Pablo Serrano
MOTIVO DE MODIFICACI�N		:Se agrega campo CLAVE_PORTAL

FECHA DE MODIFICACI�N		:
USUARIO DE MODIFICACI�N		:
MOTIVO DE MODIFICACI�N		:Se agrega campo RUT_BENEFICIARIO

FECHA DE MODIFICACI�N		:06/03/2012
USUARIO DE MODIFICACI�N		:Pablo Serrano
MOTIVO DE MODIFICACI�N		:Se corrije el largo del campo NOMBRE_RESPONDE para que cuadre con el de la tabla USP

FECHA DE MODIFICACI�N		:04-04-2016
USUARIO DE MODIFICACI�N		:Cristian Ormazabal
MOTIVO DE MODIFICACI�N		:Se modifica para agregar TDD_IDS


VISADO POR (QA)  			:   
FECHA APROBACI�N QA 		:   
COMENTARIOS QA     			:                             

VISADO POR (DBA)  			:   
FECHA APROBACI�N DBA 		:   
COMENTARIOS DBA     		:                
                              
TABLAS INVOLUCRADAS 		:CIT_CITA
***********************************************************************/
CREATE PROCEDURE [dbo].[INS0001]
(
@RSD_ID INTEGER,
@CNP_ID INTEGER,
@HL7_0002_U_ID INTEGER,
@OCP_ID INTEGER,
@HL7_0063_U_ID INTEGER,
@GET_ID INTEGER,
@NAC_ID INTEGER,
@FAM_ID INTEGER,
@ESC_ID INTEGER,
@ITP_ID INTEGER,
@RUT VARCHAR (15)  ,
@RUT_RESPONSABLE VARCHAR (15)  ,
@NUMERO_IDENTIFICACION VARCHAR (15)  ,
@TIPO INTEGER,
@FECHA_INSCRIPCION DATETIME,
@NOMBRES VARCHAR (50)  ,
@APELLIDO_PATERNO VARCHAR (30)  ,
@APELLIDO_MATERNO VARCHAR (30)  ,
@FECHA_DE_NACIMIENTO DATETIME,
@HL7_0001_U_ID INTEGER,
@EMAIL VARCHAR (100)  ,
@FICHA_FISICA INTEGER,
@JEFE_DE_FAMILIA INTEGER,
@NOMBRE_PADRE VARCHAR (50)  ,
@NOMBRE_MADRE VARCHAR (50)  ,
@OBSERVACION VARCHAR (500)  ,
@ACTIVO INTEGER,
@VILLA_O_POBLACION VARCHAR (50)  ,
@CASA VARCHAR (20)  ,
@BLOCK VARCHAR (20)  ,
@DEPARTAMENTO VARCHAR (20)  ,
@SITIO VARCHAR (20)  ,
@UNIDAD_VECINAL VARCHAR (50)  ,
@TELEFONO1 VARCHAR (15)  ,
@TELEFONO2 VARCHAR (15)  ,
@ESESPECIAL INTEGER,
@ESNN INTEGER,
@ID_PADRE INTEGER,
@ID_MADRE INTEGER,
@COM_ID INTEGER,
@MPS_ID INTEGER,
@ES_PREMATURO INTEGER,
@EDAD_CORREGIDA INT,
@SEMANAS_GESTACIONALES INTEGER,
@PESO_AL_NACER INTEGER,
@NOD_ID INTEGER,
@NOMBRE_RESPONDE VARCHAR(20),
@NUMERO_DE_FICHA_IN VARCHAR(12),
@NUMERO_DE_FICHA VARCHAR (12) OUTPUT,
@RETIRO_ALIMENTOS INTEGER, 
@ADMINISTRACION_VACUNAS INTEGER,
@ATENCION_DIAGNOSTICA INTEGER,
@DIRECCION VARCHAR(100),
@COM2_ID INTEGER,
@PAI_ID INTEGER,
@RELIGION_QUE_PROFESA INTEGER,
@FECHA_PROBABLE_PARTO DATETIME,
@FNP_ID INTEGER,
@OTRO_DATO VARCHAR(20),
@FECHA_VIGENCIA_PREV DATETIME,
@RAC_ID INT,
@OAL_ID INT,
@CAO_ID INT,
@TIPO_BENEFICIARIO INT,
@ID_RYF VARCHAR(20),
@INSCRIBE SMALLINT = null,
@ES_ADMISION_BREVE SMALLINT = null,
@ORIGEN_ADMISION_BREVE INTEGER = null,
@FNP_ID_REGISTRADOR INTEGER = null,
@CLAVE_PORTAL VARCHAR(10) = NULL,
@FACTOR_RH INT = NULL,
@GRUPO_SANGUINEO INT = NULL,
@RUN_TITULAR_BENEFICIARIO varchar(20) = null,
@IDS_TIPOS_DISCAPACIDAD varchar(20) = null,
@ID_GLOBAL INTEGER,
@TID_GLOBAL VARCHAR(20),
@ID INTEGER OUTPUT,
@O_TID TIMESTAMP OUTPUT
)
AS
BEGIN

--IF @GET_ID = 0 SET @GET_ID = NULL

if (@TIPO = 0 and @esespecial= 0 and exists(select * from usp_usuario_aps usp where @RUT = usp.RUT and usp.ELIMINADO = 0))
begin
	RAISERROR ('Intento de duplicar',16,1)
	return
end


DECLARE @TIPO_NUMERO_FICHA AS INTEGER

SELECT @TIPO_NUMERO_FICHA= TIPO_NUMERO_FICHA FROM CONO_CONFIGURACION_NODO WHERE NOD_ID = @NOD_ID;

--IF (@ESESPECIAL=0)
--BEGIN
--  -- CONDICION 1
--  IF (@TIPO_NUMERO_FICHA=0) 
--  BEGIN 

--    SELECT @NUMERO_DE_FICHA =  MAX(NUMERO_FICHA) FROM  CONO_CONFIGURACION_NODO WHERE NOD_ID = @NOD_ID;
 
--    IF (@NUMERO_DE_FICHA is null) 
--      SET @NUMERO_DE_FICHA = 1
--    ELSE
--    BEGIN
--      SET @NUMERO_DE_FICHA = @NUMERO_DE_FICHA + 1;
--      WHILE EXISTS (SELECT ID FROM USP_USUARIO_APS WHERE NUMERO_DE_FICHA = @NUMERO_DE_FICHA and NOD_ID = @NOD_ID)
--         SET @NUMERO_DE_FICHA = @NUMERO_DE_FICHA + 1;
--    END

--  END

-- -- CONDICION 2
--  IF (@TIPO_NUMERO_FICHA = 1  and @ESESPECIAL = 0) 
--  BEGIN

--    IF (@TIPO = 0) SET @NUMERO_DE_FICHA = @RUT;
--    IF (@TIPO = 1) SET @NUMERO_DE_FICHA = @RUT_RESPONSABLE;
--    IF (@TIPO = 2) SET @NUMERO_DE_FICHA = @NUMERO_IDENTIFICACION;

--  END
----CONDICION 3
-- IF (@TIPO_NUMERO_FICHA=2)
-- BEGIN
--  SET  @NUMERO_DE_FICHA = coalesce(@NUMERO_DE_FICHA_IN, '');
-- END 
--END
--ELSE
--  SET @NUMERO_DE_FICHA = ''

INSERT INTO USP_USUARIO_APS (
RSD_ID,
CNP_ID,
HL7_0002_U_ID,
OCP_ID,
HL7_0063_U_ID,
GET_ID,
NAC_ID,
FAM_ID,
ESC_ID,
ITP_ID,
RUT,
RUT_RESPONSABLE,
NUMERO_IDENTIFICACION,
TIPO,
NUMERO_DE_FICHA,
FECHA_INSCRIPCION,
NOMBRES,
APELLIDO_PATERNO,
APELLIDO_MATERNO,
FECHA_DE_NACIMIENTO,
HL7_0001_U_ID,
EMAIL,
FICHA_FISICA,
JEFE_DE_FAMILIA,
NOMBRE_PADRE,
NOMBRE_MADRE,
OBSERVACION,
ACTIVO,
VILLA_O_POBLACION,
CASA,
BLOCK,
DEPARTAMENTO,
SITIO,
UNIDAD_VECINAL,
TELEFONO1,
TELEFONO2,
ESESPECIAL,
ESNN,
USP_ID,
USP_ID2,
COM_ID,
MPS_ID,
ES_PREMATURO,
EDAD_CORREGIDA,
SEMANAS_GESTACIONALES,
PESO_AL_NACER,
NOD_ID ,
NOMBRE_RESPONDE,
RETIRO_ALIMENTOS,
ADMINISTRACION_VACUNAS,
ATENCION_DIAGNOSTICA,
DIRECCION,
COM2_ID,
PAI_ID,
RELIGION_QUE_PROFESA,
FECHA_PROBABLE_PARTO,
OTRO_DATO,
FECHA_VIGENCIA_PREVISION,
RAC_ID,
OAL_ID,
CAO_ID,
TIPO_BENEFICIARIO,
ID_RYF,
INSCRIBE,
ES_ADMISION_BREVE,
ORIGEN_ADMISION_BREVE,
FNP_ID_REGISTRADOR,
ID_LOCAL,
TID_LOCAL,
ELIMINADO,
FECHA_ULTIMA_MODIFICACION,
FECHA_NACIMIENTO_ENTERA,
CLAVE_PORTAL,
FACTOR_RH,
GRUPO_SANGUINEO,
RUN_TITULAR_BENEFICIARIO,
TDD_IDS
)

VALUES (
@RSD_ID,
@CNP_ID,
@HL7_0002_U_ID,
@OCP_ID,
@HL7_0063_U_ID,
@GET_ID,
@NAC_ID,
@FAM_ID,
@ESC_ID,
@ITP_ID,
@RUT,
@RUT_RESPONSABLE,
@NUMERO_IDENTIFICACION,
@TIPO,
@NUMERO_DE_FICHA,
@FECHA_INSCRIPCION,
@NOMBRES,
@APELLIDO_PATERNO,
@APELLIDO_MATERNO,
@FECHA_DE_NACIMIENTO,
@HL7_0001_U_ID,
@EMAIL,

@FICHA_FISICA,

@JEFE_DE_FAMILIA,
@NOMBRE_PADRE,
@NOMBRE_MADRE,
@OBSERVACION,
@ACTIVO,
@VILLA_O_POBLACION,
@CASA,
@BLOCK,
@DEPARTAMENTO,
@SITIO,
@UNIDAD_VECINAL,
@TELEFONO1,
@TELEFONO2,
@ESESPECIAL,
@ESNN,
@ID_PADRE,
@ID_MADRE,
@COM_ID,
@MPS_ID,
@ES_PREMATURO,
@EDAD_CORREGIDA,
@SEMANAS_GESTACIONALES,
@PESO_AL_NACER,
@NOD_ID,
@NOMBRE_RESPONDE,
@RETIRO_ALIMENTOS,
@ADMINISTRACION_VACUNAS,
@ATENCION_DIAGNOSTICA,
@DIRECCION,
@COM2_ID,
@PAI_ID,
@RELIGION_QUE_PROFESA,
@FECHA_PROBABLE_PARTO,
@OTRO_DATO,
@FECHA_VIGENCIA_PREV,
@RAC_ID,
@OAL_ID,
@CAO_ID,
@TIPO_BENEFICIARIO,
@ID_RYF,
@INSCRIBE,
@ES_ADMISION_BREVE,
@ORIGEN_ADMISION_BREVE,
@FNP_ID_REGISTRADOR,
@ID_GLOBAL,
@TID_GLOBAL,
0,
GETDATE(),
convert(varchar,@FECHA_DE_NACIMIENTO,112),
@CLAVE_PORTAL,
@FACTOR_RH,
@GRUPO_SANGUINEO,
@RUN_TITULAR_BENEFICIARIO,
@IDS_TIPOS_DISCAPACIDAD
);


IF (@TIPO_NUMERO_FICHA=0 and @ESESPECIAL=0) 
begin
	UPDATE CONO_CONFIGURACION_NODO SET NUMERO_FICHA=@NUMERO_DE_FICHA WHERE NOD_ID = @NOD_ID;
end 

SELECT @ID = SCOPE_IDENTITY()
SELECT @O_TID = TID FROM USP_USUARIO_APS WHERE ID=@ID

DECLARE 
	@CODIGO_FAMILIA INT, 
	@SEC_ID INT

SELECT 
	@CODIGO_FAMILIA = CODIGO_FAMILIA, 
	@SEC_ID = SEC_ID 
FROM 
	FAM_FAMILIA 
WHERE 
	ID = @FAM_ID

--INSERT INTO HIU_HISTORIAL_INSCRIPCION_DE_USUARIO (
--	USP_ID, 
--	NOD_ID2, 
--	FNP_ID, 
--	FECHA_HORA, 
--	ESTA_ACTIVO, 
--	ELIMINADO, 
--	FECHA_INSCRIPCION, 
--	RUT, 
--	NUMERO_FICHA, 
--	CODIGO_FAMILIA, 
--	ES_ESPECIAL, 
--	SEC_ID
--)
--VALUES (
--	@ID, 
--	@NOD_ID, 
--	@FNP_ID, 
--	GETDATE(), 
--	1, 
--	0, 
--	@FECHA_INSCRIPCION, 
--	@RUT, 
--	@NUMERO_DE_FICHA, 
--	@CODIGO_FAMILIA, 
--	@ESESPECIAL, 
--	@SEC_ID 
--);

END



GO

USE [RAYEN]
GO

/****** Object:  StoredProcedure [dbo].[INS0002]    Script Date: 11-04-2017 15:38:57 ******/
DROP PROCEDURE [dbo].[INS0002]
GO

/****** Object:  StoredProcedure [dbo].[INS0002]    Script Date: 11-04-2017 15:38:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/************************************************************************                              
NOMBRE DEL PROCEDIMIENTO	:INS0002
AUTOR						:
FECHA DE CREACI�N			:
BASE DE DATOS				:RAYEN

OBJETIVO					:ACTUALIZA REGISTROS A LA TABLA USP_USUARIO_APS.

FECHA DE MODIFICACI�N		:30/07/2009
USUARIO DE MODIFICACI�N		:Elias Orellana
MOTIVO DE MODIFICACI�N		:Se agregan dos campos RAC_ID Y OAL_ID

FECHA DE MODIFICACI�N		:01/10/2009
USUARIO DE MODIFICACI�N		:Christopher Castro
MOTIVO DE MODIFICACI�N		:Se agrega campo PESO_AL_NACER

FECHA DE MODIFICACI�N		:25/11/2010
USUARIO DE MODIFICACI�N		:Christopher Castro
MOTIVO DE MODIFICACI�N		:Se agrega campo ID_RYF, TIPO_BENEFICIARIO

FECHA DE MODIFICACI�N		:16/12/2010
USUARIO DE MODIFICACI�N		:Elias Orellana
MOTIVO DE MODIFICACI�N		:Se agrega campo FECHA_ULTIMA_MODIFICACION 

FECHA DE MODIFICACI�N		:30/08/2011
USUARIO DE MODIFICACI�N		:Christopher Castro
MOTIVO DE MODIFICACI�N		:Se agrega campo INSCRIBE

FECHA DE MODIFICACI�N		:30/08/2011
USUARIO DE MODIFICACI�N		:Christopher Castro
MOTIVO DE MODIFICACI�N		:Se agrega campo ES_ADMISION_BREVE

FECHA DE MODIFICACI�N		:30/08/2011
USUARIO DE MODIFICACI�N		:Christopher Castro
MOTIVO DE MODIFICACI�N		:Se agrega campo ORIGEN_ADMISION_BREVE

FECHA DE MODIFICACI�N		:22/05/2012
USUARIO DE MODIFICACI�N		:Juan Villalobos
MOTIVO DE MODIFICACI�N		:Se agrega campo ACCEDE_PORTAL

FECHA DE MODIFICACI�N		:16/06/2012
USUARIO DE MODIFICACI�N		:Pablo Serrano
MOTIVO DE MODIFICACI�N		:Se agrega campo CLAVE_PORTAL

FECHA DE MODIFICACI�N		:16/06/2012
USUARIO DE MODIFICACI�N		:Pablo Serrano
MOTIVO DE MODIFICACI�N		:Se agrega campo FACTOR_RH y GRUPO_SANGUINEO

FECHA DE MODIFICACI�N		:04-04-2016
USUARIO DE MODIFICACI�N		:CRISTIAN ORMAZABAL
MOTIVO DE MODIFICACI�N		:Se modifica para agregar TDD_IDS


VISADO POR (QA)  			:   
FECHA APROBACI�N QA 		:   
COMENTARIOS QA     			:                             

VISADO POR (DBA)  			:   
FECHA APROBACI�N DBA 		:   
COMENTARIOS DBA     		:                
                              
TABLAS INVOLUCRADAS 		:
***********************************************************************/
CREATE PROCEDURE [dbo].[INS0002]
(
@ID INTEGER,
@RSD_ID INTEGER,
@CNP_ID INTEGER,
@HL7_0002_U_ID INTEGER,
@OCP_ID INTEGER,
@HL7_0063_U_ID INTEGER,
@GET_ID INTEGER,
@NAC_ID INTEGER,
@FAM_ID INTEGER,
@ESC_ID INTEGER,
@ITP_ID INTEGER,
@RUT VARCHAR (15) ,
@RUT_RESPONSABLE VARCHAR (15) ,
@NUMERO_IDENTIFICACION VARCHAR (15) ,
@TIPO INTEGER,
@NUMERO_DE_FICHA VARCHAR (12) ,
@ACCEDE_PORTAL SMALLINT = NULL,
@FECHA_INSCRIPCION DATETIME,
@NOMBRES VARCHAR (50) ,
@APELLIDO_PATERNO VARCHAR (30) ,
@APELLIDO_MATERNO VARCHAR (30) ,
@FECHA_DE_NACIMIENTO DATETIME,
@HL7_0001_U_ID INTEGER,
@EMAIL VARCHAR (100) ,
@FICHA_FISICA SMALLINT,
@JEFE_DE_FAMILIA SMALLINT,
@NOMBRE_PADRE VARCHAR (50) ,
@NOMBRE_MADRE VARCHAR (50) ,
@OBSERVACION VARCHAR (500) ,
@ACTIVO SMALLINT,
@VILLA_O_POBLACION VARCHAR (50) ,
@CASA VARCHAR (20) ,
@BLOCK VARCHAR (20) ,
@DEPARTAMENTO VARCHAR (20) ,
@SITIO VARCHAR (20) ,
@UNIDAD_VECINAL VARCHAR (50) ,
@TELEFONO1 VARCHAR (15) ,
@TELEFONO2 VARCHAR (15) ,
@ESESPECIAL SMALLINT,
@ESNN SMALLINT,
@ID_PADRE INTEGER,
@ID_MADRE INTEGER,
@COM_ID INTEGER,
@MPS_ID INTEGER,
@ES_PREMATURO SMALLINT,
@EDAD_CORREGIDA INTEGER,
@SEMANAS_GESTACIONALES INTEGER,
@PESO_AL_NACER INTEGER,
@NOD_ID INTEGER,
@NOMBRE_RESPONDE VARCHAR(20),
@O_NUMERO_DE_FICHA VARCHAR (12) OUTPUT,
@RETIRO_ALIMENTOS SMALLINT,
@ADMINISTRACION_VACUNAS SMALLINT,
@ATENCION_DIAGNOSTICA SMALLINT,
@DIRECCION VARCHAR(100),
@COM2_ID INTEGER,
@PAI_ID INTEGER,
@RELIGION_QUE_PROFESA INTEGER,
@FECHA_PROBABLE_PARTO DATETIME,
@FNP_ID INTEGER,
@OTRO_DATO VARCHAR(20),
@FECHA_VIGENCIA_PREV DATETIME,
@RAC_ID INT,
@OAL_ID INT,
@CAO_ID INT,
@TIPO_BENEFICIARIO INT,
@ID_RYF VARCHAR(20),
@INSCRIBE SMALLINT = null,
@ES_ADMISION_BREVE SMALLINT = null,
@ORIGEN_ADMISION_BREVE INTEGER = null,
@FNP_ID_REGISTRADOR INTEGER = null,
@CLAVE_PORTAL VARCHAR(10) = NULL,
@FACTOR_RH INT = NULL,
@GRUPO_SANGUINEO INT = NULL,
@RUN_TITULAR_BENEFICIARIO varchar(20) = null,
@IDS_TIPOS_DISCAPACIDAD varchar(20) = null,
@TID TIMESTAMP,
@ID_GLOBAL INTEGER,
@TID_GLOBAL VARCHAR(20),
@O_TID TIMESTAMP OUTPUT
)
AS
BEGIN

DECLARE @TIPO_NUMERO_FICHA AS INTEGER
/**** OBTIENE DATOS ANTIGUOS DEL USUARIO ****/ 
DECLARE 
	@NOD_ANTERIOR INTEGER, 
	@ESTADO_ANTERIOR INT, 
	@FECHA_INSCRIPCION_ATERIOR DATETIME,
	@NUMERO_FICHA_ANTERIOR VARCHAR(20),
	@CODIGO_FAMILIA_ANTERIOR INT,
	@ESTADO_ESPECIAL_ANTERIOR INT,
	@SEC_ID_ANTERIOR INT,
	@FAM_ID_ANTERIOR INT

--IF @GET_ID = 0 SET @GET_ID = NULL
	
SELECT 
	@NOD_ANTERIOR = NOD_ID, 
	@ESTADO_ANTERIOR = ACTIVO, 
	@FECHA_INSCRIPCION_ATERIOR = FECHA_INSCRIPCION, 
	@ESTADO_ESPECIAL_ANTERIOR = ESESPECIAL, 
	@NUMERO_FICHA_ANTERIOR = NUMERO_DE_FICHA, 
	@FAM_ID_ANTERIOR = FAM_ID
FROM 
	USP_USUARIO_APS 
WHERE 
	ID = @ID	

/**** OBTIENE DATOS ANTIGUOS DE LA FAMILIA DEL USUARIO ****/ 
SELECT 
	@CODIGO_FAMILIA_ANTERIOR = CODIGO_FAMILIA, 
	@SEC_ID_ANTERIOR = SEC_ID 
FROM 
	FAM_FAMILIA 
WHERE 
	ID = @FAM_ID_ANTERIOR

SELECT 
	@TIPO_NUMERO_FICHA = TIPO_NUMERO_FICHA  -- TIPO_NUMERO_FICHA: Correlativo=0, Rut=1, TextoLibre=2
FROM 
	CONO_CONFIGURACION_NODO 
WHERE 
	NOD_ID = @NOD_ID;

if (@FAM_ID is not null and @ESESPECIAL = 1)
begin
   set @ESESPECIAL = 0
end


-- CONDICION: QUE EL TIPO DE NUMERO DE FICHA DEL NUEVO NODO DEL USUARIO ES Correlativo y que el usuario es "normal" y (que el n�mero de ficha nuevo es nulo o vac�o o el usuario cambi� de nodo)
IF (@TIPO_NUMERO_FICHA = 0 and @ESESPECIAL = 0 AND (@NUMERO_DE_FICHA IS NULL or @NUMERO_DE_FICHA = '' OR @NOD_ANTERIOR <> @NOD_ID)) 
BEGIN -- Se asigna un correlativo de ficha nuevo
    SELECT @O_NUMERO_DE_FICHA =  MAX(NUMERO_FICHA) FROM  CONO_CONFIGURACION_NODO WHERE NOD_ID = @NOD_ID;

    IF (@O_NUMERO_DE_FICHA is null) 
      SET @O_NUMERO_DE_FICHA = 1
    ELSE
    BEGIN
      SET @O_NUMERO_DE_FICHA = @O_NUMERO_DE_FICHA + 1;
      WHILE EXISTS (SELECT ID FROM USP_USUARIO_APS WHERE NUMERO_DE_FICHA = @O_NUMERO_DE_FICHA and NOD_ID = @NOD_ID)
        SET @O_NUMERO_DE_FICHA = @O_NUMERO_DE_FICHA + 1;
    END
END
ELSE
    SET @O_NUMERO_DE_FICHA = @NUMERO_DE_FICHA;


-- CONDICION: Si el tipo de numero de ficha es RUT y el usuario es "normal"
IF (@TIPO_NUMERO_FICHA=1 and @ESESPECIAL=0) 
BEGIN
-- @TIPO = Tipo de usuario: Normal =0, Reci�n Nacido=1, Extranjero=2
    IF (@TIPO=0) SET @O_NUMERO_DE_FICHA =@RUT;
    IF (@TIPO=1) SET @O_NUMERO_DE_FICHA =@RUT_RESPONSABLE;
    IF (@TIPO=2) SET @O_NUMERO_DE_FICHA =@NUMERO_IDENTIFICACION;

END
--CONDICION : Si el tipo de numero de ficha es Texto Libre y el usuario es "normal"
IF (@TIPO_NUMERO_FICHA=2 and @ESESPECIAL=0)
BEGIN
 SET @O_NUMERO_DE_FICHA = coalesce(@NUMERO_DE_FICHA,''); 
END

UPDATE USP_USUARIO_APS SET
RSD_ID = @RSD_ID,
CNP_ID = @CNP_ID,
HL7_0002_U_ID = @HL7_0002_U_ID,
OCP_ID = @OCP_ID,
HL7_0063_U_ID = @HL7_0063_U_ID,
GET_ID = @GET_ID,
NAC_ID = @NAC_ID,
FAM_ID = @FAM_ID,
ESC_ID = @ESC_ID,
ITP_ID = @ITP_ID,
RUT = @RUT,
RUT_RESPONSABLE = @RUT_RESPONSABLE,
NUMERO_IDENTIFICACION = @NUMERO_IDENTIFICACION,
TIPO = @TIPO,
NUMERO_DE_FICHA = @O_NUMERO_DE_FICHA,
ACCEDE_PORTAL = @ACCEDE_PORTAL,
FECHA_INSCRIPCION = @FECHA_INSCRIPCION,
NOMBRES = @NOMBRES,
APELLIDO_PATERNO = @APELLIDO_PATERNO,
APELLIDO_MATERNO = @APELLIDO_MATERNO,
FECHA_DE_NACIMIENTO = @FECHA_DE_NACIMIENTO,
HL7_0001_U_ID = @HL7_0001_U_ID,
EMAIL = @EMAIL,
FICHA_FISICA = @FICHA_FISICA,
JEFE_DE_FAMILIA = @JEFE_DE_FAMILIA,
ESESPECIAL = @ESESPECIAL,
ESNN = @ESNN,
NOMBRE_PADRE = @NOMBRE_PADRE,
NOMBRE_MADRE = @NOMBRE_MADRE,
OBSERVACION = @OBSERVACION,
ACTIVO = @ACTIVO,
VILLA_O_POBLACION = @VILLA_O_POBLACION,
CASA = @CASA,
BLOCK = @BLOCK,
DEPARTAMENTO = @DEPARTAMENTO,
SITIO = @SITIO,
UNIDAD_VECINAL = @UNIDAD_VECINAL,
TELEFONO1 = @TELEFONO1,
TELEFONO2 = @TELEFONO2,
USP_ID = @ID_PADRE,
USP_ID2 = @ID_MADRE,
COM_ID = @COM_ID,
MPS_ID = @MPS_ID,
ES_PREMATURO = @ES_PREMATURO,
EDAD_CORREGIDA = @EDAD_CORREGIDA,
SEMANAS_GESTACIONALES = @SEMANAS_GESTACIONALES,
PESO_AL_NACER = @PESO_AL_NACER,
NOD_ID = @NOD_ID,
NOMBRE_RESPONDE = @NOMBRE_RESPONDE ,
RETIRO_ALIMENTOS = @RETIRO_ALIMENTOS,
ADMINISTRACION_VACUNAS = @ADMINISTRACION_VACUNAS,
ATENCION_DIAGNOSTICA = @ATENCION_DIAGNOSTICA,
DIRECCION = @DIRECCION,
COM2_ID = @COM2_ID,
PAI_ID = @PAI_ID,
RELIGION_QUE_PROFESA = @RELIGION_QUE_PROFESA ,
FECHA_PROBABLE_PARTO = @FECHA_PROBABLE_PARTO ,
OTRO_DATO = @OTRO_DATO ,
FECHA_VIGENCIA_PREVISION = @FECHA_VIGENCIA_PREV, 
RAC_ID = @RAC_ID,
OAL_ID = @OAL_ID,
CAO_ID = @CAO_ID,
TIPO_BENEFICIARIO = @TIPO_BENEFICIARIO,
ID_RYF = @ID_RYF,
INSCRIBE = @INSCRIBE,
ES_ADMISION_BREVE = @ES_ADMISION_BREVE,
ORIGEN_ADMISION_BREVE = @ORIGEN_ADMISION_BREVE,
FNP_ID_REGISTRADOR = @FNP_ID_REGISTRADOR,
ID_LOCAL = @ID_GLOBAL,
TID_LOCAL = @TID_GLOBAL ,
FECHA_ULTIMA_MODIFICACION = GETDATE(),
FECHA_NACIMIENTO_ENTERA = convert(varchar,@FECHA_DE_NACIMIENTO,112),
CLAVE_PORTAL = @CLAVE_PORTAL,
FACTOR_RH = @FACTOR_RH,
GRUPO_SANGUINEO = @GRUPO_SANGUINEO,
RUN_TITULAR_BENEFICIARIO = @RUN_TITULAR_BENEFICIARIO,
TDD_IDS = @IDS_TIPOS_DISCAPACIDAD
WHERE ID=@ID and TID = @TID

IF (@@rowcount = 0) 
     raiserror('Error de concurrencia', 16, 1, null, null);
 
SELECT @O_TID =TID FROM USP_USUARIO_APS WHERE ID =@ID

-- En caso que el tipo de numero de ficha del nuevo nodo del usuario es correlativo y ya antes actualiz� al usuario, entonces actualizo el ultimo correlativo en la configuracion del nodo
IF (@TIPO_NUMERO_FICHA = 0 and @ESESPECIAL = 0 AND (@NUMERO_DE_FICHA IS NULL or @NUMERO_DE_FICHA = '' OR @NOD_ANTERIOR <> @NOD_ID)) 
-- IF (@TIPO_NUMERO_FICHA = 0 and @ESESPECIAL = 0 AND (@NUMERO_DE_FICHA IS NULL or @NUMERO_DE_FICHA = '')) 
BEGIN
    UPDATE CONO_CONFIGURACION_NODO SET NUMERO_FICHA = @O_NUMERO_DE_FICHA WHERE NOD_ID = @NOD_ID;
END 

/**** OBTIENE DATOS ACTUALES DE LA FAMILIA ****/
DECLARE 
	@CODIGO_FAMILIA INT, 
	@SEC_ID INT
SELECT 
	@CODIGO_FAMILIA = CODIGO_FAMILIA, 
	@SEC_ID = SEC_ID 
FROM 
	FAM_FAMILIA 
WHERE 
	ID = @FAM_ID 
/************************************* RUTINA HISTORIAL INSCRIPCION ****************************************************/
-- Si el usuario NO cambi� de nodo y su estado de "ACTIVO" anterior es "estaba activo" y ahora en el nuevo nodo qued� pasivo.
--IF (@NOD_ANTERIOR = @NOD_ID AND @ESTADO_ANTERIOR = 1 AND @ACTIVO = 0)
--BEGIN
--    INSERT INTO HIU_HISTORIAL_INSCRIPCION_DE_USUARIO ( 	USP_ID, NOD_ID2, MPS_ID, FNP_ID, FECHA_HORA, ESTA_ACTIVO, ELIMINADO, FECHA_INSCRIPCION, RUT, NUMERO_FICHA, CODIGO_FAMILIA, ES_ESPECIAL, SEC_ID )
--    VALUES ( @ID, @NOD_ID, @MPS_ID, @FNP_ID, GETDATE(), 0, 0, @FECHA_INSCRIPCION_ATERIOR, @RUT, @O_NUMERO_DE_FICHA, @CODIGO_FAMILIA, @ESESPECIAL, @SEC_ID )
--END

--IF (@NOD_ANTERIOR = @NOD_ID AND @ESTADO_ANTERIOR = 0 AND @ACTIVO = 1)
--BEGIN
--    INSERT INTO HIU_HISTORIAL_INSCRIPCION_DE_USUARIO ( USP_ID, NOD_ID2, FNP_ID, FECHA_HORA, ESTA_ACTIVO, ELIMINADO, FECHA_INSCRIPCION, RUT, NUMERO_FICHA, CODIGO_FAMILIA, ES_ESPECIAL, SEC_ID )
--    VALUES ( @ID, @NOD_ID, @FNP_ID, GETDATE(), 1, 0, @FECHA_INSCRIPCION, @RUT, @O_NUMERO_DE_FICHA, @CODIGO_FAMILIA, @ESESPECIAL, @SEC_ID )
--END

--IF (@NOD_ANTERIOR <> @NOD_ID AND @ESTADO_ANTERIOR = 1 AND @ACTIVO = 1)
--BEGIN
--    INSERT INTO HIU_HISTORIAL_INSCRIPCION_DE_USUARIO ( NOD_ID, USP_ID, MPS_ID, NOD_ID2, FNP_ID, FECHA_HORA, ESTA_ACTIVO, ELIMINADO, FECHA_INSCRIPCION, RUT, NUMERO_FICHA, CODIGO_FAMILIA, ES_ESPECIAL, SEC_ID )
--    VALUES ( @NOD_ANTERIOR, @ID, 6, @NOD_ID, @FNP_ID, GETDATE(), 0, 0, @FECHA_INSCRIPCION_ATERIOR, @RUT, @NUMERO_FICHA_ANTERIOR, @CODIGO_FAMILIA_ANTERIOR, @ESTADO_ESPECIAL_ANTERIOR, @SEC_ID_ANTERIOR )
--    INSERT INTO HIU_HISTORIAL_INSCRIPCION_DE_USUARIO ( NOD_ID, USP_ID, NOD_ID2, FNP_ID, FECHA_HORA, ESTA_ACTIVO, ELIMINADO, FECHA_INSCRIPCION, RUT, NUMERO_FICHA, CODIGO_FAMILIA, ES_ESPECIAL, SEC_ID )
--    VALUES ( @NOD_ANTERIOR, @ID, @NOD_ID, @FNP_ID, GETDATE(), 1, 0, @FECHA_INSCRIPCION, @RUT, @O_NUMERO_DE_FICHA, @CODIGO_FAMILIA, @ESESPECIAL, @SEC_ID )
--END

--IF (@NOD_ANTERIOR <> @NOD_ID AND @ESTADO_ANTERIOR = 0 AND @ACTIVO = 1)
--BEGIN
--    INSERT INTO HIU_HISTORIAL_INSCRIPCION_DE_USUARIO ( NOD_ID, USP_ID, NOD_ID2, FNP_ID, FECHA_HORA, ESTA_ACTIVO, ELIMINADO, FECHA_INSCRIPCION, RUT, NUMERO_FICHA, CODIGO_FAMILIA, ES_ESPECIAL, SEC_ID )
--    VALUES ( @NOD_ANTERIOR, @ID, @NOD_ID, @FNP_ID, GETDATE(), 1, 0, @FECHA_INSCRIPCION, @RUT, @O_NUMERO_DE_FICHA, @CODIGO_FAMILIA, @ESESPECIAL, @SEC_ID )
--END

END


GO
