USE [SALUD_TE_INTEGRA_CHILE]
go

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NOD0001]')  AND type = N'P')
exec('CREATE PROCEDURE [dbo].[NOD0001] AS BEGIN SET NOCOUNT ON; END')
GO
/****** Object:  StoredProcedure [dbo].[NOD0001]    Script Date: 08-08-2018 10:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************
NOMBRE DEL PROCEDIMIENTO: NOD0001
AUTOR: Víctor Coronado
FECHA DE CREACIÓN: 04/06/2019
BASE DE DATOS: SALUD TE INTEGRA CHILE
OBJETIVO: OBTIENE TODOS LOS SERVICIOS DE SALUD
FECHA DE MODIFICACIÓN: 
USUARIO DE MODIFICACIÓN:  
MOTIVO DE MODIFICACIÓN: 
VISADO POR (QA): 
FECHA APROBACIÓN QA: 
COMENTARIOS QA: 
VISADO POR (DBA): 
FECHA APROBACIÓN DBA: 
COMENTARIOS DBA: 
TABLAS INVOLUCRADAS: NOD_NODO
***********************************************************************/
ALTER procedure [dbo].[NOD0001]

AS 
BEGIN
select 
	*
from 
	NOD_NODO
where
	ACTIVO = 1 AND
	ELIMINADO = 0 AND
	TIPO = 3

END
go
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NOD0002]')  AND type = N'P')
exec('CREATE PROCEDURE [dbo].[NOD0002] AS BEGIN SET NOCOUNT ON; END')
GO
/****** Object:  StoredProcedure [dbo].[NOD0002]    Script Date: 08-08-2018 10:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************
NOMBRE DEL PROCEDIMIENTO: NOD0002
AUTOR: Víctor Coronado
FECHA DE CREACIÓN: 04/06/2019
BASE DE DATOS: SALUD TE INTEGRA CHILE
OBJETIVO: OBTIENE LAS COMUNAS DE UN SERVICIO
FECHA DE MODIFICACIÓN: 
USUARIO DE MODIFICACIÓN:  
MOTIVO DE MODIFICACIÓN: 
VISADO POR (QA): 
FECHA APROBACIÓN QA: 
COMENTARIOS QA: 
VISADO POR (DBA): 
FECHA APROBACIÓN DBA: 
COMENTARIOS DBA: 
TABLAS INVOLUCRADAS: COM_COMUNA, NOD_NODO
***********************************************************************/
ALTER procedure [dbo].[NOD0002]
(
@NOD_ID INT
)
AS 
BEGIN
select 
	distinct com.*
from 
	COM_COMUNA com inner join NOD_NODO nod on com.ID = nod.COM_ID
where
	nod.ACTIVO = 1 and com.ELIMINADO = 0 and
	nod.ELIMINADO = 0 and
	nod.ECOL_ID > 0 and
	nod.NOD_ID = @NOD_ID

END
go
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NOD0003]')  AND type = N'P')
exec('CREATE PROCEDURE [dbo].[NOD0003] AS BEGIN SET NOCOUNT ON; END')
GO
/****** Object:  StoredProcedure [dbo].[NOD0003]    Script Date: 08-08-2018 10:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************
NOMBRE DEL PROCEDIMIENTO: NOD0003
AUTOR: Víctor Coronado
FECHA DE CREACIÓN: 04/06/2019
BASE DE DATOS: SALUD TE INTEGRA CHILE
OBJETIVO: OBTIENE TODOS LOS NODOS DE UNA COMUNA
FECHA DE MODIFICACIÓN: 
USUARIO DE MODIFICACIÓN:  
MOTIVO DE MODIFICACIÓN: 
VISADO POR (QA): 
FECHA APROBACIÓN QA: 
COMENTARIOS QA: 
VISADO POR (DBA): 
FECHA APROBACIÓN DBA: 
COMENTARIOS DBA: 
TABLAS INVOLUCRADAS: NOD_NODO
***********************************************************************/
ALTER procedure [dbo].[NOD0003]
(
@NOD_ID INT,
@COM_ID INT
)
AS 
BEGIN
	if (@COM_ID > 0)
	begin
		select 
			NOD.*, com.NOMBRE as NOMBRE_COMUNA
		from 
			NOD_NODO NOD inner join COM_COMUNA com on NOD.COM_ID = com.ID
		where
			nod.ACTIVO = 1 and NOD.ELIMINADO = 0 and
			nod.ELIMINADO = 0 and
			nod.ECOL_ID > 0 and
			nod.NOD_ID = @NOD_ID AND
			NOD.COM_ID = @COM_ID
	end
	else
	begin
		select 
			NOD.*, com.NOMBRE as NOMBRE_COMUNA
		from 
			NOD_NODO NOD inner join COM_COMUNA com on NOD.COM_ID = com.ID
		where
			nod.ACTIVO = 1 and NOD.ELIMINADO = 0 and
			nod.ELIMINADO = 0 and
			nod.ECOL_ID > 0 and
			nod.NOD_ID = @NOD_ID
	end
END
go