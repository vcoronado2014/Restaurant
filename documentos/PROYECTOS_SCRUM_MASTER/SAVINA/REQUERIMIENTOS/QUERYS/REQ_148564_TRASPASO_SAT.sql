/************************************************************************                              
NOMBRE DEL PROCEDIMIENTO	:	NO TIENE
AUTOR						:	VICTOR CORONADO
FECHA DE CREACI�N			:	05-01-2018
BASE DE DATOS				:   SAVINA_DB                 

OBJETIVO					:	ESTE PROCESO ATUALIZA LAS SOLICITUDES DE TELEMEDICINA ASIGNANDOSELAS
							:	A OTRO MEDICO

FECHA DE MODIFICACI�N		:
USUARIO DE MODIFICACI�N		:
MOTIVO DE MODIFICACI�N		: 

VISADO POR (QA)  			:   
FECHA APROBACI�N QA 		:   
COMENTARIOS QA     			:                             

VISADO POR (DBA)  			:   
FECHA APROBACI�N DBA 		:   
COMENTARIOS DBA     		:                
                              
TABLAS INVOLUCRADAS 		:   REQUESTS

***********************************************************************/
USE Savina_db
GO
UPDATE 
	requests SET creatorUserId = 80
WHERE 
	creatorUserId = 69 and createdAt between  '2017-09-19' and '2017-10-03'
GO
