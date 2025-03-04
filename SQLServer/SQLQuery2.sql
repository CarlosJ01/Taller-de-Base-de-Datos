/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [PROD_EST]
      ,[COBERTURA]
      ,[ANIO]
      ,[E03]
      ,[CODIGO_SCIAN]
      ,[VAL_USD]
      ,[ESTATUS_CIFRA]
      ,[ESTATUS]
  FROM [Exportaciones].[dbo].[eef_2007_2017]

  select tc_scian.DESCRIPCION,
	eef_2007_2017.VAL_USD,
	eef_2007_2017.ANIO
	from eef_2007_2017
	join  tc_scian on eef_2007_2017.CODIGO_SCIAN = tc_scian.CODIGO_SCIAN 
	where eef_2007_2017.E03 = 16