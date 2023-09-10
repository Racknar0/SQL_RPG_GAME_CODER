USE sql_coder_rpg;

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

CALL OrdenarRegistros('character', 'name', 'ASC');
CALL OrdenarRegistros('spell', 'name', 'ASC');






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


CALL InsertarEliminarRegistro('INSERT', 'account', 'NULL, ''nuevo_usuario'', ''nueva_contraseña'', NOW(), NOW(), 0');