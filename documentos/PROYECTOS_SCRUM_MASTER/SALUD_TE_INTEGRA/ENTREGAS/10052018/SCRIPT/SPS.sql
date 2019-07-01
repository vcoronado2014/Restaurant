USE [RYF]
GO
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STI0001]') AND type = N'P') 
	--Se crea encabezado vacio del SP en caso de ser nuevo
	exec('CREATE PROCEDURE [dbo].[STI0001] AS BEGIN SET NOCOUNT ON; END')
GO
/****** Object:  StoredProcedure [dbo].[STI0001]    Script Date: 16-03-2018 16:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/************************************************************************
NOMBRE DEL PROCEDIMIENTO: STI0001
AUTOR: Víctor Coronado
FECHA DE CREACIÓN: 10/05/2018
BASE DE DATOS: RYF
OBJETIVO: Obtiene a los Pacientes por filtros de Run/Nombres y apellidos
FECHA DE MODIFICACIÓN: 
USUARIO DE MODIFICACIÓN:  
MOTIVO DE MODIFICACIÓN: 
VISADO POR (QA): 
FECHA APROBACIÓN QA: 
COMENTARIOS QA: 
VISADO POR (DBA): 
FECHA APROBACIÓN DBA: 
COMENTARIOS DBA: 
TABLAS INVOLUCRADAS: PER_PERSONA, PERE_PERSONA_ESTABLECIMIENTO
COMENTARIOS: ESTE PROCEDIMIENTO ESTA CREADO EXCLUSIVAMENTE PARA SALUD TE INTEGRA
			HEC, POR ESO LOS CODIGOS DEIS ESTAN EN DURO, MAS ADELANTE SE CAMBIARA
			LA IMPLEMENTACIÓN.
***********************************************************************/
ALTER PROCEDURE [dbo].[STI0001]
       @RUN VARCHAR(250),
       @NOMBRES VARCHAR(500),
       @APELLIDO_PATERNO VARCHAR(500),
       @APELLIDO_MATERNO VARCHAR(500),
       @SEXO_ID INT --0=TODOS, 1=DESCONOCIDO, SIN DEFINIR, NO DETERMINADO, 2=MASCULINO, 3= FEMENINO

