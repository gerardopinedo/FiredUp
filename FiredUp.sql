CREATE DATABASE FiredUp ;

SHOW DATABASES ;

USE FiredUp;

SHOW TABLES;

CREATE TABLE Departamento
(
    IdDepertamento INT PRIMARY KEY,
    Descripcion VARCHAR(20)
) ;

CREATE TABLE Puesto
(
    IdPuesto INT PRIMARY KEY,
    Descripcion VARCHAR(20)
) ;

CREATE TABLE Empleado 
(
    IdEmpleado INT PRIMARY KEY,
    Nombre VARCHAR(20),
    Ap_Paterno VARCHAR(20),
    Ap_Materno VARCHAR(20),
    IdDepertamento INT,
    FOREIGN KEY (IdDepertamento) REFERENCES DEPARTAMENTO(IdDepertamento),
    IdPuesto INT ,
    FOREIGN KEY (IdPuesto) REFERENCES PUESTO(IdPuesto)
) ;

CREATE TABLE Estufa_Modelo
(
    IdModelo INT PRIMARY KEY,
    Descripcion VARCHAR(20)
) ;

CREATE TABLE Estufa
(
    IdEstufa INT PRIMARY KEY,
    NumeroSerie VARCHAR(20),
    IdModelo INT,
    FOREIGN KEY (IdModelo) REFERENCES Estufa_Modelo(IdModelo),
    FechadeFabricación DATE,
    IdEmpleado INT ,
    FOREIGN KEY (IdEmpleado) REFERENCES EMPLEADO(IdEmpleado)
) ;

CREATE TABLE Estado 
(
    IdEstado INT PRIMARY KEY,
    Descripcion VARCHAR(20)
) ;

CREATE TABLE Cliente
(
    IdCliente INT PRIMARY KEY,
    Nombre VARCHAR(20),
    IdDomicilio INT,
    IdContacto INT 
) ;

CREATE TABLE DatosContacto
(
    IdContacto INT PRIMARY KEY,
    IdCliente INT,
    Correo VARCHAR(30),
    Telefono VARCHAR(15)
) ;

CREATE TABLE Domicilio
(
    IdDomicilio INT PRIMARY KEY,
    CalleNo VARCHAR(20),
    COLONIA VARCHAR(20),
    CIUDAD VARCHAR(20),
    CP INT,
    ESTADO INT ,
    FOREIGN KEY (ESTADO) REFERENCES ESTADO(IdEstado),
    PAIS VARCHAR(10),
    IdCliente INT ,
    FOREIGN KEY (IdCliente) REFERENCES CLIENTE(IdCliente)
) ;

CREATE TABLE Parte
(
    IdParte INT PRIMARY KEY,
    Descripcion VARCHAR(20),
    COSTO DECIMAL 
) ;

CREATE TABLE Reparacion
(
    IdReparacion INT PRIMARY KEY,
    IdEstufa INT,
    IdParte INT,
    TotalReparacion DECIMAL
) ;

CREATE TABLE DetalleFactura
(
    IdDetalleFactura INT PRIMARY KEY,
    IdReparacion INT,
    PrecioVenta DECIMAL 
) ;

CREATE TABLE Factura 
(
    IdFactura INT PRIMARY KEY,
    IdCliente INT ,
    FOREIGN KEY (IdCliente) REFERENCES CLIENTE(IdCliente),
    Fecha Date,
    IdEstufa INT,
    IdDetalleFactura INT,
    Total DECIMAL
) ;

SHOW TABLES ;

DESCRIBE Cliente ;
DESCRIBE DatosContacto ;
DESCRIBE Departamento ;
DESCRIBE DetalleFactura ;
DESCRIBE Domicilio ;
DESCRIBE Empleado ;
DESCRIBE Estado ;
DESCRIBE Estufa ;
DESCRIBE Estufa_Modelo ;
DESCRIBE Factura ;
DESCRIBE Parte ;
DESCRIBE Puesto ;
DESCRIBE Reparacion ;

INSERT INTO CLIENTE 
(IdCliente, Nombre, IdDomicilio, IdContacto) 
VALUES
(1, 'Hugo', 1, 1), 
(2, 'Paco', 2, 2),
(3, 'Luis', 3, 3),
(4, 'Guilfoyle', 4, 4),
(5, 'Jared', 5, 5);

