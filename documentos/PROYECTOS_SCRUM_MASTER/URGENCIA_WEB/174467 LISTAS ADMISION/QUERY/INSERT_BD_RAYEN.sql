USE [RAYEN]
GO
--VALIDACION
if (select COUNT(*) from PER_PERMISO where DESCRIPCION = 'editar_datos_paciente_admision') = 0
begin

INSERT INTO [dbo].[PER_PERMISO]
           ([DESCRIPCION]
           ,[ELIMINADO]
           ,[TITULO])
     VALUES
           ('editar_datos_paciente_admision'
           ,0
           ,'Editar datos paciente admisión')
end
else
begin
	print 'NO SE PUEDE AGREGAR, YA EXISTE'
END

