USE [RAYEN]
GO
/****** Object:  StoredProcedure [dbo].[REP0060]    Script Date: 24-08-2016 14:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/*-----------------------------------------------------------*
** NOMBRE SISTEMA: RAYEN 
**
** NOMBRE DEL OBJETO:  [dbo].[REP0060]
**
** VER: 1.0.0.1
**
** DESCRIPCION: REPORTE DE REGISTROS DE VISITAS DOMICILIARIAS.
**
** AUTOR: CHRISTOPHER CASTRO--
**
**-------------------------------------------------------------
** MODIFICACIONES:.
**-------------------------------------------------------------
** FECHA DE Modificacion: 06 - enero - 2011
**--2014/02/26 Ricardo Campusano: Se modifica para que considere todas las atenciones candidatas independiente si tienen o no RL_FNP_ATEN.
								  Existen atenciones que no tienen RL_FNP_ATEN.

**-------------------------------------------------------------*

** FECHA MODIFICACION: 26 de Agosto 2016
   VICTOR CORONADO: SEGÚN REQUERIMIENTO 122548, NO SE CUENTAN 
   - Visitas Domiciliarias realizadas por equipo IRA-ERA a Familias -Otras Visitas- (Individual)
   - Visita Domiciliaria Integral Familia Con adulto con problema respiratorio crónico o no controlado (Individual) - Visita de Seguimiento 

   POR LO TANTO SE AGREGAN AMBOS IDS (8141 Y 9832) AL ARREGLO DE IDS QUE DEBE CONSULTAR PARA SOLUCIONAR EL PROBLEMA.


**-----------------------------------------------------------*/

--exec REP0060 @NOD_ID=2069,@FECHA_INICIO='2014-02-01 00:00:00',@FECHA_TERMINO='2014-02-28 23:59:59',@FNP_ID=NULL,@TDA_ID=NULL,@INS_ID=NULL
--exec REP0031 @FECHA_INICIO='2014-02-01 00:00:00',@FECHA_TERMINO='2014-02-28 23:59:59',@FNP_ID=NULL,@TDA_ID=NULL,@ACT_ID=NULL,@NOD_ID=2069,@INS_ID=NULL

ALTER PROCEDURE [dbo].[REP0060]
(
	@FECHA_INICIO DATETIME, 
	@FECHA_TERMINO DATETIME, 
	@FNP_ID INT, 
	@TDA_ID INT, 	
	@NOD_ID INT,
	@INS_ID INT 
)
AS
BEGIN

set nocount on

------------------------------- REGISTROS VISITAS DOMICILIARIAS --------------------------------------------
CREATE TABLE #TABLA (ID INT IDENTITY, FUNCIONARIO VARCHAR(500), INSTRUMENTO VARCHAR(500), TIPO_DE_ATENCION VARCHAR(350), CARDINALIDAD_TDA VARCHAR(50), FECHA_CITA VARCHAR(50), FECHA_ATENCION VARCHAR(50), ACTIVIDAD VARCHAR(500), CANTIDAD VARCHAR(10), /*DIAGNOSTICO VARCHAR(500), */RECURSO_ATENCION VARCHAR(500), INSTRUMENTO_RECURSO VARCHAR(500), ATEN_ID INT, ACTS INT, DIAGS INT, TDA_ID INT, FNP_ID INT, SECTOR varchar(100)) create index idx_id on #tabla (id)	

------------------------------- REGISTROS VISITAS DOMICILIARIAS --------------------------------------------
create table #ATENCION (ID INT IDENTITY, ATEN_ID INT, FUNCIONARIO VARCHAR(500), INSTRUMENTO VARCHAR(500), TIPO_DE_ATENCION VARCHAR(350), CIT_ID INT, FECHA_CITA VARCHAR(50), FECHA_ATENCION VARCHAR(50), ACTS INT, DIAGS INT, TDA_ID INT, FNP_ID INT, INS_ID INT, SECTOR varchar(100)) create index idx_ATEN_id on #ATENCION (id)