INSERT INTO DatosContacto
(IdContacto, IdCliente, Correo, Telefono)
VALUES
(1,1, 'hugo@gmailcom','5532548958'),
(2,2, 'paco@gmail.com','5587985263'),
(3,3, 'luis@gmail.com','5563218510'),
(4,4, 'guilfoyle@gmail.com','55941579520'),
(5,4, 'guilfoyle01@gmail.com', NULL), 
(6,4, 'guilfoyle02@gmail.com', NULL);

INSERT INTO ESTADO
(IdEstado, Descripcion)
VALUES
(1, 'ESTADO DE MEXICO'),
(2, 'CIUDAD DE MEXICO'),
(3, 'NUEVO LEON') ;

INSERT INTO Domicilio
(IdDomicilio, CalleNo, COLONIA, CIUDAD, CP, Estado, PAIS, IdCliente)
VALUES
(1, 'Calle 1 #6512', 'Colonia 87', 'Ciudad 723', 55710, 1, 'Mexico', 1),
(2, 'Calle 12 #8712', 'Colonia 11', 'Ciudad 912', 56874, 2, 'Mexico', 2),
(3, 'Calle 3 #812', 'Colonia 91', 'Ciudad 911', 56217, 2, 'Mexico', 3),
(4, 'Calle 2 #801', 'Colonia 61', 'Ciudad 321', 96270, 1, 'Mexico', 4),
(5, 'Calle 1 #9814', 'Colonia 61', 'Ciudad 809', 98207, 3, 'Mexico', 5) ;

INSERT INTO DEPARTAMENTO
(IdDepertamento, Descripcion)
VALUES
(1, 'SISTEMAS'),
(2, 'ENSAMBLE'),
(3, 'CONTROL DE CALIDAD'),
(4, 'ALMACEN');

INSERT INTO PUESTO
(IdPuesto, Descripcion)
VALUES
(1, 'PROGRAMADOR'),
(2, 'LINEA BASICA'),
(3, 'SUPERVISOR'),
(4, 'MONTACARGAS');

INSERT INTO EMPLEADO
(IdEmpleado, Nombre, Ap_Paterno, Ap_Materno, IdDepertamento, IdPuesto)
VALUES
(1, 'Gerardo', 'Pinedo', 'Gomora', 1, 1),
(2, 'Dinsesh', 'Chungtai', NULL, 1, 1),    
(3, 'Jared', 'Dunn', NULL, 3, 3),
(4, 'Peter', 'Gregory', NULL, 3, 3) ;

INSERT INTO Estufa_Modelo
(IdModelo, Descripcion)
VALUES 
(1, '2330 Gas'),
(2, '7611 Gas'),
(3, '8872 Electrica'),
(4, '712 Electrica'),
(5, '8710 Electrica');

INSERT INTO ESTUFA 
(IdEstufa, NumeroSerie, IdModelo, FechadeFabricación, IdEmpleado)
VALUES
(1, '587542A8AD', 1, '2022/02/05', 3),
(2, '98AKS83KSA', 4, '2021/12/15', 4),
(3, '9SAK76AD9A', 5, '2021/01/10', 3),
(4, '91S93SKD3C', 3, '2022/02/03', 3),
(5, 'JAN23SK91X', 3, '2021/01/19', 4),
(6, 'JU313S8A2A', 2, '2022/04/11', 4),
(7, 'OKS23S012S', 5, '2022/04/19', 3);

INSERT INTO Parte
(IdParte, Descripcion, COSTO)
VALUES
(1, 'Quemador', 870),
(2, 'Parrilla', 312),
(3, 'Conector Gas', 740) ;

INSERT INTO Reparacion
(IdReparacion, IdEstufa, IdParte, TotalReparacion)
VALUES
(1, NULL, 1, 870),
(2, NULL, 2, 311),
(3, 1, NULL, 1043), 
(4, 3, NULL, 2099);

INSERT INTO DetalleFactura
(IdDetalleFactura, IdReparacion, PrecioVenta)
VALUES
(1, 1, 8742),
(2, 3, 2310),
(3, 4, 3191) ;

