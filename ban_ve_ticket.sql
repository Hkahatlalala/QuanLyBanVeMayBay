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
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `seat_no` varchar(5) DEFAULT NULL,
  `seat_class` varchar(20) DEFAULT NULL,
  `type` enum('one_way','round_trip','multi_city') DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `status` enum('booked','completed','cancelled') DEFAULT NULL,
  `reservation_id` int DEFAULT NULL,
  `passenger_id` int DEFAULT NULL,
  `flight_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flight_id` (`flight_id`,`seat_no`),
  KEY `reservation_id` (`reservation_id`),
  KEY `passenger_id` (`passenger_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'11A','business','round_trip',4500000.00,'booked',1,1,138),(2,'23B','business','round_trip',4500000.00,'booked',2,1,92),(3,'29A','economy','round_trip',1500000.00,'cancelled',3,2,116),(4,'10D','economy','round_trip',1500000.00,'cancelled',4,2,78),(5,'1D','business','round_trip',4500000.00,'booked',5,3,138),(6,'17F','first','round_trip',7500000.00,'booked',6,3,69),(7,'6C','business','round_trip',4500000.00,'booked',7,4,136),(8,'13E','first','round_trip',7500000.00,'booked',8,4,122),(9,'8D','business','one_way',4500000.00,'cancelled',9,5,115),(10,'18E','business','one_way',4500000.00,'cancelled',9,6,115),(11,'25D','first','round_trip',7500000.00,'booked',10,7,109),(12,'2A','first','round_trip',7500000.00,'booked',10,8,109),(13,'26C','business','round_trip',4500000.00,'booked',11,7,101),(14,'22C','business','round_trip',4500000.00,'booked',11,8,101),(15,'14A','economy','multi_city',1500000.00,'completed',12,9,40),(16,'26E','economy','multi_city',1500000.00,'completed',12,10,40),(17,'13A','economy','multi_city',1500000.00,'completed',12,11,40),(18,'18F','economy','multi_city',1500000.00,'completed',12,12,40),(19,'2E','first','multi_city',7500000.00,'completed',13,9,85),(20,'11D','first','multi_city',7500000.00,'completed',13,10,85),(21,'12A','first','multi_city',7500000.00,'completed',13,11,85),(22,'21F','first','multi_city',7500000.00,'completed',13,12,85),(23,'25E','economy','round_trip',1500000.00,'cancelled',14,13,131),(24,'25D','business','round_trip',4500000.00,'cancelled',15,13,126),(25,'2F','first','multi_city',7500000.00,'booked',16,14,106),(26,'5D','first','multi_city',7500000.00,'booked',16,15,106),(27,'22A','first','multi_city',7500000.00,'booked',16,16,106),(28,'14A','business','multi_city',4500000.00,'completed',17,14,87),(29,'6E','business','multi_city',4500000.00,'completed',17,15,87),(30,'11E','business','multi_city',4500000.00,'completed',17,16,87),(31,'9E','economy','round_trip',1500000.00,'booked',18,17,109),(32,'2E','first','round_trip',7500000.00,'booked',19,17,132),(33,'3C','business','multi_city',4500000.00,'booked',20,18,137),(34,'18E','business','multi_city',4500000.00,'booked',20,19,137),(35,'24D','first','multi_city',7500000.00,'completed',21,18,42),(36,'25A','first','multi_city',7500000.00,'completed',21,19,42),(37,'29E','economy','multi_city',1500000.00,'booked',22,20,73),(38,'20D','economy','multi_city',1500000.00,'booked',22,21,73),(39,'11F','economy','multi_city',1500000.00,'booked',22,22,73),(40,'19A','economy','multi_city',1500000.00,'booked',22,23,73),(41,'11C','first','multi_city',7500000.00,'booked',23,20,80),(42,'7D','first','multi_city',7500000.00,'booked',23,21,80),(43,'11B','first','multi_city',7500000.00,'booked',23,22,80),(44,'27B','first','multi_city',7500000.00,'booked',23,23,80),(45,'3C','business','round_trip',4500000.00,'booked',24,24,104),(46,'4C','business','round_trip',4500000.00,'booked',24,25,104),(47,'17E','business','round_trip',4500000.00,'booked',24,26,104),(48,'11A','business','round_trip',4500000.00,'booked',24,27,104),(49,'4D','business','round_trip',4500000.00,'booked',25,24,63),(50,'19F','business','round_trip',4500000.00,'booked',25,25,63),(51,'11B','business','round_trip',4500000.00,'booked',25,26,63),(52,'21D','business','round_trip',4500000.00,'booked',25,27,63),(53,'6A','economy','multi_city',1500000.00,'booked',26,28,61),(54,'1D','economy','multi_city',1500000.00,'booked',26,29,61),(55,'22D','economy','multi_city',1500000.00,'booked',26,30,61),(56,'18B','first','multi_city',7500000.00,'booked',27,28,122),(57,'25B','first','multi_city',7500000.00,'booked',27,29,122),(58,'24C','first','multi_city',7500000.00,'booked',27,30,122),(59,'1A','business','round_trip',4500000.00,'booked',28,31,137),(60,'18F','business','round_trip',4500000.00,'booked',29,31,133),(61,'11C','premium','round_trip',2250000.00,'booked',30,31,114);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
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
