-- SUMA ENTRE DOS NUMEROS

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

-- funcion sumar
-- SELECT Sumar(5, 7);
SELECT character.id, character.name, Sumar(character.gold, 100) AS gold_total
FROM sql_coder_rpg.character;




-- CUADRADO

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

-- SELECT Cuadrado(4); -- Esto devolverá 16
SELECT character_statics.id, character_statics.life, Cuadrado(character_statics.life) AS life_squared
FROM sql_coder_rpg.character_statics;





-- PROMEDIO 3 NUMEROS

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

-- SELECT Promedio(10, 20, 30); -- Esto devolverá 20.00
SELECT AVG(Promedio(character.played_time, 10, 20)) AS avg_played_time
FROM sql_coder_rpg.character;






-- CONCATENAR CADENAS

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

-- SELECT ConcatenarCadenas('Hola', 'Mundo'); -- Esto devolverá 'Hola Mundo'
SELECT ConcatenarCadenas(character.name, account.username) AS full_name
FROM sql_coder_rpg.character
JOIN sql_coder_rpg.account ON character.account = account.id;





-- LONGITUD DE CADENAS

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


-- SELECT LongitudCadena('Ejemplo'); -- Esto devolverá 7
SELECT character.id, character.name, LongitudCadena(character.name) AS name_length
FROM sql_coder_rpg.character;


