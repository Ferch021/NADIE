CREATE TABLE clientes (
	id_cliente SMALLINT NOT NULL,
	nombre VARCHAR (25) NOT NULL,
	apaterno VARCHAR (20) NOT NULL,
	amaterno VARCHAR (20),
	preferencias VARCHAR (30),
	CONSTRAINT PK_clientes PRIMARY KEY (id_cliente)
);

CREATE TABLE cliente_direcs (
	id_cliente SMALLINT NOT NULL,
	id_direccion SMALLINT NOT NULL,
	calle VARCHAR (20) NOT NULL,
	numero SMALLINT NOT NULL,
	colonia VARCHAR (20),
	ciudad VARCHAR (20) NOT NULL,
	codigo_postal CHAR(5),
	CONSTRAINT PK_clien_direcs PRIMARY KEY (id_direccion, id_cliente),
	CONSTRAINT FK_clientes_cliente_direcs FOREIGN KEY (id_cliente)
	    REFERENCES clientes (id_cliente) 
            ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE cliente_tels (
	id_cliente SMALLINT NOT NULL,
	telefono CHAR (10) NOT NULL,
	CONSTRAINT PK_clien_tels PRIMARY KEY (id_cliente, telefono),
	CONSTRAINT FK_clientes_cliente_tels FOREIGN KEY (id_cliente)
	    REFERENCES clientes (id_cliente) 
            ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ventas (
	id_venta SMALLINT NOT NULL,
	id_cliente SMALLINT NOT NULL,
	id_pago SMALLINT NOT NULL,
	fecha TIMESTAMP NOT NULL,
	descuento NUMERIC (10, 2),
	total_impuesto NUMERIC (10, 2),
	monto_final NUMERIC (10, 2),
	CONSTRAINT PK_ventas PRIMARY KEY (id_venta),
	CONSTRAINT FK_ventas_clientes FOREIGN KEY (id_cliente)
	    REFERENCES clientes (id_cliente)
            ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_ventas_pagos FOREIGN KEY (id_pago)
	    REFERENCES pagos (id_pago)
            ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE pagos (
	id_pago SMALLINT NOT NULL,
	id_cliente SMALLINT NOT NULL,
	tipo_pago VARCHAR (25),
	banco VARCHAR (25) NOT NULL,
	numero_tarjeta VARCHAR(25) NOT NULL, 
	CONSTRAINT PK_pagos PRIMARY KEY (id_pago),
	CONSTRAINT FK_pagos_clientes FOREIGN KEY (id_cliente)
	   REFERENCES clientes (id_cliente)
);

CREATE TABLE ventas_detalle (
	id_venta SMALLINT NOT NULL,
	id_producto SMALLINT NOT NULL,
	cantidad SMALLINT NOT NULL,
	precio NUMERIC (10, 2) NOT NULL,
	parcial  NUMERIC (10, 2) NOT NULL,
	CONSTRAINT PK_ventas_detalle PRIMARY KEY (id_venta, id_producto),
	CONSTRAINT FK_ventas_detalle_ventas FOREIGN KEY (id_venta)
	    REFERENCES ventas (id_venta)
            ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_ventas_detalle_productos (id_producto)
	    REFERENCES productos (id_producto)
            ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE productos (
	id_producto SMALLINT NOT NULL,
	id_marca SMALLINT NOT NULL,
	id_proveedor SMALLINT NOT NULL,
	id_categoria SMALLINT NOT NULL,
	nombre_producto VARCHAR (25) NOT NULL,
	impuesto NUMERIC (10, 2) NOT NULL,
	stock INTEGER NOT NULL,
	descripcion VARCHAR (40),
	CONSTRAINT PK_productos PRIMARY KEY (id_producto),
	CONSTRAINT FK_productos_marca FOREIGN KEY (id_marca)
	    REFERENCES marcas (id_marca),
	CONSTRAINT FK_productos_proveedores FOREIGN KEY (id_proveedor)
	    REFERENCES proveedores (id_proveedor),
	CONSTRAINT FK_productos_categorias FOREIGN KEY (id_categoria)
	    REFERENCES categorias FOREIGN KEY (id_categoria)
);

CREATE TABLE marcas (
	id_marca SMALLINT NOT NULL,
	nombre_marca VARCHAR (30) NOT NULL,
	CONSTRAINT PK_marcas PRIMARY KEY (id_marca)
);

CREATE TABLE categorias (
	id_categoria SMALLINT NOT NULL,
	nombre_categoria VARCHAR (25) NOT NULL,
	descripcion VARCHAR (40),
	CONSTRAINT PK_categorias PRIMARY KEY (id_categoria)
);

CREATE TABLE entradas_producto (
	id_proveedor SMALLINT NOT NULL,
	id_producto SMALLINT NOT NULL,
	fecha_entrega TIMESTAMP NOT NULL,
	producto_malogrado BOOLEAN,
	CONSTRAINT PK_entradas_producto PRIMARY KEY (id_proveedor, id_producto),
	CONSTRAINT FK_entradas_producto_proveedores FOREIGN KEY (id_proveedor)
        REFERENCES proveedores (id_proveedor),
    CONSTRAINT FK_entradas_producto_productos FOREIGN KEY (id_producto)
        REFERENCES productos (id_producto)
);
						
CREATE TABLE proveedores (
	id_proveedor SMALLINT NOT NULL,
	nombre_proveedor VARCHAR (50) NOT NULL,
	sitio_web VARCHAR (70) NOT NULL,
	CONSTRAINT PK_proveedores PRIMARY KEY (id_proveedor)
);

CREATE TABLE proveedor_direcs (
	id_direccion SMALLINT NOT NULL,
	id_proveedor SMALLINT NOT NULL,
	calle VARCHAR (20) NOT NULL,
	numero SMALLINT NOT NULL,
	colonia VARCHAR (20),
	ciudad VARCHAR (20) NOT NULL,
	codigo_postal CHAR(5),
	CONSTRAINT PK_proveedor_direcs PRIMARY KEY (id_direccion, id_proveedor),
    CONSTRAINT FK_proveedor_direcs_proveedores FOREIGN KEY (id_proveedor)
        REFERENCES proveedores (id_proveedor)
);

CREATE TABLE proveedor_tels (
	id_proveedor SMALLINT NOT NULL,
	telefono CHAR (10) NOT NULL,
	 CONSTRAINT PK_proveedor_tels PRIMARY KEY (id_proveedor, telefono),
    CONSTRAINT FK_proveedor_tels_proveedores FOREIGN KEY (id_proveedor)
        REFERENCES proveedores (id_proveedor)
);


