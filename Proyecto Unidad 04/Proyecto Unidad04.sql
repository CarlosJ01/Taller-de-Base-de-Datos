use bd_medico;

-- SP CRUD Paciente
-- Create
call sp_CrearPaciente('CARLOS', 'CASTRO', 'CAZARES', 'UNIDAD TLATELOLCO', 136, 
					  '1995-01-29', '4431221076','4431221076', '4431221076', 'M','1995-01-29',
					   1, 1, 1, 1, 1, 1, @id);

-- Read
call sp_ConsultarPaciente(@id);

-- Update
call sp_ActualizarPaciente(@id, 'UNIDAD TLATELOLCO', 135, '1995-01-29', '4431221076','4431221076',
						  'CarlosJ.CastroC.01@gmail.com', '1234567890122', 'A',
                          1, 1, 1, 1, 1, 1);

-- Delete
call sp_EliminarPaciente(@id);

-- SP CRUD Cita
-- Create
call sp_CrearCita(1,'1995-01-29','Se murio','Bien muerto','1995-01-29','1995-01-29',100,50,35,34,102,@idCit);

-- Read
call sp_ConsultarCita(@idCit);

-- Update
call sp_ActualizarCita(@idCit,'1995-01-29','No se murio','Te la creiste','1995-01-29','1995-01-29',100,50,35,34,102);

-- Delete
call sp_EliminarCita(@idCit);