CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminarPaciente`( in idPac int)
BEGIN
	update paciente set ESTATUS = 'I' where IDPACIENTE = idPac;
    select IDPACIENTE, CONCAT(NOMBRES,' ',APATERNO,' ',AMATERNO) AS NOMBRE, ESTATUS from paciente where IDPACIENTE = idPac;
END