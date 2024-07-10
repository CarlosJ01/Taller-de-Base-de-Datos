SELECT * FROM mysql.user;
show privileges;

-- Usuario Administrador __________________________________________________________________________________________________
create user 'Administrador'@'localhost' identified by 'Alfacentauri_1';
grant all privileges on  bd_medico.* to 'Administrador'@'localhost' with grant option;
flush privileges;
show grants for 'Administrador'@'localhost';
-- ________________________________________________________________________________________________________________________

-- Usuario Developer ___________________________________________________________________________________________________
create user 'Developer'@'localhost' identified by 'Desarrollador';
grant all privileges on  bd_medico.* to 'Developer'@'localhost';

-- No puede crear tablas
revoke create  on  bd_medico.* from 'Developer'@'localhost';

-- No puede eliminar en las tablas catalogo
revoke delete on bd_medico.* from 'Developer'@'localhost';

grant delete on bd_medico.paciente to 'Developer'@'localhost';
grant delete on bd_medico.factura to 'Developer'@'localhost';
grant delete on bd_medico.cita to 'Developer'@'localhost';
grant delete on bd_medico.cita_medicamento_nuevo to 'Developer'@'localhost';
grant delete on bd_medico.cita_medicamento_anterior to 'Developer'@'localhost';
grant delete on bd_medico.cita_estudio to 'Developer'@'localhost';
grant delete on bd_medico.historia_clinica to 'Developer'@'localhost';
grant delete on bd_medico.historia_alergia to 'Developer'@'localhost';
grant delete on bd_medico.historia_cirugia to 'Developer'@'localhost';
grant delete on bd_medico.historia_enfermedad to 'Developer'@'localhost';
flush privileges;
show grants for 'Developer'@'localhost';
-- ________________________________________________________________________________________________________________________

-- Usuario Usuario______________________________________________________________________________________________________
create user 'Usuario'@'%' identified by 'remoto';

-- Ocultar el ID en la tabla paciente
grant INSERT, UPDATE, DROP, REFERENCES, INDEX, ALTER, CREATE VIEW, SHOW VIEW, TRIGGER ON bd_medico.paciente TO 'Usuario'@'%';
grant select(NOMBRES,APATERNO,AMATERNO,CALLE,NUMERO,FECHA_NACIMIENTO,TEL_FIJO,TEL_TRABAJO,TEL_CELULAR,SEXO,EMAIL,RFC,FECHA_ALTA,ESTATUS,IDPOBLACION,IDMUNICIPIO,IDCOLONIA,IDESTADO,IDOCUPACION,IDTIPO_PACIENTE)
on bd_medico.paciente to 'Usuario'@'%';

-- Resto de tablas
grant SELECT, INSERT, UPDATE, DROP, REFERENCES, INDEX, ALTER, CREATE VIEW, SHOW VIEW, TRIGGER ON bd_medico.cita TO 'Usuario'@'%';
grant SELECT, INSERT, UPDATE, DROP, REFERENCES, INDEX, ALTER, CREATE VIEW, SHOW VIEW, TRIGGER ON bd_medico.cita_estudio TO 'Usuario'@'%';
grant SELECT, INSERT, UPDATE, DROP, REFERENCES, INDEX, ALTER, CREATE VIEW, SHOW VIEW, TRIGGER ON bd_medico.cita_medicamento_nuevo TO 'Usuario'@'%';
grant SELECT, INSERT, UPDATE, DROP, REFERENCES, INDEX, ALTER, CREATE VIEW, SHOW VIEW, TRIGGER ON bd_medico.cita_medicamento_anterior TO 'Usuario'@'%';
grant SELECT, INSERT, UPDATE, DROP, REFERENCES, INDEX, ALTER, CREATE VIEW, SHOW VIEW, TRIGGER ON bd_medico.factura TO 'Usuario'@'%';
grant SELECT, INSERT, UPDATE, DROP, REFERENCES, INDEX, ALTER, CREATE VIEW, SHOW VIEW, TRIGGER ON bd_medico.historia_clinica TO 'Usuario'@'%';
grant SELECT, INSERT, UPDATE, DROP, REFERENCES, INDEX, ALTER, CREATE VIEW, SHOW VIEW, TRIGGER ON bd_medico.historia_alergia TO 'Usuario'@'%';
grant SELECT, INSERT, UPDATE, DROP, REFERENCES, INDEX, ALTER, CREATE VIEW, SHOW VIEW, TRIGGER ON bd_medico.historia_cirugia TO 'Usuario'@'%';
grant SELECT, INSERT, UPDATE, DROP, REFERENCES, INDEX, ALTER, CREATE VIEW, SHOW VIEW, TRIGGER ON bd_medico.historia_enfermedad TO 'Usuario'@'%';

-- Rol para solo ver el catalogo
create role 'VerCatalogo';
grant select on bd_medico.colonia to 'VerCatalogo';
grant select on bd_medico.poblacion to 'VerCatalogo';
grant select on bd_medico.municipio to 'VerCatalogo';
grant select on bd_medico.estado to 'VerCatalogo';
grant select on bd_medico.tipo_paciente to 'VerCatalogo';
grant select on bd_medico.ocupacion to 'VerCatalogo';
grant select on bd_medico.medicamento to 'VerCatalogo';
grant select on bd_medico.estudio to 'VerCatalogo';
grant select on bd_medico.cirugia to 'VerCatalogo';
grant select on bd_medico.enfermedad to 'VerCatalogo';
grant select on bd_medico.alergia to 'VerCatalogo';

flush privileges;
grant 'VerCatalogo' to 'Usuario'@'%';
set default role all to 'Usuario'@'%';

show grants for 'VerCatalogo';
show grants for 'Usuario'@'%';
show grants for 'Usuario'@'%' using 'VerCatalogo';