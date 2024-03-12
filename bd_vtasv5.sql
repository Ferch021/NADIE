--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.5

-- Started on 2017-03-28 18:39:17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE bd_vtasv5;
--
-- TOC entry 2197 (class 1262 OID 67071)
-- Name: bd_vtasv5; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE bd_vtasv5 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE bd_vtasv5 OWNER TO postgres;

\connect bd_vtasv5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 67072)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categorias (
    id_categoria smallint NOT NULL,
    cat_nombre character varying(60) NOT NULL,
    cat_descripcion character varying(90)
);


ALTER TABLE categorias OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 67075)
-- Name: cli_direcciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cli_direcciones (
    id_cliente integer NOT NULL,
    cli_num_dir integer NOT NULL,
    cli_calle character varying(70),
    cli_num character(5),
    cli_colonia character varying(60),
    cli_ciudad character varying(50),
    cli_cp character(5),
    cli_dir_descripcion character varying(90)
);


ALTER TABLE cli_direcciones OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 67078)
-- Name: cli_direcciones_cli_num_dir_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cli_direcciones_cli_num_dir_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cli_direcciones_cli_num_dir_seq OWNER TO postgres;

--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 183
-- Name: cli_direcciones_cli_num_dir_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cli_direcciones_cli_num_dir_seq OWNED BY cli_direcciones.cli_num_dir;


--
-- TOC entry 184 (class 1259 OID 67080)
-- Name: cli_telefonos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cli_telefonos (
    id_cliente integer NOT NULL,
    cli_id_tel integer NOT NULL,
    cli_telefono character varying(12) NOT NULL,
    cli_tel_descripcion character varying(90),
    cli_activo boolean NOT NULL
);


ALTER TABLE cli_telefonos OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 67083)
-- Name: cli_telefonos_cli_id_tel_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cli_telefonos_cli_id_tel_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cli_telefonos_cli_id_tel_seq OWNER TO postgres;

--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 185
-- Name: cli_telefonos_cli_id_tel_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cli_telefonos_cli_id_tel_seq OWNED BY cli_telefonos.cli_id_tel;


--
-- TOC entry 186 (class 1259 OID 67085)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE clientes (
    id_cliente integer NOT NULL,
    cli_nombre character varying(60) NOT NULL,
    cli_apaterno character varying(60) NOT NULL,
    cli_amaterno character varying(60),
    cli_descripcion character varying(90),
    cli_email character varying(30),
    cli_activo boolean NOT NULL
);


ALTER TABLE clientes OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 67088)
-- Name: marcas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE marcas (
    id_marca smallint NOT NULL,
    mar_nombre character varying(60) NOT NULL,
    mar_descripcion character varying(90)
);


ALTER TABLE marcas OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 67091)
-- Name: pro_direcciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pro_direcciones (
    id_proveedor smallint NOT NULL,
    pro_num_dir integer NOT NULL,
    pro_calle character varying(70),
    pro_num character(5),
    pro_colonia character varying(60),
    pro_ciudad character varying(50),
    pro_cp character(5),
    pro_dir_descripcion character varying(90)
);


ALTER TABLE pro_direcciones OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 67094)
-- Name: pro_direcciones_pro_num_dir_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pro_direcciones_pro_num_dir_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pro_direcciones_pro_num_dir_seq OWNER TO postgres;

--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 189
-- Name: pro_direcciones_pro_num_dir_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pro_direcciones_pro_num_dir_seq OWNED BY pro_direcciones.pro_num_dir;


--
-- TOC entry 190 (class 1259 OID 67096)
-- Name: pro_telefonos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pro_telefonos (
    id_proveedor smallint NOT NULL,
    pro_id_tel integer NOT NULL,
    pro_telefono character varying(12) NOT NULL,
    pro_tel_descripcion character varying(90),
    pro_activo boolean NOT NULL
);


ALTER TABLE pro_telefonos OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 67099)
-- Name: pro_telefonos_pro_id_tel_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pro_telefonos_pro_id_tel_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pro_telefonos_pro_id_tel_seq OWNER TO postgres;

--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 191
-- Name: pro_telefonos_pro_id_tel_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pro_telefonos_pro_id_tel_seq OWNED BY pro_telefonos.pro_id_tel;


