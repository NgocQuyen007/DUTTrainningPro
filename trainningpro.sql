-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: trainningpro
-- ------------------------------------------------------
-- Server version	5.6.25-log

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
INSERT INTO `chuan_dau_ra_hoc_phan` VALUES (1,'Kiến thức và lập luận ngành','I',NULL,NULL),(2,'Hiểu được các khái niệm, phương pháp, kỹ thuật trong phân tích và thiết kế','T',NULL,NULL),(3,'Có khả năng quản lý thời gian','I',NULL,NULL),(4,'Phát triển được các kỹ năng giao tiếp','I',NULL,NULL),(5,'Kỹ năng, phẩm chất cá nhân và nghề nghiệp','U',NULL,NULL),(6,'Phát triển kỹ năng làm việc nhóm','I',NULL,NULL),(7,'Kỹ năng và phẩm chất giữa các cá nhân',NULL,NULL,NULL),(8,'Năng lực thực hành nghề nghiệp',NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuong_trinh_dao_tao`
--

LOCK TABLES `chuong_trinh_dao_tao` WRITE;
/*!40000 ALTER TABLE `chuong_trinh_dao_tao` DISABLE KEYS */;
INSERT INTO `chuong_trinh_dao_tao` VALUES (7,1,1,'Công nghệ Thông tin CNPM','2013'),(9,1,2,'cnpm','1121ssss');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
INSERT INTO `giang_vien` VALUES (1,'Lê Thị Mỹ Hạnh','2009-04-07',0,'ltmhanh@dut.udn.vn','0905737577','ltmhanh','123456','19112017225316.png',1,4),(2,'Mai Văn Hà','2009-04-07',1,'mvha@dut.udn.vn','0905737578','mvha','secret','19112017225316.png',2,4),(3,'Nguyễn Văn Nguyên','2009-04-07',1,'nvnguyen@dut.udn.vn','0905737579','nvnguyen','secret','19112017225316.png',2,4),(4,'Nguyễn Tấn Khôi','2009-04-07',0,'dtmhanh@dut.udn.vn','0905756231','dtmhanh','secret','19112017225316.png',3,4),(5,'Nguyễn Thanh Bình','2009-04-07',1,'nva@dut.udn.vn','0905562451','nguyenvana','secret','19112017225316.png',2,5),(6,'Huỳnh Hữu Hưng','2009-04-07',0,'ntb@dut.udn.vn','0905751354','nguyenthib','secret','19112017225316.png',2,4),(7,'Tạ Quang Hoàng','2009-04-07',1,'lvc@dut.udn.vn','0905732227','levanc','secret','19112017225316.png',4,4),(20,'Phan Ngọc Quyền','2017-11-14',1,'levanbinh@gmail.com','0905252327','admin1234','e10adc3949ba59abbe56e057f20f883e','19112017235230.jpg',1,1),(23,'Nguyễn Văn Hưng','2017-11-15',0,'234567','0935737556','234567','f46c1daad76f1b91574b0d48ec1db4d3','20112017232734.jpg',1,1),(24,'Nguyễn Viết Hùng','2017-11-30',1,'yghuygjikghujik','0935755544','đasadasdasdasd','34d261467a3c0c9d3a4ae2cf9db7cb5c','',1,1),(25,'Trương Thanh Hữu','2017-11-01',0,'7452yhujiokpl','0985737577','lkjkljkljkj','2cc5afe1962b565ba56728211978f4ca','20112017004421.jpg',2,1),(26,'Đào Thanh Minh','2017-11-14',1,'khocnhe@email','0905755667','uhuhuhuhki','55a0dfca662117092a6aa66487384621','20112017232437.jpg',1,1),(28,'Trần Hồ Thủy Tiên','2017-11-16',1,'1313ádasd','0902327589','vdvdvdv','0c8480602955d962d97c3d8cd85b86a9','20112017233054.jpg',1,1),(29,'Lê Thị Minh Hỷ','2017-11-15',1,'jujjhjghjhg','0915737599','hhhnhnhhh','bf8c375d03ce2948301ce30fbfc5d5a8','',1,1),(30,'Nguyễn Văn Hiệu','2017-11-21',1,'sdasdsdsadfbbecSt','0935738557','teoteo','54b07c0989d3b2845cfd9f3c8a44886d','',1,14),(31,'Võ Đức Hoàng','1988-11-20',1,'hoangkasu@gmail.com','0945375571','hoangaka','e10adc3949ba59abbe56e057f20f883e','21112017001234.jpg',2,4),(32,'Trương Ngọc Châu','2017-11-15',1,'kokokok@gmail.com','0905737574','lechaudt','40365b6766f16121eb07a99aa7179e90','',5,8);
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
INSERT INTO `hoc_ky` VALUES (1,'Học Kỳ I'),(2,'Học Kỳ  II'),(3,'Học Kỳ III'),(4,'Học Kỳ IV'),(5,'Học Kỳ V'),(6,'Học Kỳ VI'),(7,'Học Kỳ VII'),(8,'Học Kỳ VIII'),(9,'Học Kỳ IX'),(10,'Học Kỳ X');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoc_phan`
--

LOCK TABLES `hoc_phan` WRITE;
/*!40000 ALTER TABLE `hoc_phan` DISABLE KEYS */;
INSERT INTO `hoc_phan` VALUES (1,'Hình Họa','Graphics','HP100000','Bắt buộc',1,2),(2,'Giải Tích','Analytics','HP100001','Bắt buộc',1,2),(3,'Vẽ Kỹ Thuật','Technical drawing','HP100002','Bắt buộc',1,2),(4,'Tư Tưởng Mac Lenin','Mac Lenin','HP100003','Bắt buộc',1,2),(5,'Nguyên Lí 1','Original Story 1','HP100004','Bắt buộc',1,2),(6,'Nguyên Lí 2','Original Story 2','HP100005','Bắt buộc',1,2),(7,'TH Tin Học Đại Cương','General Information Practices','HP100006','Bắt buộc',2,1),(8,'TH Tin hoc dai cuong','Analytics','HP100007','Bat buoc',1,1),(9,'Cơ Sở Ngành Mạng','Network Infrastructure','HP100008','Bắt buộc',2,2),(10,'Công Nghệ Phần Mềm','Software technology','HP100009','Bắt buộc',2,2),(11,'Quản Lí Dự Án CNTT','Project management IT','HP100010','Tự Chọn',3,2),(12,'Chuyên Đề Công Nghệ Phần Mềm','Software Engineering Seminar','HP100011','Bắt buộc',3,2),(13,'Đồ Án Cơ Sở Ngành Mạng','Network Infrastructure Simplicity','HP100012','Bắt buộc',3,2),(14,'Đồ Án Công Nghệ Phần Mềm','Software Engineering','HP100013','Bắt buộc',3,2),(15,'Thực Tập Công Nhân','Trainee Worker','HP100014','Bắt buộc',4,2),(16,'Thực Tập Tốt Nghiệp','Graduation internship','HP100015','Bắt buộc',6,2),(17,'Pháp Luật Đại Cương','General law','HP100016','Bắt buộc',4,2),(19,'Toán','Math','HP100032','Bắt buộc',1,2),(26,'Hóa Học','Chemistry','HP100038','Bắt buộc',1,2);
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
INSERT INTO `khoa` VALUES (1,'CN Nhiệt - Điện Lạnh',5),(2,'Cơ Khí',2),(3,'Cơ Khí Giao Thông',3),(4,'Công Nghệ Thông Tin',4),(5,'Điện',6),(6,'Điện Tử Viễn Thông',7),(7,'Hóa',8),(8,'Kiến Trúc',9),(9,'Môi Trường',10),(10,'Quản Lý Dự Án',11),(11,'Sư Phạm Kỹ Thuật',12),(12,'XD  Cầu Đường',13),(13,'XD Dân Dụng - Công Nghiệp',14),(14,'XD Thủy Lợi - Thủy Điện',15);
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
INSERT INTO `khoi_kien_thuc` VALUES (1,'Kiến thức đại cương'),(2,'Kiến thức cơ sở ngành'),(3,'Kiến thức chuyên ngành'),(4,'Kiến thức khác'),(5,'Học phần về kỹ năng chung'),(6,'Học phần thực tập/ Đồ án tốt nghiệp');
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
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'GIAO_VU'),(3,'GIANG_VIEN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
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

-- Dump completed on 2017-11-30 23:21:35
