CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CrearCita`(in idPac int,
							in fchCit date, in sin varchar(100), in dia varchar(100),
                            in fchDiag date, in fchProx date, in pag int,
                            in pre varchar(7), in tem varchar(11), in oxi varchar(11), in pes float,
							out id int)
BEGIN
	declare est char;
    select estatus into est from paciente where idpaciente = idPac;
    if est = 'A' then
		insert into CITA(IDPACIENTE,FECHA_CITA,SINTOMAS,DIAGNOSTICO,FECHA_DIAGNOSTICO,FECHA_PROX_CITA, PAGO,PRESION_ARTERIAL,TEMPERATURA,OXIGENACION,PESO)
		values(idPac, fchCit, sin, dia, fchDiag, fchProx, pag, pre, tem, oxi, pes);
		set id = last_insert_id();
		select * from Cita where IDCITA = id;
	end if;
    if est = 'I' then
		signal sqlstate '45000' set message_text = 'No es un paciente Activo';
	end if;
END