INSERT INTO Factura
(IdFactura, IdCliente, Fecha, IdEstufa, IdDetalleFactura, Total)
VALUES 
(1, 1, '2022/03/01', 1, NULL, 6540),
(2, 2, '2022/02/20', 2, NULL, 3500),
(3, 2, '2022/02/25', NULL, 1, 2500),
(4, 5, '2022,03/11', 3, NULL, 2150), 
(5, 3, '2022,03/11', NULL, 2, 2300),
(6, 1, '2022,03/11', 5, NULL, 4200),
(7, 3, '2022,03/11', 2, NULL, 3500),
(8, 3, '2022,03/11', NULL, 3, 2300),
(9, 5, '2022,03/11', 7, NULL, 2300),
(10, 1, '2022,03/11', 1, NULL, 6540) ;

SELECT A.NOMBRE, B.CALLENO, B.COLONIA, B.CIUDAD, B.CP, C.DESCRIPCION AS ESTADO, B.PAIS 
FROM CLIENTE A, DOMICILIO B, ESTADO C
WHERE A.IDCLIENTE = B.IDCLIENTE
AND B.ESTADO = C.IDESTADO ;

SELECT A.NOMBRE, B.CALLENO, B.COLONIA, B.CIUDAD, B.CP, C.DESCRIPCION AS ESTADO, B.PAIS 
FROM CLIENTE A
INNER JOIN DOMICILIO B
ON A.IDCLIENTE = B.IDCLIENTE
INNER JOIN ESTADO C
ON B.ESTADO = C.IDESTADO ;

SELECT A.NUMEROSERIE, B.DESCRIPCION, A.FECHADEFABRICACIÓN, CONCAT(C.NOMBRE , ' ' , C.Ap_Paterno) AS EMPLEADO
FROM ESTUFA A
INNER JOIN ESTUFA_MODELO B 
ON A.IDMODELO = B.IDMODELO
INNER JOIN EMPLEADO C
ON A.IDEMPLEADO = C.IDEMPLEADO;

SELECT A.NUMEROSERIE, B.DESCRIPCION, A.FECHADEFABRICACIÓN, CONCAT(C.NOMBRE , ' ' , C.Ap_Paterno) AS EMPLEADO
FROM ESTUFA A
INNER JOIN ESTUFA_MODELO B 
ON A.IDMODELO = B.IDMODELO
INNER JOIN EMPLEADO C
ON A.IDEMPLEADO = C.IDEMPLEADO
WHERE FECHADEFABRICACIÓN BETWEEN '2022-01-01' AND '2022-12-31' ;

SELECT A.IDFACTURA, B.NOMBRE AS CLIENTE, A.FECHA, A.TOTAL 
FROM FACTURA A 
INNER JOIN CLIENTE B 
ON A.IDCLIENTE = B.IDCLIENTE ;

SELECT B.NOMBRE AS CLIENTE, SUM(A.TOTAL) 
FROM FACTURA A 
INNER JOIN CLIENTE B 
ON A.IDCLIENTE = B.IDCLIENTE
GROUP BY B.NOMBRE ;

SELECT A.NOMBRE, B.CALLENO, B.COLONIA, B.CIUDAD, B.CP, C.DESCRIPCION AS ESTADO, B.PAIS
FROM CLIENTE A
INNER JOIN DOMICILIO B
ON A.IDCLIENTE = B.IDCLIENTE
INNER JOIN ESTADO C
ON B.ESTADO = C.IDESTADO 
WHERE C.DESCRIPCION LIKE '%MEXICO';

SELECT A.IDFACTURA, B.NOMBRE AS CLIENTE, A.FECHA, A.TOTAL 
FROM FACTURA A 
INNER JOIN CLIENTE B 
ON A.IDCLIENTE = B.IDCLIENTE 
WHERE B.NOMBRE NOT IN ('Luis');

SELECT A.IDFACTURA, B.NOMBRE AS CLIENTE, A.FECHA, A.TOTAL 
FROM FACTURA A 
INNER JOIN CLIENTE B 
ON A.IDCLIENTE = B.IDCLIENTE 
WHERE B.NOMBRE IN ('Hugo');