--
-- TOC entry 192 (class 1259 OID 67101)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE productos (
    id_producto integer NOT NULL,
    pr_nombre character varying(60) NOT NULL,
    pr_codbarras character varying(60) NOT NULL,
    pr_precio numeric(8,2) NOT NULL,
    pr_costo numeric(8,2) NOT NULL,
    pr_impuesto numeric(8,2) NOT NULL,
    pr_stock smallint NOT NULL,
    pr_descripcion character varying(90),
    pr_activo boolean NOT NULL,
    id_proveedor smallint NOT NULL,
    id_categoria smallint NOT NULL,
    id_marca smallint NOT NULL
);


ALTER TABLE productos OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 67104)
-- Name: proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proveedores (
    id_proveedor smallint NOT NULL,
    pro_nombre character varying(60) NOT NULL,
    pro_descripcion character varying(90),
    pro_email character varying(60),
    pro_sitio_web character varying(50),
    pro_activo boolean NOT NULL
);


ALTER TABLE proveedores OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 67107)
-- Name: venta_detalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE venta_detalle (
    id_venta bigint NOT NULL,
    id_producto integer NOT NULL,
    vta_precio numeric(8,2) NOT NULL,
    vta_cantidad smallint NOT NULL,
    vta_impuesto numeric(8,2) NOT NULL
);


ALTER TABLE venta_detalle OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 67110)
-- Name: venta_encabezado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE venta_encabezado (
    id_venta bigint NOT NULL,
    vta_fecha date NOT NULL,
    vta_subtotal numeric(8,2) NOT NULL,
    vta_descuento numeric(8,2) NOT NULL,
    vta_total_impuesto numeric(8,2) NOT NULL,
    vta_descripcion character varying(90),
    id_cliente integer NOT NULL,
    vta_estatus character(12) DEFAULT 'SIN ACEPTAR'::bpchar NOT NULL
);


ALTER TABLE venta_encabezado OWNER TO postgres;

--
-- TOC entry 2027 (class 2604 OID 67114)
-- Name: cli_num_dir; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cli_direcciones ALTER COLUMN cli_num_dir SET DEFAULT nextval('cli_direcciones_cli_num_dir_seq'::regclass);


--
-- TOC entry 2028 (class 2604 OID 67115)
-- Name: cli_id_tel; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cli_telefonos ALTER COLUMN cli_id_tel SET DEFAULT nextval('cli_telefonos_cli_id_tel_seq'::regclass);


--
-- TOC entry 2029 (class 2604 OID 67116)
-- Name: pro_num_dir; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pro_direcciones ALTER COLUMN pro_num_dir SET DEFAULT nextval('pro_direcciones_pro_num_dir_seq'::regclass);


--
-- TOC entry 2030 (class 2604 OID 67117)
-- Name: pro_id_tel; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pro_telefonos ALTER COLUMN pro_id_tel SET DEFAULT nextval('pro_telefonos_pro_id_tel_seq'::regclass);


--
-- TOC entry 2178 (class 0 OID 67072)
-- Dependencies: 181
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categorias (id_categoria, cat_nombre, cat_descripcion) VALUES (1, 'ELECTRONICA', '.');
INSERT INTO categorias (id_categoria, cat_nombre, cat_descripcion) VALUES (2, 'AUTOS Y MOTOS', NULL);
INSERT INTO categorias (id_categoria, cat_nombre, cat_descripcion) VALUES (3, 'JUGUETES', NULL);
INSERT INTO categorias (id_categoria, cat_nombre, cat_descripcion) VALUES (4, 'CELULARES', NULL);
INSERT INTO categorias (id_categoria, cat_nombre, cat_descripcion) VALUES (5, 'COMPUTADORAS', NULL);
INSERT INTO categorias (id_categoria, cat_nombre, cat_descripcion) VALUES (6, 'DEPORTES', NULL);
INSERT INTO categorias (id_categoria, cat_nombre, cat_descripcion) VALUES (7, 'JARDINERIA', NULL);
INSERT INTO categorias (id_categoria, cat_nombre, cat_descripcion) VALUES (8, 'ELECTRODOMESTICOS', NULL);
INSERT INTO categorias (id_categoria, cat_nombre, cat_descripcion) VALUES (9, 'HOGAR Y MUEBLES', NULL);
INSERT INTO categorias (id_categoria, cat_nombre, cat_descripcion) VALUES (10, 'LIBROS Y PELICULAS', NULL);
INSERT INTO categorias (id_categoria, cat_nombre, cat_descripcion) VALUES (11, 'MASCOTAS', NULL);
INSERT INTO categorias (id_categoria, cat_nombre, cat_descripcion) VALUES (12, 'PAPELERIA', NULL);
INSERT INTO categorias (id_categoria, cat_nombre, cat_descripcion) VALUES (13, 'VIDEOJUEGOS', NULL);
INSERT INTO categorias (id_categoria, cat_nombre, cat_descripcion) VALUES (14, 'FARMACIA', NULL);