DECLARE @SALIDA TABLE (NUMERO VARCHAR(10), FUNCIONARIO VARCHAR(500), INSTRUMENTO VARCHAR(500), TIPO_DE_ATENCION VARCHAR(350), CARDINALIDAD_TDA VARCHAR(50), FECHA_CITA VARCHAR(50), FECHA_ATENCION VARCHAR(50), ACTIVIDAD VARCHAR(500), CANTIDAD VARCHAR(10), DIAGNOSTICO VARCHAR(500), RECURSO_ATENCION VARCHAR(500), INSTRUMENTO_RECURSO VARCHAR(500))

declare  @DESDE_ENTERO int = dbo.OBTENERFECHAENTERA(@FECHA_INICIO)
declare  @HASTA_ENTERO int = dbo.OBTENERFECHAENTERA(@FECHA_TERMINO)

declare 
	@max_aten_id int, 
	@count_aten_id int, 
	@aten_id int, 
	@max_act_id int, 
	@count_act_id int, 
	@max_diag_id int, 
	@count_diag_id int, 
	@max_prestacion int, 
	@registro int,
	@actividad varchar(500), 
	@diagnostico varchar(500), 
	@sql varchar(5000),
	@CANTIDAD_ACT varchar(max) 
	--@CANTIDAD_ACT int 

declare @RECURSO_ATENCION    VARCHAR(5000) = ''
declare @INSTRUMENTO_RECURSO VARCHAR(5000) = ''


insert into #ATENCION 
select distinct
	aten.id,
	ATEN.X_FNP_NOMBRE AS FUNCIONARIO, 
	ATEN.X_INS_NOMBRE AS INSTRUMENTO, 
	ATEN.X_TDA_NOMBRE AS TIPO_DE_ATENCION, 	
	ATEN.CIT_ID,
	CONVERT(VARCHAR, ATEN.X_CIT_FECHA_HORA_INICIO,105) + ' ' + CONVERT(VARCHAR,ATEN.X_CIT_FECHA_HORA_INICIO,108) AS FECHA_CITA,
	CONVERT(VARCHAR, ATEN.FECHA_HORA_INICIO,105) + ' ' + CONVERT(VARCHAR,ATEN.FECHA_HORA_INICIO,108) AS FECHA_ATENCION,
	(select count(*) from acat_actividad_atencion acat with (nolock) where acat.aten_id = aten.id and acat.eliminado = 0) acts, 
	(select count(*) from date_diagnosticos_atencion daten with (nolock) where daten.aten_id = aten.id and daten.eliminado = 0) diags, 
	ATEN.X_TDA_ID, 
	ATEN.FNP_ID AS FNP_ID,
	ATEN.INS_ID AS INS_ID,
	coalesce((select NOMBRE from SEC_SECTOR where ID = aten.SEC_ID),'No Informado')	
from 
	ATEN_ATENCION ATEN with (nolock)
WHERE 
	    ATEN.ELIMINADO = 0 
	AND ATEN.NOD_ID= @NOD_ID 
	AND ATEN.ESTADO IN (2)
	AND ATEN.FECHA_ENTERA between @DESDE_ENTERO and @HASTA_ENTERO 	
    AND isnull(@FNP_ID,ATEN.FNP_ID) = ATEN.FNP_ID
    AND isnull(@TDA_ID,ATEN.X_TDA_ID) = ATEN.X_TDA_ID
    AND isnull(@INS_ID,ATEN.INS_ID) = ATEN.INS_ID    
ORDER BY 
	FECHA_ATENCION ASC 
	
insert into #tabla 
select distinct
	ATEN1.FUNCIONARIO AS FUNCIONARIO, 
	ATEN1.INSTRUMENTO AS INSTRUMENTO, 
	ATEN1.TIPO_DE_ATENCION AS TIPO_DE_ATENCION, 	
	CASE WHEN (TDA.CARDINALIDAD = 0) THEN 'Individual' WHEN (TDA.CARDINALIDAD = 1) THEN 'Grupal' END AS CARDINALIDAD_TDA,
	ATEN1.FECHA_CITA AS FECHA_CITA,
	ATEN1.FECHA_ATENCION AS FECHA_ATENCION,
	' ' AS ACTIVIDAD,
	(select count(*) from ACAT_ACTIVIDAD_ATENCION acat with (nolock) where acat.eliminado = 0 and acat.aten_id = aten.id AND acat.ACT_ID = ACT.ID) CANTIDAD,
	--DIAG.DESCRIPCION AS DIAGNOSTICO,
	--FNP.NOMBRES + ' ' + FNP.APELLIDO_PATERNO + ' ' + FNP.APELLIDO_MATERNO AS RECURSO_ATENCION,
	--INS.NOMBRE AS INSTRUMENTO_RECURSO,
	' ' AS RECURSO_ATENCION,
	' ' AS INSTRUMENTO_RECURSO,
	ATEN.ID,
	ATEN1.acts, 
	ATEN1.diags, 
	ATEN1.TDA_ID, 
	ATEN1.FNP_ID,
	ATEN1.SECTOR	
