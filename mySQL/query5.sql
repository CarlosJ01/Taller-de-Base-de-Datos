
CREATE DATABASE INSCRIPCIONES_ALUMNOS;
USE INSCRIPCIONES_ALUMNOS;
CREATE TABLE ALUMNO(NUM_CONTROL INT PRIMARY KEY,NOMBRE VARCHAR(70),APATERNO VARCHAR(45),AMATERNO VARCHAR(45),EDAD INT,ESTATUS VARCHAR (25));
CREATE TABLE MATERIAS(ID_MATERIAS INT PRIMARY KEY AUTO_INCREMENT,NOMBRE_MATERIA VARCHAR(45));


create user 'remoto'@'%' identified by 'remoto123';
create user 'local'@'localhost' identified by 'cordenada';

 grant select,insert,update on INSCRIPCIONES_ALUMNOS.ALUMNO TO 'local'@'localhost';
 grant select,insert on INSCRIPCIONES_ALUMNOS.MATERIAS TO 'local'@'localhost';
 
 grant select(NOMBRE,APATERNO,AMATERNO,NUM_CONTROL) on INSCRIPCIONES_ALUMNOS.ALUMNO TO 'remoto'@'%';
 grant select(NOMBRE_MATERIA) on INSCRIPCIONES_ALUMNOS.MATERIAS TO 'remoto'@'%';
 flush privileges;
 
 show grants for 'remoto'@'%';
 show grants for 'local'@'localhost';