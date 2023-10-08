
  -- [  script creado por jonathan camilo torres para el curso de SQL coderhouse  ] --

	-- DROP DATABASE sql_coder_rpg;

  -- [  CREACION DE DATABASE  ] --
	CREATE DATABASE IF NOT EXISTS sql_coder_rpg;

  -- [  CREACION DE TABLAS  ] --

  -- NOTA: TABLA DE HECHOS: podría considerarse que la tabla sql_coder_rpg.character actúa como una tabla de hechos, ya que almacena información importante sobre los personajes del juego, como su nivel, experiencia, oro, etc.
  -- NOTA: TABLA DE transaccional: sql_coder_rpg.character_achievent, sql_coder_rpg.character_ques que podría considerarse como una tabla transaccional para registrar cuándo un personaje logra un logro específico o cumpleta una mision.


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





  -- [  POBLAR LA DATABASE  ] --


-- Inserción ACCOUNT
INSERT INTO sql_coder_rpg.account (username, password, date_join, last_login, online)
VALUES
("racknaro", "password123", "2023-08-01 23:48:59", "2023-08-01 23:48:59", 0),
("racknaro2", "password321", "2023-08-01 23:48:59", "2023-08-01 23:48:59", 0);



-- Inserción CARACTER
INSERT INTO sql_coder_rpg.character (experience, level, name, gold, played_time, account, gender)
VALUES
(0, 1, "character1", 0, 0, 1, 1),
(0, 1, "character2", 0, 0, 2, 1);



-- Inserción ACHEVEMENT
INSERT INTO sql_coder_rpg.achievement (name_achivement, description_achievent, points_achievent)
VALUES
("Maestro viajero", "Vaiaja por todos los reinos del servidor", 100),
("Luchador Brutal", "Gana 10 arenas seguidas", 50);



-- Inserción CHARACTER_ACHIEVEMENT
INSERT INTO sql_coder_rpg.character_achievent(id_character, id_achievent)
VALUES
(1, 1),
(1, 2);



-- Inserción character_statics
INSERT INTO sql_coder_rpg.character_statics(id_character, life, total_energy, defense, atack)
VALUES
(1, 25000, 2000, 10, 10),
(2, 27000, 1600, 5, 15);



-- Inserción spell_type
INSERT INTO sql_coder_rpg.spell_type (name)
VALUES
("Electro"), ("Fuego"), ("Hielo"),
("Naturaleza"), ("Oscuridad"), ("Sagrado");



-- Inserción spells
INSERT INTO sql_coder_rpg.spell (name, power, id_spell_type, cost)
VALUES
("Rayo eléctrico", "600", 1, "200"),
("Drenaje de vida", "300", 1, "100"),
("Bola helada", "500", 2, "150"),
("Lluvia ácida", "700", 2, "250"),
("Explosión arcana", "900", 2, "400"),
("Tornado de fuego", "800", 3, "500"),
("Terremoto", "1000", 3, "800"),
("Tormenta de arena", "550", 3, "180"),
("Invisibilidad", "0", 4, "300"),
("Transformación animal", "0", 4, "350"),
("Escudo mágico", "0", 4, "120"),
("Teletransportación", "0", 4, "500"),
("Curación menor", "200", 5, "50"),
("Resurrección", "0", 5, "1000"),
("Encantamiento de armas", "0", 2, "80");



-- insercion race
INSERT INTO sql_coder_rpg.race (name, racial_spell) 
VALUES
("Elfo de sangre", 1),
("Throll", 2);



-- insercion character_race
INSERT INTO sql_coder_rpg.character_race (id_character, id_race) 
VALUES
(1, 1),
(2, 2);



-- Inserción de class con sus hechizos relacionados
INSERT INTO sql_coder_rpg.class (name, spell_1, spell_2, spell_3)
VALUES 
("Mago", 1, 5, 8),
("Guerrero", 4, 6, 9),
("Cazador", 2, 7, 11),
("Sacerdote", 3, 10, 14),
("Ladrón", 12, 13, 15);



-- Inserción relacion class y `character`
INSERT INTO sql_coder_rpg.character_class (id_character, id_class)
VALUES
(1, 1), (2, 3);



