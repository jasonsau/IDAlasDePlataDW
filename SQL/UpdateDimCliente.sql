
CREATE PROCEDURE UpdateDimCliente(
	@clienteKey INT,
	@email VARCHAR(50),
	@Nombre VARCHAR(255),
	@Telefono VARCHAR(50)
) AS BEGIN 
	UPDATE DimCliente SET 
	NombreCliente=@Nombre,
	Telefono=@Telefono,
	Email=@email
	WHERE ClienteKey = @clienteKey;
END;

EXEC UpdateDimCliente ?, ?, ?,
