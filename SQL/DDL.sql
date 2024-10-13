
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
	FechaCreacion DATE,
	FechaModificacion DATE,
	PrecioUnitario DECIMAL(10,2)
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
	FechaDeCreacion DATE
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
	FechaEnvio DATE
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
	Cantidad INT,
	NumeroOrden VARCHAR(100),
	PrecioUnitario FLOAT,
	Descuento FLOAT,
	Total FLOAT,
	Subtotal FLOAT,
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
	weekday_flag char(1),
	week_num_in_year tinyint,
	week_num_overall smallint,
	week_begin_date smalldatetime,
	week_begin_date_key smallint,
	month tinyint,
	month_num_overall int,
	month_name varchar(9),
	month_abbrev varchar(15),
	quarter tinyint,
	year smallint,
	yearmo int,
	fiscal_month tinyint,
	fiscal_quarter tinyint,
	fiscal_year int,
	last_day_in_month_flag varchar(15),
	same_day_year_ago_date smalldatetime,
	primary key (date_key)
);