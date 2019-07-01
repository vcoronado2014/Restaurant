
ALTER procedure [dbo].[JOB_3]
as 
begin

set nocount on
DECLARE 
@CONT INT, 
@MAX INT,
@ECOL_ID INT, 
@RUN_FUNCIONARIO VARCHAR(50), 
@TOT_LUN INT,
@NODO_FNP INT,
@COD_DEIS VARCHAR(10),
@NOD_ID int,
@DOMINIO varchar(50),
@FNP_IDS varchar(max)


create table #LUN_1(ID INT IDENTITY, ECOL_ID INT, RUN_FUNCIONARIO VARCHAR(50), FECHA_MOVIMIENTO DATETIME, USUARIO_REGISTRADOR VARCHAR(100), ID_LUN INT, COD_DEIS VARCHAR(10))
create table #FUNCIONARIO_POR_CODIGO_DEIS (row int identity, COD_DEIS varchar(10), NOD_ID int, DOMINIO varchar(50), RUN_FUNCIONARIO VARCHAR(50), FNP_ID int)
create table #GRP_FUN_POR_CODIGO_DEIS (row int identity, COD_DEIS varchar(10), NOD_ID INT, DOMINIO varchar(50), FNP_IDS varchar(max))

INSERT INTO #LUN_1(ECOL_ID, RUN_FUNCIONARIO, USUARIO_REGISTRADOR, ID_LUN, COD_DEIS)
SELECT distinct
	lun.ECOL_ID, 
	lun.RUN_FUNCIONARIO, 
	lun.USUARIO_CREADOR, 
	lun.ID,
	rl.cod_deis
FROM 
	RELUN_REGISTRO_LUN lun inner join
	rl_nod_ecol rl on lun.ECOL_ID = rl.ecol_id
where  
	lun.ELIMINADO = 1 
	--and RUN_FUNCIONARIO = '20130279-K'
	and not exists (select rl2.COD_DEIS
					from RELUN_REGISTRO_LUN relun
					inner join rl_nod_ecol rl2 on relun.ECOL_ID = rl2.ECOL_ID
					where relun.ELIMINADO = 0 
					and rl2.COD_DEIS = rl.COD_DEIS 
					and lun.RUN_FUNCIONARIO = relun.RUN_FUNCIONARIO)

CREATE CLUSTERED INDEX IDX_#LUN_1 on #LUN_1 (ID asc)
SELECT @MAX = COUNT(*) FROM #LUN_1

insert into #FUNCIONARIO_POR_CODIGO_DEIS
select distinct L.COD_DEIS, NOD.ID, NOD.DOMINIO, l.RUN_FUNCIONARIO, FNP.ID
from #LUN_1 as L
INNER JOIN RAYEN..NOD_NODO NOD on CODIGO_DEIS = L.COD_DEIS
inner join RAYEN..FNP_FUNCIONARIO_PRESTADOR FNP on FNP.RUT = replace(L.RUN_FUNCIONARIO,'-','') collate Modern_Spanish_CI_AI
 and FNP.NOD_ID = NOD.ID

insert into #GRP_FUN_POR_CODIGO_DEIS
select distinct COD_DEIS, NOD_ID, DOMINIO, (stuff((select ';'+ltrim(str(FNP_ID)) from #FUNCIONARIO_POR_CODIGO_DEIS where COD_DEIS = T.COD_DEIS for xml path('')),1,1,''))
from #FUNCIONARIO_POR_CODIGO_DEIS T
SELECT @MAX = COUNT(row) FROM #GRP_FUN_POR_CODIGO_DEIS

print 'Cantidad de LUN: ' + str(@MAX)

SET @CONT = 0
WHILE (@CONT <= @MAX)
BEGIN
	set @CONT += 1

       SELECT 
            @COD_DEIS = COD_DEIS,
			@NOD_ID = NOD_ID,
			@DOMINIO = DOMINIO,
			@FNP_IDS = FNP_IDS
       FROM #GRP_FUN_POR_CODIGO_DEIS WHERE row = @CONT       

       
     UPDATE P SET P.BLOQUEADO = 1
       FROM RAYEN..PFU_PERFIL P
       INNER JOIN 
       (
       SELECT L.ID 
       FROM RAYEN..LGN_LOGIN L
       INNER JOIN RAYEN.dbo.OBTENER_ID(@FNP_IDS) F ON L.FNP_ID = F.ID and L.DOMINIO = @DOMINIO
       ) LOGINF ON P.LGN_ID = LOGINF.ID
       where P.BLOQUEADO = 0
       
		IF @@ROWCOUNT > 0
			PRINT      'Desactivando Funcionarios Codigo Deis '+@COD_DEIS     
       
    
       UPDATE F SET F.ELIMINADO = 1
       FROM RAYEN..LGN_LOGIN F
       INNER JOIN RAYEN.dbo.OBTENER_ID(@FNP_IDS) FN ON F.FNP_ID = FN.ID and F.DOMINIO = @DOMINIO
       
END

drop table #FUNCIONARIO_POR_CODIGO_DEIS, #GRP_FUN_POR_CODIGO_DEIS, #LUN_1
end