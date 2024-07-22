-- MySQL dump 10.13  Distrib 8.4.1, for Linux (x86_64)
--
-- Host: localhost    Database: Друзья человека
-- ------------------------------------------------------
-- Server version	8.4.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Animals`
--

DROP TABLE IF EXISTS `Animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Animals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `birth_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Animals`
--

LOCK TABLES `Animals` WRITE;
/*!40000 ALTER TABLE `Animals` DISABLE KEYS */;
INSERT INTO `Animals` VALUES (1,'Собака','2021-07-10'),(2,'Кошка','2022-10-30'),(3,'Хомяк','2022-07-29'),(4,'Верблюд','2023-05-21'),(5,'Лошадь','2022-03-14'),(6,'Осел','2022-11-04');
/*!40000 ALTER TABLE `Animals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Camels`
--

DROP TABLE IF EXISTS `Camels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Camels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pack_animal_id` int DEFAULT NULL,
  `command` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pack_animal_id` (`pack_animal_id`),
  CONSTRAINT `Camels_ibfk_1` FOREIGN KEY (`pack_animal_id`) REFERENCES `PackAnimals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Camels`
--

LOCK TABLES `Camels` WRITE;
/*!40000 ALTER TABLE `Camels` DISABLE KEYS */;
/*!40000 ALTER TABLE `Camels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cats`
--

DROP TABLE IF EXISTS `Cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domestic_animal_id` int DEFAULT NULL,
  `command` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `domestic_animal_id` (`domestic_animal_id`),
  CONSTRAINT `Cats_ibfk_1` FOREIGN KEY (`domestic_animal_id`) REFERENCES `DomesticAnimals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cats`
--

LOCK TABLES `Cats` WRITE;
/*!40000 ALTER TABLE `Cats` DISABLE KEYS */;
INSERT INTO `Cats` VALUES (1,2,'Мяукать');
/*!40000 ALTER TABLE `Cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CombinedAnimals`
--

DROP TABLE IF EXISTS `CombinedAnimals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CombinedAnimals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `command` varchar(100) DEFAULT NULL,
  `age_months` int DEFAULT NULL,
  `source_table` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CombinedAnimals`
--

LOCK TABLES `CombinedAnimals` WRITE;
/*!40000 ALTER TABLE `CombinedAnimals` DISABLE KEYS */;
INSERT INTO `CombinedAnimals` VALUES (1,'Собака','2021-07-10',NULL,NULL,'DomesticAnimals'),(2,'Кошка','2022-10-30',NULL,NULL,'DomesticAnimals'),(3,'Хомяк','2022-07-29',NULL,NULL,'DomesticAnimals'),(4,'Верблюд','2023-05-21',NULL,NULL,'PackAnimals'),(5,'Лошадь','2022-03-14',NULL,NULL,'PackAnimals'),(6,'Осел','2022-11-04',NULL,NULL,'PackAnimals'),(7,'Лошадь','2022-03-14','Иноходью',NULL,'HorsesAndDonkeys'),(8,'Осел','2022-11-04','Лежать',NULL,'HorsesAndDonkeys'),(10,'Собака','2021-07-10',NULL,36,'Молодые животные'),(11,'Кошка','2022-10-30',NULL,20,'Молодые животные'),(12,'Хомяк','2022-07-29',NULL,23,'Молодые животные'),(13,'Верблюд','2023-05-21',NULL,14,'Молодые животные'),(14,'Лошадь','2022-03-14',NULL,28,'Молодые животные'),(15,'Осел','2022-11-04',NULL,20,'Молодые животные'),(17,'Кошка','2022-10-30','Мяукать',NULL,'Cats'),(18,'Собака','2021-07-10','Сидеть',NULL,'Dogs'),(19,'Хомяк','2022-07-29','Бегать',NULL,'Hamsters');
/*!40000 ALTER TABLE `CombinedAnimals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dogs`
--

DROP TABLE IF EXISTS `Dogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dogs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domestic_animal_id` int DEFAULT NULL,
  `command` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `domestic_animal_id` (`domestic_animal_id`),
  CONSTRAINT `Dogs_ibfk_1` FOREIGN KEY (`domestic_animal_id`) REFERENCES `DomesticAnimals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dogs`
--

LOCK TABLES `Dogs` WRITE;
/*!40000 ALTER TABLE `Dogs` DISABLE KEYS */;
INSERT INTO `Dogs` VALUES (1,1,'Сидеть');
/*!40000 ALTER TABLE `Dogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DomesticAnimals`
--

DROP TABLE IF EXISTS `DomesticAnimals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DomesticAnimals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `animal_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `animal_id` (`animal_id`),
  CONSTRAINT `DomesticAnimals_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `Animals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DomesticAnimals`
--

LOCK TABLES `DomesticAnimals` WRITE;
/*!40000 ALTER TABLE `DomesticAnimals` DISABLE KEYS */;
INSERT INTO `DomesticAnimals` VALUES (1,1,'Собака'),(2,2,'Кошка'),(3,3,'Хомяк');
/*!40000 ALTER TABLE `DomesticAnimals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Donkeys`
--

DROP TABLE IF EXISTS `Donkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Donkeys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pack_animal_id` int DEFAULT NULL,
  `command` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pack_animal_id` (`pack_animal_id`),
  CONSTRAINT `Donkeys_ibfk_1` FOREIGN KEY (`pack_animal_id`) REFERENCES `PackAnimals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Donkeys`
--

LOCK TABLES `Donkeys` WRITE;
/*!40000 ALTER TABLE `Donkeys` DISABLE KEYS */;
INSERT INTO `Donkeys` VALUES (1,3,'Лежать');
/*!40000 ALTER TABLE `Donkeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hamsters`
--

DROP TABLE IF EXISTS `Hamsters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hamsters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domestic_animal_id` int DEFAULT NULL,
  `command` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `domestic_animal_id` (`domestic_animal_id`),
  CONSTRAINT `Hamsters_ibfk_1` FOREIGN KEY (`domestic_animal_id`) REFERENCES `DomesticAnimals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hamsters`
--

LOCK TABLES `Hamsters` WRITE;
/*!40000 ALTER TABLE `Hamsters` DISABLE KEYS */;
INSERT INTO `Hamsters` VALUES (1,3,'Бегать');
/*!40000 ALTER TABLE `Hamsters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Horses`
--

DROP TABLE IF EXISTS `Horses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Horses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pack_animal_id` int DEFAULT NULL,
  `command` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pack_animal_id` (`pack_animal_id`),
  CONSTRAINT `Horses_ibfk_1` FOREIGN KEY (`pack_animal_id`) REFERENCES `PackAnimals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Horses`
--

LOCK TABLES `Horses` WRITE;
/*!40000 ALTER TABLE `Horses` DISABLE KEYS */;
INSERT INTO `Horses` VALUES (1,2,'Иноходью');
/*!40000 ALTER TABLE `Horses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HorsesAndDonkeys`
--

DROP TABLE IF EXISTS `HorsesAndDonkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HorsesAndDonkeys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pack_animal_id` int DEFAULT NULL,
  `command` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pack_animal_id` (`pack_animal_id`),
  CONSTRAINT `HorsesAndDonkeys_ibfk_1` FOREIGN KEY (`pack_animal_id`) REFERENCES `PackAnimals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HorsesAndDonkeys`
--

LOCK TABLES `HorsesAndDonkeys` WRITE;
/*!40000 ALTER TABLE `HorsesAndDonkeys` DISABLE KEYS */;
INSERT INTO `HorsesAndDonkeys` VALUES (1,2,'Иноходью'),(2,3,'Лежать');
/*!40000 ALTER TABLE `HorsesAndDonkeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PackAnimals`
--

DROP TABLE IF EXISTS `PackAnimals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PackAnimals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `animal_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `animal_id` (`animal_id`),
  CONSTRAINT `PackAnimals_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `Animals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PackAnimals`
--

LOCK TABLES `PackAnimals` WRITE;
/*!40000 ALTER TABLE `PackAnimals` DISABLE KEYS */;
INSERT INTO `PackAnimals` VALUES (1,4,'Верблюд'),(2,5,'Лошадь'),(3,6,'Осел');
/*!40000 ALTER TABLE `PackAnimals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `молодые животные`
--

DROP TABLE IF EXISTS `молодые животные`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `молодые животные` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `age_months` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `молодые животные`
--

LOCK TABLES `молодые животные` WRITE;
/*!40000 ALTER TABLE `молодые животные` DISABLE KEYS */;
INSERT INTO `молодые животные` VALUES (1,'Собака','2021-07-10',36),(2,'Кошка','2022-10-30',20),(3,'Хомяк','2022-07-29',23),(4,'Верблюд','2023-05-21',14),(5,'Лошадь','2022-03-14',28),(6,'Осел','2022-11-04',20);
/*!40000 ALTER TABLE `молодые животные` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-22 18:27:47
