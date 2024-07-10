SELECT * FROM tc_scian;
SELECT * FROM tc_entidad;
SELECT * FROM eef_2007_2017;
-- ______________________________________________________________________________________________
SELECT tc_scian.DESCRIPCION, eef_2007_2017.VAL_USD, eef_2007_2017.ANIO, eef_2007_2017.E03
FROM tc_scian LEFT JOIN eef_2007_2017
ON eef_2007_2017.CODIGO_SCIAN =  tc_scian.CODIGO_SCIAN
GROUP BY  tc_scian.DESCRIPCION, eef_2007_2017.VAL_USD, eef_2007_2017.ANIO, eef_2007_2017.E03;

-- ______________________________________________________________________________________________

SELECT tc_scian.DESCRIPCION, eef_mich.VAL_USD, eef_mich.ANIO
FROM tc_scian LEFT JOIN 
(SELECT eef_2007_2017.* FROM eef_2007_2017 WHERE E03=16) AS eef_mich
ON eef_mich.CODIGO_SCIAN =  tc_scian.CODIGO_SCIAN

--_______________________________________________________________________________________________

SELECT tc_scian.DESCRIPCION, eef_mich.VAL_USD, eef_mich.ANIO
FROM tc_scian JOIN 
(SELECT eef_2007_2017.* FROM eef_2007_2017 WHERE E03=16 AND eef_2007_2017.ANIO = 2007) AS eef_mich
ON eef_mich.CODIGO_SCIAN =  tc_scian.CODIGO_SCIAN
GROUP BY tc_scian.DESCRIPCION, eef_mich.VAL_USD, eef_mich.ANIO

-- _________________________________________________________________________________________________________________

SELECT tc_scian.DESCRIPCION, eef_mich.VAL_USD, eef_mich.ANIO
FROM tc_scian JOIN 
(SELECT eef_2007_2017.* FROM eef_2007_2017 WHERE E03=16 AND eef_2007_2017.ANIO = 2017 AND VAL_USD = 0) AS eef_mich
ON eef_mich.CODIGO_SCIAN =  tc_scian.CODIGO_SCIAN
GROUP BY tc_scian.DESCRIPCION, eef_mich.VAL_USD, eef_mich.ANIO;

-- __________________________________________________________________________________________________________________

(SELECT tc_scian.DESCRIPCION FROM tc_scian 
JOIN 
(SELECT eef_2007_2017.* FROM eef_2007_2017 WHERE E03=16 AND eef_2007_2017.ANIO = 2007 AND VAL_USD = 0) AS eef_mich
ON eef_mich.CODIGO_SCIAN =  tc_scian.CODIGO_SCIAN
GROUP BY tc_scian.DESCRIPCION, eef_mich.VAL_USD)
EXCEPT
(SELECT tc_scian.DESCRIPCION FROM tc_scian 
JOIN 
(SELECT eef_2007_2017.* FROM eef_2007_2017 WHERE E03=16 AND eef_2007_2017.ANIO = 2017 AND VAL_USD = 0) AS eef_mich
ON eef_mich.CODIGO_SCIAN =  tc_scian.CODIGO_SCIAN
GROUP BY tc_scian.DESCRIPCION, eef_mich.VAL_USD)

-- ______________________________________________________________________________________________________________

SELECT DISTINCT tc_scian.DESCRIPCION
FROM tc_scian
INNER JOIN eef_2007_2017
ON tc_scian.CODIGO_SCIAN = eef_2007_2017.CODIGO_SCIAN
WHERE eef_2007_2017.ANIO=2007 
	AND eef_2007_2017.E03=16
	AND eef_2007_2017.VAL_USD=0
	AND eef_2007_2017.CODIGO_SCIAN NOT IN (SELECT DISTINCT tc_scian.CODIGO_SCIAN FROM tc_scian JOIN eef_2007_2017
											ON tc_scian.CODIGO_SCIAN = eef_2007_2017.CODIGO_SCIAN
											WHERE eef_2007_2017.ANIO=2017 AND eef_2007_2017.E03=16 AND eef_2007_2017.VAL_USD=0)

-- _____________________________________________________________________________________________________________________________

-- Selecciona los registros repetidos de una tabla
SELECT *, COUNT(*) AS Repeticiones
FROM eef_2007_2017
GROUP BY eef_2007_2017.ANIO, eef_2007_2017.COBERTURA, eef_2007_2017.CODIGO_SCIAN, eef_2007_2017.E03, eef_2007_2017.ESTATUS, eef_2007_2017.ESTATUS_CIFRA, eef_2007_2017.PROD_EST, eef_2007_2017.VAL_USD
HAVING COUNT(*) > 1

SELECT DISTINCT *
FROM eef_2007_2017

INSERT INTO eef_2007_2017(PROD_EST,COBERTURA,ANIO,E03,CODIGO_SCIAN,VAL_USD,ESTATUS_CIFRA,ESTATUS)
VALUES ('Prueba','Nose',2019,2,212,100000,'No','Linux')