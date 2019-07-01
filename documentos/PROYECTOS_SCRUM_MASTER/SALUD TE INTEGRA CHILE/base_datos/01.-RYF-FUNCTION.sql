USE [RYF]
GO
IF EXISTS (SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[OBTENER_CODIGO_DEIS]')) 
BEGIN
/****** Object:  UserDefinedFunction [dbo].[OBTENER_CODIGO_DEIS]    Script Date: 01-04-2019 12:18:25 ******/
DROP FUNCTION [OBTENER_CODIGO_DEIS]
END
GO



IF NOT EXISTS (SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[OBTENER_CODIGO_DEIS]')) 
--Se crea encabezado vacio del SP en caso de ser nuevo
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION OBTENER_CODIGO_DEIS
(	
	@Ids varchar(max) 
)
RETURNS @tbIds table (CODIGO_ESTABLECIMIENTO_ADMITE VARCHAR(50))
AS
begin
  declare @IdActual varchar(12);
  declare @posSep int, -- Posicion del separador '|'
          @posAnt int; -- Posicion del separador anterior.
  if(LEN(@Ids)>0)
  begin
    set @IdActual = @Ids
    set @posAnt = 0
    set @posSep = CHARINDEX(';',@Ids)
    while (@posSep > 0)
    begin
      set @IdActual= SUBSTRING(@Ids, @posAnt+1, (@posSep-1)-@posAnt)  
      insert into @tbIds values (cast(@IdActual as varchar(50)))
      set @posAnt = @posSep
      set @posSep = CHARINDEX(';',@Ids,@posAnt+1)
    end
    set @IdActual= SUBSTRING(@Ids, @posAnt+1, LEN(@Ids)-@posAnt)
    insert into @tbIds values (cast(@IdActual as varchar(50)))
  end
  RETURN
end

GO

GO

