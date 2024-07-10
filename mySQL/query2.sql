-- Usuarios Activo
SELECT user();

-- Usuarios Activos con utf-8
SELECT current_user();

-- Estado actual del servidor
SELECT user,host,db,command
FROM information_schema.processlist;

-- Creacion de usuarios
CREATE USER 'prueba'@'localhost'
IDENTIFIED BY 'prueba123';

-- Dar privilegios
grant all privileges on *.*
to 'prueba'@'localhost'; -- dar privilegios de dar privilegios -> with grant option 

-- Actualiza los privilegios
flush privileges;

-- Quitar permizos
revoke all privileges on *.*
from 'prueba'@'localhost';

-- Asignar un permiso especifico
grant select on bd_medico.estado
to 'prueba'@'localhost';

-- Permiso de insert
grant insert on bd_medico.estado
to 'prueba'@'localhost';

-- Permisos
-- *select
-- *insert
-- *create
-- *drop
-- *alter
-- *delete
-- *update

-- Mostrar permisos
show grants for 'prueba'@'localhost';

-- borrar usuarios
drop user 'prueba'@'localhost';