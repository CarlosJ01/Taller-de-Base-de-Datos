CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CrearPaciente`( 
				in nom varchar(100), in apePat varchar(100), in apeMat varchar(100),
                in calle varchar(100), in num int, in fchNac date,
                in telFij varchar(100), in telTra varchar(100), in telCel varchar(100),
                in sexo char, in fchAlt date,
                in idPob int, in idMun int, in idCol int, in idEst int, in idOcu int,
                in idTip int,
                out id int)
BEGIN
	INSERT INTO PACIENTE(NOMBRES,APATERNO,AMATERNO,CALLE,NUMERO,FECHA_NACIMIENTO,TEL_FIJO,TEL_TRABAJO,
    TEL_CELULAR,SEXO,FECHA_ALTA,IDPOBLACION,IDMUNICIPIO,IDCOLONIA,IDESTADO,IDOCUPACION,IDTIPO_PACIENTE)
	
    VALUES(nom, apePat, apeMat, calle, num, fchNac, telFij, telTra, telCel, sexo, 
    fchAlt, idPob, idMun, idCol, idEst, idOcu, idTip);
    
    set id = last_insert_id();
    select * from paciente where IDPACIENTE = id;
END