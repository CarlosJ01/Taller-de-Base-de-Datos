CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizarCita`(in idCit int,
								   in fchCit date, in sin varchar(100), in dia varchar(100),
								   in fchDiag date, in fchProx date, in pag int,
								   in pre varchar(7), in tem varchar(11), in oxi varchar(11), in pes float)
BEGIN
	update cita set FECHA_CITA = fchCit, SINTOMAS = sin, DIAGNOSTICO = dia,
    FECHA_DIAGNOSTICO = fchDiag, FECHA_PROX_CITA = fchProx, PAGO = pag,
    PRESION_ARTERIAL = pre, TEMPERATURA = tem, OXIGENACION = oxi, PESO = pes
    where IDCITA = idCit;
	
    select * from Cita where IDCITA = idCit;
END