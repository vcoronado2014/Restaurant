USE BDWebLun
GO

  IF not EXISTS (SELECT column_name 
                 FROM information_schema.columns 
                 WHERE table_schema='public' 
                   and table_name='ENCO_ENTIDAD_CONTRATANTE_LUN' 
                   and column_name='TIPO_CONTRATANTE') 
	BEGIN
		ALTER TABLE ENCO_ENTIDAD_CONTRATANTE_LUN ADD  TIPO_CONTRATANTE INT NULL

		--UPDATE ENCO_ENTIDAD_CONTRATANTE_LUN SET TIPO_CONTRATANTE = 0
		PRINT 'CREAR';
	END
  else
	BEGIN
		PRINT 'El campo ya existe';
	END

	GO
	UPDATE ENCO_ENTIDAD_CONTRATANTE_LUN SET TIPO_CONTRATANTE = 0




GO
