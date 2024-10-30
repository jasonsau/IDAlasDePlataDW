
CREATE PROCEDURE UpdateDimCliente(
	@ClienteKey INT,
	@Email VARCHAR(50),
	@NombreCliente VARCHAR(255),
	@Telefono VARCHAR(50),
	@NombreEmpresa VARCHAR(50)
)
AS
BEGIN
	UPDATE DimCliente SET 
	NombreCliente=@NombreCliente,
	Telefono=@Telefono,
	Email=@Email,
	NombreEmpresa=@NombreEmpresa
	WHERE ClienteKey = @ClienteKey;
END;

EXEC UpdateDimCliente ?,?,?,?,?;

DROP PROCEDURE UpdateDimCliente;