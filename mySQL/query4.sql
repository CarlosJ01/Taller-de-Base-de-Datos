-- crear el rol inermedio
create role 'intermedio';

grant 'basico' to 'intermedio';

grant insert on bd_medico.estado to 'intermedio';

grant 'intermedio' to 'prueba'@'localhost';
set default role all to 'prueba'@'localhost';

select user,host from mysql.user;

-- Mostrar los permisos de un usuario
show grants for 'prueba'@'localhost';
show grants for 'intermedio';
show grants for 'basico';
show grants for 'prueba'@'localhost' using 'intermedio';

-- Privilegios por usuario
select * from information_schema.user_privileges;

grant select(nombres,apaterno,amaterno) on bd_medico.paciente 
to 'prueba'@'localhost';