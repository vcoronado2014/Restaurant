/************************************************************************                              
NOMBRE DEL PROCEDIMIENTO	:	NO TIENE
AUTOR						:	VICTOR CORONADO
FECHA DE CREACIÓN			:	05-01-2018
BASE DE DATOS				:   SAVINA_DB                 

OBJETIVO					:	ESTE PROCESO ATUALIZA LAS SOLICITUDES DE TELEMEDICINA ASIGNANDOSELAS
							:	A OTRO MEDICO

FECHA DE MODIFICACIÓN		:
USUARIO DE MODIFICACIÓN		:
MOTIVO DE MODIFICACIÓN		: 

VISADO POR (QA)  			:   
FECHA APROBACIÓN QA 		:   
COMENTARIOS QA     			:                             

VISADO POR (DBA)  			:   
FECHA APROBACIÓN DBA 		:   
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
