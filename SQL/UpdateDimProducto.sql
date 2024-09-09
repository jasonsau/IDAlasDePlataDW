CREATE PROCEDURE UpdateDimProducto(
	@ProductoKey INT,
	@NombreProducto VARCHAR(500),
	@TipoProducto VARCHAR(50),
	@MarcaProducto VARCHAR(50),
	@DescripcionProducto VARCHAR(max),
	@CategoriaProducto VARCHAR(50),
	@EstadoProducto VARCHAR(15),
	@UnidadProducto VARCHAR(50),
	@FechaModificacion DATE
) AS
BEGIN 
	UPDATE DimProducto SET NombreProducto = @NombreProducto,
		TipoProducto = @TipoProducto,
		MarcaProducto = @MarcaProducto,
		DescripccionProducto = @DescripcionProducto,
		CategoriaProducto = @CategoriaProducto,
		EstadoProducto = @EstadoProducto,
		UnidadProducto = @UnidadProducto,
		@FechaModificacion = @FechaModificacion
		WHERE ProductoKey = @ProductoKey;
END;

EXECUTE UpdateDimProducto ?, ?, ?, ?, ?, ?, ?, ?, ?