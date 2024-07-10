-- Usuarios y donde se alogan los usuarios de mySQL
SELECT user,host FROM mysql.user;

-- Cuentas registringidas y Contraseña expirada
SELECT user,host,account_locked, password_expired FROM mysql.user;

-- Select ver el resultado de un metodo
SELECT user();