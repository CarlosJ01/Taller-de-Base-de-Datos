use bd_medico;
delimiter $$
create trigger validar_espacios_insert
	before insert on medicamento
for each row
	begin
		if trim(new.NOMBRE) = ''
        then
			signal sqlstate '45000' set
				message_text = 'No se acepta cadenas vacias';
		end if;
	end
$$
delimiter ;

insert into medicamento VALUES (null,' ');
SELECT * FROM medicamento;

DROP trigger validar_espacios_insert;

-- __________________________________________________________________________________________________________
CREATE table Bitacora (
ID_BITACORA int(11) NOT NULL AUTO_INCREMENT,
TABLA varchar(45) DEFAULT NULL,
ID int(11) DEFAULT NULL,
FECHA_CREACION date DEFAULT NULL,
USUARIO varchar(45) DEFAULT NULL,
PRIMARY KEY (ID_BITACORA));

delimiter $$
create trigger bitacora_insert
	after insert on medicamento
    for each row
	begin
		declare usuario varchar(45);
        select user() into usuario;
        insert into Bitacora(tabla,id,fecha_creacion,usuario)
		values('medicamento',new.idmedicamento,sysdate(),usuario);
	end
$$
delimiter ;

delimiter $$
create trigger bitacora_insert_Cita
	after insert on cita
    for each row
	begin
		declare usuario varchar(45);
        select user() into usuario;
        insert into Bitacora(tabla,id,fecha_creacion,usuario)
		values('Cita',new.idcita,sysdate(),usuario);
	end
$$
delimiter ;

select * from bitacora;
select * from cita;

INSERT INTO CITA(IDPACIENTE,FECHA_CITA,SINTOMAS,DIAGNOSTICO,FECHA_DIAGNOSTICO,FECHA_PROX_CITA,PAGO,PRESION_ARTERIAL,TEMPERATURA,OXIGENACION,PESO)
VALUES(1,'1995-01-29','Para que viene','Ya mejor no lo atiendo','1995-01-29','1995-01-29',200,50,35,34,70);