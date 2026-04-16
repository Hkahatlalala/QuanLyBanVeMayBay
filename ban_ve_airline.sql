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
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `IATA_code` char(2) DEFAULT NULL,
  `contact_info` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IATA_code` (`IATA_code`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES (1,'Vietnam Airlines','VN','1900 1100','Vietnam'),(2,'Vietjet Air','VJ','1900 1886','Vietnam'),(3,'Bamboo Airways','QH','1900 1166','Vietnam'),(4,'Vietravel Airlines','VU','1900 6686','Vietnam'),(5,'Pacific Airlines','BL','1900 1550','Vietnam'),(6,'Vasco','0V','028 3833 3033','Vietnam'),(7,'Thai Airways','TG','+66 2356 1111','Thailand'),(8,'Singapore Airlines','SQ','+65 6223 8888','Singapore'),(9,'Cathay Pacific','CX','+852 2747 3333','Hong Kong'),(10,'Emirates','EK','+971 600 555555','UAE'),(11,'Qatar Airways','QR','+974 4023 0000','Qatar'),(12,'Korean Air','KE','+82 2 2656 2000','South Korea'),(13,'Japan Airlines','JL','+81 3 6733 3062','Japan'),(14,'All Nippon Airways','NH','+81 3 6741 1120','Japan'),(15,'China Southern Airlines','CZ','+86 400 869 5539','China'),(16,'AirAsia','AK','+60 3 8660 4333','Malaysia'),(17,'Eva Air','BR','+886 2 2501 1999','Taiwan'),(18,'Turkish Airlines','TK','+90 212 463 63 63','Turkey'),(19,'Lufthansa','LH','+49 69 86 799 799','Germany'),(20,'Qantas','QF','+61 2 9691 3636','Australia'),(21,'Air France','AF','+33 9 69 39 36 54','France'),(22,'British Airways','BA','+44 344 493 0787','United Kingdom'),(23,'KLM Royal Dutch Airlines','KL','+31 20 474 7747','Netherlands'),(24,'Delta Air Lines','DL','+1 800 221 1212','United States'),(25,'United Airlines','UA','+1 800 864 8331','United States'),(26,'American Airlines','AA','+1 800 433 7300','United States'),(27,'Southwest Airlines','WN','+1 800 435 9792','United States'),(28,'Air Canada','AC','+1 888 247 2262','Canada'),(29,'WestJet','WS','+1 888 937 8538','Canada'),(30,'JetBlue Airways','B6','+1 800 538 2583','United States'),(31,'Alaska Airlines','AS','+1 800 252 7522','United States'),(32,'Hawaiian Airlines','HA','+1 800 367 5320','United States'),(33,'Aeromexico','AM','+52 55 5133 4000','Mexico'),(34,'LATAM Airlines','LA','+56 2 2526 2000','Chile'),(35,'Avianca','AV','+57 1 401 3434','Colombia'),(36,'Copa Airlines','CM','+507 210 6888','Panama'),(37,'Aerolineas Argentinas','AR','+54 11 4340 7777','Argentina'),(38,'Iberia','IB','+34 900 111 500','Spain'),(39,'Air Europa','UX','+34 911 401 501','Spain'),(40,'Vueling','VY','+34 900 167 167','Spain'),(41,'ITA Airways','AZ','+39 06 85960020','Italy'),(42,'Swiss International Air Lines','LX','+41 848 700 700','Switzerland'),(43,'Austrian Airlines','OS','+43 5 1766 1000','Austria'),(44,'SAS Scandinavian Airlines','SK','+46 8 797 4000','Sweden'),(45,'Finnair','AY','+358 300 871 161','Finland'),(46,'Aer Lingus','EI','+353 1 886 8989','Ireland'),(47,'Ryanair','FR','+353 1 582 5932','Ireland'),(48,'easyJet','U2','+44 330 551 5151','United Kingdom'),(49,'Virgin Atlantic','VS','+44 344 874 7747','United Kingdom'),(50,'TAP Air Portugal','TP','+351 21 843 11 00','Portugal'),(51,'LOT Polish Airlines','LO','+48 22 577 77 55','Poland'),(52,'Aegean Airlines','A3','+30 210 6261000','Greece'),(53,'Saudia','SV','+966 9200 22222','Saudi Arabia'),(54,'Etihad Airways','EY','+971 600 555 666','UAE'),(55,'Oman Air','WY','+968 2453 1111','Oman'),(56,'Gulf Air','GF','+973 1737 3737','Bahrain'),(57,'Kuwait Airways','KU','+965 2434 5555','Kuwait'),(58,'Middle East Airlines','ME','+961 1 629 999','Lebanon'),(59,'Royal Jordanian','RJ','+962 6 510 0000','Jordan'),(60,'EgyptAir','MS','+20 2 2727 4238','Egypt'),(61,'Ethiopian Airlines','ET','+251 11 665 6666','Ethiopia'),(62,'Kenya Airways','KQ','+254 20 327 4747','Kenya'),(63,'South African Airways','SA','+27 11 978 1111','South Africa'),(64,'Royal Air Maroc','AT','+212 5 22 48 97 97','Morocco'),(65,'Air Algerie','AH','+213 21 98 63 63','Algeria'),(66,'Tunisair','TU','+216 70 101 300','Tunisia'),(67,'Air India','AI','+91 124 264 1407','India'),(68,'IndiGo','6E','+91 9910 383 838','India'),(69,'SpiceJet','SG','+91 9871 803 333','India'),(70,'Vistara','UK','+91 9289 228 888','India'),(71,'SriLankan Airlines','UL','+94 117 771 979','Sri Lanka'),(72,'Biman Bangladesh','BG','+880 2 8901600','Bangladesh'),(73,'Pakistan International Airlines','PK','+92 21 111 786 786','Pakistan'),(74,'Garuda Indonesia','GA','+62 21 2351 9999','Indonesia'),(75,'Lion Air','JT','+62 21 6379 8000','Indonesia'),(76,'Malaysia Airlines','MH','+60 3 7843 3000','Malaysia'),(77,'Philippine Airlines','PR','+63 2 8855 8888','Philippines'),(78,'Cebu Pacific','5J','+63 2 8702 0888','Philippines'),(79,'Thai AirAsia','FD','+66 2 515 9999','Thailand'),(80,'Bangkok Airways','PG','+66 2 270 6699','Thailand'),(81,'China Eastern Airlines','MU','+86 21 2069 5530','China'),(82,'Air China','CA','+86 10 95583','China'),(83,'Hainan Airlines','HU','+86 898 95339','China'),(84,'Shenzhen Airlines','ZH','+86 755 95361','China'),(85,'Sichuan Airlines','3U','+86 28 8888 8888','China'),(86,'XiamenAir','MF','+86 592 222 6666','China'),(87,'Asiana Airlines','OZ','+82 2 2669 8000','South Korea'),(88,'Jeju Air','7C','+82 1599 1500','South Korea'),(89,'Jin Air','LJ','+82 1600 6200','South Korea'),(90,'Tway Air','TW','+82 1688 8686','South Korea'),(91,'Air New Zealand','NZ','+64 9 357 3000','New Zealand'),(92,'Jetstar Airways','JQ','+61 3 9645 5999','Australia'),(93,'Virgin Australia','VA','+61 7 3295 2296','Australia'),(94,'Fiji Airways','FJ','+679 672 0777','Fiji'),(95,'Air Niugini','PX','+675 327 3444','Papua New Guinea'),(96,'Air Tahiti Nui','TN','+689 40 46 03 03','French Polynesia'),(97,'Aeroflot','SU','+7 495 223 55 55','Russia'),(98,'S7 Airlines','S7','+7 495 777 99 99','Russia'),(99,'Uzbekistan Airways','HY','+998 71 140 02 00','Uzbekistan'),(100,'Air Astana','KC','+7 727 244 44 77','Kazakhstan');
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-16 21:38:48
