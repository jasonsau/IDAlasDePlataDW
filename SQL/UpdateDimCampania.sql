CREATE PROCEDURE UpdateDimCampania(
	@CampaniaKey	INT,
	@NombreCampania	VARCHAR(500),
	@TipoCampania VARCHAR(50),
	@EmailEnvio VARCHAR(50),
	@EmailRespuesta VARCHAR(50),
	@TipoEmail VARCHAR(50),
	@FechaEnvio DATE,
	@VistaPrevia VARCHAR(255),
	@TituloEmail VARCHAR(50)
) AS 
BEGIN 
	UPDATE DimCampania SET 
		NombreCampania = @NombreCampania,
		TipoCampania = @TipoCampania,
		EmailEnvio = @EmailEnvio,
		EmailRespuestas = @EmailRespuesta,
		TipoEmail = @TipoEmail,
		FechaEnvio = @FechaEnvio,
		VistaPrevia = @VistaPrevia,
		TituloEmail = @TituloEmail
	WHERE CampaniaKey = @CampaniaKey;
END;

EXEC UpdateDimCampania ?, ?, ?, ?, ?, ?, ?, ?, ?