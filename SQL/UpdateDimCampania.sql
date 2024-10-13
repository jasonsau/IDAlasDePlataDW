CREATE PROCEDURE UpdateDimCampania(
	@CampaniaKey	INT,
	@NombreCampania	VARCHAR(500),
	@TipoCampania VARCHAR(50),
	@TemaCampania VARCHAR(50),
	@EmailEnvio VARCHAR(50),
	@EmailRespuesta VARCHAR(50),
	@EstadoCampania VARCHAR(50),
	@TituloEmail VARCHAR(50)
) AS 
BEGIN 
	UPDATE DimCampania SET 
		NombreCampania = @NombreCampania,
		TipoCampania = @TipoCampania,
		TemaCampania = @TemaCampania,
		EstadoCampania = @EstadoCampania,
		EmailEnvio = @EmailEnvio,
		EmailRespuestas = @EmailRespuesta,
		TituloEmail = @TituloEmail
	WHERE CampaniaKey = @CampaniaKey;
END;

EXEC UpdateDimCampania ?,?,?,?,?,?,?,?;

DROP PROCEDURE UpdateDimCampania;