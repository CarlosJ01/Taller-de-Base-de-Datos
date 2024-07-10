-- 18/02/2019
-- usar una base de datos
USE base de datos

-- Selecciona todo
SELECT * FROM tabla

--Insertar Datos
INSERT INTO tabla (campo , campoN) VALUES (valor, valorN) 

-- Actualizar datos
UPDATE tabla SET campo = valor WHERE condicion

-- Eliminar datos
DELETE FROM tabla WHERE condicion 

-- __________________________________________________________________________________________________________________________________________

-- 20/02/2019
-- Informacion de la base de datos
SP_HELPDB base de datos

-- Informacion de una tabla
SP_HELP tabla

--LIKE compara los caracteres
SELECT campo FROM tabla LIKE 'C_% [_]'
-- C -> un caracter cualquiera a buscar
-- % -> todos los caracteres ya sea a la derecha o izquierda %d%
-- _ -> un caracter cualquiera
--[_] -> buscar un guion bajo

-- Para obtener la lista sin repetición elimina duplicados
SELECT DISTINCT campo FROM tabla 

-- Cuenta el numero de registros de un campo
SELECT COUNT(campo) FROM tabla

--Ordenar una seleccion
SELECT campo FROM tabla ORDER BY campo ASC O DES
-- ASC -> ordena de forma asendente si no se pone esto es por default
-- DES -> ordena de forma desendente

-- __________________________________________________________________________________________________________________________________

-- 22/02/2019
-- Reinicia el autoincrementable de una tala en el indice que se indica 0
DBCC CHECKIDENT (tabla,RESEED,0)

-- Migra datos de una tabla a otra
INSERT INTO tabla1 (campo1)
SELECT campo2 FROM tabla2

--Mayor de un campo
SELECT MAX(campo) FROM tabla

--Menor de un campo
SELECT MIN(campo) FROM tabla

--Suma de un campo
SELECT SUM(campo) FROM tabla

-- Promedio de un campo
SELECT AVG(campo) FROM tabla

--Crear una tabla Temporal que se usa como una creada en la base de datos
CREATE TABLE #nombre(
	nombre 1 tipo atributos
	nombre 2 tipo atributos
	nombre n tipo atributos
);

--Ciclo
DECLARE @CONT INTEGER	--declara una  variable
SET @CONT = 1			-- dar valor a una variable
WHILE @CONT <= 100 BEGIN -- ciclo
	acciones
	SET @CONT = @CONT + 1;
END;

--Obtener la fecha actual Data Time
GETDATE()

-- Obtiene el año de un campo
YEAR(Campo)
MONTH(Campo)
DAY(Campo)

--Combinar tablas INNER JOIN
SELECT campos
FROM tabla 1
INNER JOIN tabla 2
ON llave primarias = llave foranias
INNER JOIN tabla 3
ON llave primarias = llave foranias
.
.
.
INNER JOIN tabla N
ON llave primarias = llave foranias
-- Hasta N tablas que esten relacionadas
