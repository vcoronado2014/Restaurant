USE [RAYEN]

GO
	IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NODOS_APPS]') AND type = N'U') 
	--Se ELIMINA
	DROP TABLE [dbo].[NODOS_APPS]
GO

/****** Object:  Table [dbo].[NODOS_APPS]    Script Date: 21-12-2017 17:47:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[NODOS_APPS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[COD_DEIS] [varchar](50) NULL,
	[COD_REG] [int] NULL,
	[REGION] [varchar](50) NULL,
	[SS_ID] [int] NULL,
	[SS] [varchar](50) NULL,
	[NIVEL_ATEN] [varchar](50) NULL,
	[ID_NIVEL_ATEN] [int] NULL,
	[ID_NODO] [int] NULL,
	[RAZON_SOCIAL] [varchar](50) NULL,
	[COM_ID] [int] NULL,
	[COMUNA] [varchar](50) NULL,
	[DIRECCION] [varchar](100) NULL,
	[TELEFONO] [varchar](50) NULL,
	[CL_SAPU] [varchar](50) NULL,
	[OBSERVACION] [varchar](300) NULL,
	[ACTIVO] [int] NULL,
	[ES_RAYEN] [int] NULL,
	[HH_LUN_VIE] [varchar](50) NULL,
	[HH_SAB_DOM] [varchar](50) NULL,
	[LAT] [varchar](50) NULL,
	[LON] [varchar](50) NULL,
	[GEOLOCALIZACION] [geography] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


