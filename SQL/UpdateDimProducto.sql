CREATE PROCEDURE UpdateDimProducto(
	@ProductoKey INT,
	@NombreProducto VARCHAR(500),
	@TipoProducto VARCHAR(50),
	@MarcaProducto VARCHAR(50),
	@FabricanteProducto VARCHAR(50),
	@DescripcionProducto VARCHAR(max),
	@CategoriaProducto VARCHAR(50),
	@EstadoProducto VARCHAR(15),
	@UnidadProducto VARCHAR(50),
	@FechaModificacion DATE,
	@PrecioProducto DECIMAL(10,2),
	@ProductId VARCHAR(255),
	@VarianteId VARCHAR(255)
) AS
BEGIN 
	IF NOT EXISTS (
		SELECT *FROM DimProducto WHERE NombreProducto = @NombreProducto AND
			TipoProducto = @TipoProducto AND
			MarcaProducto = @MarcaProducto AND
			FabricanteProducto = @FabricanteProducto AND
			DescripcionProducto = @DescripcionProducto AND
			CategoriaProducto = @CategoriaProducto AND
			EstadoProducto = @EstadoProducto AND
			UnidadProducto = @UnidadProducto AND
			PrecioUnitario = @PrecioProducto AND 
			Activo = 1
	) BEGIN
		UPDATE DimProducto SET Activo = 0, 
			FechaModificacion = GETDATE()
			WHERE ProductoKey = @ProductoKey;

		INSERT INTO DimProducto(
			ProductoId, 
			VarianteId, 
			NombreProducto, 
			TipoProducto, 
			FabricanteProducto, 
			MarcaProducto, 
			DescripcionProducto, 
			CategoriaProducto, 
			EstadoProducto, 
			UnidadProducto, 
			FechaCreacion,
			PrecioUnitario,
			Activo
			) VALUES (
			@ProductId,
			@VarianteId,
			@NombreProducto,
			@TipoProducto,
			@FabricanteProducto,
			@MarcaProducto,
			@DescripcionProducto,
			@CategoriaProducto,
			@EstadoProducto,
			@UnidadProducto,
			GETDATE(),
			@PrecioProducto,
			1
		);
	END;
END;

EXECUTE UpdateDimProducto ?,?,?,?,?,?,?,?,?,?,?,?,?;
