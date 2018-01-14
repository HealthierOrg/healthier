-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: healthier
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `service_servicegroupcategory`
--

DROP TABLE IF EXISTS `service_servicegroupcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_servicegroupcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(200) NOT NULL,
  `category_description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_servicegroupcategory`
--

LOCK TABLES `service_servicegroupcategory` WRITE;
/*!40000 ALTER TABLE `service_servicegroupcategory` DISABLE KEYS */;
INSERT INTO `service_servicegroupcategory` VALUES (1,'Diagnostic','Diagnostic'),(2,'Vaccines','Vaccines are everything they need to be. You can see them here, there and everywhere you need them to be. I was once a vaccine. A lovely, cuddly little vaccine. '),(3,'Clinics','Clinics'),(4,'Procedures','Procedures'),(5,'Health Checks','Health Checks'),(6,'Ambulance & Medical Assistance','Ambulance & Medical Assistance'),(7,'Others','Others'),(8,'Talk To A Doctor','Talk To A Doctor'),(9,'Weight Management','Weight Management'),(10,'Cancer Screening','Cancer Screening'),(11,'Gym & Fitness Services','Gym & Fitness Services'),(12,'Medical Concierge','Medical Concierge'),(13,'Heart Tracker','Heart Tracker'),(14,'Foreign Medical Treatment','Foreign Medical Treatment');
/*!40000 ALTER TABLE `service_servicegroupcategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-13 18:46:47