AS
BEGIN
--declare @cod_servicio varchar(1000)
--esto hay que verificarlo
--set @cod_servicio = 12
---------------------------
       IF (@RUN <> '') 
             BEGIN
                    SELECT 
                           DISTINCT PER.ID, PER.NOMBRES, PER.PRIMER_APELLIDO, PER.SEGUNDO_APELLIDO, PER.RUN, PER.FECHA_DE_NACIMIENTO 
                    FROM 
                           PER_PERSONA PER INNER JOIN PERE_PERSONA_ESTABLECIMIENTO PERE ON PERE.PER_ID = PER.ID 
                           --INNER JOIN SSAL_SERVICIO_SALUD SERV ON SERV.CODIGO_DEIS
                           and PERE.CODIGO_ESTABLECIMIENTO_ADMITE
                           in ('11-781', '99-061', '99-062', '11-302', '11-304', '11-608', '11-308', '11-309', '11-301', '11-303', '11-305',
                           '11-300', '11-306', '11-307', '11-606', '11-310', '99-180', '11-351', '11-381', '11-372', '11-376', '11-370',
                           '99-170', '11-609', '11-382', '11-379', '11-383', '11-380', '11-378', '11-901', '11-382',  '11-379', '99-111',
                           '11-607', '99-155', '99-158', '99-992')
                    WHERE run = @RUN
                    order by per.NOMBRES
             END
       ELSE
             BEGIN
             --EVALUAMOS TODOS LOS SEXOS 
                    IF (@SEXO_ID = 0)
                    BEGIN

                           --POR TODOS LOS PARAMETROS
                           IF (@NOMBRES <> '' AND @APELLIDO_PATERNO <> '' AND @APELLIDO_MATERNO <> '')
                                  BEGIN
                                        SELECT 
                                               DISTINCT PER.ID, PER.NOMBRES, PER.PRIMER_APELLIDO, PER.SEGUNDO_APELLIDO, PER.RUN, PER.FECHA_DE_NACIMIENTO 
                                        FROM 
                                               PER_PERSONA PER INNER JOIN PERE_PERSONA_ESTABLECIMIENTO PERE ON PERE.PER_ID = PER.ID 
                                               --INNER JOIN SSAL_SERVICIO_SALUD SERV ON SERV.CODIGO_DEIS
                                               and PERE.CODIGO_ESTABLECIMIENTO_ADMITE
                                               in ('11-781', '99-061', '99-062', '11-302', '11-304', '11-608', '11-308', '11-309', '11-301', '11-303', '11-305',
                                               '11-300', '11-306', '11-307', '11-606', '11-310', '99-180', '11-351', '11-381', '11-372', '11-376', '11-370',
                                               '99-170', '11-609', '11-382', '11-379', '11-383', '11-380', '11-378', '11-901', '11-382',  '11-379', '99-111',
                                               '11-607', '99-155', '99-158', '99-992')
                                        WHERE NOMBRES LIKE '%' + @NOMBRES + '%' AND LTRIM(rtrim(PRIMER_APELLIDO)) = LTRIM(rtrim(@APELLIDO_PATERNO)) AND LTRIM(rtrim(SEGUNDO_APELLIDO)) = LTRIM(rtrim(@APELLIDO_MATERNO))
                                        order by per.NOMBRES
										print 'todos por todos'
                                  END
                           --POR NOMBRES Y APELLIDO PATERNO
                           IF (@NOMBRES <> '' AND @APELLIDO_PATERNO <> '')
                                  BEGIN
                                        SELECT 
                                               DISTINCT PER.ID, PER.NOMBRES, PER.PRIMER_APELLIDO, PER.SEGUNDO_APELLIDO, PER.RUN, PER.FECHA_DE_NACIMIENTO 
                                        FROM 
                                               PER_PERSONA PER INNER JOIN PERE_PERSONA_ESTABLECIMIENTO PERE ON PERE.PER_ID = PER.ID 
                                        --INNER JOIN SSAL_SERVICIO_SALUD SERV ON SERV.CODIGO_DEIS
                                        and PERE.CODIGO_ESTABLECIMIENTO_ADMITE
                                        in ('11-781', '99-061', '99-062', '11-302', '11-304', '11-608', '11-308', '11-309', '11-301', '11-303', '11-305',
                                        '11-300', '11-306', '11-307', '11-606', '11-310', '99-180', '11-351', '11-381', '11-372', '11-376', '11-370',
                                        '99-170', '11-609', '11-382', '11-379', '11-383', '11-380', '11-378', '11-901', '11-382',  '11-379', '99-111',
                                        '11-607', '99-155', '99-158', '99-992')
                                        WHERE NOMBRES LIKE '%' + @NOMBRES + '%'   AND LTRIM(rtrim(PRIMER_APELLIDO)) = LTRIM(rtrim(@APELLIDO_PATERNO))
                                        order by per.NOMBRES
                                        print 'todos por nombres, appaterno'
                                  END
                           --POR NOMBRES Y APELLIDO MATERNO
                           IF (@NOMBRES <> '' AND @APELLIDO_MATERNO <> '')
                                  BEGIN
                                        SELECT 
                                               DISTINCT PER.ID, PER.NOMBRES, PER.PRIMER_APELLIDO, PER.SEGUNDO_APELLIDO, PER.RUN, PER.FECHA_DE_NACIMIENTO
                                        FROM 
                                               PER_PERSONA PER INNER JOIN PERE_PERSONA_ESTABLECIMIENTO PERE ON PERE.PER_ID = PER.ID 
                                               --INNER JOIN SSAL_SERVICIO_SALUD SERV ON SERV.CODIGO_DEIS
                                               and PERE.CODIGO_ESTABLECIMIENTO_ADMITE
                                               in ('11-781', '99-061', '99-062', '11-302', '11-304', '11-608', '11-308', '11-309', '11-301', '11-303', '11-305',
                                               '11-300', '11-306', '11-307', '11-606', '11-310', '99-180', '11-351', '11-381', '11-372', '11-376', '11-370',
                                               '99-170', '11-609', '11-382', '11-379', '11-383', '11-380', '11-378', '11-901', '11-382',  '11-379', '99-111',
                                               '11-607', '99-155', '99-158', '99-992')
                                        WHERE NOMBRES LIKE '%' + @NOMBRES + '%'  AND LTRIM(rtrim(SEGUNDO_APELLIDO)) = LTRIM(rtrim(@APELLIDO_MATERNO))
                                        order by per.NOMBRES
										print 'todos por nombre y materno'
                                  END
                           --POR TODOS APELLIDO PATERNO Y MATERNO
                           IF (@APELLIDO_PATERNO <> '' AND @APELLIDO_MATERNO <> '')
                                  BEGIN
                                        SELECT 
                                               DISTINCT PER.ID, PER.NOMBRES, PER.PRIMER_APELLIDO, PER.SEGUNDO_APELLIDO, PER.RUN, PER.FECHA_DE_NACIMIENTO 
                                        FROM 
                                               PER_PERSONA PER INNER JOIN PERE_PERSONA_ESTABLECIMIENTO PERE ON PERE.PER_ID = PER.ID 
                                               --INNER JOIN SSAL_SERVICIO_SALUD SERV ON SERV.CODIGO_DEIS
                                               and PERE.CODIGO_ESTABLECIMIENTO_ADMITE
                                               in ('11-781', '99-061', '99-062', '11-302', '11-304', '11-608', '11-308', '11-309', '11-301', '11-303', '11-305',
                                               '11-300', '11-306', '11-307', '11-606', '11-310', '99-180', '11-351', '11-381', '11-372', '11-376', '11-370',
                                               '99-170', '11-609', '11-382', '11-379', '11-383', '11-380', '11-378', '11-901', '11-382',  '11-379', '99-111',
                                               '11-607', '99-155', '99-158', '99-992')
                                        WHERE LTRIM(rtrim(PRIMER_APELLIDO)) = LTRIM(rtrim(@APELLIDO_PATERNO)) AND LTRIM(rtrim(SEGUNDO_APELLIDO)) = LTRIM(rtrim(@APELLIDO_MATERNO))
                                        order by per.NOMBRES
										print 'todos por ambos apellidos'
                                  END

                    END
                    --EVALUAMOS SEXO DESCONOCIDO
                    IF (@SEXO_ID = 1)
                    BEGIN

                           --POR TODOS LOS PARAMETROS
                           IF (@NOMBRES <> '' AND @APELLIDO_PATERNO <> '' AND @APELLIDO_MATERNO <> '')
                                  BEGIN
                                        SELECT 
                                               DISTINCT PER.ID, PER.NOMBRES, PER.PRIMER_APELLIDO, PER.SEGUNDO_APELLIDO, PER.RUN, PER.FECHA_DE_NACIMIENTO 
                                        FROM 
                                               PER_PERSONA PER INNER JOIN PERE_PERSONA_ESTABLECIMIENTO PERE ON PERE.PER_ID = PER.ID 
                                               --INNER JOIN SSAL_SERVICIO_SALUD SERV ON SERV.CODIGO_DEIS
                                               and PERE.CODIGO_ESTABLECIMIENTO_ADMITE
                                               in ('11-781', '99-061', '99-062', '11-302', '11-304', '11-608', '11-308', '11-309', '11-301', '11-303', '11-305',
                                               '11-300', '11-306', '11-307', '11-606', '11-310', '99-180', '11-351', '11-381', '11-372', '11-376', '11-370',
                                               '99-170', '11-609', '11-382', '11-379', '11-383', '11-380', '11-378', '11-901', '11-382',  '11-379', '99-111',
                                               '11-607', '99-155', '99-158', '99-992')
                                        WHERE NOMBRES LIKE '%' + @NOMBRES + '%' AND LTRIM(rtrim(PRIMER_APELLIDO)) = LTRIM(rtrim(@APELLIDO_PATERNO)) AND LTRIM(rtrim(SEGUNDO_APELLIDO)) = LTRIM(rtrim(@APELLIDO_MATERNO))
                                        AND SEXO IN (1,4,5)
                                        order by per.NOMBRES
										print 'sexo desc por todos'
                                  END
                           --POR NOMBRES Y APELLIDO PATERNO
                           IF (@NOMBRES <> '' AND @APELLIDO_PATERNO <> '')
                                  BEGIN
                                        SELECT 
                                               DISTINCT PER.ID, PER.NOMBRES, PER.PRIMER_APELLIDO, PER.SEGUNDO_APELLIDO, PER.RUN, PER.FECHA_DE_NACIMIENTO 
                                        FROM 
                                               PER_PERSONA PER INNER JOIN PERE_PERSONA_ESTABLECIMIENTO PERE ON PERE.PER_ID = PER.ID 
                                               --INNER JOIN SSAL_SERVICIO_SALUD SERV ON SERV.CODIGO_DEIS
                                               and PERE.CODIGO_ESTABLECIMIENTO_ADMITE
                                               in ('11-781', '99-061', '99-062', '11-302', '11-304', '11-608', '11-308', '11-309', '11-301', '11-303', '11-305',
                                               '11-300', '11-306', '11-307', '11-606', '11-310', '99-180', '11-351', '11-381', '11-372', '11-376', '11-370',
                                               '99-170', '11-609', '11-382', '11-379', '11-383', '11-380', '11-378', '11-901', '11-382',  '11-379', '99-111',
                                               '11-607', '99-155', '99-158', '99-992')
                                        WHERE NOMBRES LIKE '%' + @NOMBRES + '%'   AND LTRIM(rtrim(PRIMER_APELLIDO)) = LTRIM(rtrim(@APELLIDO_PATERNO))
                                        AND SEXO IN (1,4,5)
                                        order by per.NOMBRES
                                        print 'sex desc nombres, appaterno'
                                  END
                           --POR NOMBRES Y APELLIDO MATERNO
                           IF (@NOMBRES <> '' AND @APELLIDO_MATERNO <> '')
                                  BEGIN
                                        SELECT 
                                               DISTINCT PER.ID, PER.NOMBRES, PER.PRIMER_APELLIDO, PER.SEGUNDO_APELLIDO, PER.RUN, PER.FECHA_DE_NACIMIENTO 
                                        FROM 
                                               PER_PERSONA PER INNER JOIN PERE_PERSONA_ESTABLECIMIENTO PERE ON PERE.PER_ID = PER.ID 
                                               --INNER JOIN SSAL_SERVICIO_SALUD SERV ON SERV.CODIGO_DEIS
                                               and PERE.CODIGO_ESTABLECIMIENTO_ADMITE
                                               in ('11-781', '99-061', '99-062', '11-302', '11-304', '11-608', '11-308', '11-309', '11-301', '11-303', '11-305',
                                               '11-300', '11-306', '11-307', '11-606', '11-310', '99-180', '11-351', '11-381', '11-372', '11-376', '11-370',
                                               '99-170', '11-609', '11-382', '11-379', '11-383', '11-380', '11-378', '11-901', '11-382',  '11-379', '99-111',
                                               '11-607', '99-155', '99-158', '99-992')
                                        WHERE NOMBRES LIKE '%' + @NOMBRES + '%'   AND LTRIM(rtrim(SEGUNDO_APELLIDO)) = LTRIM(rtrim(@APELLIDO_MATERNO))
                                        AND SEXO IN (1,4,5)
                                        order by per.NOMBRES
										print 'sexo desc por nombres y paterno'
                                  END
                           --POR TODOS APELLIDO PATERNO Y MATERNO
                           IF (@APELLIDO_PATERNO <> '' AND @APELLIDO_MATERNO <> '')
                                  BEGIN
                                        SELECT 
                                               DISTINCT PER.ID, PER.NOMBRES, PER.PRIMER_APELLIDO, PER.SEGUNDO_APELLIDO, PER.RUN, PER.FECHA_DE_NACIMIENTO 
                                        FROM 
                                               PER_PERSONA PER INNER JOIN PERE_PERSONA_ESTABLECIMIENTO PERE ON PERE.PER_ID = PER.ID 
                                               --INNER JOIN SSAL_SERVICIO_SALUD SERV ON SERV.CODIGO_DEIS
                                               and PERE.CODIGO_ESTABLECIMIENTO_ADMITE
                                               in ('11-781', '99-061', '99-062', '11-302', '11-304', '11-608', '11-308', '11-309', '11-301', '11-303', '11-305',
                                               '11-300', '11-306', '11-307', '11-606', '11-310', '99-180', '11-351', '11-381', '11-372', '11-376', '11-370',
                                               '99-170', '11-609', '11-382', '11-379', '11-383', '11-380', '11-378', '11-901', '11-382',  '11-379', '99-111',
                                               '11-607', '99-155', '99-158', '99-992')
                                        WHERE LTRIM(rtrim(PRIMER_APELLIDO)) = LTRIM(rtrim(@APELLIDO_PATERNO)) AND LTRIM(rtrim(SEGUNDO_APELLIDO)) = LTRIM(rtrim(@APELLIDO_MATERNO))
                                        AND SEXO IN (1,4,5)
                                  END
								  print 'sexo desc por ambos apellidos'

                    END
                    --EVALUAMOS SEXO MASCULINO O FEMENINO
                    IF (@SEXO_ID = 2 OR @SEXO_ID = 3)
                    BEGIN

                           --POR TODOS LOS PARAMETROS
                           IF (@NOMBRES <> '' AND @APELLIDO_PATERNO <> '' AND @APELLIDO_MATERNO <> '')
                                  BEGIN
                                        SELECT 
                                               DISTINCT PER.ID, PER.NOMBRES, PER.PRIMER_APELLIDO, PER.SEGUNDO_APELLIDO, PER.RUN, PER.FECHA_DE_NACIMIENTO 
                                        FROM 
                                               PER_PERSONA PER INNER JOIN PERE_PERSONA_ESTABLECIMIENTO PERE ON PERE.PER_ID = PER.ID 
                                               --INNER JOIN SSAL_SERVICIO_SALUD SERV ON SERV.CODIGO_DEIS
                                               and PERE.CODIGO_ESTABLECIMIENTO_ADMITE
                                               in ('11-781', '99-061', '99-062', '11-302', '11-304', '11-608', '11-308', '11-309', '11-301', '11-303', '11-305',
                                               '11-300', '11-306', '11-307', '11-606', '11-310', '99-180', '11-351', '11-381', '11-372', '11-376', '11-370',
                                               '99-170', '11-609', '11-382', '11-379', '11-383', '11-380', '11-378', '11-901', '11-382',  '11-379', '99-111',
                                               '11-607', '99-155', '99-158', '99-992')
                                        WHERE NOMBRES LIKE '%' + @NOMBRES + '%' AND LTRIM(rtrim(PRIMER_APELLIDO)) = LTRIM(rtrim(@APELLIDO_PATERNO)) AND LTRIM(rtrim(SEGUNDO_APELLIDO)) = LTRIM(rtrim(@APELLIDO_MATERNO))
                                        AND SEXO = @SEXO_ID
                                        order by per.NOMBRES
										print 'todos por ' + convert(varchar, @sexo_id)
                                  END
                           --POR NOMBRES Y APELLIDO PATERNO
                           IF (@NOMBRES <> '' AND @APELLIDO_PATERNO <> '')
                                  BEGIN
                                        SELECT 
                                               DISTINCT PER.ID, PER.NOMBRES, PER.PRIMER_APELLIDO, PER.SEGUNDO_APELLIDO, PER.RUN, PER.FECHA_DE_NACIMIENTO 
                                        FROM 
                                               PER_PERSONA PER INNER JOIN PERE_PERSONA_ESTABLECIMIENTO PERE ON PERE.PER_ID = PER.ID 
                                               --INNER JOIN SSAL_SERVICIO_SALUD SERV ON SERV.CODIGO_DEIS
                                               and PERE.CODIGO_ESTABLECIMIENTO_ADMITE
                                               in ('11-781', '99-061', '99-062', '11-302', '11-304', '11-608', '11-308', '11-309', '11-301', '11-303', '11-305',
                                               '11-300', '11-306', '11-307', '11-606', '11-310', '99-180', '11-351', '11-381', '11-372', '11-376', '11-370',
                                               '99-170', '11-609', '11-382', '11-379', '11-383', '11-380', '11-378', '11-901', '11-382',  '11-379', '99-111',
                                               '11-607', '99-155', '99-158', '99-992')
                                        WHERE NOMBRES LIKE '%' + @NOMBRES + '%'   AND LTRIM(rtrim(PRIMER_APELLIDO)) = LTRIM(rtrim(@APELLIDO_PATERNO))
                                        AND SEXO = @SEXO_ID
                                        order by per.NOMBRES
                                        print 'nombre y paterno por ' + convert(varchar, @sexo_id)
                                  END
                           --POR NOMBRES Y APELLIDO MATERNO
                           IF (@NOMBRES <> '' AND @APELLIDO_MATERNO <> '')
                                  BEGIN
                                        SELECT 
                                               DISTINCT PER.ID, PER.NOMBRES, PER.PRIMER_APELLIDO, PER.SEGUNDO_APELLIDO, PER.RUN, PER.FECHA_DE_NACIMIENTO 
                                        FROM 
                                               PER_PERSONA PER INNER JOIN PERE_PERSONA_ESTABLECIMIENTO PERE ON PERE.PER_ID = PER.ID 
                                               --INNER JOIN SSAL_SERVICIO_SALUD SERV ON SERV.CODIGO_DEIS
                                               and PERE.CODIGO_ESTABLECIMIENTO_ADMITE
                                               in ('11-781', '99-061', '99-062', '11-302', '11-304', '11-608', '11-308', '11-309', '11-301', '11-303', '11-305',
                                               '11-300', '11-306', '11-307', '11-606', '11-310', '99-180', '11-351', '11-381', '11-372', '11-376', '11-370',
                                               '99-170', '11-609', '11-382', '11-379', '11-383', '11-380', '11-378', '11-901', '11-382',  '11-379', '99-111',
                                               '11-607', '99-155', '99-158', '99-992')
                                        WHERE NOMBRES LIKE '%' + @NOMBRES + '%'   AND LTRIM(rtrim(SEGUNDO_APELLIDO)) = LTRIM(rtrim(@APELLIDO_MATERNO))
                                        AND SEXO = @SEXO_ID
                                        order by per.NOMBRES
										print 'nombres y materno por ' + convert(varchar, @sexo_id)
                                  END
                           --POR TODOS APELLIDO PATERNO Y MATERNO
                           IF (@APELLIDO_PATERNO <> '' AND @APELLIDO_MATERNO <> '')
                                  BEGIN
                                        SELECT 
                                               DISTINCT PER.ID, PER.NOMBRES, PER.PRIMER_APELLIDO, PER.SEGUNDO_APELLIDO, PER.RUN, PER.FECHA_DE_NACIMIENTO 
                                        FROM 
                                               PER_PERSONA PER INNER JOIN PERE_PERSONA_ESTABLECIMIENTO PERE ON PERE.PER_ID = PER.ID 
                                               --INNER JOIN SSAL_SERVICIO_SALUD SERV ON SERV.CODIGO_DEIS
                                               and PERE.CODIGO_ESTABLECIMIENTO_ADMITE
                                               in ('11-781', '99-061', '99-062', '11-302', '11-304', '11-608', '11-308', '11-309', '11-301', '11-303', '11-305',
                                               '11-300', '11-306', '11-307', '11-606', '11-310', '99-180', '11-351', '11-381', '11-372', '11-376', '11-370',
                                               '99-170', '11-609', '11-382', '11-379', '11-383', '11-380', '11-378', '11-901', '11-382',  '11-379', '99-111',
                                               '11-607', '99-155', '99-158', '99-992')
                                        WHERE LTRIM(rtrim(PRIMER_APELLIDO)) = LTRIM(rtrim(@APELLIDO_PATERNO)) AND LTRIM(rtrim(SEGUNDO_APELLIDO)) = LTRIM(rtrim(@APELLIDO_MATERNO))
                                        AND SEXO = @SEXO_ID
                                        order by per.NOMBRES
										print 'ambos apellidos por ' + convert(varchar, @sexo_id)
                                  END

                    END
             END

END