--
-- TOC entry 2179 (class 0 OID 67075)
-- Dependencies: 182
-- Data for Name: cli_direcciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 183
-- Name: cli_direcciones_cli_num_dir_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cli_direcciones_cli_num_dir_seq', 1, false);


--
-- TOC entry 2181 (class 0 OID 67080)
-- Dependencies: 184
-- Data for Name: cli_telefonos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 185
-- Name: cli_telefonos_cli_id_tel_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cli_telefonos_cli_id_tel_seq', 1, false);


--
-- TOC entry 2183 (class 0 OID 67085)
-- Dependencies: 186
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO clientes (id_cliente, cli_nombre, cli_apaterno, cli_amaterno, cli_descripcion, cli_email, cli_activo) VALUES (20001, 'FERNANDO', 'GARCIA', 'DE LA VEGA', 'MENUDEO', 'fgarcia@gmail.com', true);
INSERT INTO clientes (id_cliente, cli_nombre, cli_apaterno, cli_amaterno, cli_descripcion, cli_email, cli_activo) VALUES (20002, 'SANDRA', 'ESQUIVEL', 'LARA', 'MENUDEO', 'sesquivel@hotmail.com', true);
INSERT INTO clientes (id_cliente, cli_nombre, cli_apaterno, cli_amaterno, cli_descripcion, cli_email, cli_activo) VALUES (20003, 'NANCY', 'VILLA', 'LOERA', 'MAYOREO', 'nvilla@gmail.com', true);
INSERT INTO clientes (id_cliente, cli_nombre, cli_apaterno, cli_amaterno, cli_descripcion, cli_email, cli_activo) VALUES (20004, 'LETICIA', 'ASTORGA', 'GARCIA', 'MAYOREO', 'lastorga@gmail.com', true);
INSERT INTO clientes (id_cliente, cli_nombre, cli_apaterno, cli_amaterno, cli_descripcion, cli_email, cli_activo) VALUES (20005, 'HERIBERTO', 'RODRIGUEZ', 'QUEZADA', 'MENUDEO', 'hrdgz@lycos.com', true);
INSERT INTO clientes (id_cliente, cli_nombre, cli_apaterno, cli_amaterno, cli_descripcion, cli_email, cli_activo) VALUES (20006, 'ALICIA', 'JUAREZ', 'MACHADO', 'MENUDEO', 'ajuarez@gmail.com', true);
INSERT INTO clientes (id_cliente, cli_nombre, cli_apaterno, cli_amaterno, cli_descripcion, cli_email, cli_activo) VALUES (20007, 'CECILIA', 'ESTRADA', 'QUINO', 'MAYOREO', 'cestrada@lycos.com', true);
INSERT INTO clientes (id_cliente, cli_nombre, cli_apaterno, cli_amaterno, cli_descripcion, cli_email, cli_activo) VALUES (20008, 'NATALIA', 'PINEDA', 'GARCIA', 'MENUDEO', 'npineda@yahoo.com', true);
INSERT INTO clientes (id_cliente, cli_nombre, cli_apaterno, cli_amaterno, cli_descripcion, cli_email, cli_activo) VALUES (20000, 'PUBLICO GENERAL', 'P.GENERAL', NULL, 'MENUDEO', NULL, true);
INSERT INTO clientes (id_cliente, cli_nombre, cli_apaterno, cli_amaterno, cli_descripcion, cli_email, cli_activo) VALUES (20009, 'PABLO', 'MILAN', 'ROBLEDO', 'MENUDEO', 'pmilan@yahoo.com', true);
INSERT INTO clientes (id_cliente, cli_nombre, cli_apaterno, cli_amaterno, cli_descripcion, cli_email, cli_activo) VALUES (20010, 'JORGE', 'MARTINEZ', 'CARRASCO', 'MENUDEO', 'jmartinez@gmail.com', true);


