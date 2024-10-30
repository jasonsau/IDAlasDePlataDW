
CREATE DATABASE AlasDePlataDW;
GO

USE AlasDePlataDW;
GO

/*
DROP TABLE DimProducto;
DROP TABLE DimCliente;
DROP TABLE DimTiempo;
DROP TABLE DimCupon;
DROP TABLE DimCampania;
DROP TABLE Date_Dimension;
DROP TABLE FactVentasPorCampania;
*/

CREATE TABLE DimProducto
(
	ProductoKey INT IDENTITY(1,1) PRIMARY KEY,
	ProductoId VARCHAR(255) NOT NULL,
	VarianteId VARCHAR(255) NOT NULL,
	NombreProducto VARCHAR(500) NOT NULL,
	TipoProducto VARCHAR(50) DEFAULT 'Sin Tipo',
	FabricanteProducto VARCHAR(50) DEFAULT 'Sin Fabricante',
	MarcaProducto VARCHAR(50) DEFAULT 'Sin Marca',
	DescripcionProducto VARCHAR(max) DEFAULT 'Sin Descripcion',
	CategoriaProducto VARCHAR(50) DEFAULT 'Sin Categoria',
	EstadoProducto VARCHAR(15) DEFAULT 'ACTIVO',
	UnidadProducto VARCHAR(50) DEFAULT 'Sin Unidad de Medida',
	PrecioUnitario DECIMAL(10,2),
	FechaCreacion DATE,
	FechaModificacion DATE,
	Activo BIT DEFAULT 1
);
GO

CREATE TABLE DimCliente
(
	ClienteKey INT IDENTITY(1,1) PRIMARY KEY,
	ClienteId VARCHAR(255),
	NombreCliente VARCHAR(255) NOT NULL,
	Telefono VARCHAR(50) DEFAULT '',
	Email VARCHAR(50) NOT NULL,
	NombreEmpresa VARCHAR(255) NOT NULL,
	FechaCreacion DATE
);
GO

CREATE TABLE DimCupon
(
	CuponKey INT IDENTITY(1,1) PRIMARY KEY,
	CuponId VARCHAR(255) NOT NULL,
	CodigoCupon VARCHAR(255) NOT NULL,
	NombreCupon VARCHAR(255),
	TipoCupon VARCHAR(50) NOT NULL,
	EstadoCupon VARCHAR(50) DEFAULT 'ACTIVO',
	TipoDescuento VARCHAR(50),
	ValorDescuento FLOAT,
	NumeroVecesUsado INT,
	MaximoNumeroUsos VARCHAR(50) DEFAULT 'INFINITO',
	FechaCreacion DATE,
	FechaExpiracion DATE
);
GO

CREATE TABLE DimCampania
(
	CampaniaKey INT IDENTITY(1,1) PRIMARY KEY,
	CampaniaId VARCHAR(500) NOT NULL,
	NombreCampania VARCHAR(255) NOT NULL,
	TipoCampania VARCHAR(50) DEFAULT 'NORMAL',
	TemaCampania VARCHAR(255),
	EmailEnvio VARCHAR(50) NOT NULL,
	EmailRespuestas VARCHAR(50) NOT NULL,
	TituloEmail VARCHAR(50),
	EstadoCampania VARCHAR(50),
	FechaEnvio DATE,
	FechaCreacion DATE
);
GO

CREATE TABLE DimTiempo
(
	TiempoKey INT PRIMARY KEY,
	Fecha DATETIME NOT NULL,
	Dia TINYINT NOT NULL,
	Mes TINYINT NOT NULL,
	Anio SMALLINT NOT NULL
);
GO

CREATE TABLE FactVentasPorCampania
(
	ClienteKey INT FOREIGN KEY REFERENCES DimCliente(ClienteKey),
	ProductoKey INT FOREIGN KEY REFERENCES DimProducto(ProductoKey),
	CuponKey INT FOREIGN KEY REFERENCES DimCupon(CuponKey),
	CampaniaKey INT FOREIGN KEY REFERENCES DimCampania(CampaniaKey),
	FechaDeOrdenKey INT FOREIGN KEY REFERENCES DimTiempo(TiempoKey),
	NumeroOrden VARCHAR(260),
	Cantidad float,
	PrecioUnitario FLOAT,
	Descuento FLOAT,
	PrecioUnitarioConDescuento FLOAT,
	Total FLOAT,
	TotalConDescuento FLOAT,
	PRIMARY KEY (ClienteKey, ProductoKey, CuponKey, CampaniaKey, FechaDeOrdenKey)
);
GO

