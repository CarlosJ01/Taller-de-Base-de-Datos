CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertMedicamentoReturnId`(
	in nomMed varchar(100),
    out id int -- Salida
)
BEGIN
	insert into medicamento(NOMBRE) values(nomMed);
    set id = last_insert_id();
    select * from medicamento;
END