from 
	#ATENCION ATEN1 with (nolock)
	INNER JOIN ATEN_ATENCION ATEN WITH (NOLOCK) ON ATEN.ID = ATEN1.ATEN_ID
	INNER JOIN ACAT_ACTIVIDAD_ATENCION ACAT WITH (NOLOCK) ON ACAT.ATEN_ID = ATEN.ID
	INNER JOIN ACT_ACTIVIDAD ACT WITH (NOLOCK) ON ACT.ID = ACAT.ACT_ID 
	INNER JOIN 
	(SELECT ID FROM DBO.OBTENER_ID('7508;7509;7510;7511;7513;7514;7515;7516;7517;7518;7519;7520;7521;7522;7523;7524;7525;7526;7527;7528;'+
								   '7529;7530;7531;7532;7533;7534;7535;7536;7537;7538;7539;7540;7541;7542;7543;7544;7545;7546;7547;7548;'+
								   '7549;7550;7551;7552;7553;7554;7555;7556;7557;7558;7559;7560;7561;7562;7563;7564;7565;7566;7567;7568;'+
								   '7711;7712;7713;7714;7715;7716;7719;7720;7721;7722;7774;7775;7776;7777;7803;7804;7819;7820;7821;7822;'+
								   '7823;7824;7825;7826;7827;7828;8141;9832'))  IDS ON IDS.ID = ACT.ID
	LEFT JOIN DATE_DIAGNOSTICOS_ATENCION DATEN WITH (NOLOCK) ON  DATEN.ATEN_ID = ATEN.ID AND DATEN.ELIMINADO = 0
	LEFT JOIN DIAG_DIAGNOSTICO DIAG WITH (NOLOCK) ON DIAG.ID = DATEN.DIAG_ID	
	--INNER JOIN FNP_FUNCIONARIO_PRESTADOR FNP WITH (NOLOCK) ON FNP.ID = ATEN1.FNP_ID 
	--INNER JOIN INS_INSTRUMENTO INS WITH (NOLOCK) ON INS.ID = ATEN1.INS_ID
	LEFT OUTER JOIN CIT_CITA CIT WITH (NOLOCK) ON ATEN.CIT_ID = CIT.ID
	INNER JOIN TDA_TIPO_DE_ATENCION TDA WITH (NOLOCK) ON CIT.TDA_ID = TDA.ID		

set @max_aten_id = scope_identity() 
/**********************************************************************************************/

create table #acti (id int identity, nombre varchar(500), aten_id int, cantidad int) create index idx_aten_id on #acti (id, aten_id)
create table #diagno (id int identity, nombre varchar(500), aten_id int) create index idx_aten_id on #diagno (id, aten_id)

set @count_act_id = 1 
set @max_act_id = 0 

set @count_diag_id = 1 
set @max_diag_id = 0 

set @max_prestacion = 0 
set @count_aten_id = 1 

