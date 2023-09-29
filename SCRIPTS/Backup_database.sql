/*
    TABLAS DE LA BASE DE DATOS
    account
    account_logs
    achievement
    character
    character_achievent
    character_bag
    character_class
    character_delete_backup
    character_equipament
    character_mount
    character_quest
    character_race
    character_statics
    class
    item
    mount
    quest
    race
    spell
    spell_type
*/


CREATE DATABASE  IF NOT EXISTS `sql_coder_rpg` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sql_coder_rpg`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: sql_coder_rpg
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'racknaro','password123','2023-08-02 04:48:59','2023-08-02 04:48:59',0),(2,'racknaro2','password321','2023-08-02 04:48:59','2023-08-02 04:48:59',0),(7,'nuevo_usuario','nueva_contraseña','2023-09-10 05:38:35','2023-09-10 05:38:35',0),(9,'nuevo_usuario_3','contraseña','2023-09-13 06:11:19','2023-09-13 06:11:19',0);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `account_logs`
--

LOCK TABLES `account_logs` WRITE;
/*!40000 ALTER TABLE `account_logs` DISABLE KEYS */;
INSERT INTO `account_logs` VALUES (1,'root@localhost','nuevo_usuario_3','Creación de cuenta','2023-09-13','01:11:19');
/*!40000 ALTER TABLE `account_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `achievement`
--

LOCK TABLES `achievement` WRITE;
/*!40000 ALTER TABLE `achievement` DISABLE KEYS */;
INSERT INTO `achievement` VALUES (1,'Maestro viajero','Vaiaja por todos los reinos del servidor',100),(2,'Luchador Brutal','Gana 10 arenas seguidas',50);
/*!40000 ALTER TABLE `achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `character`
--

LOCK TABLES `character` WRITE;
/*!40000 ALTER TABLE `character` DISABLE KEYS */;
INSERT INTO `character` VALUES (1,0,1,'character1',35,0,1,1),(2,0,1,'character2',20,0,2,1),(3,0,1,'Personaje editado',100,0,1,0),(5,1500,7,'Personaje2',800,4800,2,1),(6,0,1,'character3',35,0,1,1),(13,5500,10,'Personaje5',900,60,2,1);
/*!40000 ALTER TABLE `character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `character_achievent`
--

LOCK TABLES `character_achievent` WRITE;
/*!40000 ALTER TABLE `character_achievent` DISABLE KEYS */;
INSERT INTO `character_achievent` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `character_achievent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `character_bag`
--

LOCK TABLES `character_bag` WRITE;
/*!40000 ALTER TABLE `character_bag` DISABLE KEYS */;
INSERT INTO `character_bag` VALUES (1,1,1,2,3,4,5),(2,2,6,7,8,9,10);
/*!40000 ALTER TABLE `character_bag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `character_class`
--

