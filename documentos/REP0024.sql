USE [RAYEN]
GO
/****** Object:  StoredProcedure [dbo].[REP0024]    Script Date: 22-08-2016 8:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*-----------------------------------------------------------*
** NOMBRE SISTEMA: RAYEN 
**
** NOMBRE DEL OBJETO: REP0024
**
** VER: 1.0.0.1
**
** DESCRIPCION: Sistema vigilancia Alimentaria
**
** AUTOR: Christopher Castro
**
** FECHA DE CREACION: agosto-2008
**
** MODIFICACIONES:
** Ver 1.0.0.2 , 26/08/2008, Christopher Castro : Se agrega  inner join aten_atencion a alfa.
** Ver 1.0.0.2 , 03/09/2008, Christopher Castro : Se agrega  condicion para edad, con lo cual en pacientes menores de 10 años muestra el formato años, meses y días, si es menor de un mes muestra los días y cuando la edad es mayor de 10 años muestra solo los años del usuario
** Ver 1.0.0.3 , 22/08/2016, Víctor Coronado    : Se reperan condiciones en filtro las cuales se encontraban en duro ingresadas al procedimiento almacenado.

**-----------------------------------------------------------*/
--dbcc dropcleanbuffers
--exec REP0024 2411,'20150101', '20160830'
--go
ALTER PROCEDURE [dbo].[REP0024] 
(
  @NODO INT,
  @INICIO DATETIME,
  @TERMINO DATETIME
)
/*02 - Vigilancia Alimentaria.sql*/
AS
BEGIN

declare @inicio_entera int, @termino_entera int
set @inicio_entera = CONVERT(varchar,@INICIO,112)
set @termino_entera = CONVERT(varchar,@TERMINO,112)
declare @rep table (Edad varchar(50), Sexo varchar(20), Embarazada varchar(50), Diagnostico varchar(50), Nombre varchar(100), Ficha varchar(20), Verduras decimal(10,2), Frutas decimal(10,2), Leche decimal(10,2), Quesillo decimal(10,2), Yoghurt decimal(10,2))

/*verduras*/
create table #verduras
(
porcion decimal,
aten_id int
)
insert into #verduras
select cast(vnum.valor as decimal(10,2)) as porcion, vnum.aten_id --into #verduras
from RAYEN_DATOS_CLINICOS..VNUM_VALOR_NUMERICO vnum WITH (INDEX(IDX_VNUM_MCAM_USP))
where vnum.mcam_id = 710 
and vnum.mfrm_id in (32, 33) 
and vnum.nod_id = @nodo
--and vnum.fecha between @inicio and @termino
and vnum.fecha_entera between @inicio_entera and @termino_entera
and vnum.eliminado = 0

/*frutas*/
create table #frutas
(
porcion decimal,
aten_id int
)
insert into #frutas
select cast(vnum.valor as decimal(10,2)) as porcion, vnum.aten_id --into #frutas
from RAYEN_DATOS_CLINICOS..VNUM_VALOR_NUMERICO vnum WITH (INDEX(IDX_VNUM_MCAM_USP))
where vnum.mcam_id = 711 
and vnum.mfrm_id in (32, 33) 
and vnum.nod_id = @nodo
--and vnum.fecha between @inicio and @termino
and vnum.fecha_entera between @inicio_entera and @termino_entera
and vnum.eliminado = 0

/*leche descremada*/
create table #leche
(
porcion decimal,
aten_id int
)
insert into #leche
select cast((vnum1.valor*vnum2.valor)/7 as decimal(10,2)) as porcion, vnum1.aten_id --into #leche
from RAYEN_DATOS_CLINICOS..VNUM_VALOR_NUMERICO vnum1 WITH (INDEX(IDX_VNUM_MCAM_USP))
inner join RAYEN_DATOS_CLINICOS..VNUM_VALOR_NUMERICO vnum2 WITH (INDEX(IDX_VNUM_ATEN_MCAM))
on vnum1.aten_id = vnum2.aten_id 
and vnum1.mcam_id = 1177 
and vnum2.mcam_id = 1178 
and vnum1.mfrm_id in (32, 33) 
and vnum2.mfrm_id in (32, 33) 
and vnum1.nod_id = @nodo
--and vnum1.fecha between @inicio and @termino
and vnum1.fecha_entera between @inicio_entera and @termino_entera
and vnum1.eliminado = 0
and vnum2.eliminado = 0

/*quesillo*/
create table #quesillo
(
porcion decimal,
aten_id int
)
insert into #quesillo
select cast((vnum1.valor*vnum2.valor)/7 as decimal(10,2)) as porcion, vnum1.aten_id --into #quesillo
from RAYEN_DATOS_CLINICOS..VNUM_VALOR_NUMERICO vnum1 WITH (INDEX(IDX_VNUM_MCAM_USP))
inner join RAYEN_DATOS_CLINICOS..VNUM_VALOR_NUMERICO vnum2 WITH (INDEX(IDX_VNUM_ATEN_MCAM))
on vnum1.aten_id = vnum2.aten_id 
and vnum1.mcam_id = 679 
and vnum2.mcam_id = 680 
and vnum1.mfrm_id in (32, 33) 
and vnum2.mfrm_id in (32, 33) 
and vnum1.nod_id = @nodo
--and vnum1.fecha between @inicio and @termino
and vnum1.fecha_entera between @inicio_entera and @termino_entera
and vnum1.eliminado = 0
and vnum2.eliminado = 0

