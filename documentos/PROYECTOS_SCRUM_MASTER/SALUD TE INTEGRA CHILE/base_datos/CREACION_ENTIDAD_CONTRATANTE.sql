USE [SALUD_TE_INTEGRA_CHILE]
GO

declare @razon_social varchar(250)
DECLARE @TOPE_USUARIOS INT
--aca ingrese los parametros que van a ser insertados
--en la entidad contratante
set @razon_social = 'Calidad Rayen Salud'
SET @TOPE_USUARIOS = 100

if (select COUNT(*) from ECO_ENTIDAD_CONTRATANTE where RAZON_SOCIAL = @razon_social) > 0
begin
	print 'NO SE PUEDE AGREGAR, LA ENTIDAD CONTRATANTE NO EXISTE'
end
else
begin
	DECLARE @ID_ECO INT
	--insert a la tabla ECO_ENTIDAD_CONTRATANTE
	INSERT INTO [dbo].[ECO_ENTIDAD_CONTRATANTE]
           ([RAZON_SOCIAL]
           ,[FECHA_INICIO_CONTRATO]
           ,[REG_ID]
           ,[COM_ID]
           ,[DIRECCION]
           ,[RESTO_DIRECCION]
           ,[NUMERO_DIRECCION]
           ,[ACTIVO]
           ,[ELIMINADO])
     VALUES
           (@razon_social
           ,GETDATE()
           ,13
           ,30
           ,''
           ,''
           ,''
           ,1
           ,0)
	PRINT 'ENTIDAD CONTRATANTE CREADA POR ÉXITO'
	--OBTENEMOS EL ID DE LA ENTIDAD CONTRATANTE
	SET @ID_ECO = (SELECT ID FROM ECO_ENTIDAD_CONTRATANTE WHERE RAZON_SOCIAL = @razon_social)
	--INSERT A LA TABLA PARAMETROS
	INSERT INTO [dbo].[PRE_PARAMETROS_ECOL]
           ([ECOL_ID]
           ,[ENVIA_CORREO]
           ,[LOGO_UNO]
           ,[LOGO_DOS]
           ,[MUESTRA_LOGO_UNO]
           ,[MUESTRA_LOGO_DOS]
           ,[TOPE_USUARIOS]
           ,[FECHA_TERMINO_CONTRATO]
           ,[ACTIVO]
           ,[ELIMINADO])
     VALUES
           (@ID_ECO
           ,0
           ,''
           ,''
           ,0
           ,0
           ,@TOPE_USUARIOS
           ,'01-01-2020'
           ,1
           ,0)

end








