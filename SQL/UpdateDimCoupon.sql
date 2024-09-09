
CREATE PROCEDURE UpdateDimCoupon(
	@CouponKey int,
	@CouponCode	VARCHAR(255),
	@CouponName VARCHAR(255),
	@TipoCoupon VARCHAR(50),
	@EstadoCoupon VARCHAR(50),
	@TipoDescuento VARCHAR(50),
	@ValorDescuento FLOAT,
	@NumeroVecesUsado VARCHAR(50),
	@MaximoNumeroUsos VARCHAR(50),
	@FechaExpiracion DATE
) AS 
BEGIN
	UPDATE DimCoupon SET 
		CouponCode = @CouponCode,
		NombreCoupon = @CouponName,
		TipoCoupon = @TipoCoupon,
		EstadoCoupon = @EstadoCoupon,
		TipoDescuento = @TipoDescuento,
		ValorDescuento = @ValorDescuento,
		NumeroVecesUsado = @NumeroVecesUsado,
		MaximoNumeroUsos = @MaximoNumeroUsos,
		FechaExpiracion = @FechaExpiracion
	WHERE CouponKey = @CouponKey;
END;

EXEC UpdateDimCoupon ?, ?, ?, ?, ?, ?, ?, ?, ?