-- Inserción de monturas con diferentes rarezas
INSERT INTO sql_coder_rpg.mount (name, speed, rarity, passengers) 
VALUES
("Dragon ancestral", 120, 3, 2),
("Lobo feroz", 100, 2, 1),
("Gryphon dorado", 150, 3, 1),
("Tigre de sombras", 130, 2, 1),
("Oso polar", 110, 1, 2),
("Caballo de guerra", 140, 2, 1),
("Rinoceronte blindado", 100, 1, 2),
("Serpiente alada", 160, 3, 1),
("Araña venenosa", 90, 1, 1),
("Pantera negra", 120, 2, 1),
("Fénix flamígero", 180, 3, 1),
("Elefante colosal", 80, 0, 3),
("Camello del desierto", 100, 1, 2),
("Águila imperial", 140, 2, 1),
("Jabalí salvaje", 110, 0, 1);



-- Inserción monturas del personaje
INSERT INTO sql_coder_rpg.character_mount (id_character, id_mount) 
VALUES
(1, 1),
(1, 4),
(1, 6),
(1, 10),
(1, 14),
(2, 3),
(2, 7),
(2, 9),
(2, 11),
(2, 15);


-- Inserción de 20 Items con diferentes cualidades y equipabilidad
INSERT INTO sql_coder_rpg.item (name, description, is_equipable, quality)
VALUES
("Maza de guerra", "Maza conseguida en arenas", 1, 1),
("Poción de salud menor", "Restaura 50 puntos de salud.", 0, 1),
("Espada afilada", "Una espada afilada y lista para la batalla.", 1, 2),
("Libro de hechizos", "Contiene conjuros mágicos de nivel básico.", 0, 1),
("Armadura de cuero", "Protección ligera hecha de cuero resistente.", 1, 2),
("Amuleto del poder", "Amuleto que aumenta el poder mágico del portador.", 1, 3),
("Daga envenenada", "Daga con veneno mortal aplicado.", 1, 2),
("Botas de velocidad", "Botas que aumentan la velocidad de movimiento.", 1, 2),
("Escudo resistente", "Escudo duradero que proporciona buena defensa.", 1, 2),
("Piedra de teleportación", "Permite al usuario teleportarse a lugares conocidos.", 0, 2),
("Pergamino de resurrección", "Pergamino que permite resucitar a un compañero caído.", 0, 3),
("Anillo de invisibilidad", "Anillo que otorga invisibilidad temporal.", 1, 3),
("Báculo de relámpagos", "Báculo que invoca relámpagos poderosos.", 1, 3),
("Escudo de hielo", "Escudo que bloquea ataques y congela a los atacantes.", 1, 3),
("Gema de vida", "Gema mágica que restaura la salud del portador.", 0, 2),
("Martillo de la justicia", "Martillo bendito que inflige daño a criaturas malignas.", 1, 3),
("Capa de invisibilidad", "Capa que permite al usuario volverse invisible.", 1, 3),
("Arco de precisión", "Arco que aumenta la precisión de los disparos.", 1, 2),
("Poción de fuerza", "Aumenta temporalmente la fuerza del consumidor.", 0, 2),
("Tomo de conocimiento", "Tomo que otorga puntos de experiencia al lector.", 0, 3),
("Pendiente de curación", "Pendiente que regenera la salud del portador.", 1, 2);



-- Inserción de 15 misiones recompensas de ítems
INSERT INTO sql_coder_rpg.quest (name, description, xp_reward, item_reward)
VALUES
("Gatos voladores", "Ayuda al mago loco a encontrar sus gatos voladores perdidos.", 800, 2),
("La Gran Búsqueda del Calcetín Perdido", "Acompaña al aventurero en su búsqueda épica por su calcetín perdido.", 1200, 5),
("El Banquete de las Ranas", "Consigue ingredientes raros para el banquete anual de las ranas.", 1000, 8),
("El Misterio del Pato Desaparecido", "Investiga la misteriosa desaparición del pato de la señora Margarita.", 1500, 12),
("La Carrera de Caracoles", "Prepara a los caracoles para la carrera más lenta del año.", 600, 6),
("El Festival de las Cosas Raras", "Participa en el festival donde se exhiben las cosas más extrañas.", 1800, 11),
("El Unicornio Colorido", "Encuentra al unicornio que solo se muestra a personas vestidas de colores.", 1400, 4),
("La Venganza de los Tomates", "Ayuda a los tomates a vengarse de los agricultores.", 1100, 9),
("La Aventura del Sombrero Perdido", "Sigue las pistas para encontrar el sombrero perdido del alcalde.", 1700, 7),
("El Desafío del Gato Sabio", "Responde las preguntas del gato sabio para demostrar tu sabiduría.", 1300, 3),
("La Fiesta de los Duendes", "Ayuda a los duendes a organizar la fiesta más ruidosa del año.", 900, 1),
("La Misión de la Galleta Gigante", "Enfrenta la amenaza de la galleta gigante que devora aldeas.", 2000, 10),
("El Tesoro Enterrado del Troll", "Acompaña al troll en su búsqueda del tesoro que enterró hace siglos.", 1600, 15),
("La Competencia de Hula Hula", "Demuestra tus habilidades en el concurso de hula hula de la aldea.", 700, 13),
("El Secreto de las Vacas Saltarinas", "Descubre por qué las vacas en el campo están saltando sin parar.", 1900, 14);



