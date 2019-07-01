USE RAYEN 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REP0035]') AND type = N'P') 
	exec('CREATE PROCEDURE [dbo].[REP0035] AS BEGIN SET NOCOUNT ON; END')
GO
/************************************************************************                              
NOMBRE DEL PROCEDIMIENTO	: REP0035                               
AUTOR						: Iván Dinamarca 
FECHA DE CREACIÓN			: 10-06-2015    
BASE DE DATOS				: RAYEN                             

OBJETIVO					: INFORME INSCRITOS POR SECTOR Y PREVISION (CONSOLIDADO)

FECHA DE MODIFICACIÓN		:11/05/2016
USUARIO DE MODIFICACIÓN		: JAIME LEÓN
MOTIVO DE MODIFICACIÓN		: SE OBTIENE NFORMACION DESDE LA TABLA USN_USUARIO_NODO NO DE LA TABLA FAM_FAMILIA.- 

FECHA DE MODIFICACIÓN		:05/07/2016
USUARIO DE MODIFICACIÓN		: VICTOR CORONADO
MOTIVO DE MODIFICACIÓN		: SE MEJORA EL SCRIPT POR RECHAZO DE QA.- 

VISADO POR (QA)  			:   
FECHA APROBACIÓN QA 		:   
COMENTARIOS QA     			:                             

VISADO POR (DBA)  			:   
FECHA APROBACIÓN DBA 		:   
COMENTARIOS DBA     		:                
                              
TABLAS INVOLUCRADAS 		:CIT_CITA
***********************************************************************/
ALTER PROCEDURE [dbo].[REP0035]
(
@nod_id INT
)
AS
BEGIN

create table #sectores
(
	ID int,
	SECTOR varchar(50),
	ES_NO_INFORMADO smallint
)

declare @rep table (SECTOR varchar(100), FONASA int, ISAPRES int, PARTICULAR INT, FFAA INT, SIN_PREVISION int)

insert into #sectores
SELECT ID, NOMBRE, case when NOMBRE like '%No%Informado%' then 1 else 0 end  FROM RAYEN..SEC_SECTOR WHERE NOD_ID = @NOD_ID and ELIMINADO = 0


if not exists (select 1 from #sectores where ES_NO_INFORMADO = 1)
	insert into #sectores (SECTOR, ES_NO_INFORMADO) values ('No Informado', 1)

create table #USERS
(
	NOMBRE_SECTOR varchar(50),
	USP_ID int,
	SEC_ID int,
	ITP_ID int,
	PREVISION varchar(100)
)

insert into #USERS
SELECT 
dbo.FormatoStringCapital(sector.SECTOR) as NOMBRE_SECTOR,
usp.id, 
usn.SEC_ID,
case when usn.USP_ID is not null then isnull(usp.ITP_ID,27) else null end as itp_id,
case 
	when usn.USP_ID is not null and isnull(usp.ITP_ID,27) IN (1) then 'FONASA'
	when usn.SEC_ID is not null and isnull(usp.ITP_ID,27) IN (3,5,6,7,8,9,10,11,13,14,15,16,17,18,19,20,21,22,23,24,25,26) then 'ISAPRES'
	when usn.SEC_ID is not null and isnull(usp.ITP_ID,27) NOT IN (1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26, 27) then 'PARTICULAR'
	when usn.SEC_ID is not null and isnull(usp.ITP_ID,27) IN  (4,12) then 'FFAA'
	when usn.SEC_ID is not null and isnull(usp.ITP_ID,27) IN (27) then 'SIN_PREVISION' else null end
	
FROM 
#sectores sector
left join USN_USUARIO_NODO usn on (sector.ID = usn.SEC_ID or (sector.ES_NO_INFORMADO = 1 and (usn.SEC_ID is null or usn.SEC_ID = 0 or not exists (select 1 from #sectores s where s.ID = usn.SEC_ID)))) and usn.NOD_ID = @nod_id AND usn.ES_INSCRITO = 1 and usn.ACTIVO=1 AND usn.ELIMINADO = 0 
left join USP_USUARIO_APS USP   on usn.USP_ID = usp.ID and USP.ELIMINADO=0
--left JOIN FAM_FAMILIA FAM ON FAM.ID = usn.FAM_ID
--WHERE usn.NOD_ID = @nod_id AND usn.ES_INSCRITO = 1 and usn.ACTIVO=1 AND usn.ELIMINADO = 0



select SECTOR, FONASA, ISAPRES, PARTICULAR, FFAA, SIN_PREVISION
from 
(
	select NOMBRE_SECTOR as SECTOR, PREVISION, ITP_ID
	from #USERS
) tb
pivot
(
	count(ITP_ID)
	for PREVISION in (FONASA, ISAPRES, PARTICULAR, FFAA, SIN_PREVISION)
)pv

END
 
GO


