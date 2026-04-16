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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Hà Nội','Vietnam'),(2,'TP Hồ Chí Minh','Vietnam'),(3,'Đà Nẵng','Vietnam'),(4,'Nha Trang','Vietnam'),(5,'Phú Quốc','Vietnam'),(6,'Hải Phòng','Vietnam'),(7,'Huế','Vietnam'),(8,'Cần Thơ','Vietnam'),(9,'Đà Lạt','Vietnam'),(10,'Quy Nhơn','Vietnam'),(11,'Vinh','Vietnam'),(12,'Singapore','Singapore'),(13,'Bangkok','Thailand'),(14,'Seoul','South Korea'),(15,'Tokyo','Japan'),(16,'Beijing','China'),(17,'Shanghai','China'),(18,'Guangzhou','China'),(19,'Taipei','Taiwan'),(20,'Hong Kong','Hong Kong'),(21,'Macau','Macau'),(22,'Osaka','Japan'),(23,'Fukuoka','Japan'),(24,'Kuala Lumpur','Malaysia'),(25,'Jakarta','Indonesia'),(26,'Bali','Indonesia'),(27,'Manila','Philippines'),(28,'Cebu','Philippines'),(29,'Mumbai','India'),(30,'New Delhi','India'),(31,'Bangalore','India'),(32,'Dubai','United Arab Emirates'),(33,'Abu Dhabi','United Arab Emirates'),(34,'Doha','Qatar'),(35,'Riyadh','Saudi Arabia'),(36,'Istanbul','Turkey'),(37,'London','United Kingdom'),(38,'Manchester','United Kingdom'),(39,'Paris','France'),(40,'Nice','France'),(41,'Frankfurt','Germany'),(42,'Munich','Germany'),(43,'Berlin','Germany'),(44,'Amsterdam','Netherlands'),(45,'Rome','Italy'),(46,'Milan','Italy'),(47,'Venice','Italy'),(48,'Madrid','Spain'),(49,'Barcelona','Spain'),(50,'Zurich','Switzerland'),(51,'Geneva','Switzerland'),(52,'Vienna','Austria'),(53,'Brussels','Belgium'),(54,'Copenhagen','Denmark'),(55,'Stockholm','Sweden'),(56,'Oslo','Norway'),(57,'Helsinki','Finland'),(58,'Athens','Greece'),(59,'Lisbon','Portugal'),(60,'Dublin','Ireland'),(61,'Prague','Czech Republic'),(62,'Budapest','Hungary'),(63,'Warsaw','Poland'),(64,'Moscow','Russia'),(65,'New York','United States'),(66,'Los Angeles','United States'),(67,'Chicago','United States'),(68,'San Francisco','United States'),(69,'Miami','United States'),(70,'Dallas','United States'),(71,'Atlanta','United States'),(72,'Seattle','United States'),(73,'Boston','United States'),(74,'Washington D.C.','United States'),(75,'Las Vegas','United States'),(76,'Toronto','Canada'),(77,'Vancouver','Canada'),(78,'Montreal','Canada'),(79,'Mexico City','Mexico'),(80,'Cancun','Mexico'),(81,'Sao Paulo','Brazil'),(82,'Rio de Janeiro','Brazil'),(83,'Buenos Aires','Argentina'),(84,'Santiago','Chile'),(85,'Lima','Peru'),(86,'Bogota','Colombia'),(87,'Sydney','Australia'),(88,'Melbourne','Australia'),(89,'Brisbane','Australia'),(90,'Perth','Australia'),(91,'Auckland','New Zealand'),(92,'Wellington','New Zealand'),(93,'Cairo','Egypt'),(94,'Johannesburg','South Africa'),(95,'Cape Town','South Africa'),(96,'Nairobi','Kenya'),(97,'Casablanca','Morocco'),(98,'Addis Ababa','Ethiopia'),(99,'Lagos','Nigeria'),(100,'Male','Maldives'),(101,'Houston','United States'),(102,'Denver','United States'),(103,'Orlando','United States'),(104,'Charlotte','United States'),(105,'Phoenix','United States'),(106,'Philadelphia','United States'),(107,'San Diego','United States'),(108,'Detroit','United States'),(109,'Minneapolis','United States'),(110,'Honolulu','United States'),(111,'Newark','United States'),(112,'Tampa','United States'),(113,'Portland','United States'),(114,'Austin','United States'),(115,'San Jose','United States'),(116,'Nashville','United States'),(117,'Calgary','Canada'),(118,'Edmonton','Canada'),(119,'Guadalajara','Mexico'),(120,'Monterrey','Mexico'),(121,'Brasilia','Brazil'),(122,'Medellin','Colombia'),(123,'Caracas','Venezuela'),(124,'Quito','Ecuador'),(125,'Montevideo','Uruguay'),(126,'Guayaquil','Ecuador'),(127,'Recife','Brazil'),(128,'Salvador','Brazil'),(129,'Stuttgart','Germany'),(130,'Dusseldorf','Germany'),(131,'Hamburg','Germany'),(132,'Cologne','Germany'),(133,'Birmingham','United Kingdom'),(134,'Edinburgh','United Kingdom'),(135,'Glasgow','United Kingdom'),(136,'Lyon','France'),(137,'Marseille','France'),(138,'Toulouse','France'),(139,'Bordeaux','France'),(140,'Bologna','Italy'),(141,'Naples','Italy'),(142,'Florence','Italy'),(143,'Porto','Portugal'),(144,'Faro','Portugal'),(145,'Basel','Switzerland'),(146,'Gothenburg','Sweden'),(147,'Bergen','Norway'),(148,'Krakow','Poland'),(149,'Bucharest','Romania'),(150,'Sofia','Bulgaria'),(151,'Belgrade','Serbia'),(152,'Zagreb','Croatia'),(153,'Sapporo','Japan'),(154,'Nagoya','Japan'),(155,'Okinawa','Japan'),(156,'Shenzhen','China'),(157,'Chengdu','China'),(158,'Chongqing','China'),(159,'Hangzhou','China'),(160,'Xi\'an','China'),(161,'Nanjing','China'),(162,'Qingdao','China'),(163,'Xiamen','China'),(164,'Dalian','China'),(165,'Incheon','South Korea'),(166,'Busan','South Korea'),(167,'Jeju','South Korea'),(168,'Chennai','India'),(169,'Hyderabad','India'),(170,'Kolkata','India'),(171,'Pune','India'),(172,'Ahmedabad','India'),(173,'Colombo','Sri Lanka'),(174,'Kathmandu','Nepal'),(175,'Dhaka','Bangladesh'),(176,'Karachi','Pakistan'),(177,'Lahore','Pakistan'),(178,'Kuwait City','Kuwait'),(179,'Jeddah','Saudi Arabia'),(180,'Dammam','Saudi Arabia'),(181,'Muscat','Oman'),(182,'Manama','Bahrain'),(183,'Amman','Jordan'),(184,'Beirut','Lebanon'),(185,'Tel Aviv','Israel'),(186,'Tunis','Tunisia'),(187,'Algiers','Algeria'),(188,'Dakar','Senegal'),(189,'Dar es Salaam','Tanzania'),(190,'Entebbe','Uganda'),(191,'Accra','Ghana'),(192,'Abidjan','Ivory Coast'),(193,'Adelaide','Australia'),(194,'Gold Coast','Australia'),(195,'Christchurch','New Zealand'),(196,'Nadi','Fiji'),(197,'Port Moresby','Papua New Guinea'),(198,'Luanda','Angola'),(199,'Reykjavik','Iceland'),(200,'Riga','Latvia');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
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
