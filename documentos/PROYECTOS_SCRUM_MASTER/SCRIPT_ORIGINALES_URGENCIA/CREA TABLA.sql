

CREATE TABLE [NODOS_APPS]([ID] INT IDENTITY(1,1) NOT NULL,
	[COD_DEIS] varchar(50) NULL,
	[COD_REG] int NULL,
	[REGION] varchar(50) NULL,
	[SS_ID] int NULL,
	[SS] varchar(50) NULL,
	[NIVEL_ATEN] varchar(50) NULL,
	[ID_NIVEL_ATEN] int NULL,
	[ID_NODO] int NULL,
	[RAZON_SOCIAL] varchar(50) NULL,
	[COM_ID] int NULL,
	[COMUNA] varchar(50) NULL,
	[DIRECCION] varchar(100) NULL,
	[TELEFONO] varchar(50) NULL,
	[CL_SAPU] varchar(50) NULL,
	[OBSERVACION] varchar(300) NULL,
	[ACTIVO] int NULL,
	[ES_RAYEN] int NULL,
	[HH_LUN_VIE] varchar(50) NULL,
	[HH_SAB_DOM] varchar(50) NULL,
	[LAT] varchar(50) NULL,
	[LON] varchar(50) NULL,
	[GEOLOCALIZACION] geography NULL
) 