--
-- TOC entry 2184 (class 0 OID 67088)
-- Dependencies: 187
-- Data for Name: marcas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO marcas (id_marca, mar_nombre, mar_descripcion) VALUES (2, 'HP', NULL);
INSERT INTO marcas (id_marca, mar_nombre, mar_descripcion) VALUES (3, 'ACER', NULL);
INSERT INTO marcas (id_marca, mar_nombre, mar_descripcion) VALUES (4, 'COMPAQ', NULL);
INSERT INTO marcas (id_marca, mar_nombre, mar_descripcion) VALUES (5, 'DELL', NULL);
INSERT INTO marcas (id_marca, mar_nombre, mar_descripcion) VALUES (6, 'LENOVO', NULL);
INSERT INTO marcas (id_marca, mar_nombre, mar_descripcion) VALUES (7, 'LEGO', NULL);
INSERT INTO marcas (id_marca, mar_nombre, mar_descripcion) VALUES (8, 'GOODYEAR', NULL);
INSERT INTO marcas (id_marca, mar_nombre, mar_descripcion) VALUES (9, 'MICHELIN', NULL);
INSERT INTO marcas (id_marca, mar_nombre, mar_descripcion) VALUES (10, 'FIRESTONE', NULL);
INSERT INTO marcas (id_marca, mar_nombre, mar_descripcion) VALUES (11, 'CONTINENTAL', NULL);
INSERT INTO marcas (id_marca, mar_nombre, mar_descripcion) VALUES (12, 'PRESTONE', NULL);
INSERT INTO marcas (id_marca, mar_nombre, mar_descripcion) VALUES (13, 'QUAKER STATE', NULL);
INSERT INTO marcas (id_marca, mar_nombre, mar_descripcion) VALUES (14, 'CASTROL', NULL);
INSERT INTO marcas (id_marca, mar_nombre, mar_descripcion) VALUES (1, 'GENERICA', NULL);
INSERT INTO marcas (id_marca, mar_nombre, mar_descripcion) VALUES (15, 'SAMSUNG', NULL);
INSERT INTO marcas (id_marca, mar_nombre, mar_descripcion) VALUES (16, 'TOSHIBA', NULL);
INSERT INTO marcas (id_marca, mar_nombre, mar_descripcion) VALUES (17, 'SONY', NULL);
INSERT INTO marcas (id_marca, mar_nombre, mar_descripcion) VALUES (18, 'PHILIPS', NULL);


--
-- TOC entry 2185 (class 0 OID 67091)
-- Dependencies: 188
-- Data for Name: pro_direcciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 189
-- Name: pro_direcciones_pro_num_dir_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pro_direcciones_pro_num_dir_seq', 1, false);


