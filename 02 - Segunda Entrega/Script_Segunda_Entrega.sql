
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