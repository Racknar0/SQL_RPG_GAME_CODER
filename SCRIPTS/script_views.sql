
-- VISTA #1

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


-- VISTA #2
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
	


-- VISTA 3
CREATE OR REPLACE VIEW vista_accounts AS
	SELECT * FROM account;
	
	
-- VISTA 4
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


-- VISTA 5
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