-- Inserción de misiones para personajes
INSERT INTO sql_coder_rpg.character_quest (id_character, id_quest, claimed)
VALUES
(1, 1, 0),
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(1, 5, 0),
(1, 6, 0),
(2, 7, 0),
(2, 8, 0),
(2, 9, 0),
(2, 10, 0),
(2, 11, 0),
(2, 12, 0);



-- Inserción de equipamiento del personaje character_equipament
INSERT INTO sql_coder_rpg.character_equipament(id_character, head, chest, legs, weapon, off_hand)
VALUES
(1, 1, 5, 9, 13, 17),
(2, 2, 6, 10, 14, 18);


-- Inserción de character bags slots
INSERT INTO sql_coder_rpg.character_bag(id_character, slot_1, slot_2, slot_3, slot_4, slot_5)
VALUES
(1, 1, 2, 3, 4, 5),
(2, 6, 7, 8, 9, 10);



























  -- [  CREACION DE VISTAS  ] --



  -- VISTA #1 - vista_monturas_personajes

-- Descripción:
-- Esta vista tiene como objetivo presentar de manera clara y legible los detalles de los personajes y las monturas que poseen.

-- Objetivo:
-- Facilitar la visualización de la información de personajes y sus monturas asociadas.

-- Tablas Involucradas:

-- character: Almacena información sobre los personajes del juego.
-- character_mount: Relación que asocia personajes con las monturas que poseen.
-- mount: Contiene información detallada sobre las monturas en el juego.

CREATE OR REPLACE VIEW vista_monturas_personajes  AS
SELECT
	c.name AS nombre_personaje,
	m.name AS nombre_montura,
	m.speed AS velocidad_montura,
	m.rarity AS rareza_montura,
	m.passengers AS pasajeros_montura
FROM 
	sql_coder_rpg.character c
JOIN
	sql_coder_rpg.character_mount cm ON c.id = cm.id_character
JOIN 
	sql_coder_rpg.mount m ON cm.id_mount = m.id;


-- VISTA #2 - vista_personajes_raza

-- Descripción:
-- Esta vista tiene como objetivo mostrar los nombres de los personajes junto con sus razas correspondientes.

-- Objetivo:
-- Facilitar la obtención de información sobre la raza de cada personaje en el juego.

-- Tablas Involucradas:

-- character: Almacena información sobre los personajes del juego.
-- character_race: Relación que asocia personajes con sus razas correspondientes.
-- race: Contiene información sobre las razas disponibles en el juego.

CREATE OR REPLACE VIEW vista_personajes_raza AS
SELECT
	c.name AS nombre_personaje,
	r.name AS raza
FROM 
 	sql_coder_rpg.character c
JOIN
	sql_coder_rpg.character_race cr ON c.id = cr.id_character
JOIN
	sql_coder_rpg.race r ON cr.id_race = r.id;
	


-- VISTA #3 - vista_accounts

-- Descripción:
-- Esta vista selecciona todos los datos de la tabla "account". Sin embargo, no se proporciona una descripción detallada del objetivo específico de esta vista.

-- Objetivo:
-- Recuperar información completa sobre las cuentas o registros de cuentas en el sistema.

-- Tablas Involucradas:

-- account: Almacena información sobre cuentas de usuario u otros registros de cuentas.


CREATE OR REPLACE VIEW vista_accounts AS
	SELECT * FROM account;
	
	
-- VISTA #4 - vista_logros_personajes

-- Descripción:
-- Esta vista tiene como objetivo mostrar información relacionada con los logros (achievements) de los personajes, incluyendo detalles como el nombre del personaje, el ID del logro, el nombre del logro, la descripción del logro y los puntos del logro.

-- Objetivo:
-- Facilitar la visualización de los logros obtenidos por los personajes del juego.

