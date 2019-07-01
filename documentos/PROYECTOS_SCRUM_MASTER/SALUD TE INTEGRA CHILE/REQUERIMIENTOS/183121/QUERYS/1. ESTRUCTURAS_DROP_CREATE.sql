USE [SALUD_TE_INTEGRA_CHILE]
GO

/****** Object:  Table [dbo].[ECO_ENTIDAD_CONTRATANTE]    Script Date: 03-06-2019 15:23:24 ******/
DROP TABLE [dbo].[ECO_ENTIDAD_CONTRATANTE]
GO

/****** Object:  Table [dbo].[ECO_ENTIDAD_CONTRATANTE]    Script Date: 03-06-2019 15:23:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ECO_ENTIDAD_CONTRATANTE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RAZON_SOCIAL] [varchar](250) NULL,
	[FECHA_INICIO_CONTRATO] [datetime] NULL,
	[REG_ID] [int] NULL,
	[COM_ID] [int] NULL,
	[DIRECCION] [varchar](500) NULL,
	[RESTO_DIRECCION] [varchar](500) NULL,
	[NUMERO_DIRECCION] [varchar](250) NULL,
	[ACTIVO] [int] NULL,
	[ECOL_ID_WEBLUN] [int] NULL,
	[ELIMINADO] [int] NULL,
 CONSTRAINT [PK_ECO_ENTIDAD_CONTRATANTE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/*
AHORA REALIZAMOS TRUNCATE A LAS TABLAS ANEXAS
*/

TRUNCATE table AUS_AUTENTIFICACION_USUARIO
go
TRUNCATE table PRE_PARAMETROS_ECOL
go
TRUNCATE TABLE PER_PERSONA
GO

/*
OPERACIONES PARA AGREGAR LA ENTIDAD CONTRATANTE SS. SUR

*/
declare @razon_social varchar(250)
DECLARE @TOPE_USUARIOS INT
--aca ingrese los parametros que van a ser insertados
--en la entidad contratante
set @razon_social = 'Servicio de Salud Metropolitano Sur'
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
		   ,[ECOL_ID_WEBLUN]
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
		   ,23--CORRESPONDE AL SS METRO SUR
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

go
/* INSERT A LA TABLA AUS */

INSERT INTO [dbo].[AUS_AUTENTIFICACION_USUARIO]
           ([NOMBRE_USUARIO]
           ,[PASSWORD]
           ,[ELIMINADO]
           ,[ACTIVO]
           ,[FECHA_CREACION]
           ,[ECOL_ID]
           ,[ROL_ID])
     VALUES
           ('vcoronado'
           ,'MQAyADMANAA1ADYANwA='
           ,0
           ,1
           ,GETDATE()
           ,0
           ,1)
GO
/* insert a la tabla per_persona */

INSERT INTO [dbo].[PER_PERSONA]
           ([NOMBRES]
           ,[APELLIDO_PATERNO]
           ,[APELLIDO_MATERNO]
           ,[RUN]
           ,[CORREO_ELECTRONICO]
           ,[TELEFONO_CONTACTO_UNO]
           ,[TELEFONO_CONTACTO_DOS]
           ,[ACTIVO]
           ,[ELIMINADO]
           ,[AUS_ID])
     VALUES
           ('Víctor'
           ,'Coronado'
           ,'Alarcón'
           ,''
           ,'vcoronado.alarcon@gmail.com'
           ,''
           ,''
           ,1
           ,0
           ,1)
GO
/* truncate a otras tablas */
truncate table RL_AUS_NODO
GO
TRUNCATE TABLE RL_ECO_NODO
GO
