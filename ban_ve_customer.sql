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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('ADM01','admin','admin123','Quản trị viên','0999999999','admin@kaltravel.vn'),('C00011','B24DCGA138','138','Nguyễn Văn Tiến','0000000033','tiennv.b24ga138@stu.ptit.edu.vn'),('C02646','B24DCGA014','014','Nguyễn Hoàng Bách','0000000003','bachnh.b24ga014@stu.ptit.edu.vn'),('C04988','B24DCGA090','090','Lưu Duy Mạnh','0000000022','manhld.b24ga090@stu.ptit.edu.vn'),('C07604','B24DCGA142','142','Nguyễn Đức Toàn','0000000034','toannd.b24ga142@stu.ptit.edu.vn'),('C09258','B24DCGA022','022','Nguyễn Hải Đăng','0000000009','dangnh.b24ga022@stu.ptit.edu.vn'),('C16831','B24DCGA070','070','Lê Đức Huy','0000000015','huyld.b24ga070@stu.ptit.edu.vn'),('C20020','B24DCGA074','074','Vương Huy','0000000016','huyv.b24ga074@stu.ptit.edu.vn'),('C20149','B24DCGA162','162','Nguyễn Thành Vinh','0000000040','vinhnt.b24ga162@stu.ptit.edu.vn'),('C24133','B24DCGA126','126','Vũ Anh Tài','0000000031','taiva.b24ga126@stu.ptit.edu.vn'),('C25118','B24DCGA018','018','Tôn Nữ Ngân Châu','0000000004','chautnn.b24ga018@stu.ptit.edu.vn'),('C29150','B24DCGA122','122','Nguyễn Hồng Quân','0000000030','quannh.b24ga122@stu.ptit.edu.vn'),('C29493','B24DCGA010','010','Nguyễn Tiến Anh','0000000002','anhnt.b24ga010@stu.ptit.edu.vn'),('C35115','B24DCGA002','002','Bùi Việt Anh','0000000000','anhbv.b24ga002@stu.ptit.edu.vn'),('C35649','B24DCGA066','066','Nguyễn Tuấn Hưng','0000000018','hungnt.b24ga066@stu.ptit.edu.vn'),('C37650','ninhmyhoa2410','Ninhmyhoa2006','Ninh Mỹ Hoa','0812427141','ninhmyhoa03@gmail.com'),('C39029','B24DCGA034','034','Mai Trung Dũng','0000000006','dungmt.b24ga034@stu.ptit.edu.vn'),('C40994','B24DCGA038','038','Trần Tuấn Dương','0000000007','duongtt.b24ga038@stu.ptit.edu.vn'),('C41810','B24DCGA150','150','Nguyễn Lưu Minh Trí','0000000036','trinlm.b24ga150@stu.ptit.edu.vn'),('C44702','B24DCGA006','Hoabeo','Hoàng Kỳ Anh','0903295837','anhhk.b24ga006@stu.ptit.edu.vn'),('C46035','B24DCGA094','094','Lương Nhật Minh','0000000023','minhln.b24ga094@stu.ptit.edu.vn'),('C46112','B24DCGA110','110','Phạm Vũ Phong','0000000027','phongpv.b24ga110@stu.ptit.edu.vn'),('C47200','B24DCGA146','146','Đặng Thị Thùy Trang','0000000035','trangdtt.b24ga146@stu.ptit.edu.vn'),('C50485','B24DCGA082','082','Ngô Văn Kiệt','0000000020','kietnv.b24ga082@stu.ptit.edu.vn'),('C53268','B24DCGA046','046','Đỗ Tuấn Hiệp','0000000011','hiepdt.b24ga046@stu.ptit.edu.vn'),('C58751','B24DCGA078','078','Nguyễn Đăng Bá Khôi','0000000019','khoindb.b24ga078@stu.ptit.edu.vn'),('C59762','B24DCGA062','062','Nguyễn Duy Hưng','0000000017','hungnd.b24ga062@stu.ptit.edu.vn'),('C67808','B24DCGA158','158','Hà Quang Tùng','0000000038','tunghq.b24ga158@stu.ptit.edu.vn'),('C68670','B24DCGA058','058','Nguyễn Bá Hùng','0000000014','hungnb.b24ga058@stu.ptit.edu.vn'),('C70838','B24DCGA114','114','Trần Duy Phú','0000000028','phutd.b24ga114@stu.ptit.edu.vn'),('C71138','B24DCGA130','130','Nguyễn Thị Thành','0000000032','thanhnt.b24ga130@stu.ptit.edu.vn'),('C71191','B24DCGA106','106','Nguyễn Tuấn Ninh','0000000026','ninhnt.b24ga106@stu.ptit.edu.vn'),('C71414','B24DCGA086','086','Lưu Hải Lộc','0000000021','loclh.b24ga086@stu.ptit.edu.vn'),('C77969','B24DCGA118','118','Hoàng Việt Phương','0000000029','phuonghv.b24ga118@stu.ptit.edu.vn'),('C79520','B24DCGA054','054','Vũ Bảo Hoàng','0000000013','hoangvb.b24ga054@stu.ptit.edu.vn'),('C85402','B24DCGA102','102','Phạm Văn Nguyên','0000000025','nguyenpv.b24ga102@stu.ptit.edu.vn'),('C85965','B24DCGA050','050','Ninh Mỹ Hoa','0000000012','hoanm.b24ga050@stu.ptit.edu.vn'),('C90005','B24DCGA042','042','Trương Ngọc Hà','0000000010','hatn.b24ga042@stu.ptit.edu.vn'),('C91988','B24DCGA026','026','Đỗ Tiến Đạt','0000000008','datdt.b24ga026@stu.ptit.edu.vn'),('C93767','B24DCGA154','154','Trần Thành Trung','0000000037','trungtt.b24ga154@stu.ptit.edu.vn'),('C94617','B24DCGA098','098','Nguyễn Quang Minh','0000000024','minhnq.b24ga098@stu.ptit.edu.vn'),('C99069','B24DCGA159','159','Vũ Thị Mai Uyên','0000000039','uyenvtm.b24ga159@stu.ptit.edu.vn'),('C99166','B24DCGA030','030','Nguyễn Thị Bích Diệp','0000000005','diepntb.b24ga030@stu.ptit.edu.vn');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
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
