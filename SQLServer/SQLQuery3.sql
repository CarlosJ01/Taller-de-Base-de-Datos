SELECT * FROM tc_scian;
SELECT * FROM tc_entidad;
SELECT * FROM eef_2007_2017;

-- ///////////////////////////////////////////////////////////////////////////////////////////

SELECT tc_scian.DESCRIPCION, tc_entidad.NOM_ENTIDAD, eef_2007_2017.VAL_USD, eef_2007_2017.ANIO
FROM tc_scian JOIN eef_2007_2017 ON tc_scian.CODIGO_SCIAN = eef_2007_2017.CODIGO_SCIAN 
JOIN tc_entidad 
ON eef_2007_2017.E03 = tc_entidad.E03

--/////////////////////////////////////////////////////////////////////////////////////////////

SELECT tc_scian.DESCRIPCION, tc_entidad.NOM_ENTIDAD, eef_2007_2017.VAL_USD, eef_2007_2017.ANIO
FROM tc_scian JOIN eef_2007_2017 ON tc_scian.CODIGO_SCIAN = eef_2007_2017.CODIGO_SCIAN 
JOIN tc_entidad 
ON eef_2007_2017.E03 = tc_entidad.E03
GROUP BY tc_scian.DESCRIPCION, tc_entidad.NOM_ENTIDAD, eef_2007_2017.VAL_USD, eef_2007_2017.ANIO

-- ////////////////////////////////////////////////////////////////////////////////////////////

SELECT tc_entidad.NOM_ENTIDAD, eef_2007_2017.ANIO, SUM(eef_2007_2017.VAL_USD) AS TOTAL
FROM eef_2007_2017
JOIN tc_entidad 
ON eef_2007_2017.E03 = tc_entidad.E03
GROUP BY tc_entidad.NOM_ENTIDAD,  eef_2007_2017.ANIO

--////////////////////////////////////////////////////////////////////////////////////////////

SELECT tc_entidad.NOM_ENTIDAD, SUM(eef_2007_2017.VAL_USD) AS TOTAL
FROM eef_2007_2017
JOIN tc_entidad 
ON eef_2007_2017.E03 = tc_entidad.E03
GROUP BY tc_entidad.NOM_ENTIDAD


--///////////////////////////////////////////////////////////////////

SELECT tc_entidad.NOM_ENTIDAD, SUM(eef_2007_2017.VAL_USD) AS TOTAL
FROM eef_2007_2017
JOIN tc_entidad 
ON eef_2007_2017.E03 = tc_entidad.E03
GROUP BY tc_entidad.NOM_ENTIDAD 
ORDER BY TOTAL DESC

--/////////////////////////////////////////////////////////////////

SELECT tc_entidad.NOM_ENTIDAD, SUM(eef_2007_2017.VAL_USD) AS TOTAL
FROM eef_2007_2017
JOIN tc_entidad 
ON eef_2007_2017.E03 = tc_entidad.E03
where eef_2007_2017.ANIO=2017
GROUP BY tc_entidad.NOM_ENTIDAD
ORDER BY TOTAL DESC