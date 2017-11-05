CREATE DATABASE  IF NOT EXISTS `trainningpro` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `trainningpro`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: trainningpro
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ten_cdr` varchar(45) NOT NULL,
  `mota` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mota` varchar(100) NOT NULL,
  `muc_do_giang_day` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuan_dau_ra_hoc_phan`
--

LOCK TABLES `chuan_dau_ra_hoc_phan` WRITE;
/*!40000 ALTER TABLE `chuan_dau_ra_hoc_phan` DISABLE KEYS */;
INSERT INTO `chuan_dau_ra_hoc_phan` VALUES (1,'Kien thuc va lap luan nganh','I'),(2,'Hieu duoc cac khai niem, phuong phap, ky thuat trong phan tich va thiet ke','T'),(3,'Co kha nang quan ly thoi gian','I'),(4,'Phat trien duoc ky nang giao tiep','I'),(5,'Ky nang, pham chat ca nhan va nghe nghiep','U'),(6,'Phat trien ky nang lam viec nhom','I'),(7,'Ky nang va pham chat giua cac ca nhan',NULL),(8,'Nang luc thuc hanh nghe nghiep',NULL);
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
  `nien_khoa_id` int(10) unsigned NOT NULL,
  `hoc_ki_id` int(10) unsigned NOT NULL,
  `khoa_id` int(10) unsigned NOT NULL,
  `loai_id` int(10) unsigned NOT NULL,
  `ten` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`loai_id`,`khoa_id`,`nien_khoa_id`,`hoc_ki_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_education_program_NienKhoa1_idx` (`nien_khoa_id`),
  KEY `fk_education_program_semesters1_idx` (`hoc_ki_id`),
  KEY `fk_education_program_faculties1_idx` (`khoa_id`),
  KEY `fk_education_program_category1_idx` (`loai_id`),
  CONSTRAINT `fk_education_program_NienKhoa1` FOREIGN KEY (`nien_khoa_id`) REFERENCES `nien_khoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_education_program_category1` FOREIGN KEY (`loai_id`) REFERENCES `loai` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_education_program_faculties1` FOREIGN KEY (`khoa_id`) REFERENCES `khoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_education_program_semesters1` FOREIGN KEY (`hoc_ki_id`) REFERENCES `hoc_ky` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuong_trinh_dao_tao`
--

LOCK TABLES `chuong_trinh_dao_tao` WRITE;
/*!40000 ALTER TABLE `chuong_trinh_dao_tao` DISABLE KEYS */;
/*!40000 ALTER TABLE `chuong_trinh_dao_tao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `de_cuong_chi_tiet`
--

DROP TABLE IF EXISTS `de_cuong_chi_tiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `de_cuong_chi_tiet` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `giang_vien_id` int(10) unsigned NOT NULL,
  `giang_vien_ass_id` int(10) unsigned NOT NULL,
  `mo_ta` varchar(45) DEFAULT NULL,
  `hoc_phan_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`giang_vien_id`,`hoc_phan_id`),
  KEY `fk_subject_outlines_lecturers1_idx` (`giang_vien_id`),
  KEY `fk_de_cuong_chi_tiet_giang_vien1_idx` (`giang_vien_ass_id`),
  KEY `fk_de_cuong_chi_tiet_hoc_phan1_idx` (`hoc_phan_id`),
  CONSTRAINT `fk_de_cuong_chi_tiet_giang_vien1` FOREIGN KEY (`giang_vien_ass_id`) REFERENCES `giang_vien` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_de_cuong_chi_tiet_hoc_phan1` FOREIGN KEY (`hoc_phan_id`) REFERENCES `hoc_phan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_outlines_lecturers1` FOREIGN KEY (`giang_vien_id`) REFERENCES `giang_vien` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `de_cuong_chi_tiet`
--

LOCK TABLES `de_cuong_chi_tiet` WRITE;
/*!40000 ALTER TABLE `de_cuong_chi_tiet` DISABLE KEYS */;
/*!40000 ALTER TABLE `de_cuong_chi_tiet` ENABLE KEYS */;
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
  `hoc_vi` varchar(45) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `khoa_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`khoa_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_lecturers_faculties1_idx` (`khoa_id`),
  CONSTRAINT `fk_lecturers_faculties1` FOREIGN KEY (`khoa_id`) REFERENCES `khoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giang_vien`
--

