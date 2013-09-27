CREATE DATABASE  IF NOT EXISTS `jadwal-mesin` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `jadwal-mesin`;
-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (i686)
--
-- Host: 127.0.0.1    Database: jadwal-mesin
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.13.04.1

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
-- Table structure for table `DOSEN`
--

DROP TABLE IF EXISTS `DOSEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOSEN` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NIDN` varchar(30) DEFAULT NULL,
  `Nama_Dosen` varchar(50) NOT NULL,
  `Alamat` text,
  `No_Telpon` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NIDN` (`NIDN`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOSEN`
--

LOCK TABLES `DOSEN` WRITE;
/*!40000 ALTER TABLE `DOSEN` DISABLE KEYS */;
INSERT INTO `DOSEN` VALUES (7,'4510210013','Muhammad Sidratul Muntaha','Jl. Kartini','089999904741','muhammad.mochi@gmail.com');
/*!40000 ALTER TABLE `DOSEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JADWALD3`
--

DROP TABLE IF EXISTS `JADWALD3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JADWALD3` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Matakuliah` int(11) NOT NULL,
  `ID_Dosen` int(11) DEFAULT NULL,
  `Jam` time DEFAULT NULL,
  `Hari` smallint(6) DEFAULT NULL,
  `Ruang` varchar(30) DEFAULT NULL,
  `Keterangan` enum('0','1','2','3','4','5') DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Matakuliah` (`ID_Matakuliah`),
  KEY `ID_Dosen` (`ID_Dosen`),
  CONSTRAINT `JADWALD3_ibfk_1` FOREIGN KEY (`ID_Matakuliah`) REFERENCES `MATAKULIAH` (`ID`),
  CONSTRAINT `JADWALD3_ibfk_2` FOREIGN KEY (`ID_Dosen`) REFERENCES `DOSEN` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JADWALD3`
--

LOCK TABLES `JADWALD3` WRITE;
/*!40000 ALTER TABLE `JADWALD3` DISABLE KEYS */;
INSERT INTO `JADWALD3` VALUES (1,3,7,'10:30:00',6,'','2'),(2,2,NULL,NULL,NULL,NULL,NULL),(3,94,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `JADWALD3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JADWALS1`
--

DROP TABLE IF EXISTS `JADWALS1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JADWALS1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Matakuliah` int(11) NOT NULL,
  `ID_Dosen` int(11) DEFAULT NULL,
  `Jam` time DEFAULT NULL,
  `Hari` smallint(6) DEFAULT '1' COMMENT '0 = minggu,\n1 = senin,\n2 = selasa,\n3 = rabu\n4 = kamis\n5 = jumat\n6 = sabtu',
  `Ruang` varchar(30) DEFAULT NULL,
  `Keterangan` enum('0','1','2','3','4','5') DEFAULT NULL COMMENT '0 = - ,\n 1 = hadir ,\n 2 = izin ,\n 3 = absen ,\n 4 = tugas ,\n 5 = Sakit',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_Matakuliah` (`ID_Matakuliah`),
  KEY `JADWAL_ibfk_2` (`ID_Dosen`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JADWALS1`
--

LOCK TABLES `JADWALS1` WRITE;
/*!40000 ALTER TABLE `JADWALS1` DISABLE KEYS */;
INSERT INTO `JADWALS1` VALUES (12,2,7,'14:30:00',3,'309','1'),(13,4,7,'13:30:00',4,'320','4'),(16,3,7,'08:00:00',6,'205','1');
/*!40000 ALTER TABLE `JADWALS1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATAKULIAH`
--

DROP TABLE IF EXISTS `MATAKULIAH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MATAKULIAH` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Kode_Matkul` varchar(20) NOT NULL,
  `Nama_Matkul` varchar(50) NOT NULL,
  `SKS` tinyint(4) NOT NULL,
  `Semester` tinyint(4) NOT NULL,
  `Kategori` enum('wajib','pilihan') DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Kode_Matkul` (`Kode_Matkul`),
  UNIQUE KEY `Nama_Matkul` (`Nama_Matkul`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATAKULIAH`
--

LOCK TABLES `MATAKULIAH` WRITE;
/*!40000 ALTER TABLE `MATAKULIAH` DISABLE KEYS */;
INSERT INTO `MATAKULIAH` VALUES (2,'mk001','kalkulus 1',3,1,'wajib'),(3,'mk002','fisika dasar 1',4,1,'wajib'),(4,'mk003','bahasa indonesia',2,1,'wajib'),(8,'mk004','ilmu sosial dan budaya dasar',2,1,'wajib'),(9,'mk005','gambar teknik',2,1,'wajib'),(10,'mk006','pengantar teknik mesin',3,1,'wajib'),(18,'mk007','kalkulus 2',3,2,'wajib'),(19,'mk008','fisika dasar 2',4,2,'wajib'),(20,'mk009','bahasa inggris',2,2,'wajib'),(21,'mk010','ilmu alamiah dasar',2,2,'wajib'),(22,'mk011','gambar mesin',2,2,'wajib'),(23,'mk012','kimia dasar',3,2,'wajib'),(24,'mk013','inovasi dan kewirausahaan',2,2,'wajib'),(25,'mk014','matematika teknik 1',3,3,'wajib'),(26,'mk015','statika struktur',3,3,'wajib'),(27,'mk016','kinematika',2,3,'wajib'),(28,'mk017','material teknik',2,3,'wajib'),(29,'mk018','termodinamika',2,3,'wajib'),(30,'mk019','mekanika fluida',2,3,'wajib'),(31,'mk020','teknik tenaga listrik',2,3,'wajib'),(32,'mk021','integrated project 1a',2,3,'wajib'),(33,'mk022','matematika teknik 2',3,4,'wajib'),(34,'mk023','matematika kekuatan material',3,4,'wajib'),(35,'mk024','dinamika teknik',2,4,'wajib'),(36,'mk025','material teknik 2',2,4,'wajib'),(37,'mk026','termodinamika 2',2,4,'wajib'),(38,'mk027','mekanika fluida 2',2,4,'wajib'),(39,'mk028','elektronika',2,4,'wajib'),(40,'mk029','integrated project 1b',2,3,'wajib'),(49,'mk030','elemen mesin 1',3,5,'wajib'),(50,'mk031','getaran mekanik',2,5,'wajib'),(51,'mk032','pengukuran teknik',2,5,'wajib'),(52,'mk033','perpindahan kalor dan massa 1',2,5,'wajib'),(53,'mk034','mesin konversi energi 1',2,5,'wajib'),(54,'mk035','teknik pengaturan',3,5,'wajib'),(55,'mk036','proses manufaktur',3,5,'wajib'),(56,'mk037','integrated project 2a',2,5,'wajib'),(73,'mk038','elemen mesin 2',3,6,'wajib'),(74,'mk039','hukum bisnis dan HKI',2,6,'wajib'),(75,'mk040','metrologi industri dan kontrol geometris',2,6,'wajib'),(76,'mk041','perpindahan kalor dan massa 2',2,5,'wajib'),(77,'mk042','mesin konversi energi 2',2,6,'wajib'),(78,'mk043','mekatronika',3,6,'wajib'),(79,'mk044','proses manufaktur 2',3,6,'wajib'),(80,'mk045','integrated project 2b',2,6,'wajib'),(94,'mk046','pendidikan kewarganegaraan',2,7,'wajib'),(95,'mk047','manajemen pengembangan bisnis 1',2,7,'wajib'),(96,'mk048','pendidikan agama',2,7,'wajib'),(97,'mk049','teknik lingkungan',2,7,'wajib'),(98,'mk050','sistem hidrolis pneumatis',3,7,'pilihan'),(99,'mk051','sistem pemipaan',3,7,'pilihan'),(100,'mk052','perancangan bejana tekan',3,7,'pilihan'),(101,'mk053','kontrol numerik & robotika',3,7,'pilihan'),(102,'mk054','teknik perawatan mesin',3,7,'pilihan'),(103,'mk055','perancangan mesin produksi kreatif',3,7,'pilihan'),(104,'mk056','teknik kendaraan',3,7,'pilihan'),(105,'mk057','mesin-mesin pertanian',3,7,'pilihan'),(106,'mk058','alat berat dan angkut',3,7,'pilihan'),(158,'mk059','pompa kompresor',3,7,'pilihan'),(159,'mk060','bahan bakar dan pelumas',3,7,'pilihan'),(160,'mk061','ketel uap',3,7,'pilihan'),(161,'mk062','energi alternatif',3,7,'pilihan'),(162,'mk063','trubin',3,7,'pilihan'),(163,'mk064','teknik pendinginan',3,7,'pilihan'),(164,'mk065','motor bakar',3,7,'pilihan'),(165,'mk066','alat penukar kalor',3,7,'pilihan'),(166,'mk067','mesin fluida',3,7,'pilihan'),(167,'mk068','manajemen produksi dan operasi',3,7,'pilihan'),(168,'mk069','teknik keselamatan kerja',3,7,'pilihan'),(169,'mk070','teknik permesinan',3,7,'pilihan'),(170,'mk071','teknologi manufaktur maju',3,7,'pilihan'),(171,'mk072','Tek. pengecoran logam & injection moulding',3,7,'pilihan'),(172,'mk073','teknologi CAD/CAM',3,7,'pilihan'),(173,'mk074','perancangan fasilitas manufaktur',3,7,'pilihan'),(174,'mk075','mesin perkakas & perkakas bantu',3,7,'pilihan'),(175,'mk076','otomasi industri',3,7,'pilihan'),(176,'mk077','otomasi servo',3,7,'pilihan'),(177,'mk078','microcontroller',3,7,'pilihan'),(178,'mk079','sistem informasi manufaktur',3,7,'pilihan'),(179,'mk080','PLC',3,7,'pilihan'),(180,'mk081','pemrogramman c++',3,7,'pilihan'),(181,'mk082','actuator, sensor & transduser',3,7,'pilihan'),(190,'mk083','filsafat pancasila',3,8,'wajib'),(191,'mk084','manajemen pengembangan bisnis 2',2,8,'wajib'),(192,'mk085','praktek kerja',1,8,'wajib'),(193,'mk086','tugas akhir',5,8,'wajib');
/*!40000 ALTER TABLE `MATAKULIAH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PENGUMUMAN`
--

DROP TABLE IF EXISTS `PENGUMUMAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PENGUMUMAN` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Text_Pengumuman` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PENGUMUMAN`
--

LOCK TABLES `PENGUMUMAN` WRITE;
/*!40000 ALTER TABLE `PENGUMUMAN` DISABLE KEYS */;
INSERT INTO `PENGUMUMAN` VALUES (2,'kuliah kalkulus pindah di 205');
/*!40000 ALTER TABLE `PENGUMUMAN` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-27 16:36:01
