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
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `passport_no` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `passport_no` (`passport_no`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Hoang Huu Bao','078703785123','1970-03-11','Da Nang, Vietnam','0954586820','bao1991@gmail.com','Vietnam'),(2,'Elizabeth Martinez','A14931607','1976-10-21','Paris, France','+50 427595551','martinez1991@icloud.com','Australia'),(3,'John Wilson','A98325218','2000-02-24','London, UK','+17 282672352','wilson1991@outlook.com','United States'),(4,'Ho Xuan Nam','034729429339','1951-06-08','Hanoi, Vietnam','0921832271','nam2010@outlook.com','Vietnam'),(5,'Do Bao Bao','046631265428','1972-03-18','HCMC, Vietnam','0994555921','bao1984@icloud.com','Vietnam'),(6,'Ly Tuan Bao','027589991690','1995-11-09','Hanoi, Vietnam','0935927774','bao1971@outlook.com','Vietnam'),(7,'Dang Huu Giang','095352290065','1999-09-10','Da Nang, Vietnam','0920519512','giang2010@gmail.com','Vietnam'),(8,'Mary Gonzalez','P81795820','1999-07-02','Paris, France','+22 655235645','gonzalez1977@yahoo.com','Australia'),(9,'Jessica Brown','A63441497','2014-04-25','London, UK','+3 637458638','brown1975@yahoo.com','Australia'),(10,'Nguyen Ngoc Linh','039191375460','1993-09-18','HCMC, Vietnam','0990544310','linh1990@gmail.com','Vietnam'),(11,'Sarah Williams','E63466453','1993-07-08','Paris, France','+50 130305927','williams1986@icloud.com','France'),(12,'Dang Duc Linh','081504161060','1965-05-17','Hanoi, Vietnam','0959461540','linh1974@outlook.com','Vietnam'),(13,'Barbara Rodriguez','P34455253','1966-08-18','Sydney, Australia','+8 121380584','rodriguez1997@icloud.com','Australia'),(14,'Sarah Williams','P90220657','1951-06-24','Sydney, Australia','+56 134524858','williams1999@outlook.com','Australia'),(15,'Robert Wilson','P65842186','2013-11-06','Sydney, Australia','+23 556315020','wilson1972@gmail.com','Australia'),(16,'Elizabeth Gonzalez','P76198708','1954-04-07','Paris, France','+9 308799740','gonzalez1983@yahoo.com','Australia'),(17,'Ly Thi Son','063338424034','1974-07-03','Hanoi, Vietnam','0978525305','son1997@icloud.com','Vietnam'),(18,'Vu Minh Oanh','059150718694','1991-12-03','Hanoi, Vietnam','0924190430','oanh2002@gmail.com','Vietnam'),(19,'Pham Dinh Phong','017262883916','1967-11-02','Hanoi, Vietnam','0925352696','phong1999@gmail.com','Vietnam'),(20,'Richard Wilson','A55829630','1987-06-22','London, UK','+43 253552083','wilson1975@gmail.com','United Kingdom'),(21,'Ly Ngoc Bao','080169366894','1980-03-18','Hanoi, Vietnam','0924808000','bao1985@outlook.com','Vietnam'),(22,'Ly Thanh Uyen','063696120688','2003-01-20','Da Nang, Vietnam','0959357880','uyen1993@yahoo.com','Vietnam'),(23,'Robert Brown','A74540736','1999-01-09','London, UK','+19 801672916','brown2005@yahoo.com','Australia'),(24,'Ly Dinh Ha','056297571211','1984-02-03','Hanoi, Vietnam','0923530935','ha1978@gmail.com','Vietnam'),(25,'Ngo Xuan Minh','040105745312','2006-07-27','Da Nang, Vietnam','0922558620','minh1977@gmail.com','Vietnam'),(26,'Vu Dinh Ha','059100374095','1950-07-05','Hanoi, Vietnam','0965748605','ha1983@yahoo.com','Vietnam'),(27,'Tran Thi Uyen','063280547572','1953-02-26','Da Nang, Vietnam','0962362701','uyen1989@gmail.com','Vietnam'),(28,'Do Ngoc Chau','084303817181','1996-02-27','Da Nang, Vietnam','0963783555','chau2006@icloud.com','Vietnam'),(29,'Tran Tuan Bao','049853022020','1969-11-17','HCMC, Vietnam','0914192329','bao1983@gmail.com','Vietnam'),(30,'Richard Williams','A78465355','2002-03-18','London, UK','+27 857837608','williams1986@outlook.com','Australia'),(31,'Hoang Duc Vy','093944064672','1955-06-02','HCMC, Vietnam','0955449428','vy1982@yahoo.com','Vietnam'),(32,'Bui Xuan Oanh','094291888497','1966-07-02','Da Nang, Vietnam','0990425332','oanh2000@outlook.com','Vietnam'),(33,'David Garcia','P42095655','2010-07-01','Paris, France','+8 989714421','garcia1982@yahoo.com','Australia'),(34,'Susan Williams','P13042450','2004-12-07','Paris, France','+56 763788220','williams2009@gmail.com','France'),(35,'Nguyen Thi Hai','028989601633','1979-03-24','Da Nang, Vietnam','0917537613','hai1978@icloud.com','Vietnam'),(36,'Ngo Duc Vy','047154817457','1964-03-13','Hanoi, Vietnam','0975510476','vy1991@icloud.com','Vietnam'),(37,'Le Xuan Yen','054709429215','2000-09-08','Hanoi, Vietnam','0948995537','yen1976@yahoo.com','Vietnam'),(38,'Ngo Dinh Dung','078021008064','1990-07-16','HCMC, Vietnam','0981977799','dung1986@gmail.com','Vietnam'),(39,'Susan Anderson','P23910540','1952-12-06','New York, USA','+43 365611603','anderson1980@gmail.com','Australia'),(40,'Le Ngoc Trang','047645063076','2005-02-14','Da Nang, Vietnam','0937687834','trang1987@gmail.com','Vietnam'),(41,'Elizabeth Miller','E26533722','1965-06-25','London, UK','+3 971318040','miller2009@yahoo.com','United States'),(42,'Jessica Smith','P70511874','2014-04-16','Paris, France','+53 502840428','smith1979@outlook.com','United Kingdom'),(43,'Pham Van Oanh','044983050478','1999-11-20','Da Nang, Vietnam','0937409249','oanh1993@icloud.com','Vietnam'),(44,'Patricia Garcia','A29967732','2008-01-26','London, UK','+44 329064402','garcia1997@gmail.com','Australia'),(45,'Le Dinh Hai','034267232389','2014-05-15','Da Nang, Vietnam','0942203920','hai1982@yahoo.com','Vietnam'),(46,'Hoang Dinh Nam','062408985160','1960-03-24','Hanoi, Vietnam','0966929961','nam1997@gmail.com','Vietnam'),(47,'Vu Xuan Uyen','058595958742','1992-07-20','Hanoi, Vietnam','0970341517','uyen2002@outlook.com','Vietnam'),(48,'Richard Anderson','E13149839','1966-09-08','Sydney, Australia','+56 221764654','anderson1976@yahoo.com','Australia'),(49,'John Jones','A38760195','1979-05-24','New York, USA','+49 713601053','jones1974@yahoo.com','United States'),(50,'Ngo Dinh Giang','086708682855','1976-12-07','Da Nang, Vietnam','0956972049','giang2010@icloud.com','Vietnam'),(51,'Ho Xuan Linh','094032130324','2010-09-04','HCMC, Vietnam','0976527581','linh2009@yahoo.com','Vietnam'),(52,'Nguyen Van Trang','094896792376','1960-05-09','Da Nang, Vietnam','0990425313','trang1980@gmail.com','Vietnam'),(53,'Ho Huu Dung','045041042738','1968-09-24','HCMC, Vietnam','0960010996','dung1970@yahoo.com','Vietnam'),(54,'Doan Thi Yen','051493033100','1987-11-20','Da Nang, Vietnam','0944062534','yen2003@outlook.com','Vietnam'),(55,'Do Bao Nam','060121703666','1964-07-16','HCMC, Vietnam','0963345869','nam1994@icloud.com','Vietnam');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
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
