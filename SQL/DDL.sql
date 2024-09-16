
CREATE DATABASE AlasDePlataDW;
GO
USE AlasDePlataDW;
GO
/*
DROP TABLE DimProducto;
DROP TABLE DimCliente;
DROP TABLE DimTiempo;
DROP TABLE DimCoupon;
DROP TABLE DimCampania;
DROP TABLE Date_Dimension;
DROP TABLE FactVentasPorCampania;
*/

ALTER TABLE DimProducto ALTER COLUMN PrecioUnitario DECIMAL(10,2)
CREATE TABLE DimProducto(
	ProductoKey				INT				IDENTITY(1,1)				PRIMARY KEY,
	ProductoId				VARCHAR(255),
	VariantId				VARCHAR(255),
	NombreProducto			VARCHAR(500)	NOT NULL,
	TipoProducto			VARCHAR(50)		DEFAULT '',
	MarcaProducto			VARCHAR(50)		DEFAULT '',
	DescripccionProducto	VARCHAR(max)	DEFAULT '',
	CategoriaProducto		VARCHAR(50)		DEFAULT '',
	EstadoProducto			VARCHAR(15)		DEFAULT 'ACTIVO',
	UnidadProducto			VARCHAR(50)		DEFAULT '',
	FechaCreacion			DATE,
	FechaModificacion		DATE,
	PrecioUnitario			DECIMAL(10,2)
);
GO
CREATE TABLE DimCliente(
	ClienteKey				INT				IDENTITY(1,1)				PRIMARY KEY,
	ClienteId				VARCHAR(255),
	NombreCliente			VARCHAR(255)	NOT NULL,
	Telefono				VARCHAR(50)		DEFAULT '',
	Email					VARCHAR(50)		NOT NULL
);
GO
CREATE TABLE DimCoupon(
	CouponKey				INT				IDENTITY(1,1)				PRIMARY KEY,
	CouponId				VARCHAR(255)	NOT NULL,
	CouponCode				VARCHAR(255)	NOT NULL,
	NombreCoupon			VARCHAR(255),
	TipoCoupon				VARCHAR(50)		NOT NULL,
	EstadoCoupon			VARCHAR(50)		DEFAULT 'ACTIVO',
	TipoDescuento			VARCHAR(50),
	ValorDescuento			FLOAT,
	NumeroVecesUsado		INT,
	MaximoNumeroUsos		VARCHAR(50)		DEFAULT 'INFINITO',
	FechaCreacion			DATE,
	FechaExpiracion			DATE
);
GO
CREATE TABLE DimCampania(
	CampaniaKey				INT				IDENTITY(1,1)				PRIMARY KEY,
	CampaniaId				VARCHAR(500)	NOT NULL,
	NombreCampania			VARCHAR(255)	NOT NULL,
	TipoCampania			VARCHAR(50)		DEFAULT 'NORMAL',
	EmailEnvio				VARCHAR(50)		NOT NULL,
	EmailRespuestas			VARCHAR(50)		NOT NULL,
	TipoEmail				VARCHAR(50)		DEFAULT 'HTML Template',
	TituloEmail				VARCHAR(50),
	FechaEnvio				DATE,
	VistaPrevia				VARCHAR(255),
);
GO
CREATE TABLE DimTiempo(
	TiempoKey				INT				PRIMARY KEY,
	Fecha					DATETIME		NOT NULL,
	Dia						TINYINT			NOT NULL,
	Mes						TINYINT			NOT NULL,
	Anio					SMALLINT		NOT NULL
);
GO
CREATE TABLE FactVentasPorCampania(
	ClienteKey				INT				FOREIGN KEY REFERENCES DimCliente(ClienteKey),
	ProductoKey				INT				FOREIGN KEY REFERENCES DimProducto(ProductoKey),
	CouponKey				INT				FOREIGN KEY REFERENCES DimCoupon(CouponKey),
	CampaniaKey				INT				FOREIGN KEY REFERENCES DimCampania(CampaniaKey),
	Cantidad				INT,
	NumeroOrden				VARCHAR(100),
	PrecioUnitario			FLOAT,
	Descuento				FLOAT,
	Total					FLOAT,
	Subtotal				FLOAT,
);
GO
create table Date_Dimension (
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
primary key (date_key))
;