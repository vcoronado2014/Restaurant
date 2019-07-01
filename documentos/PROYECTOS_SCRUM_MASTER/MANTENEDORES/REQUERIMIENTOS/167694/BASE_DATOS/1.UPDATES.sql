use RAYEN
GO

/* creación del rol para mantenedores rayen (mostrar farmacos hijos) */
if (select COUNT (*) from ROL_ROL where NOMBRE = 'EditorArticulosMantenedor') = 0
begin
	DECLARE @MAX_ID INT
	SET @MAX_ID = (SELECT MAX(ID) FROM ROL_ROL)
	insert into ROL_ROL (ID, NOMBRE, ELIMINADO, TRO_ID) values(@MAX_ID, 'EditorArticulosMantenedor', 0, 3)
	print('insert a ROL_ROL')
end
go
/* ahora los pra_parametros */
declare @NOD_ID int
--nodo al cual se agregaran los parametros
set @NOD_ID = 2411

if (select COUNT(*) from PRA_PARAMETROS_RAYEN where NOD_ID = @NOD_ID and DESCRIPCION = 'PERMITE_AGREGAR_ALIAS') = 0
begin
	--insert a la tabla pra_parametros
	insert into PRA_PARAMETROS_RAYEN (NOD_ID, DESCRIPCION, VALOR, ELIMINADO, ACTIVO) values (@NOD_ID, 'PERMITE_AGREGAR_ALIAS', 1, 0, 1)
	declare @id_pra int
	set @id_pra = (select id from PRA_PARAMETROS_RAYEN where NOD_ID = @NOD_ID and DESCRIPCION = 'PERMITE_AGREGAR_ALIAS')
	if (@id_pra > 0)
	begin
	--insert a mpy
		insert into MPY_MAESTRO_PARAMETROS_RAYEN 
		(MTP_ID, NOMBRE, DESCRIPCION, CREADO_POR, ACTIVO, ELIMINADO, FECHA_CREACION, FECHA_CREACION_ENTERO)
		values
		(3, 'PERMITE_AGREGAR_ALIAS', 'Este parámetro sirve para permitir generar alias a los articulos hijos (POC)','Victor Coronado', 1, 0, GETDATE(), CAST(CONVERT(VARCHAR, GETDATE(),112) AS INT))
		--tomamos el id recien generado
		declare @mpy_id int
		set @mpy_id = (select id from MPY_MAESTRO_PARAMETROS_RAYEN where NOMBRE = 'PERMITE_AGREGAR_ALIAS')

		if (@mpy_id > 0)
		begin
			update PRA_PARAMETROS_RAYEN set MPY_ID = @mpy_id where ID = @id_pra
		end

	end
end

if (select COUNT(*) from PRA_PARAMETROS_RAYEN where NOD_ID = @NOD_ID and DESCRIPCION = 'RESTRINGE_ARSENAL') = 0
begin
	--insert a la tabla pra_parametros
	insert into PRA_PARAMETROS_RAYEN (NOD_ID, DESCRIPCION, VALOR, ELIMINADO, ACTIVO) values (@NOD_ID, 'RESTRINGE_ARSENAL', 1, 0, 1)
	declare @id_pra_1 int
	set @id_pra_1 = (select id from PRA_PARAMETROS_RAYEN where NOD_ID = @NOD_ID and DESCRIPCION = 'RESTRINGE_ARSENAL')
	if (@id_pra_1 > 0)
	begin
	--insert a mpy
		insert into MPY_MAESTRO_PARAMETROS_RAYEN 
		(MTP_ID, NOMBRE, DESCRIPCION, CREADO_POR, ACTIVO, ELIMINADO, FECHA_CREACION, FECHA_CREACION_ENTERO)
		values
		(3, 'RESTRINGE_ARSENAL', 'Este parámetro sirve para restringir arsenal a los articulos hijos (POC)','Victor Coronado', 1, 0, GETDATE(), CAST(CONVERT(VARCHAR, GETDATE(),112) AS INT))
		--tomamos el id recien generado
		declare @mpy_id_1 int
		set @mpy_id_1 = (select id from MPY_MAESTRO_PARAMETROS_RAYEN where NOMBRE = 'RESTRINGE_ARSENAL')

		if (@mpy_id_1 > 0)
		begin
			update PRA_PARAMETROS_RAYEN set MPY_ID = @mpy_id_1 where ID = @id_pra_1
		end

	end
end

if (select COUNT(*) from PRA_PARAMETROS_RAYEN where NOD_ID = @NOD_ID and DESCRIPCION = 'PERMITE_VINCULAR_INSUMO') = 0
begin
	--insert a la tabla pra_parametros
	insert into PRA_PARAMETROS_RAYEN (NOD_ID, DESCRIPCION, VALOR, ELIMINADO, ACTIVO) values (@NOD_ID, 'PERMITE_VINCULAR_INSUMO', 1, 0, 1)
	declare @id_pra_2 int
	set @id_pra_2 = (select id from PRA_PARAMETROS_RAYEN where NOD_ID = @NOD_ID and DESCRIPCION = 'PERMITE_VINCULAR_INSUMO')
	if (@id_pra_2 > 0)
	begin
	--insert a mpy
		insert into MPY_MAESTRO_PARAMETROS_RAYEN 
		(MTP_ID, NOMBRE, DESCRIPCION, CREADO_POR, ACTIVO, ELIMINADO, FECHA_CREACION, FECHA_CREACION_ENTERO)
		values
		(3, 'PERMITE_VINCULAR_INSUMO', 'Este parámetro sirve para vincular insumos a los articulos hijos (POC)','Victor Coronado', 1, 0, GETDATE(), CAST(CONVERT(VARCHAR, GETDATE(),112) AS INT))
		--tomamos el id recien generado
		declare @mpy_id_2 int
		set @mpy_id_2 = (select id from MPY_MAESTRO_PARAMETROS_RAYEN where NOMBRE = 'PERMITE_VINCULAR_INSUMO')

		if (@mpy_id_2 > 0)
		begin
			update PRA_PARAMETROS_RAYEN set MPY_ID = @mpy_id_2 where ID = @id_pra_2
		end

	end
end
go