LOCK TABLES `character_class` WRITE;
/*!40000 ALTER TABLE `character_class` DISABLE KEYS */;
INSERT INTO `character_class` VALUES (1,1,1),(2,2,3);
/*!40000 ALTER TABLE `character_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `character_delete_backup`
--

LOCK TABLES `character_delete_backup` WRITE;
/*!40000 ALTER TABLE `character_delete_backup` DISABLE KEYS */;
INSERT INTO `character_delete_backup` VALUES (1,9,1000,5,'Personaje1',500,3600,1,0,'Eliminación de personaje','root@localhost','2023-09-13','01:21:45'),(3,10,5500,10,'Personaje5',900,60,2,1,'Eliminación de personaje','root@localhost','2023-09-22','21:59:54');
/*!40000 ALTER TABLE `character_delete_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `character_equipament`
--

LOCK TABLES `character_equipament` WRITE;
/*!40000 ALTER TABLE `character_equipament` DISABLE KEYS */;
INSERT INTO `character_equipament` VALUES (1,1,1,5,9,13,17),(2,2,2,6,10,14,18);
/*!40000 ALTER TABLE `character_equipament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `character_mount`
--

LOCK TABLES `character_mount` WRITE;
/*!40000 ALTER TABLE `character_mount` DISABLE KEYS */;
INSERT INTO `character_mount` VALUES (1,1,1),(2,1,4),(3,1,6),(4,1,10),(5,1,14),(6,2,3),(7,2,7),(8,2,9),(9,2,11),(10,2,15);
/*!40000 ALTER TABLE `character_mount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `character_quest`
--

LOCK TABLES `character_quest` WRITE;
/*!40000 ALTER TABLE `character_quest` DISABLE KEYS */;
INSERT INTO `character_quest` VALUES (23,1,1,0),(24,1,2,0),(25,1,3,0),(26,1,4,0),(27,1,5,0),(28,1,6,0),(29,2,7,0),(30,2,8,0),(31,2,9,0),(32,2,10,0),(33,2,11,0),(34,2,12,0);
/*!40000 ALTER TABLE `character_quest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `character_race`
--

LOCK TABLES `character_race` WRITE;
/*!40000 ALTER TABLE `character_race` DISABLE KEYS */;
INSERT INTO `character_race` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `character_race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `character_statics`
--

LOCK TABLES `character_statics` WRITE;
/*!40000 ALTER TABLE `character_statics` DISABLE KEYS */;
INSERT INTO `character_statics` VALUES (1,1,25000,2000,10,10),(2,2,27000,1600,5,15);
/*!40000 ALTER TABLE `character_statics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'Mago',1,5,8),(2,'Guerrero',4,6,9),(3,'Cazador',2,7,11),(4,'Sacerdote',3,10,14),(5,'Ladrón',12,13,15);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Maza de guerra','Maza conseguida en arenas',1,1),(2,'Poción de salud menor','Restaura 50 puntos de salud.',0,1),(3,'Espada afilada','Una espada afilada y lista para la batalla.',1,2),(4,'Libro de hechizos','Contiene conjuros mágicos de nivel básico.',0,1),(5,'Armadura de cuero','Protección ligera hecha de cuero resistente.',1,2),(6,'Amuleto del poder','Amuleto que aumenta el poder mágico del portador.',1,3),(7,'Daga envenenada','Daga con veneno mortal aplicado.',1,2),(8,'Botas de velocidad','Botas que aumentan la velocidad de movimiento.',1,2),(9,'Escudo resistente','Escudo duradero que proporciona buena defensa.',1,2),(10,'Piedra de teleportación','Permite al usuario teleportarse a lugares conocidos.',0,2),(11,'Pergamino de resurrección','Pergamino que permite resucitar a un compañero caído.',0,3),(12,'Anillo de invisibilidad','Anillo que otorga invisibilidad temporal.',1,3),(13,'Báculo de relámpagos','Báculo que invoca relámpagos poderosos.',1,3),(14,'Escudo de hielo','Escudo que bloquea ataques y congela a los atacantes.',1,3),(15,'Gema de vida','Gema mágica que restaura la salud del portador.',0,2),(16,'Martillo de la justicia','Martillo bendito que inflige daño a criaturas malignas.',1,3),(17,'Capa de invisibilidad','Capa que permite al usuario volverse invisible.',1,3),(18,'Arco de precisión','Arco que aumenta la precisión de los disparos.',1,2),(19,'Poción de fuerza','Aumenta temporalmente la fuerza del consumidor.',0,2),(20,'Tomo de conocimiento','Tomo que otorga puntos de experiencia al lector.',0,3),(21,'Pendiente de curación','Pendiente que regenera la salud del portador.',1,2),(22,'Maza de guerra','Maza conseguida en arenas',1,1),(23,'Poción de salud menor','Restaura 50 puntos de salud.',0,1),(24,'Espada afilada','Una espada afilada y lista para la batalla.',1,2),(25,'Libro de hechizos','Contiene conjuros mágicos de nivel básico.',0,1),(26,'Armadura de cuero','Protección ligera hecha de cuero resistente.',1,2),(27,'Amuleto del poder','Amuleto que aumenta el poder mágico del portador.',1,3),(28,'Daga envenenada','Daga con veneno mortal aplicado.',1,2),(29,'Botas de velocidad','Botas que aumentan la velocidad de movimiento.',1,2),(30,'Escudo resistente','Escudo duradero que proporciona buena defensa.',1,2),(31,'Piedra de teleportación','Permite al usuario teleportarse a lugares conocidos.',0,2),(32,'Pergamino de resurrección','Pergamino que permite resucitar a un compañero caído.',0,3),(33,'Anillo de invisibilidad','Anillo que otorga invisibilidad temporal.',1,3),(34,'Báculo de relámpagos','Báculo que invoca relámpagos poderosos.',1,3),(35,'Escudo de hielo','Escudo que bloquea ataques y congela a los atacantes.',1,3),(36,'Gema de vida','Gema mágica que restaura la salud del portador.',0,2),(37,'Martillo de la justicia','Martillo bendito que inflige daño a criaturas malignas.',1,3),(38,'Capa de invisibilidad','Capa que permite al usuario volverse invisible.',1,3),(39,'Arco de precisión','Arco que aumenta la precisión de los disparos.',1,2),(40,'Poción de fuerza','Aumenta temporalmente la fuerza del consumidor.',0,2),(41,'Tomo de conocimiento','Tomo que otorga puntos de experiencia al lector.',0,3),(42,'Pendiente de curación','Pendiente que regenera la salud del portador.',1,2);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mount`
--

