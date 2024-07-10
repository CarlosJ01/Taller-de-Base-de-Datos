CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminarCita`(in idCit int)
BEGIN
	delete from CITA_ESTUDIO where IDCITA = idCit;
	delete from CITA_MEDICAMENTO_ANTERIOR where IDCITA = idCit;
    delete from CITA_MEDICAMENTO_NUEVO where IDCITA = idCit;
    delete from CITA where IDCITA = idCit;
END