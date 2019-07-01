/*

CREADO POR VICTOR CORONADO EN ATENCIÓN AL REQUERIMIENTO 167694 DE MANTENEDORES
DONDE SE AGREGAN EL ROL CARACTERIZADOR Y LOS PERMISOS PARA ESTE ROL

10-01-2018

*/
USE [RAYEN_MANTENEDORES]
go

--INSERT DEL ROL Caracterizador
if (select COUNT(*) from AspNetRoles where Name = 'Caracterizador') = 0
begin
INSERT INTO AspNetRoles
           ([Id]
           ,[Name])
     VALUES
           ('cac6d8f6-3a48-4480-80f9-8064c04d974f'
           ,'Caracterizador')
	
			--PRINT INFORMATIVO
	PRINT('ROL INSERTADO CON EXITO')

end
--INSERT PERMISO CONSULTAR_ARTICULO
if (select COUNT(*) from AspNetRolesPermissions where PERMISO = 'CONSULTAR_ARTICULO' and ID = 'cac6d8f6-3a48-4480-80f9-8064c04d974f') = 0
begin
INSERT INTO AspNetRolesPermissions
           ([Id]
           ,[PERMISO])
     VALUES
           ('cac6d8f6-3a48-4480-80f9-8064c04d974f'
           ,'CONSULTAR_ARTICULO')
	
			--PRINT INFORMATIVO
	PRINT('PERMISO CONSULTAR_ARTICULO INSERTADO CON EXITO')

end
--INSERT PERMISO VER_DETALLE_ARTICULO
if (select COUNT(*) from AspNetRolesPermissions where PERMISO = 'VER_DETALLE_ARTICULO' and ID = 'cac6d8f6-3a48-4480-80f9-8064c04d974f') = 0
begin
INSERT INTO AspNetRolesPermissions
           ([Id]
           ,[PERMISO])
     VALUES
           ('cac6d8f6-3a48-4480-80f9-8064c04d974f'
           ,'VER_DETALLE_ARTICULO')
	
			--PRINT INFORMATIVO
	PRINT('PERMISO VER_DETALLE_ARTICULO INSERTADO CON EXITO')

end