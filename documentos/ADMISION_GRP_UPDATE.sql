USE [RYF]
GO

/****** Object:  StoredProcedure [dbo].[ADMISION_GRP_UPDATE]    Script Date: 30-11-2016 12:22:02 ******/
DROP PROCEDURE [dbo].[ADMISION_GRP_UPDATE]
GO

/****** Object:  StoredProcedure [dbo].[ADMISION_GRP_UPDATE]    Script Date: 30-11-2016 12:22:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ADMISION_GRP_UPDATE]
@ID int,
@PER_ID int,
@FECHA_VALIDEZ BIGINT,
@REG_ID int,
@PRV_ID int,
@COM_ID varchar(50) = null,
@LOCALIDAD varchar(50) = null,
@NOMBRE_VIA varchar(50) = null,
@NUMERO varchar(50) = null,
--@RESTO_DIRECCION varchar(50) = null,
@CODIGO_POSTAL varchar(50) = null,
@EMAIL varchar(50) = null,
@TIPO_VIA int,
@CONTACTO varchar(50) = null,
@CODIGO_ESTABLECIMIENTO varchar(50) = null,
@TIPO_DIRECCION int,
@KM varchar(50) = null,
@TID timestamp,
@PAIS INTEGER,
@VILLA_POBLACION varchar(50) = null,
@BLOCK varchar(50) = null,
@DEPTO varchar(50) = null,
@SITIO varchar(50) = null,
@UNIDAD_VECINAL varchar(50) = null,
@RUN_FUNCIONARIO_REGISTRA varchar(100) = null,
@O_TID timestamp OUTPUT
as
begin
update GRP_GEO_REFERENCIA_PERSONA
set
PER_ID = @PER_ID,
FECHA_VALIDEZ = @FECHA_VALIDEZ,
REG_ID = @REG_ID,
PRV_ID = @PRV_ID,
COM_ID = @COM_ID,
LOCALIDAD = @LOCALIDAD,
NOMBRE_VIA = @NOMBRE_VIA,
NUMERO = @NUMERO,
--RESTO_DIRECCION = @RESTO_DIRECCION,
CODIGO_POSTAL = @CODIGO_POSTAL,
EMAIL = @EMAIL,
TIPO_VIA = @TIPO_VIA,
CONTACTO = @CONTACTO,
CODIGO_ESTABLECIMIENTO = @CODIGO_ESTABLECIMIENTO,
TIPO_DIRECCION = @TIPO_DIRECCION,
KM = @KM,
PAIS = @PAIS,
VILLA_POBLACION = @VILLA_POBLACION,
BLOCK = @BLOCK,
DEPTO = @DEPTO,
SITIO = @SITIO,
UNIDAD_VECINAL = @UNIDAD_VECINAL,
RUN_FUNCIONARIO_REGISTRA = @RUN_FUNCIONARIO_REGISTRA

where
ID = @ID
and TID = @TID

SELECT @O_TID=TID FROM GRP_GEO_REFERENCIA_PERSONA WHERE ID =@ID

if (@EMAIL is not null or @EMAIL <> '')
      UPDATE ACE_ALERTA_CONTACTO_ERRONEO set EMAIL = 0 where PER_ID = @per_id

end

GO

