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
  `Tempat_Lahir` varchar(50) DEFAULT NULL,
  `Tgl_Lahir` date DEFAULT NULL,
  `Jabatan` enum('','GB','LK','L','AA') DEFAULT NULL COMMENT 'gb = gurubesar\nLK = Lektor Kepala\nL = Lektors\nAA = Asisten Ahli',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NIDN` (`NIDN`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOSEN`
--

LOCK TABLES `DOSEN` WRITE;
/*!40000 ALTER TABLE `DOSEN` DISABLE KEYS */;
INSERT INTO `DOSEN` VALUES (10,'0310053701','a. anton, Prof, Ir.','','','','balikpapan','1940-01-10','GB'),(11,'0304055701','chandrasa sukardi, Prof.Dr.Ir.MSc','','','','malang','1957-01-04','GB'),(12,'0312017603','dede lia zariatin, ST.,MT','','','','banyuwangi','1976-01-12','L'),(13,'0318035402','eddy djatmiko, Ir, MT','','','','pamekasan','1954-01-18','LK'),(14,'0012077004','endra sujatmika, Ir, MT','','','','surabaya','1970-01-12','AA'),(15,'0327087501','i gede eka lesmana, ST.MT','','','','jakarta','1975-01-27','AA'),(16,'0310075802','prawoto, Prof.Dr, Ir. MSAE','','','','madiun','1958-01-10','GB'),(17,'0316117101','ramon trisno, ST.MT','','','','matur','1971-01-16','AA'),(18,'0312077302','rudi hermawan','','','','jakarta','1973-01-12','AA'),(19,'0317014901','titiek endang sukowati, Ir.MSi','','','','yogyakarta','1949-01-17','LK'),(20,'0302116202','tri mulyanto, Ir, MT','','','','yogyakarta','1962-01-02','LK'),(21,'0310025701','djoko w. karmiadji, Prof.Dr.MSME','','','','banyuwangi','1957-01-10','GB'),(22,'0319096502','eka maulana, Ir, MMT','','','','jakarta','1965-01-19','L'),(23,'0310104101','wibowo paryatmo, Prof.,Dr, Ir','','','','solo','1941-01-10','GB'),(24,'0317107301','eko prasetyo, ST.,MT','','','','yogyakarta','1973-01-17','L'),(25,'0318125902','hasani hariri, Ir, MT','','','','kuningan','1959-01-18','LK'),(26,'0313067103','hendri sukma, ST, MT','','','','bukittinggi','0071-01-13','L'),(27,'0309065904','agus edi pramono, Drs.Ir.MSi','','','','madiun','1959-01-06','LK'),(28,'0301106001','agus riyanto Ir, MM','','','','surabaya','1960-01-01','L'),(29,'0315016101','bambang sulaksono, Ir.MT.','','','','banyumas','1951-01-08','L'),(30,'0022044502','bambang suryawan, Prof, Ir, Dr,MT','','','','purworejo','1945-01-22','GB'),(31,'0327106601','bintoro maisdwiananto, Ir, MM','','','','malang','1966-01-27',''),(32,'0324075901','djoni rustino, Ir, MT','','','','medan','1959-01-24','L'),(33,'0312045401','erni dianawati, SH.MT','','','','pare','1954-01-12','L'),(34,'0305084901','ginanjar H, Ir., MT','','','','jakarta','1949-01-05','L'),(36,'0325065101','herlan martono, Ir, M.Sc','','','','purworejo','1951-01-25','LK'),(37,'0022035703','m. sholeh, Drs., ST','','','','semarang','1957-01-22','LK'),(38,'0327025802','nafsan upara, Ir, MT','','','','ambon','1958-01-27','AA'),(39,'0305074801','pirnadi, Ir.MSc.','','','','klaten','1948-01-05','LK'),(40,'0313034401','setiyono, Ir.MSc','','','','ponogoro','1944-01-13','L'),(41,'0313xxxxxx','suharsono, Ir., MSc(T.Mesin)','','','','lamongan','1947-01-08','LK'),(42,'0316114301','wigie ruslan, Prof, Dr, Ir, MBA','','','','makassar','1943-01-16','GB'),(43,'0004107602','wina libyawati ST, MM','','','','jakarta','1976-01-04',''),(44,'0404115101','yogie sirosz gaos Ir., MT','','','','garut','1951-01-04','LK'),(45,'0301055302','yuhani djaya, Ir.MT','','','','banjarmasin','1953-01-01','L'),(46,'0001086104','paulus sukusno. Drs., ST.,MT','','','','klaten','1961-01-01','AA'),(47,'0325055801','sorimuda harahap, Ir., Drs., MT','','','','medan','1958-01-25','LK');
/*!40000 ALTER TABLE `DOSEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JADWAL`
--

DROP TABLE IF EXISTS `JADWAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JADWAL` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Matakuliah` int(11) NOT NULL,
  `ID_Dosen` int(11) DEFAULT NULL,
  `Jam` time DEFAULT NULL,
  `Hari` smallint(6) DEFAULT '2' COMMENT '1 = minggu,\n2 = senin,\n3 = selasa,\n4 = rabu\n5 = kamis\n6 = jumat\n7 = sabtu',
  `Ruang` varchar(30) DEFAULT NULL,
  `Keterangan` enum('0','1','2','3','4','5','6') DEFAULT NULL COMMENT '0 = - ,\n 1 = hadir ,\n 2 = izin ,\n 3 = absen ,\n 4 = tugas ,\n 5 = Sakit\n6=uts',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_Matakuliah` (`ID_Matakuliah`),
  KEY `JADWAL_ibfk_2` (`ID_Dosen`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JADWAL`
--

LOCK TABLES `JADWAL` WRITE;
/*!40000 ALTER TABLE `JADWAL` DISABLE KEYS */;
INSERT INTO `JADWAL` VALUES (19,3,46,'10:00:00',4,'207','1'),(20,4,21,'11:30:00',4,'207','0'),(21,10,NULL,NULL,2,NULL,NULL),(22,201,NULL,NULL,4,'','0'),(23,202,NULL,NULL,4,'','1'),(24,203,NULL,NULL,4,'','0');
/*!40000 ALTER TABLE `JADWAL` ENABLE KEYS */;
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
  `Kategori_Matkul` enum('wajib','pilihan') DEFAULT NULL,
  `Kategori_Tingkat` enum('S1','D3') NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Kode_Matkul` (`Kode_Matkul`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATAKULIAH`