LOCK TABLES `giang_vien` WRITE;
/*!40000 ALTER TABLE `giang_vien` DISABLE KEYS */;
INSERT INTO `giang_vien` VALUES (1,'Le Thi My Hanh','2009-04-07',0,'ltmhanh@dut.udn.vn','0123456789','ltmhanh','secret','Tien Sy',NULL,4),(2,'Mai Van Ha','2009-04-07',1,'mvha@dut.udn.vn','0123456789','mvha','secret','Thac Sy',NULL,4),(3,'Nguyen Van Nguyen','2009-04-07',1,'nvnguyen@dut.udn.vn','0123456789','nvnguyen','secret','Thac Sy',NULL,4),(4,'Dao Thi My Hanh','2009-04-07',0,'dtmhanh@dut.udn.vn','0123456789','dtmhanh','secret','Tien Sy',NULL,4),(5,'Nguyen Van A','2009-04-07',1,'nva@dut.udn.vn','0123456789','nguyenvana','secret','Tien Sy',NULL,5),(6,'Nguyen Thi B','2009-04-07',0,'ntb@dut.udn.vn','0123456789','nguyenthib','secret','PGS',NULL,4),(7,'Le Van C','2009-04-07',1,'lvc@dut.udn.vn','0123456789','levanc','secret','Tien Sy',NULL,4);
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
  `khoi_kien_thuc_id` int(10) unsigned NOT NULL,
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
INSERT INTO `hoc_phan` VALUES (1,'Hinh Hoa','Graphics',NULL,'Bat buoc',1),(2,'Giai tich','Analytics',NULL,'Bat buoc',1),(3,'Ve ky thuat',NULL,NULL,'Bat buoc',1),(4,'Tu tuong Mac Lenin','Mac Lenin',NULL,'Bat buoc',1),(5,'Nguyen ly 1',NULL,NULL,'Bat buoc',1),(6,'Nguyen ly 2','Analytics',NULL,'Bat buoc',1),(7,'Tin hoc dai cuong','Analytics',NULL,'Bat buoc',1),(8,'TH Tin hoc dai cuong','Analytics',NULL,'Bat buoc',1),(9,'Co so nganh mang',NULL,NULL,'Bat buoc',2),(10,'Cong nghe phan mem',NULL,NULL,'Bat buoc',2),(11,'Quan ly du an',NULL,NULL,'Tu chon',3),(12,'Chuyen de CNPM',NULL,NULL,'Tu chon',3),(13,'Do an CSNM',NULL,NULL,'Bat buoc',2),(14,'Do an CNPM',NULL,NULL,'Bat buoc',3),(15,'Thuc tap cong nhan',NULL,NULL,'Bat buoc',4),(16,'Thuc tap tot nghiep',NULL,NULL,'Bat buoc',6),(17,'Phap luat dai cuong',NULL,NULL,'Bat buoc',4);
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
  `so_tin_chi` int(11) DEFAULT NULL,
  `hoc_phan_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`chuong_trinh_dao_tao_id`,`hoc_phan_id`),
  KEY `fk_subjects_has_education_program_education_program1_idx` (`chuong_trinh_dao_tao_id`),
  KEY `fk_hoc_phan_ctdt_hoc_phan1_idx` (`hoc_phan_id`),
  CONSTRAINT `fk_hoc_phan_ctdt_hoc_phan1` FOREIGN KEY (`hoc_phan_id`) REFERENCES `hoc_phan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_subjects_has_education_program_education_program1` FOREIGN KEY (`chuong_trinh_dao_tao_id`) REFERENCES `chuong_trinh_dao_tao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoc_phan_ctdt`
--

LOCK TABLES `hoc_phan_ctdt` WRITE;
/*!40000 ALTER TABLE `hoc_phan_ctdt` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoc_phan_ctdt` ENABLE KEYS */;
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai`
--

LOCK TABLES `loai` WRITE;
/*!40000 ALTER TABLE `loai` DISABLE KEYS */;
/*!40000 ALTER TABLE `loai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_hoc_lieu`
--

DROP TABLE IF EXISTS `loai_hoc_lieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loai_hoc_lieu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ten_loai` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_hoc_lieu`
--

LOCK TABLES `loai_hoc_lieu` WRITE;
/*!40000 ALTER TABLE `loai_hoc_lieu` DISABLE KEYS */;
/*!40000 ALTER TABLE `loai_hoc_lieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muc_tieu_dap_ung_ctdt`
--

DROP TABLE IF EXISTS `muc_tieu_dap_ung_ctdt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muc_tieu_dap_ung_ctdt` (
  `muc_tieu_hoc_phan_id` int(10) unsigned NOT NULL,
  `chuan_dau_ra_ctdt_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`muc_tieu_hoc_phan_id`,`chuan_dau_ra_ctdt_id`),
  KEY `fk_muc_tieu_hoc_phan_has_chuan_dau_ra_ctdt_chuan_dau_ra_ctd_idx` (`chuan_dau_ra_ctdt_id`),
  KEY `fk_muc_tieu_hoc_phan_has_chuan_dau_ra_ctdt_muc_tieu_hoc_pha_idx` (`muc_tieu_hoc_phan_id`),
  CONSTRAINT `fk_muc_tieu_hoc_phan_has_chuan_dau_ra_ctdt_chuan_dau_ra_ctdt1` FOREIGN KEY (`chuan_dau_ra_ctdt_id`) REFERENCES `chuan_dau_ra_ctdt` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_muc_tieu_hoc_phan_has_chuan_dau_ra_ctdt_muc_tieu_hoc_phan1` FOREIGN KEY (`muc_tieu_hoc_phan_id`) REFERENCES `muc_tieu_hoc_phan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mota` varchar(45) NOT NULL,
  `trinh_do_nang_luc` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `muc_tieu_hoc_phan_id` int(10) unsigned NOT NULL,
  `chuan_dau_ra_hoc_phan_id` int(10) unsigned NOT NULL,
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ten_hoc_lieu` varchar(150) NOT NULL,
  `de_cuong_chi_tiet_id` int(10) unsigned NOT NULL,
  `loai_hoc_lieu_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`de_cuong_chi_tiet_id`),
  KEY `fk_nguon_hoc_lieu_de_cuong_chi_tiet1_idx` (`de_cuong_chi_tiet_id`),
  KEY `fk_nguon_hoc_lieu_loai_hoc_lieu1_idx` (`loai_hoc_lieu_id`),
  CONSTRAINT `fk_nguon_hoc_lieu_de_cuong_chi_tiet1` FOREIGN KEY (`de_cuong_chi_tiet_id`) REFERENCES `de_cuong_chi_tiet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_nguon_hoc_lieu_loai_hoc_lieu1` FOREIGN KEY (`loai_hoc_lieu_id`) REFERENCES `loai_hoc_lieu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nien_khoa`
--

LOCK TABLES `nien_khoa` WRITE;
/*!40000 ALTER TABLE `nien_khoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `nien_khoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tai_lieu`
--

DROP TABLE IF EXISTS `tai_lieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tai_lieu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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

-- Dump completed on 2017-11-05 22:49:13
