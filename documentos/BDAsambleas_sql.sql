ALTER TABLE [dbo].[atr_archivos_tricel] DROP CONSTRAINT [DF__atr_archi__ELIMI__1ED998B2]
GO
ALTER TABLE [dbo].[atr_archivos_tricel] DROP CONSTRAINT [DF__atr_archi__TRI_I__1DE57479]
GO
/****** Object:  Table [dbo].[vtr_vot_tricel]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[vtr_vot_tricel]
GO
/****** Object:  Table [dbo].[vot_votaciones]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[vot_votaciones]
GO
/****** Object:  Table [dbo].[vi_vinculos_institucion]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[vi_vinculos_institucion]
GO
/****** Object:  Table [dbo].[usl_usuario_lista]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[usl_usuario_lista]
GO
/****** Object:  Table [dbo].[tri_tricel]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[tri_tricel]
GO
/****** Object:  Table [dbo].[rpt_responsable_tricel]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[rpt_responsable_tricel]
GO
/****** Object:  Table [dbo].[rol_rol]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[rol_rol]
GO
/****** Object:  Table [dbo].[reg_region]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[reg_region]
GO
/****** Object:  Table [dbo].[prov_provincia]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[prov_provincia]
GO
/****** Object:  Table [dbo].[pro_proyectos]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[pro_proyectos]
GO
/****** Object:  Table [dbo].[per_persona]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[per_persona]
GO
/****** Object:  Table [dbo].[ltr_lista_tricel]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[ltr_lista_tricel]
GO
/****** Object:  Table [dbo].[lgu_login_usuario]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[lgu_login_usuario]
GO
/****** Object:  Table [dbo].[inst_institucion]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[inst_institucion]
GO
/****** Object:  Table [dbo].[ieg_ingreso_egreso]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[ieg_ingreso_egreso]
GO
/****** Object:  Table [dbo].[gi_grupo_item]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[gi_grupo_item]
GO
/****** Object:  Table [dbo].[enc_encabezado]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[enc_encabezado]
GO
/****** Object:  Table [dbo].[eg_elementos_grupo]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[eg_elementos_grupo]
GO
/****** Object:  Table [dbo].[doc_documentos_usuario]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[doc_documentos_usuario]
GO
/****** Object:  Table [dbo].[doc_documentos]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[doc_documentos]
GO
/****** Object:  Table [dbo].[cur_curso]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[cur_curso]
GO
/****** Object:  Table [dbo].[cua_curso_apoderado]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[cua_curso_apoderado]
GO
/****** Object:  Table [dbo].[coni_configuracion_institucion]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[coni_configuracion_institucion]
GO
/****** Object:  Table [dbo].[com_comuna]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[com_comuna]
GO
/****** Object:  Table [dbo].[cal_calendario]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[cal_calendario]
GO
/****** Object:  Table [dbo].[au_autentificacion_usuario]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[au_autentificacion_usuario]
GO
/****** Object:  Table [dbo].[atr_archivos_tricel]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[atr_archivos_tricel]
GO
/****** Object:  Table [dbo].[arti_articulo]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[arti_articulo]
GO
/****** Object:  Table [dbo].[arc_archivos_proyecto]    Script Date: 25-11-2016 15:22:31 ******/
DROP TABLE [dbo].[arc_archivos_proyecto]
GO
/****** Object:  Table [dbo].[arc_archivos_proyecto]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[arc_archivos_proyecto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RUTA_ARCHIVO] [varchar](500) NULL,
	[PRO_ID] [int] NULL DEFAULT ((0)),
	[ELIMINADO] [int] NULL DEFAULT ((0)),
 CONSTRAINT [primary key] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[arti_articulo]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[arti_articulo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VISIBLE] [int] NOT NULL DEFAULT ((0)),
	[USA_IMAGEN] [int] NOT NULL DEFAULT ((0)),
	[URL_IMAGEN] [varchar](500) NOT NULL DEFAULT ('0'),
	[FECHA] [varchar](250) NOT NULL DEFAULT ('0'),
	[USA_FECHA] [int] NOT NULL DEFAULT ((0)),
	[USA_TITULO] [int] NOT NULL DEFAULT ((0)),
	[TITULO] [varchar](1000) NOT NULL DEFAULT ('0'),
	[CONTENIDO] [varchar](5000) NOT NULL DEFAULT ('0'),
	[INST_ID] [int] NOT NULL DEFAULT ((0)),
	[TIPO_ARTICULO] [int] NULL DEFAULT ((1)),
	[ELIMINADO] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [primary key1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[atr_archivos_tricel]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[atr_archivos_tricel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RUTA_ARCHIVO] [varchar](500) NULL,
	[TRI_ID] [int] NULL,
	[ELIMINADO] [int] NULL,
 CONSTRAINT [primary key2] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[au_autentificacion_usuario]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[au_autentificacion_usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE_USUARIO] [varchar](250) NOT NULL DEFAULT ('0'),
	[PASSWORD] [varchar](250) NOT NULL DEFAULT ('0'),
	[CORREO_ELECTRONICO] [varchar](250) NOT NULL DEFAULT ('0'),
	[ROL_ID] [int] NOT NULL DEFAULT ((0)),
	[ES_VIGENTE] [int] NOT NULL DEFAULT ((0)),
	[INST_ID] [int] NOT NULL DEFAULT ((0)),
	[ELIMINADO] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [primary key3] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cal_calendario]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cal_calendario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TITULO] [varchar](250) NULL,
	[URL] [varchar](250) NULL,
	[FECHA_INICIO] [datetime2](7) NULL DEFAULT (getdate()),
	[FECHA_TERMINO] [datetime2](7) NULL DEFAULT (getdate()),
	[DETALLE] [varchar](500) NULL,
	[ELIMINADO] [int] NULL DEFAULT ((0)),
	[INST_ID] [int] NULL DEFAULT ((0)),
	[ASUNTO] [varchar](500) NULL,
	[UBICACION] [varchar](500) NULL,
	[ETIQUETA] [int] NULL DEFAULT ((0)),
	[DESCRIPCION] [varchar](500) NULL,
	[STATUS] [int] NULL DEFAULT ((0)),
	[TIPO] [int] NULL DEFAULT ((0)),
 CONSTRAINT [primary key4] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[com_comuna]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[com_comuna](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PROV_ID] [int] NOT NULL,
	[NOMBRE] [varchar](30) NULL,
 CONSTRAINT [primary key5] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[PROV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[coni_configuracion_institucion]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coni_configuracion_institucion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[INST_ID] [int] NULL DEFAULT ((0)),
	[ENVIA_DOCUMENTOS] [int] NULL DEFAULT ((0)),
	[ENVIA_PROYECTOS] [int] NULL DEFAULT ((0)),
	[ENVIA_RENDICIONES] [int] NULL DEFAULT ((0)),
	[ENVIA_CORREO_EVENTOS] [int] NULL DEFAULT ((0)),
	[ELIMINADO] [int] NULL DEFAULT ((0)),
 CONSTRAINT [primary key6] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cua_curso_apoderado]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cua_curso_apoderado](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[INST_ID] [int] NULL DEFAULT ((0)),
	[USU_ID] [int] NULL DEFAULT ((0)),
	[CUR_ID] [int] NULL DEFAULT ((0)),
 CONSTRAINT [primary key7] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cur_curso]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cur_curso](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[INST_ID] [int] NULL DEFAULT ((0)),
	[NOMBRE] [varchar](500) NULL DEFAULT ('0'),
	[ID_USU_RESPONSABLE] [int] NULL DEFAULT ((0)),
	[ELIMINADO] [int] NULL DEFAULT ((0)),
	[ORDEN] [int] NULL DEFAULT ((0)),
	[TIPO] [int] NULL DEFAULT ((0)),
	[GRUPO] [varchar](500) NULL,
	[SUB_GRUPO] [varchar](500) NULL,
 CONSTRAINT [primary key8] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[doc_documentos]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[doc_documentos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USU_ID] [int] NOT NULL DEFAULT ((0)),
	[INST_ID] [int] NOT NULL DEFAULT ((0)),
	[NOMBRE_ARCHIVO] [varchar](250) NOT NULL DEFAULT ('0'),
	[URL] [varchar](1000) NOT NULL DEFAULT ('0'),
	[TAMANO] [int] NOT NULL DEFAULT ((0)),
	[FECHA_SUBIDA] [varchar](50) NULL,
	[EXTENSION] [varchar](250) NULL,
	[ELIMINADO] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [primary key9] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[doc_documentos_usuario]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[doc_documentos_usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USU_ID] [int] NOT NULL DEFAULT ((0)),
	[INST_ID] [int] NOT NULL DEFAULT ((0)),
	[NOMBRE_ARCHIVO] [varchar](250) NOT NULL DEFAULT ('0'),
	[URL] [varchar](1000) NOT NULL DEFAULT ('0'),
	[TAMANO] [int] NOT NULL DEFAULT ((0)),
	[FECHA_SUBIDA] [varchar](50) NULL,
	[EXTENSION] [varchar](250) NULL,
	[ELIMINADO] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [primary key10] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[eg_elementos_grupo]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[eg_elementos_grupo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_GRUPO] [int] NOT NULL DEFAULT ((0)),
	[HREF_ITEM] [varchar](250) NULL DEFAULT ('0'),
	[CLASS_ITEM] [varchar](250) NULL DEFAULT ('0'),
	[NOMBRE] [varchar](250) NULL DEFAULT ('0'),
	[ROLES_ID] [varchar](500) NULL DEFAULT ('0'),
 CONSTRAINT [primary key11] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[enc_encabezado]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[enc_encabezado](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USA_IMAGEN_SUPERIOR] [int] NOT NULL DEFAULT ((0)),
	[URL_IMAGEN_SUPERIOR] [varchar](500) NOT NULL DEFAULT ('0'),
	[TITULO_ENCABEZADO] [varchar](1000) NOT NULL DEFAULT ('0'),
	[SUBTITULO_ENCABEZADO] [varchar](1000) NOT NULL DEFAULT ('0'),
	[ELIMINADO] [int] NOT NULL DEFAULT ((0)),
	[INST_ID] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [primary key12] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[gi_grupo_item]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[gi_grupo_item](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ES_GRUPO] [int] NOT NULL DEFAULT ((0)),
	[HREF_GRUPO] [varchar](250) NULL DEFAULT ('0'),
	[CLASS_GRUPO] [varchar](250) NULL DEFAULT ('0'),
	[NOMBRE_GRUPO] [varchar](250) NULL DEFAULT ('0'),
	[ROLES_ID] [varchar](500) NULL DEFAULT ('0'),
 CONSTRAINT [primary key13] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ieg_ingreso_egreso]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ieg_ingreso_egreso](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[INST_ID] [int] NOT NULL DEFAULT ((0)),
	[USU_ID] [int] NOT NULL DEFAULT ((0)),
	[FECHA_MOVIMIENTO] [datetime2](7) NOT NULL DEFAULT ('0001-01-01'),
	[TIPO_MOVIMIENTO] [int] NOT NULL DEFAULT ((0)),
	[NUMERO_COMPROBANTE] [varchar](100) NOT NULL DEFAULT ('0'),
	[DETALLE] [varchar](500) NOT NULL DEFAULT ('0'),
	[MONTO] [int] NOT NULL DEFAULT ((0)),
	[URL_DOCUMENTO] [varchar](250) NOT NULL DEFAULT ('0'),
	[ELIMINADO] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [primary key14] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[inst_institucion]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[inst_institucion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](500) NOT NULL DEFAULT ('0'),
	[REG_ID] [int] NOT NULL,
	[COM_ID] [int] NOT NULL,
	[ELIMINADO] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [primary key15] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lgu_login_usuario]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lgu_login_usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USU_ID] [int] NOT NULL DEFAULT ((0)),
	[FECHA_MOVIMIENTO] [datetime2](7) NOT NULL DEFAULT (getdate()),
	[TIPO_MOVIMIENTO] [varchar](50) NOT NULL,
 CONSTRAINT [primary key16] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ltr_lista_tricel]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ltr_lista_tricel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TRI_ID] [int] NOT NULL DEFAULT ((0)),
	[INST_ID] [int] NOT NULL DEFAULT ((0)),
	[USU_ID] [int] NOT NULL DEFAULT ((0)),
	[ROL] [varchar](500) NOT NULL,
	[ELIMINADO] [int] NOT NULL DEFAULT ((0)),
	[NOMBRE] [varchar](500) NULL,
	[OBJETIVO] [varchar](500) NULL,
	[DESCRIPCION] [varchar](500) NULL,
	[BENEFICIOS] [varchar](500) NULL,
	[FECHA_INICIO] [datetime2](7) NULL DEFAULT (getdate()),
	[FECHA_TERMINO] [datetime2](7) NULL DEFAULT (getdate()),
 CONSTRAINT [primary key17] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[per_persona]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[per_persona](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RUT] [varchar](50) NOT NULL,
	[NOMBRES] [varchar](250) NULL,
	[APELLIDO_PATERNO] [varchar](250) NULL,
	[APELLIDO_MATERNO] [varchar](250) NULL,
	[PAIS_ID] [int] NOT NULL,
	[REG_ID] [int] NOT NULL,
	[COM_ID] [int] NOT NULL,
	[DIRECCION_COMPLETA] [varchar](500) NULL,
	[INST_ID] [int] NOT NULL DEFAULT ((0)),
	[USU_ID] [int] NOT NULL,
	[TELEFONOS] [varchar](250) NULL,
	[ELIMINADO] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [primary key18] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pro_proyectos]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pro_proyectos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FECHA_CREACION] [datetime2](7) NULL,
	[USU_ID_CREADOR] [int] NOT NULL DEFAULT ((0)),
	[INST_ID] [int] NOT NULL DEFAULT ((0)),
	[NOMBRE] [varchar](500) NOT NULL DEFAULT ('0'),
	[OBJETIVO] [varchar](1500) NULL DEFAULT ('0'),
	[DESCRIPCION] [varchar](1500) NULL DEFAULT ('0'),
	[BENEFICIOS] [varchar](1500) NULL DEFAULT ('0'),
	[COSTO] [int] NULL DEFAULT ((0)),
	[FECHA_INICIO] [datetime2](7) NULL,
	[FECHA_TERMINO] [datetime2](7) NULL,
	[ENVIA_CORREO] [int] NULL DEFAULT ((0)),
	[NOTIFICA_POPUP] [int] NULL DEFAULT ((0)),
	[ES_VIGENTE] [int] NULL DEFAULT ((0)),
	[ELIMINADO] [int] NULL DEFAULT ((0)),
	[FUE_APROBADO] [int] NULL DEFAULT ((0)),
 CONSTRAINT [primary key19] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[prov_provincia]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[prov_provincia](
	[ID] [int] NOT NULL,
	[REG_ID] [int] NOT NULL,
	[NOMBRE] [varchar](30) NOT NULL,
	[NUMERO_COMUNAS] [int] NOT NULL,
 CONSTRAINT [primary key20] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reg_region]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reg_region](
	[ID] [int] NOT NULL,
	[NOMBRE] [varchar](60) NOT NULL,
	[ROMANO] [varchar](5) NOT NULL,
	[NUMERO_PROVINCIAS] [int] NOT NULL,
	[NUMERO_COMUNAS] [int] NOT NULL,
 CONSTRAINT [primary key21] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rol_rol]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rol_rol](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](250) NOT NULL DEFAULT ('0'),
	[DESCRIPCION] [varchar](500) NULL DEFAULT ('0'),
	[ELIMINADO] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [primary key22] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rpt_responsable_tricel]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rpt_responsable_tricel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TRI_ID] [int] NOT NULL DEFAULT ((0)),
	[USU_ID] [int] NOT NULL DEFAULT ((0)),
	[ELIMINADO] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [primary key23] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tri_tricel]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tri_tricel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FECHA_CREACION] [datetime2](7) NOT NULL DEFAULT (getdate()),
	[USU_ID_CREADOR] [int] NOT NULL DEFAULT ((0)),
	[INST_ID] [int] NOT NULL DEFAULT ((0)),
	[NOMBRE] [varchar](500) NOT NULL,
	[OBJETIVO] [varchar](500) NOT NULL,
	[FECHA_INICIO] [datetime2](7) NOT NULL,
	[FECHA_TERMINO] [datetime2](7) NOT NULL,
	[ES_VIGENTE] [int] NOT NULL DEFAULT ((0)),
	[ELIMINADO] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [primary key24] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usl_usuario_lista]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usl_usuario_lista](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USU_ID] [int] NOT NULL DEFAULT ((0)),
	[ELIMINADO] [int] NOT NULL DEFAULT ((0)),
	[LTR_ID] [int] NOT NULL DEFAULT ((0)),
	[ROL] [varchar](500) NULL,
 CONSTRAINT [primary key25] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[vi_vinculos_institucion]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vi_vinculos_institucion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[INST_ID] [int] NOT NULL DEFAULT ((0)),
	[IMAGEN_VINCULO_1] [varchar](200) NOT NULL DEFAULT ('0'),
	[URL_VINCULO_1] [varchar](200) NOT NULL DEFAULT ('0'),
	[TEXTO_VINCULO_1] [varchar](200) NOT NULL DEFAULT ('0'),
	[VISIBLE_VINCULO_1] [int] NOT NULL DEFAULT ((0)),
	[VISIBLE_VINCULO_2] [int] NOT NULL DEFAULT ((0)),
	[IMAGEN_VINCULO_2] [varchar](200) NOT NULL DEFAULT ('0'),
	[URL_VINCULO_2] [varchar](200) NOT NULL DEFAULT ('0'),
	[TEXTO_VINCULO_2] [varchar](200) NOT NULL DEFAULT ('0'),
	[VISIBLE_VINCULO_3] [int] NOT NULL DEFAULT ((0)),
	[IMAGEN_VINCULO_3] [varchar](200) NOT NULL DEFAULT ('0'),
	[URL_VINCULO_3] [varchar](200) NOT NULL DEFAULT ('0'),
	[TEXTO_VINCULO_3] [varchar](200) NOT NULL DEFAULT ('0'),
 CONSTRAINT [primary key26] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[vot_votaciones]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vot_votaciones](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PRO_ID] [int] NOT NULL DEFAULT ((0)),
	[INST_ID] [int] NOT NULL DEFAULT ((0)),
	[USU_ID_VOTADOR] [int] NOT NULL DEFAULT ((0)),
	[FECHA_VOTACION] [datetime2](7) NOT NULL,
	[VALOR] [int] NOT NULL DEFAULT ((0)),
	[ELIMINADO] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [primary key27] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vtr_vot_tricel]    Script Date: 25-11-2016 15:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vtr_vot_tricel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LTR_ID] [int] NOT NULL DEFAULT ((0)),
	[TRI_ID] [int] NOT NULL DEFAULT ((0)),
	[INST_ID] [int] NOT NULL DEFAULT ((0)),
	[USU_ID_VOTADOR] [int] NOT NULL DEFAULT ((0)),
	[FECHA_VOTACION] [datetime2](7) NOT NULL,
	[ELIMINADO] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [primary key28] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[arc_archivos_proyecto] ON 

GO
INSERT [dbo].[arc_archivos_proyecto] ([ID], [RUTA_ARCHIVO], [PRO_ID], [ELIMINADO]) VALUES (1, N'~/ArchivosProyectos/ajj0optt.hqj DTO-732 11-FEB-1998-Estatutos Tipos.pdf', 1, 0)
GO
INSERT [dbo].[arc_archivos_proyecto] ([ID], [RUTA_ARCHIVO], [PRO_ID], [ELIMINADO]) VALUES (3, N'* TRIAL * TR', 1, 0)
GO
INSERT [dbo].[arc_archivos_proyecto] ([ID], [RUTA_ARCHIVO], [PRO_ID], [ELIMINADO]) VALUES (4, N'Nueva Ruta', 1, 0)
GO
INSERT [dbo].[arc_archivos_proyecto] ([ID], [RUTA_ARCHIVO], [PRO_ID], [ELIMINADO]) VALUES (5, N'Nueva Ruta', 1, 0)
GO
INSERT [dbo].[arc_archivos_proyecto] ([ID], [RUTA_ARCHIVO], [PRO_ID], [ELIMINADO]) VALUES (6, N'Nueva Ruta', 1, 0)
GO
INSERT [dbo].[arc_archivos_proyecto] ([ID], [RUTA_ARCHIVO], [PRO_ID], [ELIMINADO]) VALUES (7, N'Nueva Ruta', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[arc_archivos_proyecto] OFF
GO
SET IDENTITY_INSERT [dbo].[arti_articulo] ON 

GO
INSERT [dbo].[arti_articulo] ([ID], [VISIBLE], [USA_IMAGEN], [URL_IMAGEN], [FECHA], [USA_FECHA], [USA_TITULO], [TITULO], [CONTENIDO], [INST_ID], [TIPO_ARTICULO], [ELIMINADO]) VALUES (1, 0, 1, N'~/img/imgArticulo_1.png', N'* TRIAL * ', 0, 1, N'¿QUIENES SOMOS?', N'Una plataforma de gestión para los centros de padres y apoderados de cualquier tipo de instituciones o establecimiento. 
El foco fundamental esta centrado en la gestión de las actividades del centro de padres y la trasnparencia de los estados de cuentas y flujos economicos producto de la gestion del centro de padres y apoderados. ', 3, 1, 0)
GO
INSERT [dbo].[arti_articulo] ([ID], [VISIBLE], [USA_IMAGEN], [URL_IMAGEN], [FECHA], [USA_FECHA], [USA_TITULO], [TITULO], [CONTENIDO], [INST_ID], [TIPO_ARTICULO], [ELIMINADO]) VALUES (2, 0, 1, N'* TRIAL * TRIAL * TRIAL', N'14-12-2015', 0, 1, N'NUESTRA VISIÓN', N'Ser la mejor mejor herramienta de gestion y transparencia para los centros de padres y apoderados asi también un mecanismo moderno de interacción educativa entre los establecimientos y la comunidad estudiantil. ', 3, 1, 0)
GO
INSERT [dbo].[arti_articulo] ([ID], [VISIBLE], [USA_IMAGEN], [URL_IMAGEN], [FECHA], [USA_FECHA], [USA_TITULO], [TITULO], [CONTENIDO], [INST_ID], [TIPO_ARTICULO], [ELIMINADO]) VALUES (3, 0, 1, N'~/img/imgArticulo_3.png', N'14-12-2015', 0, 1, N'NUESTROS SERVICIOS', N'* TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL', 3, 1, 0)
GO
INSERT [dbo].[arti_articulo] ([ID], [VISIBLE], [USA_IMAGEN], [URL_IMAGEN], [FECHA], [USA_FECHA], [USA_TITULO], [TITULO], [CONTENIDO], [INST_ID], [TIPO_ARTICULO], [ELIMINADO]) VALUES (4, 0, 1, N'~/img/imgArticulo_4.png', N'* TRIAL * ', 0, 1, N'NUESTRO COLEGIO', N'* TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRI', 4, 1, 0)
GO
INSERT [dbo].[arti_articulo] ([ID], [VISIBLE], [USA_IMAGEN], [URL_IMAGEN], [FECHA], [USA_FECHA], [USA_TITULO], [TITULO], [CONTENIDO], [INST_ID], [TIPO_ARTICULO], [ELIMINADO]) VALUES (5, 0, 1, N'* TRIAL * TRIAL * TRIAL', N'14-12-2015', 0, 1, N'* TRIAL * TRIAL ', N'* TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL ', 4, 1, 0)
GO
INSERT [dbo].[arti_articulo] ([ID], [VISIBLE], [USA_IMAGEN], [URL_IMAGEN], [FECHA], [USA_FECHA], [USA_TITULO], [TITULO], [CONTENIDO], [INST_ID], [TIPO_ARTICULO], [ELIMINADO]) VALUES (6, 0, 1, N'~/img/imgArticulo_6.png', N'14-12-2015', 0, 1, N'MISIÓN', N'Nuestra misión es formar mujeres líderes, comprometidas con los valores del Evangelio, con un profundo sentimiento de gratitud y amor por la vida, que aspiren a la excelencia humana, mediante el desarrollo de las habilidades y capacidades personales. Ésta se promueve en un estilo de vida comunitario, favorecido por un clima afectivo-familiar.', 4, 1, 0)
GO
INSERT [dbo].[arti_articulo] ([ID], [VISIBLE], [USA_IMAGEN], [URL_IMAGEN], [FECHA], [USA_FECHA], [USA_TITULO], [TITULO], [CONTENIDO], [INST_ID], [TIPO_ARTICULO], [ELIMINADO]) VALUES (7, 0, 1, N'~/img/imgArticulo_4.png', N'14-12-2015', 0, 1, N'NUESTRO COLEGIO', N'El Colegio Santa Elena fue fundado el año 1913 por las Hermanas Carmelitas de la Caridad. Estos 100 años de existencia nos avalan como una institución que ha estado permanentemente preocupada por la educación de niñas y jóvenes, formando mujeres líderes de nuestra sociedad, lo que hoy significa seguir aspirando a que ellas logren la excelencia humana, mediante el desarrollo de sus habilidades y capacidades personales.', 5, 1, 0)
GO
INSERT [dbo].[arti_articulo] ([ID], [VISIBLE], [USA_IMAGEN], [URL_IMAGEN], [FECHA], [USA_FECHA], [USA_TITULO], [TITULO], [CONTENIDO], [INST_ID], [TIPO_ARTICULO], [ELIMINADO]) VALUES (8, 0, 1, N'* TRIAL * TRIAL * TRIAL', N'14-12-2015', 0, 1, N'* TRIAL * TRIAL ', N'El Centro de Padres y Apoderados del Colegio (CPA) nace el año 2003, producto de la fusión de los Centros de Padres y Apoderados de las distintas sedes.', 5, 1, 0)
GO
INSERT [dbo].[arti_articulo] ([ID], [VISIBLE], [USA_IMAGEN], [URL_IMAGEN], [FECHA], [USA_FECHA], [USA_TITULO], [TITULO], [CONTENIDO], [INST_ID], [TIPO_ARTICULO], [ELIMINADO]) VALUES (9, 0, 1, N'~/img/imgArticulo_6.png', N'14-12-2015', 0, 1, N'MISIÓN', N'Nuestra misión es formar mujeres líderes, comprometidas con los valores del Evangelio, con un profundo sentimiento de gratitud y amor por la vida, que aspiren a la excelencia humana, mediante el desarrollo de las habilidades y capacidades personales. Ésta se promueve en un estilo de vida comunitario, favorecido por un clima afectivo-familiar.', 5, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[arti_articulo] OFF
GO
SET IDENTITY_INSERT [dbo].[au_autentificacion_usuario] ON 

GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (1, N'vcoronado', N'MQAyADMANAA1ADYA', N'vcoronado.alarcon@gmail.com', 1, 1, 3, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (4, N'Vgarcia', N'MQAyADMANAA1ADYA', N'turck182@gmail.com', 5, 1, 3, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (5, N'* TRIAL * ', N'123456', N'vcoronado.alarcon@gmail.com', 3, 0, 3, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (6, N'vgarciaadm', N'MQAyADMANAA1ADYA', N'vgarcia@saydex.cl', 2, 1, 4, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (7, N'vgarcia1', N'* TRIAL * TRIAL ', N'vgarcia@saydex.cl', 3, 1, 4, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (8, N'vgarcia2', N'MQAyADMANAA1ADYA', N'vgarcia@saydex.cl', 4, 1, 4, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (9, N'* TRIAL ', N'MQAyADMANAA1ADYA', N'vgarcia@saydex.cl', 5, 1, 4, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (10, N'* TRIAL ', N'MQAyADMANAA1ADYA', N'vgarcia@saydex.cl', 9, 1, 4, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (11, N'* TRIAL ', N'* TRIAL * TRIAL ', N'* TRIAL * TRIAL *', 9, 1, 4, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (12, N'vgarcia6', N'MQAyADMANAA1ADYA', N'vgarcia@saydex.com', 9, 1, 4, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (13, N'* TRIAL ', N'MQAwADQANQAyADYAOQAxADgA', N'* TRIAL * TRIAL * T', 9, 1, 3, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (14, N'iretamalesPrueba', N'MQAyADEAOQAzADAAMQA0ADUA', N'* TRIAL * TRIAL * TRIAL * T', 9, 1, 3, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (15, N'* TRIAL * ', N'MQAwADQANQAyADYAOQAxADgA', N'vcoronado@saydex.cl', 9, 1, 3, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (16, N'ppablo', N'MQAwADQANQAyADYAOQAxADgA', N'vcoronado@saydex.cl', 9, 1, 3, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (17, N'iretamales', N'MQAyADEAOQAzADAAMQA0ADUA', N'vcoronado.alarcon@gmail.com', 9, 1, 3, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (18, N'vgarciasuper', N'MQAyADMANAA1ADYA', N'* TRIAL * TRIAL *', 1, 1, 5, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (19, N'dsalazar', N'* TRIAL * TRIAL * TRIAL ', N'* TRIAL * TRIAL * TRIAL * ', 9, 1, 4, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (20, N'vigarci', N'MQAxADEAMQAxADEAMQAxADEA', N'turck182@gmail.com', 9, 1, 4, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (21, N'SecretariaCGPA', N'MQAyADMANAA1ADYA', N'danny_salaro@hotmail.com', 5, 1, 4, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (22, N'mabarca', N'OQAxADYANgAyADEAMwAyAA==', N'abarcamiguel63@gmail.com', 3, 1, 5, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (23, N'mquiroga', N'MQAyADIAMwA5ADIANAA0ADkA', N'marcia_quiroga_m@hotmail.com', 4, 1, 5, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (24, N'srojas', N'* TRIAL * TRIAL * TRIAL ', N'rojassandr@gmail.com', 5, 1, 5, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (25, N'dlabbe', N'* TRIAL * TRIAL * TRIAL ', N'daniela_labbe@hotmail.com', 10, 1, 5, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (26, N'cABmAHUAZQBuAHQAZQBzAA==', N'123456', N'pfuentes@gmail.com', 9, 1, 3, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (27, N'cABmAHUAZQBuAHQAZQBzAA==', N'123456', N'pfuentes2547@gmail.com', 9, 1, 3, 0)
GO
INSERT [dbo].[au_autentificacion_usuario] ([ID], [NOMBRE_USUARIO], [PASSWORD], [CORREO_ELECTRONICO], [ROL_ID], [ES_VIGENTE], [INST_ID], [ELIMINADO]) VALUES (28, N'cABmAHUAZQBuAHQAZQBzAA==', N'', N'* TRIAL * TRIAL * TRIA', 9, 1, 3, 0)
GO
SET IDENTITY_INSERT [dbo].[au_autentificacion_usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[cal_calendario] ON 

GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (1, N'', N'', CAST(N'2015-12-16 01:00:00.0000000' AS DateTime2), CAST(N'2015-12-16 03:00:00.0000000' AS DateTime2), N'', 0, 3, N'Prueba', N'Sala 213', 1, N'Prueba', 0, 0)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (2, N'', N'', CAST(N'2015-12-17 15:00:00.0000000' AS DateTime2), CAST(N'2015-12-17 19:00:00.0000000' AS DateTime2), N'', 0, 3, N'Prueba', N'Local', 3, N'* TRIAL ', 0, 0)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (3, N'', N'', CAST(N'2015-12-18 15:00:00.0000000' AS DateTime2), CAST(N'2015-12-18 18:00:00.0000000' AS DateTime2), N'', 0, 3, N'* TRIAL * ', N'local 2', 1, N'prueba de detalle', 0, 0)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (4, N'Prueba de calendario', N'', CAST(N'2015-12-17 00:00:00.0000000' AS DateTime2), CAST(N'2015-12-18 00:00:00.0000000' AS DateTime2), N'* TRIAL * TRIAL * TR', 1, 4, N'pruebs', N'local', 1, N'Prueba de calendario', 0, 0)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (5, N'breve', N'', CAST(N'2015-12-15 14:00:00.0000000' AS DateTime2), CAST(N'2015-12-15 15:00:00.0000000' AS DateTime2), N'breve', 0, 3, N'prueba de asunto nuevo', N'* TRIAL * TRI', 2, N'breve', 0, 0)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (6, N'Tricel 1', N'', CAST(N'2016-02-14 00:00:00.0000000' AS DateTime2), CAST(N'2016-02-29 00:00:00.0000000' AS DateTime2), N'Tricel 1', 0, 3, N'Tricel 1', N'NO DEFINIDA', 1, N'* TRIAL ', 1, 1)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (7, N'* TRIAL ', N'', CAST(N'2016-02-17 00:00:00.0000000' AS DateTime2), CAST(N'2016-02-29 00:00:00.0000000' AS DateTime2), N'Tricel 1', 0, 4, N'Tricel 1', N'NO DEFINIDA', 1, N'objetivo 1', 1, 1)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (8, N'prueba', N'', CAST(N'2016-03-06 00:00:00.0000000' AS DateTime2), CAST(N'2016-03-30 00:00:00.0000000' AS DateTime2), N'prueba', 0, 3, N'prueba', N'NO DEFINIDA', 1, N'Objetivo prueba', 1, 1)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (9, N'proyecto coro', N'', CAST(N'2016-03-09 00:00:00.0000000' AS DateTime2), CAST(N'2016-03-30 00:00:00.0000000' AS DateTime2), N'Desc', 0, 3, N'proyecto coro', N'NO DEFINIDA', 1, N'Desc', 1, 1)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (10, N'* TRIAL * T', N'', CAST(N'2016-03-08 00:00:00.0000000' AS DateTime2), CAST(N'2016-03-29 00:00:00.0000000' AS DateTime2), N'Triple coro', 0, 3, N'* TRIAL * T', N'* TRIAL * T', 1, N'Obj', 1, 1)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (11, N'pppp', N'', CAST(N'2016-03-08 00:00:00.0000000' AS DateTime2), CAST(N'2016-03-30 00:00:00.0000000' AS DateTime2), N'pppp', 0, 3, N'pppp', N'NO DEFINIDA', 1, N'Obj', 1, 1)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (12, N'coro', N'', CAST(N'2016-03-11 00:00:00.0000000' AS DateTime2), CAST(N'2016-03-29 00:00:00.0000000' AS DateTime2), N'coro', 0, 3, N'coro', N'* TRIAL * T', 1, N'* TRIAL ', 1, 1)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (13, N' presentar los lineamientos y énfasis para este año escolar .', N'', CAST(N'2016-03-19 09:00:00.0000000' AS DateTime2), CAST(N'2016-03-19 12:00:00.0000000' AS DateTime2), N'* TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRI', 0, 4, N'Asamblea General 2016', N'Colegio de niñas Santa Elena', 0, N' presentar los lineamientos y énfasis para este año escolar .', 0, 0)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (14, N'', N'', CAST(N'2016-04-02 10:00:00.0000000' AS DateTime2), CAST(N'2016-04-02 16:00:00.0000000' AS DateTime2), N'', 0, 4, N'* TRIAL * TRIAL * TRIAL * TRIAL * TRIAL *', N'Colegio Santa Elena', 0, N'* TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TR', 0, 0)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (15, N'TABLA:
1. Rendición de cuentas directiva anterior
2. Tallarinata
3. Comunicación directa con las ramas
4. Mejorar la comunicación actualizando los correos de las directivas actuales, para que no haya malos entendidos

NOTA:EL COLEGIO DISPUSO UNA HORA', N'', CAST(N'2016-04-04 19:30:00.0000000' AS DateTime2), CAST(N'2016-04-04 20:30:00.0000000' AS DateTime2), N'TABLA:
1. Rendición de cuentas directiva anterior
2. Tallarinata
3. Comunicación directa con las ramas
4. Mejorar la comunicación actualizando los correos de las directivas actuales, para que no haya malos entendidos

NOTA:EL COLEGIO DISPUSO UNA HORA DE REUNIÓN  DESDE LAS 19:30 A LAS 20:30 POR PROBLEMAS DE POCO PERSONAL  POR ESO SE RUEGA 
PUNTUALIDAD
', 0, 4, N'* TRIAL * TRIAL * ', N'* TRIAL * TRIAL * T', 0, N'* TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL *', 0, 0)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (16, N'prueba', N'', CAST(N'2016-04-07 00:00:00.0000000' AS DateTime2), CAST(N'2016-04-08 00:00:00.0000000' AS DateTime2), N'prueba', 0, 3, N'prueba', N'local', 1, N'prueba', 0, 0)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (17, N'* TRIAL * TRIAL ', N'', CAST(N'2016-04-07 10:00:00.0000000' AS DateTime2), CAST(N'2016-04-07 12:00:00.0000000' AS DateTime2), N'* TRIAL * TRIAL ', 0, 4, N'* TRIAL * T', N'Colegio Santa Elena', 0, N'evento de prueba', 0, 0)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (18, N'* TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * T', N'', CAST(N'2016-04-14 00:00:00.0000000' AS DateTime2), CAST(N'2016-04-22 00:00:00.0000000' AS DateTime2), N'Juegos de graderías para el patio', 0, 4, N'* TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * T', N'NO DEFINIDA', 1, N'Juegos de graderías para el patio', 1, 1)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (19, N'Prueba de cita', N'', CAST(N'2016-04-16 13:00:00.0000000' AS DateTime2), CAST(N'2016-04-16 14:00:00.0000000' AS DateTime2), N'Prueba de cita', 0, 4, N'Prueba de cita', N'En el establecimiento', 1, N'Prueba de cita', 0, 0)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (20, N'prueba', N'', CAST(N'2016-04-16 13:00:00.0000000' AS DateTime2), CAST(N'2016-04-16 14:00:00.0000000' AS DateTime2), N'prueba', 0, 4, N'Otra Prueba', N'* TRIAL * T', 1, N'prueba', 0, 0)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (21, N'Hola', N'', CAST(N'2016-04-15 18:30:00.0000000' AS DateTime2), CAST(N'2016-04-15 20:00:00.0000000' AS DateTime2), N'Hola', 0, 4, N'Presentación plataforma cpas', N'* TRIAL * T', 2, N'Hola', 1, 0)
GO
INSERT [dbo].[cal_calendario] ([ID], [TITULO], [URL], [FECHA_INICIO], [FECHA_TERMINO], [DETALLE], [ELIMINADO], [INST_ID], [ASUNTO], [UBICACION], [ETIQUETA], [DESCRIPCION], [STATUS], [TIPO]) VALUES (22, N'', N'', CAST(N'2016-05-27 09:00:00.0000000' AS DateTime2), CAST(N'2016-05-28 09:00:00.0000000' AS DateTime2), N'', 0, 3, N'prueba', N'local', 0, N'prueba', 0, 0)
GO
SET IDENTITY_INSERT [dbo].[cal_calendario] OFF
GO
SET IDENTITY_INSERT [dbo].[com_comuna] ON 

GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (1, 1, N'ARICA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (2, 1, N'CAMARONES')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (3, 2, N'PUTRE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (4, 2, N'GENERAL LAGOS')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (5, 3, N'IQUIQUE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (6, 3, N'ALTO HOSPICIO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (7, 4, N'POZO ALMONTE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (8, 4, N'CAMIÑA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (9, 4, N'* TRIAL ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (10, 4, N'HUARA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (11, 4, N'PICA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (12, 5, N'ANTOFAGASTA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (13, 5, N'MEJILLONES')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (14, 5, N'SIERRA GORDA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (15, 5, N'TALTAL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (16, 6, N'CALAMA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (17, 6, N'OLLAGÜE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (18, 6, N'* TRIAL * TRIAL * TR')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (19, 7, N'* TRIAL *')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (20, 7, N'MARÍA ELENA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (21, 8, N'COPIAPÓ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (22, 8, N'CALDERA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (23, 8, N'* TRIAL * TRIAL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (24, 9, N'* TRIAL ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (25, 9, N'DIEGO DE ALMAGRO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (26, 10, N'VALLENAR')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (27, 10, N'ALTO DEL CARMEN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (28, 10, N'FREIRINA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (29, 10, N'HUASCO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (30, 11, N'LA SERENA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (31, 11, N'COQUIMBO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (32, 11, N'ANDACOLLO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (33, 11, N'LA HIGUERA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (34, 11, N'* TRIAL ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (35, 11, N'VICUÑA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (36, 12, N'ILLAPEL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (37, 12, N'CANELA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (38, 12, N'LOS VILOS')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (39, 12, N'SALAMANCA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (40, 13, N'OVALLE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (41, 13, N'COMBARBALÁ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (42, 13, N'MONTE PATRIA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (43, 13, N'* TRIAL *')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (44, 13, N'RÍO HURTADO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (45, 14, N'VALPARAÍSO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (46, 14, N'CASABLANCA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (47, 14, N'CONCÓN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (48, 14, N'JUAN FERNÁNDEZ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (49, 14, N'* TRIAL * ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (50, 14, N'* TRIAL ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (51, 14, N'VIÑA DEL MAR')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (52, 15, N'ISLA DE PASCUA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (53, 16, N'LOS ANDES')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (54, 16, N'* TRIAL * T')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (55, 16, N'RINCONADA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (56, 16, N'* TRIAL * T')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (57, 17, N'* TRIAL ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (58, 17, N'CABILDO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (59, 17, N'PAPUDO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (60, 17, N'PETORCA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (61, 17, N'* TRIAL ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (62, 18, N'QUILLOTA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (63, 18, N'CALERA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (64, 18, N'* TRIAL ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (65, 18, N'LA CRUZ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (66, 18, N'NOGALES')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (67, 19, N'SAN ANTONIO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (68, 19, N'ALGARROBO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (69, 19, N'* TRIAL *')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (70, 19, N'* TRIAL *')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (71, 19, N'EL TABO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (72, 19, N'SANTO DOMINGO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (73, 20, N'SAN FELIPE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (74, 20, N'CATEMU')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (75, 20, N'* TRIAL ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (76, 20, N'* TRIAL *')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (77, 20, N'PUTAENDO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (78, 20, N'SANTA MARÍA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (79, 21, N'LIMACHE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (80, 21, N'QUILPUÉ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (81, 21, N'VILLA ALEMANA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (82, 21, N'OLMUÉ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (83, 22, N'RANCAGUA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (84, 22, N'CODEGUA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (85, 22, N'COINCO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (86, 22, N'* TRIAL ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (87, 22, N'DOÑIHUE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (88, 22, N'GRANEROS')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (89, 22, N'* TRIAL * ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (90, 22, N'MACHALÍ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (91, 22, N'MALLOA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (92, 22, N'MOSTAZAL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (93, 22, N'OLIVAR')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (94, 22, N'PEUMO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (95, 22, N'PICHIDEGUA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (96, 22, N'QUINTA DE TILCOCO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (97, 22, N'RENGO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (98, 22, N'REQUÍNOA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (99, 22, N'* TRIAL * T')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (100, 23, N'PICHILEMU')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (101, 23, N'LA ESTRELLA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (102, 23, N'LITUECHE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (103, 23, N'MARCHIHUE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (104, 23, N'NAVIDAD')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (105, 23, N'PAREDONES')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (106, 24, N'SAN FERNANDO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (107, 24, N'CHÉPICA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (108, 24, N'* TRIAL * T')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (109, 24, N'LOLOL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (110, 24, N'NANCAGUA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (111, 24, N'PALMILLA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (112, 24, N'PERALILLO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (113, 24, N'PLACILLA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (114, 24, N'PUMANQUE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (115, 24, N'SANTA CRUZ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (116, 25, N'TALCA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (117, 25, N'* TRIAL * TR')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (118, 25, N'CUREPTO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (119, 25, N'* TRIAL *')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (120, 25, N'MAULE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (121, 25, N'PELARCO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (122, 25, N'PENCAHUE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (123, 25, N'RÍO CLARO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (124, 25, N'* TRIAL * TR')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (125, 25, N'SAN RAFAEL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (126, 26, N'CAUQUENES')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (127, 26, N'CHANCO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (128, 26, N'PELLUHUE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (129, 27, N'CURICÓ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (130, 27, N'HUALAÑÉ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (131, 27, N'LICANTÉN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (132, 27, N'MOLINA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (133, 27, N'RAUCO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (134, 27, N'ROMERAL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (135, 27, N'SAGRADA FAMILIA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (136, 27, N'TENO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (137, 27, N'VICHUQUÉN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (138, 28, N'LINARES')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (139, 28, N'COLBÚN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (140, 28, N'LONGAVÍ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (141, 28, N'PARRAL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (142, 28, N'RETIRO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (143, 28, N'SAN JAVIER')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (144, 28, N'* TRIAL * TR')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (145, 28, N'YERBAS BUENAS')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (146, 29, N'* TRIAL * ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (147, 29, N'CORONEL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (148, 29, N'* TRIAL * T')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (149, 29, N'FLORIDA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (150, 29, N'HUALQUI')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (151, 29, N'LOTA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (152, 29, N'PENCO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (153, 29, N'SAN PEDRO DE LA PAZ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (154, 29, N'SANTA JUANA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (155, 29, N'TALCAHUANO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (156, 29, N'TOMÉ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (157, 29, N'HUALPÉN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (158, 30, N'LEBU')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (159, 30, N'ARAUCO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (160, 30, N'CAÑETE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (161, 30, N'CONTULMO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (162, 30, N'CURANILAHUE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (163, 30, N'LOS ALAMOS')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (164, 30, N'TIRÚA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (165, 31, N'LOS ANGELES')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (166, 31, N'ANTUCO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (167, 31, N'CABRERO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (168, 31, N'LAJA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (169, 31, N'MULCHÉN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (170, 31, N'NACIMIENTO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (171, 31, N'NEGRETE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (172, 31, N'QUILACO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (173, 31, N'QUILLECO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (174, 31, N'SAN ROSENDO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (175, 31, N'SANTA BÁRBARA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (176, 31, N'TUCAPEL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (177, 31, N'YUMBEL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (178, 31, N'ALTO BIOBÍO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (179, 32, N'CHILLÁN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (180, 32, N'BULNES')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (181, 32, N'COBQUECURA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (182, 32, N'COELEMU')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (183, 32, N'COIHUECO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (184, 32, N'CHILLÁN VIEJO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (185, 32, N'EL CARMEN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (186, 32, N'NINHUE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (187, 32, N'ÑIQUÉN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (188, 32, N'PEMUCO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (189, 32, N'PINTO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (190, 32, N'* TRIAL * ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (191, 32, N'QUILLÓN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (192, 32, N'* TRIAL ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (193, 32, N'RÁNQUIL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (194, 32, N'* TRIAL * ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (195, 32, N'* TRIAL * ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (196, 32, N'SAN IGNACIO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (197, 32, N'* TRIAL * T')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (198, 32, N'TREGUACO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (199, 32, N'YUNGAY')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (200, 33, N'TEMUCO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (201, 33, N'CARAHUE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (202, 33, N'CUNCO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (203, 33, N'CURARREHUE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (204, 33, N'FREIRE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (205, 33, N'GALVARINO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (206, 33, N'GORBEA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (207, 33, N'LAUTARO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (208, 33, N'LONCOCHE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (209, 33, N'* TRIAL *')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (210, 33, N'NUEVA IMPERIAL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (211, 33, N'PADRE LAS CASAS')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (212, 33, N'PERQUENCO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (213, 33, N'PITRUFQUÉN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (214, 33, N'PUCÓN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (215, 33, N'* TRIAL ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (216, 33, N'* TRIAL * TRIAL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (217, 33, N'TOLTÉN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (218, 33, N'VILCÚN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (219, 33, N'* TRIAL * ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (220, 33, N'CHOLCHOL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (221, 34, N'ANGOL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (222, 34, N'* TRIAL * ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (223, 34, N'CURACAUTÍN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (224, 34, N'ERCILLA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (225, 34, N'LONQUIMAY')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (226, 34, N'LOS SAUCES')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (227, 34, N'LUMACO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (228, 34, N'PURÉN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (229, 34, N'RENAICO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (230, 34, N'TRAIGUÉN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (231, 34, N'VICTORIA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (232, 35, N'VALDIVIA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (233, 35, N'CORRAL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (234, 35, N'LANCO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (235, 35, N'LOS LAGOS')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (236, 35, N'MÁFIL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (237, 35, N'MARIQUINA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (238, 35, N'PAILLACO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (239, 35, N'* TRIAL * T')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (240, 36, N'LA UNIÓN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (241, 36, N'FUTRONO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (242, 36, N'LAGO RANCO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (243, 36, N'RÍO BUENO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (244, 37, N'PUERTO MONTT')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (245, 37, N'CALBUCO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (246, 37, N'COCHAMÓ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (247, 37, N'FRESIA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (248, 37, N'FRUTILLAR')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (249, 37, N'* TRIAL * T')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (250, 37, N'LLANQUIHUE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (251, 37, N'MAULLÍN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (252, 37, N'PUERTO VARAS')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (253, 38, N'CASTRO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (254, 38, N'ANCUD')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (255, 38, N'CHONCHI')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (256, 38, N'CURACO DE VÉLEZ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (257, 38, N'DALCAHUE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (258, 38, N'PUQUELDÓN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (259, 38, N'QUEILÉN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (260, 38, N'QUELLÓN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (261, 38, N'QUEMCHI')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (262, 38, N'QUINCHAO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (263, 39, N'OSORNO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (264, 39, N'PUERTO OCTAY')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (265, 39, N'PURRANQUE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (266, 39, N'PUYEHUE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (267, 39, N'RÍO NEGRO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (268, 39, N'* TRIAL * TRIAL * TR')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (269, 39, N'SAN PABLO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (270, 40, N'CHAITÉN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (271, 40, N'* TRIAL *')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (272, 40, N'* TRIAL *')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (273, 40, N'PALENA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (274, 41, N'COIHAIQUE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (275, 41, N'* TRIAL * ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (276, 42, N'AISÉN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (277, 42, N'CISNES')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (278, 42, N'GUAITECAS')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (279, 43, N'COCHRANE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (280, 43, N'O''HIGGINS')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (281, 43, N'TORTEL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (282, 44, N'* TRIAL * T')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (283, 44, N'* TRIAL * ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (284, 45, N'PUNTA ARENAS')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (285, 45, N'LAGUNA BLANCA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (286, 45, N'RÍO VERDE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (287, 45, N'SAN GREGORIO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (288, 46, N'CABO DE HORNOS')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (289, 46, N'ANTÁRTICA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (290, 47, N'PORVENIR')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (291, 47, N'PRIMAVERA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (292, 47, N'TIMAUKEL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (293, 48, N'NATALES')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (294, 48, N'TORRES DEL PAINE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (295, 49, N'SANTIAGO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (296, 49, N'* TRIAL *')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (297, 49, N'CERRO NAVIA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (298, 49, N'CONCHALÍ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (299, 49, N'EL BOSQUE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (300, 49, N'* TRIAL * TRIAL ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (301, 49, N'HUECHURABA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (302, 49, N'INDEPENDENCIA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (303, 49, N'* TRIAL * T')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (304, 49, N'LA FLORIDA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (305, 49, N'* TRIAL *')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (306, 49, N'* TRIAL * ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (307, 49, N'* TRIAL ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (308, 49, N'* TRIAL * ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (309, 49, N'LO BARNECHEA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (310, 49, N'* TRIAL *')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (311, 49, N'LO PRADO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (312, 49, N'MACUL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (313, 49, N'MAIPÚ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (314, 49, N'ÑUÑOA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (315, 49, N'PEDRO AGUIRRE CERDA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (316, 49, N'PEÑALOLÉN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (317, 49, N'PROVIDENCIA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (318, 49, N'PUDAHUEL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (319, 49, N'* TRIAL *')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (320, 49, N'QUINTA NORMAL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (321, 49, N'* TRIAL ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (322, 49, N'RENCA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (323, 49, N'SAN JOAQUÍN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (324, 49, N'SAN MIGUEL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (325, 49, N'SAN RAMÓN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (326, 49, N'VITACURA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (327, 50, N'PUENTE ALTO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (328, 50, N'PIRQUE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (329, 50, N'* TRIAL * TRIAL *')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (330, 51, N'COLINA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (331, 51, N'LAMPA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (332, 51, N'TILTIL')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (333, 52, N'SAN BERNARDO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (334, 52, N'BUIN')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (335, 52, N'CALERA DE TANGO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (336, 52, N'PAINE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (337, 53, N'MELIPILLA')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (338, 53, N'ALHUÉ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (339, 53, N'CURACAVÍ')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (340, 53, N'* TRIAL * T')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (341, 53, N'SAN PEDRO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (342, 54, N'* TRIAL *')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (343, 54, N'EL MONTE')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (344, 54, N'ISLA DE MAIPO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (345, 54, N'PADRE HURTADO')
GO
INSERT [dbo].[com_comuna] ([ID], [PROV_ID], [NOMBRE]) VALUES (346, 54, N'* TRIAL ')
GO
SET IDENTITY_INSERT [dbo].[com_comuna] OFF
GO
SET IDENTITY_INSERT [dbo].[coni_configuracion_institucion] ON 

GO
INSERT [dbo].[coni_configuracion_institucion] ([ID], [INST_ID], [ENVIA_DOCUMENTOS], [ENVIA_PROYECTOS], [ENVIA_RENDICIONES], [ENVIA_CORREO_EVENTOS], [ELIMINADO]) VALUES (1, 3, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[coni_configuracion_institucion] ([ID], [INST_ID], [ENVIA_DOCUMENTOS], [ENVIA_PROYECTOS], [ENVIA_RENDICIONES], [ENVIA_CORREO_EVENTOS], [ELIMINADO]) VALUES (2, 4, 1, 1, 1, 1, 0)
GO
INSERT [dbo].[coni_configuracion_institucion] ([ID], [INST_ID], [ENVIA_DOCUMENTOS], [ENVIA_PROYECTOS], [ENVIA_RENDICIONES], [ENVIA_CORREO_EVENTOS], [ELIMINADO]) VALUES (3, 5, 0, 0, 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[coni_configuracion_institucion] OFF
GO
SET IDENTITY_INSERT [dbo].[cua_curso_apoderado] ON 

GO
INSERT [dbo].[cua_curso_apoderado] ([ID], [INST_ID], [USU_ID], [CUR_ID]) VALUES (1, 3, 4, 14)
GO
INSERT [dbo].[cua_curso_apoderado] ([ID], [INST_ID], [USU_ID], [CUR_ID]) VALUES (5, 3, 1, 1)
GO
INSERT [dbo].[cua_curso_apoderado] ([ID], [INST_ID], [USU_ID], [CUR_ID]) VALUES (6, 4, 19, 115)
GO
INSERT [dbo].[cua_curso_apoderado] ([ID], [INST_ID], [USU_ID], [CUR_ID]) VALUES (7, 4, 20, 115)
GO
INSERT [dbo].[cua_curso_apoderado] ([ID], [INST_ID], [USU_ID], [CUR_ID]) VALUES (8, 4, 21, 115)
GO
INSERT [dbo].[cua_curso_apoderado] ([ID], [INST_ID], [USU_ID], [CUR_ID]) VALUES (9, 5, 22, 134)
GO
INSERT [dbo].[cua_curso_apoderado] ([ID], [INST_ID], [USU_ID], [CUR_ID]) VALUES (10, 5, 23, 137)
GO
INSERT [dbo].[cua_curso_apoderado] ([ID], [INST_ID], [USU_ID], [CUR_ID]) VALUES (12, 5, 24, 134)
GO
INSERT [dbo].[cua_curso_apoderado] ([ID], [INST_ID], [USU_ID], [CUR_ID]) VALUES (13, 5, 25, 130)
GO
INSERT [dbo].[cua_curso_apoderado] ([ID], [INST_ID], [USU_ID], [CUR_ID]) VALUES (14, 3, 28, 20)
GO
SET IDENTITY_INSERT [dbo].[cua_curso_apoderado] OFF
GO
SET IDENTITY_INSERT [dbo].[cur_curso] ON 

GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (1, 3, N'Sala Cuna Menor A', 0, 0, 1, 1, N'* TRIAL * T', N'Sala Cuna Menor')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (2, 3, N'Sala Cuna Menor B', 0, 0, 2, 1, N'Parvularia ', N'* TRIAL * TRIAL')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (3, 3, N'* TRIAL * TRIAL *', 0, 0, 3, 1, N'Parvularia ', N'Sala Cuna Menor')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (4, 3, N'Sala Cuna Mayor A', 0, 0, 4, 1, N'Parvularia ', N'Sala Cuna Mayor')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (5, 3, N'Sala Cuna Mayor B', 0, 0, 5, 1, N'Parvularia ', N'Sala Cuna Mayor')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (6, 3, N'Sala Cuna Mayor C', 0, 0, 6, 1, N'* TRIAL * T', N'Sala Cuna Mayor')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (7, 3, N'Primer Nivel Transición (Pre-Kinder) A', 0, 0, 7, 1, N'* TRIAL * T', N'Prekinder')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (8, 3, N'Primer Nivel Transición (Pre-Kinder) B', 0, 0, 8, 1, N'* TRIAL * T', N'* TRIAL *')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (9, 3, N'Primer Nivel Transición (Pre-Kinder) C', 0, 0, 9, 1, N'Parvularia ', N'* TRIAL *')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (10, 3, N'* TRIAL * TRIAL * TRIAL * TRIAL * T', 0, 0, 10, 1, N'Parvularia ', N'Kinder')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (11, 3, N'Segundo Nivel Transición (Kinder) B', 0, 0, 11, 1, N'Parvularia ', N'Kinder')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (12, 3, N'* TRIAL * TRIAL * TRIAL * TRIAL * T', 0, 0, 12, 1, N'Parvularia ', N'Kinder')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (13, 3, N'Primer Año Básico A', 0, 0, 13, 2, N'Básica', N'Primeros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (14, 3, N'Primer Año Básico B', 0, 0, 14, 2, N'Básica', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (15, 3, N'Primer Año Básico C', 0, 0, 15, 2, N'Básica', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (16, 3, N'* TRIAL * TRIAL * T', 0, 0, 16, 2, N'Básica', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (17, 3, N'Primer Año Básico E', 0, 0, 17, 2, N'Básica', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (18, 3, N'* TRIAL * TRIAL * T', 0, 0, 18, 2, N'Básica', N'Primeros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (19, 3, N'Primer Año Básico G', 0, 0, 19, 2, N'Básica', N'Primeros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (20, 3, N'Primer Año Básico H', 0, 0, 20, 2, N'Básica', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (21, 3, N'Segundo Año Básico A', 0, 0, 21, 2, N'Básica', N'Segundos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (22, 3, N'* TRIAL * TRIAL * TR', 0, 0, 22, 2, N'Básica', N'Segundos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (23, 3, N'Segundo Año Básico C', 0, 0, 23, 2, N'Básica', N'Segundos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (24, 3, N'* TRIAL * TRIAL * TR', 0, 0, 24, 2, N'Básica', N'Segundos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (25, 3, N'Segundo Año Básico E', 0, 0, 25, 2, N'Básica', N'Segundos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (26, 3, N'Segundo Año Básico F', 0, 0, 26, 2, N'Básica', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (27, 3, N'* TRIAL * TRIAL * TR', 0, 0, 27, 2, N'Básica', N'Segundos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (28, 3, N'Segundo Año Básico H', 0, 0, 28, 2, N'Básica', N'Segundos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (29, 3, N'Tercer Año Básico A', 0, 0, 29, 2, N'Básica', N'Terceros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (30, 3, N'Tercer Año Básico B', 0, 0, 30, 2, N'Básica', N'Terceros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (31, 3, N'Tercer Año Básico C', 0, 0, 31, 2, N'Básica', N'Terceros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (32, 3, N'Tercer Año Básico D', 0, 0, 32, 2, N'Básica', N'Terceros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (33, 3, N'Tercer Año Básico E', 0, 0, 33, 2, N'Básica', N'Terceros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (34, 3, N'Tercer Año Básico F', 0, 0, 34, 2, N'Básica', N'Terceros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (35, 3, N'* TRIAL * TRIAL * T', 0, 0, 35, 2, N'Básica', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (36, 3, N'Tercer Año Básico H', 0, 0, 36, 2, N'Básica', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (37, 3, N'* TRIAL * TRIAL * T', 0, 0, 37, 2, N'Básica', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (38, 3, N'* TRIAL * TRIAL * T', 0, 0, 38, 2, N'Básica', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (39, 3, N'Cuarto Año Básico C', 0, 0, 39, 2, N'Básica', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (40, 3, N'* TRIAL * TRIAL * T', 0, 0, 40, 2, N'Básica', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (41, 3, N'Cuarto Año Básico E', 0, 0, 41, 2, N'Básica', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (42, 3, N'Cuarto Año Básico F', 0, 0, 42, 2, N'Básica', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (43, 3, N'* TRIAL * TRIAL * T', 0, 0, 43, 2, N'Básica', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (44, 3, N'Cuarto Año Básico H', 0, 0, 44, 2, N'Básica', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (45, 3, N'* TRIAL * TRIAL * T', 0, 0, 45, 2, N'Básica', N'Quintos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (46, 3, N'Quinto Año Básico B', 0, 0, 46, 2, N'Básica', N'Quintos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (47, 3, N'Quinto Año Básico C', 0, 0, 47, 2, N'Básica', N'Quintos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (48, 3, N'Quinto Año Básico D', 0, 0, 48, 2, N'Básica', N'Quintos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (49, 3, N'Quinto Año Básico E', 0, 0, 49, 2, N'Básica', N'Quintos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (50, 3, N'* TRIAL * TRIAL * T', 0, 0, 50, 2, N'Básica', N'Quintos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (51, 3, N'* TRIAL * TRIAL * T', 0, 0, 51, 2, N'Básica', N'Quintos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (52, 3, N'Quinto Año Básico H', 0, 0, 52, 2, N'Básica', N'Quintos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (53, 3, N'Sexto Año Básico A', 0, 0, 53, 2, N'Básica', N'Sextos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (54, 3, N'* TRIAL * TRIAL * ', 0, 0, 54, 2, N'Básica', N'Sextos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (55, 3, N'Sexto Año Básico C', 0, 0, 55, 2, N'Básica', N'Sextos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (56, 3, N'Sexto Año Básico D', 0, 0, 56, 2, N'Básica', N'Sextos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (57, 3, N'Sexto Año Básico E', 0, 0, 57, 2, N'Básica', N'Sextos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (58, 3, N'Sexto Año Básico F', 0, 0, 58, 2, N'Básica', N'Sextos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (59, 3, N'* TRIAL * TRIAL * ', 0, 0, 59, 2, N'Básica', N'Sextos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (60, 3, N'Sexto Año Básico H', 0, 0, 60, 2, N'Básica', N'Sextos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (61, 3, N'* TRIAL * TRIAL * TR', 0, 0, 61, 2, N'Básica', N'Séptimos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (62, 3, N'* TRIAL * TRIAL * TR', 0, 0, 62, 2, N'Básica', N'Séptimos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (63, 3, N'Séptimo Año Básico C', 0, 0, 63, 2, N'Básica', N'Séptimos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (64, 3, N'Séptimo Año Básico D', 0, 0, 64, 2, N'Básica', N'Séptimos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (65, 3, N'* TRIAL * TRIAL * TR', 0, 0, 65, 2, N'Básica', N'Séptimos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (66, 3, N'Séptimo Año Básico F', 0, 0, 66, 2, N'Básica', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (67, 3, N'Séptimo Año Básico G', 0, 0, 67, 2, N'Básica', N'Séptimos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (68, 3, N'Séptimo Año Básico H', 0, 0, 68, 2, N'Básica', N'Séptimos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (69, 3, N'Octavo Año Básico A', 0, 0, 69, 2, N'Básica', N'Octavos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (70, 3, N'Octavo Año Básico B', 0, 0, 70, 2, N'Básica', N'Octavos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (71, 3, N'* TRIAL * TRIAL * T', 0, 0, 71, 2, N'Básica', N'Octavos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (72, 3, N'* TRIAL * TRIAL * T', 0, 0, 72, 2, N'Básica', N'Octavos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (73, 3, N'* TRIAL * TRIAL * T', 0, 0, 73, 2, N'Básica', N'Octavos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (74, 3, N'Octavo Año Básico F', 0, 0, 74, 2, N'Básica', N'Octavos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (75, 3, N'* TRIAL * TRIAL * T', 0, 0, 75, 2, N'Básica', N'Octavos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (76, 3, N'* TRIAL * TRIAL * T', 0, 0, 76, 2, N'Básica', N'Octavos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (77, 3, N'Primer Año Medio A', 0, 0, 77, 3, N'Media', N'Primeros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (78, 3, N'* TRIAL * TRIAL * ', 0, 0, 78, 3, N'Media', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (79, 3, N'Primer Año Medio C', 0, 0, 79, 3, N'Media', N'Primeros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (80, 3, N'Primer Año Medio D', 0, 0, 80, 3, N'Media', N'Primeros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (81, 3, N'Primer Año Medio E', 0, 0, 81, 3, N'Media', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (82, 3, N'* TRIAL * TRIAL * ', 0, 0, 82, 3, N'Media', N'Primeros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (83, 3, N'Primer Año Medio G', 0, 0, 83, 3, N'Media', N'Primeros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (84, 3, N'Primer Año Medio H', 0, 0, 84, 3, N'Media', N'Primeros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (85, 3, N'* TRIAL * TRIAL * T', 0, 0, 85, 3, N'Media', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (86, 3, N'Segundo Año Medio B', 0, 0, 86, 3, N'Media', N'Segundos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (87, 3, N'Segundo Año Medio C', 0, 0, 87, 3, N'Media', N'Segundos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (88, 3, N'* TRIAL * TRIAL * T', 0, 0, 88, 3, N'Media', N'Segundos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (89, 3, N'Segundo Año Medio E', 0, 0, 89, 3, N'Media', N'Segundos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (90, 3, N'* TRIAL * TRIAL * T', 0, 0, 90, 3, N'Media', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (91, 3, N'Segundo Año Medio G', 0, 0, 91, 3, N'Media', N'Segundos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (92, 3, N'Segundo Año Medio H', 0, 0, 92, 3, N'Media', N'Segundos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (93, 3, N'Tercer Año Medio A', 0, 0, 93, 3, N'Media', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (94, 3, N'Tercer Año Medio B', 0, 0, 94, 3, N'Media', N'Terceros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (95, 3, N'Tercer Año Medio C', 0, 0, 95, 3, N'Media', N'Terceros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (96, 3, N'Tercer Año Medio D', 0, 0, 96, 3, N'Media', N'Terceros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (97, 3, N'Tercer Año Medio E', 0, 0, 97, 3, N'Media', N'Terceros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (98, 3, N'* TRIAL * TRIAL * ', 0, 0, 98, 3, N'Media', N'Terceros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (99, 3, N'Tercer Año Medio G', 0, 0, 99, 3, N'Media', N'Terceros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (100, 3, N'Tercer Año Medio H', 0, 0, 100, 3, N'Media', N'Terceros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (101, 3, N'Cuarto Año Medio A', 0, 0, 101, 3, N'Media', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (102, 3, N'Cuarto Año Medio B', 0, 0, 102, 3, N'Media', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (103, 3, N'* TRIAL * TRIAL * ', 0, 0, 103, 3, N'Media', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (104, 3, N'Cuarto Año Medio D', 0, 0, 104, 3, N'Media', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (105, 3, N'* TRIAL * TRIAL * ', 0, 0, 105, 3, N'Media', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (106, 3, N'Cuarto Año Medio F', 0, 0, 106, 3, N'Media', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (107, 3, N'Cuarto Año Medio G', 0, 0, 107, 3, N'Media', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (108, 3, N'* TRIAL * TRIAL * ', 0, 0, 108, 3, N'Media', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (109, 4, N'Sala Cuna Menor', 0, 0, 1, 1, N'Parvularia', N'Sala Cuna Menor')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (110, 4, N'* TRIAL * TRIAL', 0, 0, 2, 1, N'Parvularia', N'Sala Cuna Mayor')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (111, 4, N'Primer Nivel Transición (Pre-Kinder)', 0, 0, 3, 1, N'Parvularia', N'* TRIAL *')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (112, 4, N'Segundo Nivel Transición (Kinder)', 0, 0, 4, 1, N'Parvularia', N'Kinder')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (113, 4, N'Primer Año Básico', 0, 0, 5, 2, N'Básica', N'Primeros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (114, 4, N'Segundo Año Básico', 0, 0, 6, 2, N'Básica', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (115, 4, N'Tercer Año Básico', 0, 0, 7, 2, N'Básica', N'Terceros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (116, 4, N'* TRIAL * TRIAL *', 0, 0, 8, 2, N'Básica', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (117, 4, N'Quinto Año Básico', 0, 0, 9, 2, N'Básica', N'Quintos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (118, 4, N'Sexto Año Básico', 0, 0, 10, 2, N'Básica', N'Sextos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (119, 4, N'Séptimo Año Básico', 0, 0, 11, 2, N'Básica', N'Séptimos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (120, 4, N'Octavo Año Básico', 0, 0, 12, 2, N'Básica', N'Octavos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (121, 4, N'* TRIAL * TRIAL ', 0, 0, 13, 3, N'Media', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (122, 4, N'Segundo Año Medio', 0, 0, 14, 3, N'Media', N'Segundos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (123, 4, N'Tercer Año Medio', 0, 0, 15, 3, N'Media', N'Terceros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (124, 4, N'Cuarto Año Medio', 0, 0, 16, 3, N'Media', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (125, 5, N'* TRIAL * TRIAL', 0, 0, 1, 1, N'Parvularia', N'Sala Cuna Menor')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (126, 5, N'Sala Cuna Mayor', 0, 0, 2, 1, N'Parvularia', N'* TRIAL * TRIAL')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (127, 5, N'* TRIAL * TRIAL * TRIAL * TRIAL * TR', 0, 0, 3, 1, N'Parvularia', N'* TRIAL *')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (128, 5, N'Segundo Nivel Transición (Kinder)', 0, 0, 4, 1, N'Parvularia', N'Kinder')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (129, 5, N'Primer Año Básico', 0, 0, 5, 2, N'Básica', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (130, 5, N'Segundo Año Básico', 0, 0, 6, 2, N'Básica', N'Segundos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (131, 5, N'Tercer Año Básico', 0, 0, 7, 2, N'Básica', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (132, 5, N'Cuarto Año Básico', 0, 0, 8, 2, N'Básica', N'Cuartos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (133, 5, N'Quinto Año Básico', 0, 0, 9, 2, N'Básica', N'Quintos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (134, 5, N'Sexto Año Básico', 0, 0, 10, 2, N'Básica', N'Sextos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (135, 5, N'Séptimo Año Básico', 0, 0, 11, 2, N'Básica', N'* TRIAL ')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (136, 5, N'Octavo Año Básico', 0, 0, 12, 2, N'Básica', N'Octavos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (137, 5, N'* TRIAL * TRIAL ', 0, 0, 13, 3, N'Media', N'Primeros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (138, 5, N'Segundo Año Medio', 0, 0, 14, 3, N'Media', N'Segundos')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (139, 5, N'Tercer Año Medio', 0, 0, 15, 3, N'Media', N'Terceros')
GO
INSERT [dbo].[cur_curso] ([ID], [INST_ID], [NOMBRE], [ID_USU_RESPONSABLE], [ELIMINADO], [ORDEN], [TIPO], [GRUPO], [SUB_GRUPO]) VALUES (140, 5, N'* TRIAL * TRIAL ', 0, 0, 16, 3, N'Media', N'Cuartos')
GO
SET IDENTITY_INSERT [dbo].[cur_curso] OFF
GO
SET IDENTITY_INSERT [dbo].[doc_documentos] ON 

GO
INSERT [dbo].[doc_documentos] ([ID], [USU_ID], [INST_ID], [NOMBRE_ARCHIVO], [URL], [TAMANO], [FECHA_SUBIDA], [EXTENSION], [ELIMINADO]) VALUES (3, 1, 3, N'* TRIAL * TRIAL * TRIAL * TRIAL * TRI', N'~/Repositorio/g5qz5bgl.l5m LA OFERTA Y DEMANDA.docx', 13, N'10/27/2015 8:57 AM', N'* TRIAL * TRIA', 0)
GO
INSERT [dbo].[doc_documentos] ([ID], [USU_ID], [INST_ID], [NOMBRE_ARCHIVO], [URL], [TAMANO], [FECHA_SUBIDA], [EXTENSION], [ELIMINADO]) VALUES (4, 1, 3, N'dzxjvwf4.gru Ideas y herramientas para mejorar la organizacion.pdf', N'~/Repositorio/dzxjvwf4.gru Ideas y herramientas para mejorar la organizacion.pdf', 866, N'* TRIAL * TRIAL * T', N'~/img/pdf.png', 0)
GO
INSERT [dbo].[doc_documentos] ([ID], [USU_ID], [INST_ID], [NOMBRE_ARCHIVO], [URL], [TAMANO], [FECHA_SUBIDA], [EXTENSION], [ELIMINADO]) VALUES (5, 1, 3, N'* TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TR', N'~/Repositorio/fsdrt32u.mhp Acta Segunda Reunion cgpa 18 6 2015.pdf', 802, N'10/27/2015 1:22 PM', N'~/img/pdf.png', 0)
GO
INSERT [dbo].[doc_documentos] ([ID], [USU_ID], [INST_ID], [NOMBRE_ARCHIVO], [URL], [TAMANO], [FECHA_SUBIDA], [EXTENSION], [ELIMINADO]) VALUES (6, 6, 4, N'lriylpeo.ioj acta 2 mayo 2013.pdf', N'~/Repositorio/lriylpeo.ioj acta 2 mayo 2013.pdf', 245, N'11/11/2015 12:36 PM', N'~/img/pdf.png', 0)
GO
INSERT [dbo].[doc_documentos] ([ID], [USU_ID], [INST_ID], [NOMBRE_ARCHIVO], [URL], [TAMANO], [FECHA_SUBIDA], [EXTENSION], [ELIMINADO]) VALUES (7, 1, 3, N'vzewr1z4.3gp marcel duchamp.docx', N'~/Repositorio/vzewr1z4.3gp marcel duchamp.docx', 24, N'* TRIAL * TRIAL ', N'~/img/word.png', 0)
GO
INSERT [dbo].[doc_documentos] ([ID], [USU_ID], [INST_ID], [NOMBRE_ARCHIVO], [URL], [TAMANO], [FECHA_SUBIDA], [EXTENSION], [ELIMINADO]) VALUES (8, 6, 4, N'1zglrxu3.40p BOLETIN-INFORMATIVO-MARZO2016.pdf', N'* TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TR', 578, N'02-04-2016 18:20', N'~/img/pdf.png', 1)
GO
SET IDENTITY_INSERT [dbo].[doc_documentos] OFF
GO
SET IDENTITY_INSERT [dbo].[doc_documentos_usuario] ON 

GO
INSERT [dbo].[doc_documentos_usuario] ([ID], [USU_ID], [INST_ID], [NOMBRE_ARCHIVO], [URL], [TAMANO], [FECHA_SUBIDA], [EXTENSION], [ELIMINADO]) VALUES (1, 6, 4, N'spppigx0.ery 1zglrxu3.40p BOLETIN-INFORMATIVO-MARZO2016.pdf', N'~/Repositorio/spppigx0.ery 1zglrxu3.40p BOLETIN-INFORMATIVO-MARZO2016.pdf', 578, N'* TRIAL * TRIAL ', N'* TRIAL * TRI', 1)
GO
INSERT [dbo].[doc_documentos_usuario] ([ID], [USU_ID], [INST_ID], [NOMBRE_ARCHIVO], [URL], [TAMANO], [FECHA_SUBIDA], [EXTENSION], [ELIMINADO]) VALUES (2, 6, 4, N'0tifeglf.mkw 1zglrxu3.40p BOLETIN-INFORMATIVO-MARZO2016.pdf', N'* TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL *', 0, N'* TRIAL * TRIAL ', N'~/img/pdf.png', 0)
GO
INSERT [dbo].[doc_documentos_usuario] ([ID], [USU_ID], [INST_ID], [NOMBRE_ARCHIVO], [URL], [TAMANO], [FECHA_SUBIDA], [EXTENSION], [ELIMINADO]) VALUES (3, 1, 3, N'x2sblepa.535 ajax-loader.gif', N'~/Repositorio/x2sblepa.535 ajax-loader.gif', 7, N'23-04-2016 22:41', N'~/img/gif.png', 0)
GO
SET IDENTITY_INSERT [dbo].[doc_documentos_usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[eg_elementos_grupo] ON 

GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (1, 1, N'#', N'', N'Gestión Contable', N'1')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (2, 1, N'#', N'', N'* TRIAL * TRIAL *', N'1')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (3, 1, N'#', N'', N'Auditoria de Uso', N'1')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (4, 1, N'#', N'', N'Precio y Condiciones Servicio', N'1')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (5, 1, N'#', N'', N'Suscripción Gratuita', N'1')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (6, 1, N'#', N'', N'* TRIAL * TRIAL * ', N'1')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (7, 2, N'Usuario/VistaDocumentos.aspx', N'', N'Descarga Asambleas', N'* TRIAL * TRIAL')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (8, 2, N'Usuario/VistaRendiciones.aspx', N'', N'* TRIAL * TRIAL * TRIAL * TR', N'* TRIAL * TRIAL')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (9, 2, N'#', N'', N'* TRIAL * TRIA', N'1,2,3,4,5,6,7,8,9')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (10, 2, N'Usuario/VistaCalendario.aspx', N'', N'Calendario', N'1,2,3,4,5,6,7,8')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (11, 6, N'* TRIAL * TRIAL * TRIAL * TR', N'', N'Usuarios CPAS', N'1,2,3,4,5,6,7')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (12, 6, N'Administracion/cargaMasiva.aspx', N'', N'Carga Masiva Padres/Apoderados', N'1,2,3,4,5,6,7')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (13, 6, N'Administracion/documentos.aspx', N'', N'Actas de Asamblea', N'1,2,3,4,5,6,7')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (14, 6, N'Administracion/IngresoEgreso.aspx', N'', N'Rendiciones', N'1,2,3,4,5,6,7')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (15, 7, N'* TRIAL * TRIAL * TRIA', N'', N'Proyectos', N'1,2,3,4,5,6,7,10')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (16, 7, N'Tricel/ListadoTricel.aspx', N'', N'Gestión TRICEL', N'1,2,3,4,5,6,7')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (17, 8, N'Usuario/VistaCalendario.aspx', N'', N'* TRIAL * TRIAL * TRI', N'1,2,3,4,5,6,7,10')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (18, 9, N'#', N'', N'Generación de Mailing Proximamente!', N'1,2,3,4,5,6,7')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (19, 10, N'* TRIAL * TRI', N'', N'Formulario de Ingreso', N'* TRIAL * TRIAL * ')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (20, 11, N'RecuperarClave/Recuperar.aspx', N'', N'Cambiar mi clave', N'1,2,3,4,5,6,7,8,9,10')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (21, 6, N'* TRIAL * TRIAL * TRIAL * TRIAL * TR', N'', N'Configuración Institución', N'1,2,3,4,5,6,7')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (22, 7, N'Tricel/Listado.aspx', N'', N'Listas TRICEL', N'* TRIAL * TRIAL *')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (23, 2, N'Usuario/VistaDocumentosUsuario.aspx', N'', N'Descarga Documentos', N'* TRIAL * TRIAL')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (24, 6, N'* TRIAL * TRIAL * TRIAL * TRIAL * TRI', N'', N'Documentos de Usuario', N'1,2,3,4,5,6,7,10')
GO
INSERT [dbo].[eg_elementos_grupo] ([ID], [ID_GRUPO], [HREF_ITEM], [CLASS_ITEM], [NOMBRE], [ROLES_ID]) VALUES (25, 6, N'Administracion/Monitoreo.aspx', N'', N'Monitoreo', N'1')
GO
SET IDENTITY_INSERT [dbo].[eg_elementos_grupo] OFF
GO
SET IDENTITY_INSERT [dbo].[enc_encabezado] ON 

GO
INSERT [dbo].[enc_encabezado] ([ID], [USA_IMAGEN_SUPERIOR], [URL_IMAGEN_SUPERIOR], [TITULO_ENCABEZADO], [SUBTITULO_ENCABEZADO], [ELIMINADO], [INST_ID]) VALUES (1, 1, N'* TRIAL * TRIAL * TRIAL * ', N'CPAS', N'Centro de Padres y Apoderados', 0, 3)
GO
INSERT [dbo].[enc_encabezado] ([ID], [USA_IMAGEN_SUPERIOR], [URL_IMAGEN_SUPERIOR], [TITULO_ENCABEZADO], [SUBTITULO_ENCABEZADO], [ELIMINADO], [INST_ID]) VALUES (2, 1, N'* TRIAL * TRIAL * TRIAL * ', N'Colegio Santa Elena ', N'CGPA', 0, 4)
GO
INSERT [dbo].[enc_encabezado] ([ID], [USA_IMAGEN_SUPERIOR], [URL_IMAGEN_SUPERIOR], [TITULO_ENCABEZADO], [SUBTITULO_ENCABEZADO], [ELIMINADO], [INST_ID]) VALUES (3, 1, N'~/img/encabezadoCPAS_2.png', N'* TRIAL * TRIAL * TR', N'CGPA', 0, 5)
GO
SET IDENTITY_INSERT [dbo].[enc_encabezado] OFF
GO
SET IDENTITY_INSERT [dbo].[gi_grupo_item] ON 

GO
INSERT [dbo].[gi_grupo_item] ([ID], [ES_GRUPO], [HREF_GRUPO], [CLASS_GRUPO], [NOMBRE_GRUPO], [ROLES_ID]) VALUES (1, 1, N'#', N'', N'Adm. General', N'1')
GO
INSERT [dbo].[gi_grupo_item] ([ID], [ES_GRUPO], [HREF_GRUPO], [CLASS_GRUPO], [NOMBRE_GRUPO], [ROLES_ID]) VALUES (2, 1, N'#', N'', N'Usuario', N'* TRIAL * TRIAL')
GO
INSERT [dbo].[gi_grupo_item] ([ID], [ES_GRUPO], [HREF_GRUPO], [CLASS_GRUPO], [NOMBRE_GRUPO], [ROLES_ID]) VALUES (6, 1, N'#', N'', N'Adm. CPAS', N'* TRIAL * TRIAL ')
GO
INSERT [dbo].[gi_grupo_item] ([ID], [ES_GRUPO], [HREF_GRUPO], [CLASS_GRUPO], [NOMBRE_GRUPO], [ROLES_ID]) VALUES (7, 1, N'#', N'', N'* TRIAL * TRIAL ', N'* TRIAL * TRIAL * ')
GO
INSERT [dbo].[gi_grupo_item] ([ID], [ES_GRUPO], [HREF_GRUPO], [CLASS_GRUPO], [NOMBRE_GRUPO], [ROLES_ID]) VALUES (8, 1, N'#', N'', N'Calendario', N'* TRIAL * TRIAL ')
GO
INSERT [dbo].[gi_grupo_item] ([ID], [ES_GRUPO], [HREF_GRUPO], [CLASS_GRUPO], [NOMBRE_GRUPO], [ROLES_ID]) VALUES (9, 1, N'#', N'', N'* TRIAL * TRIA', N'1,2,3,4,5,6,7')
GO
INSERT [dbo].[gi_grupo_item] ([ID], [ES_GRUPO], [HREF_GRUPO], [CLASS_GRUPO], [NOMBRE_GRUPO], [ROLES_ID]) VALUES (10, 1, N'#', N'', N'Contacto', N'* TRIAL * TRIAL * ')
GO
INSERT [dbo].[gi_grupo_item] ([ID], [ES_GRUPO], [HREF_GRUPO], [CLASS_GRUPO], [NOMBRE_GRUPO], [ROLES_ID]) VALUES (11, 1, N'#', N'', N'Ayuda', N'* TRIAL * TRIAL * TR')
GO
INSERT [dbo].[gi_grupo_item] ([ID], [ES_GRUPO], [HREF_GRUPO], [CLASS_GRUPO], [NOMBRE_GRUPO], [ROLES_ID]) VALUES (12, 0, N'Usuario/VistaDocumentos.aspx', N'', N'Documentos', N'9,10')
GO
INSERT [dbo].[gi_grupo_item] ([ID], [ES_GRUPO], [HREF_GRUPO], [CLASS_GRUPO], [NOMBRE_GRUPO], [ROLES_ID]) VALUES (13, 0, N'Usuario/VistaRendiciones.aspx', N'', N'Rendiciones', N'9,10')
GO
INSERT [dbo].[gi_grupo_item] ([ID], [ES_GRUPO], [HREF_GRUPO], [CLASS_GRUPO], [NOMBRE_GRUPO], [ROLES_ID]) VALUES (14, 0, N'Usuario/VistaCalendario.aspx', N'', N'Calendario', N'9,10')
GO
INSERT [dbo].[gi_grupo_item] ([ID], [ES_GRUPO], [HREF_GRUPO], [CLASS_GRUPO], [NOMBRE_GRUPO], [ROLES_ID]) VALUES (15, 0, N'Reportes/SeleccionReporte.aspx', N'', N'* TRIAL ', N'* TRIAL * TRIAL *')
GO
SET IDENTITY_INSERT [dbo].[gi_grupo_item] OFF
GO
SET IDENTITY_INSERT [dbo].[ieg_ingreso_egreso] ON 

GO
INSERT [dbo].[ieg_ingreso_egreso] ([ID], [INST_ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO], [NUMERO_COMPROBANTE], [DETALLE], [MONTO], [URL_DOCUMENTO], [ELIMINADO]) VALUES (1, 3, 1, CAST(N'2015-12-11 00:00:00.0000000' AS DateTime2), 2, N'12534', N'* TRIAL * TRIAL ', 55000, N'~/Boletas/ke0gl4cs.gtk boleta.png', 1)
GO
INSERT [dbo].[ieg_ingreso_egreso] ([ID], [INST_ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO], [NUMERO_COMPROBANTE], [DETALLE], [MONTO], [URL_DOCUMENTO], [ELIMINADO]) VALUES (2, 3, 1, CAST(N'2015-12-11 00:00:00.0000000' AS DateTime2), 1, N'No hay', N'* TRIAL ', 33000, N'* TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL *', 1)
GO
INSERT [dbo].[ieg_ingreso_egreso] ([ID], [INST_ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO], [NUMERO_COMPROBANTE], [DETALLE], [MONTO], [URL_DOCUMENTO], [ELIMINADO]) VALUES (3, 3, 1, CAST(N'2015-12-11 00:00:00.0000000' AS DateTime2), 1, N'No hay', N'Reposición se dinero', 345000, N'', 0)
GO
INSERT [dbo].[ieg_ingreso_egreso] ([ID], [INST_ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO], [NUMERO_COMPROBANTE], [DETALLE], [MONTO], [URL_DOCUMENTO], [ELIMINADO]) VALUES (4, 3, 1, CAST(N'2015-12-11 00:00:00.0000000' AS DateTime2), 2, N'1234', N'* TRIAL * TRIAL ', 49000, N'', 0)
GO
INSERT [dbo].[ieg_ingreso_egreso] ([ID], [INST_ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO], [NUMERO_COMPROBANTE], [DETALLE], [MONTO], [URL_DOCUMENTO], [ELIMINADO]) VALUES (5, 4, 6, CAST(N'2015-12-11 00:00:00.0000000' AS DateTime2), 1, N'001', N'Ingreso por pago de CGPA colegio', 5000000, N'', 0)
GO
INSERT [dbo].[ieg_ingreso_egreso] ([ID], [INST_ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO], [NUMERO_COMPROBANTE], [DETALLE], [MONTO], [URL_DOCUMENTO], [ELIMINADO]) VALUES (6, 4, 6, CAST(N'2015-12-10 23:00:00.0000000' AS DateTime2), 2, N'002', N'Boleta de reparación CASINO', 150000, N'~/Boletas/lsxj152c.dfk Boleta Compra sopapo.jpg', 0)
GO
INSERT [dbo].[ieg_ingreso_egreso] ([ID], [INST_ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO], [NUMERO_COMPROBANTE], [DETALLE], [MONTO], [URL_DOCUMENTO], [ELIMINADO]) VALUES (7, 4, 6, CAST(N'2015-12-11 00:00:00.0000000' AS DateTime2), 2, N'002', N'Instalación de gradería ', 40000000, N'', 0)
GO
INSERT [dbo].[ieg_ingreso_egreso] ([ID], [INST_ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO], [NUMERO_COMPROBANTE], [DETALLE], [MONTO], [URL_DOCUMENTO], [ELIMINADO]) VALUES (8, 3, 1, CAST(N'2016-03-12 20:27:20.0000000' AS DateTime2), 1, N'5487999', N'* TRIAL * TRIAL * TRIAL * TR', 650000, N'', 0)
GO
INSERT [dbo].[ieg_ingreso_egreso] ([ID], [INST_ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO], [NUMERO_COMPROBANTE], [DETALLE], [MONTO], [URL_DOCUMENTO], [ELIMINADO]) VALUES (9, 4, 6, CAST(N'2016-04-16 19:40:34.0000000' AS DateTime2), 2, N'00134', N'* TRIAL * TRIAL * TRIAL * TRIAL *', 1500000, N'', 0)
GO
INSERT [dbo].[ieg_ingreso_egreso] ([ID], [INST_ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO], [NUMERO_COMPROBANTE], [DETALLE], [MONTO], [URL_DOCUMENTO], [ELIMINADO]) VALUES (10, 4, 7, CAST(N'2016-05-16 14:08:11.0000000' AS DateTime2), 2, N'37321', N'Comida para la directiva', 12600, N'* TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * T', 0)
GO
SET IDENTITY_INSERT [dbo].[ieg_ingreso_egreso] OFF
GO
SET IDENTITY_INSERT [dbo].[inst_institucion] ON 

GO
INSERT [dbo].[inst_institucion] ([ID], [NOMBRE], [REG_ID], [COM_ID], [ELIMINADO]) VALUES (3, N'CPAS', 15, 295, 0)
GO
INSERT [dbo].[inst_institucion] ([ID], [NOMBRE], [REG_ID], [COM_ID], [ELIMINADO]) VALUES (4, N'Colegio de Prueba', 15, 295, 0)
GO
INSERT [dbo].[inst_institucion] ([ID], [NOMBRE], [REG_ID], [COM_ID], [ELIMINADO]) VALUES (5, N'* TRIAL * TRIAL * T', 15, 295, 0)
GO
SET IDENTITY_INSERT [dbo].[inst_institucion] OFF
GO
SET IDENTITY_INSERT [dbo].[lgu_login_usuario] ON 

GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (1, 1, CAST(N'2016-02-18 10:32:41.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (2, 1, CAST(N'2016-02-18 10:33:08.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (3, 6, CAST(N'2016-02-18 10:33:18.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (4, 6, CAST(N'2016-02-18 10:33:53.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (5, 1, CAST(N'2016-02-18 11:32:45.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (6, 1, CAST(N'2016-02-18 13:22:55.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (7, 1, CAST(N'2016-02-18 13:23:52.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (8, 1, CAST(N'2016-02-19 06:14:02.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (9, 1, CAST(N'2016-02-19 06:15:16.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (10, 1, CAST(N'2016-02-19 12:48:06.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (11, 7, CAST(N'2016-02-19 07:56:56.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (12, 7, CAST(N'2016-02-19 07:58:00.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (13, 1, CAST(N'2016-02-25 03:49:23.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (14, 1, CAST(N'2016-02-25 03:49:49.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (15, 6, CAST(N'2016-02-25 03:49:59.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (16, 6, CAST(N'2016-02-25 03:51:38.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (17, 6, CAST(N'2016-03-03 07:29:50.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (18, 9, CAST(N'2016-03-03 07:55:15.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (19, 9, CAST(N'2016-03-03 07:56:28.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (20, 1, CAST(N'2016-03-08 07:31:42.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (21, 1, CAST(N'2016-03-08 07:38:20.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (22, 1, CAST(N'2016-03-08 07:38:45.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (23, 1, CAST(N'2016-03-08 07:39:55.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (24, 1, CAST(N'2016-03-08 07:52:09.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (25, 1, CAST(N'2016-03-08 09:03:45.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (26, 1, CAST(N'2016-03-08 09:27:39.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (27, 1, CAST(N'2016-03-08 09:49:01.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (28, 1, CAST(N'2016-03-08 09:54:06.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (29, 1, CAST(N'2016-03-08 10:17:17.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (30, 1, CAST(N'2016-03-08 10:59:22.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (31, 1, CAST(N'2016-03-08 11:03:19.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (32, 1, CAST(N'2016-03-08 11:53:54.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (33, 1, CAST(N'2016-03-08 12:27:36.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (34, 1, CAST(N'2016-03-08 13:03:16.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (35, 1, CAST(N'2016-03-08 13:13:51.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (36, 1, CAST(N'2016-03-09 07:12:36.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (37, 1, CAST(N'2016-03-09 07:52:36.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (38, 1, CAST(N'2016-03-09 07:55:48.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (39, 1, CAST(N'2016-03-09 09:26:42.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (40, 1, CAST(N'2016-03-09 10:45:58.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (41, 1, CAST(N'2016-03-09 11:25:54.0000000' AS DateTime2), N'* TRIAL * TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (42, 1, CAST(N'2016-03-09 16:12:23.0000000' AS DateTime2), N'* TRIAL * TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (43, 1, CAST(N'2016-03-10 09:24:48.0000000' AS DateTime2), N'* TRIAL * TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (44, 1, CAST(N'2016-03-10 09:25:32.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (45, 1, CAST(N'2016-03-10 09:25:35.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (46, 1, CAST(N'2016-03-10 09:29:01.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (47, 1, CAST(N'2016-03-10 09:29:22.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (48, 1, CAST(N'2016-03-10 11:11:18.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (49, 1, CAST(N'2016-03-10 12:34:33.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (50, 1, CAST(N'2016-03-10 17:54:27.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (51, 1, CAST(N'2016-03-10 18:26:53.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (52, 1, CAST(N'2016-03-10 18:27:16.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (53, 1, CAST(N'2016-03-10 18:27:19.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (54, 1, CAST(N'2016-03-11 08:04:43.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (55, 1, CAST(N'2016-03-11 08:08:37.0000000' AS DateTime2), N'* TRIAL * TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (56, 1, CAST(N'2016-03-11 08:09:18.0000000' AS DateTime2), N'* TRIAL * TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (57, 1, CAST(N'2016-03-11 08:09:24.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (58, 1, CAST(N'2016-03-11 08:49:47.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (59, 6, CAST(N'2016-03-11 09:10:05.0000000' AS DateTime2), N'* TRIAL * TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (60, 1, CAST(N'2016-03-12 13:32:55.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (61, 1, CAST(N'2016-03-12 15:19:05.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (62, 1, CAST(N'2016-03-12 15:59:02.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (63, 1, CAST(N'2016-03-12 17:07:53.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (64, 1, CAST(N'2016-03-12 17:47:53.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (65, 1, CAST(N'2016-03-12 18:35:31.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (66, 1, CAST(N'2016-03-12 18:50:24.0000000' AS DateTime2), N'* TRIAL * TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (67, 1, CAST(N'2016-03-12 18:54:44.0000000' AS DateTime2), N'* TRIAL * TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (68, 1, CAST(N'2016-03-12 18:56:38.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (69, 8, CAST(N'2016-03-14 07:36:19.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (70, 1, CAST(N'2016-03-14 08:57:59.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (71, 1, CAST(N'2016-03-15 11:20:03.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (72, 1, CAST(N'2016-03-15 11:26:05.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (73, 6, CAST(N'2016-03-15 18:53:15.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (74, 6, CAST(N'2016-03-15 18:56:47.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (75, 1, CAST(N'2016-03-22 04:52:43.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (76, 1, CAST(N'2016-03-22 04:55:48.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (77, 1, CAST(N'2016-03-22 04:56:46.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (78, 1, CAST(N'2016-03-22 04:59:20.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (79, 1, CAST(N'2016-03-22 04:59:38.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (80, 1, CAST(N'2016-03-22 05:00:09.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (81, 1, CAST(N'2016-03-22 05:03:29.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (82, 1, CAST(N'2016-03-22 05:04:18.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (83, 1, CAST(N'2016-03-22 05:06:33.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (84, 1, CAST(N'2016-03-22 05:10:25.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (85, 1, CAST(N'2016-03-23 07:00:20.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (86, 1, CAST(N'2016-03-23 10:28:36.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (87, 6, CAST(N'2016-04-02 13:48:29.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (88, 6, CAST(N'2016-04-02 13:50:39.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (89, 6, CAST(N'2016-04-02 13:51:13.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (90, 6, CAST(N'2016-04-02 13:51:36.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (91, 6, CAST(N'2016-04-02 18:07:04.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (92, 6, CAST(N'2016-04-02 18:25:05.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (93, 6, CAST(N'2016-04-02 18:25:12.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (94, 1, CAST(N'2016-04-02 18:37:42.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (95, 6, CAST(N'2016-04-02 18:51:50.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (96, 6, CAST(N'2016-04-02 18:53:52.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (97, 6, CAST(N'2016-04-02 19:07:37.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (98, 6, CAST(N'2016-04-02 19:07:44.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (99, 6, CAST(N'2016-04-04 12:40:10.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (100, 6, CAST(N'2016-04-04 12:56:25.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (101, 1, CAST(N'2016-04-07 05:52:41.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (102, 1, CAST(N'2016-04-07 05:54:02.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (103, 6, CAST(N'2016-04-07 05:54:28.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (104, 6, CAST(N'2016-04-07 06:05:19.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (105, 6, CAST(N'2016-04-07 06:23:09.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (106, 6, CAST(N'2016-04-07 06:27:02.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (107, 9, CAST(N'2016-04-07 06:27:11.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (108, 9, CAST(N'2016-04-07 07:21:40.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (109, 6, CAST(N'2016-04-12 05:25:52.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (110, 6, CAST(N'2016-04-12 05:30:24.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (111, 8, CAST(N'2016-04-14 17:56:51.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (112, 1, CAST(N'2016-04-14 18:33:08.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (113, 8, CAST(N'2016-04-14 18:46:54.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (114, 8, CAST(N'2016-04-14 18:48:19.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (115, 6, CAST(N'2016-04-14 18:49:29.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (116, 6, CAST(N'2016-04-14 19:06:36.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (117, 10, CAST(N'2016-04-14 19:07:11.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (118, 10, CAST(N'2016-04-14 19:09:55.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (119, 6, CAST(N'2016-04-14 19:10:07.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (120, 6, CAST(N'2016-04-14 19:19:19.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (121, 10, CAST(N'2016-04-14 19:19:31.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (122, 10, CAST(N'2016-04-14 19:20:57.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (123, 11, CAST(N'2016-04-14 19:21:10.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (124, 11, CAST(N'2016-04-14 19:21:54.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (125, 8, CAST(N'2016-04-14 19:22:06.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (126, 8, CAST(N'2016-04-14 19:22:44.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (127, 11, CAST(N'2016-04-14 19:23:00.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (128, 11, CAST(N'2016-04-14 19:23:34.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (129, 10, CAST(N'2016-04-14 19:23:43.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (130, 10, CAST(N'2016-04-14 19:24:04.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (131, 9, CAST(N'2016-04-14 19:24:22.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (132, 9, CAST(N'2016-04-14 19:26:03.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (133, 7, CAST(N'2016-04-14 19:26:18.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (134, 7, CAST(N'2016-04-14 19:27:21.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (135, 6, CAST(N'2016-04-14 19:27:31.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (136, 6, CAST(N'2016-04-14 19:29:12.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (137, 6, CAST(N'2016-04-14 19:41:02.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (138, 7, CAST(N'2016-04-15 08:05:29.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (139, 6, CAST(N'2016-04-15 08:13:11.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (140, 7, CAST(N'2016-04-15 08:21:32.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (141, 8, CAST(N'2016-04-15 08:21:46.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (142, 8, CAST(N'2016-04-15 08:22:10.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (143, 9, CAST(N'2016-04-15 08:22:25.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (144, 9, CAST(N'2016-04-15 08:22:44.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (145, 10, CAST(N'2016-04-15 08:22:55.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (146, 9, CAST(N'2016-04-15 08:29:22.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (147, 9, CAST(N'2016-04-15 08:29:39.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (148, 8, CAST(N'2016-04-15 08:29:54.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (149, 8, CAST(N'2016-04-15 08:30:53.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (150, 10, CAST(N'2016-04-15 08:31:04.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (151, 10, CAST(N'2016-04-15 09:50:44.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (152, 6, CAST(N'2016-04-15 10:27:47.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (153, 6, CAST(N'2016-04-15 10:44:16.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (154, 6, CAST(N'2016-04-15 10:45:57.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (155, 7, CAST(N'2016-04-15 12:57:23.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (156, 7, CAST(N'2016-04-15 13:10:23.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (157, 8, CAST(N'2016-04-15 13:10:33.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (158, 8, CAST(N'2016-04-15 13:11:58.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (159, 9, CAST(N'2016-04-15 13:12:12.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (160, 10, CAST(N'2016-04-15 13:13:48.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (161, 10, CAST(N'2016-04-15 13:16:34.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (162, 7, CAST(N'2016-04-15 13:16:51.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (163, 6, CAST(N'2016-04-15 13:23:31.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (164, 6, CAST(N'2016-04-15 13:25:42.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (165, 7, CAST(N'2016-04-15 13:33:38.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (166, 6, CAST(N'2016-04-15 13:33:48.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (167, 7, CAST(N'2016-04-15 13:34:57.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (168, 6, CAST(N'2016-04-15 13:35:52.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (169, 7, CAST(N'2016-04-15 13:36:13.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (170, 9, CAST(N'2016-04-15 13:47:34.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (171, 7, CAST(N'2016-04-15 14:50:08.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (172, 7, CAST(N'2016-04-15 14:58:02.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (173, 7, CAST(N'2016-04-15 14:58:59.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (174, 7, CAST(N'2016-04-15 15:00:00.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (175, 7, CAST(N'2016-04-15 15:05:19.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (176, 6, CAST(N'2016-04-16 09:57:35.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (177, 6, CAST(N'2016-04-16 10:05:54.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (178, 4, CAST(N'2016-04-16 10:06:53.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (179, 6, CAST(N'2016-04-16 10:35:58.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (180, 6, CAST(N'2016-04-16 18:51:35.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (181, 6, CAST(N'2016-04-16 19:16:45.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (182, 6, CAST(N'2016-04-16 19:41:34.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (183, 7, CAST(N'2016-04-16 19:41:47.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (184, 1, CAST(N'2016-04-18 11:36:44.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (185, 6, CAST(N'2016-04-18 08:58:32.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (186, 1, CAST(N'2016-04-18 09:54:50.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (187, 1, CAST(N'2016-04-18 09:56:37.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (188, 1, CAST(N'2016-04-18 10:10:58.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (189, 1, CAST(N'2016-04-18 10:26:27.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (190, 18, CAST(N'2016-04-18 10:59:15.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (191, 18, CAST(N'2016-04-18 12:03:27.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (192, 18, CAST(N'2016-04-18 12:04:47.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (193, 18, CAST(N'2016-04-18 12:17:18.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (194, 18, CAST(N'2016-04-18 12:22:32.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (195, 18, CAST(N'2016-04-18 12:38:18.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (196, 18, CAST(N'2016-04-18 12:38:58.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (197, 18, CAST(N'2016-04-18 14:45:07.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (198, 18, CAST(N'2016-04-18 14:54:44.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (199, 18, CAST(N'2016-04-18 15:44:46.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (200, 18, CAST(N'2016-04-18 15:49:59.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (201, 1, CAST(N'2016-04-22 08:02:19.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (202, 1, CAST(N'2016-04-22 08:22:25.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (203, 1, CAST(N'2016-04-22 17:44:37.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (204, 1, CAST(N'2016-04-23 20:19:12.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (205, 1, CAST(N'2016-04-23 20:54:16.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (206, 1, CAST(N'2016-04-23 21:01:35.0000000' AS DateTime2), N'* TRIAL * TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (207, 1, CAST(N'2016-04-23 21:08:17.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (208, 1, CAST(N'2016-04-23 21:16:34.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (209, 1, CAST(N'2016-04-23 22:29:59.0000000' AS DateTime2), N'* TRIAL * TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (210, 1, CAST(N'2016-04-23 22:31:27.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (211, 1, CAST(N'2016-04-23 22:38:48.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (212, 1, CAST(N'2016-04-23 22:42:29.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (213, 1, CAST(N'2016-04-23 22:44:20.0000000' AS DateTime2), N'* TRIAL * TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (214, 1, CAST(N'2016-04-23 22:46:25.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (215, 7, CAST(N'2016-04-23 22:47:06.0000000' AS DateTime2), N'* TRIAL * TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (216, 1, CAST(N'2016-04-23 23:19:03.0000000' AS DateTime2), N'* TRIAL * TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (217, 1, CAST(N'2016-04-23 23:19:12.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (218, 1, CAST(N'2016-04-25 13:55:06.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (219, 1, CAST(N'2016-04-25 13:57:45.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (220, 1, CAST(N'2016-04-25 13:57:59.0000000' AS DateTime2), N'Ingresar Android')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (221, 1, CAST(N'2016-04-25 14:01:34.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (222, 8, CAST(N'2016-05-05 19:14:41.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (223, 7, CAST(N'2016-05-05 19:20:39.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (224, 7, CAST(N'2016-05-05 19:29:15.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (225, 7, CAST(N'2016-05-05 19:35:00.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (226, 20, CAST(N'2016-05-05 19:36:38.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (227, 20, CAST(N'2016-05-05 19:37:49.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (228, 18, CAST(N'2016-05-05 19:39:14.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (229, 18, CAST(N'2016-05-05 19:48:45.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (230, 7, CAST(N'2016-05-05 19:49:36.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (231, 7, CAST(N'2016-05-05 19:52:49.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (232, 7, CAST(N'2016-05-05 20:02:40.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (233, 21, CAST(N'2016-05-05 20:03:04.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (234, 21, CAST(N'2016-05-05 20:03:38.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (235, 18, CAST(N'2016-05-06 07:19:17.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (236, 18, CAST(N'2016-05-06 07:39:03.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (237, 22, CAST(N'2016-05-06 07:39:10.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (238, 1, CAST(N'2016-05-06 07:41:01.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (239, 22, CAST(N'2016-05-06 07:41:04.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (240, 18, CAST(N'2016-05-06 07:41:12.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (241, 18, CAST(N'2016-05-06 07:45:32.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (242, 23, CAST(N'2016-05-06 07:45:40.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (243, 23, CAST(N'2016-05-06 07:45:50.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (244, 18, CAST(N'2016-05-06 07:46:01.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (245, 18, CAST(N'2016-05-06 07:51:37.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (246, 24, CAST(N'2016-05-06 07:51:54.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (247, 24, CAST(N'2016-05-06 07:52:21.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (248, 1, CAST(N'2016-05-06 07:55:04.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (249, 1, CAST(N'2016-05-06 07:55:21.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (250, 1, CAST(N'2016-05-06 07:59:08.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (251, 18, CAST(N'2016-05-06 08:06:20.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (252, 1, CAST(N'2016-05-06 08:09:40.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (253, 18, CAST(N'2016-05-06 08:20:47.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (254, 8, CAST(N'2016-05-06 08:29:10.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (255, 1, CAST(N'2016-05-06 14:59:50.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (256, 1, CAST(N'2016-05-06 15:00:42.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (257, 18, CAST(N'2016-05-07 16:53:27.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (258, 7, CAST(N'2016-05-07 16:55:25.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (259, 18, CAST(N'2016-05-08 14:32:42.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (260, 1, CAST(N'2016-05-10 07:51:35.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (261, 1, CAST(N'2016-05-10 07:54:00.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (262, 18, CAST(N'2016-05-12 09:33:01.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (263, 18, CAST(N'2016-05-12 10:20:02.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (264, 18, CAST(N'2016-05-15 10:47:59.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (265, 18, CAST(N'2016-05-15 10:49:55.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (266, 1, CAST(N'2016-05-15 17:37:17.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (267, 1, CAST(N'2016-05-15 17:38:00.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (268, 22, CAST(N'2016-05-15 20:24:18.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (269, 7, CAST(N'2016-05-16 08:52:55.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (270, 1, CAST(N'2016-05-16 13:58:53.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (271, 1, CAST(N'2016-05-16 14:01:27.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (272, 7, CAST(N'2016-05-16 14:05:40.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (273, 1, CAST(N'2016-05-16 14:13:17.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (274, 1, CAST(N'2016-05-16 14:15:17.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (275, 18, CAST(N'2016-05-18 12:18:53.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (276, 18, CAST(N'2016-05-18 12:28:19.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (277, 9, CAST(N'2016-05-18 12:28:38.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (278, 9, CAST(N'2016-05-18 12:28:54.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (279, 9, CAST(N'2016-05-18 12:29:57.0000000' AS DateTime2), N'Salir')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (280, 22, CAST(N'2016-05-21 15:13:59.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (281, 1, CAST(N'2016-05-24 21:54:37.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (282, 1, CAST(N'2016-05-27 10:56:32.0000000' AS DateTime2), N'* TRIAL ')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (283, 1, CAST(N'2016-05-27 11:40:35.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (284, 1, CAST(N'2016-05-27 11:41:34.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (285, 1, CAST(N'2016-05-27 12:18:36.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (286, 1, CAST(N'2016-05-27 12:36:20.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (287, 1, CAST(N'2016-05-27 12:38:54.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (288, 1, CAST(N'2016-06-15 14:47:50.0000000' AS DateTime2), N'Ingresar')
GO
INSERT [dbo].[lgu_login_usuario] ([ID], [USU_ID], [FECHA_MOVIMIENTO], [TIPO_MOVIMIENTO]) VALUES (289, 1, CAST(N'2016-08-10 11:35:40.0000000' AS DateTime2), N'Ingresar')
GO
SET IDENTITY_INSERT [dbo].[lgu_login_usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[ltr_lista_tricel] ON 

GO
INSERT [dbo].[ltr_lista_tricel] ([ID], [TRI_ID], [INST_ID], [USU_ID], [ROL], [ELIMINADO], [NOMBRE], [OBJETIVO], [DESCRIPCION], [BENEFICIOS], [FECHA_INICIO], [FECHA_TERMINO]) VALUES (1, 1, 4, 6, N'Administrador', 0, N'Lista 1', N'objetivo Lista 1', N'Descripcion Lista 1', N'* TRIAL * TRIAL * ', CAST(N'2016-02-17 00:00:00.0000000' AS DateTime2), CAST(N'2016-02-26 00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[ltr_lista_tricel] ([ID], [TRI_ID], [INST_ID], [USU_ID], [ROL], [ELIMINADO], [NOMBRE], [OBJETIVO], [DESCRIPCION], [BENEFICIOS], [FECHA_INICIO], [FECHA_TERMINO]) VALUES (2, 1, 4, 7, N'* TRIAL * TRI', 0, N'Lista 2', N'Objetivo lista 2', N'* TRIAL * TRIAL * T', N'beneficios lista 2', CAST(N'2016-02-17 00:00:00.0000000' AS DateTime2), CAST(N'2016-02-28 00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[ltr_lista_tricel] ([ID], [TRI_ID], [INST_ID], [USU_ID], [ROL], [ELIMINADO], [NOMBRE], [OBJETIVO], [DESCRIPCION], [BENEFICIOS], [FECHA_INICIO], [FECHA_TERMINO]) VALUES (3, 2, 3, 1, N'* TRIAL * TRI', 0, N'lista de prueba ', N'Objetivo de prueba', N'Descripción de pruebs', N'* TRIAL *', CAST(N'2016-03-06 00:00:00.0000000' AS DateTime2), CAST(N'2016-03-29 00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[ltr_lista_tricel] ([ID], [TRI_ID], [INST_ID], [USU_ID], [ROL], [ELIMINADO], [NOMBRE], [OBJETIVO], [DESCRIPCION], [BENEFICIOS], [FECHA_INICIO], [FECHA_TERMINO]) VALUES (4, 3, 3, 1, N'Administrador', 0, N'* TRIAL * ', N'Obj', N'Desc', N'Bene', CAST(N'2016-03-09 00:00:00.0000000' AS DateTime2), CAST(N'2016-03-28 00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[ltr_lista_tricel] ([ID], [TRI_ID], [INST_ID], [USU_ID], [ROL], [ELIMINADO], [NOMBRE], [OBJETIVO], [DESCRIPCION], [BENEFICIOS], [FECHA_INICIO], [FECHA_TERMINO]) VALUES (5, 4, 3, 1, N'* TRIAL * TRI', 0, N'victor', N'Obj', N'Desc', N'Bene', CAST(N'2016-03-08 00:00:00.0000000' AS DateTime2), CAST(N'2016-03-28 00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[ltr_lista_tricel] ([ID], [TRI_ID], [INST_ID], [USU_ID], [ROL], [ELIMINADO], [NOMBRE], [OBJETIVO], [DESCRIPCION], [BENEFICIOS], [FECHA_INICIO], [FECHA_TERMINO]) VALUES (6, 5, 3, 1, N'Administrador', 0, N'lista favorita', N'Obj', N'Descripción', N'* TRIAL *', CAST(N'2016-03-11 00:00:00.0000000' AS DateTime2), CAST(N'2016-03-28 00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[ltr_lista_tricel] OFF
GO
SET IDENTITY_INSERT [dbo].[per_persona] ON 

GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (3, N'12535306-1', N'VICTOR HUGO', N'CORONADO', N'ALARCON', 0, 15, 327, N'Pasaje Cordón Roma 0621 Puente Alto', 3, 1, N'85006988', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (6, N'13671095-8', N'González', N'Garcia', N'', 0, 15, 295, N'Prueba', 3, 4, N'+56994359451', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (7, N'11111111-1', N'Prueba', N'CORONADO', N'ALARCON', 0, 15, 300, N'Prueba', 3, 5, N'76890000', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (8, N'11111111-1', N'Victor', N'Garcia', N'G', 0, 15, 295, N'asas', 4, 6, N'', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (9, N'11111111-1', N'victor', N'garcia', N'', 0, 15, 295, N'pepepep', 4, 7, N'', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (10, N'* TRIAL * ', N'victor', N'garcia', N'Dos', 0, 15, 295, N'asasas', 4, 8, N'', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (11, N'55555555-5', N'victor', N'garcia', N'Tres', 0, 15, 295, N'* TRIAL ', 4, 9, N'', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (12, N'55555555-5', N'victor', N'garcia', N'Cuatro', 0, 15, 295, N'asasas', 4, 10, N'', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (13, N'* TRIAL * ', N'victor', N'garcia', N'Seis', 0, 15, 295, N'asas', 4, 12, N'', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (14, N'10452691-8', N'Pedro Pablo', N'* TRIAL *', N'', 0, 15, 327, N'', 3, 13, N'* TRIAL *', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (15, N'12193014-5', N'Ines', N'Retamales', N'Contreras', 0, 15, 327, N'', 3, 14, N'* TRIAL * ', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (16, N'10452691-8', N'Otro', N'Otro', N'', 0, 15, 327, N'', 3, 15, N'* TRIAL * T', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (17, N'10452691-8', N'Pedro Pablo', N'Contreras', N'', 0, 15, 327, N'', 3, 16, N'569874521', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (18, N'* TRIAL * ', N'Ines', N'* TRIAL *', N'* TRIAL *', 0, 15, 327, N'', 3, 17, N'5698745121', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (19, N'77777777-7', N'Victor ', N'Garcia', N'Cinco', 0, 15, 295, N'asas', 4, 11, N'', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (20, N'* TRIAL * ', N'Victor', N'García', N'', 0, 15, 295, N'No registrada', 5, 18, N'', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (21, N'13597434-k', N'Danitza', N'Salazar', N'Ojeda', 0, 15, 295, N'', 4, 19, N'96278728', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (22, N'* TRIAL * ', N'Victor', N'García', N'Gonzalez', 0, 15, 295, N'', 4, 20, N'94359451', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (23, N'12312312-3', N'Danitza ', N'* TRIAL ', N'Ojeda ', 0, 15, 295, N'Gral.  Bulnes', 4, 21, N'227868835', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (24, N'09166213-2', N'Miguel', N'Abarca', N'Soto', 0, 15, 295, N'Avda. Compañía #2398', 5, 22, N'975778905', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (25, N'12239244-9', N'Marcia ', N'Quiroga', N'Bastias', 0, 15, 295, N'* TRIAL * TRIAL * TR', 5, 23, N'975382632', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (26, N'12126594-k', N'Sandra', N'Rojas', N'* TRIAL ', 0, 15, 295, N'Avda. Compañía #2398', 5, 24, N'977579808', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (27, N'14052578-2', N'Daniela', N'Labbe', N'Fernandez', 0, 15, 295, N'Avda. Compañía #2398', 5, 25, N'* TRIAL *', 0)
GO
INSERT [dbo].[per_persona] ([ID], [RUT], [NOMBRES], [APELLIDO_PATERNO], [APELLIDO_MATERNO], [PAIS_ID], [REG_ID], [COM_ID], [DIRECCION_COMPLETA], [INST_ID], [USU_ID], [TELEFONOS], [ELIMINADO]) VALUES (28, N'10452691-8', N'Pedro', N'Fuentes', N'', 0, 12, 255, N'Prueba', 3, 28, N'123456', 0)
GO
SET IDENTITY_INSERT [dbo].[per_persona] OFF
GO
SET IDENTITY_INSERT [dbo].[pro_proyectos] ON 

GO
INSERT [dbo].[pro_proyectos] ([ID], [FECHA_CREACION], [USU_ID_CREADOR], [INST_ID], [NOMBRE], [OBJETIVO], [DESCRIPCION], [BENEFICIOS], [COSTO], [FECHA_INICIO], [FECHA_TERMINO], [ENVIA_CORREO], [NOTIFICA_POPUP], [ES_VIGENTE], [ELIMINADO], [FUE_APROBADO]) VALUES (1, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), 1, 3, N'* TRIAL * TRIAL * TRIAL * T', N'* TRIAL * TRIAL * TRIAL * TRIAL * T', N'* TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TR', N'Aca se destaca el impacto y los beneficios esperados que resultaran de la ejecución del proyecto', 587000, CAST(N'2015-11-08 00:00:00.0000000' AS DateTime2), CAST(N'2015-11-29 00:00:00.0000000' AS DateTime2), 1, 1, 1, 0, 0)
GO
INSERT [dbo].[pro_proyectos] ([ID], [FECHA_CREACION], [USU_ID_CREADOR], [INST_ID], [NOMBRE], [OBJETIVO], [DESCRIPCION], [BENEFICIOS], [COSTO], [FECHA_INICIO], [FECHA_TERMINO], [ENVIA_CORREO], [NOTIFICA_POPUP], [ES_VIGENTE], [ELIMINADO], [FUE_APROBADO]) VALUES (2, CAST(N'2015-11-10 18:29:56.0000000' AS DateTime2), 6, 4, N'* TRIAL * TRIAL * ', N'* TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL ', N'* TRIAL * TRIAL * ', N'Breve descripción ', 8500000, CAST(N'2015-11-10 00:00:00.0000000' AS DateTime2), CAST(N'2016-05-31 00:00:00.0000000' AS DateTime2), 1, 1, 1, 1, 0)
GO
INSERT [dbo].[pro_proyectos] ([ID], [FECHA_CREACION], [USU_ID_CREADOR], [INST_ID], [NOMBRE], [OBJETIVO], [DESCRIPCION], [BENEFICIOS], [COSTO], [FECHA_INICIO], [FECHA_TERMINO], [ENVIA_CORREO], [NOTIFICA_POPUP], [ES_VIGENTE], [ELIMINADO], [FUE_APROBADO]) VALUES (3, CAST(N'2015-11-10 18:38:02.0000000' AS DateTime2), 6, 4, N'Mejoramiento Acceso Principal', N'Mejorar el acceso principal del Establecimiento', N'Breve Descripcion', N'Para todos los alumnos', 3250000, CAST(N'2015-11-10 00:00:00.0000000' AS DateTime2), CAST(N'2015-11-24 00:00:00.0000000' AS DateTime2), 1, 1, 1, 1, 0)
GO
INSERT [dbo].[pro_proyectos] ([ID], [FECHA_CREACION], [USU_ID_CREADOR], [INST_ID], [NOMBRE], [OBJETIVO], [DESCRIPCION], [BENEFICIOS], [COSTO], [FECHA_INICIO], [FECHA_TERMINO], [ENVIA_CORREO], [NOTIFICA_POPUP], [ES_VIGENTE], [ELIMINADO], [FUE_APROBADO]) VALUES (4, CAST(N'2015-12-13 20:04:57.0000000' AS DateTime2), 1, 3, N'prueba de proyecto 1', N'Objetivo', N'Descripción ', N'Beneficios ', 1548777, CAST(N'2015-12-16 00:00:00.0000000' AS DateTime2), CAST(N'2015-12-18 00:00:00.0000000' AS DateTime2), 0, 0, 1, 0, 0)
GO
INSERT [dbo].[pro_proyectos] ([ID], [FECHA_CREACION], [USU_ID_CREADOR], [INST_ID], [NOMBRE], [OBJETIVO], [DESCRIPCION], [BENEFICIOS], [COSTO], [FECHA_INICIO], [FECHA_TERMINO], [ENVIA_CORREO], [NOTIFICA_POPUP], [ES_VIGENTE], [ELIMINADO], [FUE_APROBADO]) VALUES (5, CAST(N'2016-03-11 08:06:38.0000000' AS DateTime2), 1, 3, N'* TRIAL * TRI', N'Obj', N'Desc', N'Bene', 7000000, CAST(N'2016-03-09 00:00:00.0000000' AS DateTime2), CAST(N'2016-03-30 00:00:00.0000000' AS DateTime2), 0, 0, 1, 0, 0)
GO
INSERT [dbo].[pro_proyectos] ([ID], [FECHA_CREACION], [USU_ID_CREADOR], [INST_ID], [NOMBRE], [OBJETIVO], [DESCRIPCION], [BENEFICIOS], [COSTO], [FECHA_INICIO], [FECHA_TERMINO], [ENVIA_CORREO], [NOTIFICA_POPUP], [ES_VIGENTE], [ELIMINADO], [FUE_APROBADO]) VALUES (6, CAST(N'2016-04-14 19:19:02.0000000' AS DateTime2), 6, 4, N'Instalación de graderías en patio principal', N'Instalación de graderias en patio principal', N'Juegos de graderías para el patio', N'Comodidad en los actos y Eventos deportivos del colegio', 2500000, CAST(N'2016-04-12 00:00:00.0000000' AS DateTime2), CAST(N'2016-04-22 00:00:00.0000000' AS DateTime2), 1, 0, 1, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[pro_proyectos] OFF
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (1, 1, N'ARICA', 2)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (2, 1, N'PARINACOTA', 2)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (3, 2, N'IQUIQUE', 2)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (4, 2, N'* TRIAL *', 5)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (5, 3, N'ANTOFAGASTA', 4)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (6, 3, N'EL LOA', 3)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (7, 3, N'* TRIAL *', 2)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (8, 4, N'COPIAPÓ', 3)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (9, 4, N'* TRIAL ', 2)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (10, 4, N'HUASCO', 4)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (11, 5, N'ELQUI', 6)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (12, 5, N'CHOAPA', 4)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (13, 5, N'LIMARÍ', 5)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (14, 6, N'VALPARAÍSO', 7)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (15, 6, N'* TRIAL * TRIA', 1)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (16, 6, N'LOS ANDES', 4)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (17, 6, N'PETORCA', 5)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (18, 6, N'QUILLOTA', 5)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (19, 6, N'* TRIAL * T', 6)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (20, 6, N'SAN FELIPE DE ACONCAGUA', 6)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (21, 6, N'MARGA MARGA', 4)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (22, 7, N'* TRIAL *', 17)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (23, 7, N'CARDENAL CARO', 6)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (24, 7, N'COLCHAGUA', 10)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (25, 8, N'TALCA', 10)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (26, 8, N'CAUQUENES', 3)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (27, 8, N'CURICÓ', 9)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (28, 8, N'LINARES', 8)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (29, 9, N'CONCEPCIÓN', 12)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (30, 9, N'ARAUCO', 7)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (31, 9, N'BIOBÍO', 14)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (32, 9, N'ÑUBLE', 21)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (33, 10, N'CAUTÍN', 21)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (34, 10, N'MALLECO', 11)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (35, 11, N'VALDIVIA', 8)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (36, 11, N'RANCO', 4)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (37, 12, N'* TRIAL * ', 9)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (38, 12, N'CHILOÉ', 10)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (39, 12, N'OSORNO', 7)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (40, 12, N'PALENA', 4)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (41, 13, N'COIHAIQUE', 2)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (42, 13, N'AISÉN', 3)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (43, 13, N'CAPITÁN PRAT', 3)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (44, 13, N'GENERAL CARRERA', 2)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (45, 14, N'MAGALLANES', 4)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (46, 14, N'* TRIAL * TRIAL *', 2)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (47, 14, N'TIERRA DEL FUEGO', 3)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (48, 14, N'ULTIMA ESPERANZA', 2)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (49, 15, N'SANTIAGO', 32)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (50, 15, N'* TRIAL * ', 3)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (51, 15, N'* TRIAL *', 3)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (52, 15, N'MAIPO', 4)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (53, 15, N'* TRIAL *', 5)
GO
INSERT [dbo].[prov_provincia] ([ID], [REG_ID], [NOMBRE], [NUMERO_COMUNAS]) VALUES (54, 15, N'TALAGANTE', 5)
GO
INSERT [dbo].[reg_region] ([ID], [NOMBRE], [ROMANO], [NUMERO_PROVINCIAS], [NUMERO_COMUNAS]) VALUES (1, N'* TRIAL * TRIAL * ', N'XV', 2, 4)
GO
INSERT [dbo].[reg_region] ([ID], [NOMBRE], [ROMANO], [NUMERO_PROVINCIAS], [NUMERO_COMUNAS]) VALUES (2, N'TARAPACÁ', N'I', 2, 7)
GO
INSERT [dbo].[reg_region] ([ID], [NOMBRE], [ROMANO], [NUMERO_PROVINCIAS], [NUMERO_COMUNAS]) VALUES (3, N'ANTOFAGASTA', N'II', 3, 9)
GO
INSERT [dbo].[reg_region] ([ID], [NOMBRE], [ROMANO], [NUMERO_PROVINCIAS], [NUMERO_COMUNAS]) VALUES (4, N'* TRIAL ', N'III', 3, 9)
GO
INSERT [dbo].[reg_region] ([ID], [NOMBRE], [ROMANO], [NUMERO_PROVINCIAS], [NUMERO_COMUNAS]) VALUES (5, N'COQUIMBO ', N'IV', 3, 15)
GO
INSERT [dbo].[reg_region] ([ID], [NOMBRE], [ROMANO], [NUMERO_PROVINCIAS], [NUMERO_COMUNAS]) VALUES (6, N'VALPARAÍSO ', N'V', 8, 38)
GO
INSERT [dbo].[reg_region] ([ID], [NOMBRE], [ROMANO], [NUMERO_PROVINCIAS], [NUMERO_COMUNAS]) VALUES (7, N'DEL LIBERTADOR GRAL. BERNARDO O''HIGGINS ', N'VI', 3, 33)
GO
INSERT [dbo].[reg_region] ([ID], [NOMBRE], [ROMANO], [NUMERO_PROVINCIAS], [NUMERO_COMUNAS]) VALUES (8, N'* TRIAL *', N'VII', 4, 30)
GO
INSERT [dbo].[reg_region] ([ID], [NOMBRE], [ROMANO], [NUMERO_PROVINCIAS], [NUMERO_COMUNAS]) VALUES (9, N'* TRIAL * T', N'VIII', 4, 54)
GO
INSERT [dbo].[reg_region] ([ID], [NOMBRE], [ROMANO], [NUMERO_PROVINCIAS], [NUMERO_COMUNAS]) VALUES (10, N'DE LA ARAUCANÍA', N'IX', 2, 32)
GO
INSERT [dbo].[reg_region] ([ID], [NOMBRE], [ROMANO], [NUMERO_PROVINCIAS], [NUMERO_COMUNAS]) VALUES (11, N'* TRIAL * T', N'XIV', 2, 12)
GO
INSERT [dbo].[reg_region] ([ID], [NOMBRE], [ROMANO], [NUMERO_PROVINCIAS], [NUMERO_COMUNAS]) VALUES (12, N'DE LOS LAGOS', N'X', 4, 30)
GO
INSERT [dbo].[reg_region] ([ID], [NOMBRE], [ROMANO], [NUMERO_PROVINCIAS], [NUMERO_COMUNAS]) VALUES (13, N'AISÉN DEL GRAL. CARLOS IBAÑEZ DEL CAMPO ', N'XI', 4, 10)
GO
INSERT [dbo].[reg_region] ([ID], [NOMBRE], [ROMANO], [NUMERO_PROVINCIAS], [NUMERO_COMUNAS]) VALUES (14, N'* TRIAL * TRIAL * TRIAL * TRIAL * TR', N'XII', 4, 11)
GO
INSERT [dbo].[reg_region] ([ID], [NOMBRE], [ROMANO], [NUMERO_PROVINCIAS], [NUMERO_COMUNAS]) VALUES (15, N'METROPOLITANA DE SANTIAGO', N'RM', 6, 52)
GO
SET IDENTITY_INSERT [dbo].[rol_rol] ON 

GO
INSERT [dbo].[rol_rol] ([ID], [NOMBRE], [DESCRIPCION], [ELIMINADO]) VALUES (1, N'Super Administrador', N'* TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * TR', 0)
GO
INSERT [dbo].[rol_rol] ([ID], [NOMBRE], [DESCRIPCION], [ELIMINADO]) VALUES (2, N'Administrador Centro Educacional', N'* TRIAL * TRIAL * TRIAL * TRIAL * TRIAL * T', 0)
GO
INSERT [dbo].[rol_rol] ([ID], [NOMBRE], [DESCRIPCION], [ELIMINADO]) VALUES (3, N'Presidente CPAS', N'Gestiona actividades del Centro de Padres', 0)
GO
INSERT [dbo].[rol_rol] ([ID], [NOMBRE], [DESCRIPCION], [ELIMINADO]) VALUES (4, N'Tesorero CPAS', N'Solo lectura', 0)
GO
INSERT [dbo].[rol_rol] ([ID], [NOMBRE], [DESCRIPCION], [ELIMINADO]) VALUES (5, N'Secretario CPAS', N'Secretario', 0)
GO
INSERT [dbo].[rol_rol] ([ID], [NOMBRE], [DESCRIPCION], [ELIMINADO]) VALUES (6, N'Vicepresidente CPAS', N'Tesorero', 0)
GO
INSERT [dbo].[rol_rol] ([ID], [NOMBRE], [DESCRIPCION], [ELIMINADO]) VALUES (7, N'Director CPAS', N'DIRECTOR', 0)
GO
INSERT [dbo].[rol_rol] ([ID], [NOMBRE], [DESCRIPCION], [ELIMINADO]) VALUES (8, N'Director Establecimiento', N'* TRIAL * TRIAL * TRIAL * TR', 0)
GO
INSERT [dbo].[rol_rol] ([ID], [NOMBRE], [DESCRIPCION], [ELIMINADO]) VALUES (9, N'Apoderado', N'Apoderado', 0)
GO
INSERT [dbo].[rol_rol] ([ID], [NOMBRE], [DESCRIPCION], [ELIMINADO]) VALUES (10, N'Delegado de Cultura y Deportes', N'Delegado Cultural y Deportivo del Establecimiento', 0)
GO
SET IDENTITY_INSERT [dbo].[rol_rol] OFF
GO
SET IDENTITY_INSERT [dbo].[rpt_responsable_tricel] ON 

GO
INSERT [dbo].[rpt_responsable_tricel] ([ID], [TRI_ID], [USU_ID], [ELIMINADO]) VALUES (1, 1, 6, 0)
GO
INSERT [dbo].[rpt_responsable_tricel] ([ID], [TRI_ID], [USU_ID], [ELIMINADO]) VALUES (2, 1, 7, 0)
GO
INSERT [dbo].[rpt_responsable_tricel] ([ID], [TRI_ID], [USU_ID], [ELIMINADO]) VALUES (5, 2, 1, 0)
GO
INSERT [dbo].[rpt_responsable_tricel] ([ID], [TRI_ID], [USU_ID], [ELIMINADO]) VALUES (6, 2, 7, 0)
GO
INSERT [dbo].[rpt_responsable_tricel] ([ID], [TRI_ID], [USU_ID], [ELIMINADO]) VALUES (7, 3, 1, 0)
GO
INSERT [dbo].[rpt_responsable_tricel] ([ID], [TRI_ID], [USU_ID], [ELIMINADO]) VALUES (8, 3, 6, 0)
GO
INSERT [dbo].[rpt_responsable_tricel] ([ID], [TRI_ID], [USU_ID], [ELIMINADO]) VALUES (9, 4, 1, 0)
GO
INSERT [dbo].[rpt_responsable_tricel] ([ID], [TRI_ID], [USU_ID], [ELIMINADO]) VALUES (10, 4, 6, 0)
GO
INSERT [dbo].[rpt_responsable_tricel] ([ID], [TRI_ID], [USU_ID], [ELIMINADO]) VALUES (11, 5, 1, 0)
GO
INSERT [dbo].[rpt_responsable_tricel] ([ID], [TRI_ID], [USU_ID], [ELIMINADO]) VALUES (12, 5, 6, 0)
GO
SET IDENTITY_INSERT [dbo].[rpt_responsable_tricel] OFF
GO
SET IDENTITY_INSERT [dbo].[tri_tricel] ON 

GO
INSERT [dbo].[tri_tricel] ([ID], [FECHA_CREACION], [USU_ID_CREADOR], [INST_ID], [NOMBRE], [OBJETIVO], [FECHA_INICIO], [FECHA_TERMINO], [ES_VIGENTE], [ELIMINADO]) VALUES (1, CAST(N'2016-02-17 17:26:59.0000000' AS DateTime2), 6, 4, N'Tricel 1', N'* TRIAL * ', CAST(N'2016-02-17 00:00:00.0000000' AS DateTime2), CAST(N'2016-02-29 00:00:00.0000000' AS DateTime2), 1, 0)
GO
INSERT [dbo].[tri_tricel] ([ID], [FECHA_CREACION], [USU_ID_CREADOR], [INST_ID], [NOMBRE], [OBJETIVO], [FECHA_INICIO], [FECHA_TERMINO], [ES_VIGENTE], [ELIMINADO]) VALUES (2, CAST(N'2016-03-08 07:33:47.0000000' AS DateTime2), 1, 3, N'prueba', N'Objetivo prueba', CAST(N'2016-03-06 00:00:00.0000000' AS DateTime2), CAST(N'2016-03-30 00:00:00.0000000' AS DateTime2), 1, 0)
GO
INSERT [dbo].[tri_tricel] ([ID], [FECHA_CREACION], [USU_ID_CREADOR], [INST_ID], [NOMBRE], [OBJETIVO], [FECHA_INICIO], [FECHA_TERMINO], [ES_VIGENTE], [ELIMINADO]) VALUES (3, CAST(N'2016-03-11 08:11:54.0000000' AS DateTime2), 1, 3, N'Triple coro', N'Obj', CAST(N'2016-03-08 00:00:00.0000000' AS DateTime2), CAST(N'2016-03-29 00:00:00.0000000' AS DateTime2), 1, 0)
GO
INSERT [dbo].[tri_tricel] ([ID], [FECHA_CREACION], [USU_ID_CREADOR], [INST_ID], [NOMBRE], [OBJETIVO], [FECHA_INICIO], [FECHA_TERMINO], [ES_VIGENTE], [ELIMINADO]) VALUES (4, CAST(N'2016-03-11 08:52:55.0000000' AS DateTime2), 1, 3, N'pppp', N'Obj', CAST(N'2016-03-08 00:00:00.0000000' AS DateTime2), CAST(N'2016-03-30 00:00:00.0000000' AS DateTime2), 1, 0)
GO
INSERT [dbo].[tri_tricel] ([ID], [FECHA_CREACION], [USU_ID_CREADOR], [INST_ID], [NOMBRE], [OBJETIVO], [FECHA_INICIO], [FECHA_TERMINO], [ES_VIGENTE], [ELIMINADO]) VALUES (5, CAST(N'2016-03-12 13:35:04.0000000' AS DateTime2), 1, 3, N'coro', N'* TRIAL ', CAST(N'2016-03-11 00:00:00.0000000' AS DateTime2), CAST(N'2016-03-29 00:00:00.0000000' AS DateTime2), 1, 0)
GO
SET IDENTITY_INSERT [dbo].[tri_tricel] OFF
GO
SET IDENTITY_INSERT [dbo].[usl_usuario_lista] ON 

GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (1, 8, 0, 1, N'Presidente')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (2, 9, 0, 1, N'Vicepresidente')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (3, 10, 0, 1, N'Secretario')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (4, 11, 0, 1, N'Tesorero')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (5, 8, 0, 2, N'Presidente')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (6, 9, 0, 2, N'* TRIAL * TRIA')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (7, 10, 0, 2, N'Secretario')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (8, 12, 0, 2, N'Tesorero')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (9, 4, 0, 3, N'* TRIAL * ')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (10, 6, 0, 3, N'Vicepresidente')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (11, 8, 0, 3, N'Secretario')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (12, 9, 0, 3, N'Tesorero')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (13, 10, 0, 3, N'Otro1')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (14, 4, 0, 4, N'* TRIAL * ')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (15, 7, 0, 4, N'* TRIAL * TRIA')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (16, 10, 0, 4, N'* TRIAL * ')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (17, 8, 0, 4, N'Tesorero')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (18, 4, 0, 5, N'Presidente')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (19, 7, 0, 5, N'* TRIAL * TRIA')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (20, 8, 0, 5, N'Secretario')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (21, 9, 0, 5, N'Tesorero')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (22, 4, 0, 6, N'Presidente')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (23, 7, 0, 6, N'* TRIAL * TRIA')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (24, 8, 0, 6, N'Secretario')
GO
INSERT [dbo].[usl_usuario_lista] ([ID], [USU_ID], [ELIMINADO], [LTR_ID], [ROL]) VALUES (25, 9, 0, 6, N'* TRIAL ')
GO
SET IDENTITY_INSERT [dbo].[usl_usuario_lista] OFF
GO
SET IDENTITY_INSERT [dbo].[vi_vinculos_institucion] ON 

GO
INSERT [dbo].[vi_vinculos_institucion] ([ID], [INST_ID], [IMAGEN_VINCULO_1], [URL_VINCULO_1], [TEXTO_VINCULO_1], [VISIBLE_VINCULO_1], [VISIBLE_VINCULO_2], [IMAGEN_VINCULO_2], [URL_VINCULO_2], [TEXTO_VINCULO_2], [VISIBLE_VINCULO_3], [IMAGEN_VINCULO_3], [URL_VINCULO_3], [TEXTO_VINCULO_3]) VALUES (1, 3, N'* TRIAL * TRIAL * ', N'https://www.facebook.com/cpas.cl/', N'* TRIAL * TRIAL * TR', 1, 1, N'~/img/twitter.png', N'https://twitter.com/CPAScl', N'* TRIAL * TRIAL * ', 1, N'~/img/email.png', N'mailto:contacto@cpas.cl', N'contacto@cpas.cl')
GO
SET IDENTITY_INSERT [dbo].[vi_vinculos_institucion] OFF
GO
SET IDENTITY_INSERT [dbo].[vot_votaciones] ON 

GO
INSERT [dbo].[vot_votaciones] ([ID], [PRO_ID], [INST_ID], [USU_ID_VOTADOR], [FECHA_VOTACION], [VALOR], [ELIMINADO]) VALUES (1, 2, 4, 6, CAST(N'2015-11-10 18:40:09.0000000' AS DateTime2), 1, 0)
GO
INSERT [dbo].[vot_votaciones] ([ID], [PRO_ID], [INST_ID], [USU_ID_VOTADOR], [FECHA_VOTACION], [VALOR], [ELIMINADO]) VALUES (2, 3, 4, 6, CAST(N'2015-11-10 18:41:06.0000000' AS DateTime2), 1, 0)
GO
INSERT [dbo].[vot_votaciones] ([ID], [PRO_ID], [INST_ID], [USU_ID_VOTADOR], [FECHA_VOTACION], [VALOR], [ELIMINADO]) VALUES (3, 2, 4, 7, CAST(N'2015-11-10 18:58:06.0000000' AS DateTime2), 0, 0)
GO
INSERT [dbo].[vot_votaciones] ([ID], [PRO_ID], [INST_ID], [USU_ID_VOTADOR], [FECHA_VOTACION], [VALOR], [ELIMINADO]) VALUES (4, 6, 4, 10, CAST(N'2016-04-14 19:20:24.0000000' AS DateTime2), 1, 0)
GO
INSERT [dbo].[vot_votaciones] ([ID], [PRO_ID], [INST_ID], [USU_ID_VOTADOR], [FECHA_VOTACION], [VALOR], [ELIMINADO]) VALUES (5, 6, 4, 11, CAST(N'2016-04-14 19:21:38.0000000' AS DateTime2), 0, 0)
GO
INSERT [dbo].[vot_votaciones] ([ID], [PRO_ID], [INST_ID], [USU_ID_VOTADOR], [FECHA_VOTACION], [VALOR], [ELIMINADO]) VALUES (6, 6, 4, 8, CAST(N'2016-04-14 19:22:26.0000000' AS DateTime2), 1, 0)
GO
INSERT [dbo].[vot_votaciones] ([ID], [PRO_ID], [INST_ID], [USU_ID_VOTADOR], [FECHA_VOTACION], [VALOR], [ELIMINADO]) VALUES (7, 6, 4, 9, CAST(N'2016-04-14 19:24:39.0000000' AS DateTime2), 1, 0)
GO
SET IDENTITY_INSERT [dbo].[vot_votaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[vtr_vot_tricel] ON 

GO
INSERT [dbo].[vtr_vot_tricel] ([ID], [LTR_ID], [TRI_ID], [INST_ID], [USU_ID_VOTADOR], [FECHA_VOTACION], [ELIMINADO]) VALUES (1, 1, 1, 4, 7, CAST(N'2016-02-17 17:31:51.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[vtr_vot_tricel] ([ID], [LTR_ID], [TRI_ID], [INST_ID], [USU_ID_VOTADOR], [FECHA_VOTACION], [ELIMINADO]) VALUES (2, 2, 1, 4, 6, CAST(N'2016-02-17 17:32:40.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[vtr_vot_tricel] ([ID], [LTR_ID], [TRI_ID], [INST_ID], [USU_ID_VOTADOR], [FECHA_VOTACION], [ELIMINADO]) VALUES (3, 3, 2, 3, 1, CAST(N'2016-03-08 07:39:47.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[vtr_vot_tricel] ([ID], [LTR_ID], [TRI_ID], [INST_ID], [USU_ID_VOTADOR], [FECHA_VOTACION], [ELIMINADO]) VALUES (4, 4, 3, 4, 6, CAST(N'2016-03-11 09:11:06.0000000' AS DateTime2), 0)
GO
SET IDENTITY_INSERT [dbo].[vtr_vot_tricel] OFF
GO
ALTER TABLE [dbo].[atr_archivos_tricel] ADD  DEFAULT ((0)) FOR [TRI_ID]
GO
ALTER TABLE [dbo].[atr_archivos_tricel] ADD  DEFAULT ((0)) FOR [ELIMINADO]
GO