--
-- TOC entry 2187 (class 0 OID 67096)
-- Dependencies: 190
-- Data for Name: pro_telefonos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (1, 1, '6566121100', 'Trabajo 1', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (1, 2, '6566121101', 'Trabajo 2', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (1, 3, '6566121102', 'Fax', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (2, 4, '6566152701', 'Trabajo 1', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (2, 5, '6566152702', 'Trabajo 2', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (3, 6, '6566110516', 'Trabajo 1', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (3, 8, '6566110518', 'Fax', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (3, 7, '6566110517', 'Trabajo 2', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (4, 9, '6566101124', 'Principal', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (5, 6, '6566852000', 'Conmutador', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (6, 8, '6566112500', 'Principal', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (6, 9, '6566112700', 'Atencion', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (6, 10, '6566112501', 'Fax', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (7, 11, '6566171500', 'Conmutador', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (8, 12, '6566151400', 'Principal', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (8, 13, '6566151401', 'Fax', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (9, 14, '6566182500', 'Conmutador', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (9, 15, '6566182511', 'Directo', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (9, 16, '6566182512', 'Almacen', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (9, 17, '6566182513', 'Fax', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (10, 18, '6566120001', 'Conmutador', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (10, 19, '6566120002', 'Directo', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (10, 21, '6566120003', 'Fax', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (11, 22, '6566131001', 'Principal', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (11, 23, '6566131002', 'Fax', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (11, 24, '6566131003', 'Almacen', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (12, 27, '6566152512', 'Linea Directa 1', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (12, 25, '6566152500', 'Conmutador', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (12, 28, '6566152513', 'Linea Directa 2', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (12, 29, '6566152525', 'Fax', true);
INSERT INTO pro_telefonos (id_proveedor, pro_id_tel, pro_telefono, pro_tel_descripcion, pro_activo) VALUES (13, 30, '6566122525', 'Principal', true);


--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 191
-- Name: pro_telefonos_pro_id_tel_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pro_telefonos_pro_id_tel_seq', 30, true);


--
-- TOC entry 2189 (class 0 OID 67101)
-- Dependencies: 192
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10001, 'LAPTOP TOSHIBA SATELLITE 14"', '0101400031', 7699.00, 7000.00, 16.00, 100, 'LAPTOP', true, 11, 5, 16);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10002, 'LAPTOP HP PAVILION X-360', '0101400032', 14999.00, 12000.00, 16.00, 245, 'LAPTOP HP', true, 2, 5, 2);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10003, 'LAPTOP HP SPECTRE 13-v001la', '0101400033', 31999.00, 25000.00, 16.00, 160, 'LAPTOP HP', true, 2, 5, 2);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10004, 'LAPTOP ACER ASPIRE V NITRO', '0101400034', 13999.00, 10000.00, 16.00, 300, 'LAPTOP ACER', true, 4, 5, 3);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10005, 'LAPTOP ACER ASPIRE R13', '0101400035', 14999.00, 10000.00, 16.00, 200, 'LAPTOP ACER', true, 4, 5, 3);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10011, 'BOCINA PORTATIL TSST Blanca', '0101500039', 990.00, 660.00, 16.00, 120, 'BOCINAS', true, 13, 5, 1);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10012, 'BOCINA CON BLUETOOTH BT50B Roja', '0101500040', 490.00, 260.00, 16.00, 200, 'BOCINAS', true, 13, 5, 18);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10013, 'ACEITE PARA MOTOR CASTROL 4.7LTS', '0101500041', 489.00, 350.00, 16.00, 160, 'ACEITES Y REFACCIONES', true, 9, 2, 14);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10014, 'ACEITE PARA MOTOR CASTROL EDGE 946ml', '0101500042', 199.00, 80.00, 16.00, 460, 'ACEITES Y REFACCIONES', true, 9, 2, 14);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10015, 'ACEITE PARA MOTOR CASTROL MAGNETIC 4.7LTS', '0101500043', 99.00, 50.00, 16.00, 260, 'ACEITES Y REFACCIONES', true, 9, 2, 14);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10018, 'CUADERNO CUADRICULA CHICA 100 HOJAS SCRIBE', '0101600046', 50.00, 20.00, 16.00, 240, 'PAPELERIA', true, 13, 12, 1);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10019, 'JUEGO DE COLORES PRISMACOLOR ESCOLAR paquete 50', '0101600047', 99.00, 50.00, 16.00, 225, 'PAPELERIA', true, 13, 12, 1);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10020, 'JUEGO DE COLORES PRISMACOLOR PREMIUM paquete 72', '0101600048', 999.00, 630.00, 16.00, 100, 'PAPELERIA', true, 13, 12, 1);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10021, 'JUEGO DE COLORES PRISMACOLOR PREMIUM paquete 172', '0101600049', 1799.00, 1030.00, 16.00, 100, 'PAPELERIA', true, 13, 12, 1);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10022, 'CALCULADORA CIENTIFICA CITIZEN', '0101600050', 183.00, 130.00, 16.00, 110, 'PAPELERIA', true, 13, 12, 1);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10023, 'MARCADOR PERMANENTE SHARPIE', '0101600051', 39.00, 20.00, 16.00, 110, 'PAPELERIA', true, 13, 12, 1);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10024, 'CUADERNO PAUTADO 100 HOJAS', '0101400032', 65.00, 40.00, 16.00, 126, 'PAPELERIA', true, 13, 12, 1);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10025, 'FILTRO PARA ACEITE DE MOTOR', '0101500066', 98.00, 60.00, 16.00, 130, 'ACEITES Y REFACCIONES', true, 9, 2, 14);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10026, 'FILTRO PARA ACEITE DE MOTOR HIGH PERFORMANCE', '0101500067', 126.00, 78.00, 16.00, 113, 'ACEITES Y REFACCIONES', true, 9, 2, 14);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10006, 'CONTROL INALAMBRICO SONY DUALSHOCK - PS4', '0101400035', 1299.00, 850.00, 16.00, 150, 'CONTROL REMOTO', true, 12, 13, 17);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10007, 'CONTROL INALAMBRICO XBOX One Rojo', '0101500036', 1299.00, 850.00, 16.00, 150, 'CONTROL REMOTO generico', true, 13, 13, 1);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10008, 'FIFA 17 XBOX 360', '0101500036', 1199.00, 560.00, 16.00, 100, 'JUEGOS', true, 13, 13, 1);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10009, 'BATMAN FOREVER XBOX 360', '0101500037', 599.00, 260.00, 16.00, 50, 'JUEGOS', true, 13, 13, 1);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10010, 'CALL OF DUTY MODERN WAREFARE, 3 XBOX 360', '0101500038', 699.00, 360.00, 16.00, 96, 'JUEGOS', true, 13, 13, 1);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10016, 'CUADERNO PROFESIONAL RAYA 100 HOJAS SCRIBE', '0101600044', 55.00, 30.00, 16.00, 300, 'PAPELERIA', true, 13, 12, 1);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10017, 'CUADERNO DIBUJO 100 HOJAS SCRIBE', '0101600045', 50.00, 20.00, 16.00, 248, 'PAPELERIA', true, 13, 12, 1);
INSERT INTO productos (id_producto, pr_nombre, pr_codbarras, pr_precio, pr_costo, pr_impuesto, pr_stock, pr_descripcion, pr_activo, id_proveedor, id_categoria, id_marca) VALUES (10027, 'FILTRO DE AIRE HEAVY DUTY', '0101500068', 260.00, 156.00, 16.00, 65, 'ACEITES Y REFACCIONES', true, 9, 2, 14);


--
-- TOC entry 2190 (class 0 OID 67104)
-- Dependencies: 193
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO proveedores (id_proveedor, pro_nombre, pro_descripcion, pro_email, pro_sitio_web, pro_activo) VALUES (9, 'CASTROL COMPANY', 'CASTROL', 'contacto@castrol.com', 'www.castrol.com', true);
INSERT INTO proveedores (id_proveedor, pro_nombre, pro_descripcion, pro_email, pro_sitio_web, pro_activo) VALUES (1, 'DELL INC.', 'DELL INC.', 'contacto@dell.com', 'www.dell.com', true);
INSERT INTO proveedores (id_proveedor, pro_nombre, pro_descripcion, pro_email, pro_sitio_web, pro_activo) VALUES (2, 'HP COMPANY', 'HP COMPANY', 'contacto@hp.com', 'www.hp.com', true);
INSERT INTO proveedores (id_proveedor, pro_nombre, pro_descripcion, pro_email, pro_sitio_web, pro_activo) VALUES (3, 'SAMSUNG INC.', 'SAMSUNG INC.', 'contacto@samsung.com', 'www.samsung.com', true);
INSERT INTO proveedores (id_proveedor, pro_nombre, pro_descripcion, pro_email, pro_sitio_web, pro_activo) VALUES (4, 'ACER INC.', 'ACER INC.', 'contacto@acer.com', 'www.acer.com', true);
INSERT INTO proveedores (id_proveedor, pro_nombre, pro_descripcion, pro_email, pro_sitio_web, pro_activo) VALUES (5, 'LEGO COMPANY', 'LEGO CO.', 'contacto@lego.com', 'www.lego.com', true);
INSERT INTO proveedores (id_proveedor, pro_nombre, pro_descripcion, pro_email, pro_sitio_web, pro_activo) VALUES (6, 'GOODYEAR INC.', 'GOODYEAR INC.', 'contacto@goodyear.com', 'www.goodyear.com', true);
INSERT INTO proveedores (id_proveedor, pro_nombre, pro_descripcion, pro_email, pro_sitio_web, pro_activo) VALUES (7, 'MICHELIN COMPANY', 'MICHELIN CO.', 'contacto@michelin.com', 'www.michelin.com', true);
INSERT INTO proveedores (id_proveedor, pro_nombre, pro_descripcion, pro_email, pro_sitio_web, pro_activo) VALUES (8, 'FIRESTONE COMPANY', 'FIRESTONE CO.', 'contacto@firestone.com', 'www.firestone.com', true);
INSERT INTO proveedores (id_proveedor, pro_nombre, pro_descripcion, pro_email, pro_sitio_web, pro_activo) VALUES (10, 'PRESTONE INC.', 'PRESTONE', 'contacto@prestone.com', 'www.prestone.com', true);
INSERT INTO proveedores (id_proveedor, pro_nombre, pro_descripcion, pro_email, pro_sitio_web, pro_activo) VALUES (11, 'TOSHIBA COMPANY', 'TOSHIBA', 'contact@toshiba.com', 'www.toshiba.com', true);
INSERT INTO proveedores (id_proveedor, pro_nombre, pro_descripcion, pro_email, pro_sitio_web, pro_activo) VALUES (13, 'SURTE-TODO S.A. DE C.V.', 'SURTE-TODO', 'contacto@surtetodo.com', 'www.surtetodo.com', true);
INSERT INTO proveedores (id_proveedor, pro_nombre, pro_descripcion, pro_email, pro_sitio_web, pro_activo) VALUES (12, 'SONY COMPANY', 'SONY', 'contact@sony.com', 'www.sony.com', false);


--
-- TOC entry 2191 (class 0 OID 67107)
-- Dependencies: 194
-- Data for Name: venta_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50001, 10001, 7699.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50001, 10006, 1299.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50001, 10011, 990.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50002, 10016, 55.00, 3, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50002, 10019, 99.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50002, 10022, 183.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50003, 10016, 55.00, 3, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50003, 10019, 99.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50003, 10022, 183.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50003, 10023, 39.00, 2, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50004, 10008, 1199.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50004, 10009, 599.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50004, 10010, 699.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50005, 10009, 599.00, 2, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50005, 10010, 699.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50006, 10008, 1199.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50006, 10009, 599.00, 3, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50006, 10010, 699.00, 2, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50007, 10009, 599.00, 2, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50008, 10013, 489.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50008, 10025, 98.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50008, 10014, 199.00, 4, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50009, 10013, 489.00, 2, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50009, 10025, 98.00, 2, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50010, 10024, 65.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50010, 10023, 39.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50011, 10017, 50.00, 4, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50011, 10023, 39.00, 10, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50011, 10024, 65.00, 3, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50012, 10018, 50.00, 3, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50013, 10004, 13999.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50013, 10011, 990.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50014, 10004, 13999.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50014, 10011, 990.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50015, 10021, 1799.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50015, 10017, 50.00, 2, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50016, 10021, 1799.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50016, 10017, 50.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50017, 10019, 99.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50017, 10017, 50.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50018, 10002, 14999.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50018, 10006, 1299.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50018, 10009, 599.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50018, 10012, 490.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50019, 10002, 14999.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50019, 10006, 1299.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50019, 10009, 599.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50019, 10012, 490.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50020, 10002, 14999.00, 2, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50020, 10022, 183.00, 1, 16.00);
INSERT INTO venta_detalle (id_venta, id_producto, vta_precio, vta_cantidad, vta_impuesto) VALUES (50020, 10016, 55.00, 3, 16.00);


--
-- TOC entry 2192 (class 0 OID 67110)
-- Dependencies: 195
-- Data for Name: venta_encabezado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50001, '2017-01-20', 9988.00, 0.00, 1598.08, 'MOSTRADOR', 20002, 'ACEPTADA    ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50002, '2017-03-12', 447.00, 0.00, 71.52, 'MOSTRADOR', 20002, 'ACEPTADA    ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50003, '2017-03-12', 525.00, 0.00, 84.00, 'MOSTRADOR', 20005, 'ACEPTADA    ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50005, '2017-03-12', 1897.00, 0.00, 303.52, 'MOSTRADOR', 20009, 'ACEPTADA    ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50006, '2017-03-12', 4394.00, 0.00, 703.04, 'EN LINEA', 20010, 'ACEPTADA    ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50007, '2017-03-12', 1198.00, 0.00, 191.68, 'EN LINEA', 20003, 'ACEPTADA    ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50010, '2017-03-12', 104.00, 0.00, 16.64, 'EN LINEA', 20006, 'ACEPTADA    ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50011, '2017-03-12', 785.00, 0.00, 125.60, 'EN LINEA', 20008, 'ACEPTADA    ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50009, '2017-03-12', 1174.00, 0.00, 187.84, 'MOSTRADOR', 20000, 'ACEPTADA    ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50013, '2017-03-12', 14989.00, 0.00, 2398.24, 'EN LINEA', 20007, 'ACEPTADA    ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50014, '2017-03-12', 14989.00, 0.00, 2398.24, 'MOSTRADOR', 20001, 'ACEPTADA    ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50015, '2017-03-12', 1899.00, 0.00, 303.84, 'MOSTRADOR', 20002, 'ACEPTADA    ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50016, '2017-03-12', 1849.00, 0.00, 295.84, 'MOSTRADOR', 20000, 'ACEPTADA    ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50017, '2017-03-12', 149.00, 0.00, 23.84, 'MOSTRADOR', 20000, 'ACEPTADA    ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50018, '2017-03-12', 17387.00, 0.00, 2781.92, 'MOSTRADOR', 20009, 'ACEPTADA    ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50019, '2017-03-12', 17387.00, 0.00, 2781.92, 'EN LINEA', 20005, 'ACEPTADA    ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50020, '2017-03-12', 30346.00, 0.00, 4855.36, 'MOSTRADOR', 20007, 'ACEPTADA    ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50008, '2017-03-12', 1383.00, 0.00, 221.28, 'MOSTRADOR', 20000, 'CANCELADA   ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50004, '2017-03-12', 2497.00, 0.00, 399.52, 'MOSTRADOR', 20001, 'CANCELADA   ');
INSERT INTO venta_encabezado (id_venta, vta_fecha, vta_subtotal, vta_descuento, vta_total_impuesto, vta_descripcion, id_cliente, vta_estatus) VALUES (50012, '2017-03-12', 150.00, 0.00, 24.00, 'EN LINEA', 20010, 'CANCELADA   ');


--
-- TOC entry 2033 (class 2606 OID 67119)
-- Name: pk_categoria; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categorias
    ADD CONSTRAINT pk_categoria PRIMARY KEY (id_categoria);


--
-- TOC entry 2035 (class 2606 OID 67121)
-- Name: pk_cli_dir; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cli_direcciones
    ADD CONSTRAINT pk_cli_dir PRIMARY KEY (id_cliente, cli_num_dir);


--
-- TOC entry 2037 (class 2606 OID 67123)
-- Name: pk_cli_tel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cli_telefonos
    ADD CONSTRAINT pk_cli_tel PRIMARY KEY (id_cliente, cli_telefono);


--
-- TOC entry 2039 (class 2606 OID 67125)
-- Name: pk_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT pk_cliente PRIMARY KEY (id_cliente);


--
-- TOC entry 2041 (class 2606 OID 67127)
-- Name: pk_marca; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY marcas
    ADD CONSTRAINT pk_marca PRIMARY KEY (id_marca);


--
-- TOC entry 2043 (class 2606 OID 67129)
-- Name: pk_pro_dir; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pro_direcciones
    ADD CONSTRAINT pk_pro_dir PRIMARY KEY (id_proveedor, pro_num_dir);


--
-- TOC entry 2045 (class 2606 OID 67131)
-- Name: pk_pro_tel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pro_telefonos
    ADD CONSTRAINT pk_pro_tel PRIMARY KEY (id_proveedor, pro_telefono);


--
-- TOC entry 2047 (class 2606 OID 67133)
-- Name: pk_producto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT pk_producto PRIMARY KEY (id_producto);


--
-- TOC entry 2049 (class 2606 OID 67135)
-- Name: pk_proveedor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT pk_proveedor PRIMARY KEY (id_proveedor);


--
-- TOC entry 2051 (class 2606 OID 67137)
-- Name: pk_venta_det; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta_detalle
    ADD CONSTRAINT pk_venta_det PRIMARY KEY (id_venta, id_producto);


--
-- TOC entry 2053 (class 2606 OID 67139)
-- Name: pk_venta_enc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta_encabezado
    ADD CONSTRAINT pk_venta_enc PRIMARY KEY (id_venta);


--
-- TOC entry 2058 (class 2606 OID 67140)
-- Name: fk_cat_prod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT fk_cat_prod FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria);


