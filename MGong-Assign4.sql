-- MySQL dump 10.13  Distrib 8.0.43, for macos15 (x86_64)
--
-- Host: localhost    Database: united_helpers
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `volunteerId` int NOT NULL,
  `taskCode` int NOT NULL,
  `startDateTime` datetime NOT NULL,
  `endDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`volunteerId`,`taskCode`),
  KEY `fk_asg_task` (`taskCode`),
  CONSTRAINT `fk_asg_task` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`),
  CONSTRAINT `fk_asg_vol` FOREIGN KEY (`volunteerId`) REFERENCES `volunteer` (`volunteerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,1,'2025-10-10 09:00:00','2025-10-10 13:00:00'),(1,3,'2025-10-11 09:00:00','2025-10-11 13:00:00'),(1,4,'2025-10-11 17:30:00','2025-10-11 21:00:00'),(1,10,'2025-10-13 10:00:00','2025-10-13 12:00:00'),(2,1,'2025-10-10 13:00:00','2025-10-10 17:00:00'),(2,5,'2025-10-12 09:30:00',NULL),(2,8,'2025-10-13 14:00:00','2025-10-13 18:00:00'),(3,3,'2025-10-11 09:00:00',NULL),(4,4,'2025-10-11 10:00:00',NULL),(5,4,'2025-10-11 10:00:00',NULL),(6,7,'2025-10-12 12:00:00','2025-10-12 16:00:00'),(7,2,'2025-10-12 09:00:00','2025-10-12 12:00:00'),(8,8,'2025-10-13 09:00:00',NULL),(9,10,'2025-10-13 09:00:00',NULL),(10,9,'2025-10-13 13:00:00','2025-10-13 17:00:00');
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemId` int NOT NULL AUTO_INCREMENT,
  `itemDescription` varchar(120) NOT NULL,
  `itemValue` decimal(8,2) NOT NULL,
  `quantityOnHand` int NOT NULL,
  PRIMARY KEY (`itemId`),
  CONSTRAINT `item_chk_1` CHECK ((`itemValue` >= 0)),
  CONSTRAINT `item_chk_2` CHECK ((`quantityOnHand` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Adhesive bandages (10pk)',2.50,5000),(2,'Antiseptic wipes (10pk)',1.80,6000),(3,'Digital thermometer',7.20,800),(4,'500ml bottled water',0.60,10000),(5,'Flashlight',4.50,900),(6,'Canned beans',1.10,7000),(7,'Rice 1kg',2.20,5000),(8,'Manual can opener',2.00,1200),(9,'Baby diapers (10pk)',5.00,2000),(10,'Baby formula (400g)',8.50,1200),(11,'Baby wipes (20pk)',2.30,2500),(12,'Toy (soft plush)',3.00,900),(13,'N95 masks (5pk)',4.00,3000),(14,'Portable phone charger (power bank)',12.00,500),(15,'Rain poncho',1.50,2000);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageId` int NOT NULL AUTO_INCREMENT,
  `taskCode` int NOT NULL,
  `packageTypeId` smallint NOT NULL,
  `packageCreateDate` date NOT NULL,
  `packageWeight` decimal(6,2) NOT NULL,
  PRIMARY KEY (`packageId`),
  KEY `fk_pkg_task` (`taskCode`),
  KEY `fk_pkg_ptype` (`packageTypeId`),
  CONSTRAINT `fk_pkg_ptype` FOREIGN KEY (`packageTypeId`) REFERENCES `package_type` (`packageTypeId`),
  CONSTRAINT `fk_pkg_task` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`),
  CONSTRAINT `package_chk_1` CHECK ((`packageWeight` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,3,1,'2025-10-11',2.10),(2,3,1,'2025-10-11',2.05),(3,3,1,'2025-10-11',2.15),(4,4,3,'2025-10-11',3.40),(5,4,3,'2025-10-11',3.50),(6,4,3,'2025-10-11',3.35),(7,5,2,'2025-10-12',2.80),(8,5,2,'2025-10-12',2.85),(9,8,3,'2025-10-13',3.20),(10,8,3,'2025-10-13',3.25),(11,10,1,'2025-10-13',2.05),(12,10,1,'2025-10-13',2.12);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_contents`
--

DROP TABLE IF EXISTS `package_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_contents` (
  `itemId` int NOT NULL,
  `packageId` int NOT NULL,
  `itemQuantity` int NOT NULL,
  PRIMARY KEY (`itemId`,`packageId`),
  KEY `fk_pc_pkg` (`packageId`),
  CONSTRAINT `fk_pc_item` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `fk_pc_pkg` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`),
  CONSTRAINT `package_contents_chk_1` CHECK ((`itemQuantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_contents`
--

LOCK TABLES `package_contents` WRITE;
/*!40000 ALTER TABLE `package_contents` DISABLE KEYS */;
INSERT INTO `package_contents` VALUES (1,1,2),(1,2,2),(1,3,2),(1,11,2),(1,12,2),(2,1,2),(2,2,2),(2,3,2),(2,11,2),(2,12,2),(3,1,1),(3,2,1),(3,11,1),(4,1,1),(4,2,1),(4,3,1),(4,4,2),(4,5,2),(4,6,2),(4,9,2),(4,10,2),(4,12,1),(5,1,1),(5,3,1),(6,4,3),(6,5,3),(6,6,3),(6,9,2),(6,10,2),(7,4,2),(7,5,2),(7,6,2),(7,9,2),(7,10,2),(8,4,1),(8,5,1),(9,7,2),(9,8,2),(10,7,1),(10,8,1),(11,7,1),(11,8,1),(12,7,1),(12,8,1),(13,1,1),(13,2,1),(13,3,1),(13,11,1),(13,12,1),(14,7,1),(14,8,1),(15,4,1),(15,5,1),(15,6,1),(15,9,1),(15,10,1);
/*!40000 ALTER TABLE `package_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_type`
--

DROP TABLE IF EXISTS `package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_type` (
  `packageTypeId` smallint NOT NULL AUTO_INCREMENT,
  `packageTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`packageTypeId`),
  UNIQUE KEY `packageTypeName` (`packageTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_type`
--

LOCK TABLES `package_type` WRITE;
/*!40000 ALTER TABLE `package_type` DISABLE KEYS */;
INSERT INTO `package_type` VALUES (1,'basic medical'),(2,'child-care'),(3,'food');
/*!40000 ALTER TABLE `package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_list`
--

DROP TABLE IF EXISTS `packing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_list` (
  `packingListId` int NOT NULL AUTO_INCREMENT,
  `packingListName` varchar(100) NOT NULL,
  `packingListDescription` text,
  PRIMARY KEY (`packingListId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_list`
--

LOCK TABLES `packing_list` WRITE;
/*!40000 ALTER TABLE `packing_list` DISABLE KEYS */;
INSERT INTO `packing_list` VALUES (1,'Medical – Hurricane Basic','Hurricane response basic kit: bandages, antiseptic, thermometer, bottled water, flashlight'),(2,'Food – Campus Shelter Family','Shelf-stable family box for campus shelters: rice, canned beans, water, manual can opener; NO meat'),(3,'Child-Care – Displaced Families','Diapers, wipes, infant formula, small plush toy; for families displaced by hurricane');
/*!40000 ALTER TABLE `packing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `taskCode` int NOT NULL AUTO_INCREMENT,
  `packingListId` int DEFAULT NULL,
  `taskTypeId` smallint NOT NULL,
  `taskStatusId` smallint NOT NULL,
  `taskDescription` varchar(255) NOT NULL,
  PRIMARY KEY (`taskCode`),
  KEY `fk_task_type` (`taskTypeId`),
  KEY `fk_task_status` (`taskStatusId`),
  KEY `fk_task_packlist` (`packingListId`),
  CONSTRAINT `fk_task_packlist` FOREIGN KEY (`packingListId`) REFERENCES `packing_list` (`packingListId`),
  CONSTRAINT `fk_task_status` FOREIGN KEY (`taskStatusId`) REFERENCES `task_status` (`taskStatusId`),
  CONSTRAINT `fk_task_type` FOREIGN KEY (`taskTypeId`) REFERENCES `task_type` (`taskTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,NULL,1,2,'Family reunification hotline (post-hurricane)'),(2,NULL,1,1,'Warehouse inventory for emergency supplies'),(3,1,2,1,'Hurricane medical kits – assemble 500'),(4,2,2,1,'Campus shelter family food boxes – 1,000'),(5,3,2,2,'Child-care kits for displaced families – 300'),(6,NULL,3,1,'Onboard new volunteers for shelter ops'),(7,NULL,1,2,'Distribute info flyers at shelters'),(8,2,2,1,'Assemble 250 gluten-free food boxes'),(9,NULL,1,1,'Clean & reorganize loading bay (post-storm)'),(10,1,2,1,'Replenish 150 medical kits (triage tents)');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_status` (
  `taskStatusId` smallint NOT NULL AUTO_INCREMENT,
  `taskStatusName` varchar(50) NOT NULL,
  PRIMARY KEY (`taskStatusId`),
  UNIQUE KEY `taskStatusName` (`taskStatusName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_status`
--

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;
INSERT INTO `task_status` VALUES (4,'cancelled'),(3,'closed'),(2,'ongoing'),(1,'open');
/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_type`
--

DROP TABLE IF EXISTS `task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_type` (
  `taskTypeId` smallint NOT NULL AUTO_INCREMENT,
  `taskTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`taskTypeId`),
  UNIQUE KEY `taskTypeName` (`taskTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_type`
--

LOCK TABLES `task_type` WRITE;
/*!40000 ALTER TABLE `task_type` DISABLE KEYS */;
INSERT INTO `task_type` VALUES (3,'admin'),(2,'packing'),(1,'recurring');
/*!40000 ALTER TABLE `task_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `volunteerId` int NOT NULL AUTO_INCREMENT,
  `volunteerName` varchar(100) NOT NULL,
  `volunteerAddress` varchar(200) DEFAULT NULL,
  `volunteerTelephone` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`volunteerId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES (1,'Megan Gong','181 Mercer St, New York, NY 10012','3474535433'),(2,'Brian Park','215 W 34th St, New York, NY 10001','6468417720'),(3,'Clara Gómez','120 Sip Ave, Jersey City, NJ 07306','2018764122'),(4,'David Li','1425 86th St, Brooklyn, NY 11228','3479335899'),(5,'Emma Rossi','30-15 Broadway, Astoria, NY 11106','9176010044'),(6,'Farah Khan','12 Raymond Blvd, Newark, NJ 07102','9736241180'),(7,'George Miller','1 Hudson Pl, Hoboken, NJ 07030','5512387014'),(8,'Hiro Tanaka','55 Victory Blvd, Staten Island, NY 10301','7189816602'),(9,'Ivy Patel','33 St Marks Pl, New York, NY 10003','9172609183'),(10,'Juan Rivera','6 E 161st St, Bronx, NY 10451','7182934300'),(11,'Lila Kapoor','18 Halsey St, Newark, NJ 07102','9732215407'),(12,'Noah Stein','475 Atlantic Ave, Brooklyn, NY 11217','3474512238');
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-15 17:50:49
