
  -- [  script creado por jonathan camilo torres para el curso de SQL coderhouse  ] --
	
	-- DROP ALL TABLES
	-- DROP DATABASE sql_coder_rpg;
	
	
	-- SCHEMA Create
	CREATE DATABASE IF NOT EXISTS sql_coder_rpg;


	-- account table CREATE
	CREATE TABLE IF NOT EXISTS
		sql_coder_rpg.account(
			id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Clave principal de la tabla e id de la cuenta del jugador.',
			username VARCHAR(20) NOT NULL UNIQUE COMMENT 'Usuario del personaje.',
			password VARCHAR(20) NOT NULL COMMENT 'Password del la cuenta.',
			date_join TIMESTAMP NOT NULL COMMENT 'Fecha de creación de la cuenta.',
			last_login TIMESTAMP NOT NULL COMMENT 'Ultimo registro de logeo de la cuenta.',
			online TINYINT NOT NULL  DEFAULT(0) COMMENT 'Establece si esta online la cuenta.',
			
			INDEX(username) -- Crear indice
		);
	
	
	-- character table CREATE
	CREATE TABLE IF NOT EXISTS
		sql_coder_rpg.character(
			id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Clave principal de la tabla e id del personaje creado.',
			experience INT NOT NULL DEFAULT(0) COMMENT 'En este campo va definida la experiencia actual del personaje.',
			level INT NOT NULL DEFAULT(1) COMMENT 'Nivel actual del personaje, este irá incrementando de acuerdo a la xp actual.',
			name VARCHAR(30) NOT NULL UNIQUE COMMENT 'Nombre del personaje y también puede usarse como índice y único.',
			gold INT NOT NULL DEFAULT(0) COMMENT 'Oro del personaje.',
			played_time INT NOT NULL DEFAULT(0) COMMENT 'Tiempo total de juego del personaje calculado en segundos.',
			account INT NOT NULL COMMENT 'Clave foránea de la tabla account, en la cual se discriminan las cuentas de los usuarios.',
			gender TINYINT NOT NULL COMMENT 'El juego contará con dos géneros los cuales se usarán 0 y 1 para determinar el género (0 Macho, 1 Hembra).',

			INDEX(name),
			CONSTRAINT FK_account_id FOREIGN KEY (account)
				REFERENCES sql_coder_rpg.account(id)
		);
	
	
	
	-- spell_type table CREATE
	CREATE TABLE IF NOT EXISTS 
		sql_coder_rpg.spell_type(
		id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Clave principal de la tabla e id del tipo de spell.',
		name VARCHAR(30) NOT NULL COMMENT 'En este campo va definido el nombre del tipo spell.'
		);
	
	
	-- spell table CREATE
	CREATE TABLE IF NOT EXISTS 
		sql_coder_rpg.spell(
			id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Clave principal de la tabla e id del spell.',
			name VARCHAR(30) NOT NULL COMMENT 'Nombre del spell',
			power INT NOT NULL COMMENT 'Poder del spell.',
			id_spell_type INT NOT NULL COMMENT 'Clave foránea del spell type , ya que cada spell tiene un tipo.',
			cost INT NOT NULL COMMENT 'Costo de energía del spell.',
			
			INDEX(name),
			CONSTRAINT FK_id_spell_type FOREIGN KEY (id_spell_type)
				REFERENCES sql_coder_rpg.spell_type(id)
		);
		
		
		
	-- class table CREATE
	CREATE TABLE IF NOT EXISTS 
		sql_coder_rpg.class(
			id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Clave principal de la tabla e id la clase.',
			name VARCHAR(30) NOT NULL COMMENT 'En este campo va definida el nombre de la clase.',
			spell_1 INT NOT NULL COMMENT 'Spell 1 del personaje',
			spell_2 INT NOT NULL COMMENT 'Spell 2 del personaje',
			spell_3 INT NOT NULL COMMENT 'Spell 3 del personaje',
			
			INDEX(name),
			CONSTRAINT FK_spell_id_1 FOREIGN KEY (spell_1)
				REFERENCES sql_coder_rpg.spell(id),
			CONSTRAINT FK_spell_id_2 FOREIGN KEY (spell_2)
				REFERENCES sql_coder_rpg.spell(id),
			CONSTRAINT FK_spell_id_3 FOREIGN KEY (spell_3)
				REFERENCES sql_coder_rpg.spell(id)
		);
	
	
	
	-- character_class table CREATE
	CREATE TABLE IF NOT EXISTS
		sql_coder_rpg.character_class(
			id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Clave principal de la tabla.',
			id_character INT NOT NULL COMMENT 'Es la clave foránea de la tabla characters.',
			id_class INT NOT NULL COMMENT 'Es la clave foránea de la tabla class.',
			
			CONSTRAINT FK_id_character FOREIGN KEY (id_character)
				REFERENCES sql_coder_rpg.character(id),
			CONSTRAINT FK_id_class FOREIGN KEY (id_class)
				REFERENCES sql_coder_rpg.class(id)
		);
	
	
	
	-- race table CREATE
	CREATE TABLE IF NOT EXISTS 
		sql_coder_rpg.race(
			id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Clave principal de la tabla e id de la raza.',
			name VARCHAR(30) NOT NULL COMMENT 'Nombre de la raza.',
			racial_spell INT NOT NULL COMMENT 'Este campo es una clave foránea de la tabla spell, cada raza tiene un poder único.',
			
			CONSTRAINT FK_racial_spell FOREIGN KEY (racial_spell)
				REFERENCES sql_coder_rpg.spell(id)
		);
		
	
	-- character_race table CREATE
	CREATE TABLE IF NOT EXISTS
		sql_coder_rpg.character_race(
			id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Clave principal de la tabla.',
			id_character INT NOT NULL COMMENT 'Clave foránea de la tabla character.',
			id_race INT NOT NULL COMMENT 'Clave foránea de la tabla race.',
			
			CONSTRAINT FK_id_character_race FOREIGN KEY (id_character)
				REFERENCES sql_coder_rpg.character(id)
		);
		
		
		-- achievement table CREATE
		CREATE TABLE IF NOT EXISTS
			sql_coder_rpg.achievement(
				id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Clave principal de la tabla e id del logro.',
				name_achivement VARCHAR(100) NOT NULL COMMENT 'Nombre del logro.',
				description_achievent VARCHAR(500) NOT NULL COMMENT 'Una descripción completa del logro.',
				points_achievent INT NOT NULL DEFAULT(0) COMMENT 'Puntos que se obtienen al obtener el logro.'
			);
	
	
	
		-- character_achievent table CREATE
		CREATE TABLE IF NOT EXISTS
			sql_coder_rpg.character_achievent(
				id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Clave principal de la tabla.',
				id_character INT NOT NULL COMMENT 'Es la clave foránea de la tabla characters.',
				id_achievent INT NOT NULL COMMENT 'Es la clave foránea de la tabla achievement.',
				
				CONSTRAINT FK_id_character_achievent FOREIGN KEY (id_character)
					REFERENCES sql_coder_rpg.character(id),
				CONSTRAINT FK_id_achievent FOREIGN KEY (id_achievent)
					REFERENCES sql_coder_rpg.achievement(id)
			);
	
	
	
		-- item table CREATE
		CREATE TABLE IF NOT EXISTS
			sql_coder_rpg.item(
				id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Clave principal de la tabla e id del item.',
				name VARCHAR(255) NOT NULL COMMENT 'Nombre del item.',
				description VARCHAR(1000) NOT NULL COMMENT 'Descripción completa del item.',
				is_equipable TINYINT NOT NULL DEFAULT(0) COMMENT 'Esto indica si este item es equipable.',
				quality TINYINT NOT NULL DEFAULT(0) COMMENT 'Esta tabla indica la calidad del item, va de 0 a 4.',
				
				INDEX(name)
			);
		
	

		-- quest table CREATE
		CREATE TABLE IF NOT EXISTS 
			sql_coder_rpg.quest(
				id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Clave principal de la tabla e id de la misión.',
				name VARCHAR(300) NOT NULL COMMENT 'Nombre de la misión.',
				description VARCHAR(1000) NOT NULL COMMENT 'Descripción completa de la misión.',
				xp_reward INT NOT NULL DEFAULT(0) COMMENT 'Cantidad de experiencia que se obtiene con la misión.',
				item_reward INT COMMENT 'Clave foránea de la tabla item, campo en el cual dice si la quest tiene un item de recompensa.',
				
				INDEX(name),
				CONSTRAINT FK_item_reward FOREIGN KEY (item_reward)
					REFERENCES sql_coder_rpg.item(id)
			);
			
			
			-- character_quest table CREATE
			CREATE TABLE IF NOT EXISTS 
				sql_coder_rpg.character_quest(
					id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Clave principal de la tabla.',
					id_character INT NOT NULL COMMENT 'Es la clave foránea de la tabla characters.',
					id_quest INT NOT NULL COMMENT 'Clave foránea del listado de misiones del juego.',
					claimed TINYINT DEFAULT(0) NOT NULL COMMENT 'Declaración de si la misión está completa o no.',
				
				CONSTRAINT FK_id_character_quest FOREIGN KEY (id_character)
					REFERENCES sql_coder_rpg.character(id),
				CONSTRAINT FK_id_quest FOREIGN KEY (id_quest)
					REFERENCES sql_coder_rpg.quest(id)
				);
	
	
	
			-- character_bag table CREATE
			CREATE TABLE IF NOT EXISTS 
				sql_coder_rpg.character_bag(
					id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Clave principal de la tabla.',
					id_character INT NOT NULL COMMENT 'Es la clave foránea de la tabla characters.',
					slot_1 INT COMMENT 'Espacio 1 de la bolsa FK de Item',
					slot_2 INT COMMENT 'Espacio 2 de la bolsa FK de Item',
					slot_3 INT COMMENT 'Espacio 3 de la bolsa FK de Item',
					slot_4 INT COMMENT 'Espacio 4 de la bolsa FK de Item',
					slot_5 INT COMMENT 'Espacio 5 de la bolsa FK de Item',
					
					CONSTRAINT FK_id_character_bag FOREIGN KEY (id_character)
						REFERENCES sql_coder_rpg.character(id),
					CONSTRAINT FK_slot_1 FOREIGN KEY (slot_1)
						REFERENCES sql_coder_rpg.item(id),
					CONSTRAINT FK_slot_2 FOREIGN KEY (slot_2)
						REFERENCES sql_coder_rpg.item(id),
					CONSTRAINT FK_slot_3 FOREIGN KEY (slot_3)
						REFERENCES sql_coder_rpg.item(id),
					CONSTRAINT FK_slot_4 FOREIGN KEY (slot_4)
						REFERENCES sql_coder_rpg.item(id),
					CONSTRAINT FK_slot_5 FOREIGN KEY (slot_5)
						REFERENCES sql_coder_rpg.item(id)						
				);	
		
	
				-- character_equipament table CREATE
			CREATE TABLE IF NOT EXISTS 
				sql_coder_rpg.character_equipament(
					id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Clave principal de la tabla.',
					id_character INT NOT NULL COMMENT 'Es la clave foránea de la tabla characters.',
					head INT COMMENT 'Ranura de cabeza del equipamento',
					chest INT COMMENT 'Ranura de pecho del equipamento',
					legs INT COMMENT 'Ranura de piernas del equipamento',
					weapon INT COMMENT 'Ranura de arma del equipamento',
					off_hand INT COMMENT 'Ranura de arma secundaria del equipamento',
					
					CONSTRAINT FK_id_character_equipament FOREIGN KEY (id_character)
						REFERENCES sql_coder_rpg.character(id),
					CONSTRAINT FK_head FOREIGN KEY (head)
						REFERENCES sql_coder_rpg.item(id),
					CONSTRAINT FK_chest FOREIGN KEY (chest)
						REFERENCES sql_coder_rpg.item(id),
					CONSTRAINT FK_legs FOREIGN KEY (legs)
						REFERENCES sql_coder_rpg.item(id),
					CONSTRAINT FK_weapon FOREIGN KEY (weapon)
						REFERENCES sql_coder_rpg.item(id),
					CONSTRAINT FK_off_hand FOREIGN KEY (off_hand)
						REFERENCES sql_coder_rpg.item(id)						
				);	
				
				
			-- character_statics table CREATE
			CREATE TABLE IF NOT EXISTS 
				sql_coder_rpg.character_statics(		
					id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Clave principal de la tabla.',
					id_character INT NOT NULL COMMENT 'Es la clave foránea de la tabla characters.',
					life INT NOT NULL DEFAULT(1) COMMENT 'Vida del personaje.',
					total_energy INT NOT NULL DEFAULT(1) COMMENT 'Energia total del personaje para lanzar hechizos.',
					defense INT NOT NULL DEFAULT(1) COMMENT 'Defensa del personaje, esto reduce el daño a la vida de los hechizos.',
					atack INT NOT NULL DEFAULT(1) COMMENT 'Ataque del personaje, afecta el daño que producen los hechizos.',
					
					CONSTRAINT FK_id_character_statics FOREIGN KEY (id_character)
						REFERENCES sql_coder_rpg.character(id)
				);	
				
				
			-- mount table CREATE
			CREATE TABLE IF NOT EXISTS 
				sql_coder_rpg.mount(		
					id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Clave principal de la tabla.',
					name VARCHAR(100) NOT NULL COMMENT 'Nombre de la montura.',
					speed FLOAT NOT NULL COMMENT 'Velocidad de la montura.',
					rarity INT NOT NULL DEFAULT(0) COMMENT 'Rareza de la montura va desde 0 a 3.',
					passengers INT NOT NULL DEFAULT(1) COMMENT 'Cantidad de pasajeros que permite llevar la montura, máximo 5.',
					
					INDEX(name)
				);	
				
				
			-- character_mount table CREATE
			CREATE TABLE IF NOT EXISTS 
				sql_coder_rpg.character_mount(		
					id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Clave principal de la tabla.',
					id_character INT NOT NULL COMMENT 'Clave foránea que referencia el personaje al que pertenece la montura.',
					id_mount INT NOT NULL COMMENT 'Clave foránea que referencia a la montura.',
					
					CONSTRAINT FK_id_character_mount FOREIGN KEY (id_character)
						REFERENCES sql_coder_rpg.character(id),
					CONSTRAINT FK_id_mount FOREIGN KEY (id_mount)
						REFERENCES sql_coder_rpg.mount(id)
				);	