-- Tablas Involucradas:

-- character: Almacena información sobre los personajes del juego.
-- character_achievement: Relación que asocia personajes con los logros que han obtenido.
-- achievement: Contiene información detallada sobre los logros disponibles en el juego.


CREATE OR REPLACE VIEW vista_logros_personajes AS
SELECT
    c.id AS id_personaje,
    c.name AS nombre_personaje,
    a.id AS id_logro,
    a.name_achivement AS nombre_logro,
    a.description_achievent AS descripcion_logro,
    a.points_achievent AS puntos_logro
FROM
    sql_coder_rpg.character c
LEFT JOIN
    sql_coder_rpg.character_achievent ca ON c.id = ca.id_character
LEFT JOIN
    sql_coder_rpg.achievement a ON ca.id_achievent = a.id;


-- VISTA #5 - vista_misiones_personajes

-- Descripción:
-- Esta vista tiene como objetivo mostrar información relacionada con las misiones (quests) que los personajes han realizado, incluyendo detalles como el nombre del personaje, el ID de la misión, el nombre de la misión, la descripción de la misión, la recompensa de experiencia (XP) y el nombre del ítem como recompensa.

-- Objetivo:
-- Facilitar la visualización de las misiones completadas por los personajes, así como las recompensas obtenidas.

-- Tablas Involucradas:

-- character: Almacena información sobre los personajes del juego.
-- character_quest: Relación que asocia personajes con las misiones que han completado.
-- quest: Contiene información detallada sobre las misiones disponibles en el juego.
-- item: Contiene información sobre los ítems que pueden ser recompensas de las misiones.


CREATE OR REPLACE VIEW vista_misiones_personajes AS
SELECT
    c.id AS id_personaje,
    c.name AS nombre_personaje,
    q.id AS id_mision,
    q.name AS nombre_mision,
    q.description AS descripcion_mision,
    q.xp_reward AS xp_recompensa,
    i.name AS nombre_item_recompensa
FROM
    sql_coder_rpg.character c
LEFT JOIN
    sql_coder_rpg.character_quest cq ON c.id = cq.id_character
LEFT JOIN
    sql_coder_rpg.quest q ON cq.id_quest = q.id
LEFT JOIN
    sql_coder_rpg.item i ON q.item_reward = i.id;














	  -- [  CREACION DE STORE PROCEDURES  ] --

USE sql_coder_rpg;


-- Procedimiento Almacenado OrdenarRegistros

-- Descripción:
-- Este procedimiento almacenado se utiliza para ordenar los registros de una tabla específica en una base de datos. Puede ordenar los registros en orden ascendente (ASC) o descendente (DESC) según un campo de orden especificado.

-- Objetivo:
-- Proporcionar una manera conveniente de ordenar los registros de una tabla en función de un campo de orden.

DROP PROCEDURE IF EXISTS OrdenarRegistros;

DELIMITER //
CREATE PROCEDURE OrdenarRegistros(
    IN tabla VARCHAR(50),        -- Nombre de la tabla a ordenar
    IN campo_orden VARCHAR(50),  -- Campo por el cual ordenar
    IN orden VARCHAR(10)         -- Orden: 'ASC' para ascendente, 'DESC' para descendente
)
BEGIN
    SET @consulta = CONCAT('SELECT * FROM `', tabla, '` ORDER BY `', campo_orden, '` ', orden);
    PREPARE stmt FROM @consulta;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
//
DELIMITER ;

-- Llamada al Procedimiento Almacenado OrdenarRegistros

-- Descripción:
-- En esta llamada al procedimiento, se utiliza el procedimiento OrdenarRegistros para ordenar los registros de dos tablas diferentes ('character' y 'spell') en orden ascendente según el campo 'name'.

CALL OrdenarRegistros('character', 'name', 'ASC');
CALL OrdenarRegistros('spell', 'name', 'ASC');




-- Procedimiento Almacenado InsertarEliminarRegistro

-- Descripción:
-- Este procedimiento almacenado se utiliza para realizar dos acciones diferentes: inserción (INSERT) y eliminación (DELETE) de registros en una tabla específica de la base de datos. Dependiendo del valor de la variable "acción", el procedimiento ejecutará una operación de inserción o eliminación.

-- Objetivo:
-- Proporcionar un procedimiento versátil que pueda realizar operaciones de inserción y eliminación en una tabla.


DROP PROCEDURE IF EXISTS InsertarEliminarRegistro;

