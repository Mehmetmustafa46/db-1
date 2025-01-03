-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: otel_seyahat1
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `kampanyalar`
--

DROP TABLE IF EXISTS `kampanyalar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kampanyalar` (
  `KampanyaID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `KampanyaAdi` varchar(100) DEFAULT NULL,
  `BaslangicTarihi` date DEFAULT NULL,
  `BitisTarihi` date DEFAULT NULL,
  `IndirimOrani` decimal(5,2) DEFAULT NULL,
  `KampanyaTipi` enum('Otel','Seyahat','Genel') DEFAULT NULL,
  `Aciklama` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`KampanyaID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kampanyalar`
--

LOCK TABLES `kampanyalar` WRITE;
/*!40000 ALTER TABLE `kampanyalar` DISABLE KEYS */;
INSERT INTO `kampanyalar` VALUES (1,'Yılbaşı İndirimi','2024-12-01','2025-01-01',20.00,'Genel','Yeni yıl için büyük indirimler!','2024-12-30 21:17:25','2024-12-30 21:17:25');
/*!40000 ALTER TABLE `kampanyalar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kampanyarezervasyon`
--

DROP TABLE IF EXISTS `kampanyarezervasyon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kampanyarezervasyon` (
  `KampanyaRezervasyonID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `KampanyaID` bigint(20) unsigned NOT NULL,
  `RezervasyonID` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`KampanyaRezervasyonID`),
  KEY `kampanyarezervasyon_kampanyaid_foreign` (`KampanyaID`),
  KEY `kampanyarezervasyon_rezervasyonid_foreign` (`RezervasyonID`),
  CONSTRAINT `kampanyarezervasyon_kampanyaid_foreign` FOREIGN KEY (`KampanyaID`) REFERENCES `kampanyalar` (`KampanyaID`) ON DELETE CASCADE,
  CONSTRAINT `kampanyarezervasyon_rezervasyonid_foreign` FOREIGN KEY (`RezervasyonID`) REFERENCES `rezervasyonlar` (`RezervasyonID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kampanyarezervasyon`
--

LOCK TABLES `kampanyarezervasyon` WRITE;
/*!40000 ALTER TABLE `kampanyarezervasyon` DISABLE KEYS */;
/*!40000 ALTER TABLE `kampanyarezervasyon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kullanici`
--

DROP TABLE IF EXISTS `kullanici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kullanici` (
  `KullaniciID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `KullaniciAdi` varchar(50) NOT NULL,
  `SifreHash` varchar(255) NOT NULL,
  `Ad` varchar(50) DEFAULT NULL,
  `Soyad` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefon` varchar(15) DEFAULT NULL,
  `Rol` enum('Musteri','Yonetici','Admin') NOT NULL DEFAULT 'Musteri',
  `KayitTarihi` date DEFAULT curdate(),
  `RolID` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`KullaniciID`),
  UNIQUE KEY `kullanici_kullaniciadi_unique` (`KullaniciAdi`),
  UNIQUE KEY `kullanici_email_unique` (`Email`),
  KEY `kullanici_rolid_foreign` (`RolID`),
  CONSTRAINT `kullanici_rolid_foreign` FOREIGN KEY (`RolID`) REFERENCES `roller` (`RolID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanici`
--

LOCK TABLES `kullanici` WRITE;
/*!40000 ALTER TABLE `kullanici` DISABLE KEYS */;
INSERT INTO `kullanici` VALUES (1,'admin','$2y$12$yyrsM/orkjQFrlkPEpJ14eXj3lJxZ03zAo9U/I8e2nVbaWmUzAJjm','Mustafa','Kara','mustafa@otelsistemi.com','5551234567','Admin','2024-12-31',1,'2024-12-30 21:43:29','2024-12-30 21:43:29');
/*!40000 ALTER TABLE `kullanici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2024_12_30_194508_create_kampanyalars_table',1),(2,'2024_12_30_194524_create_musterilers_table',1),(3,'2024_12_30_194526_create_rezervasyonlars_table',1),(4,'2024_12_30_194528_create_kampanyarezarvasyons_table',1),(5,'2024_12_30_194537_create_rollers_table',1),(6,'2024_12_30_194541_create_kullanicis_table',1),(7,'2024_12_30_194608_create_otellers_table',1),(8,'2024_12_30_194610_create_odalars_table',1),(9,'2024_12_30_194611_create_odahizmetleris_table',1),(10,'2024_12_30_194630_create_odaresimleris_table',1),(11,'2024_12_30_194735_create_odemeislemleris_table',1),(12,'2024_12_30_194826_create_otelhizmetleris_table',1),(13,'2024_12_30_194835_create_otelresimleris_table',1),(14,'2024_12_30_194857_create_otelrezervasyonlars_table',1),(15,'2024_12_30_194916_create_resepsiyonislemleris_table',1),(16,'2024_12_30_195015_create_seyahatlars_table',1),(17,'2024_12_30_195027_create_seyahatresimleris_table',1),(18,'2024_12_30_195046_create_turlars_table',1),(19,'2024_12_30_195049_create_seyahatrezervasyonlars_table',1),(20,'2024_12_30_195138_create_seyahatulasims_table',1),(21,'2024_12_30_195150_create_sikayetlers_table',1),(22,'2024_12_30_195207_create_turduraklaris_table',1),(23,'2024_12_30_195225_create_turrehberleris_table',1),(24,'2024_12_30_195226_create_turrehberatamas_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musteriler`
--

DROP TABLE IF EXISTS `musteriler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `musteriler` (
  `MusteriID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Ad` varchar(50) DEFAULT NULL,
  `Soyad` varchar(50) DEFAULT NULL,
  `Eposta` varchar(100) DEFAULT NULL,
  `Telefon` varchar(15) DEFAULT NULL,
  `KayitTarihi` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`MusteriID`),
  UNIQUE KEY `musteriler_eposta_unique` (`Eposta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musteriler`
--

LOCK TABLES `musteriler` WRITE;
/*!40000 ALTER TABLE `musteriler` DISABLE KEYS */;
INSERT INTO `musteriler` VALUES (1,'Mustafa','Kara','mustafa@otelsistemi.com','5551234567','2024-12-30','2024-12-30 20:50:48','2024-12-30 20:50:48');
/*!40000 ALTER TABLE `musteriler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odahizmetleri`
--

DROP TABLE IF EXISTS `odahizmetleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odahizmetleri` (
  `OdaHizmetID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `OdaID` bigint(20) unsigned NOT NULL,
  `HizmetAdi` varchar(100) DEFAULT NULL,
  `Aciklama` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`OdaHizmetID`),
  KEY `odahizmetleri_odaid_foreign` (`OdaID`),
  CONSTRAINT `odahizmetleri_odaid_foreign` FOREIGN KEY (`OdaID`) REFERENCES `odalar` (`OdaID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odahizmetleri`
--

LOCK TABLES `odahizmetleri` WRITE;
/*!40000 ALTER TABLE `odahizmetleri` DISABLE KEYS */;
INSERT INTO `odahizmetleri` VALUES (1,1,'Wi-Fi','Ücretsiz internet erişimi.','2024-12-30 21:19:20','2024-12-30 21:19:20');
/*!40000 ALTER TABLE `odahizmetleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odalar`
--

DROP TABLE IF EXISTS `odalar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odalar` (
  `OdaID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `OtelID` bigint(20) unsigned NOT NULL,
  `OdaTipi` varchar(50) DEFAULT NULL,
  `Fiyat` decimal(10,2) DEFAULT NULL,
  `Durum` enum('Uygun','Rezerve') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`OdaID`),
  KEY `odalar_otelid_foreign` (`OtelID`),
  CONSTRAINT `odalar_otelid_foreign` FOREIGN KEY (`OtelID`) REFERENCES `oteller` (`OtelID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odalar`
--

LOCK TABLES `odalar` WRITE;
/*!40000 ALTER TABLE `odalar` DISABLE KEYS */;
INSERT INTO `odalar` VALUES (1,1,'Tek Kişilik',150.00,'Uygun','2024-12-30 20:48:52','2024-12-30 20:48:52'),(2,1,'Tek Kişilik',150.00,'Uygun','2024-12-30 21:20:36','2024-12-30 21:20:36');
/*!40000 ALTER TABLE `odalar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odaresimleri`
--

DROP TABLE IF EXISTS `odaresimleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odaresimleri` (
  `ResimID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `OdaID` bigint(20) unsigned NOT NULL,
  `ResimYolu` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ResimID`),
  KEY `odaresimleri_odaid_foreign` (`OdaID`),
  CONSTRAINT `odaresimleri_odaid_foreign` FOREIGN KEY (`OdaID`) REFERENCES `odalar` (`OdaID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odaresimleri`
--

LOCK TABLES `odaresimleri` WRITE;
/*!40000 ALTER TABLE `odaresimleri` DISABLE KEYS */;
INSERT INTO `odaresimleri` VALUES (1,1,'images/rooms/room1.jpg','2024-12-30 21:19:41','2024-12-30 21:19:41');
/*!40000 ALTER TABLE `odaresimleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odemeislemleri`
--

DROP TABLE IF EXISTS `odemeislemleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odemeislemleri` (
  `OdemeID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `RezervasyonID` bigint(20) unsigned NOT NULL,
  `OdemeTarihi` date DEFAULT NULL,
  `Tutar` decimal(10,2) DEFAULT NULL,
  `OdemeTipi` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`OdemeID`),
  KEY `odemeislemleri_rezervasyonid_foreign` (`RezervasyonID`),
  CONSTRAINT `odemeislemleri_rezervasyonid_foreign` FOREIGN KEY (`RezervasyonID`) REFERENCES `rezervasyonlar` (`RezervasyonID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odemeislemleri`
--

LOCK TABLES `odemeislemleri` WRITE;
/*!40000 ALTER TABLE `odemeislemleri` DISABLE KEYS */;
/*!40000 ALTER TABLE `odemeislemleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otelhizmetleri`
--

DROP TABLE IF EXISTS `otelhizmetleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otelhizmetleri` (
  `HizmetID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `OtelID` bigint(20) unsigned NOT NULL,
  `HizmetAdi` varchar(100) DEFAULT NULL,
  `Aciklama` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`HizmetID`),
  KEY `otelhizmetleri_otelid_foreign` (`OtelID`),
  CONSTRAINT `otelhizmetleri_otelid_foreign` FOREIGN KEY (`OtelID`) REFERENCES `oteller` (`OtelID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otelhizmetleri`
--

LOCK TABLES `otelhizmetleri` WRITE;
/*!40000 ALTER TABLE `otelhizmetleri` DISABLE KEYS */;
INSERT INTO `otelhizmetleri` VALUES (1,1,'Spa','Relaxing spa services.','2024-12-30 20:49:09','2024-12-30 20:49:09');
/*!40000 ALTER TABLE `otelhizmetleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oteller`
--

DROP TABLE IF EXISTS `oteller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oteller` (
  `OtelID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `OtelAdi` varchar(100) DEFAULT NULL,
  `Lokasyon` varchar(100) DEFAULT NULL,
  `YildizSayisi` int(11) DEFAULT NULL,
  `Aciklama` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`OtelID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oteller`
--

LOCK TABLES `oteller` WRITE;
/*!40000 ALTER TABLE `oteller` DISABLE KEYS */;
INSERT INTO `oteller` VALUES (1,'Grand Hotel','İstanbul',5,'Lüks bir otel, şehrin kalbinde.','2024-12-30 20:48:05','2024-12-30 20:48:05'),(2,'Grand Hotel','İstanbul',5,'Lüks bir otel, şehrin kalbinde.','2024-12-30 21:22:28','2024-12-30 21:22:28');
/*!40000 ALTER TABLE `oteller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otelresimleri`
--

DROP TABLE IF EXISTS `otelresimleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otelresimleri` (
  `ResimID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `OtelID` bigint(20) unsigned NOT NULL,
  `ResimYolu` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ResimID`),
  KEY `otelresimleri_otelid_foreign` (`OtelID`),
  CONSTRAINT `otelresimleri_otelid_foreign` FOREIGN KEY (`OtelID`) REFERENCES `oteller` (`OtelID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otelresimleri`
--

LOCK TABLES `otelresimleri` WRITE;
/*!40000 ALTER TABLE `otelresimleri` DISABLE KEYS */;
INSERT INTO `otelresimleri` VALUES (2,1,'images/hotels/hotel1.jpg','2024-12-30 20:48:21','2024-12-30 20:48:21');
/*!40000 ALTER TABLE `otelresimleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otelrezervasyonlar`
--

DROP TABLE IF EXISTS `otelrezervasyonlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otelrezervasyonlar` (
  `RezervasyonID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `MusteriID` bigint(20) unsigned NOT NULL,
  `OdaID` bigint(20) unsigned NOT NULL,
  `GirisTarihi` date DEFAULT NULL,
  `CikisTarihi` date DEFAULT NULL,
  `ToplamTutar` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`RezervasyonID`),
  KEY `otelrezervasyonlar_musteriid_foreign` (`MusteriID`),
  KEY `otelrezervasyonlar_odaid_foreign` (`OdaID`),
  CONSTRAINT `otelrezervasyonlar_musteriid_foreign` FOREIGN KEY (`MusteriID`) REFERENCES `musteriler` (`MusteriID`) ON DELETE CASCADE,
  CONSTRAINT `otelrezervasyonlar_odaid_foreign` FOREIGN KEY (`OdaID`) REFERENCES `odalar` (`OdaID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otelrezervasyonlar`
--

LOCK TABLES `otelrezervasyonlar` WRITE;
/*!40000 ALTER TABLE `otelrezervasyonlar` DISABLE KEYS */;
INSERT INTO `otelrezervasyonlar` VALUES (1,1,1,'2024-12-31','2025-01-03',300.00,'2024-12-30 21:37:39','2024-12-30 21:37:39');
/*!40000 ALTER TABLE `otelrezervasyonlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resepsiyonislemleri`
--

DROP TABLE IF EXISTS `resepsiyonislemleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resepsiyonislemleri` (
  `IslemID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `RezervasyonID` bigint(20) unsigned NOT NULL,
  `IslemTarihi` date DEFAULT NULL,
  `IslemTipi` enum('Check-in','Check-out') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IslemID`),
  KEY `resepsiyonislemleri_rezervasyonid_foreign` (`RezervasyonID`),
  CONSTRAINT `resepsiyonislemleri_rezervasyonid_foreign` FOREIGN KEY (`RezervasyonID`) REFERENCES `otelrezervasyonlar` (`RezervasyonID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resepsiyonislemleri`
--

LOCK TABLES `resepsiyonislemleri` WRITE;
/*!40000 ALTER TABLE `resepsiyonislemleri` DISABLE KEYS */;
INSERT INTO `resepsiyonislemleri` VALUES (2,1,'2024-01-01','Check-in','2024-12-30 21:38:16','2024-12-30 21:38:16');
/*!40000 ALTER TABLE `resepsiyonislemleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezervasyonlar`
--

DROP TABLE IF EXISTS `rezervasyonlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rezervasyonlar` (
  `RezervasyonID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `MusteriID` bigint(20) unsigned NOT NULL,
  `RezervasyonTipi` enum('Otel','Seyahat') DEFAULT NULL,
  `IlgiliID` bigint(20) unsigned DEFAULT NULL,
  `RezervasyonTarihi` date DEFAULT NULL,
  `ToplamTutar` decimal(10,2) DEFAULT NULL,
  `Durum` enum('Beklemede','Onaylandı','Iptal Edildi') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`RezervasyonID`),
  KEY `rezervasyonlar_musteriid_foreign` (`MusteriID`),
  CONSTRAINT `rezervasyonlar_musteriid_foreign` FOREIGN KEY (`MusteriID`) REFERENCES `musteriler` (`MusteriID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezervasyonlar`
--

LOCK TABLES `rezervasyonlar` WRITE;
/*!40000 ALTER TABLE `rezervasyonlar` DISABLE KEYS */;
INSERT INTO `rezervasyonlar` VALUES (1,1,'Seyahat',1,'2025-01-02',50000.00,'','2025-01-02 19:01:08','2025-01-02 19:01:12'),(2,1,'Otel',1,'2024-12-01',450.00,'Onaylandı','2025-01-02 15:02:20','2025-01-02 15:02:20');
/*!40000 ALTER TABLE `rezervasyonlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roller`
--

DROP TABLE IF EXISTS `roller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roller` (
  `RolID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `RolAdi` varchar(50) NOT NULL,
  `Aciklama` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`RolID`),
  UNIQUE KEY `roller_roladi_unique` (`RolAdi`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roller`
--

LOCK TABLES `roller` WRITE;
/*!40000 ALTER TABLE `roller` DISABLE KEYS */;
INSERT INTO `roller` VALUES (1,'Admin','Yönetici','2024-12-30 21:26:49','2024-12-30 21:26:49'),(2,'Yonetici','Otel Yöneticisi','2024-12-30 21:26:49','2024-12-30 21:26:49'),(3,'Musteri','Müşteri','2024-12-30 21:26:49','2024-12-30 21:26:49');
/*!40000 ALTER TABLE `roller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seyahatler`
--

DROP TABLE IF EXISTS `seyahatler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seyahatler` (
  `SeyahatID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `SeyahatAdi` varchar(100) DEFAULT NULL,
  `BaslangicTarihi` date DEFAULT NULL,
  `BitisTarihi` date DEFAULT NULL,
  `Bolge` varchar(50) DEFAULT NULL,
  `Aciklama` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`SeyahatID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seyahatler`
--

LOCK TABLES `seyahatler` WRITE;
/*!40000 ALTER TABLE `seyahatler` DISABLE KEYS */;
INSERT INTO `seyahatler` VALUES (1,'İstanbul Turu','2024-06-01','2024-06-10','İstanbul','Tarihi ve kültürel zenginliklere sahip İstanbul turu.','2024-12-30 20:52:44','2024-12-30 20:52:44'),(2,'Antalya Tatili','2024-07-01','2024-07-07','Antalya','Plajda rahatlatıcı bir tatil keyfi.','2024-12-30 20:52:44','2024-12-30 20:52:44');
/*!40000 ALTER TABLE `seyahatler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seyahatresimleri`
--

DROP TABLE IF EXISTS `seyahatresimleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seyahatresimleri` (
  `ResimID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `SeyahatID` bigint(20) unsigned NOT NULL,
  `ResimYolu` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ResimID`),
  KEY `seyahatresimleri_seyahatid_foreign` (`SeyahatID`),
  CONSTRAINT `seyahatresimleri_seyahatid_foreign` FOREIGN KEY (`SeyahatID`) REFERENCES `seyahatler` (`SeyahatID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seyahatresimleri`
--

LOCK TABLES `seyahatresimleri` WRITE;
/*!40000 ALTER TABLE `seyahatresimleri` DISABLE KEYS */;
INSERT INTO `seyahatresimleri` VALUES (1,1,'images/seyahat/istanbul1.jpg','2024-12-30 21:27:27','2024-12-30 21:27:27'),(2,2,'images/seyahat/antalya1.jpg','2024-12-30 21:27:27','2024-12-30 21:27:27');
/*!40000 ALTER TABLE `seyahatresimleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seyahatrezervasyonlar`
--

DROP TABLE IF EXISTS `seyahatrezervasyonlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seyahatrezervasyonlar` (
  `RezervasyonID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `MusteriID` bigint(20) unsigned NOT NULL,
  `TurID` bigint(20) unsigned NOT NULL,
  `RezervasyonTarihi` date DEFAULT NULL,
  `ToplamTutar` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`RezervasyonID`),
  KEY `seyahatrezervasyonlar_musteriid_foreign` (`MusteriID`),
  KEY `seyahatrezervasyonlar_turid_foreign` (`TurID`),
  CONSTRAINT `seyahatrezervasyonlar_musteriid_foreign` FOREIGN KEY (`MusteriID`) REFERENCES `musteriler` (`MusteriID`) ON DELETE CASCADE,
  CONSTRAINT `seyahatrezervasyonlar_turid_foreign` FOREIGN KEY (`TurID`) REFERENCES `turlar` (`TurID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seyahatrezervasyonlar`
--

LOCK TABLES `seyahatrezervasyonlar` WRITE;
/*!40000 ALTER TABLE `seyahatrezervasyonlar` DISABLE KEYS */;
INSERT INTO `seyahatrezervasyonlar` VALUES (2,1,1,'2024-06-01',250.00,'2024-12-30 21:28:48','2024-12-30 21:28:48');
/*!40000 ALTER TABLE `seyahatrezervasyonlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seyahatulasim`
--

DROP TABLE IF EXISTS `seyahatulasim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seyahatulasim` (
  `UlasimID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `SeyahatID` bigint(20) unsigned NOT NULL,
  `UlasimTipi` varchar(50) DEFAULT NULL,
  `Fiyat` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`UlasimID`),
  KEY `seyahatulasim_seyahatid_foreign` (`SeyahatID`),
  CONSTRAINT `seyahatulasim_seyahatid_foreign` FOREIGN KEY (`SeyahatID`) REFERENCES `seyahatler` (`SeyahatID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seyahatulasim`
--

LOCK TABLES `seyahatulasim` WRITE;
/*!40000 ALTER TABLE `seyahatulasim` DISABLE KEYS */;
INSERT INTO `seyahatulasim` VALUES (1,1,'Otobüs',300.00,'2024-12-30 21:41:42','2024-12-30 21:41:42'),(2,2,'Uçak',500.00,'2024-12-30 21:41:42','2024-12-30 21:41:42');
/*!40000 ALTER TABLE `seyahatulasim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sikayetler`
--

DROP TABLE IF EXISTS `sikayetler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sikayetler` (
  `SikayetID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `MusteriID` bigint(20) unsigned NOT NULL,
  `SikayetMetni` text DEFAULT NULL,
  `Tarih` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`SikayetID`),
  KEY `sikayetler_musteriid_foreign` (`MusteriID`),
  CONSTRAINT `sikayetler_musteriid_foreign` FOREIGN KEY (`MusteriID`) REFERENCES `musteriler` (`MusteriID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sikayetler`
--

LOCK TABLES `sikayetler` WRITE;
/*!40000 ALTER TABLE `sikayetler` DISABLE KEYS */;
INSERT INTO `sikayetler` VALUES (1,1,'Odam çok soğuktu, ısıtma sistemi düzgün çalışmıyordu.','2024-12-30','2024-12-30 20:54:37','2024-12-30 20:54:37'),(3,1,'Odam çok soğuktu, ısıtma sistemi düzgün çalışmıyordu.','2024-12-31','2024-12-30 21:10:46','2024-12-30 21:10:46');
/*!40000 ALTER TABLE `sikayetler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turduraklari`
--

DROP TABLE IF EXISTS `turduraklari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turduraklari` (
  `DurakID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `TurID` bigint(20) unsigned NOT NULL,
  `DurakAdi` varchar(100) DEFAULT NULL,
  `Aciklama` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`DurakID`),
  KEY `turduraklari_turid_foreign` (`TurID`),
  CONSTRAINT `turduraklari_turid_foreign` FOREIGN KEY (`TurID`) REFERENCES `turlar` (`TurID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turduraklari`
--

LOCK TABLES `turduraklari` WRITE;
/*!40000 ALTER TABLE `turduraklari` DISABLE KEYS */;
INSERT INTO `turduraklari` VALUES (1,1,'Topkapı Sarayı','Osmanlı İmparatorluğu’nun sarayı.','2024-12-30 21:42:07','2024-12-30 21:42:07'),(2,2,'Konyaaltı Plajı','Antalya’nın en ünlü plajlarından biri.','2024-12-30 21:42:07','2024-12-30 21:42:07');
/*!40000 ALTER TABLE `turduraklari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turlar`
--

DROP TABLE IF EXISTS `turlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turlar` (
  `TurID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `SeyahatID` bigint(20) unsigned NOT NULL,
  `TurAdi` varchar(100) DEFAULT NULL,
  `Kapasite` int(11) DEFAULT NULL,
  `Fiyat` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`TurID`),
  KEY `turlar_seyahatid_foreign` (`SeyahatID`),
  CONSTRAINT `turlar_seyahatid_foreign` FOREIGN KEY (`SeyahatID`) REFERENCES `seyahatler` (`SeyahatID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turlar`
--

LOCK TABLES `turlar` WRITE;
/*!40000 ALTER TABLE `turlar` DISABLE KEYS */;
INSERT INTO `turlar` VALUES (1,1,'İstanbul Tarihi Turu',20,250.00,'2024-12-30 21:27:59','2024-12-30 21:27:59'),(2,2,'Antalya Plajı Turu',50,400.00,'2024-12-30 21:27:59','2024-12-30 21:27:59');
/*!40000 ALTER TABLE `turlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turrehberatama`
--

DROP TABLE IF EXISTS `turrehberatama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turrehberatama` (
  `AtamaID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `TurID` bigint(20) unsigned NOT NULL,
  `RehberID` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`AtamaID`),
  KEY `turrehberatama_turid_foreign` (`TurID`),
  KEY `turrehberatama_rehberid_foreign` (`RehberID`),
  CONSTRAINT `turrehberatama_rehberid_foreign` FOREIGN KEY (`RehberID`) REFERENCES `turrehberleri` (`RehberID`) ON DELETE CASCADE,
  CONSTRAINT `turrehberatama_turid_foreign` FOREIGN KEY (`TurID`) REFERENCES `turlar` (`TurID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turrehberatama`
--

LOCK TABLES `turrehberatama` WRITE;
/*!40000 ALTER TABLE `turrehberatama` DISABLE KEYS */;
INSERT INTO `turrehberatama` VALUES (1,1,1,'2024-12-30 21:42:44','2024-12-30 21:42:44'),(2,2,2,'2024-12-30 21:42:44','2024-12-30 21:42:44');
/*!40000 ALTER TABLE `turrehberatama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turrehberleri`
--

DROP TABLE IF EXISTS `turrehberleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turrehberleri` (
  `RehberID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Ad` varchar(50) DEFAULT NULL,
  `Soyad` varchar(50) DEFAULT NULL,
  `Telefon` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`RehberID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turrehberleri`
--

LOCK TABLES `turrehberleri` WRITE;
/*!40000 ALTER TABLE `turrehberleri` DISABLE KEYS */;
INSERT INTO `turrehberleri` VALUES (1,'Ahmet','Yılmaz','5551122334','ahmet@rehber.com','2024-12-30 21:33:42','2024-12-30 21:33:42'),(2,'Ayşe','Kaya','5559988776','ayse@rehber.com','2024-12-30 21:33:42','2024-12-30 21:33:42');
/*!40000 ALTER TABLE `turrehberleri` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-03 10:29:42
