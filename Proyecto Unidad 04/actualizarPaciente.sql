CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizarPaciente`(in idPac int,
                in calle varchar(100), in num int, in telFij varchar(100), in telTra varchar(100), in telCel varchar(100),
                in email varchar(100), in rfc varchar(100), in est char,
                in idPob int, in idMun int, in idCol int, in idEst int, in idOcu int, in idTip int)
BEGIN
	update paciente set CALLE = calle, NUMERO = num, TEL_FIJO = telFij, TEL_TRABAJO = telTra, TEL_CELULAR = telCel,
    EMAIL = email, RFC = rfc, ESTATUS = est, IDPOBLACION = idPob, IDMUNICIPIO = idMun, IDCOLONIA = idCol,
    IDESTADO = idEst, IDOCUPACION = idOcu, IDTIPO_PACIENTE = idTip
    where IDPACIENTE = idPac;
    
    select * from paciente where IDPACIENTE = idPac;
END