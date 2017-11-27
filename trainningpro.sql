-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: trainningpro
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chuan_dau_ra_ctdt`
--

DROP TABLE IF EXISTS `chuan_dau_ra_ctdt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chuan_dau_ra_ctdt` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ten_cdr` varchar(45) NOT NULL,
  `mota` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuan_dau_ra_ctdt`
--

LOCK TABLES `chuan_dau_ra_ctdt` WRITE;
/*!40000 ALTER TABLE `chuan_dau_ra_ctdt` DISABLE KEYS */;
INSERT INTO `chuan_dau_ra_ctdt` VALUES (1,'CDR1',NULL),(2,'CDR2',NULL),(3,'CDR3',NULL),(4,'CDR4',NULL),(5,'CDR5',NULL),(6,'CDR6',NULL);
/*!40000 ALTER TABLE `chuan_dau_ra_ctdt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chuan_dau_ra_hoc_phan`
--

DROP TABLE IF EXISTS `chuan_dau_ra_hoc_phan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chuan_dau_ra_hoc_phan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mota` varchar(100) NOT NULL,
  `muc_do_giang_day` varchar(10) DEFAULT NULL,
  `ten` varchar(45) DEFAULT NULL,
  `de_cuong_chi_tiet_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_chuan_dau_ra_hoc_phan_de_cuong_chi_tiet1_idx` (`de_cuong_chi_tiet_id`),
  CONSTRAINT `fk_chuan_dau_ra_hoc_phan_de_cuong_chi_tiet1` FOREIGN KEY (`de_cuong_chi_tiet_id`) REFERENCES `de_cuong_hoc_phan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuan_dau_ra_hoc_phan`
--

LOCK TABLES `chuan_dau_ra_hoc_phan` WRITE;
/*!40000 ALTER TABLE `chuan_dau_ra_hoc_phan` DISABLE KEYS */;
INSERT INTO `chuan_dau_ra_hoc_phan` VALUES (1,'Kien thuc va lap luan nganh','I',NULL,NULL),(2,'Hieu duoc cac khai niem, phuong phap, ky thuat trong phan tich va thiet ke','T',NULL,NULL),(3,'Co kha nang quan ly thoi gian','I',NULL,NULL),(4,'Phat trien duoc ky nang giao tiep','I',NULL,NULL),(5,'Ky nang, pham chat ca nhan va nghe nghiep','U',NULL,NULL),(6,'Phat trien ky nang lam viec nhom','I',NULL,NULL),(7,'Ky nang va pham chat giua cac ca nhan',NULL,NULL,NULL),(8,'Nang luc thuc hanh nghe nghiep',NULL,NULL,NULL);
/*!40000 ALTER TABLE `chuan_dau_ra_hoc_phan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chuong_trinh_dao_tao`
--

DROP TABLE IF EXISTS `chuong_trinh_dao_tao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chuong_trinh_dao_tao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `khoa_id` int(10) unsigned NOT NULL,
  `loai_id` int(10) unsigned NOT NULL,
  `ten` varchar(45) DEFAULT NULL,
  `nien_khoa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`loai_id`,`khoa_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_education_program_faculties1_idx` (`khoa_id`),
  KEY `fk_education_program_category1_idx` (`loai_id`),
  CONSTRAINT `fk_education_program_category1` FOREIGN KEY (`loai_id`) REFERENCES `loai` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_education_program_faculties1` FOREIGN KEY (`khoa_id`) REFERENCES `khoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuong_trinh_dao_tao`
--

