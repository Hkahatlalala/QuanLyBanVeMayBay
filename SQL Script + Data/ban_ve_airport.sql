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
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `IATA_code` char(3) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IATA_code` (`IATA_code`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (1,'Nội Bài International','HAN',1),(2,'Gia Lâm',NULL,1),(3,'Tân Sơn Nhất International','SGN',2),(4,'Long Thành International',NULL,2),(5,'Đà Nẵng International','DAD',3),(6,'Chu Lai',NULL,3),(7,'Cam Ranh International','CXR',4),(8,'Nha Trang Old',NULL,4),(9,'Phú Quốc International','PQC',5),(10,'Dương Đông',NULL,5),(11,'Cát Bi International','HPH',6),(12,'Hải Phòng Heliport',NULL,6),(13,'Phú Bài International','HUI',7),(14,'Gia Hội',NULL,7),(15,'Trà Nóc (Cần Thơ) International','VCA',8),(16,'Cần Thơ Port',NULL,8),(17,'Liên Khương','DLI',9),(18,'Cam Ly',NULL,9),(19,'Phù Cát','UIH',10),(20,'Quy Nhơn Port',NULL,10),(21,'Vinh International','VII',11),(22,'Quân khu 4',NULL,11),(23,'Changi International','SIN',12),(24,'Seletar','XSP',12),(25,'Suvarnabhumi','BKK',13),(26,'Don Mueang International','DMK',13),(27,'Incheon International','ICN',14),(28,'Gimpo International','GMP',14),(29,'Narita International','NRT',15),(30,'Haneda International','HND',15),(31,'Beijing Capital International','PEK',16),(32,'Shanghai Pudong International','PVG',17),(33,'Guangzhou Baiyun International','CAN',18),(34,'Taoyuan International','TPE',19),(35,'Hong Kong International','HKG',20),(36,'Macau International','MFM',21),(37,'Kansai International','KIX',22),(38,'Fukuoka Airport','FUK',23),(39,'Kuala Lumpur International','KUL',24),(40,'Soekarno-Hatta International','CGK',25),(41,'Ngurah Rai International','DPS',26),(42,'Ninoy Aquino International','MNL',27),(43,'Mactan-Cebu International','CEB',28),(44,'Chhatrapati Shivaji Maharaj','BOM',29),(45,'Indira Gandhi International','DEL',30),(46,'Kempegowda International','BLR',31),(47,'Dubai International','DXB',32),(48,'Zayed International','AUH',33),(49,'Hamad International','DOH',34),(50,'King Khalid International','RUH',35),(51,'Istanbul Airport','IST',36),(52,'Heathrow Airport','LHR',37),(53,'Manchester Airport','MAN',38),(54,'Charles de Gaulle Airport','CDG',39),(55,'Nice Côte d\'Azur','NCE',40),(56,'Frankfurt Airport','FRA',41),(57,'Munich Airport','MUC',42),(58,'Berlin Brandenburg','BER',43),(59,'Amsterdam Airport Schiphol','AMS',44),(60,'Leonardo da Vinci–Fiumicino','FCO',45),(61,'Milan Malpensa','MXP',46),(62,'Venice Marco Polo','VCE',47),(63,'Adolfo Suárez Madrid–Barajas','MAD',48),(64,'Josep Tarradellas Barcelona','BCN',49),(65,'Zurich Airport','ZRH',50),(66,'Geneva Airport','GVA',51),(67,'Vienna International','VIE',52),(68,'Brussels Airport','BRU',53),(69,'Copenhagen Airport','CPH',54),(70,'Stockholm Arlanda','ARN',55),(71,'Oslo Gardermoen','OSL',56),(72,'Helsinki-Vantaa','HEL',57),(73,'Athens International','ATH',58),(74,'Lisbon Humberto Delgado','LIS',59),(75,'Dublin Airport','DUB',60),(76,'Václav Havel Airport Prague','PRG',61),(77,'Budapest Ferenc Liszt','BUD',62),(78,'Warsaw Chopin','WAW',63),(79,'Sheremetyevo International','SVO',64),(80,'John F. Kennedy International','JFK',65),(81,'Los Angeles International','LAX',66),(82,'O\'Hare International','ORD',67),(83,'San Francisco International','SFO',68),(84,'Miami International','MIA',69),(85,'Dallas/Fort Worth International','DFW',70),(86,'Hartsfield-Jackson Atlanta','ATL',71),(87,'Seattle-Tacoma International','SEA',72),(88,'Logan International','BOS',73),(89,'Washington Dulles International','IAD',74),(90,'Harry Reid International','LAS',75),(91,'Toronto Pearson International','YYZ',76),(92,'Vancouver International','YVR',77),(93,'Montréal-Trudeau International','YUL',78),(94,'Mexico City International','MEX',79),(95,'Cancún International','CUN',80),(96,'São Paulo/Guarulhos','GRU',81),(97,'Rio de Janeiro/Galeão','GIG',82),(98,'Ministro Pistarini International','EZE',83),(99,'Arturo Merino Benítez','SCL',84),(100,'Jorge Chávez International','LIM',85),(101,'El Dorado International','BOG',86),(102,'Sydney Kingsford Smith','SYD',87),(103,'Melbourne Airport','MEL',88),(104,'Brisbane Airport','BNE',89),(105,'Perth Airport','PER',90),(106,'Auckland Airport','AKL',91),(107,'Wellington International','WLG',92),(108,'Cairo International','CAI',93),(109,'O. R. Tambo International','JNB',94),(110,'Cape Town International','CPT',95),(111,'Jomo Kenyatta International','NBO',96),(112,'Mohammed V International','CMN',97),(113,'Addis Ababa Bole International','ADD',98),(114,'Murtala Muhammed International','LOS',99),(115,'Velana International','MLE',100),(116,'George Bush Intercontinental','IAH',101),(117,'Denver International','DEN',102),(118,'Orlando International','MCO',103),(119,'Charlotte Douglas International','CLT',104),(120,'Phoenix Sky Harbor','PHX',105),(121,'Philadelphia International','PHL',106),(122,'San Diego International','SAN',107),(123,'Detroit Metropolitan','DTW',108),(124,'Minneapolis-Saint Paul','MSP',109),(125,'Daniel K. Inouye International','HNL',110),(126,'Newark Liberty International','EWR',111),(127,'Tampa International','TPA',112),(128,'Portland International','PDX',113),(129,'Austin-Bergstrom International','AUS',114),(130,'Norman Y. Mineta San Jose','SJC',115),(131,'Nashville International','BNA',116),(132,'Calgary International','YYC',117),(133,'Edmonton International','YEG',118),(134,'Miguel Hidalgo y Costilla','GDL',119),(135,'Monterrey International','MTY',120),(136,'Brasília International','BSB',121),(137,'José María Córdova','MDE',122),(138,'Simón Bolívar International','CCS',123),(139,'Mariscal Sucre International','UIO',124),(140,'Carrasco International','MVD',125),(141,'José Joaquín de Olmedo','GYE',126),(142,'Recife/Guararapes','REC',127),(143,'Salvador International','SSA',128),(144,'Stuttgart Airport','STR',129),(145,'Düsseldorf Airport','DUS',130),(146,'Hamburg Airport','HAM',131),(147,'Cologne Bonn Airport','CGN',132),(148,'Birmingham Airport','BHX',133),(149,'Edinburgh Airport','EDI',134),(150,'Glasgow Airport','GLA',135),(151,'Lyon-Saint Exupéry','LYS',136),(152,'Marseille Provence','MRS',137),(153,'Toulouse-Blagnac','TLS',138),(154,'Bordeaux-Mérignac','BOD',139),(155,'Bologna Guglielmo Marconi','BLQ',140),(156,'Naples International','NAP',141),(157,'Florence Airport','FLR',142),(158,'Francisco de Sá Carneiro','OPO',143),(159,'Faro Airport','FAO',144),(160,'EuroAirport Basel','BSL',145),(161,'Göteborg Landvetter','GOT',146),(162,'Bergen Airport','BGO',147),(163,'John Paul II Kraków-Balice','KRK',148),(164,'Henri Coandă International','OTP',149),(165,'Sofia Airport','SOF',150),(166,'Belgrade Nikola Tesla','BEG',151),(167,'Zagreb Airport','ZAG',152),(168,'New Chitose Airport','CTS',153),(169,'Chubu Centrair International','NGO',154),(170,'Naha Airport','OKA',155),(171,'Shenzhen Bao\'an International','SZX',156),(172,'Chengdu Shuangliu','CTU',157),(173,'Chongqing Jiangbei','CKG',158),(174,'Hangzhou Xiaoshan','HGH',159),(175,'Xi\'an Xianyang','XIY',160),(176,'Nanjing Lukou','NKG',161),(177,'Qingdao Jiaodong','TAO',162),(178,'Xiamen Gaoqi','XMN',163),(179,'Dalian Zhoushuizi','DLC',164),(180,'Cheongju International','CJJ',165),(181,'Gimhae International','PUS',166),(182,'Jeju International','CJU',167),(183,'Chennai International','MAA',168),(184,'Rajiv Gandhi International','HYD',169),(185,'Netaji Subhas Chandra Bose','CCU',170),(186,'Pune Airport','PNQ',171),(187,'Sardar Vallabhbhai Patel','AMD',172),(188,'Bandaranaike International','CMB',173),(189,'Tribhuvan International','KTM',174),(190,'Hazrat Shahjalal International','DAC',175),(191,'Jinnah International','KHI',176),(192,'Allama Iqbal International','LHE',177),(193,'Kuwait International','KWI',178),(194,'King Abdulaziz International','JED',179),(195,'King Fahd International','DMM',180),(196,'Muscat International','MCT',181),(197,'Bahrain International','BAH',182),(198,'Queen Alia International','AMM',183),(199,'Beirut-Rafic Hariri','BEY',184),(200,'Ben Gurion Airport','TLV',185),(201,'Tunis-Carthage International','TUN',186),(202,'Houari Boumediene Airport','ALG',187),(203,'Blaise Diagne International','DSS',188),(204,'Julius Nyerere International','DAR',189),(205,'Entebbe International','EBB',190),(206,'Kotoka International','ACC',191),(207,'Félix-Houphouët-Boigny','ABJ',192),(208,'Adelaide Airport','ADL',193),(209,'Gold Coast Airport','OOL',194),(210,'Christchurch Airport','CHC',195),(211,'Nadi International','NAN',196),(212,'Jacksons International','POM',197),(213,'Quatro de Fevereiro','LAD',198),(214,'Keflavík International','KEF',199),(215,'Riga International','RIX',200);
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
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
