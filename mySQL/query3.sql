-- crear un Rol
create role 'basico';

-- Asignar permisos a un rol
grant select on bd_medico.estado
to 'basico';

-- remover permizos a un rol
revoke all privileges on *.*
from 'basico';

-- asignar un rol a un usuario
grant 'basico' to 'prueba'@'localhost';

-- Activa los roles a un usuario cuando se logie
set default role all to 'prueba'@'localhost';
	-- ||
set default role 'basico' to 'prueba'@'localhost';

-- Remover roles
revoke 'basico' from 'prueba'@'localhost';