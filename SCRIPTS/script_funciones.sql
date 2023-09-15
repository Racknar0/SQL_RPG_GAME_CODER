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


