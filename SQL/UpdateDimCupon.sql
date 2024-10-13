
CREATE PROCEDURE UpdateDimCupon(
	@CuponKey int,
	@CodigoCupon VARCHAR(255),
	@NombreCupon VARCHAR(255),
	@TipoCupon VARCHAR(50),
	@EstadoCupon VARCHAR(50),
	@TipoDescuento VARCHAR(50),
	@ValorDescuento FLOAT,
	@NumeroVecesUsado VARCHAR(50),
	@MaximoNumeroUsos VARCHAR(50),
	@FechaExpiracion DATE
)
AS
BEGIN
	UPDATE DimCupon SET 
		CodigoCupon = @CodigoCupon,
		NombreCupon = @NombreCupon,
		TipoCupon = @TipoCupon,
		EstadoCupon = @EstadoCupon,
		TipoDescuento = @TipoDescuento,
		ValorDescuento = @ValorDescuento,
		NumeroVecesUsado = @NumeroVecesUsado,
		MaximoNumeroUsos = @MaximoNumeroUsos,
		FechaExpiracion = @FechaExpiracion
	WHERE CuponKey = @CuponKey;
END;

EXEC UpdateDimCupon
?,?,?,?,?,?,?,?,?;

DROP PROCEDURE UpdateDimCupon;