CREATE TABLE FactReportesDeRendimientoPorCampania
(
	CampaniaKey INT FOREIGN KEY REFERENCES DimCampania(CampaniaKey),
	FechaEnvioKey INT FOREIGN KEY REFERENCES DimTiempo(TiempoKey),
	RebotesPermanentes INT,
    NoEnviados INT,
    NoAbiertos INT,
    MarcadosComoSpam INT,
    Entregados INT,
    Quejas INT,
    RespuestasAutomaticas INT,
    RebotesTemporales INT,
    Aperturas INT,
    ClicsUnicos INT,
    Rebotes INT,
    Reenviados INT,
    CorreosEnviados INT,
	PRIMARY KEY (CampaniaKey, FechaEnvioKey)
);
GO

CREATE TABLE Date_Dimension
(
	date_key int not null,
	full_date smalldatetime,
	day_of_week tinyint,
	day_num_in_month tinyint,
	day_num_overall int,
	day_name varchar(9),
	day_abbrev char(3),
	weekday_flag varchar(25),
	week_num_in_year tinyint,
	week_num_overall int,
	week_begin_date smalldatetime,
	week_begin_date_key int,
	month tinyint,
	month_num_overall int,
	month_name varchar(12),
	month_abbrev varchar(15),
	quarter tinyint,
	year int,
	yearmo int,
	fiscal_month tinyint,
	fiscal_quarter tinyint,
	fiscal_year int,
	last_day_in_month_flag varchar(15),
	same_day_year_ago_date smalldatetime,
	primary key (date_key)
);

CREATE TABLE Parametros
(
	IdParametro INT PRIMARY KEY IDENTITY(1,1),
	NombreParametro VARCHAR(25) NOT NULL,
	ValorParametro VARCHAR(100) NOT NULL
);
GO

INSERT INTO Parametros
	(NombreParametro, ValorParametro)
VALUES('Fecha_Ultima_Ejecucion', CONVERT(VARCHAR, CONVERT(DATETIME,'01/01/2023')));

INSERT INTO Date_Dimension VALUES(19900101, '1990-1-1',1, 1, 1, 'Lunes', 'Lun', 'y', 1, 1, '1990-1-1', 19900101, 1, 1, 'Enero ', 'Ene', 1, 1990, 199001, 7, 3, 1990, 'n', '1989-1-1');
INSERT INTO DimTiempo (TiempoKey, Fecha, Dia, Mes, Anio) SELECT date_key, full_date, day_num_in_month, month, year FROM Date_Dimension WHERE date_key = 19900101;

INSERT INTO DimCupon
	(CuponId, NombreCupon, CodigoCupon, FechaCreacion, TipoCupon, EstadoCupon, TipoDescuento, ValorDescuento, NumeroVecesUsado, MaximoNumeroUsos, FechaExpiracion)
VALUES(0, 'No se aplico un cupon', 'NSAUC', '1990-01-01', 'Por defecto', 'ACTIVO', 'Por default', 0.0, 0, '0', '1990-01-01' );

INSERT INTO DimCampania
	(CampaniaId, NombreCampania, TipoCampania, TemaCampania, EmailEnvio, EmailRespuestas, TituloEmail, EstadoCampania, FechaEnvio, FechaCreacion)
VALUES(0, 'No se aplico un cupon', 'Por Defecto', 'Por Defecto', 'pordefecto@defecto.com', 'pordefecto@defecto.com', 'Por defecto', 'Por defecto', '1990-01-01', '1990-01-01');


UPDATE Parametros SET ValorParametro = CONVERT(VARCHAR, CONVERT(DATETIME,'01/01/2023')) WHERE NombreParametro='Fecha_Ultima_Ejecucion';