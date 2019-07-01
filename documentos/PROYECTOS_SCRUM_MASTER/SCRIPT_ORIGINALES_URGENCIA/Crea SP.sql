

CREATE PROCEDURE [dbo].[APP0001]
(
@latitude DECIMAL(15,8) ,--='-33.437774',
@longitude DECIMAL(15,8),--='-70.644160',
@distance INT,--='10000',
@cat INT,--='3',
@cont int =1

) AS
BEGIN 

/*******************************************************************/ 
while (@cont<3)
begin
DECLARE @g1 geography
declare @pointAsText1 varchar(50)
set @g1 = geography::STGeomFromText('POINT(' + convert(varchar(50), @latitude) + ' ' +
convert(varchar(50), @longitude) + ')', 4326)
SELECT 
GEOLOCALIZACION.STDistance(@g1) Distance
INTO #UNO
FROM NODOS_APPS N
WHERE
N.LAT IS NOT NULL
and GEOLOCALIZACION.STDistance(@g1) <= @distance
and N.ACTIVO = 1
ORDER BY
GEOLOCALIZACION.STDistance(@g1)
SELECT COUNT(*) T INTO #T FROM #UNO

SELECT @cont= t FROM #T

if (@cont>=3)
begin

set @distance=@distance
select * into #dos from #uno
end
else
begin
set @distance=@distance+@distance
end

DROP TABLE
#UNO,#T
end
drop table #dos

/************************************************************************************/

DECLARE @g geography
declare @pointAsText varchar(50)
--BEGIN 
set @g = geography::STGeomFromText('POINT(' + convert(varchar(50), @latitude) + ' ' +
convert(varchar(50), @longitude) + ')', 4326)

SELECT 
COD_DEIS,
COD_REG,
REGION,
SS_ID,
SS,
NIVEL_ATEN,
ID_NIVEL_ATEN,
ID_NODO,
RAZON_SOCIAL,
COM_ID,
COMUNA,
DIRECCION,
TELEFONO,
CL_SAPU,
OBSERVACION,
ACTIVO,
ES_RAYEN,
HH_LUN_VIE,
HH_SAB_DOM,
LAT,LON,
GEOLOCALIZACION.STDistance(@g) Distance

INTO #DATO

FROM NODOS_APPS N

WHERE
N.LAT IS NOT NULL and 
GEOLOCALIZACION.STDistance(@g) <= @distance
and N.ACTIVO = 1
ORDER BY
GEOLOCALIZACION.STDistance(@g)
/*****************************************************************************************/
SELECT ID,USP_ID,NOD_ID,FECHA_HORA_INGRESO
INTO #URG
FROM RAYEN..IURG_INGRESO_URGENCIA EU WITH(NOLOCK)
WHERE EU.NOD_ID IN (SELECT DISTINCT ID_NODO FROM #DATO) AND
EU.FECHA_HORA_INGRESO >= DATEADD(HH,-48,GETDATE()) AND
EU.FECHA_HORA_INGRESO <= GETDATE() 
AND EU.FECHA_HORA_INGRESO IS NOT NULL
UNION ALL            
SELECT ID,USP_ID,NOD_ID,FECHA_HORA_INGRESO
FROM RAYEN..INGS_INGRESO_SAPU SA WITH(NOLOCK)
WHERE SA.NOD_ID IN (SELECT DISTINCT ID_NODO FROM #DATO) AND
SA.FECHA_HORA_INGRESO >= DATEADD(HH,-48,GETDATE()) AND
SA.FECHA_HORA_INGRESO <= GETDATE() 
AND SA.FECHA_HORA_INGRESO IS NOT NULL            
--*******************************************************************************                  
SELECT DISTINCT
P.ID,
EU.NOD_ID AS CENTRO,
DATEDIFF(MINUTE,eu.FECHA_HORA_INGRESO,A.FECHA_HORA_INICIO) AS [ADM_A_ATEN_MEDICA],
CASE xc.Prioridad 
WHEN '0' THEN 'C1' 
WHEN '1' THEN 'C2' 
WHEN '2' THEN 'C3' 
WHEN '3' THEN 'C4' 
WHEN '4' THEN 'C5' 
ELSE '' 
END [TRIAGE]
INTO #INFO
FROM #URG EU WITH(NOLOCK)
inner join RAYEN..USP_USUARIO_APS P WITH(NOLOCK) on EU.USP_ID = P.ID AND P.ELIMINADO=0
left join RAYEN..ATEN_ATENCION A WITH(NOLOCK) on EU.id = A.IURG_ID and A.ELIMINADO = 0
INNER join (
                        select ht.IURG_ID,MAX(ht.FECHA_HORA)FECHA,ht.CATEGORIZACION AS Prioridad
                        from  RAYEN..CUR_CATEGORIZACION_URGENCIA ht WITH(NOLOCK)
                       GROUP BY ht.IURG_ID,ht.CATEGORIZACION
                  ) xc on EU.ID=xc.IURG_ID 
WHERE xc.Prioridad=@cat
--*************************************************************************************************

SELECT CENTRO,TRIAGE,COUNT(TRIAGE)N_TRIAGE,SUM([ADM_A_ATEN_MEDICA])AS TPO 
INTO #TPO
FROM #INFO 
GROUP BY TRIAGE,CENTRO ORDER BY TRIAGE ASC

SELECT 
CENTRO,
case when TRIAGE='' then 'SIN TRIAGE' ELSE TRIAGE END AS TRIAGE,
TPO/N_TRIAGE AS TPO_MINUTE 
INTO #FINAL
FROM #TPO 

ORDER BY CENTRO

SELECT 
--ISNULL(COD_DEIS,'0') COD_DEIS
--,ISNULL(COD_REG,'0') COD_REG
--,ISNULL(REGION,'0')REGION
--,ISNULL(SS_ID,'0')SS_ID
--,ISNULL(SS,'0')SS
--,ISNULL(NIVEL_ATEN,'0')NIVEL_ATEN
--,ISNULL(ID_NIVEL_ATEN,'0')ID_NIVEL_ATEN
--,ISNULL(ID_NODO,'0')ID_NODO
ISNULL(RAZON_SOCIAL,'0')NOMBRE
--,ISNULL(COM_ID,'0')COM_ID
--,ISNULL(COMUNA,'0')COMUNA
,ISNULL(DIRECCION,'0')DIRECCION
,ISNULL(TELEFONO,'0')TELEFONOS
--,ISNULL(CL_SAPU,'0')CL_SAPU
--,ISNULL(OBSERVACION,'0')OBSERVACION
--,ISNULL(ACTIVO,'0')ACTIVO
,ISNULL(ES_RAYEN,'0')ES_RAYEN
,ISNULL(HH_LUN_VIE,'0')HH_LUN_VIE
,ISNULL(HH_SAB_DOM,'0')HH_SAB_DOM
,ISNULL(LAT,'0')LATITUD
,ISNULL(LON,'0')LONGITUD
--,ISNULL(Distance,'0')Distance
--,ISNULL(CENTRO,'0')CENTRO
--,ISNULL(TRIAGE,'0')TRIAGE
,ISNULL(TPO_MINUTE,'0') TIEMPO_ESPERA

FROM #DATO D 
LEFT JOIN #FINAL F ON D.ID_NODO=F.CENTRO

DROP TABLE #URG,#INFO,#TPO,#FINAL,#DATO

END