LOCK TABLES `mount` WRITE;
/*!40000 ALTER TABLE `mount` DISABLE KEYS */;
INSERT INTO `mount` VALUES (1,'Dragon ancestral',120,3,2),(2,'Lobo feroz',100,2,1),(3,'Gryphon dorado',150,3,1),(4,'Tigre de sombras',130,2,1),(5,'Oso polar',110,1,2),(6,'Caballo de guerra',140,2,1),(7,'Rinoceronte blindado',100,1,2),(8,'Serpiente alada',160,3,1),(9,'Araña venenosa',90,1,1),(10,'Pantera negra',120,2,1),(11,'Fénix flamígero',180,3,1),(12,'Elefante colosal',80,0,3),(13,'Camello del desierto',100,1,2),(14,'Águila imperial',140,2,1),(15,'Jabalí salvaje',110,0,1);
/*!40000 ALTER TABLE `mount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `quest`
--

LOCK TABLES `quest` WRITE;
/*!40000 ALTER TABLE `quest` DISABLE KEYS */;
INSERT INTO `quest` VALUES (1,'Gatos voladores','Ayuda al mago loco a encontrar sus gatos voladores perdidos.',800,2),(2,'La Gran Búsqueda del Calcetín Perdido','Acompaña al aventurero en su búsqueda épica por su calcetín perdido.',1200,5),(3,'El Banquete de las Ranas','Consigue ingredientes raros para el banquete anual de las ranas.',1000,8),(4,'El Misterio del Pato Desaparecido','Investiga la misteriosa desaparición del pato de la señora Margarita.',1500,12),(5,'La Carrera de Caracoles','Prepara a los caracoles para la carrera más lenta del año.',600,6),(6,'El Festival de las Cosas Raras','Participa en el festival donde se exhiben las cosas más extrañas.',1800,11),(7,'El Unicornio Colorido','Encuentra al unicornio que solo se muestra a personas vestidas de colores.',1400,4),(8,'La Venganza de los Tomates','Ayuda a los tomates a vengarse de los agricultores.',1100,9),(9,'La Aventura del Sombrero Perdido','Sigue las pistas para encontrar el sombrero perdido del alcalde.',1700,7),(10,'El Desafío del Gato Sabio','Responde las preguntas del gato sabio para demostrar tu sabiduría.',1300,3),(11,'La Fiesta de los Duendes','Ayuda a los duendes a organizar la fiesta más ruidosa del año.',900,1),(12,'La Misión de la Galleta Gigante','Enfrenta la amenaza de la galleta gigante que devora aldeas.',2000,10),(13,'El Tesoro Enterrado del Troll','Acompaña al troll en su búsqueda del tesoro que enterró hace siglos.',1600,15),(14,'La Competencia de Hula Hula','Demuestra tus habilidades en el concurso de hula hula de la aldea.',700,13),(15,'El Secreto de las Vacas Saltarinas','Descubre por qué las vacas en el campo están saltando sin parar.',1900,14);
/*!40000 ALTER TABLE `quest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `race`
--

LOCK TABLES `race` WRITE;
/*!40000 ALTER TABLE `race` DISABLE KEYS */;
INSERT INTO `race` VALUES (1,'Mago',1),(2,'Artillero',2);
/*!40000 ALTER TABLE `race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `spell`
--

LOCK TABLES `spell` WRITE;
/*!40000 ALTER TABLE `spell` DISABLE KEYS */;
INSERT INTO `spell` VALUES (1,'Rayo eléctrico',600,1,200),(2,'Drenaje de vida',300,1,100),(3,'Bola helada',500,2,150),(4,'Lluvia ácida',700,2,250),(5,'Explosión arcana',900,2,400),(6,'Tornado de fuego',800,3,500),(7,'Terremoto',1000,3,800),(8,'Tormenta de arena',550,3,180),(9,'Invisibilidad',0,4,300),(10,'Transformación animal',0,4,350),(11,'Escudo mágico',0,4,120),(12,'Teletransportación',0,4,500),(13,'Curación menor',200,5,50),(14,'Resurrección',0,5,1000),(15,'Encantamiento de armas',0,2,80),(16,'NuevoHechizo',10,1,5);
/*!40000 ALTER TABLE `spell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `spell_type`
--

LOCK TABLES `spell_type` WRITE;
/*!40000 ALTER TABLE `spell_type` DISABLE KEYS */;
INSERT INTO `spell_type` VALUES (1,'Electro'),(2,'Fuego'),(3,'Hielo'),(4,'Naturaleza'),(5,'Oscuridad'),(6,'Sagrado');
/*!40000 ALTER TABLE `spell_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-29  0:03:20
