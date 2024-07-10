use bd_medico;

-- Crear el procedimiento almacenado
-- Cabiar el el simbolo de donde termina el procedimiento 
Delimiter $$
create procedure sp_getMedicamentos()
begin
	select * from medicamento;
end
$$
delimiter ;

-- llamar al procedimiento almacenado
call sp_getMedicamentos();
call sp_insertMedicamento('Mata-Jisus');

call sp_insertMedicamentoReturnId('Levanta Muertos',@id);
select @id;