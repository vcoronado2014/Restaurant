/*PARAMETRIZAR NODO PARA AGENDAR A USUARIOS ASCRITOS O INSCRITOS SEGUN VALOR EN PRA_PARAMETROS_RAYEN*/

-- primero debemos verificar si existe el parametro par agenda web, crearlo o asegurar que está activo
if not exists(select * from pra_parametros_rayen where nod_id = 3091 and descripcion = 'DISPONIBILIZA_AGENDA_WEB')
begin
	insert into PRA_PARAMETROS_RAYEN (NOD_ID, DESCRIPCION, VALOR, ELIMINADO) values (3091, 'DISPONIBILIZA_AGENDA_WEB', 1, 0)
end
else
begin
	update pra_parametros_rayen set valor = 1 where nod_id = 3091 and descripcion = 'DISPONIBILIZA_AGENDA_WEB'
end

if not exists(select * from TAW_TIPO_ATENCION_WEB where NOD_ID = 3091 and nombre ='Morbilidad' and eliminado = 0)
	INSERT INTO TAW_TIPO_ATENCION_WEB (FNP_ID_REGISTRADOR, NOD_ID, NOMBRE, FAVORITO, ELIMINADO, FECHA_HORA_REGISTRO) 
	VALUES (0, 3091, 'Morbilidad', 0,0, GETDATE())

GO

--ahora seguimos con el proceso de parametrizacion de inscrito adscrito para ese nodo
DECLARE @NOD_ID INT = 3091 
DECLARE @NOMBRE_PARAMETRO VARCHAR(50) = 'PUEDE_CITAR_INSCRITO_ADSCRITO'
DECLARE @MPY_ID int = (SELECT top 1 ID FROM MPY_MAESTRO_PARAMETROS_RAYEN WHERE NOMBRE = @NOMBRE_PARAMETRO and ACTIVO = 1 and ELIMINADO = 0)
DECLARE @VALOR VARCHAR(2) = '2' --valor para permitir adscritos o inscritos

if not exists(select * from [PRA_PARAMETROS_RAYEN] 
			  where nod_id = @NOD_ID and DESCRIPCION = @NOMBRE_PARAMETRO and activo = 1 and eliminado = 0 and MPY_ID = @MPY_ID)
begin
INSERT INTO [dbo].[PRA_PARAMETROS_RAYEN]
           ([NOD_ID]	
           ,[DESCRIPCION]
           ,[VALOR]
           ,[ELIMINADO]
           ,[ACTIVO]
           ,[MPY_ID])
     VALUES
           (@NOD_ID
           ,@NOMBRE_PARAMETRO
           ,@VALOR
           ,0
           ,1          
           ,@MPY_ID)
end
GO