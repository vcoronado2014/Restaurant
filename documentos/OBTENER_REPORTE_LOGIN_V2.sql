USE [BDWebLun]
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OBTENER_REPORTE_LOGIN]') AND type = N'P')
exec('CREATE PROCEDURE [dbo].[OBTENER_REPORTE_LOGIN] AS BEGIN SET NOCOUNT ON; END')
GO

/************************************************************************                              
NOMBRE DEL PROCEDIMIENTO	: [OBTENER_REPORTE_LOGIN]                        
AUTOR						: 
FECHA DE CREACI�N			:     
BASE DE DATOS				:                             

OBJETIVO					: OBTENER FUNCIONARIOS POR COMUNA.

FECHA DE MODIFICACI�N		: 13-12-2016
USUARIO DE MODIFICACI�N		: VIRGINIA PINO
MOTIVO DE MODIFICACI�N		: SE OPTIMIZA SP DEBIDO A QUE EJECUCI�N ACTUAL CONSUME
							  DEMASIADO TIEMPO.

FECHA DE MODIFICACI�N		: 14-06-2017
USUARIO DE MODIFICACI�N		: VICTOR CORONADO
MOTIVO DE MODIFICACI�N		: SE MODIFICA SP PARA QUE EL APELLIDO MATERNO AL VENIR NULO QUEDE VACIO

VISADO POR (QA)  			:   
FECHA APROBACI�N QA 		:   
COMENTARIOS QA     			:                             

VISADO POR (DBA)  			:   
FECHA APROBACI�N DBA 		:   
COMENTARIOS DBA     		:                
                              
TABLAS INVOLUCRADAS 		:	BDWebLun..RELUN_REGISTRO_LUN,
								BDWEBLUN..RL_NOD_ECOL,
								RAYEN..FNP_FUNCIONARIO_PRESTADOR,
							    RAYEN..ULL_ULTIMO_LOGIN,
								RAYEN..NOD_NODO,
								RAYEN..COM_COMUNA

***********************************************************************/

alter PROCEDURE [dbo].[OBTENER_REPORTE_LOGIN]
(
      @ECOL INT
)
AS
BEGIN

--DECLARE @ECOL VARCHAR(2)='36' --DATO PARA PRUEBA
create table #TMP_INFO 
(
 RUN_FUNCIONARIO VARCHAR(20),
 NOMBRE_FUNCIONARIO VARCHAR(500),
 PRIMER_APELLIDO VARCHAR(500),
 SEGUNDO_APELLIDO VARCHAR(500),
 ELIMINADO VARCHAR(20),
 FECHA_CREACION_LUN DATETIME,
 COMUNA VARCHAR(500),
 FECHA_ULTIMO_LOGIN DATETIME
)

create table #TMP_FUNPRESTADOR 
(
  NOD_ID INT,
  ECOL_ID INT,
  NOMBRES VARCHAR(50),
  APELLIDO_PATERNO VARCHAR(30),
  APELLIDO_MATERNO VARCHAR(30),
  RUT VARCHAR(15),
  FECHA_ULTIMO_LOGIN DATETIME
)

INSERT INTO #TMP_FUNPRESTADOR 
SELECT 
		F.NOD_ID, 
		RL.ECOL_ID , 
		F.NOMBRES, 
		F.APELLIDO_PATERNO, 
		F.APELLIDO_MATERNO, 
		F.RUT,
		MAX(ULT.FECHA_ULTIMO_LOGIN)
FROM RAYEN..FNP_FUNCIONARIO_PRESTADOR F 
INNER JOIN BDWEBLUN..RL_NOD_ECOL RL ON RL.NOD_ID = F.NOD_ID 
LEFT JOIN RAYEN..ULL_ULTIMO_LOGIN ULT ON ULT.FNP_ID = F.ID
WHERE 		RL.ECOL_ID = @ECOL
GROUP BY	F.NOD_ID,
			RL.ECOL_ID,
			F.NOMBRES,
			F.APELLIDO_PATERNO,
			F.APELLIDO_MATERNO,
			F.RUT
			

INSERT INTO #TMP_INFO (
 RUN_FUNCIONARIO,
 NOMBRE_FUNCIONARIO,
 PRIMER_APELLIDO,
 SEGUNDO_APELLIDO,
 ELIMINADO,
 FECHA_CREACION_LUN,
 COMUNA,
 FECHA_ULTIMO_LOGIN
)
SELECT 	
       L.RUN_FUNCIONARIO,
	   L.NOMBRE_FUNCIONARIO, 
	   L.PRIMER_APELLIDO, 
	   L.SEGUNDO_APELLIDO, 
	   CASE WHEN L.ELIMINADO =0 THEN 'NO'
	   WHEN L.ELIMINADO=1 THEN 'SI' END,
	   L.FECHA_ALTA,
	   ISNULL(COM.NOMBRE,'No Informado'),
	   max(TMP1.FECHA_ULTIMO_LOGIN)
FROM BDWebLun..RELUN_REGISTRO_LUN L     
     LEFT  JOIN	#TMP_FUNPRESTADOR TMP1 ON LTRIM(RTRIM(REPLACE(L.RUN_FUNCIONARIO,'-','')))= LTRIM(RTRIM(TMP1.RUT)) COLLATE Modern_Spanish_CI_AI AND  L.ECOL_ID = TMP1.ECOL_ID
     INNER JOIN BDWebLun..RL_NOD_ECOL rl on rl.ECOL_ID = TMP1.ECOL_ID and rl.NOD_ID = TMP1.NOD_ID
     INNER JOIN RAYEN..NOD_NODO N ON N.ID = rl.NOD_ID
     LEFT  JOIN	RAYEN..COM_COMUNA COM ON COM.ID=N.COM_ID
WHERE L.ECOL_ID = @ECOL
GROUP BY 		
		L.RUN_FUNCIONARIO,      
       ISNULL(COM.NOMBRE,'No Informado'),       
	   L.NOMBRE_FUNCIONARIO, 
	   L.PRIMER_APELLIDO, 
	   L.SEGUNDO_APELLIDO, 
	   L.ELIMINADO,
	   L.FECHA_ALTA
ORDER BY 1 asc 


SELECT 
         ROW_NUMBER() OVER( PARTITION BY RUN_FUNCIONARIO ORDER BY RUN_FUNCIONARIO,FECHA_ULTIMO_LOGIN DESC) AS NUMERO,
         RUN_FUNCIONARIO,
         NOMBRE_FUNCIONARIO,
		 coalesce(PRIMER_APELLIDO, ''),
		 coalesce (SEGUNDO_APELLIDO, ''),
		 ELIMINADO,
		 FECHA_CREACION_LUN,
		 COMUNA,
		 FECHA_ULTIMO_LOGIN
		        
        
FROM #TMP_INFO

DROP TABLE #TMP_FUNPRESTADOR, #TMP_INFO



END
GO