while (@count_aten_id <= @max_aten_id)
begin
	select @aten_id = aten_id, @max_act_id = @max_act_id + acts, @max_diag_id = @max_diag_id + diags, @max_prestacion = case when acts >= diags then acts else diags end from #tabla where id = @count_aten_id 
	insert into #acti (nombre, aten_id, cantidad) select act.nombre, @aten_id, cantidad from acat_actividad_atencion acat inner join act_actividad act on act.id = acat.act_id where acat.eliminado = 0 and acat.aten_id = @aten_id order by act.nombre
	insert into #diagno (nombre, aten_id) select diag.descripcion, @aten_id from date_diagnosticos_atencion daten inner join diag_diagnostico diag on diag.id = daten.diag_id where daten.eliminado = 0 and daten.aten_id = @aten_id order by diag.descripcion 
	set @registro = 1 
 	while (@registro <= @max_prestacion) 
 	begin 
 		if @count_act_id <= @max_act_id 
		begin 
			select @actividad = nombre, @CANTIDAD_ACT = CANTIDAD from #acti where aten_id = @aten_id and id = @count_act_id 
		 	set @count_act_id = @count_act_id + 1 
		end 
		else 
			select @actividad = '' 
 		if @count_diag_id <= @max_diag_id 
		begin 
			select @diagnostico = nombre from #diagno where aten_id = @aten_id and id = @count_diag_id 
			set @count_diag_id = @count_diag_id + 1 
		end 
		else 
			select @diagnostico = '' 

		if @registro = 1 
		begin	
		    SET @RECURSO_ATENCION = ''
		    SET @INSTRUMENTO_RECURSO = ''
		    
			if exists (select distinct 1 from RL_FNP_ATEN where aten_id = @aten_id)
				begin	
					select 
						@RECURSO_ATENCION    += FNP.NOMBRES + ' ' + FNP.APELLIDO_PATERNO + ' ' + FNP.APELLIDO_MATERNO+', ',
						@INSTRUMENTO_RECURSO += INS.NOMBRE+', '
					from RL_FNP_ATEN RL WITH (NOLOCK)
					inner join FNP_FUNCIONARIO_PRESTADOR FNP WITH (NOLOCK) ON FNP.ID = RL.FNP_ID 
					inner join INS_INSTRUMENTO INS WITH (NOLOCK) ON INS.ID = RL.INS_ID
					where RL.ATEN_ID  = @aten_id				
				end
			else
				begin
					select 
						@RECURSO_ATENCION    += FNP.NOMBRES + ' ' + FNP.APELLIDO_PATERNO + ' ' + FNP.APELLIDO_MATERNO+', ',
						@INSTRUMENTO_RECURSO += INS.NOMBRE+', '
					from ATEN_ATENCION ATEN WITH (NOLOCK)
					inner join FNP_FUNCIONARIO_PRESTADOR FNP WITH (NOLOCK) ON FNP.ID = ATEN.FNP_ID 
					inner join INS_INSTRUMENTO INS WITH (NOLOCK) ON INS.ID = ATEN.INS_ID
					where ATEN.ID  = @aten_id					  
				end																													
				insert into @SALIDA (NUMERO,FUNCIONARIO, INSTRUMENTO, TIPO_DE_ATENCION, CARDINALIDAD_TDA, FECHA_CITA, FECHA_ATENCION, ACTIVIDAD, CANTIDAD, DIAGNOSTICO, RECURSO_ATENCION, INSTRUMENTO_RECURSO)
				select id, FUNCIONARIO, INSTRUMENTO, TIPO_DE_ATENCION, CARDINALIDAD_TDA, FECHA_CITA, FECHA_ATENCION, @actividad, @CANTIDAD_ACT, @diagnostico, SUBSTRING(@RECURSO_ATENCION,1,len(@RECURSO_ATENCION)-1),SUBSTRING(@INSTRUMENTO_RECURSO,1,len(@INSTRUMENTO_RECURSO)-1)
				from #tabla where id = @count_aten_id 
		end
		else 
			begin
				insert into @SALIDA (NUMERO,FUNCIONARIO, INSTRUMENTO, TIPO_DE_ATENCION, CARDINALIDAD_TDA, FECHA_CITA, FECHA_ATENCION, ACTIVIDAD, CANTIDAD, DIAGNOSTICO, RECURSO_ATENCION, INSTRUMENTO_RECURSO)
				select @count_aten_id, '', '', '', '', '', '', @actividad, @CANTIDAD_ACT, @diagnostico, '','' --,@actividad, @CANTIDAD_ACT, @diagnostico,''
			end
		set @CANTIDAD_ACT = ''
		set @registro = @registro + 1 
	end 
	set @count_aten_id = @count_aten_id + 1
end

drop table #acti, #diagno, #TABLA, #ATENCION

select NUMERO as N, FUNCIONARIO, INSTRUMENTO, TIPO_DE_ATENCION, CARDINALIDAD_TDA, FECHA_CITA, FECHA_ATENCION, ACTIVIDAD, CANTIDAD, DIAGNOSTICO, RECURSO_ATENCION, INSTRUMENTO_RECURSO from @salida order by Convert(int,numero)
	
END




