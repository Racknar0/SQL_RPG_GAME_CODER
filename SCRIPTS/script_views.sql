
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