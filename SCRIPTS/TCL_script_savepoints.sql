-- HACER UN PUNTO DE GUARDADO
START TRANSACTION;
	INSERT INTO `sql_coder_rpg`.`character` (experience, level, name, gold, played_time, account, gender)
		VALUES (5500, 10, 'Personaje5', 900, 60, 2, 1); -- Insertar
		
	SAVEPOINT puntoGuardado1; -- Punto de guardado
	
	DELETE FROM `sql_coder_rpg`.`character` -- Eliminar
		WHERE id = 6;
		
	SELECT * FROM `character`; 
		

ROLLBACK TO puntoGuardado1; -- Volver al punto de guardado
SELECT * FROM `character`;


COMMIT;  -- Este comit confirma los cambios








-- INSERTAR 8 REGISTROS
START TRANSACTION;
	INSERT INTO `sql_coder_rpg`.`spell_type` (name)
		VALUES ("Agua");
	
	INSERT INTO `sql_coder_rpg`.`spell_type` (name)
		VALUES ("Veneno");
		
	INSERT INTO `sql_coder_rpg`.`spell_type` (name)
		VALUES ("Veneno");		
			
	INSERT INTO `sql_coder_rpg`.`spell_type` (name)
		VALUES ("Tierra");
		
	SAVEPOINT puntoGuardado1; -- Punto de guardado	
			
	INSERT INTO `sql_coder_rpg`.`spell_type` (name)
		VALUES ("Sangre");	
				
	INSERT INTO `sql_coder_rpg`.`spell_type` (name)
		VALUES ("Mecanico");	
				
	INSERT INTO `sql_coder_rpg`.`spell_type` (name)
		VALUES ("Psiquico");	
				
	INSERT INTO `sql_coder_rpg`.`spell_type` (name)
		VALUES ("Hada");	
		
	SAVEPOINT puntoGuardado2; -- Punto de guardado


	RELEASE SAVEPOINT puntoGuardado1;
	-- ROLLBACK TO puntoGuardado1;

ROLLBACK;
SELECT * FROM sql_coder_rpg.spell_type;


COMMIT;  -- Este comit confirma los cambios