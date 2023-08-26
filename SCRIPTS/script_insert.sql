
-- Desactivar restricciones de integridad referencial
-- SET FOREIGN_KEY_CHECKS = 0;

-- Truncate de las tablas
-- TRUNCATE TABLE sql_coder_rpg.quest;
-- TRUNCATE TABLE sql_coder_rpg.quest;

-- Reactivar restricciones de integridad referencial
-- SET FOREIGN_KEY_CHECKS = 1;





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


