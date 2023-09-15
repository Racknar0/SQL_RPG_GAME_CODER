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