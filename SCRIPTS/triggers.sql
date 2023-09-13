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