USE PedidosEjemplo;

CREATE TABLE Clientes(
IDCliente INT IDENTITY(1,1),
Nombre VARCHAR(30),
Apellido VARCHAR(30),
Correo VARCHAR(30),
PRIMARY KEY (IDCliente)
);

CREATE TABLE Pedidos(
IDPedido INT IDENTITY(1,1),
IDCliente INT,
Factura INT,
PRIMARY KEY (IDPedido),
FOREIGN KEY (IDCliente) REFERENCES Clientes (IDCliente)
);

USE PedidosEjemplo;
INSERT INTO Clientes(Nombre,Apellido,Correo) VALUES('Juan','Perez','juanito@gmail.com');
INSERT INTO Clientes(Nombre,Apellido,Correo) VALUES('Luis','Gonzales','gonzalitos@gmail.com');
INSERT INTO Clientes(Nombre,Apellido,Correo) VALUES('Pedro','Ruis','soypedro@gmail.com');
INSERT INTO Clientes(Nombre,Apellido,Correo) VALUES('Maria','Covarrubias','marialadelBarrio@gmail.com');

USE PedidosEjemplo;
INSERT INTO Pedidos(IDCliente,Factura) VALUES(4,560);
INSERT INTO Pedidos(IDCliente,Factura) VALUES(1,200);
INSERT INTO Pedidos(IDCliente,Factura) VALUES(3,139);
INSERT INTO Pedidos(IDCliente,Factura) VALUES(3,345);

INSERT INTO Pedidos(Factura) VALUES(500);


SELECT C.Nombre,C.Apellido,P.IDPedido 
FROM Clientes C 
JOIN Pedidos P 
ON C.IDCliente=P.IDCliente;

SELECT C.Nombre,C.Apellido,P.IDPedido 
FROM Clientes C 
LEFT JOIN Pedidos P 
ON C.IDCliente=P.IDCliente;

SELECT C.Nombre,C.Apellido,P.IDPedido 
FROM Clientes C 
LEFT JOIN Pedidos P 
ON C.IDCliente=P.IDCliente;

SELECT C.Nombre,C.Apellido,P.IDPedido 
FROM Clientes C 
RIGHT JOIN Pedidos P 
ON C.IDCliente=P.IDCliente;

SELECT C.Nombre,C.Apellido,P.IDPedido 
FROM Clientes C 
FULL OUTER JOIN Pedidos P 
ON C.IDCliente=P.IDCliente
WHERE C.IDCliente IS NULL;


SELECT C.Nombre,C.Apellido,P.IDPedido 
FROM Clientes C 
FULL OUTER JOIN Pedidos P 
ON C.IDCliente=P.IDCliente;