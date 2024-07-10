CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertMedicamento`(
	in nomMedi varchar(100) -- Parametro de entrada
)
BEGIN
	insert into medicamento(NOMBRE) 
    values (nomMedi);
    select * from medicamento;
END