--
-- TOC entry 2054 (class 2606 OID 67145)
-- Name: fk_cli_dir; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cli_direcciones
    ADD CONSTRAINT fk_cli_dir FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);


--
-- TOC entry 2055 (class 2606 OID 67150)
-- Name: fk_cli_tel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cli_telefonos
    ADD CONSTRAINT fk_cli_tel FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);


--
-- TOC entry 2063 (class 2606 OID 67155)
-- Name: fk_cli_vta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta_encabezado
    ADD CONSTRAINT fk_cli_vta FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);


--
-- TOC entry 2059 (class 2606 OID 67160)
-- Name: fk_mar_prod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT fk_mar_prod FOREIGN KEY (id_marca) REFERENCES marcas(id_marca);


--
-- TOC entry 2061 (class 2606 OID 67165)
-- Name: fk_pr_vta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta_detalle
    ADD CONSTRAINT fk_pr_vta FOREIGN KEY (id_producto) REFERENCES productos(id_producto);


--
-- TOC entry 2056 (class 2606 OID 67170)
-- Name: fk_pro_dir; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pro_direcciones
    ADD CONSTRAINT fk_pro_dir FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor);


--
-- TOC entry 2060 (class 2606 OID 67175)
-- Name: fk_pro_prod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT fk_pro_prod FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor);


--
-- TOC entry 2057 (class 2606 OID 67180)
-- Name: fk_pro_tel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pro_telefonos
    ADD CONSTRAINT fk_pro_tel FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor);


--
-- TOC entry 2062 (class 2606 OID 67185)
-- Name: fk_vtaenc_vtadet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta_detalle
    ADD CONSTRAINT fk_vtaenc_vtadet FOREIGN KEY (id_venta) REFERENCES venta_encabezado(id_venta);


--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-03-28 18:39:18

--
-- PostgreSQL database dump complete
--