DELIMITER //
CREATE PROCEDURE InsertarEliminarRegistro(
    IN accion VARCHAR(10),       -- Acción: 'INSERT' para inserción, 'DELETE' para eliminación
    IN tabla VARCHAR(50),        -- Nombre de la tabla
    IN valores VARCHAR(500)      -- Valores a insertar (para INSERT) o condición de eliminación (para DELETE)
)
BEGIN
    IF accion = 'INSERT' THEN
        SET @consulta = CONCAT('INSERT INTO ', tabla, ' VALUES (', valores, ')');
    ELSEIF accion = 'DELETE' THEN
        SET @consulta = CONCAT('DELETE FROM ', tabla, ' WHERE ', valores);
    END IF;

    PREPARE stmt FROM @consulta;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
//
DELIMITER ;



-- Llamada al Procedimiento Almacenado InsertarEliminarRegistro

-- Descripción:
-- En esta llamada al procedimiento, se utiliza el procedimiento InsertarEliminarRegistro para insertar un nuevo registro en la tabla 'account'. Los valores para la inserción se proporcionan en la variable "valores".

CALL InsertarEliminarRegistro('INSERT', 'account', 'NULL, ''nuevo_usuario'', ''nueva_contraseña'', NOW(), NOW(), 0');



















	  -- [  CREACION DE TRIGGERS  ] --


-- TRIGGER DE EL LOG DE LA CREACION DE LA TABLA ACCOUNT

-- Script de la creacion de la tabla account_logs
CREATE TABLE IF NOT EXISTS account_logs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    mysql_user VARCHAR(50) NOT NULL COMMENT 'Usuario de MySQL que realizó la operación',
    username VARCHAR(20) NOT NULL COMMENT 'Usuario que realizó la acción',
    action VARCHAR(255) NOT NULL COMMENT 'Acción realizada',
    date DATE NOT NULL COMMENT 'Fecha en que se realizó la acción',
    time TIME NOT NULL COMMENT 'Hora en que se realizó la acción'
);



DELIMITER //
CREATE TRIGGER account_creation_log
AFTER INSERT
ON account
FOR EACH ROW
BEGIN
    INSERT INTO account_logs (mysql_user, username, action, date, time)
    VALUES (CURRENT_USER(), NEW.username, 'Creación de cuenta', CURDATE(), CURTIME());
END;
//
DELIMITER ;


-- Inserta una nueva cuenta en la tabla 'account'
INSERT INTO account (username, password, date_join, last_login, online)
VALUES ('nuevo_usuario_3', 'contraseña', NOW(), NOW(), 0);



-- TRIGGER DE EL BACKUP DE LA ELIMINACION DE LA TABLA CHARACTER

-- Script de la creacion de la tabla character_delete_backup
CREATE TABLE IF NOT EXISTS character_delete_backup (
    id INT PRIMARY KEY AUTO_INCREMENT,
    character_id INT NOT NULL COMMENT 'ID del personaje',
    experience INT NOT NULL COMMENT 'Experiencia del personaje',
    level INT NOT NULL COMMENT 'Nivel del personaje',
    name VARCHAR(30) NOT NULL COMMENT 'Nombre del personaje',
    gold INT NOT NULL COMMENT 'Oro del personaje',
    played_time INT NOT NULL COMMENT 'Tiempo total de juego del personaje en segundos',
    account INT NOT NULL COMMENT 'ID de cuenta asociada al personaje',
    gender TINYINT NOT NULL COMMENT 'Género del personaje (0 para Macho, 1 para Hembra)',
    action VARCHAR(255) NOT NULL COMMENT 'Acción realizada (por ejemplo, "Eliminación de personaje")',
    user_who_deleted VARCHAR(50) NOT NULL COMMENT 'Usuario de MySQL que realizó la acción',
    date DATE NOT NULL COMMENT 'Fecha de la acción',
    time TIME NOT NULL COMMENT 'Hora de la acción'
);


