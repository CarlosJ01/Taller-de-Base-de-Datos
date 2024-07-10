-- Una transaccion T obtiene un lock sobre el rtem Q
Lock

-- T puede leer pero no escribir en Q
shared(s)

-- T puede leer y escribir Q
Exclusive(X)
-- _____________________________________________________________________________________________________________________

-- Poner el autocommit en falsa para controlarla
set autocommit = 0;

begin transaction; -- Inicia la transaccion con el autocommit activado

start transaction; -- Inicia la transaccion con el autocommit desactivado y uno tiene que aser el commit

insert into medicamento(nombre) values ('Mata-Jisus');

rollback; -- Regresa a la intruccion si no es la que se quiere  ctrl + Z
commit; -- Se que lo que se ase, lo contrario del rolback 

-- Stored Procedures
-- Funciones
-- Triggers