/*yoghurt diet*/
create table #yoghurt
(
porcion decimal,
aten_id int
)
insert into #yoghurt
select cast((vnum1.valor*vnum2.valor)/7 as decimal(10,2)) as porcion, vnum1.aten_id --into #yoghurt
from RAYEN_DATOS_CLINICOS..VNUM_VALOR_NUMERICO vnum1 WITH (INDEX(IDX_VNUM_MCAM_USP))
inner join RAYEN_DATOS_CLINICOS.dbo.VNUM_VALOR_NUMERICO vnum2 WITH (INDEX(IDX_VNUM_ATEN_MCAM))
on vnum1.aten_id = vnum2.aten_id 
and vnum1.mcam_id = 1179 
and vnum2.mcam_id = 1180 
and vnum1.mfrm_id in (32, 33) 
and vnum2.mfrm_id in (32, 33) 
and vnum1.nod_id = @nodo
--and vnum1.fecha between @inicio and @termino
and vnum1.fecha_entera between @inicio_entera and @termino_entera
and vnum1.eliminado = 0
and vnum2.eliminado = 0

create NONCLUSTERED index temp on #verduras (aten_id asc)
create NONCLUSTERED index temp on #frutas (aten_id asc)
create NONCLUSTERED index temp on #leche (aten_id asc)
create NONCLUSTERED index temp on #quesillo (aten_id asc)
create NONCLUSTERED index temp on #yoghurt (aten_id asc)



declare alfa cursor for
select vlst.edad_usuario, vlst.sexo_id, vlis.descripcion, 
RTRIM(USP.NOMBRES) + ' ' + RTRIM(USP.APELLIDO_PATERNO) +  ' ' +  USP.APELLIDO_MATERNO AS NOMBRE,
usp.numero_de_ficha,
vlst.aten_id, aten.etapa
from RAYEN_META_DATOS..VLIS_VALOR_LISTA vlis
inner join RAYEN_DATOS_CLINICOS.dbo.VLST_VALOR_ENTERO_LISTA vlst on vlst.valor = vlis.id
inner join ATEN_ATENCION aten on vlst.aten_id=aten.id 
inner join usp_usuario_aps usp on usp.id = vlst.usp_id
and vlst.mcam_id in (649, 3530) 
and vlst.mfrm_id in (32, 33)
and vlis.eliminado = 0 
and vlst.eliminado = 0 
and vlst.nod_id = @nodo
--and vlst.fecha between @inicio and @termino 
and vlst.fecha_entera between @inicio_entera and @termino_entera--@inicio_entera and @termino_entera
and usp.eliminado = 0 
and usp.activo = 1 


declare @edad int, @sexo int, @embarazada varchar(50), @descripcion varchar(50), @nombre varchar(100), @numero_de_ficha varchar(50), @aten int
open ALFA

fetch next from alfa into @edad, @sexo, @descripcion, @nombre, @numero_de_ficha, @aten, @embarazada
while (@@FETCH_STATUS = 0 )
begin     

   insert into @rep (Edad, Sexo, Embarazada, Diagnostico, Nombre, Ficha, Verduras, Frutas, Leche, Quesillo, Yoghurt)
   select 

case 
WHEN @edad >= 10000000 then convert(varchar(3),@edad/1000000) + ' Año(s) '
when @edad < 3023 then convert(varchar(3),@edad%10000/100) + ' Dia(s) '
else
               convert(varchar(3),@edad/1000000) + ' Año(s) ' + convert(varchar(3),@edad%1000000/10000) + ' Mes(es) ' + convert(varchar(3),@edad%10000/100) + ' Dia(s) '
end,

  
   case @sexo when 2 then 'Femenino' when 3 then 'Masculino' end,
   case @embarazada
      when 2 then 'Si'  when 3 then 'Si' else 'No' end,
   @descripcion,
   @nombre, 
   @numero_de_ficha,
   coalesce((select top 1 porcion from #verduras where aten_id = @aten),0),
   coalesce((select top 1 porcion from #frutas where aten_id   = @aten),0),
   coalesce((select top 1 porcion from #leche where aten_id    = @aten),0),
   coalesce((select top 1 porcion from #quesillo where aten_id = @aten),0),
   coalesce((select top 1 porcion from #yoghurt where aten_id  = @aten),0)
   fetch next from alfa into @edad, @sexo, @descripcion, @nombre, @numero_de_ficha, @aten, @embarazada
end
close alfa
deallocate alfa

select * from @rep order by Edad, Diagnostico

drop table #verduras, #frutas, #leche, #quesillo, #yoghurt


END