--

LOCK TABLES `MATAKULIAH` WRITE;
/*!40000 ALTER TABLE `MATAKULIAH` DISABLE KEYS */;
INSERT INTO `MATAKULIAH` VALUES (2,'mk001','kalkulus 1',3,1,'wajib','S1'),(3,'mk002','fisika dasar 1',4,1,'wajib','S1'),(4,'mk003','bahasa indonesia',2,1,'wajib','S1'),(8,'mk004','ilmu sosial dan budaya dasar',2,1,'wajib','S1'),(9,'mk005','gambar teknik',2,1,'wajib','S1'),(10,'mk006','pengantar teknik mesin',3,1,'wajib','S1'),(18,'mk007','kalkulus 2',3,2,'wajib','S1'),(19,'mk008','fisika dasar 2',4,2,'wajib','S1'),(20,'mk009','bahasa inggris',2,2,'wajib','S1'),(21,'mk010','ilmu alamiah dasar',2,2,'wajib','S1'),(22,'mk011','gambar mesin',2,2,'wajib','S1'),(23,'mk012','kimia dasar',3,2,'wajib','S1'),(24,'mk013','inovasi dan kewirausahaan',2,2,'wajib','S1'),(25,'mk014','matematika teknik 1',3,3,'wajib','S1'),(26,'mk015','statika struktur',3,3,'wajib','S1'),(27,'mk016','kinematika',2,3,'wajib','S1'),(28,'mk017','material teknik',2,3,'wajib','S1'),(29,'mk018','termodinamika',2,3,'wajib','S1'),(30,'mk019','mekanika fluida',2,3,'wajib','S1'),(31,'mk020','teknik tenaga listrik',2,3,'wajib','S1'),(32,'mk021','integrated project 1a',2,3,'wajib','S1'),(33,'mk022','matematika teknik 2',3,4,'wajib','S1'),(34,'mk023','matematika kekuatan material',3,4,'wajib','S1'),(35,'mk024','dinamika teknik',2,4,'wajib','S1'),(36,'mk025','material teknik 2',2,4,'wajib','S1'),(37,'mk026','termodinamika 2',2,4,'wajib','S1'),(38,'mk027','mekanika fluida 2',2,4,'wajib','S1'),(39,'mk028','elektronika',2,4,'wajib','S1'),(40,'mk029','integrated project 1b',2,3,'wajib','S1'),(49,'mk030','elemen mesin 1',3,5,'wajib','S1'),(50,'mk031','getaran mekanik',2,5,'wajib','S1'),(51,'mk032','pengukuran teknik',2,5,'wajib','S1'),(52,'mk033','perpindahan kalor dan massa 1',2,5,'wajib','S1'),(53,'mk034','mesin konversi energi 1',2,5,'wajib','S1'),(54,'mk035','teknik pengaturan',3,5,'wajib','S1'),(55,'mk036','proses manufaktur',3,5,'wajib','S1'),(56,'mk037','integrated project 2a',2,5,'wajib','S1'),(73,'mk038','elemen mesin 2',3,6,'wajib','S1'),(74,'mk039','hukum bisnis dan HKI',2,6,'wajib','S1'),(75,'mk040','metrologi industri dan kontrol geometris',2,6,'wajib','S1'),(76,'mk041','perpindahan kalor dan massa 2',2,5,'wajib','S1'),(77,'mk042','mesin konversi energi 2',2,6,'wajib','S1'),(78,'mk043','mekatronika',3,6,'wajib','S1'),(79,'mk044','proses manufaktur 2',3,6,'wajib','S1'),(80,'mk045','integrated project 2b',2,6,'wajib','S1'),(94,'mk046','pendidikan kewarganegaraan',2,7,'wajib','S1'),(95,'mk047','manajemen pengembangan bisnis 1',2,7,'wajib','S1'),(96,'mk048','pendidikan agama',2,7,'wajib','S1'),(97,'mk049','teknik lingkungan',2,7,'wajib','S1'),(98,'mk050','sistem hidrolis pneumatis',3,7,'pilihan','S1'),(99,'mk051','sistem pemipaan',3,7,'pilihan','S1'),(100,'mk052','perancangan bejana tekan',3,7,'pilihan','S1'),(101,'mk053','kontrol numerik & robotika',3,7,'pilihan','S1'),(102,'mk054','teknik perawatan mesin',3,7,'pilihan','S1'),(103,'mk055','perancangan mesin produksi kreatif',3,7,'pilihan','S1'),(104,'mk056','teknik kendaraan',3,7,'pilihan','S1'),(105,'mk057','mesin-mesin pertanian',3,7,'pilihan','S1'),(106,'mk058','alat berat dan angkut',3,7,'pilihan','S1'),(158,'mk059','pompa kompresor',3,7,'pilihan','S1'),(159,'mk060','bahan bakar dan pelumas',3,7,'pilihan','S1'),(160,'mk061','ketel uap',3,7,'pilihan','S1'),(161,'mk062','energi alternatif',3,7,'pilihan','S1'),(162,'mk063','trubin',3,7,'pilihan','S1'),(163,'mk064','teknik pendinginan',3,7,'pilihan','S1'),(164,'mk065','motor bakar',3,7,'pilihan','S1'),(165,'mk066','alat penukar kalor',3,7,'pilihan','S1'),(166,'mk067','mesin fluida',3,7,'pilihan','S1'),(167,'mk068','manajemen produksi dan operasi',3,7,'pilihan','S1'),(168,'mk069','teknik keselamatan kerja',3,7,'pilihan','S1'),(169,'mk070','teknik permesinan',3,7,'pilihan','S1'),(170,'mk071','teknologi manufaktur maju',3,7,'pilihan','S1'),(171,'mk072','Tek. pengecoran logam & injection moulding',3,7,'pilihan','S1'),(172,'mk073','teknologi CAD/CAM',3,7,'pilihan','S1'),(173,'mk074','perancangan fasilitas manufaktur',3,7,'pilihan','S1'),(174,'mk075','mesin perkakas & perkakas bantu',3,7,'pilihan','S1'),(175,'mk076','otomasi industri',3,7,'pilihan','S1'),(176,'mk077','otomasi servo',3,7,'pilihan','S1'),(177,'mk078','microcontroller',3,7,'pilihan','S1'),(178,'mk079','sistem informasi manufaktur',3,7,'pilihan','S1'),(179,'mk080','PLC',3,7,'pilihan','S1'),(180,'mk081','pemrogramman c++',3,7,'pilihan','S1'),(181,'mk082','actuator, sensor & transduser',3,7,'pilihan','S1'),(190,'mk083','filsafat pancasila',3,8,'wajib','S1'),(191,'mk084','manajemen pengembangan bisnis 2',2,8,'wajib','S1'),(192,'mk085','praktek kerja',1,8,'wajib','S1'),(193,'mk086','tugas akhir',5,8,'wajib','S1'),(201,'0081xxxx','pendidikan agama',2,1,'wajib','D3'),(202,'00812202','fisika',2,1,'wajib','D3'),(203,'00812204','matematika',2,1,'wajib','D3'),(204,'00812206','material teknik',2,1,'wajib','D3'),(205,'00812208','gambar teknik',2,1,'wajib','D3'),(206,'00812301','teknik kerja bangku & plat',2,1,'wajib','D3'),(207,'00822107','bahasa indonesia',2,2,'wajib','D3'),(208,'00823213','elemen mesin',3,2,'wajib','D3'),(209,'00822210','mekanika teknik',2,2,'wajib','D3'),(210,'00822304','gambar mesin',2,2,'wajib','D3'),(211,'00822305','metrologi industri',2,2,'wajib','D3'),(212,'00832211','bahasa inggris',2,3,'wajib','D3'),(213,'00832215','mesin konversi energi',2,3,'wajib','D3'),(214,'00832309','teknik tenaga listrik & elektronika',2,3,'wajib','D3'),(215,'00832311','proses manufaktur',2,3,'wajib','D3'),(216,'00832401','perancangan mesin 1',2,3,'wajib','D3'),(217,'00832327','bahan bakan & pelumas',2,3,'wajib','D3'),(218,'00832328','motor penggerak',2,3,'wajib','D3'),(219,'00832330','kelistrikan otomotif',2,3,'wajib','D3'),(220,'00843108','pendidikan kewarganegaraan',2,4,'wajib','D3'),(221,'00842313','CAD/CAM',2,4,'wajib','D3'),(222,'00842314','teknik perawatan',2,4,'wajib','D3'),(223,'00842403','perancangan mesin 2',2,4,'wajib','D3'),(224,'00843406','tugas terpadu perancangan',4,4,'wajib','D3'),(225,'00842332','penerus daya 1',2,4,'wajib','D3'),(226,'00842334','chasis',2,4,'wajib','D3'),(227,'00844314','tugas terpadu otomotif',4,4,'wajib','D3'),(234,'00852109','filsafat pancasila',2,5,'wajib','D3'),(235,'00852316','pneumatik dan hidrolik',2,5,'wajib','D3'),(236,'00853406','kapita selekta perancangan',3,5,'wajib','D3'),(237,'00852336','managemen bengkel',2,5,'wajib','D3'),(238,'00852337','penggerak daya 2',2,5,'wajib','D3'),(239,'00853339','kapita selekta otomotif',3,5,'wajib','D3'),(240,'00862319','kerja praktek',2,6,'wajib','D3'),(241,'00864329','tugas akhir',4,6,'wajib','D3');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PENGUMUMAN`
--

LOCK TABLES `PENGUMUMAN` WRITE;
/*!40000 ALTER TABLE `PENGUMUMAN` DISABLE KEYS */;
INSERT INTO `PENGUMUMAN` VALUES (1,'kalkulis 1 kumpul tugas');
/*!40000 ALTER TABLE `PENGUMUMAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER` (
  `ID` int(11) unsigned NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Alamat` text,
  `Email` varchar(50) DEFAULT NULL,
  `No_Telpon` varchar(20) DEFAULT NULL,
  `Aktif` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Username_UNIQUE` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'admin','123456','Muhammad Sidratul Mutaha','jl kartini','Muhammad.mochi@gmail.com','08999904741',1);
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE`
--

DROP TABLE IF EXISTS `USER_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ROLE` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID_USER` int(10) unsigned NOT NULL,
  `Wewenang` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_user_roles` (`ID_USER`),
  CONSTRAINT `FK_user_roles` FOREIGN KEY (`ID_USER`) REFERENCES `USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE`
--

LOCK TABLES `USER_ROLE` WRITE;
/*!40000 ALTER TABLE `USER_ROLE` DISABLE KEYS */;
INSERT INTO `USER_ROLE` VALUES (1,1,'ROLE_ADMIN');
/*!40000 ALTER TABLE `USER_ROLE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-03  9:07:18
