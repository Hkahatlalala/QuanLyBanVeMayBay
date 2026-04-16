CREATE DATABASE  IF NOT EXISTS `ban_ve` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ban_ve`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: ban_ve
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `status` enum('pending','confirmed','cancelled') DEFAULT NULL,
  `customer_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reservation_ibfk_1` (`customer_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2026-03-24 16:21:00','confirmed','C35115'),(2,'2026-04-12 18:29:00','confirmed','C35115'),(3,'2026-04-03 13:21:00','confirmed','C44702'),(4,'2026-03-27 18:31:00','confirmed','C44702'),(5,'2026-04-04 12:47:00','confirmed','C44702'),(6,'2026-03-22 17:21:00','confirmed','C44702'),(7,'2026-04-06 17:15:00','confirmed','C29493'),(8,'2026-04-05 13:21:00','cancelled','C02646'),(9,'2026-04-14 09:27:00','cancelled','C02646'),(10,'2026-04-08 19:42:00','confirmed','C25118'),(11,'2026-03-12 16:32:00','confirmed','C25118'),(12,'2026-04-10 13:20:00','confirmed','C99166'),(13,'2026-04-05 10:14:00','confirmed','C39029'),(14,'2026-04-11 14:14:00','confirmed','C39029'),(15,'2026-03-23 15:40:00','confirmed','C40994'),(16,'2026-03-22 19:25:00','cancelled','C91988'),(17,'2026-04-01 16:11:00','cancelled','C91988'),(18,'2026-03-21 20:30:00','confirmed','C91988'),(19,'2026-04-01 10:48:00','confirmed','C09258'),(20,'2026-04-08 15:39:00','confirmed','C09258'),(21,'2026-03-18 14:11:00','confirmed','C90005'),(22,'2026-04-04 16:13:00','confirmed','C53268'),(23,'2026-04-12 11:29:00','confirmed','C53268'),(24,'2026-04-05 10:48:00','confirmed','C85965'),(25,'2026-03-21 08:35:00','confirmed','C85965'),(26,'2026-04-03 14:26:00','cancelled','C85965'),(27,'2026-04-03 14:26:00','cancelled','C85965'),(28,'2026-03-19 16:47:00','confirmed','C79520'),(29,'2026-03-19 16:47:00','confirmed','C79520'),(30,'2026-03-11 11:15:00','confirmed','C68670');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-16 21:38:49
