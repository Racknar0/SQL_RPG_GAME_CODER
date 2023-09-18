-- ENTREGA CODER

-- CREAR USUARIO camilo
CREATE USER 'camilo'@'localhost';
-- ASIGNAR PERMISOS A camilo DE LECTURA SOBRE TODAS LAS TABLAS
GRANT SELECT ON sql_coder_rpg.* TO 'camilo'@'localhost';


-- CREAR USUARIO torres
CREATE USER 'torres'@'localhost';
-- ASIGNAR PERMISOS A torres DE LECTURA, INSERCION, MODIFICACION SOBRE TODAS LAS TABLAS
GRANT SELECT, UPDATE, INSERT ON sql_coder_rpg.* TO `torres`@`localhost`;


-- REVOKAR TODOS LOS PERMISOS A torres Y camilo
REVOKE ALL ON *.* FROM `camilo`@`localhost`;
REVOKE ALL ON *.* FROM `torres`@`localhost`;

-- SABER PERMISOS
SHOW GRANTS FOR 'camilo'@'localhost';
SHOW GRANTS FOR 'torres'@'localhost';

-- VERIFICAR USUARIO CREADO
SELECT * FROM mysql.`user` WHERE User LIKE '%camilo%';
SELECT * FROM mysql.`user` WHERE User LIKE '%torres%';