DELIMITER //
CREATE TRIGGER character_delete_backup_trigger
BEFORE DELETE
ON sql_coder_rpg.character
FOR EACH ROW
BEGIN
    INSERT INTO character_delete_backup (character_id, experience, level, name, gold, played_time, account, gender, action, user_who_deleted, date, time)
    VALUES (OLD.id, OLD.experience, OLD.level, OLD.name, OLD.gold, OLD.played_time, OLD.account, OLD.gender, 'Eliminación de personaje', CURRENT_USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;


-- Insertar el primer personaje
INSERT INTO sql_coder_rpg.character (experience, level, name, gold, played_time, account, gender)
VALUES (1000, 5, 'Personaje1', 500, 3600, 1, 0);

-- Insertar el segundo personaje
INSERT INTO sql_coder_rpg.character (experience, level, name, gold, played_time, account, gender)
VALUES (1500, 7, 'Personaje2', 800, 4800, 2, 1);

-- Eliminar el personaje "Personaje1"
DELETE FROM sql_coder_rpg.character
WHERE name = 'Personaje1';

-- Eliminar el personaje "Personaje2"
DELETE FROM sql_coder_rpg.character
WHERE name = 'Personaje2';






















	  -- [  CREACION DE FUNCIONES  ] --



-- Función SUMAR ORO A UN PERSONAJE

-- Descripción:
-- Esta función tiene como objetivo sumar una cantidad específica de oro a la cantidad de oro actual de un personaje en el juego.

-- Objetivo:
-- Proporcionar una función que permita aumentar la cantidad de oro de un personaje en el juego.

DELIMITER //

CREATE FUNCTION Sumar(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE resultado INT;
    SET resultado = a + b;
    RETURN resultado;
END;
//

DELIMITER ;

SELECT character.id, character.name, Sumar(character.gold, 100) AS gold_total
FROM sql_coder_rpg.character;


-- Función ELEVAR AL CUADRADO LA VIDA DE UN PERSONAJE

-- Descripción:
-- Esta función tiene como objetivo calcular el cuadrado del valor de vida de un personaje en el juego.

-- Objetivo:
-- Proporcionar una función que calcule el cuadrado de la vida de un personaje en el juego.

DELIMITER //

CREATE FUNCTION Cuadrado(numero INT)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE resultado INT;
    SET resultado = numero * numero;
    RETURN resultado;
END;
//

DELIMITER ;

SELECT character_statics.id, character_statics.life, Cuadrado(character_statics.life) AS life_squared
FROM sql_coder_rpg.character_statics;



-- Función OBTENER EL PROMEDIO DE TIEMPO JUGADO DE UN PERSONAJE

-- Descripción:
-- Esta función tiene como objetivo calcular el promedio del tiempo jugado por un personaje en el juego. Toma tres valores como entrada y calcula el promedio de tiempo jugado.

-- Objetivo:
-- Proporcionar una función que calcule el promedio del tiempo jugado por un personaje en el juego

DELIMITER //

CREATE FUNCTION Promedio(a INT, b INT, c INT)
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(10,2);
    SET promedio = (a + b + c) / 3;
    RETURN promedio;
END;
//

DELIMITER ;

SELECT AVG(Promedio(character.played_time, 10, 20)) AS avg_played_time
FROM sql_coder_rpg.character;






-- Función CONCATENAR EL NOMBRE DE UN PERSONAJE CON EL NOMBRE DE SU CUENTA

-- Descripción:
-- Esta función tiene como objetivo concatenar el nombre de un personaje con el nombre de su cuenta de usuario en el juego.

-- Objetivo:
-- Proporcionar una función que combine el nombre de un personaje con el nombre de su cuenta de usuario.

DELIMITER //

CREATE FUNCTION ConcatenarCadenas(cadena1 VARCHAR(255), cadena2 VARCHAR(255))
RETURNS VARCHAR(510) DETERMINISTIC
BEGIN
    DECLARE resultado VARCHAR(510);
    SET resultado = CONCAT(cadena1, ' ', cadena2);
    RETURN resultado;
END;
//

DELIMITER ;

SELECT ConcatenarCadenas(character.name, account.username) AS full_name
FROM sql_coder_rpg.character
JOIN sql_coder_rpg.account ON character.account = account.id;





-- Función OBTENER LA LONGITUD DEL NOMBRE DE UN PERSONAJE

-- Descripción:
-- Esta función tiene como objetivo calcular la longitud (número de caracteres) del nombre de un personaje en el juego.

-- Objetivo:
-- Proporcionar una función que determine la longitud del nombre de un personaje en el juego.

DELIMITER //

CREATE FUNCTION LongitudCadena(cadena VARCHAR(255))
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE longitud INT;
    SET longitud = LENGTH(cadena);
    RETURN longitud;
END;
//

DELIMITER ;

SELECT character.id, character.name, LongitudCadena(character.name) AS name_length
FROM sql_coder_rpg.character;


