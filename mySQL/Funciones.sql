use bd_medico;
delimiter $$
create function contar_medicamento()
returns integer
deterministic
begin
	declare d_count integer;
    select count(*) into d_count from medicamento;
    return d_count;
end
$$

select contar_medicamento();