LOCK TABLES `chuong_trinh_dao_tao` WRITE;
/*!40000 ALTER TABLE `chuong_trinh_dao_tao` DISABLE KEYS */;
INSERT INTO `chuong_trinh_dao_tao` VALUES (4,1,1,'test',NULL),(6,1,1,'asdf','sdf'),(7,1,1,'Công nghệ Thông tin CNPM','2013'),(9,6,2,'cnpm','1121ssss');
/*!40000 ALTER TABLE `chuong_trinh_dao_tao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `de_cuong_hoc_phan`
--

DROP TABLE IF EXISTS `de_cuong_hoc_phan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `de_cuong_hoc_phan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `giang_vien_id` int(10) unsigned NOT NULL,
  `giang_vien_ass_id` int(10) unsigned NOT NULL,
  `hoc_phan_id` int(10) unsigned NOT NULL,
  `mo_ta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`giang_vien_id`),
  KEY `fk_subject_outlines_lecturers1_idx` (`giang_vien_id`),
  KEY `fk_de_cuong_chi_tiet_giang_vien1_idx` (`giang_vien_ass_id`),
  KEY `fk_de_cuong_chi_tiet_hoc_phan1_idx` (`hoc_phan_id`),
  CONSTRAINT `fk_de_cuong_chi_tiet_giang_vien1` FOREIGN KEY (`giang_vien_ass_id`) REFERENCES `giang_vien` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hoc_phan_de_cuong_chi_tiet1` FOREIGN KEY (`hoc_phan_id`) REFERENCES `hoc_phan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_outlines_lecturers1` FOREIGN KEY (`giang_vien_id`) REFERENCES `giang_vien` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `de_cuong_hoc_phan`
--

LOCK TABLES `de_cuong_hoc_phan` WRITE;
/*!40000 ALTER TABLE `de_cuong_hoc_phan` DISABLE KEYS */;
/*!40000 ALTER TABLE `de_cuong_hoc_phan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giang_vien`
--

DROP TABLE IF EXISTS `giang_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giang_vien` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ten` varchar(45) NOT NULL,
  `ngay_sinh` date NOT NULL,
  `gioi_tinh` tinyint(1) unsigned NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `so_dien_thoai` varchar(20) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `hocvi_id` int(10) NOT NULL,
  `khoa_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_lecturers_faculties1_idx` (`khoa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giang_vien`
--

LOCK TABLES `giang_vien` WRITE;
/*!40000 ALTER TABLE `giang_vien` DISABLE KEYS */;
INSERT INTO `giang_vien` VALUES (1,'Le Thi My Hanh','2009-04-07',0,'ltmhanh@dut.udn.vn','0123456789','ltmhanh','secret','19112017225316.png',1,4),(2,'Mai Van Ha','2009-04-07',1,'mvha@dut.udn.vn','0123456789','mvha','secret','19112017225316.png',2,4),(3,'Nguyen Van Nguyen','2009-04-07',1,'nvnguyen@dut.udn.vn','0123456789','nvnguyen','secret','19112017225316.png',2,4),(4,'Dao Thi My Hanh','2009-04-07',0,'dtmhanh@dut.udn.vn','0123456789','dtmhanh','secret','19112017225316.png',3,4),(5,'Nguyen Van A','2009-04-07',1,'nva@dut.udn.vn','0123456789','nguyenvana','secret','19112017225316.png',2,5),(6,'Nguyen Thi B','2009-04-07',0,'ntb@dut.udn.vn','0123456789','nguyenthib','secret','19112017225316.png',2,4),(7,'Le Van C','2009-04-07',1,'lvc@dut.udn.vn','0123456789','levanc','secret','19112017225316.png',4,4),(20,'Lê Văn Bình','2017-11-14',1,'levanbinh@gmail.com','12345678','admin1234','e10adc3949ba59abbe56e057f20f883e','19112017235230.jpg',1,1),(23,'Lò Văn Năm','2017-11-15',0,'234567','56789','234567','f46c1daad76f1b91574b0d48ec1db4d3','20112017232734.jpg',1,1),(24,'đõ quang hèo','2017-11-30',1,'yghuygjikghujik','sdasdsadsadasd','đasadasdasdasd','34d261467a3c0c9d3a4ae2cf9db7cb5c','',1,1),(25,'lỗ Tấn Trường','2017-11-01',0,'7452yhujiokpl','rthrthtrh','lkjkljkljkj','2cc5afe1962b565ba56728211978f4ca','20112017004421.jpg',2,1),(26,'Không được khóc','2017-11-14',1,'khocnhe@email','uhuhuhuh','uhuhuhuhki','55a0dfca662117092a6aa66487384621','20112017232437.jpg',1,1),(28,'Test Sửa','2017-11-16',1,'1313ádasd','095863256','vdvdvdv','0c8480602955d962d97c3d8cd85b86a9','20112017233054.jpg',1,1),(29,'rtyuilkjhghj','2017-11-15',1,'jujjhjghjhg','nghnhnh','hhhnhnhhh','bf8c375d03ce2948301ce30fbfc5d5a8','',1,1),(30,'Tẹo Tẹo','2017-11-21',1,'sdasdsdsadfbbecSt','1234yyu','teoteo','54b07c0989d3b2845cfd9f3c8a44886d','',1,14),(31,'Võ Đức Hoàng','1988-11-20',1,'hoangkasu@gmail.com','0125569848','hoangaka','e10adc3949ba59abbe56e057f20f883e','21112017001234.jpg',2,4),(32,'Lê Châu','2017-11-15',1,'kokokok@gmail.com','0936978033','lechaudt','40365b6766f16121eb07a99aa7179e90','',5,8),(33,'adfasdf','2017-11-15',1,'ádfasdfsdf','adfsdfasdfsdfdsfa','fasdfasdfsdfasdfsdf','9342ff6d1b339df41675127697ea9091','',1,1),(34,'Truong Thanh Huu','2017-11-01',1,'truongthanhhhuu@gmail.com','12123123123','adasdadasdadasd','a87ddd71d9eef30b4136635e8b4310dd','',1,1);
/*!40000 ALTER TABLE `giang_vien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoc_ky`
--

DROP TABLE IF EXISTS `hoc_ky`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hoc_ky` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ten` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoc_ky`
--

LOCK TABLES `hoc_ky` WRITE;
/*!40000 ALTER TABLE `hoc_ky` DISABLE KEYS */;
INSERT INTO `hoc_ky` VALUES (1,'Hoc ky I'),(2,'Hoc ky II'),(3,'Hoc ky III'),(4,'Hoc ky IV'),(5,'Hoc ky V'),(6,'Hoc ky VI'),(7,'Hoc ky VII'),(8,'Hoc ky VIII'),(9,'Hoc ky IX'),(10,'Hoc ky X');
/*!40000 ALTER TABLE `hoc_ky` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoc_phan`
--

DROP TABLE IF EXISTS `hoc_phan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hoc_phan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vi_name` varchar(45) NOT NULL,
  `en_name` text,
  `ma_hoc_phan` varchar(45) DEFAULT NULL,
  `loai_hoc_phan` varchar(45) DEFAULT NULL,
  `khoi_kien_thuc_id` int(11) NOT NULL,
  `so_tin_chi` float DEFAULT NULL,
  PRIMARY KEY (`id`,`khoi_kien_thuc_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_hoc_phan_khoi_kien_thuc1_idx` (`khoi_kien_thuc_id`),
  CONSTRAINT `fk_hoc_phan_khoi_kien_thuc1` FOREIGN KEY (`khoi_kien_thuc_id`) REFERENCES `khoi_kien_thuc` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoc_phan`
--

LOCK TABLES `hoc_phan` WRITE;
/*!40000 ALTER TABLE `hoc_phan` DISABLE KEYS */;
INSERT INTO `hoc_phan` VALUES (3,'Ve ky thuat',NULL,NULL,'Bat buoc',1,NULL),(4,'Tu tuong Mac Lenin','Mac Lenin',NULL,'Bat buoc',1,NULL),(5,'Nguyen ly 1',NULL,NULL,'Bat buoc',1,NULL),(6,'Nguyen ly 2','Analytics',NULL,'Bat buoc',1,NULL),(7,'Tin hoc dai cuong','Analytics',NULL,'Bat buoc',1,NULL),(8,'TH Tin hoc dai cuong','Analytics',NULL,'Bat buoc',1,NULL),(9,'Co so nganh mang',NULL,NULL,'Bat buoc',2,NULL),(10,'Cong nghe phan mem',NULL,NULL,'Bat buoc',2,NULL),(11,'Quan ly du an',NULL,NULL,'Tu chon',3,NULL),(12,'Chuyen de CNPM',NULL,NULL,'Tu chon',3,NULL),(13,'Do an CSNM',NULL,NULL,'Bat buoc',2,NULL),(14,'Do an CNPM',NULL,NULL,'Bat buoc',3,NULL),(15,'Thuc tap cong nhan',NULL,NULL,'Bat buoc',4,NULL),(16,'Thuc tap tot nghiep',NULL,NULL,'Bat buoc',6,NULL),(17,'Phap luat dai cuong',NULL,NULL,'Bat buoc',4,NULL);
/*!40000 ALTER TABLE `hoc_phan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoc_phan_ctdt`
--

DROP TABLE IF EXISTS `hoc_phan_ctdt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hoc_phan_ctdt` (
  `chuong_trinh_dao_tao_id` int(10) unsigned NOT NULL,
  `hoc_phan_id` int(10) unsigned NOT NULL,
  `hoc_ki_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`chuong_trinh_dao_tao_id`,`hoc_phan_id`),
  KEY `fk_subjects_has_education_program_education_program1_idx` (`chuong_trinh_dao_tao_id`),
  KEY `fk_hoc_phan_ctdt_hoc_phan1_idx` (`hoc_phan_id`),
  CONSTRAINT `fk_hoc_phan_ctdt_hoc_phan1` FOREIGN KEY (`hoc_phan_id`) REFERENCES `hoc_phan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_subjects_has_education_program_education_program1` FOREIGN KEY (`chuong_trinh_dao_tao_id`) REFERENCES `chuong_trinh_dao_tao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoc_phan_ctdt`
--

LOCK TABLES `hoc_phan_ctdt` WRITE;
/*!40000 ALTER TABLE `hoc_phan_ctdt` DISABLE KEYS */;
INSERT INTO `hoc_phan_ctdt` VALUES (6,3,2),(6,4,2),(6,5,2),(6,6,1),(6,7,1),(6,9,8),(6,10,8),(6,13,10),(6,14,1),(6,16,3),(6,17,3),(7,3,3),(7,4,5),(7,5,5),(7,6,5),(7,7,2),(7,8,6),(7,9,7),(7,10,2),(7,11,5),(7,12,4),(7,13,1),(7,14,4),(7,15,6),(7,16,1),(7,17,1);
/*!40000 ALTER TABLE `hoc_phan_ctdt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoc_vi`
--

DROP TABLE IF EXISTS `hoc_vi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hoc_vi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hoc_vi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoc_vi`
--

LOCK TABLES `hoc_vi` WRITE;
/*!40000 ALTER TABLE `hoc_vi` DISABLE KEYS */;
INSERT INTO `hoc_vi` VALUES (1,'Kĩ sư'),(2,'Thạc sĩ'),(3,'Tiễn sĩ'),(4,'PGS. TS'),(5,'Giáo sư');
/*!40000 ALTER TABLE `hoc_vi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoa`
--

DROP TABLE IF EXISTS `khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `khoa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ten` varchar(45) NOT NULL,
  `giao_vu_khoa_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoa`
--

LOCK TABLES `khoa` WRITE;
/*!40000 ALTER TABLE `khoa` DISABLE KEYS */;
INSERT INTO `khoa` VALUES (1,'CN Nhiet - Dien lanh',5),(2,'Co khi',2),(3,'Co khi Giao thong',3),(4,'Cong nghe thong tin',4),(5,'Dien',6),(6,'Dien tu Vien thong',7),(7,'Hoa',8),(8,'Kien truc',9),(9,'Moi truong',10),(10,'Quan ly Du an',11),(11,'Su pham Ky thuat',12),(12,'XD - Cau duong',13),(13,'XD Dan dung - Cong nghiep',14),(14,'XD Thuy loi - Thuy dien',15);
/*!40000 ALTER TABLE `khoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoi_kien_thuc`
--

DROP TABLE IF EXISTS `khoi_kien_thuc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `khoi_kien_thuc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoi_kien_thuc`
--

LOCK TABLES `khoi_kien_thuc` WRITE;
/*!40000 ALTER TABLE `khoi_kien_thuc` DISABLE KEYS */;
INSERT INTO `khoi_kien_thuc` VALUES (1,'Kien thuc dai cuong'),(2,'Kien thuc co so nganh'),(3,'Kien thuc chuyen nganh'),(4,'Kien thuc khac'),(5,'Hoc phan ve ky nang chung'),(6,'Hoc phan thuc tap/Do an tot nghiep');
/*!40000 ALTER TABLE `khoi_kien_thuc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai`
--

DROP TABLE IF EXISTS `loai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loai` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ten` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai`
--

LOCK TABLES `loai` WRITE;
/*!40000 ALTER TABLE `loai` DISABLE KEYS */;
INSERT INTO `loai` VALUES (1,'CLC'),(2,'LT');
/*!40000 ALTER TABLE `loai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_hoc_lieu`
--

DROP TABLE IF EXISTS `loai_hoc_lieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loai_hoc_lieu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_loai` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_hoc_lieu`
--

LOCK TABLES `loai_hoc_lieu` WRITE;
/*!40000 ALTER TABLE `loai_hoc_lieu` DISABLE KEYS */;
INSERT INTO `loai_hoc_lieu` VALUES (1,'qqqq'),(2,'www');
/*!40000 ALTER TABLE `loai_hoc_lieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muc_tieu_dap_ung_ctdt`
--

DROP TABLE IF EXISTS `muc_tieu_dap_ung_ctdt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muc_tieu_dap_ung_ctdt` (
  `muc_tieu_hoc_phan_id` int(10) NOT NULL,
  `chuan_dau_ra_ctdt_id` int(11) NOT NULL,
  PRIMARY KEY (`muc_tieu_hoc_phan_id`,`chuan_dau_ra_ctdt_id`),
  KEY `fk_muc_tieu_hoc_phan_has_chuan_dau_ra_ctdt_chuan_dau_ra_ctd_idx` (`chuan_dau_ra_ctdt_id`),
  KEY `fk_muc_tieu_hoc_phan_has_chuan_dau_ra_ctdt_muc_tieu_hoc_pha_idx` (`muc_tieu_hoc_phan_id`),
  CONSTRAINT `fk_muc_tieu_hoc_phan_has_chuan_dau_ra_ctdt_chuan_dau_ra_ctdt1` FOREIGN KEY (`chuan_dau_ra_ctdt_id`) REFERENCES `chuan_dau_ra_ctdt` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_muc_tieu_hoc_phan_has_chuan_dau_ra_ctdt_muc_tieu_hoc_phan1` FOREIGN KEY (`muc_tieu_hoc_phan_id`) REFERENCES `muc_tieu_hoc_phan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muc_tieu_dap_ung_ctdt`
--

LOCK TABLES `muc_tieu_dap_ung_ctdt` WRITE;
/*!40000 ALTER TABLE `muc_tieu_dap_ung_ctdt` DISABLE KEYS */;
/*!40000 ALTER TABLE `muc_tieu_dap_ung_ctdt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muc_tieu_hoc_phan`
--

DROP TABLE IF EXISTS `muc_tieu_hoc_phan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muc_tieu_hoc_phan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mota` varchar(45) NOT NULL,
  `trinh_do_nang_luc` varchar(10) DEFAULT NULL,
  `de_cuong_chi_tiet_id` int(11) NOT NULL,
  `ten` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`de_cuong_chi_tiet_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_muc_tieu_hoc_phan_de_cuong_chi_tiet1_idx` (`de_cuong_chi_tiet_id`),
  CONSTRAINT `fk_muc_tieu_hoc_phan_de_cuong_chi_tiet1` FOREIGN KEY (`de_cuong_chi_tiet_id`) REFERENCES `de_cuong_hoc_phan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muc_tieu_hoc_phan`
--

LOCK TABLES `muc_tieu_hoc_phan` WRITE;
/*!40000 ALTER TABLE `muc_tieu_hoc_phan` DISABLE KEYS */;
/*!40000 ALTER TABLE `muc_tieu_hoc_phan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan`
--

DROP TABLE IF EXISTS `muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan` (
  `muc_tieu_hoc_phan_id` int(10) NOT NULL,
  `chuan_dau_ra_hoc_phan_id` int(10) NOT NULL,
  PRIMARY KEY (`muc_tieu_hoc_phan_id`,`chuan_dau_ra_hoc_phan_id`),
  KEY `fk_muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan_chuan_dau_ra_idx` (`chuan_dau_ra_hoc_phan_id`),
  KEY `fk_muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan_muc_tieu_hoc_idx` (`muc_tieu_hoc_phan_id`),
  CONSTRAINT `fk_muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan_chuan_dau_ra_h1` FOREIGN KEY (`chuan_dau_ra_hoc_phan_id`) REFERENCES `chuan_dau_ra_hoc_phan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan_muc_tieu_hoc_p1` FOREIGN KEY (`muc_tieu_hoc_phan_id`) REFERENCES `muc_tieu_hoc_phan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan`
--

LOCK TABLES `muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan` WRITE;
/*!40000 ALTER TABLE `muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan` DISABLE KEYS */;
/*!40000 ALTER TABLE `muc_tieu_hoc_phan_has_chuan_dau_ra_hoc_phan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguon_hoc_lieu`
--

DROP TABLE IF EXISTS `nguon_hoc_lieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nguon_hoc_lieu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ten_hoc_lieu` varchar(150) NOT NULL,
  `de_cuong_chi_tiet_id` int(11) NOT NULL,
  `loai_hoc_lieu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`de_cuong_chi_tiet_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_nguon_hoc_lieu_de_cuong_chi_tiet1_idx` (`de_cuong_chi_tiet_id`),
  KEY `fk_nguon_hoc_lieu_loai_hoc_lieu1_idx` (`loai_hoc_lieu_id`),
  CONSTRAINT `fk_nguon_hoc_lieu_de_cuong_chi_tiet1` FOREIGN KEY (`de_cuong_chi_tiet_id`) REFERENCES `de_cuong_hoc_phan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_nguon_hoc_lieu_loai_hoc_lieu1` FOREIGN KEY (`loai_hoc_lieu_id`) REFERENCES `loai_hoc_lieu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguon_hoc_lieu`
--

LOCK TABLES `nguon_hoc_lieu` WRITE;
/*!40000 ALTER TABLE `nguon_hoc_lieu` DISABLE KEYS */;
/*!40000 ALTER TABLE `nguon_hoc_lieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nien_khoa`
--

DROP TABLE IF EXISTS `nien_khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nien_khoa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ten` varchar(45) DEFAULT NULL,
  `ctdt_mac_dinh` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nien_khoa`
--

LOCK TABLES `nien_khoa` WRITE;
/*!40000 ALTER TABLE `nien_khoa` DISABLE KEYS */;
INSERT INTO `nien_khoa` VALUES (1,'2013',1),(2,'2014',NULL),(3,'2015',NULL),(4,'2016',NULL);
/*!40000 ALTER TABLE `nien_khoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tai_lieu`
--

DROP TABLE IF EXISTS `tai_lieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tai_lieu` (
  `id` int(11) NOT NULL,
  `tieu_de` varchar(45) DEFAULT NULL,
  `link` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tai_lieu`
--

LOCK TABLES `tai_lieu` WRITE;
/*!40000 ALTER TABLE `tai_lieu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tai_lieu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-27 22:04:00
