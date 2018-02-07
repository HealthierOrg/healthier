-- MySQL dump 10.13  Distrib 5.7.21, for osx10.10 (x86_64)
--
-- Host: localhost    Database: healthier_test
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_e8701ad4` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_user_healthieruser_id` FOREIGN KEY (`user_id`) REFERENCES `user_healthieruser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (8,'olamyy53@gmail.com',0,1,8);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id` (`email_address_id`),
  CONSTRAINT `account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add group',1,'add_group'),(2,'Can change group',1,'change_group'),(3,'Can delete group',1,'delete_group'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add content type',3,'add_contenttype'),(8,'Can change content type',3,'change_contenttype'),(9,'Can delete content type',3,'delete_contenttype'),(10,'Can add session',4,'add_session'),(11,'Can change session',4,'change_session'),(12,'Can delete session',4,'delete_session'),(13,'Can add site',5,'add_site'),(14,'Can change site',5,'change_site'),(15,'Can delete site',5,'delete_site'),(16,'Can add log entry',6,'add_logentry'),(17,'Can change log entry',6,'change_logentry'),(18,'Can delete log entry',6,'delete_logentry'),(19,'Can add email confirmation',7,'add_emailconfirmation'),(20,'Can change email confirmation',7,'change_emailconfirmation'),(21,'Can delete email confirmation',7,'delete_emailconfirmation'),(22,'Can add email address',8,'add_emailaddress'),(23,'Can change email address',8,'change_emailaddress'),(24,'Can delete email address',8,'delete_emailaddress'),(25,'Can add Message',9,'add_message'),(26,'Can change Message',9,'change_message'),(27,'Can delete Message',9,'delete_message'),(28,'Can add Message',10,'add_mailermessage'),(29,'Can change Message',10,'change_mailermessage'),(30,'Can delete Message',10,'delete_mailermessage'),(31,'Can add Attachment',11,'add_attachment'),(32,'Can change Attachment',11,'change_attachment'),(33,'Can delete Attachment',11,'delete_attachment'),(34,'Can add csv import',12,'add_csvimport'),(35,'Can change csv import',12,'change_csvimport'),(36,'Can delete csv import',12,'delete_csvimport'),(37,'Can add import model',13,'add_importmodel'),(38,'Can change import model',13,'change_importmodel'),(39,'Can delete import model',13,'delete_importmodel'),(40,'Can add consumer',14,'add_consumer'),(41,'Can change consumer',14,'change_consumer'),(42,'Can delete consumer',14,'delete_consumer'),(43,'Can add promo',15,'add_promo'),(44,'Can change promo',15,'change_promo'),(45,'Can delete promo',15,'delete_promo'),(46,'Can add provider',16,'add_provider'),(47,'Can change provider',16,'change_provider'),(48,'Can delete provider',16,'delete_provider'),(49,'Can add provider rating',17,'add_providerrating'),(50,'Can change provider rating',17,'change_providerrating'),(51,'Can delete provider rating',17,'delete_providerrating'),(52,'Can add faq',18,'add_faq'),(53,'Can change faq',18,'change_faq'),(54,'Can delete faq',18,'delete_faq'),(55,'Can add terms and condition',19,'add_termsandcondition'),(56,'Can change terms and condition',19,'change_termsandcondition'),(57,'Can delete terms and condition',19,'delete_termsandcondition'),(58,'Can add healthier user clinical data',20,'add_healthieruserclinicaldata'),(59,'Can change healthier user clinical data',20,'change_healthieruserclinicaldata'),(60,'Can delete healthier user clinical data',20,'delete_healthieruserclinicaldata'),(61,'Can add healthier user misc data',21,'add_healthierusermiscdata'),(62,'Can change healthier user misc data',21,'change_healthierusermiscdata'),(63,'Can delete healthier user misc data',21,'delete_healthierusermiscdata'),(64,'Can add healthier user',22,'add_healthieruser'),(65,'Can change healthier user',22,'change_healthieruser'),(66,'Can delete healthier user',22,'delete_healthieruser'),(67,'Can add family',23,'add_family'),(68,'Can change family',23,'change_family'),(69,'Can delete family',23,'delete_family'),(70,'Can add healthier user ailment data',24,'add_healthieruserailmentdata'),(71,'Can change healthier user ailment data',24,'change_healthieruserailmentdata'),(72,'Can delete healthier user ailment data',24,'delete_healthieruserailmentdata'),(73,'Can add healthier user blood data',25,'add_healthieruserblooddata'),(74,'Can change healthier user blood data',25,'change_healthieruserblooddata'),(75,'Can delete healthier user blood data',25,'delete_healthieruserblooddata'),(76,'Can add suggest service',26,'add_suggestservice'),(77,'Can change suggest service',26,'change_suggestservice'),(78,'Can delete suggest service',26,'delete_suggestservice'),(79,'Can add service requests',27,'add_servicerequests'),(80,'Can change service requests',27,'change_servicerequests'),(81,'Can delete service requests',27,'delete_servicerequests'),(82,'Can add ordered service',28,'add_orderedservice'),(83,'Can change ordered service',28,'change_orderedservice'),(84,'Can delete ordered service',28,'delete_orderedservice'),(85,'Can add service group category',29,'add_servicegroupcategory'),(86,'Can change service group category',29,'change_servicegroupcategory'),(87,'Can delete service group category',29,'delete_servicegroupcategory'),(88,'Can add healthier service',30,'add_healthierservice'),(89,'Can change healthier service',30,'change_healthierservice'),(90,'Can delete healthier service',30,'delete_healthierservice'),(91,'Can add service group',31,'add_servicegroup'),(92,'Can change service group',31,'change_servicegroup'),(93,'Can delete service group',31,'delete_servicegroup'),(94,'Can add service report',32,'add_servicereport'),(95,'Can change service report',32,'change_servicereport'),(96,'Can delete service report',32,'delete_servicereport'),(97,'Can add provider finance',33,'add_providerfinance'),(98,'Can change provider finance',33,'change_providerfinance'),(99,'Can delete provider finance',33,'delete_providerfinance'),(100,'Can add email list',34,'add_emaillist'),(101,'Can change email list',34,'change_emaillist'),(102,'Can delete email list',34,'delete_emaillist'),(103,'Can add testimonials',35,'add_testimonials'),(104,'Can change testimonials',35,'change_testimonials'),(105,'Can delete testimonials',35,'delete_testimonials');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumers_consumer`
--

DROP TABLE IF EXISTS `consumers_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumers_consumer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `healthier_consumer_id` varchar(30) NOT NULL,
  `healthier_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `healthier_id_id` (`healthier_id_id`),
  CONSTRAINT `consumers_cons_healthier_id_id_a3289225_fk_user_healthieruser_id` FOREIGN KEY (`healthier_id_id`) REFERENCES `user_healthieruser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumers_consumer`
--

LOCK TABLES `consumers_consumer` WRITE;
/*!40000 ALTER TABLE `consumers_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumers_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvimport_csvimport`
--

DROP TABLE IF EXISTS `csvimport_csvimport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvimport_csvimport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(255) NOT NULL,
  `field_list` longtext NOT NULL,
  `upload_file` varchar(100) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `encoding` varchar(32) NOT NULL,
  `upload_method` varchar(50) NOT NULL,
  `error_log` longtext NOT NULL,
  `import_date` date NOT NULL,
  `import_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvimport_csvimport`
--

LOCK TABLES `csvimport_csvimport` WRITE;
/*!40000 ALTER TABLE `csvimport_csvimport` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvimport_csvimport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvimport_importmodel`
--

DROP TABLE IF EXISTS `csvimport_importmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvimport_importmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numeric_id` int(10) unsigned NOT NULL,
  `natural_key` varchar(100) NOT NULL,
  `csvimport_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `csvimport_import_csvimport_id_5a422b1c_fk_csvimport_csvimport_id` (`csvimport_id`),
  CONSTRAINT `csvimport_import_csvimport_id_5a422b1c_fk_csvimport_csvimport_id` FOREIGN KEY (`csvimport_id`) REFERENCES `csvimport_csvimport` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvimport_importmodel`
--

LOCK TABLES `csvimport_importmodel` WRITE;
/*!40000 ALTER TABLE `csvimport_importmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvimport_importmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_healthieruser_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_healthieruser_id` FOREIGN KEY (`user_id`) REFERENCES `user_healthieruser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-02-03 20:24:01.129457','1','Testimonial by Fatimah.',1,'[{\"added\": {}}]',35,9),(2,'2018-02-03 20:24:25.129780','2','Testimonial by Kelvin.',1,'[{\"added\": {}}]',35,9),(3,'2018-02-03 20:24:38.197082','3','Testimonial by Deola.',1,'[{\"added\": {}}]',35,9),(4,'2018-02-03 20:24:49.884186','2','Testimonial by Kelvin.',2,'[{\"changed\": {\"fields\": [\"testimonial\"]}}]',35,9),(5,'2018-02-03 20:25:04.250782','1','Testimonial by Fatimah.',2,'[{\"changed\": {\"fields\": [\"testimonial\"]}}]',35,9);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'account','emailaddress'),(7,'account','emailconfirmation'),(6,'admin','logentry'),(1,'auth','group'),(2,'auth','permission'),(14,'consumers','consumer'),(3,'contenttypes','contenttype'),(12,'csvimport','csvimport'),(13,'csvimport','importmodel'),(9,'django_messages','message'),(33,'finances','providerfinance'),(11,'mailqueue','attachment'),(10,'mailqueue','mailermessage'),(15,'providers','promo'),(16,'providers','provider'),(17,'providers','providerrating'),(30,'service','healthierservice'),(28,'service','orderedservice'),(31,'service','servicegroup'),(29,'service','servicegroupcategory'),(32,'service','servicereport'),(27,'service','servicerequests'),(26,'service','suggestservice'),(4,'sessions','session'),(5,'sites','site'),(34,'user','emaillist'),(23,'user','family'),(18,'user','faq'),(22,'user','healthieruser'),(24,'user','healthieruserailmentdata'),(25,'user','healthieruserblooddata'),(20,'user','healthieruserclinicaldata'),(21,'user','healthierusermiscdata'),(19,'user','termsandcondition'),(35,'user','testimonials');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_messages_message`
--

DROP TABLE IF EXISTS `django_messages_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_messages_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(140) NOT NULL,
  `body` longtext NOT NULL,
  `sent_at` datetime(6) DEFAULT NULL,
  `read_at` datetime(6) DEFAULT NULL,
  `replied_at` datetime(6) DEFAULT NULL,
  `sender_deleted_at` datetime(6) DEFAULT NULL,
  `recipient_deleted_at` datetime(6) DEFAULT NULL,
  `parent_msg_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_mess_parent_msg_id_3a04ba96_fk_django_messages_message_id` (`parent_msg_id`),
  KEY `django_messages_m_recipient_id_bdfe9b23_fk_user_healthieruser_id` (`recipient_id`),
  KEY `django_messages_mess_sender_id_abbb5a51_fk_user_healthieruser_id` (`sender_id`),
  CONSTRAINT `django_mess_parent_msg_id_3a04ba96_fk_django_messages_message_id` FOREIGN KEY (`parent_msg_id`) REFERENCES `django_messages_message` (`id`),
  CONSTRAINT `django_messages_m_recipient_id_bdfe9b23_fk_user_healthieruser_id` FOREIGN KEY (`recipient_id`) REFERENCES `user_healthieruser` (`id`),
  CONSTRAINT `django_messages_mess_sender_id_abbb5a51_fk_user_healthieruser_id` FOREIGN KEY (`sender_id`) REFERENCES `user_healthieruser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_messages_message`
--

LOCK TABLES `django_messages_message` WRITE;
/*!40000 ALTER TABLE `django_messages_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_messages_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-02-02 20:01:20.900961'),(2,'contenttypes','0002_remove_content_type_name','2018-02-02 20:01:20.951231'),(3,'auth','0001_initial','2018-02-02 20:01:21.115832'),(4,'auth','0002_alter_permission_name_max_length','2018-02-02 20:01:21.138153'),(5,'auth','0003_alter_user_email_max_length','2018-02-02 20:01:21.150197'),(6,'auth','0004_alter_user_username_opts','2018-02-02 20:01:21.160644'),(7,'auth','0005_alter_user_last_login_null','2018-02-02 20:01:21.173002'),(8,'auth','0006_require_contenttypes_0002','2018-02-02 20:01:21.174898'),(9,'auth','0007_alter_validators_add_error_messages','2018-02-02 20:01:21.189241'),(10,'auth','0008_alter_user_username_max_length','2018-02-02 20:01:21.198780'),(11,'user','0001_initial','2018-02-02 20:01:21.727979'),(12,'account','0001_initial','2018-02-02 20:01:21.795451'),(13,'account','0002_emailaddress_user','2018-02-02 20:01:21.907596'),(14,'admin','0001_initial','2018-02-02 20:01:21.993059'),(15,'admin','0002_logentry_remove_auto_add','2018-02-02 20:01:22.042506'),(16,'consumers','0001_initial','2018-02-02 20:01:22.068793'),(17,'consumers','0002_consumer_healthier_id','2018-02-02 20:01:22.168291'),(18,'csvimport','0001_initial','2018-02-02 20:01:22.233846'),(19,'csvimport','0002_test_models','2018-02-02 20:01:22.456743'),(20,'csvimport','0003_auto_20180202_1044','2018-02-02 20:01:22.585128'),(21,'django_messages','0001_initial','2018-02-02 20:01:22.699660'),(22,'django_messages','0002_auto_20160607_0852','2018-02-02 20:01:22.738169'),(23,'mailqueue','0001_initial','2018-02-02 20:01:22.853967'),(24,'mailqueue','0002_mailermessage_reply_to','2018-02-02 20:01:22.892077'),(25,'mailqueue','0003_auto_20160920_1458','2018-02-02 20:01:22.934721'),(26,'mailqueue','0004_mailermessage_created','2018-02-02 20:01:22.974426'),(27,'mailqueue','0005_cc_address_created','2018-02-02 20:01:23.008091'),(28,'providers','0001_initial','2018-02-02 20:01:23.184845'),(29,'providers','0002_auto_20180202_2000','2018-02-02 20:01:23.405957'),(30,'service','0001_initial','2018-02-02 20:01:24.055399'),(31,'sessions','0001_initial','2018-02-02 20:01:24.098484'),(32,'sites','0001_initial','2018-02-02 20:01:24.132302'),(33,'consumers','0003_auto_20180203_1652','2018-02-03 16:52:52.143269'),(34,'providers','0003_auto_20180203_1652','2018-02-03 16:52:52.414269'),(35,'service','0002_auto_20180203_1652','2018-02-03 16:52:52.762985'),(36,'user','0002_auto_20180203_1652','2018-02-03 16:52:52.976036'),(37,'consumers','0004_auto_20180203_2020','2018-02-03 20:20:38.195065'),(38,'providers','0004_auto_20180203_2020','2018-02-03 20:20:38.482505'),(39,'service','0003_auto_20180203_2020','2018-02-03 20:20:38.870439'),(40,'user','0003_auto_20180203_2020','2018-02-03 20:20:39.192535'),(41,'consumers','0005_auto_20180203_2023','2018-02-03 20:23:42.384436'),(42,'providers','0005_auto_20180203_2023','2018-02-03 20:23:42.681305'),(43,'service','0004_auto_20180203_2023','2018-02-03 20:23:43.130214'),(44,'user','0004_auto_20180203_2023','2018-02-03 20:23:43.506097'),(45,'consumers','0006_auto_20180205_0705','2018-02-05 07:05:55.825328'),(46,'providers','0006_auto_20180205_0705','2018-02-05 07:05:56.286626'),(47,'service','0005_auto_20180205_0705','2018-02-05 07:05:56.875155'),(48,'user','0005_auto_20180205_0705','2018-02-05 07:05:57.198465'),(49,'consumers','0007_auto_20180206_0631','2018-02-06 06:31:22.918876'),(50,'providers','0007_auto_20180206_0631','2018-02-06 06:31:23.468036'),(51,'service','0006_auto_20180206_0631','2018-02-06 06:31:24.165168'),(52,'user','0006_auto_20180206_0631','2018-02-06 06:31:24.560577');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5c0kp1c0e8wedk20wr8o9si35vv9b0c6','NjcxMDhmZGRmNWMzOTY5MzdlNTc1NmFmYzcxZGNkZWMwNTZkOTIyYjp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDBlMTQ1YWY1ODUzMTRmMDMyOGFhOWY3Y2IzYzg5NDY3NTEwNGQyMSIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=','2018-02-17 07:19:32.392484'),('fuq8uv0brlfszx76pte5v3x291lpgy54','MjBlODM3MmMzODJjZjU4NGNkOWE4ZjlkMTExYTkxNjE5ZmE1NGZlMTp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMThlMWRkZTQ0NTliZGUzMzFkMDUwZDM4NzgzY2QzZmE0NTQ2NmMwNCIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=','2018-02-20 06:38:40.747523');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailqueue_attachment`
--

DROP TABLE IF EXISTS `mailqueue_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailqueue_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_attachment` varchar(100) DEFAULT NULL,
  `email_id` int(11),
  `original_filename` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mailqueue_attachment_fdfd0ebf` (`email_id`),
  CONSTRAINT `mailqueue_attach_email_id_e0acad76_fk_mailqueue_mailermessage_id` FOREIGN KEY (`email_id`) REFERENCES `mailqueue_mailermessage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailqueue_attachment`
--

LOCK TABLES `mailqueue_attachment` WRITE;
/*!40000 ALTER TABLE `mailqueue_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailqueue_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailqueue_mailermessage`
--

DROP TABLE IF EXISTS `mailqueue_mailermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailqueue_mailermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(250) NOT NULL,
  `to_address` longtext NOT NULL,
  `bcc_address` longtext NOT NULL,
  `from_address` varchar(250) NOT NULL,
  `content` longtext NOT NULL,
  `html_content` longtext NOT NULL,
  `app` varchar(250) NOT NULL,
  `sent` tinyint(1) NOT NULL,
  `last_attempt` datetime(6) DEFAULT NULL,
  `reply_to` longtext,
  `created` datetime(6),
  `cc_address` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailqueue_mailermessage`
--

LOCK TABLES `mailqueue_mailermessage` WRITE;
/*!40000 ALTER TABLE `mailqueue_mailermessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailqueue_mailermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers_promo`
--

DROP TABLE IF EXISTS `providers_promo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providers_promo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promo_message` varchar(2000) NOT NULL,
  `promo_code` varchar(5) NOT NULL,
  `added_on` date NOT NULL,
  `duration` varchar(30) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `promo_provider_id` int(11) NOT NULL,
  `promo_type` varchar(3) NOT NULL,
  `agent_name` varchar(200) NOT NULL,
  `services` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `providers_promo_3d2ee23d` (`promo_provider_id`),
  CONSTRAINT `providers_pr_promo_provider_id_5d213e9d_fk_providers_provider_id` FOREIGN KEY (`promo_provider_id`) REFERENCES `providers_provider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers_promo`
--

LOCK TABLES `providers_promo` WRITE;
/*!40000 ALTER TABLE `providers_promo` DISABLE KEYS */;
/*!40000 ALTER TABLE `providers_promo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers_provider`
--

DROP TABLE IF EXISTS `providers_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providers_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `healthier_provider_id` varchar(30) NOT NULL,
  `healthier_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `healthier_id_id` (`healthier_id_id`),
  CONSTRAINT `providers_prov_healthier_id_id_d01eba2e_fk_user_healthieruser_id` FOREIGN KEY (`healthier_id_id`) REFERENCES `user_healthieruser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers_provider`
--

LOCK TABLES `providers_provider` WRITE;
/*!40000 ALTER TABLE `providers_provider` DISABLE KEYS */;
INSERT INTO `providers_provider` VALUES (8,'provider_gptmenognuwkb5g5nxzk',8);
/*!40000 ALTER TABLE `providers_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers_providerrating`
--

DROP TABLE IF EXISTS `providers_providerrating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providers_providerrating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) DEFAULT NULL,
  `dislikes` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `rated_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `provider_id` (`provider_id`),
  UNIQUE KEY `rated_by_id` (`rated_by_id`),
  CONSTRAINT `providers_provider_provider_id_950c731d_fk_providers_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `providers_provider` (`id`),
  CONSTRAINT `providers_provider_rated_by_id_33ebf415_fk_consumers_consumer_id` FOREIGN KEY (`rated_by_id`) REFERENCES `consumers_consumer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers_providerrating`
--

LOCK TABLES `providers_providerrating` WRITE;
/*!40000 ALTER TABLE `providers_providerrating` DISABLE KEYS */;
/*!40000 ALTER TABLE `providers_providerrating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_healthierservice`
--

DROP TABLE IF EXISTS `service_healthierservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_healthierservice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(200) NOT NULL,
  `details` varchar(1000) NOT NULL,
  `service_id` varchar(200) NOT NULL,
  `orders` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `group_id` int(11),
  PRIMARY KEY (`id`),
  KEY `service_healthierservice_0e939a4f` (`group_id`),
  CONSTRAINT `service_healthierse_group_id_0d230b29_fk_service_servicegroup_id` FOREIGN KEY (`group_id`) REFERENCES `service_servicegroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=915 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_healthierservice`
--

LOCK TABLES `service_healthierservice` WRITE;
/*!40000 ALTER TABLE `service_healthierservice` DISABLE KEYS */;
INSERT INTO `service_healthierservice` VALUES (15,'CT 3 D Reconstruction','Details to be soon uploaded','service_4ct849by4l7l1dhxpewh',0,0,1),(16,'CT 3DCT','Details to be soon uploaded','service_1jvznecpnzn80l52lwir',0,0,1),(17,'CT Abdomen','Details to be soon uploaded','service_xczza6e3nuql8251lui6',0,0,1),(18,'CT Abdomen and Pelvis ','Details to be soon uploaded','service_31lavb2602j4t3m0s68y',0,0,1),(19,'CT angiogram-aortic','Details to be soon uploaded','service_u6b4yrqy697j6cdxaqd8',0,0,1),(20,'CT Ankel Joint Left','Details to be soon uploaded','service_wxd7wgbbnfn78jtntcze',0,0,1),(21,'CT Ankel Joint Right','Details to be soon uploaded','service_bgb2r5mdgt4h57aadhq1',0,0,1),(22,'CT Ankle Joint','Details to be soon uploaded','service_0239kylomhxj1u4rhfok',0,0,1),(23,'CT Ankle Joint (Plain)','Details to be soon uploaded','service_37lp96g9lzci94zlx1oh',0,0,1),(24,'CT Brain','Details to be soon uploaded','service_osra4kgr34xbha4qrkeb',0,0,1),(25,'CT Brain (Plain)','Details to be soon uploaded','service_944ehsuj02x187mo5j31',0,0,1),(26,'CT BRAIN + CONTRAST','Details to be soon uploaded','service_qob0136g8nwlf9x1bb2f',0,0,1),(27,'CT Brain Angiography','Details to be soon uploaded','service_bc5xzd3aulamfazdalch',0,0,1),(28,'CT Brain With Sella (Plain)','Details to be soon uploaded','service_y68b6eyvug5795dvlhhe',0,0,1),(29,'CT CALCIUM SCORING','Details to be soon uploaded','service_bzh82zw5f0lk8ffv01um',0,0,1),(30,'CT CARDIAC','Details to be soon uploaded','service_1e2etyfanl255fbvuw9x',0,0,1),(31,'CT Cardiac With Coronary Vessels','Details to be soon uploaded','service_c4657z9qkqz8y2vplp86',0,0,1),(32,'CT Carotid Angiography ','Details to be soon uploaded','service_r6idte1ulefsl7utzfvy',0,0,1),(33,'CT CERVICAL SPINE','Details to be soon uploaded','service_765int1ppkgf9gspr4sm',0,0,1),(34,'CT CERVICO-DORSAL SPINE','Details to be soon uploaded','service_tlz9y9o28xortbpwp641',0,0,1),(35,'CT Chest','Details to be soon uploaded','service_wf57g5wzu3khjckd621w',0,0,1),(36,'CT Chest (Plain)','Details to be soon uploaded','service_u6jhfyagy6a6kcodzqdn',0,0,1),(37,'CT Chest / Abdomen and Pelvis (Plain)','Details to be soon uploaded','service_jl67s02el2k43dkk6oqn',0,0,1),(38,'CT Chest / Thorax (Plain)','Details to be soon uploaded','service_epxxrgd4xlycjtl5bs1o',0,0,1),(39,'CT Chest with Abdomen (Plain)','Details to be soon uploaded','service_82kt1r10wxfzj2lwy1cx',0,0,1),(40,'CT CRANIOFACIAL','Details to be soon uploaded','service_6evv1leidh7fcdef2o2m',0,0,1),(41,'CT DORSAL SPINE','Details to be soon uploaded','service_w3ci4bgz6nw71jk8moym',0,0,1),(42,'CT DORSO-LUMAR SPINE','Details to be soon uploaded','service_cxh5p9o5cg8bqzrq2in1',0,0,1),(43,'CT Elbow','Details to be soon uploaded','service_7vy78xgye7fak7f8yk5q',0,0,1),(44,'CT Elbow (Plain)','Details to be soon uploaded','service_2mvxvmvrvmcy4cz40w52',0,0,1),(45,'CT Elbow Left','Details to be soon uploaded','service_nhw9g70wjbv0atczfgby',0,0,1),(46,'CT Elbow Right','Details to be soon uploaded','service_mx3kd72kft2rvmoyz7zk',0,0,1),(47,'CT Extended Peripheral Angiography','Details to be soon uploaded','service_3wnkfi0f25yvblhbqb7f',0,0,1),(48,'CT Extremity (Plain)','Details to be soon uploaded','service_aj94whdvze64xvgmj5et',0,0,1),(49,'CT Extremity (Plain+Contrast)','Details to be soon uploaded','service_1knb1y2rl2bv73c3xatq',0,0,1),(50,'CT FINGER','Details to be soon uploaded','service_s1wpv0zhroyrmg1zrazr',0,0,1),(51,'CT GUIDED BIOPSY','Details to be soon uploaded','service_330xe5geiv5o8voahy55',0,0,1),(52,'CT Hand','Details to be soon uploaded','service_qpc50j1a6eknw0jo7p18',0,0,1),(53,'CT Hand (Plain)','Details to be soon uploaded','service_mqg8g50c4c6jpj4jo9m3',0,0,1),(54,'CT Hand Left','Details to be soon uploaded','service_sf2tsikoedq5n3hp9564',0,0,1),(55,'CT Hand Right','Details to be soon uploaded','service_obmp3f7kxg8a2nmbhl05',0,0,1),(56,'CT Hip Joint','Details to be soon uploaded','service_avde3h3dr4elmnanc1ey',0,0,1),(57,'CT Hip Joint (Plain)','Details to be soon uploaded','service_sj3c5epzc38ax7ssxojd',0,0,1),(58,'CT HIP JOINT LEFT','Details to be soon uploaded','service_2pnbl9z164c4afkfnjwe',0,0,1),(59,'CT HIP JOINT RIGHT','Details to be soon uploaded','service_yxhasg45p8untv10ljnf',0,0,1),(60,'CT HR Chest ','Details to be soon uploaded','service_eqpdfix8axmdeuxqov14',0,0,1),(61,'CT HR Chest (Plain)','Details to be soon uploaded','service_sf5ye20sy37e6dw7cen7',0,0,1),(62,'CT HR Temporal Bone ','Details to be soon uploaded','service_d826fmn0hx9s2r729d4c',0,0,1),(63,'CT IAM Cuts Plain','Details to be soon uploaded','service_fzszg2kzplatewum3abz',0,0,1),(64,'CT IVP / IVU','Details to be soon uploaded','service_ydccd7ak94pul8unlfn3',0,0,1),(65,'CT Joints','Details to be soon uploaded','service_wrdyh3abmhz1a8xczv06',0,0,1),(66,'CT Knee','Details to be soon uploaded','service_0tlr2u0gtsejrwigdi55',0,0,1),(67,'CT KNEE (LEFT)','Details to be soon uploaded','service_u07yxhgsb2dsqa1j6y1v',0,0,1),(68,'CT KNEE (RIGHT)','Details to be soon uploaded','service_yqp0cjdhvcr2w84yuzcz',0,0,1),(69,'CT Leg','Details to be soon uploaded','service_qb1vuxz48bu1afkksog4',0,0,1),(70,'CT Leg (Plain)','Details to be soon uploaded','service_hn8zgwvv110pufn7q8km',0,0,1),(71,'CT LEG LEFT','Details to be soon uploaded','service_orn1353simq9ydd8irag',0,0,1),(72,'CT LEG RIGHT','Details to be soon uploaded','service_vjohkfmu2j0tuiwvqqzy',0,0,1),(73,'CT Lower Abdomen and Pelvis ','Details to be soon uploaded','service_e60pjgiggbgopdkunae0',0,0,1),(74,'CT Lumbar Spine','Details to be soon uploaded','service_1vzca89196ss0pmwvbig',0,0,1),(75,'CT Mandible Bone ','Details to be soon uploaded','service_4m2siw2d1wnza4vexwkv',0,0,1),(76,'CT MASTDIN','Details to be soon uploaded','service_li0a54vr6272rsg6purx',0,0,1),(77,'CT Maxilla Contrast','Details to be soon uploaded','service_z5yon02tiayf4k0i1urg',0,0,1),(78,'CT Maxilla Plain','Details to be soon uploaded','service_z3stfiphouqyk48s8a3b',0,0,1),(79,'CT MAXILLOFACIAL','Details to be soon uploaded','service_1o58uspsym89k56fo27d',0,0,1),(80,'CT Myelogram','Details to be soon uploaded','service_1nd1cg3r8nk6tcsw96ol',0,0,1),(81,'CT NASOPHARYNX','Details to be soon uploaded','service_e7i4n1bi6jep5jyhg6sg',0,0,1),(82,'CT Nasopharynx & Base of Skull','Details to be soon uploaded','service_g08k749wbbyplckbgt7l',0,0,1),(83,'CT Neck ','Details to be soon uploaded','service_mza8lou1nlnsyvroejkj',0,0,1),(84,'CT Neck (Plain)','Details to be soon uploaded','service_k29j1pnt6b2hctlxhhmu',0,0,1),(85,'CT NECK + CONTRAST','Details to be soon uploaded','service_5d1wr29dasx4vm3aefwp',0,0,1),(86,'CT Orbit ','Details to be soon uploaded','service_4ml1l16a0chnjrbdtrhb',0,0,1),(87,'CT Orbit (Plain)','Details to be soon uploaded','service_z24pfkeia0zd2xrup59l',0,0,1),(88,'CT Para Nasal Sinuses (Limited)','Details to be soon uploaded','service_wprmaic97kpn0kb47rh2',0,0,1),(89,'CT Pelvimetry','Details to be soon uploaded','service_qy15z4bzop9gsmzrion2',0,0,1),(90,'CT Pelvis ','Details to be soon uploaded','service_xhpjm3022iab9m46f4n2',0,0,1),(91,'CT Pelvis (Plain)','Details to be soon uploaded','service_3l6g2e7hake05goseguo',0,0,1),(92,'CT Peripheral Angiography-Lower Extremity','Details to be soon uploaded','service_gbrhi6j8sn62r0g8jig1',0,0,1),(93,'CT Peripheral Angiography-Upper Extremity','Details to be soon uploaded','service_9k905kh89d40prkfgkhk',0,0,1),(94,'CT Pulmonary Angiography','Details to be soon uploaded','service_yumlpfrj7cr0rlfnwyci',0,0,1),(95,'CT Renal Angiography','Details to be soon uploaded','service_bvttfvtxuenqnop80oys',0,0,1),(96,'CT RIBS','Details to be soon uploaded','service_qvowkr3geu9a6x9acd4r',0,0,1),(97,'CT Sacro-iliac Joint ','Details to be soon uploaded','service_davm4pjbc6toioh4h1ji',0,0,1),(98,'CT Sacro-iliac Joint (Plain)','Details to be soon uploaded','service_x2oxfdxowauf4sctaaqy',0,0,1),(99,'CT Scanogram','Details to be soon uploaded','service_pz9vtmbjg3clj7o774vp',0,0,1),(100,'CT Sella Contrast','Details to be soon uploaded','service_yqbbz6jszmelnlc1s2hk',0,0,1),(101,'CT Sella Plain','Details to be soon uploaded','service_t4x87xod44tyheabnz41',0,0,1),(102,'CT Shoulder Joint ','Details to be soon uploaded','service_39q8yof2cwgtv33yoomi',0,0,1),(103,'CT Shoulder Joint (Plain)','Details to be soon uploaded','service_y1hmatj615z0803864x9',0,0,1),(104,'CT SHOULDER JOINT LEFT','Details to be soon uploaded','service_9sqsuejvynr9fv9ndi1h',0,0,1),(105,'CT SHOULDER JOINT RIGHT','Details to be soon uploaded','service_lz8vkq00x1v0rdz4fsyp',0,0,1),(106,'CT Spine','Details to be soon uploaded','service_cvrciqm3j90fdmfna1dw',0,0,1),(107,'CT Spine (3 Level) Contrast','Details to be soon uploaded','service_8c0ntlokmuk7y9b6078s',0,0,1),(108,'CT Spine (Plain)','Details to be soon uploaded','service_37xsm8575zkox265p2yp',0,0,1),(109,'CT Spine(3 level) Plain','Details to be soon uploaded','service_udg0zuiysgl3ue0nd4n9',0,0,1),(110,'CT Upper Abdomen (Plain)','Details to be soon uploaded','service_nqrrbwdikehzfrp8qxnz',0,0,1),(111,'CT Venography','Details to be soon uploaded','service_yfiyapfvchozd5ctnyxz',0,0,1),(112,'CT Wrist','Details to be soon uploaded','service_uk0wszfbkkejjjj4sno0',0,0,1),(113,'CT Wrist (Plain)','Details to be soon uploaded','service_h2vaqisfexpe7ijoka1s',0,0,1),(114,'CT WRIST LEFT','Details to be soon uploaded','service_9mdaq5owkracbvb6mzcq',0,0,1),(115,'CT WRIST RIGHT','Details to be soon uploaded','service_gzrq7ekf444be8k1yxo2',0,0,1),(116,'HRCT CHEST','Details to be soon uploaded','service_e25l7yhvtjdv154fnuh4',0,0,1),(117,'MRI Abdomen & Pelvis - [1.5 Tesla]','Details to be soon uploaded','service_ossgumr3z5zxxh0rnjak',0,0,2),(118,'MRI Abdomen - [1.5 Tesla]','Details to be soon uploaded','service_ukh1nb6qmwh1851z85wu',0,0,2),(119,'MRI Ankle Joint (LEFT) - [1.5 Tesla]','Details to be soon uploaded','service_5x0zr1o3eo36wt7m1r6a',0,0,2),(120,'MRI Ankle Joint (RIGHT) - [1.5 Tesla]','Details to be soon uploaded','service_914isei76rbn95s2hky8',0,0,2),(121,'MRI ANKLE JOINT LEFT - [1.5 Tesla]','Details to be soon uploaded','service_9cxqefwbljdpsbk890kk',0,0,2),(122,'MRI ANKLE JOINT RIGHT - [1.5 Tesla]','Details to be soon uploaded','service_ucmpxbv6325ptk6yv7vw',0,0,2),(123,'MRI Arm (Right) - [1.5 Tesla]','Details to be soon uploaded','service_uh5wi2mh1pnjkqrnp9k6',0,0,2),(124,'MRI ARM LEFT - [1.5 Tesla]','Details to be soon uploaded','service_gqs33rkcc0rxi0inznfe',0,0,2),(125,'MRI ARM RIGHT - [1.5 Tesla]','Details to be soon uploaded','service_waxrmnlua9netmdps55h',0,0,2),(126,'MRI Brain & Angiography - [1.5 Tesla]','Details to be soon uploaded','service_ol5g1nt2k8qm5a5e3r96',0,0,2),(127,'MRI Brain & Venogram - [1.5 Tesla]','Details to be soon uploaded','service_54gieiqoif1bqntj4xhl',0,0,2),(128,'MRI Brain - [1.5 Tesla]','Details to be soon uploaded','service_rkqzyshc4imocfpzw6ml',0,0,2),(129,'MRI Brain With  Contrast - [1.5 Tesla]','Details to be soon uploaded','service_5h3ml8zreed3bqio00d9',0,0,2),(130,'MRI Brain With Pituitary - [1.5 Tesla]','Details to be soon uploaded','service_2ly2bhyz9nkbix4sdruq',0,0,2),(131,'MRI BREAST','Details to be soon uploaded','service_d0ay6ij585d998sb8i74',0,0,2),(132,'MRI Cervical Spine - [1.5 Tesla]','Details to be soon uploaded','service_bdyot8zqcrdi3322muq6',0,0,2),(133,'MRI Chest - [1.5 Tesla]','Details to be soon uploaded','service_ialm0c3h39rhyxv8j1pb',0,0,2),(134,'MRI CRANIOFACIAL - [1.5 Tesla]','Details to be soon uploaded','service_vpt7xjoru3kciosr1fcr',0,0,2),(135,'MRI Dorsal Spine - [1.5 Tesla]','Details to be soon uploaded','service_z54z4iqfyw53012115kc',0,0,2),(136,'MRI DORSO-LUMBAR - [1.5 Tesla]','Details to be soon uploaded','service_zjrrww45g0f0nvxl1gcc',0,0,2),(137,'MRI Elbow - [1.5 Tesla]','Details to be soon uploaded','service_tzvighmafhw07jnrj9cn',0,0,2),(138,'MRI ELBOW LEFT - [1.5 Tesla]','Details to be soon uploaded','service_09kwza8aj1vf4umyx0vh',0,0,2),(139,'MRI ELBOW RIGHT - [1.5 Tesla]','Details to be soon uploaded','service_pa7iy6heagn17c1cie7b',0,0,2),(140,'MRI Femur - [1.5 Tesla]','Details to be soon uploaded','service_wvrnurd2dfs4ntl73krb',0,0,2),(141,'MRI FEMUR LEFT - [1.5 Tesla]','Details to be soon uploaded','service_174xkod8t65gei3g90ai',0,0,2),(142,'MRI FEMUR RIGHT - [1.5 Tesla]','Details to be soon uploaded','service_23dzv8hqv4d2v9qbyrzp',0,0,2),(143,'MRI Hand - [1.5 Tesla]','Details to be soon uploaded','service_ieutal79lmkzcgh0hyan',0,0,2),(144,'MRI HAND LEFT - [1.5 Tesla]','Details to be soon uploaded','service_500e6hlkjkpxqjao26p4',0,0,2),(145,'MRI HAND RIGHT - [1.5 Tesla]','Details to be soon uploaded','service_l7x4l1w0huof2tjhz7i4',0,0,2),(146,'MRI Hip Joint - [1.5 Tesla]','Details to be soon uploaded','service_itw0tm1yzp7p9ovn8s00',0,0,2),(147,'MRI HIP JOINT LEFT - [1.5 Tesla]','Details to be soon uploaded','service_u5rgujbyx7uijrc7jzvl',0,0,2),(148,'MRI HIP JOINT RIGHT - [1.5 Tesla]','Details to be soon uploaded','service_ocwfwu5cth4w5ai98ksl',0,0,2),(149,'MRI KNEE (LEFT) - [1.5 Tesla]','Details to be soon uploaded','service_38vam4625vkqqvha5pnu',0,0,2),(150,'MRI KNEE (RIGHT) - [1.5 Tesla]','Details to be soon uploaded','service_j6x6t9j3r0ykuik0z228',0,0,2),(151,'MRI Knee - [1.5 Tesla]','Details to be soon uploaded','service_oaqd9sstt7ipzwu4g6am',0,0,2),(152,'MRI KNEE LEFT - [1.5 Tesla]','Details to be soon uploaded','service_1mkesvo1ayf8rwmjg3qa',0,0,2),(153,'MRI KNEE RIGHT - [1.5 Tesla]','Details to be soon uploaded','service_t0c96dfdbrfes5o8nxnb',0,0,2),(154,'MRI Leg - [1.5 Tesla]','Details to be soon uploaded','service_xogge8ifanagou89fjwo',0,0,2),(155,'MRI LEG LEFT - [1.5 Tesla]','Details to be soon uploaded','service_fqz44lcm6tfuxnpvtv5b',0,0,2),(156,'MRI LEG RIGHT - [1.5 Tesla]','Details to be soon uploaded','service_6424cp9oup1ei50osjhp',0,0,2),(157,'MRI Lumbar Spine - [1.5 Tesla]','Details to be soon uploaded','service_uydunmibj8qeoeeyol3c',0,0,2),(158,'MRI MAXILLOFACIAL - [1.5 Tesla]','Details to be soon uploaded','service_l8c1tmixtxvv5p9vdt9b',0,0,2),(159,'MRI MRCP Abdomen with Contrast - [1.5 Tesla]','Details to be soon uploaded','service_u9kx3zff4wfipdcdr8on',0,0,2),(160,'MRI NECK + CONTRAST - [1.5 Tesla]','Details to be soon uploaded','service_85otuobr1ww78domqz7o',0,0,2),(161,'MRI Neck - [1.5 Tesla]','Details to be soon uploaded','service_xvnz4vmt0ggq3apye9sy',0,0,2),(162,'MRI Orbits - [1.5 Tesla]','Details to be soon uploaded','service_ay5lhlvgoroyywzxsk7n',0,0,2),(163,'MRI PAEDIATRICS [1.5 Tesla]','Details to be soon uploaded','service_6ijr97nnjup06pevpymx',0,0,2),(164,'MRI Pelvis - [1.5 Tesla]','Details to be soon uploaded','service_473pui79ymkt7s99v9y9',0,0,2),(165,'MRI Pitutary - [1.5 Tesla]','Details to be soon uploaded','service_ejdkhzbmplz8k09hvi6o',0,0,2),(166,'MRI PNS - [1.5 Tesla]','Details to be soon uploaded','service_3kti27loc0cdo9571pcz',0,0,2),(167,'MRI Prostate - [1.5 Tesla]','Details to be soon uploaded','service_qcaa4u3q5q90bxrbbnfe',0,0,2),(168,'MRI Sacro Iliac joints - [1.5 Tesla]','Details to be soon uploaded','service_whhyka94d60llf15bsht',0,0,2),(169,'MRI Screening - [1.5 Tesla]','Details to be soon uploaded','service_r8uqzddox1xcfo7kdgo9',0,0,2),(170,'MRI Shoulder Joint (Left) - [1.5 Tesla]','Details to be soon uploaded','service_dvpe1dq06nyajt2v2bf2',0,0,2),(171,'MRI Shoulder Joint (Right) - [1.5 Tesla]','Details to be soon uploaded','service_i7jb4vkn1o8njt5lxxlm',0,0,2),(172,'MRI SHOULDER JOINT LEFT - [1.5 Tesla]','Details to be soon uploaded','service_mzefuzb67z02275mmox5',0,0,2),(173,'MRI SHOULDER JOINT RIGHT - [1.5 Tesla]','Details to be soon uploaded','service_kahs3qgp3vntm9xvfo5x',0,0,2),(174,'MRI TOE/FOOT LEFT - [1.5 Tesla]','Details to be soon uploaded','service_c2a82rq5fii5s2sy0t06',0,0,2),(175,'MRI TOE/FOOT RIGHT - [1.5 Tesla]','Details to be soon uploaded','service_jcz1rv2ocejag7z0zxbr',0,0,2),(176,'MRI Whole Body Scan','Details to be soon uploaded','service_8qak6x816ww79t4a7yaf',0,0,2),(177,'MRI Whole Body Scan - [1.5 Tesla]','Details to be soon uploaded','service_rxbgf962hiuhfqppw22w',0,0,2),(178,'MRI Wrist - [1.5 Tesla]','Details to be soon uploaded','service_ka315nkki4dnt4l5kwzu',0,0,2),(179,'MRI WRIST LEFT - [1.5 Tesla]','Details to be soon uploaded','service_55pvass0f5h998z5jvta',0,0,2),(180,'MRI WRIST RIGHT - [1.5 Tesla]','Details to be soon uploaded','service_0zjk8zzxe94pc7r9odlg',0,0,2),(181,'Abdomen Scan','Details to be soon uploaded','service_tc41ofmn05p9s2z8p4eb',0,0,3),(182,'Gynaecology Scan','Details to be soon uploaded','service_ng51ycqczgh4qodnryge',0,0,3),(183,'Pelvic Scan','Details to be soon uploaded','service_t4gv3pfs2xb0qnrdakvx',0,0,3),(184,'Breast Scan','Details to be soon uploaded','service_tjmyfcp07zr5347ztvog',0,0,3),(185,'Testes Scan','Details to be soon uploaded','service_pp4fl8diei7yt723apy0',0,0,3),(186,'Thyroid Scan','Details to be soon uploaded','service_6bwxkpj6dm57qnuq2pba',0,0,3),(187,'Prostate Scan','Details to be soon uploaded','service_3zwna2txzfjsce16ikj7',0,0,3),(188,'Ovulometry/TV Scan','Details to be soon uploaded','service_qzeoidudsyzixo8yzriu',0,0,3),(189,'Bladder Scan','Details to be soon uploaded','service_l1v98fmti5427zdmisat',0,0,3),(190,'Transvaginal/Folliculometry Scan','Details to be soon uploaded','service_f8cajqgnn2fdd3e6szjm',0,0,3),(191,'Dental-Intra-Oral Periapical Scan','Details to be soon uploaded','service_p2rbz3d7e4dj3tbrc1gx',0,0,3),(192,'Obstetric Scan','Details to be soon uploaded','service_n9e5xyf75bomsp3eznjc',0,0,3),(193,'Angiography','Details to be soon uploaded','service_rb2fq0p5ku8us2atkukw',0,0,4),(194,'Arthrogram','Details to be soon uploaded','service_s1hsl2fjiz6e7nlwr2yj',0,0,4),(195,'Barium Enema','Details to be soon uploaded','service_qb8u3sj7jeg3m4r7g7vq',0,0,4),(196,'Barium Meal With Gastrografin ','Details to be soon uploaded','service_5ah683ea9gyn93ax07hz',0,0,4),(197,'Barium Meal/Follow Through','Details to be soon uploaded','service_hop1v56ricj6sypwtshu',0,0,4),(198,'Barium Swallow','Details to be soon uploaded','service_y8ffwlupmg998n5311gn',0,0,4),(199,'Cholecytogram','Details to be soon uploaded','service_l2ezx5mzc7381q7hhztd',0,0,4),(200,'Cysto-Urethrogram','Details to be soon uploaded','service_zken168lhkfb3vps1zng',0,0,4),(201,'Deep Venogram ','Details to be soon uploaded','service_mx98o4til329iuy2bdvf',0,0,4),(202,'Fistulogram','Details to be soon uploaded','service_h98nyajidg5gx84gcf2i',0,0,4),(203,'Hysterosalpingogram ','Details to be soon uploaded','service_iu7x2ah7d380gqe8aror',0,0,4),(204,'Intravenous Cholangiogram','Details to be soon uploaded','service_i77a5w13xsltease28wu',0,0,4),(205,'Intravenous Urogram','Details to be soon uploaded','service_ip5hyxotepfzw2nluw0w',0,0,4),(206,'Intravenous Pyelogram ','Details to be soon uploaded','service_p281w42b0ftf2yp1kj9a',0,0,4),(207,'Mammography ','Details to be soon uploaded','service_gufdajh4itu3xtll7dgf',0,0,4),(208,'Micturating Cystourethrogram (MCUG)','Details to be soon uploaded','service_nl7vlys2a7aieyynuvyg',0,0,4),(209,'Retrograde urethrogram (RCUG)','Details to be soon uploaded','service_ud3sdky3j4a9jik1byf5',0,0,4),(210,'Venogram (One Leg)','Details to be soon uploaded','service_miwz95xpi5fjy2m8hmya',0,0,4),(211,'Myelogram','Details to be soon uploaded','service_wg3f2cb7scw176oxnamw',0,0,4),(212,'Oral Cholecytogram ','Details to be soon uploaded','service_nomkewbmso9bjzh2dewf',0,0,4),(213,'Percutenous Transphepatic Cholangiogram','Details to be soon uploaded','service_pny6txn3qnpfsh54hja0',0,0,4),(214,'Peripheral Arteriography ','Details to be soon uploaded','service_axhmsa548c77ya7ce6go',0,0,4),(215,'Phlebogram','Details to be soon uploaded','service_7ht6qmadqn18h4g302wy',0,0,4),(216,'Sialogram','Details to be soon uploaded','service_cdz0sejxil4ymy0rhinl',0,0,4),(217,'Fistulogram/Sinogram','Details to be soon uploaded','service_9vx9b57jgkrx2aer48j8',0,0,4),(218,'Cyst-Urethrogram','Details to be soon uploaded','service_2fa5sw630z6p8ifte0wz',0,0,4),(219,'Oral Cholecystogram','Details to be soon uploaded','service_fx21aczque54xml7mjy2',0,0,4),(220,'Intravenous Cholangiogram','Details to be soon uploaded','service_g33yav247dg09cv1me7p',0,0,4),(221,'Fluoroscopy','Details to be soon uploaded','service_nadx9afmna28l08iig1z',0,0,4),(222,'Sinography/ Fistulography ','Details to be soon uploaded','service_h09ubu9vueurpeoqotoz',0,0,4),(223,'Sinuses','Details to be soon uploaded','service_7iqndmtb90a70g4xvi3w',0,0,4),(224,'Skeletal Survey','Details to be soon uploaded','service_u7xtm0ea2roa5j7c1w4j',0,0,4),(225,'Skeletal survey (Adult)','Details to be soon uploaded','service_kqr4bww552pwgyghuzfe',0,0,4),(226,'Hand/Finger','Details to be soon uploaded','service_v3v67vafkc41dshmtyws',0,0,4),(227,'Wrist','Details to be soon uploaded','service_chocsbcc1x6k9grqhxmf',0,0,4),(228,'Forearm (Radius And Ulna)','Details to be soon uploaded','service_5czxdb53i028sc63lgnb',0,0,4),(229,'Elbow','Details to be soon uploaded','service_psn9ud6lgwnslirww905',0,0,4),(230,'Humerus','Details to be soon uploaded','service_51aad6u3zvu7ys6xggdq',0,0,4),(231,'Shoulder','Details to be soon uploaded','service_v10gqvm3gj42288gcajy',0,0,4),(232,'Clavicle','Details to be soon uploaded','service_v7kaqjblli4ut52meyax',0,0,4),(233,'Foot/Toe','Details to be soon uploaded','service_1x2j3jan8ktzvscin891',0,0,4),(234,'Ankle','Details to be soon uploaded','service_hkr0zunmtyhgmk4mpjby',0,0,4),(235,'Leg (Tibia/Fibula)','Details to be soon uploaded','service_1ttsdtllh0bdubr981ty',0,0,4),(236,'Knee','Details to be soon uploaded','service_1hiy75zrz8lbh5wkwe8z',0,0,4),(237,'Thigh(Femur)','Details to be soon uploaded','service_804ri7nxqe938oucw5j6',0,0,4),(238,'Hip','Details to be soon uploaded','service_0qdq6pt8nmjdojw8wbev',0,0,4),(239,'Pelvis( AP)','Details to be soon uploaded','service_io5z4wu8ghhkyoxeth3k',0,0,4),(240,'Pelvis & Hip','Details to be soon uploaded','service_7gw0kc6mbqfmg7x60zuc',0,0,4),(241,'Chest (PA/AP)','Details to be soon uploaded','service_2gx7nh0wvyxkl4l783e7',0,0,4),(242,'Chest (PA/Lateral)','Details to be soon uploaded','service_03y9ciuus073yx5jac2c',0,0,4),(243,'Chest For Ribs (Oblique)','Details to be soon uploaded','service_z6rlw5qjimji59arog6r',0,0,4),(244,'Apical/Lordotic','Details to be soon uploaded','service_2lq8mqvgr9t4mofxeupe',0,0,4),(245,'Sternum','Details to be soon uploaded','service_8832j9tu3r94i7uubecx',0,0,4),(246,'Thoracic Inlet','Details to be soon uploaded','service_psatfxw17jesqt42whoj',0,0,4),(247,'Cervical Spine','Details to be soon uploaded','service_vmr2qsz8tcycsiub3ni0',0,0,4),(248,'Lateral Neck (Soft Tissue)','Details to be soon uploaded','service_tzvc3f79nuq2hw1b92fl',0,0,4),(249,'Thoracic Spine','Details to be soon uploaded','service_0qr7qe4s51kw6lmt4amz',0,0,4),(250,'Thoraco- Lumbar Spine','Details to be soon uploaded','service_sym0q0woq4jky7ugtjjn',0,0,4),(251,'Lumbar Spine','Details to be soon uploaded','service_ckmxiv1gnlxi66l9ls4f',0,0,4),(252,'Lumbo- Sacral Spine','Details to be soon uploaded','service_csba6h0nmftbxokmg2m4',0,0,4),(253,'Sacrum','Details to be soon uploaded','service_dnkt2r22ye6vn1apmryc',0,0,4),(254,'Coccyx','Details to be soon uploaded','service_tii5o97ygb1bdstw86si',0,0,4),(255,'Sacro- Iliac Joint (SIJ)','Details to be soon uploaded','service_33p62uyb5exx6pvbkj41',0,0,4),(256,'Cervical Spine (Oblique)','Details to be soon uploaded','service_rwqlnftcx08dtkcgm8vg',0,0,4),(257,'Plain Abdomen','Details to be soon uploaded','service_g8bb1mt224za4t5nxwxz',0,0,4),(258,'Erect/Supine Abdomen','Details to be soon uploaded','service_plzs03uklsx8dw0jst5d',0,0,4),(259,'Pelvimetry','Details to be soon uploaded','service_a7ch4fduuxlnkp4qiik8',0,0,4),(260,'Mastoids','Details to be soon uploaded','service_ls2l5wan7gtb64h6l70z',0,0,4),(261,'Mandibles (Jaw)','Details to be soon uploaded','service_0ly9t0hgekzq9fz9oqbb',0,0,4),(262,'X-Ray Sinuses  Ap/Lnt/Om','Details to be soon uploaded','service_kf357ab6zeuxv9ybq6rl',0,0,4),(263,'X-Ray Skull (AP/LAT)','Details to be soon uploaded','service_ma0y495rhzuccm8ou2a2',0,0,4),(264,'X-Ray Skull (Pa/Lat/Townes)','Details to be soon uploaded','service_q2h0ru909v1ltt72nqd2',0,0,4),(265,'X-Ray Sternum','Details to be soon uploaded','service_0h1cwusxstkjpv9ji6zn',0,0,4),(266,'X-Ray Tagential','Details to be soon uploaded','service_40tyqg21wkopd4ncd8le',0,0,4),(267,'X-Ray Temporo-Mandibular Joints  (TMJ)','Details to be soon uploaded','service_yp2kx6ywmbs9e7nf48fo',0,0,4),(268,'ECG','Details to be soon uploaded','service_6duknw2gm2ccqpvf55cy',0,0,5),(269,'Post Exercise ECG','Details to be soon uploaded','service_s39nqs59blvejwsqhz9x',0,0,5),(270,'Color Doppler','Details to be soon uploaded','service_gdjnbkq1i3io505cjezz',0,0,6),(271,'EEG','Details to be soon uploaded','service_7zvbnx7fhy3bdtsyqd2b',0,0,7),(272,'Chromosomal Analysis-High resolution banding -  [Blood]','Details to be soon uploaded','service_m48ldnex3ol3dpfd1inx',0,0,8),(273,'HBV-DNA Quantification (Viral load) -  [Serum or plasma]','Details to be soon uploaded','service_fld5bxaewhscrthxsiqp',0,0,8),(274,'Biopsy- Large  specimen for histology -  [Tissue]','Details to be soon uploaded','service_f6fv9o26sqo7dbjr35ty',0,0,9),(275,'Biopsy- Large and Complex specimen for histology -  [Tissue]','Details to be soon uploaded','service_r6yrrgkmwvbes3ymsov9',0,0,9),(276,'Biopsy- Medium specimen  for histology -  [Tissue]','Details to be soon uploaded','service_ivlj0iupvmaq18kje13y',0,0,9),(277,'Biopsy- Small specimen for histology -  [Tissue]','Details to be soon uploaded','service_i7qj7nt4j53tzxqzx6wv',0,0,9),(278,'Biopsy-Second opinion slides/blocks for histopathological examination.  -  [Block/ Slide]','Details to be soon uploaded','service_m7gwwrzqlkwt7j0j4l9p',0,0,9),(279,'Biopsy-Skin biopsy for histology with special stain (SOS) -  [Tissue]','Details to be soon uploaded','service_6gmy5rdsy43bcaesscd1',0,0,9),(280,'Body fluid,Rt Exam With  cytology and microbiology -  [Body fluid]','Details to be soon uploaded','service_0smf84mzzikr08id47e1',0,0,9),(281,'FNAC - cytological examination -  [FNAC fluid] ','Details to be soon uploaded','service_txkbzcm4fl2gkw4a0guz',0,0,9),(282,'FNAC procedure charges  -  [Walk in patient] ','Details to be soon uploaded','service_8nhdi4agznxn82qlvekm',0,0,9),(283,'Giemsa Stain for histopathology -  [Tissue] ','Details to be soon uploaded','service_ojb4pyghudn8ifjj5s92',0,0,9),(284,'Histopathology- BILATERAL BREAST LUMPS  -  [Tissue]','Details to be soon uploaded','service_ziznzu59kim9ua7cpf0g',0,0,9),(285,'Histopathology- Large  specimen  -  [Tissue] ','Details to be soon uploaded','service_xjq8bb2aognw2qadirna',0,0,9),(286,'Histopathology- Large and Complex specimen  -  [Tissue] ','Details to be soon uploaded','service_ogggk8cbri46ypl9a5li',0,0,9),(287,'Histopathology- Medium specimen  -  [Tissue] ','Details to be soon uploaded','service_u9t33pbjqfhpsmsalqt0',0,0,9),(288,'Histopathology- Small specimen  -  [Tissue] ','Details to be soon uploaded','service_6e5f7lar36oked1r87g5',0,0,9),(289,'Histopathology-GASTRIC BIOPSY  -  [Tissue]','Details to be soon uploaded','service_ikak7hc7va0z65xpxqme',0,0,9),(290,'Histopathology-Liver Biopsy','Details to be soon uploaded','service_pz3v6twfdgwmimi1lpyv',0,0,9),(291,'Histopathology-Skin biopsy with special stain (SOS) -  [Tissue] ','Details to be soon uploaded','service_fonqynnrab74jbfgthx2',0,0,9),(292,'Masson Trichrome stain for histopathology -  [Tissue] ','Details to be soon uploaded','service_2kptoa2x6cvhz5w46iua',0,0,9),(293,'PAS stain for histopathology -  [Tissue] ','Details to be soon uploaded','service_o2259jxrsalc5b23yw3y',0,0,9),(294,'PTAH Stain for histopathology -  [Tissue] ','Details to be soon uploaded','service_kf9nvazazecx2y0dslz5',0,0,9),(295,'Reticulin Stain (For histopathology) -  [Tissue] ','Details to be soon uploaded','service_jjd3wbufs5cx72xa25s3',0,0,9),(296,'Routine examination, Sputum, Comprehensive (Includes cytology and microbiology) -  [Sputum] ','Details to be soon uploaded','service_7pyxx5gwlhq2wz2975dw',0,0,9),(297,'Cytology -  [Aspirates] ','Details to be soon uploaded','service_hvdqu6v4w68en6q4ezbb',0,0,10),(298,'Cytology -  [Body fluid] ','Details to be soon uploaded','service_zwuo0zjgpxwcl8dwenz3',0,0,10),(299,'Cytology -  [Sputum] ','Details to be soon uploaded','service_p78jbsw4zo6xhjjpeaya',0,0,10),(300,'Cytology -  [Urine] ','Details to be soon uploaded','service_ntpxm9b0t4ij9fwfwccs',0,0,10),(301,'Cytology -  [Washing fluid] ','Details to be soon uploaded','service_522je6scqjke0rnzvsor',0,0,10),(302,'Alanine Transaminase (SGPT)','Details to be soon uploaded','service_te07i00li5bcxmat2vzb',0,0,11),(303,'Albumin','Details to be soon uploaded','service_mjirk4kturo7tyuirgiw',0,0,11),(304,'Alkaline Phosphatase','Details to be soon uploaded','service_95azjtb0v8nc3fao9icv',0,0,11),(305,'Aspartate Transaminase (SGOT)','Details to be soon uploaded','service_8ixvi7gi8wz1ck95aakh',0,0,11),(306,'Fasting Blood Sugar','Details to be soon uploaded','service_bfjwg6jyj1c50jrvsx1t',0,0,11),(307,'Random Blood Sugar','Details to be soon uploaded','service_19s08dsizlvfva9j2avv',0,0,11),(308,'Calcium','Details to be soon uploaded','service_itvd2h3q4392mdi00axx',0,0,11),(309,'Creatinine','Details to be soon uploaded','service_0oxiq8ustqesjwgobtka',0,0,11),(310,'Creatinine Clearance','Details to be soon uploaded','service_tkzk88l1sm4idrei0d6a',0,0,11),(311,'CSF Protein','Details to be soon uploaded','service_epfm1otts89dbbz1irxy',0,0,11),(312,'CSF Sugar','Details to be soon uploaded','service_nl723r5iigk1b40fl4p2',0,0,11),(313,'Electrolyte - Na+','Details to be soon uploaded','service_hkm8wt1zlombks25ellr',0,0,11),(314,'Electrolyte - K+','Details to be soon uploaded','service_hgvto3nqvjrkjjl57m79',0,0,11),(315,'Electrolyte - CL-','Details to be soon uploaded','service_3qpzv1o9i850mlrorq2x',0,0,11),(316,'Electrolyte - HCO3-','Details to be soon uploaded','service_6ztnm5ol657dwj5h969a',0,0,11),(317,'Electrolyte and Urea','Details to be soon uploaded','service_sal6ufqlsobyh77pt8y1',0,0,11),(318,'Electrolyte, Urea & Creatinine','Details to be soon uploaded','service_kwk3m0fwgjonnoweslkl',0,0,11),(319,'Glucose6-Phosphate-dehydrogenase','Details to be soon uploaded','service_816jib7f3c95p65qhp81',0,0,11),(320,'Lipid profile','Details to be soon uploaded','service_1eo2gt81quggq53szce9',0,0,11),(321,'Liver function Test','Details to be soon uploaded','service_1m9m9y6ikmqzp978o5d9',0,0,11),(322,'Phosphorus','Details to be soon uploaded','service_fl0e9rp2h18v3ys355cl',0,0,11),(323,'Pregnancy Test (Beta HCG - Blood)','Details to be soon uploaded','service_4zgqvwpe4uzuiggw7zj8',0,0,11),(324,'Protein, Total','Details to be soon uploaded','service_43jv645r3c0lkydlzedy',0,0,11),(325,'Urea','Details to be soon uploaded','service_rt01fskh1xecajjuc0oe',0,0,11),(326,'Uric arid','Details to be soon uploaded','service_1ccu2mcwrpu38o2t0136',0,0,11),(327,'Urinalysis dipstick','Details to be soon uploaded','service_g7q0iyqr2p8xsgpgf1ld',0,0,11),(328,'24hr Post Prandial','Details to be soon uploaded','service_hoh25mb1z9nauq9a78e2',0,0,11),(329,'Glucose Tolerance Test','Details to be soon uploaded','service_0wih3gf8jumdx0b4rik6',0,0,11),(330,'Total Bilirubim','Details to be soon uploaded','service_weh0kgcmemewrd43wie2',0,0,11),(331,'Direct Bilirubim','Details to be soon uploaded','service_mdlj9f9gzies9x7rbe6w',0,0,11),(332,'Total Protein','Details to be soon uploaded','service_crtbhjs5nm182mpw6nhv',0,0,11),(333,'Uric Acid','Details to be soon uploaded','service_rurqe4xgybtavq2iefgm',0,0,11),(334,'Calcium','Details to be soon uploaded','service_7yltydj2u11haciybu4k',0,0,11),(335,'Prostatic Acid Phosphates','Details to be soon uploaded','service_rptznjzpk4y94wy1yx87',0,0,11),(336,'Total Acid Phosphates','Details to be soon uploaded','service_0tsygn2srk7ej9n2bq43',0,0,11),(337,'Amylase','Details to be soon uploaded','service_bly9q6qtii7h27x0s2xr',0,0,11),(338,'Cholesterol','Details to be soon uploaded','service_v86471ww8c8o8ghu7r14',0,0,11),(339,'Triglyceride','Details to be soon uploaded','service_wx7v4x8d6pvql0f1a4kv',0,0,11),(340,'CSF Glucose','Details to be soon uploaded','service_mhvfk1cnktfp1mzkq820',0,0,11),(341,'CSF Protein','Details to be soon uploaded','service_el2f5glz48ibijj1upbs',0,0,11),(342,'CSF Chloride','Details to be soon uploaded','service_sqb5hkp26h8kb483pp8w',0,0,11),(343,'HDL/LDL Cholesterol','Details to be soon uploaded','service_9lzk8cfpx1e6zdpun55a',0,0,11),(344,'Gamma Gt','Details to be soon uploaded','service_o2cb3s7agn1tfyxptu5s',0,0,11),(345,'CK Amylase','Details to be soon uploaded','service_9mxfnqymxl7e9uv0x54g',0,0,11),(346,'Protein Electrophoresis + Report','Details to be soon uploaded','service_82hgj88g5yvkurxbz68h',0,0,11),(347,'Oral Glucose Tolerance Test(OGTT)','Details to be soon uploaded','service_javszs6hza0rjlkqh8jn',0,0,11),(348,'Bleeding Time','Details to be soon uploaded','service_h2kzkymo7adnoghkct1u',0,0,12),(349,'Blood film report','Details to be soon uploaded','service_dadw0d2fns7ehwsrufz1',0,0,12),(350,'Blood grouping + Rh','Details to be soon uploaded','service_nfm3fl9u04fqewlfdigt',0,0,12),(351,'Clotting Time','Details to be soon uploaded','service_oatcr5q8ir0s7o4ip8z1',0,0,12),(352,'C-Reactive protein (CRP)','Details to be soon uploaded','service_0q6qgik578nwrhu21mtt',0,0,12),(353,'Cross matching','Details to be soon uploaded','service_uvmfzz88wtwn3k62ooav',0,0,12),(354,'Direct Coombs test','Details to be soon uploaded','service_9q7dza1jwn0un3bw3byg',0,0,12),(355,'ESR','Details to be soon uploaded','service_y94ad2a0c9e5qv8uuv6c',0,0,12),(356,'Fibrinogen','Details to be soon uploaded','service_ld2bizim6xaab4q4qb2r',0,0,12),(357,'G6PD qualitative','Details to be soon uploaded','service_bb89dweqwojfcay9kugu',0,0,12),(358,'G6PD quantitative','Details to be soon uploaded','service_hmn0hkmcm74ikjqexlz9',0,0,12),(359,'Genotype','Details to be soon uploaded','service_mtwiipqifkthnpzgxjpw',0,0,12),(360,'Haemoglobin                                               ','Details to be soon uploaded','service_cqpc8ev2eo8mcz1vhj28',0,0,12),(361,'HIV Confirmation (Western Blot)','Details to be soon uploaded','service_5bdmd4uup7aeak1r9soc',0,0,12),(362,'HIV Screening (HIV 1 & 11) antibodies','Details to be soon uploaded','service_qhcty91ln6wguisncxiv',0,0,12),(363,'Indirect Coombs test','Details to be soon uploaded','service_uuv37r14fq10v9a9lofb',0,0,12),(364,'INR','Details to be soon uploaded','service_i6kpo9vcju5apt5c72mg',0,0,12),(365,'Malaria ICT','Details to be soon uploaded','service_18sag132lbz4l9j638sy',0,0,12),(366,'Malaria parasites (QBC Malaria)','Details to be soon uploaded','service_u8pde3wktl28qw06n1ix',0,0,12),(367,'MCH','Details to be soon uploaded','service_ed11teqze7bj19iy8y8p',0,0,12),(368,'MCHC','Details to be soon uploaded','service_5hqp6mae0t34wiv3evm7',0,0,12),(369,'MCV','Details to be soon uploaded','service_k7lo22hk2zx395injjrv',0,0,12),(370,'O+ve pint of blood','Details to be soon uploaded','service_63dgoswgxx0lfs48fl9y',0,0,12),(371,'O-ve pint of blood','Details to be soon uploaded','service_5xn4p7hczx7wlo44gixr',0,0,12),(372,'Packed Cell Volume (PCV)                    ','Details to be soon uploaded','service_1gv5jez4zp38jdfrecel',0,0,12),(373,'Platelet count','Details to be soon uploaded','service_hr0wjulae9ztubtsla2t',0,0,12),(374,'Prothombin Time (PT)','Details to be soon uploaded','service_1ug5m52b6b915c8vhbxj',0,0,12),(375,'PTTK','Details to be soon uploaded','service_56mk7pjjza7yacpcqobs',0,0,12),(376,'Reticulocyte count  ','Details to be soon uploaded','service_wgqabucz8wukgfhae3lf',0,0,12),(377,'sickle Cell screening','Details to be soon uploaded','service_j36lyewic9vy1q0arz0s',0,0,12),(378,'WBC Differential                                          - (FBC)','Details to be soon uploaded','service_ykrc436g9egbgtq2v6cl',0,0,12),(379,'WBC Total                                                       ','Details to be soon uploaded','service_uhj5wj0265n7czb3bj0u',0,0,12),(380,'Adenovirus','Details to be soon uploaded','service_s3yh0fouhqvdgo5z953s',0,0,13),(381,'Blood culture and sensitivity','Details to be soon uploaded','service_teo63az8txfpr108wmdn',0,0,13),(382,'CSF M/C/S','Details to be soon uploaded','service_ddu3pr5yf7wq50pbojeu',0,0,13),(383,'Hepatitis B DNA viral load','Details to be soon uploaded','service_cflphe2yq766hij05spv',0,0,13),(384,'Hepatitis B surface antigen (HBsAg)','Details to be soon uploaded','service_jckd25a9xoi4lp5fubzq',0,0,13),(385,'Hepatitis C','Details to be soon uploaded','service_ybv6q9vh6wjhudzgtmdr',0,0,13),(386,'Hepatitis C DNA viral load','Details to be soon uploaded','service_bqj0v2sfx5tt8zz5cy91',0,0,13),(387,'HVS MCS','Details to be soon uploaded','service_0356dm9y94uxwf519c7k',0,0,13),(388,'Mantoux (Tuberculin Test)','Details to be soon uploaded','service_l36ks6os0koh2uvuy6k0',0,0,13),(389,'Rapid TB Test ','Details to be soon uploaded','service_oyxx68puaxb3eirmhfjj',0,0,13),(390,'Rotavirus','Details to be soon uploaded','service_dl573tkv5q50qie1irbr',0,0,13),(391,'Sputum M/C/S','Details to be soon uploaded','service_n629dqp5wcnedth0hswk',0,0,13),(392,'Sputum ZN stain for AFB','Details to be soon uploaded','service_r5b8o131zopcp90a5kn0',0,0,13),(393,'Stool M/C/S','Details to be soon uploaded','service_70f2lp1yhzbk7dpbdf1b',0,0,13),(394,'Stool microscopy','Details to be soon uploaded','service_r881jommodm2p09iinkh',0,0,13),(395,'Stool Occult blood','Details to be soon uploaded','service_6pjgbsqpcp2yur52rmwu',0,0,13),(396,'Swab M/C/S (wound eye, ear, urethra, etc)','Details to be soon uploaded','service_9w7jnib0g57twjuiwb12',0,0,13),(397,'TB Quantiferon','Details to be soon uploaded','service_j8x6e5ao1od6d3m4dvn3',0,0,13),(398,'TPHA','Details to be soon uploaded','service_yhdzzrl8s7kcwdf8mpl4',0,0,13),(399,'Urine M/C/S','Details to be soon uploaded','service_4tdzamx9ibxzu8h7kz9a',0,0,13),(400,'Urine Microscopy','Details to be soon uploaded','service_sohf82jenbpvuffbvn2e',0,0,13),(401,'VDRL','Details to be soon uploaded','service_nz37krrfdko2o937jmc1',0,0,13),(402,'Widal test','Details to be soon uploaded','service_4wg8x6yew6f6azgazv1z',0,0,13),(403,'Urinalysis','Details to be soon uploaded','service_1nd5s0sgwk73d07ffkee',0,0,13),(404,'Semen Culture And Sensitivity','Details to be soon uploaded','service_gqren54pvakfjfrdqf7w',0,0,13),(405,'Semen Analysis','Details to be soon uploaded','service_4pn148rk58g1drs760et',0,0,13),(406,'Aspirate Pus M/C/S','Details to be soon uploaded','service_37lalj8whk4qh7nf9n23',0,0,13),(407,'Microfilaria','Details to be soon uploaded','service_yrf4mv60kf9x5zh3m4gi',0,0,13),(408,'Urethral And Wound M/C/S','Details to be soon uploaded','service_e3wawcizrnkrnboriqkh',0,0,13),(409,'Skin Snip','Details to be soon uploaded','service_s00bfalf1ogjgbkp7n1y',0,0,13),(410,'Skin Scraping For Fungal Elements','Details to be soon uploaded','service_g4cp84jlsleeykhpu7ay',0,0,13),(411,'Sputum AFB For Tuberculosis X3','Details to be soon uploaded','service_txjuk3rgzi6csk5fnx5w',0,0,13),(412,'Urine Pregnancy Test','Details to be soon uploaded','service_v2vmuj9odfplrx30x0md',0,0,14),(413,'ASO Titre (nephrology)','Details to be soon uploaded','service_83lps500o8db542j8g93',0,0,14),(414,'ASO Titre/anti DnascB','Details to be soon uploaded','service_ym5zn1mz9ab075wt8u9k',0,0,14),(415,'C-Reactive protein (CRP)','Details to be soon uploaded','service_86ipl6q6bmbieongxyop',0,0,14),(416,'Helicobacter pylori (serum)','Details to be soon uploaded','service_crmeu0hiw76tbwz87mqn',0,0,14),(417,'Helicobacter pylori (stool antigen)','Details to be soon uploaded','service_iq1mi3qjhpklqpvhyfjd',0,0,14),(418,'Herpes Simplex 1 & 11 (1gm/1gG)','Details to be soon uploaded','service_065bqkyi5fvzprs8vddh',0,0,14),(419,'TORCH Screen','Details to be soon uploaded','service_5n4yti3jq4o1oqqsk4y5',0,0,14),(420,'Widal','Details to be soon uploaded','service_vi4vgeqef465g9tvu2kb',0,0,14),(421,'Vdrl','Details to be soon uploaded','service_ak66la7v10t5szdidhyj',0,0,14),(422,'Australian Antigen','Details to be soon uploaded','service_9aqwisfvlia4yhf5psii',0,0,14),(423,'Rheumatoid Factor','Details to be soon uploaded','service_mte27brivafk7re1ieb7',0,0,14),(424,'Pregnancy Test HCG (Blood)','Details to be soon uploaded','service_opchld9v990abxdgmpum',0,0,14),(425,'R.f. CoombÍs','Details to be soon uploaded','service_t6h6jnz2plfs6egigbdx',0,0,14),(426,'ASO Heaf Test','Details to be soon uploaded','service_ysx31hns2iviub1tlnjz',0,0,14),(427,'HbsAg','Details to be soon uploaded','service_t91dxlt9wljjjkacwybi',0,0,14),(428,'Screening For HIV 1 & 2','Details to be soon uploaded','service_hmk0o7d6syx7g6bkzqc6',0,0,14),(429,'Confirmatory Test For HIV 1 & 2','Details to be soon uploaded','service_8897j91m42takyqrmg8g',0,0,14),(430,'TYPHIM VI (1 DOSE SYRINGE)','Details to be soon uploaded','service_dg4txqms86v69drgveaz',0,0,1),(431,'TYBAR (1 DOSE VIAL)','Details to be soon uploaded','service_5sl5zwzxezsn8jjh151s',0,0,1),(432,'TYBAR (5 DOSE VIAL)','Details to be soon uploaded','service_b7xln5zb0p23ewcygkov',0,0,1),(433,'TYPHERIX (1 DOSE SYRINGE)','Details to be soon uploaded','service_iwpmrthe22ougedgifys',0,0,1),(434,'HAVRIX  (1 DOSE VIAL)','Details to be soon uploaded','service_k0n9gxbka54hf5cjklow',0,0,2),(435,'ENGERIX B 20MCG  (1 DOSE SYRINGE)','Details to be soon uploaded','service_enhhtr15tbmfb11m74ug',0,0,3),(436,'GENEVAC B 1ML (1 DOSE VIAL)','Details to be soon uploaded','service_j34rxkn6n9pvuzwp12fg',0,0,3),(437,'GENEVAC B 10ML (1 DOSE VIAL)','Details to be soon uploaded','service_meqiruj6de6mzdi13w52',0,0,3),(438,'SHANVAC B 20MCG (1 DOSE VIAL)','Details to be soon uploaded','service_bx7cbwwd3t7k57sih72p',0,0,3),(439,'REVAC B 1ML ( 1 DOSE VIAL)','Details to be soon uploaded','service_jkgtfwyz4qtg4xh3k5sv',0,0,3),(440,'REVAC B 10ML (10 DOSE VIAL)','Details to be soon uploaded','service_s3e9pk0g6rufz3uwixhx',0,0,3),(441,'ENGERIX B 10MCG (1 DOSE SYRINGE)','Details to be soon uploaded','service_0sqqkuvhx0ptxcbak0vd',0,0,3),(442,'DULTAVAX (1 DOSE SYRINGE)','Details to be soon uploaded','service_dshq0a9llmv2uepzegbf',0,0,4),(443,'VERORAB (1 DOSE SYRINGE)','Details to be soon uploaded','service_wqkiv6892w23alrlv5fz',0,0,5),(444,'INDIRAB ( 1 DOSE VIAL)','Details to be soon uploaded','service_mtuhfipg5rjtjzqbb58g',0,0,5),(445,'VAXIGRIP (1 DOSE SYRINGE)','Details to be soon uploaded','service_ke69x453vcruq4iz96bk',0,0,6),(446,'CERVARIX (1 DOSE SYRINGE)','Details to be soon uploaded','service_bu868jmsmexkd7kqa4yg',0,0,7),(447,'PRIORIX (1 DOSE VIAL)','Details to be soon uploaded','service_xvbn3wey9jv0nix7qyqu',0,0,8),(448,'TRESIVAC (1 DOSE VIAL)','Details to be soon uploaded','service_x6bxr3uhnm6b3hxdhnk3',0,0,8),(449,'VARILRIX (1 DOSE SYRINGE)','Details to be soon uploaded','service_2f9hzvy0kwkm0uncpq02',0,0,9),(450,'VARICELLA VACCINE(1 DOSE VIAL)','Details to be soon uploaded','service_8cv3v7s3cfyhx944o5kh',0,0,9),(451,'PRIORIX TETRA (1 DOSE SYRINGE)','Details to be soon uploaded','service_fricljoncberh159cd05',0,0,10),(452,'1 DOSE VIAL','Details to be soon uploaded','service_yrsvw4qoujkmtg7lws2p',0,0,11),(453,'MEASLES VACCINE (1 DOSE VIAL)','Details to be soon uploaded','service_991sj8uceetbolorl4mo',0,0,12),(454,'TWINRIX (1 DOSE VIAL)','Details to be soon uploaded','service_h4769cag9no2nccw0m7d',0,0,13),(455,'NIMENRIX (1 DOSE SYRINGE)','Details to be soon uploaded','service_vhsk6nsisz99bie6qxzb',0,0,14),(456,'MENCEVAX  (1 DOSE VIAL)','Details to be soon uploaded','service_6svq2li757smqmpfjgjo',0,0,15),(457,'MENINGOCOCAL VACCINE (1 DOSE VIAL)','Details to be soon uploaded','service_5vxk7glcoxeg45acltcp',0,0,15),(458,'PENTAVALENT (1 DOSE VIAL)','Details to be soon uploaded','service_ajtotaeie61puj34neih',0,0,16),(459,'PENTAXIM (1 DOSE SYRINGE)','Details to be soon uploaded','service_sgz0w24eiq1n0dzcap8h',0,0,17),(460,'TETRAXIM (1 DOSE SYRINGE)','Details to be soon uploaded','service_69dw08x22nykmssag3is',0,0,18),(461,'ROTARIX (1 DOSE SYRINGE)','Details to be soon uploaded','service_vjowgbhcw5igdyrzlfi5',0,0,19),(462,'SYNFLORIX (1 DOSE SYRINGE)','Details to be soon uploaded','service_3zpa2699t4zch5s1usds',0,0,20),(463,'PREVENER 13 (1 DOSE SYRINGE)','Details to be soon uploaded','service_u6jtp15opl3o4oy0jtk4',0,0,20),(464,'PREVENER 13 (10 DOSE SYRINGE)','Details to be soon uploaded','service_zc446i7t67k6rw97kch0',0,0,20),(465,'TETAVAX (1 DOSE SYRINGE)','Details to be soon uploaded','service_b0tuq27tyshn26secvxy',0,0,21),(466,'(1 DOSE SYRINGE)','Details to be soon uploaded','service_o85dxorozv14tp7mzik7',0,0,21),(467,'STAMARIL (1 DOSE SYRINGE)','Details to be soon uploaded','service_h4kgzd9928bjob0d8d7k',0,0,22),(468,'SHANCHOL (1 DOSE VIAL)','Details to be soon uploaded','service_yuc4oeenbf9455o4gfnh',0,0,23),(469,'TETGLOB 250IU','Details to be soon uploaded','service_z6rt4bi92q6przeq2epv',0,0,24),(470,'IMMUNOHBS (1 DOSE VIAL)','Details to be soon uploaded','service_zgybv72si9lowtlu4lwu',0,0,25),(471,'Hepatitis B (1 DOSE VIAL)','Details to be soon uploaded','service_htbcyku1xlbfbkq1a407',0,0,26),(472,'Hepatitis B (1 DOSE VIAL)','Details to be soon uploaded','service_lenkro13tdvlhplxi2s5',0,0,25),(473,'ASNA-C','Details to be soon uploaded','service_khxxw3z6oselvzkq1e67',0,0,26),(474,'VINS','Details to be soon uploaded','service_ssazq9j3akf3ai0r3bqc',0,0,26),(475,'GENERIC ','Details to be soon uploaded','service_9pov1cpcdqfdmhtyizth',0,0,27),(476,'RHOGAM','Details to be soon uploaded','service_y7vtrn1bfl4g1nblbvkw',0,0,28),(477,'RHOCLONE','Details to be soon uploaded','service_pw81xt1a0pks6apu9rww',0,0,28),(478,'IMMUNORHO','Details to be soon uploaded','service_5zcnfq6qn3y7x0oysov0',0,0,28),(479,'SYNTOCINON','Details to be soon uploaded','service_n79ly8f62zi29us6iubt',0,0,29),(480,'VENTOLIN','Details to be soon uploaded','service_baq71iainux8t1rtuo1l',0,0,30),(481,'VENTOLIN','Details to be soon uploaded','service_sdtnhhqdumoy730lrwmw',0,0,30),(482,'CLEXANE','Details to be soon uploaded','service_sb2q728gblr7mqngphjj',0,0,31),(483,'ZEFFIX (TABS 100MG)','Details to be soon uploaded','service_0pv5uk8rcyqujle6lvx7',0,0,32),(484,'HY-DASE','Details to be soon uploaded','service_1n8x7u8jkqod1ncd04qj',0,0,33),(485,'DICLAIR-ST (1 DOSE AMPOULE)','Details to be soon uploaded','service_a8280mam69o7dsegomud',0,0,34),(486,'KONAKION','Details to be soon uploaded','service_glcne1t8nevmddirskwu',0,0,35),(487,'ENGERIX B 10mcg (1 dose syringe) for 1 Paediatric Dose','Details to be soon uploaded','service_nuebvsck6kvc8mm3j4lt',0,0,36),(488,'REVAC B+ (0.5ml vial X 1 dose) for 1 Paediatric Dose','Details to be soon uploaded','service_ec49tbz1yl1v69th49br',0,0,36),(489,'GENEVAC B (0.5ml vial X 1 dose) for 1 Paediatric Dose','Details to be soon uploaded','service_3osycss8jvhtq96x1xlo',0,0,36),(490,'SHANVAC B 10mcg (1 dose) for 1 Paediatric Dose','Details to be soon uploaded','service_u5s412uwlzvl2c0ke5ki',0,0,36),(491,'NIMENRIX (1 dose syringe) for 1 Paediatric Dose','Details to be soon uploaded','service_li00770znx8h7anfhy2y',0,0,36),(492,'MENCEVAX (1 dose vial) for 1 Paediatric Dose','Details to be soon uploaded','service_gt3fm18c0tjxk50fcvm7',0,0,37),(493,'HIBERIX (1 dose syringe) for 1 Paediatric Dose','Details to be soon uploaded','service_9e06zmr93pnnox856f6r',0,0,38),(494,'PENTAVALENT (1 vial for 10 Paediatric Doses)','Details to be soon uploaded','service_4xuyq31m84ijwr11p1ro',0,0,39),(495,'PENTAVALENT (1 dose syringe) for 1 Paediatric Dose','Details to be soon uploaded','service_21aixkmn3y4qvs7twdx1',0,0,40),(496,'PENTAXIM (1 dose syringe) for 1 Paediatric Dose','Details to be soon uploaded','service_evk3t8fd1v6j1dfcnc92',0,0,40),(497,'TETRAXIM (1 dose syringe) for 1 Paediatric Dose','Details to be soon uploaded','service_cr1c5ilrrim5aiqw3wi2',0,0,41),(498,'TETRAVALENT ( 1 dose syringe) for 1 Paediatric Dose','Details to be soon uploaded','service_fndkuuqrydoew8yrd99g',0,0,42),(499,'ROTARIX (1 dose syringe) for 1 Paediatric Dose','Details to be soon uploaded','service_fajy79xvapyes64vr3z3',0,0,43),(500,'SYNFLORIX (1 dose syringe) for 1 Paediatric Dose','Details to be soon uploaded','service_qvz9f0txoalnz0tx9gkg',0,0,43),(501,'PREVENER 13 (1 dose syringe) for 1 Paediatric Dose','Details to be soon uploaded','service_zm5bxdmx9kxdam2w3h2s',0,0,44),(502,'PREVENER 13 (1 dose syringe for 10 Paediatric Doses)','Details to be soon uploaded','service_9mhvob5yqdljxkr2bdcz',0,0,44),(503,'Consultation','Details to be soon uploaded','service_utfemgzyvsftu70cy8qu',0,0,1),(504,'Follow Consultation','Details to be soon uploaded','service_xdrj0pqvvr1r6ihfi97m',0,0,1),(505,'Consultation','Details to be soon uploaded','service_uhhz5zwzo382zqli8qjx',0,0,2),(506,'Follow-up Consultation','Details to be soon uploaded','service_qmrrgthyjgy8t2csjh9w',0,0,2),(507,'Consultation','Details to be soon uploaded','service_a2igtk11l4coort6wn98',0,0,3),(508,'Follow-up Consultation','Details to be soon uploaded','service_krm3vqjxedlldbal0xl3',0,0,3),(509,'Consultation','Details to be soon uploaded','service_af9eotkg33oszarurl9w',0,0,4),(510,'Follow-up Consultation','Details to be soon uploaded','service_clq01wmzkcozpzxbkjb0',0,0,4),(511,'Consultation','Details to be soon uploaded','service_9uj6sxamzt7dcmit05k4',0,0,5),(512,'Follow-up Consultation','Details to be soon uploaded','service_td5o6df15y97onwfztf2',0,0,5),(513,'Consultation','Details to be soon uploaded','service_l6tbqx36c5eow19i5xqt',0,0,6),(514,'Follow-up Consultation','Details to be soon uploaded','service_i3axr28ulwu0r5tfmdab',0,0,6),(515,'Consultation','Details to be soon uploaded','service_hlbza18jbxzab5je0hvz',0,0,7),(516,'Follow-up Consultation','Details to be soon uploaded','service_h9n1dhc98ivalq1hwsjz',0,0,7),(517,'Consultation','Details to be soon uploaded','service_kh9r8bqhptbbkfiy5fdi',0,0,8),(518,'Follow-up Consultation','Details to be soon uploaded','service_bg6em3xks49zhcr5ja6r',0,0,8),(519,'Consultation','Details to be soon uploaded','service_84d1xcr692eq2u6fmzqj',0,0,9),(520,'Follow-up Consultation','Details to be soon uploaded','service_re87mluevqkggcjogsvm',0,0,9),(521,'Consultation','Details to be soon uploaded','service_op3brl5qsllxkzufeh50',0,0,10),(522,'Follow-up Consultation','Details to be soon uploaded','service_ar8an1ptozvmkd982uh1',0,0,10),(523,'Consultation','Details to be soon uploaded','service_f4tsfktgvbnqq3rx3i3d',0,0,11),(524,'Follow-up Consultation','Details to be soon uploaded','service_p5xw70bou0rh3t3437ad',0,0,11),(525,'Consultation','Details to be soon uploaded','service_qbon7jhcwjpewpzhkfta',0,0,12),(526,'Follow-up Consultation','Details to be soon uploaded','service_a7ejpw1oglwzc8bkoezx',0,0,12),(527,'Consultation','Details to be soon uploaded','service_j5spr6bxj3f5whcri1ew',0,0,13),(528,'Follow-up Consultation','Details to be soon uploaded','service_83hzd5jlia6uzlftypm0',0,0,13),(529,'Consultation','Details to be soon uploaded','service_2k3aiw7ryzae5dln011i',0,0,14),(530,'Follow-up Consultation','Details to be soon uploaded','service_alo1xby4cxzwcswp58zx',0,0,14),(531,'Consultation','Details to be soon uploaded','service_x4t49boufgwvbcpnzpww',0,0,15),(532,'Follow-up Consultation','Details to be soon uploaded','service_5767k8qnb1l4p7j6ie6z',0,0,15),(533,'Consultation','Details to be soon uploaded','service_fyskb9n4uo4141hotexl',0,0,16),(534,'Follow-up Consultation','Details to be soon uploaded','service_3bsfbs7idtjch80xcrrl',0,0,16),(535,'Consultation','Details to be soon uploaded','service_bxpyxobydllrymp0ry48',0,0,17),(536,'Follow-up Consultation','Details to be soon uploaded','service_x3ux7g1cmhge1vowtdhi',0,0,17),(537,'Consultation','Details to be soon uploaded','service_3frrhs0hrc58jsedlh7v',0,0,18),(538,'Consultation','Details to be soon uploaded','service_nwc6syk0ml3npdppl33k',0,0,19),(539,'Follow-up Consultation','Details to be soon uploaded','service_967h1l1y1s984xrj211k',0,0,19),(540,'Consultation','Details to be soon uploaded','service_4rm7o7nqi4ae7tk3xtmf',0,0,20),(541,'Follow-up Consultation','Details to be soon uploaded','service_i18b2esnrbydoeepsz0s',0,0,21),(542,'ENT Consultation','Details to be soon uploaded','service_cldj76b1an6f862u6rnq',0,0,22),(543,'Follow-up Consultation','Details to be soon uploaded','service_yccimzgcsenj2nbx2ir5',0,0,22),(544,'Dermatology Consultation','Details to be soon uploaded','service_2d8mr0s1zerynhhoj7cu',0,0,23),(545,'Follow-up Consultation','Details to be soon uploaded','service_kz5gj9p3fd1iifqfb9v9',0,0,23),(546,'Paediatric Surgeon Consultation','Details to be soon uploaded','service_ao5afiwd0k9wb4f9k3rd',0,0,24),(547,'Follow-up Consultation','Details to be soon uploaded','service_b3olacod1y5y8vf8o1c8',0,0,24),(548,'Orthopaedic Surgeon Consultation','Details to be soon uploaded','service_fyuwkjbuojszv9iqvmq5',0,0,25),(549,'Follow-up Consultation','Details to be soon uploaded','service_m22vy8391qu6gqzy7zsj',0,0,25),(550,'Opthalmologist Consultation','Details to be soon uploaded','service_az5cug5seu1x2xk11q3i',0,0,26),(551,'Follow-up Consultation','Details to be soon uploaded','service_y8dmstl2m1r5uive3zrp',0,0,26),(552,'Sleep Therapy','Details to be soon uploaded','service_09rx2hq9ymff18as8kxa',0,0,27),(553,'Dental  Apicectomy','Details to be soon uploaded','service_fh0xh0q41shodr0nckw4',0,0,1),(554,'Dental Alveoloplasty','Details to be soon uploaded','service_t3vzpq2guj3pgqpcn57c',0,0,1),(555,'Dental Bite Plane','Details to be soon uploaded','service_dsez04t5p5r5mfrbg50u',0,0,1),(556,'Dental Bleaching (Tooth Whitening) - Full Mouth','Details to be soon uploaded','service_6mptlmjlx0cib4p90qg1',0,0,1),(557,'Dental Bleaching (Tooth Whitening) - Single Arch','Details to be soon uploaded','service_ynrwisk557enjzvd7ays',0,0,1),(558,'Dental Crown - Full Ceramic','Details to be soon uploaded','service_jaj4bunjj2k6upicv21v',0,0,1),(559,'Dental Crown - Metal','Details to be soon uploaded','service_cfpfvqkr6s0sszp8zgr8',0,0,1),(560,'Dental Crown - Metal Ceramic','Details to be soon uploaded','service_aicp9xi2l2n6oekq1ue8',0,0,1),(561,'Dental Cyst Removal - Big','Details to be soon uploaded','service_ap93g1wqncxf1qe9kxkb',0,0,1),(562,'Dental Cyst Removal - Small','Details to be soon uploaded','service_c01zmmoxc3dq367g2nkm',0,0,1),(563,'Dental Fillings - Silver Amalgam','Details to be soon uploaded','service_cfowe372zhq7c3u6hwsx',0,0,1),(564,'Dental Fillings - Tooth Color Filling','Details to be soon uploaded','service_4k71omeexi1bt7f0xmsp',0,0,1),(565,'Dental Flap Surgery With Grafting (Per Quadran)','Details to be soon uploaded','service_x89pwmgc5073zb9g5tdc',0,0,1),(566,'Dental Fracture Reduction (WO OT Charges)','Details to be soon uploaded','service_aycd3q1n1k8in7qcdxya',0,0,1),(567,'Dental Full Denture - Flexible','Details to be soon uploaded','service_b3bmp0v4skiwra6s6z44',0,0,1),(568,'Dental Gingivectomy / Gingivoplasty','Details to be soon uploaded','service_sc6beg2t70351whdtr5i',0,0,1),(569,'Dental IMF','Details to be soon uploaded','service_jte1sef58dl8oslc57c7',0,0,1),(570,'Dental Implant - With Crown','Details to be soon uploaded','service_y6jxo7jwv9clz57mkhn6',0,0,1),(571,'Dental IOPA -Small Dental Xray','Details to be soon uploaded','service_kd376ku6fpqctalw6iq4',0,0,1),(572,'Dental OPG','Details to be soon uploaded','service_vg56jiv9djfbbpxka9s1',0,0,1),(573,'Dental Orthodontic - Invisaline','Details to be soon uploaded','service_3i423zqbpz1b9m78rul9',0,0,1),(574,'Dental Orthodontic -Regular','Details to be soon uploaded','service_h8c5q8maoz12nwyhxyvq',0,0,1),(575,'DENTAL ORTHODONTICS TOOTH COLORED SINGLE ARCH','Details to be soon uploaded','service_jtagzwwcv3zmce85rcva',0,0,1),(576,'Dental Othodontic - Lingual','Details to be soon uploaded','service_638b83zcm0bhhmeu5cq3',0,0,1),(577,'Dental Othodontic - Tooth Colored','Details to be soon uploaded','service_sluc716stvoe4agvo0tv',0,0,1),(578,'Dental Partial Denture - Cast Partial (Per Tooth)','Details to be soon uploaded','service_wmtelpep1qixvymh06yk',0,0,1),(579,'Dental Partial Denture - Regular (Per Tooth)','Details to be soon uploaded','service_mbf1z14nt8jsyx4h8sns',0,0,1),(580,'Dental Post and Core','Details to be soon uploaded','service_53es0b27k2da5p5sa3ff',0,0,1),(581,'Dental Registration','Details to be soon uploaded','service_j9eqd7xum3ohrr1km0p0',0,0,1),(582,'Dental Root Canal Anteriors','Details to be soon uploaded','service_sfp2qhi55mecb94d9hme',0,0,1),(583,'Dental Root Canel Posteriors','Details to be soon uploaded','service_mk7n9ea4379nddh18jat',0,0,1),(584,'Dental Single Arch Denture','Details to be soon uploaded','service_m9rasn44c8oyqdz74x37',0,0,1),(585,'Dental Single Arch Orthodontics','Details to be soon uploaded','service_vkjvxs321sh8tahy92op',0,0,1),(586,'Dental Single Jaw Flexible Denture','Details to be soon uploaded','service_vrcg9txd3egxl5d3jjkr',0,0,1),(587,'Dental Single Jaw Metallic','Details to be soon uploaded','service_lg1rekou2uylazlcv81k',0,0,1),(588,'Dental Single Jaw Tooth Colored','Details to be soon uploaded','service_g87cfw0berxnh04m81je',0,0,1),(589,'Dental Tooth Cleaning (Full Mouth)','Details to be soon uploaded','service_f6qli7kqwadqh1cgl05a',0,0,1),(590,'Dental Tooth Removal - Milk Tooth','Details to be soon uploaded','service_5diizugg4eylzdtfrrsu',0,0,1),(591,'Dental Tooth Removal - Normal','Details to be soon uploaded','service_tj10g0lk3hzhz8sdsybv',0,0,1),(592,'Dental Tooth Removal - Wisdom','Details to be soon uploaded','service_fc12qzyd876q9ci99lio',0,0,1),(593,'Dental Tooth Tatoo','Details to be soon uploaded','service_dhk6raydnfipw87lofql',0,0,1),(594,'Dental Zirconia Diamond Studs','Details to be soon uploaded','service_qipr5s6wre6rtyn1p2mx',0,0,1),(595,'Surgical Extraction','Details to be soon uploaded','service_7fl2r2vr308oj0tk7x35',0,0,1),(596,'Dental Crowns','Details to be soon uploaded','service_bvm4vfg7tb2ird6jscuz',0,0,1),(597,'Bridgeworks','Details to be soon uploaded','service_5z7b5d2jwn9ih4uvuhev',0,0,1),(598,'Implants','Details to be soon uploaded','service_y4ynsc8zo2xnpqlzznpp',0,0,1),(599,'Braces','Details to be soon uploaded','service_fc28ui9hzhzcalti5f9b',0,0,1),(600,'Root Canal Therapy','Details to be soon uploaded','service_04im0gq1rkcpcn3yvbrr',0,0,1),(601,'Lenses & Frames ','Details to be soon uploaded','service_tstottkob6t9hl49bbjq',0,0,2),(602,'Visual Acuity','Details to be soon uploaded','service_1xwpyj3kg8binry5e9ym',0,0,2),(603,'Excision of tumour on abdominal wall','Details to be soon uploaded','service_tatc4tehjogx9y62cvry',0,0,3),(604,'Biopsy Of Tumor Of Abdominal Wall','Details to be soon uploaded','service_bj8uo80dir30wgb8zwnv',0,0,3),(605,'Breast Lump Excision (Excluding Histology)','Details to be soon uploaded','service_zfvgtvmk5xowue85efa4',0,0,3),(606,'Ganglion Excision','Details to be soon uploaded','service_9yxpl7lrgbdwwi2uroke',0,0,3),(607,'Injection Sclerotherapy Of Varicose Veins','Details to be soon uploaded','service_6yag8ynpmc7lrm4x98nr',0,0,3),(608,'Incision & Drainage (I & D)','Details to be soon uploaded','service_gnnf1021a3h55jo48qri',0,0,3),(609,'Ingrowing  Nail (Excision)','Details to be soon uploaded','service_76d5zog8ejyn0220okth',0,0,3),(610,'Keloid Excision (Minor)','Details to be soon uploaded','service_z4ww4ot1xndgd43w2s7p',0,0,3),(611,'Lumps Excision(Lumpectomy)','Details to be soon uploaded','service_tjgtgqqv8j9rk1z8kiro',0,0,3),(612,'Excisional Biopsy(Excluding Histology)','Details to be soon uploaded','service_ymmnfissu5vr6ow38aey',0,0,3),(613,'Cystic Hygroma Excision','Details to be soon uploaded','service_stnbs00cammxpe88c3dl',0,0,3),(614,'Small Cyst Excision','Details to be soon uploaded','service_bw61e4vbmtlooqeuusi4',0,0,3),(615,'Keloid Excision (Major)','Details to be soon uploaded','service_o6lctnll56s2z0yinrbk',0,0,3),(616,'Liver/Kidney/Bone Marrow Biopsy','Details to be soon uploaded','service_o6wx9pzzqs8tzphbn8gs',0,0,3),(617,'Thyroglossal Cysts And Fistula Excision','Details to be soon uploaded','service_fi4d7yi4o7sv90aqxl4w',0,0,3),(618,'Excision Of Intrascrotal Mass','Details to be soon uploaded','service_2iabopv3gqh829309xm5',0,0,3),(619,'Bronchoscopy','Details to be soon uploaded','service_vfc8kmzu7nsf767bsoue',0,0,4),(620,'Endoscopy Of The GIT','Details to be soon uploaded','service_65n62sneiymnv2slnom1',0,0,4),(621,'Oesophagoscopy','Details to be soon uploaded','service_h4dezv8aaznif41jr0ua',0,0,4),(622,'Proctoscopy','Details to be soon uploaded','service_apcrxjxbabj87j5adeyi',0,0,4),(623,'Sigmoidoscopy','Details to be soon uploaded','service_6ttniqjdog2k1poalofj',0,0,4),(624,'Colonscopy','Details to be soon uploaded','service_bvvlf73w0cgi5sqi4v2g',0,0,4),(625,'Hysteroscopy','Details to be soon uploaded','service_qt01kft3qay4he4vowtr',0,0,4),(626,'Proctoscopy','Details to be soon uploaded','service_180so0gcazxym99s8ymf',0,0,4),(627,'Intercostal Drainage Insertion(Thoracostomy)','Details to be soon uploaded','service_l5mek006qkfhquxyt6p3',0,0,5),(628,'Major Surgical Incision And Drainage ','Details to be soon uploaded','service_uj1nhdpo7ezpw2rnfa6c',0,0,5),(629,'Suprapubic Cystostomy','Details to be soon uploaded','service_3l6xyaxy64t5vnhc4w93',0,0,5),(630,'Surgical Release In Stenosing Tenosynovitis','Details to be soon uploaded','service_8tb9wi4jstrfqmhbx9s2',0,0,5),(631,'Synovectomy','Details to be soon uploaded','service_4f5rmnvrrfjt0hdoaleg',0,0,5),(632,'Tracheostomy','Details to be soon uploaded','service_vilimeddbv9vixb83rnw',0,0,5),(633,'Abdominal Rectopexy','Details to be soon uploaded','service_xf1df2vuru7ho3ik9kyd',0,0,5),(634,'Anal Fistulectomy Repair','Details to be soon uploaded','service_kutzp4wzvadisupgyuoc',0,0,5),(635,'Anal Spincteroplasty','Details to be soon uploaded','service_gg2hzk0nx0elg2hb8hra',0,0,5),(636,'Appendicectomy','Details to be soon uploaded','service_tqvbowet7oag6wze0gs1',0,0,5),(637,'Dissection Of Femoral Triangle','Details to be soon uploaded','service_tilomb6a1vqyn6pz03sj',0,0,5),(638,'Epigastric Herniorrhaphy','Details to be soon uploaded','service_r0nhruf2nyoycrjd10y6',0,0,5),(639,'Fistula In-Ano Repair','Details to be soon uploaded','service_bx93w9bj6y0hw4na1ukk',0,0,5),(640,'Haemorrhoidectomy','Details to be soon uploaded','service_cvmn7g7zt06eiums99sy',0,0,5),(641,'Herniorraphy _ Inguinal/Others','Details to be soon uploaded','service_g2rsilhy6rxm62x41a0q',0,0,5),(642,'Hydrocoelectomy','Details to be soon uploaded','service_p6gf98bc32ywxe4o27q3',0,0,5),(643,'Multiple Ligation Of Veins','Details to be soon uploaded','service_rjclr1bajx9xfu60qn6i',0,0,5),(644,'Orchidectomy/Orchidopexy','Details to be soon uploaded','service_37n2q9qkee21r5z2levx',0,0,5),(645,'Pericardiocentesis','Details to be soon uploaded','service_03pl2thg9r8991x1igco',0,0,5),(646,'Surgery Of Torsion Of Spermatic Cord','Details to be soon uploaded','service_kflqqqxg3eddhybuv2ya',0,0,5),(647,'Surgical Correction Of DupuytrenÍs Contracture','Details to be soon uploaded','service_j8lffn4ly709i5qsw9cl',0,0,5),(648,'Surgical Drainage Of Anal Abscess','Details to be soon uploaded','service_v52tkexhyj88pub4hn19',0,0,5),(649,'Synovectomy','Details to be soon uploaded','service_mxdxnks8hy84ov903rce',0,0,5),(650,'Thoracotomy','Details to be soon uploaded','service_5k212fh3w037uyoatalz',0,0,5),(651,'Varicocoelectomy','Details to be soon uploaded','service_phz0iofbnikaa1e2wnz0',0,0,5),(652,'Vasectomy','Details to be soon uploaded','service_2dax61ja8uyd65i1f04f',0,0,5),(653,'Cavernospongiosum Shunt','Details to be soon uploaded','service_d0jipaai4e58qmdnhhca',0,0,5),(654,'Colostomy Construction/Closure','Details to be soon uploaded','service_n1dgxegb81ksnh8yomva',0,0,5),(655,'Diverticulectomy','Details to be soon uploaded','service_dqmq57tkseofe6iezx7r',0,0,5),(656,'Hiatus Herniorrphaphy','Details to be soon uploaded','service_obne8sonb42r4hd6i2j3',0,0,5),(657,'Laparotomy','Details to be soon uploaded','service_67c4y6gsdtjdwca04rwg',0,0,5),(658,'Local Resection Of Pelvic Tumor','Details to be soon uploaded','service_041qkxg9241jyqlp61sf',0,0,5),(659,'Oesophagostomy','Details to be soon uploaded','service_fxf5scjo1m2fbmgn3mn4',0,0,5),(660,'Oophorectomy','Details to be soon uploaded','service_ymfmarojb6mn3nx0m6fs',0,0,5),(661,'Retroperitoneal Drainage Of Perinephric Abscess','Details to be soon uploaded','service_x2oyczoacdgajvqxkal6',0,0,5),(662,'Surgery Of Uncomplicated Intestinal Obstruction Without  Resection','Details to be soon uploaded','service_y487eelgqqfolsjz3jyg',0,0,5),(663,'Transrectal Biopsy Of Prostate/Prostatectomy','Details to be soon uploaded','service_4sjyp0huw6y4a56lpgbh',0,0,5),(664,'Uretherectomy','Details to be soon uploaded','service_97688gwj2hvpk9ulxekn',0,0,5),(665,'Acute Intra Abdominal Vascular Disease Surgery','Details to be soon uploaded','service_4aezdvmlx0jzr7ry2fc9',0,0,5),(666,'Axillary Dissection Of Breast','Details to be soon uploaded','service_6dre10wnqailu7a039dz',0,0,5),(667,'Bowel Resection And Anastomosis','Details to be soon uploaded','service_uqk2s4npcfbq857u5psj',0,0,5),(668,'Cholecystectomy','Details to be soon uploaded','service_313tlmbfjv9ur8zciwkq',0,0,5),(669,'Choledochojejunostomy','Details to be soon uploaded','service_psqjj06kq27vj6lasem5',0,0,5),(670,'Cystectomy Partial/Total','Details to be soon uploaded','service_fhsha1xdxqe90qvtzf3r',0,0,5),(671,'Diaphragmatic Hernia Repair','Details to be soon uploaded','service_uacprzls5tak5sib79g4',0,0,5),(672,'Excision Of Lymphoedematous Lymph Tissues','Details to be soon uploaded','service_d7k0fn6irn1tbdt0xec7',0,0,5),(673,'Exploratory Laparotomy/Lysis Of Adhensions','Details to be soon uploaded','service_9m98kawcjnhdnr280avp',0,0,5),(674,'Gastroenterostomy','Details to be soon uploaded','service_gtc3z5rterkk18xyztcg',0,0,5),(675,'Intussusception Operation','Details to be soon uploaded','service_lprjrmfng6yvdp5fegno',0,0,5),(676,'MeckelÍs Diverticulectomy','Details to be soon uploaded','service_0ffw9sk4t18vhcug02z6',0,0,5),(677,'Pyeloroplasty','Details to be soon uploaded','service_d55hgzjlzg6fa5phjzw9',0,0,5),(678,'Pyelotomy','Details to be soon uploaded','service_jyla5a3kgn067avgflf0',0,0,5),(679,'Renal Cystectomy','Details to be soon uploaded','service_y8wf71p5eqspf22g6c9c',0,0,5),(680,'Repair Of Gastric Lacerations','Details to be soon uploaded','service_xtar4g8zoo2ru2i1el01',0,0,5),(681,'Repair Of Oesophageal Lacerations','Details to be soon uploaded','service_tnnpq75vw6b6nhclwh4n',0,0,5),(682,'Resection And Anstomoses (Small/Large Intestines)','Details to be soon uploaded','service_zzzt8rb4otki06btcp5q',0,0,5),(683,'Roux-En-Y Pancreaticojejunostomy','Details to be soon uploaded','service_kdgv9azqqysqaeftd1kh',0,0,5),(684,'Splenorrhaphy/ Splenectomy','Details to be soon uploaded','service_gzg77ro5wnfc3zjfwbng',0,0,5),(685,'Surgery Of Complications Of Appendicitis','Details to be soon uploaded','service_ttu1uqpy02vaavypz8lu',0,0,5),(686,'Surgery Of Hepatic Trauma','Details to be soon uploaded','service_25xcjgyn4d3hsvi4hcko',0,0,5),(687,'Surgery Of Small/Large Bowel Perforations','Details to be soon uploaded','service_1ags1c29h130y200dv35',0,0,5),(688,'Abdomino-Perineal Resection','Details to be soon uploaded','service_d8aky5rlo8189xgqr35x',0,0,5),(689,'Adrenalectomy','Details to be soon uploaded','service_1mg7pppp5ki8i9ojz08g',0,0,5),(690,'Decortication','Details to be soon uploaded','service_x7ljasvghkev6vqd56cq',0,0,5),(691,'Encephalocoele Excision','Details to be soon uploaded','service_p5afrzl7tjjimaxy7b2u',0,0,5),(692,'Extended Radical Mastectomy','Details to be soon uploaded','service_bvhloczf1o2ecq9kaqmm',0,0,5),(693,'Gastrectomy/Colectomy-Partial Or Total','Details to be soon uploaded','service_0qpg98vz2v1ys5he2a21',0,0,5),(694,'Mammoplasty','Details to be soon uploaded','service_d7hqyox4h9hiydhnunzf',0,0,5),(695,'Nephrectomy','Details to be soon uploaded','service_y505hub0za7f6rfq9or9',0,0,5),(696,'Nephrolithotomy/Urethrotomy/Urethroplasty','Details to be soon uploaded','service_1kec20ucvov87dyzwqr7',0,0,5),(697,'Oesophagectomy','Details to be soon uploaded','service_q1al31zt2i5zd995ktk8',0,0,5),(698,'Pancreatectomy','Details to be soon uploaded','service_2bghffbdgbo6raz1p21s',0,0,5),(699,'Pelvic Evisceration','Details to be soon uploaded','service_8xprhdgssrrtd5mpzn8w',0,0,5),(700,'Pericardiectomy','Details to be soon uploaded','service_d36ort6yz5glr8pljcrk',0,0,5),(701,'Pleurectomy','Details to be soon uploaded','service_tey3uyqokucjf6qy10s8',0,0,5),(702,'Pneumonectomy','Details to be soon uploaded','service_5ua4jh00yrvcdbluu3k9',0,0,5),(703,'Prostatectomy, Retropubic/Transvesical','Details to be soon uploaded','service_tp0dk87e2aamhqx2iatf',0,0,5),(704,'Radical Mastectomy','Details to be soon uploaded','service_jbsen0vain5uhfe29sj1',0,0,5),(705,'Splenectomy','Details to be soon uploaded','service_8s9v9vrueiacj9m5ic65',0,0,5),(706,'Submandibular Sialoadenectomy','Details to be soon uploaded','service_twetq0a9fkr1kxnm4zan',0,0,5),(707,'Thoracectomy/Thoracoplasty','Details to be soon uploaded','service_l679dd8bpnvjw8xghl8z',0,0,5),(708,'Thyroidectomy','Details to be soon uploaded','service_lnizttnvzh6w9cnsyw28',0,0,5),(709,'Vagotomy/Pyloroplasty','Details to be soon uploaded','service_ekmx100k0d75y9ewa8n1',0,0,5),(710,'Close Reduction Of Fracture And Application Cast','Details to be soon uploaded','service_oseik950tg3shczb5hez',0,0,6),(711,'Amputation And Disarticulation Of Joints.','Details to be soon uploaded','service_dczcqk4nexc9qc3txb3j',0,0,6),(712,'Amputation And Limb Substitution','Details to be soon uploaded','service_mw4ah7m392sw5lubohjw',0,0,6),(713,'Arthroplasty/Arthrodesis','Details to be soon uploaded','service_r6p845zi6nogzyoxyhgw',0,0,6),(714,'Bone Grafting','Details to be soon uploaded','service_erfjqkvrbtxqfhorj23a',0,0,6),(715,'Chondromectomy','Details to be soon uploaded','service_ze5y2pkp4rdpwksb4bfw',0,0,6),(716,'Congenital Talipes  Equanovarus/Valgus Surgical Repair','Details to be soon uploaded','service_4xzjxdec3a4v74t6wg56',0,0,6),(717,'ORIF with Implant (with hospitalisation)','Details to be soon uploaded','service_5ekd3nl6cj60xqsm20gc',0,0,6),(718,'Removal of Implant','Details to be soon uploaded','service_gwlwuicewai7ypr0qw9b',0,0,6),(719,'Sequestrectomy','Details to be soon uploaded','service_82q0u4dcct161oaq2cci',0,0,6),(720,'Subperiosteal Drainage Of Acute Osteomyelitis','Details to be soon uploaded','service_sqzds4exbmc4xv1k4dmr',0,0,6),(721,'Tendon Transplant/Tenoplasty','Details to be soon uploaded','service_zbawhel75mnl6dv7ur3n',0,0,6),(722,'Close Reduction Of Fracture And Application Cast','Details to be soon uploaded','service_uhejuvqr4ghrctf5mj79',0,0,6),(723,'Drainage Of Septic Arthritis','Details to be soon uploaded','service_ggkcg4lgyuunrfxkveqg',0,0,6),(724,'Skin Traction(Procedure+Material)','Details to be soon uploaded','service_puxi7ap3dhtegjauwrj4',0,0,6),(725,'Simple Congenital Talipes Repair ','Details to be soon uploaded','service_fp7l5ioofusiu828l8mt',0,0,6),(726,'OPEN REDUCTION AND INTERNAL FIXATION OF FRACTURES OF:','Details to be soon uploaded','service_yrb8lkmnep9zipyzljyx',0,0,6),(727,'OPEN REDUCTION AND INTERNAL FIXATION OF FRACTURES OF PECTORAL GIRDLE','Details to be soon uploaded','service_bdu0wu7qowdixot467sz',0,0,6),(728,'OPEN REDUCTION AND INTERNAL FIXATION OF FRACTURES OF FORE-ARM','Details to be soon uploaded','service_8wofhujl81dwmrbrk5wb',0,0,6),(729,'OPEN REDUCTION AND INTERNAL FIXATION OF FRACTURES OF HAND','Details to be soon uploaded','service_uexp732l6y0umk0ebmv7',0,0,6),(730,'OPEN REDUCTION AND INTERNAL FIXATION OF FRACTURES OF PELVIC GIRDLE','Details to be soon uploaded','service_bqqjv5pu0cr0nrh2qauz',0,0,6),(731,'OPEN REDUCTION AND INTERNAL FIXATION OF FRACTURES OF THIGH','Details to be soon uploaded','service_jyvohv90sdixl7xlip78',0,0,6),(732,'OPEN REDUCTION AND INTERNAL FIXATION OF FRACTURES OF LEG','Details to be soon uploaded','service_jxj4mfdqlkym6f6j4w7l',0,0,6),(733,'OPEN REDUCTION AND INTERNAL FIXATION OF FRACTURES OF FOOT','Details to be soon uploaded','service_qncqq4i8xtm55aoosulv',0,0,6),(734,'OPEN REDUCTION AND INTERNAL FIXATION OF FRACTURES OF RIBS','Details to be soon uploaded','service_hyogy3gpgq2l6x9qooc0',0,0,6),(735,'OPEN REDUCTION AND INTERNAL FIXATION OF FRACTURES OF SPINAL COLUMN','Details to be soon uploaded','service_3ypaf21ca1wpkfki86k4',0,0,6),(736,'OSTEOCLASIS, INTERNAL FIXATION OF MALUNION','Details to be soon uploaded','service_bx7cokb55b66ld1j5rvh',0,0,6),(737,'BONE GRAFTING','Details to be soon uploaded','service_ganapxg8bdfxjvvk76a7',0,0,6),(738,'AMPUTATION AND LIMB SUBSTITUTION','Details to be soon uploaded','service_y5e52i1z69u9x2kb1sjw',0,0,6),(739,' Salpingectomy','Details to be soon uploaded','service_itrsqur5cbk7uu1e2xao',0,0,7),(740,'Ultrasound Scan (Obstetric)','Details to be soon uploaded','service_fhoysy3o6jp3keq35lp5',0,0,7),(741,'IUCD Insertion','Details to be soon uploaded','service_v0iv1clwsx2yfuot216s',0,0,7),(742,'IUCD Removal','Details to be soon uploaded','service_v8hhjvcshyzom0uaht1p',0,0,7),(743,'Excision/Diathermy Of Warts','Details to be soon uploaded','service_1jad7eavesdoqpto82lt',0,0,7),(744,'Cervical Cautery','Details to be soon uploaded','service_ese6ved8xxn8v3h7hvtp',0,0,7),(745,'Cervical Cone/Punch Biopsy','Details to be soon uploaded','service_5mqm0kox6h8jao1j1lwt',0,0,7),(746,'Colposcopy','Details to be soon uploaded','service_d94zvcao1od68zsgpgkl',0,0,7),(747,'ARTIFICIAL INSEMINATION','Details to be soon uploaded','service_m8n9l90swh81lutqbxps',0,0,7),(748,'MVA/ERCP/Evacuation','Details to be soon uploaded','service_71ltik9g4s2kq0yqllup',0,0,7),(749,'Cervical Laceration Repair','Details to be soon uploaded','service_fjm02oqu0ag2u0h9gkkf',0,0,7),(750,'Removal Of IUCD Under General Anaesthesia','Details to be soon uploaded','service_ju2e65nhbqx9mjd3uw1j',0,0,7),(751,'Examination Under Anaesthesia (EUA)','Details to be soon uploaded','service_seu6sfu9yngjbpechnbo',0,0,7),(752,'Repair Of Third Degree Tear','Details to be soon uploaded','service_oo5xeekurecxdk342gu5',0,0,7),(753,'Excision Of Vaginal Septum','Details to be soon uploaded','service_s2e5w5i98e0d8wzkgc1s',0,0,7),(754,'Hydrotubation','Details to be soon uploaded','service_683nqfh4qowmdepppg73',0,0,7),(755,'Marsupialisation','Details to be soon uploaded','service_wai3ly7y7u59tmjbynst',0,0,7),(756,'Pelvic/abdominal abscess drainage','Details to be soon uploaded','service_tl3g08h6z9e1y7qqj6g4',0,0,7),(757,'Hysteroscopy','Details to be soon uploaded','service_ihxyse5jfjdh3719yeg5',0,0,7),(758,'Laparoscopy & Dye Test','Details to be soon uploaded','service_ntej9xylhb2l7p4adv0x',0,0,7),(759,'Bilateral Tubal Ligation','Details to be soon uploaded','service_eccn6v8wx09482e7f6vu',0,0,7),(760,'Cervical Cerclage/Shirodkar Suture','Details to be soon uploaded','service_0jhzxpxow6cyvaq4wo90',0,0,7),(761,'Destructive Delivery (Craniotomy-Embryotomy)','Details to be soon uploaded','service_ek9zfw48kqi2n37x4g4w',0,0,7),(762,'Diagnostic Laparoscopy','Details to be soon uploaded','service_829uivln8d2166flz8cl',0,0,7),(763,'Caesarean section','Details to be soon uploaded','service_vy6tvq7y950qxe7hkzt2',0,0,7),(764,'Repair of ruptured  uterus','Details to be soon uploaded','service_xwcg455irh1nbtw54hhs',0,0,7),(765,'Colporrhaphy/colpoperineorrhaphy','Details to be soon uploaded','service_ulvkvb4v7noq4u5wg2r0',0,0,7),(766,'Ectopic pregnancy','Details to be soon uploaded','service_t6c7g0ta2qnqatxo2wxz',0,0,7),(767,'Hysterectomy','Details to be soon uploaded','service_nlqzfz2hjhmvrsyg96l9',0,0,7),(768,'Hysterectomy and bilateral salpingooophorectomy','Details to be soon uploaded','service_qtsqfj21683l7a5bxmiz',0,0,7),(769,'Myomectomy','Details to be soon uploaded','service_l4m18gaht02eor213pq1',0,0,7),(770,'Salpingo-oophorectomy','Details to be soon uploaded','service_8eu9q2ahvkqiiaqygaum',0,0,7),(771,'Ovarectomy/ovarian cysts','Details to be soon uploaded','service_plznzvcax8ukjohle3dy',0,0,7),(772,'Vesicovaginal/Rectovaginal fistula repair','Details to be soon uploaded','service_w1gqfxgecw86kr6y4i0o',0,0,7),(773,'Rhogam Injection','Details to be soon uploaded','service_l0xir10xc9l3syg0anwi',0,0,7),(774,'ANC Care','Details to be soon uploaded','service_n6c35mj0szvhd269i58t',0,0,8),(775,'Normal Delivery','Details to be soon uploaded','service_73icg75j0zrq1qgu2xjy',0,0,8),(776,'Assisted Delivery','Details to be soon uploaded','service_p1l724388bjrznsok3v9',0,0,8),(777,'(Forceps,Vaccum etc)','Details to be soon uploaded','service_cq7k3bpofok45m1hpe0f',0,0,8),(778,'Twin Delivery','Details to be soon uploaded','service_vzcfoq3d6fhsfmr9zv07',0,0,8),(779,'Foreign Body Removal From The Ear, Nose And Throat','Details to be soon uploaded','service_28mxb6iu44fqm8aj3r3f',0,0,9),(780,'Electrocautery Of Nose','Details to be soon uploaded','service_5jgxofixah0vrcr3uo67',0,0,9),(781,'Nasal Packing','Details to be soon uploaded','service_wiwjxf8fzmdmvv0v16ga',0,0,9),(782,'Aural And Nasal Suction/Clearance','Details to be soon uploaded','service_1q3nevdiywrqk6egog8f',0,0,9),(783,'Incision And Drainage Of Abscess','Details to be soon uploaded','service_jvgm7ntw74z6x7kbmnyf',0,0,9),(784,'Debridement And Toilet Of Wounds','Details to be soon uploaded','service_s60ehmhtf6d2q13p6olb',0,0,9),(785,'Suturing Of Lacerations','Details to be soon uploaded','service_r2brgugyllm94tl90oin',0,0,9),(786,'Manipulation Of Nose','Details to be soon uploaded','service_x14cnzljlww8m2tkgkwn',0,0,9),(787,'Pure Tone Audiometry','Details to be soon uploaded','service_4057kz73frqbbrmjl0oe',0,0,9),(788,'Tympanometry','Details to be soon uploaded','service_iu2n8abzm7rz36zp61hy',0,0,9),(789,'Aesthetic And Reconstructive Surgery','Details to be soon uploaded','service_rhslbid1czoyurygb3l9',0,0,9),(790,'Antral Larvage','Details to be soon uploaded','service_7k3gboubvklstmse4pat',0,0,9),(791,'Cystic/Fibrous Dysplasia/ Cancer Surgery','Details to be soon uploaded','service_pbdge64mv17cgnnjt6v0',0,0,9),(792,'Indirect Laryngoscopy','Details to be soon uploaded','service_t1h8sjnq1x9ppwigl1r8',0,0,9),(793,'Laryngeal Surgery','Details to be soon uploaded','service_lc0zu3md7ir8qrpep8ps',0,0,9),(794,'Mastoid Surgery','Details to be soon uploaded','service_70rlcht3qur72wmlosob',0,0,9),(795,'Multiple Nasal Polypectomy','Details to be soon uploaded','service_jeo8zqhw6j5it4rnjko4',0,0,9),(796,'Nasal Sinus Surgery E.G Caldwell Luc','Details to be soon uploaded','service_o5axa8hzhxitn16ke63d',0,0,9),(797,'Odontogenic Tumours.','Details to be soon uploaded','service_s8jsbsc3oc28k88in60f',0,0,9),(798,'Parotidectomy','Details to be soon uploaded','service_lvmh3lp3kz9lq6wmyd77',0,0,9),(799,'Submandibular Gland Excision','Details to be soon uploaded','service_9d9evzlav6t85onj0knm',0,0,9),(800,'Tympanoplasty','Details to be soon uploaded','service_jpcyzwv6suwfogai4phc',0,0,9),(801,'CLEFT LIP AND PALATE REPAIRS.','Details to be soon uploaded','service_oudugczxcbt8zmh2f2yv',0,0,9),(802,'TRACHEOSTOMY','Details to be soon uploaded','service_6yhctqiewiqqbky1ec5m',0,0,9),(803,'TONSILECTOMY','Details to be soon uploaded','service_it8uxgejyojnukiv3jd2',0,0,9),(804,'ADENOIDECTOMY','Details to be soon uploaded','service_76qqsu38zwkdrrxdiwgt',0,0,9),(805,'REMOVAL OF  IMPACTED CERUMEN (SYRINGING/TOILETING)','Details to be soon uploaded','service_4vgl42duaz5k7g2c8byk',0,0,9),(806,'Granuloma Excision','Details to be soon uploaded','service_vv3d4t4jnm0tzsy75zsy',0,0,10),(807,'Chalazion Surgery','Details to be soon uploaded','service_9h1ndb3gpzjwy8x6jeux',0,0,10),(808,'Pterygium Excision','Details to be soon uploaded','service_4jf7gnvys1yh2c85cbtx',0,0,10),(809,'Corneal Laceration Repair','Details to be soon uploaded','service_84h5ep5tefnh9x8n7svj',0,0,10),(810,'Glaucoma (Trabeculectomy)','Details to be soon uploaded','service_kejpkbowi8jm9myp76za',0,0,10),(811,'Extracapsular/Intracapsular Cataract Extraction','Details to be soon uploaded','service_vvtag33lvoweew61etn5',0,0,10),(812,'Minor','Details to be soon uploaded','service_p13pp9xxytczefch9aly',0,0,10),(813,'BowmanÍs Cautery','Details to be soon uploaded','service_j8nh9agttig2daug9n35',0,0,10),(814,'Conjunctival Laceration Repair','Details to be soon uploaded','service_vpqov9rngp3zk2mfws3s',0,0,10),(815,'Diode Laser Cycloablation','Details to be soon uploaded','service_d2nsnftgfz23xvbz7chs',0,0,10),(816,'Entropion And Ectropion Repairs','Details to be soon uploaded','service_fwb5bdz9fm4hh1p92igv',0,0,10),(817,'Syringing And Probing','Details to be soon uploaded','service_phj8uedlugfriqx2bnwn',0,0,10),(818,'Traumatic Lid Laceration Repair','Details to be soon uploaded','service_ym2axj05schy3xi27cbx',0,0,10),(819,'Tumor Excision From Lid','Details to be soon uploaded','service_ln0rgvl51mwiw4jo51z9',0,0,10),(820,'Conjuctivectomy And Cryoapplication','Details to be soon uploaded','service_wnfu0r8x7kaz0x1tnldh',0,0,10),(821,'Dacrocystorhinostomy','Details to be soon uploaded','service_ni9i4ofqd4err1e0o5op',0,0,10),(822,'Evisceration/Enucleation/Exenteration','Details to be soon uploaded','service_7khk4t6rp8ub2gr1tt81',0,0,10),(823,'Intraocular Lens Implantation','Details to be soon uploaded','service_sob1ie3o8ao9wm9w9lf5',0,0,10),(824,'Paracentesis (A/C Washout)','Details to be soon uploaded','service_3kfm9k4lntqaqlecrbet',0,0,10),(825,'Penetrating Keratoplasty (PKP)','Details to be soon uploaded','service_l9pbgq42r4xif80am4ji',0,0,10),(826,'Ptosis Repair','Details to be soon uploaded','service_uiaqbg07e29lyjngcgpr',0,0,10),(827,'Retinal Detachment Surgery','Details to be soon uploaded','service_s8t5u18ciwqjcvekj7ux',0,0,10),(828,'Squint Surgery','Details to be soon uploaded','service_f1mapx7zl8dew3s12cfr',0,0,10),(829,'Traumatic Cannalicular Repair','Details to be soon uploaded','service_6canturny8deufpfpbik',0,0,10),(830,'Traumatic Corneal And/or Scleral Laceration Repair','Details to be soon uploaded','service_xl6qgpko1p8h7npd31m8',0,0,10),(831,'DIODE LASER PANRETINAL PHOTOCOAGULATION','Details to be soon uploaded','service_1rtd9suq1nxqewjwdluo',0,0,10),(832,'CRITICAL CARE (IN ICU)','Details to be soon uploaded','service_7xu8ep8p28gf5l10jmqp',0,0,11),(833,'OXYGEN THERAPY','Details to be soon uploaded','service_8nttoamehhf2ncr4pkl2',0,0,11),(834,'CRITICAL CARE (IN ICU) PER DAY','Details to be soon uploaded','service_iwgovhepz4gauacs5wpx',0,0,11),(835,'OXYGEN THERAPY','Details to be soon uploaded','service_aqnh83qgtg1i3gks1r8g',0,0,11),(836,'NEBULISATION','Details to be soon uploaded','service_6vochk2zdowbr0q946t0',0,0,11),(837,'GASTRIC LAVAGE','Details to be soon uploaded','service_ykdstlsf3r0q50sqqou6',0,0,11),(838,'ELECTRO-CONVULSIVE THERAPY per treatment','Details to be soon uploaded','service_d50sir9abrbfh0lg2r8h',0,0,12),(839,'ELECTRO-NARCOSIS per COURSE ','Details to be soon uploaded','service_u7t83alou2fs166v1wsh',0,0,12),(840,'SLEEP (REM) DEPRIVATION THERAPY','Details to be soon uploaded','service_u6l4ng86fqik9yqconiu',0,0,12),(841,'MANAGEMENT OF DRUG USE PROBLEMS ','Details to be soon uploaded','service_rj2e0g630q0gm5c98mme',0,0,12),(842,'DETOXIFICATION IN HOSPITAL FOR 7-10 DAYS','Details to be soon uploaded','service_o4nvfj8hwi603xuejx23',0,0,12),(843,'MANAGEMENT OF DRUG PROBLEMS _ MEDICATION,','Details to be soon uploaded','service_vyp2d2zeyzaaybz6ligw',0,0,12),(844,'PSYCHOTHERAPY, FAMILY INTERVENTION','Details to be soon uploaded','service_fq793artd4wfuh50h0c9',0,0,12),(845,'COMPREHENSIVE PSYCHIATRIC ASSESSMENT','Details to be soon uploaded','service_n3byhs1xycox7iwqxn7y',0,0,12),(846,'PSYCHOMETRIC ASSESSMENT, SCORING & INTERPRETATION','Details to be soon uploaded','service_qjuqo7e7fz44mfe961jh',0,0,12),(847,'PSYCHOTHERAPIES per session','Details to be soon uploaded','service_cn2eevuc8prndanforg6',0,0,12),(848,'Craniotomy','Details to be soon uploaded','service_u0ltdhyamcq4uj4d7pet',0,0,13),(849,'Subdural Tap','Details to be soon uploaded','service_g8sni8l3n3oc4um6h03v',0,0,13),(850,'Renal dialysis','Details to be soon uploaded','service_s59fx59vyc59fto4d5ip',0,0,14),(851,'Audiometry','Details to be soon uploaded','service_nsctoc1ejw16rm66lign',0,0,15),(852,'Major Wound Dressing','Details to be soon uploaded','service_392lgbukd1qoiwbqr3yu',0,0,16),(853,'Minor Wound Dressing','Details to be soon uploaded','service_ksr1mguep63lx7vgh86i',0,0,16),(854,'Exchange Blood Transfusion (Rh +Ve Blood With Set)','Details to be soon uploaded','service_ffkhifa9x3t7vddgv9f7',0,0,17),(855,'Exchange Blood Transfusion (Rh -Ve Blood With Set)','Details to be soon uploaded','service_r6gq9b2r2p60g576iit1',0,0,17),(856,'Nebulisation','Details to be soon uploaded','service_orltza7gh9mlay4r2tis',0,0,18),(857,'Skin Grafting','Details to be soon uploaded','service_q2o88i9a34b10tlwgenu',0,0,19),(858,'Aspirations / Paracentesis','Details to be soon uploaded','service_bzkwqyy8yyfhx735vvwo',0,0,19),(859,'Evacuation Of Impacted Feaces','Details to be soon uploaded','service_c83q9kwms8epltr886wg',0,0,19),(860,'Gastric Lavage','Details to be soon uploaded','service_wf9jf4oeftas5ccje7ef',0,0,19),(861,'Incubator Care / Day','Details to be soon uploaded','service_16rng9kjm46awtpjjm0c',0,0,19),(862,'Lumbar Puncture','Details to be soon uploaded','service_ax6rxtb5sonoo132pare',0,0,19),(863,'Oxygen Therapy / Day','Details to be soon uploaded','service_0755pn6ywgufp39sbsxc',0,0,19),(864,'Phototherapy / Day','Details to be soon uploaded','service_0on5wi5of8yihphh21qd',0,0,19),(865,'Cauterization ','Details to be soon uploaded','service_ui267n2r45dsbm57wd6o',0,0,19),(866,'Circumcision','Details to be soon uploaded','service_l8dmvfuqtkp720cmb1j6',0,0,19),(867,'Clucthes','Details to be soon uploaded','service_huz26hkq7hnewpma0ag6',0,0,19),(868,'Congenital Multiple Digits Or Syndactyly','Details to be soon uploaded','service_hqn65kn1kw5rh7dmwor3',0,0,19),(869,'Ear Piercing','Details to be soon uploaded','service_f9v4a7dmf6z4qi2l964f',0,0,19),(870,'Knee Effusion Taps','Details to be soon uploaded','service_oc8tgh6b82ojmb3maqi0',0,0,19),(871,'Tongue Tie Release','Details to be soon uploaded','service_1idbcuoohgvyqn380lt9',0,0,19),(872,'Minor Debridement Of Burns','Details to be soon uploaded','service_vri3r7w7u3ai2lmpy3d0',0,0,19),(873,'Relase Of Chordate','Details to be soon uploaded','service_p70dttbghnji3igjyt3t',0,0,19),(874,'Repair Of Minor Laceration','Details to be soon uploaded','service_vzq4bylrnhe7maouu7rt',0,0,19),(875,'6 Courses of Podophyllin Painting X for Perineal Warts','Details to be soon uploaded','service_xydbfb7atla603ju4in6',0,0,19),(876,'Mammography','Details to be soon uploaded','service_cfd6qyfiks2a4jxtblv5',0,0,1),(877,'PAP Smears  for cytological examination -  [Pap smear] ','Details to be soon uploaded','service_3wsxua6a574sks7txivu',0,0,2),(878,'Prostate Cancer','Details to be soon uploaded','service_x87k114xvy84n8og2uqo',0,0,3),(879,'Colon Cancer','Details to be soon uploaded','service_bv6nrvvgpc2ls0hgiz4c',0,0,4),(880,'Uterine Cancer','Details to be soon uploaded','service_2j8vriolw5rvwf8o05my',0,0,5),(881,'Liver Cancer','Details to be soon uploaded','service_brp5y90b33bsg9lqx6f5',0,0,6),(882,'Lung Cancer','Details to be soon uploaded','service_076fvgxfczmo1xsa6yod',0,0,7),(883,'Stomach Cancer','Details to be soon uploaded','service_ajbj50oxkpjdzwaaxfmm',0,0,8),(884,'Brain Cancer','Details to be soon uploaded','service_9j1pp0u3wolnw6gm9crj',0,0,9),(885,'Glaucoma Eye Test','Details to be soon uploaded','service_hq98384jyurceo4cvain',0,0,1),(886,'Audiological Ear Assessment','Details to be soon uploaded','service_as7qswd8a41muz5ph4v0',0,0,2),(887,'Liver Test','Details to be soon uploaded','service_j135qria5x8zpwfk2nes',0,0,3),(888,'Kidney Test','Details to be soon uploaded','service_s3y6wzko4qqitd9l5h2t',0,0,4),(889,'Thyroid Test','Details to be soon uploaded','service_4p7ug5cdixccy41ajzjl',0,0,5),(890,'Hepatitis B Test','Details to be soon uploaded','service_pm54d42kzjniqx3mrl2l',0,0,6),(891,'Basic Health Check','Details to be soon uploaded','service_v6c0wddpte7h4r0cvlun',0,0,7),(892,'Comprehensive Health Check','Details to be soon uploaded','service_h1rvs5k5s771tnc6ukss',0,0,8),(893,'Diabetes HbAic Test','Details to be soon uploaded','service_6w1wnr975ysjw0pjzr1h',0,0,9),(894,'Pre Employment Tests','Details to be soon uploaded','service_pcf95lqjtbh0lwyxvdft',0,0,10),(895,'Heart Tracker','Details to be soon uploaded','service_0mk0axxyt39c7invv5ql',0,0,1),(896,'Foreign Medical Treatment','Details to be soon uploaded','service_95o2m15p44qkwdtb43mc',0,0,1),(897,'Foreign Medical Treatment','Details to be soon uploaded','service_ngnonb9s8lh2m6opvc6x',0,0,2),(898,'Foreign Medical Treatment','Details to be soon uploaded','service_361a1xvgb0hgc0ts7cq9',0,0,3),(899,'Foreign Medical Treatment','Details to be soon uploaded','service_7yu7naidv5ztb3lwdtcj',0,0,4),(900,'Foreign Medical Treatment','Details to be soon uploaded','service_qri8tfxnpvotwofrrluh',0,0,5),(901,'Foreign Medical Treatment','Details to be soon uploaded','service_nxubgf1w1lxwigtx66nr',0,0,6),(902,'Foreign Medical Treatment','Details to be soon uploaded','service_twkjv5muknewfd37heel',0,0,7),(903,'Foreign Medical Treatment','Details to be soon uploaded','service_jlfr7mj5hg8b3et6n0ox',0,0,8),(904,'Foreign Medical Treatment','Details to be soon uploaded','service_ntchkcqwbq7cv9928luq',0,0,9),(905,'Foreign Medical Treatment','Details to be soon uploaded','service_aahun8pp2bj9hutmcrf0',0,0,10),(906,'Medical Concierge','Details to be soon uploaded','service_k6t65lz2j7e1solxkkz2',0,0,1),(907,'Health Insurance','Details to be soon uploaded','service_64m117q1ooi50bb2j8pg',0,0,1),(908,'Talk To A Doctor','Details to be soon uploaded','service_aqwq6z1op566y3rcnr8z',0,0,1),(909,'Gym & Fitness Services','Details to be soon uploaded','service_hbbe6i66744bojxxf1ok',0,0,1),(910,'Weight loss counselling and wellness','Details to be soon uploaded','service_quehreuy44504nu6v0kt',0,0,1),(911,'Dietician Consultation','Details to be soon uploaded','service_ce0avqq7voov6ky1j7jf',0,0,2),(912,'Evacuation from Home to Hospital','Details to be soon uploaded','service_cnncn0n1h1wx0yhj89v6',0,0,1),(913,'Evacuation from hospital to hospital','Details to be soon uploaded','service_qj5xwn8q18c5m8f55da2',0,0,2),(914,'Evacuation from accident site to hospital','Details to be soon uploaded','service_vxa45zf8awum8q1mgzej',0,0,3);
/*!40000 ALTER TABLE `service_healthierservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_orderedservice`
--

DROP TABLE IF EXISTS `service_orderedservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_orderedservice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_status` tinyint(1) NOT NULL,
  `order_id` varchar(200) NOT NULL,
  `promo_code` varchar(200) NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `cancellation_time` varchar(50) NOT NULL,
  `arrival_time` varchar(50) NOT NULL,
  `arrival_date` varchar(50) NOT NULL,
  `members` longtext NOT NULL,
  `comment` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `ordered_by_id` int(11) DEFAULT NULL,
  `provided_by_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_id` (`service_id`),
  KEY `service_ordereds_ordered_by_id_b66ca5e0_fk_consumers_consumer_id` (`ordered_by_id`),
  KEY `service_ordered_provided_by_id_61ca9081_fk_providers_provider_id` (`provided_by_id`),
  CONSTRAINT `service_order_service_id_eea245bf_fk_service_healthierservice_id` FOREIGN KEY (`service_id`) REFERENCES `service_healthierservice` (`id`),
  CONSTRAINT `service_ordered_provided_by_id_61ca9081_fk_providers_provider_id` FOREIGN KEY (`provided_by_id`) REFERENCES `providers_provider` (`id`),
  CONSTRAINT `service_ordereds_ordered_by_id_b66ca5e0_fk_consumers_consumer_id` FOREIGN KEY (`ordered_by_id`) REFERENCES `consumers_consumer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_orderedservice`
--

LOCK TABLES `service_orderedservice` WRITE;
/*!40000 ALTER TABLE `service_orderedservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_orderedservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_servicegroup`
--

DROP TABLE IF EXISTS `service_servicegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_servicegroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(200) NOT NULL,
  `group_description` varchar(1000) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_servicegroup_b583a629` (`category_id`),
  CONSTRAINT `service__category_id_2b75a170_fk_service_servicegroupcategory_id` FOREIGN KEY (`category_id`) REFERENCES `service_servicegroupcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_servicegroup`
--

LOCK TABLES `service_servicegroup` WRITE;
/*!40000 ALTER TABLE `service_servicegroup` DISABLE KEYS */;
INSERT INTO `service_servicegroup` VALUES (1,'CT','Description to be coming soon',1),(2,'MRI','Description to be coming soon',1),(3,'Ultrasound Scan And Imaging','Description to be coming soon',1),(4,'X-Rays Imaging','Description to be coming soon',1),(5,'ECG','Description to be coming soon',1),(6,'ECHO','Description to be coming soon',1),(7,'EEG','Description to be coming soon',1),(8,'GENETICS','Description to be coming soon',1),(9,'Histopathology','Description to be coming soon',1),(10,'Cytology','Description to be coming soon',1),(11,'Biochemistry','Description to be coming soon',1),(12,'Blood Tests','Description to be coming soon',1),(13,'Microbiology','Description to be coming soon',1),(14,'Serology','Description to be coming soon',1),(15,'Typhoid Vaccine','Description to be coming soon',2),(16,'Hepatitis A Vaccine','Description to be coming soon',2),(17,'Adult Hepatitis B Vaccine','Description to be coming soon',2),(18,'DIPTHERIA, TETANUS, IPV','Description to be coming soon',2),(19,'Rabies Vaccine','Description to be coming soon',2),(20,'Influenza Vaccine','Description to be coming soon',2),(21,'Cervical Cancer Vaccine','Description to be coming soon',2),(22,'MMR (MUMPS, MEASLES, RUBELLA)','Description to be coming soon',2),(23,'CHICKENPOX VACCINE','Description to be coming soon',2),(24,'MMR, CHICKEN POX','Description to be coming soon',2),(25,'INACTIVATED POLIO VACCINE (IPV)','Description to be coming soon',2),(26,'Measles Vaccine','Description to be coming soon',2),(27,'Hepatitis A and B Vaccine','Description to be coming soon',2),(28,'MENINGITIS VACCINE CONJUGATE','Description to be coming soon',2),(29,'MENINGITIS VACCINE ','Description to be coming soon',2),(30,'HIB, DPT, HEP B','Description to be coming soon',2),(31,'HIB,  DTaP, IPV','Description to be coming soon',2),(32,'DTaP, IPV','Description to be coming soon',2),(33,'ROTAVIRUS VACCINE','Description to be coming soon',2),(34,'PNEUMOCOCCAL CONJUGATEæ','Description to be coming soon',2),(35,'TETANUS TOXOID','Description to be coming soon',2),(36,'YELLOW FEVER VACCINE','Description to be coming soon',2),(37,'CHOLERA VACCINE','Description to be coming soon',2),(38,'TETANUS IMMUNOGLOBULIN BP HUMAN','Description to be coming soon',2),(39,'HEPATITIS B IMMUNOGLOBULIN 180iu','Description to be coming soon',2),(40,'POLYVALENT ANTI SNAKE VENOM','Description to be coming soon',2),(41,'POLYVALENT ANTI SNAKE VENOM IP','Description to be coming soon',2),(42,'Rho (D) IMMUNOGLOBULIN','Description to be coming soon',2),(43,'OXYTOCIN 10IU (PACK OF 10)','Description to be coming soon',2),(44,'SALBUTAMOL NEBULES 5MG','Description to be coming soon',2),(45,'ENOXAPARIN 4000IU/0.4ML INJ','Description to be coming soon',2),(46,'LAMIVUDINE','Description to be coming soon',2),(47,'HYALURONIDASE 1,500IU INJ (PACK OF 6)','Description to be coming soon',2),(48,'STREPTOKINASE 1,500,000IU INJ','Description to be coming soon',2),(49,'VITAMIN K','Description to be coming soon',2),(50,'Paediatric Hepatitis B Vaccine','Description to be coming soon',2),(51,'','Description to be coming soon',2),(52,'General Physician','Description to be coming soon',3),(53,'Psychiatrist','Description to be coming soon',3),(54,'Hypertension','Description to be coming soon',3),(55,'Diabetes','Description to be coming soon',3),(56,'Cardiology','Description to be coming soon',3),(57,'Pulmonology','Description to be coming soon',3),(58,'Nephrology','Description to be coming soon',3),(59,'Rheumatology','Description to be coming soon',3),(60,'Endocrinology','Description to be coming soon',3),(61,'Pain','Description to be coming soon',3),(62,'Arthritis','Description to be coming soon',3),(63,'Ante-Natal ','Description to be coming soon',3),(64,'Geriatric','Description to be coming soon',3),(65,'Urology','Description to be coming soon',3),(66,'Neurology','Description to be coming soon',3),(67,'Gastro-Intestinal','Description to be coming soon',3),(68,'NeuroSurgery','Description to be coming soon',3),(69,'Physiotherapy','Description to be coming soon',3),(70,'Oncology Consultation','Description to be coming soon',3),(71,'Paediatrics','Description to be coming soon',3),(72,'ENT','Description to be coming soon',3),(73,'Dermatology','Description to be coming soon',3),(74,'Paediatric Surgeon','Description to be coming soon',3),(75,'Orthopaedic Surgeon','Description to be coming soon',3),(76,'Opthalmologist','Description to be coming soon',3),(77,'Sleep Clinic','Description to be coming soon',3),(78,'DENTAL','Description to be coming soon',4),(79,'EYE','Description to be coming soon',4),(80,'Excisions and Biopsy','Description to be coming soon',4),(81,'Endoscopy','Description to be coming soon',4),(82,'Chest & Abdomino-Pelvic Procedures','Description to be coming soon',4),(83,'Orthopaedic Prcedures  ','Description to be coming soon',4),(84,'Obstetrics/Gyneacological Procedures','Description to be coming soon',4),(85,'Ante-Natal Care','Description to be coming soon',4),(86,'Ear/Nose/Throat Procedures   ','Description to be coming soon',4),(87,'Opthalmology Procedures','Description to be coming soon',4),(88,'Critical Care Procedures','Description to be coming soon',4),(89,'Mental Health Procedures','Description to be coming soon',4),(90,'Cranial Procedures','Description to be coming soon',4),(91,'Dialysis','Description to be coming soon',4),(92,'Audiometry','Description to be coming soon',4),(93,'Wound Dressing','Description to be coming soon',4),(94,'Exchange Blood Transfusion','Description to be coming soon',4),(95,'Nebulisation','Description to be coming soon',4),(96,'Other Procedures','Description to be coming soon',4),(97,'Breast Cancer','Description to be coming soon',5),(98,'Cervical Cancer','Description to be coming soon',5),(99,'Prostate Cancer','Description to be coming soon',5),(100,'Colon Cancer','Description to be coming soon',5),(101,'Uterine Cancer','Description to be coming soon',5),(102,'Liver Cancer','Description to be coming soon',5),(103,'Lung Cancer','Description to be coming soon',5),(104,'Stomach Cancer','Description to be coming soon',5),(105,'Brain Cancer','Description to be coming soon',5),(106,'Health Checks','Description to be coming soon',5),(107,'Health Checks','Description to be coming soon',6),(108,'Heart Tracker','Description to be coming soon',7),(109,'United Kingdom','Description to be coming soon',8),(110,'USA','Description to be coming soon',8),(111,'Dubai','Description to be coming soon',8),(112,'India','Description to be coming soon',8),(113,'Singapore','Description to be coming soon',8),(114,'Germany','Description to be coming soon',8),(115,'Turkey','Description to be coming soon',8),(116,'South Africa','Description to be coming soon',8),(117,'Other Countries','Description to be coming soon',8),(118,'France','Description to be coming soon',8),(119,'Medical Concierge','Description to be coming soon',9),(120,'Health Insurance','Description to be coming soon',10),(121,'Talk To A Doctor','Description to be coming soon',11),(122,'Gym & Fitness Services','Description to be coming soon',12),(123,'Weight Management','Description to be coming soon',13),(124,'Dietician Consultation','Description to be coming soon',13),(125,'Ambulance & Medical Assistance','Description to be coming soon',14),(126,'Air Ambulance','Description to be coming soon',15);
/*!40000 ALTER TABLE `service_servicegroup` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_servicegroupcategory`
--

LOCK TABLES `service_servicegroupcategory` WRITE;
/*!40000 ALTER TABLE `service_servicegroupcategory` DISABLE KEYS */;
INSERT INTO `service_servicegroupcategory` VALUES (1,'Vaccines','Prevent communicable diseases and protect your family with vaccines from certified vaccine companies'),(2,'Clinics','Choose and Book your clinic appointment with experienced and courteous Medical Professionals'),(3,'Procedures','Ensure only the best centers perform your Health procedures'),(4,'Cancer Screening','Cancer is a killer, screen with experienced and passionate screening centers TODAY'),(5,'Health Checks','Regular checks is necessary to maintain your HEALTH; Results are sent securely to your account'),(6,'Heart Tracker','Protect and Track your Heart Status with the Heart Tracker from our partner providers '),(7,'Foreign Medical Treatment','Want to enjoy Healthcare in another country, choose from carefully vetted healthcare providers across the world'),(8,'Medical Concierge','Let our carefully chosen Providers deliver top-notch health services for you in the comfort of your Home'),(9,'Health Insurance','Manage your Health Risks with our innovative Health Insurance services'),(10,'Talk To A Doctor','Have immediate access to a doctor or a second opinion with foreign doctors with your mobile device'),(11,'Gym & Fitness Services','Fitness is a Key part of Health, buy your gym services NOW'),(12,'Weight Management','Let Professionals help and encourage you manage your weight, you will look fabulous'),(13,'Ambulance & Medical Assistance','Our Ambulance and emergency services providers are always on call, should you need their urgent services'),(14,'Air Ambulance','Request a quote from Organizations providng Air ambulance service to all parts of the World');
/*!40000 ALTER TABLE `service_servicegroupcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_servicereport`
--

DROP TABLE IF EXISTS `service_servicereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_servicereport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `generated_on` datetime(6) NOT NULL,
  `report_file` varchar(100) DEFAULT NULL,
  `lower_range_measured` varchar(200) NOT NULL,
  `upper_range_measured` varchar(200) NOT NULL,
  `measured_value_value` varchar(200) NOT NULL,
  `measured_value_key` varchar(200) NOT NULL,
  `fillers_name` varchar(500) NOT NULL,
  `fillers_designation` varchar(300) NOT NULL,
  `report_summary` varchar(500) NOT NULL,
  `service_rendering_date` varchar(500) NOT NULL,
  `generated_for_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `service_s_generated_for_id_23668f7d_fk_service_orderedservice_id` (`generated_for_id`),
  CONSTRAINT `service_s_generated_for_id_23668f7d_fk_service_orderedservice_id` FOREIGN KEY (`generated_for_id`) REFERENCES `service_orderedservice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_servicereport`
--

LOCK TABLES `service_servicereport` WRITE;
/*!40000 ALTER TABLE `service_servicereport` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_servicereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_servicerequests`
--

DROP TABLE IF EXISTS `service_servicerequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_servicerequests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_date` datetime(6) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `is_ordered` tinyint(1) NOT NULL,
  `days_available` varchar(200) NOT NULL,
  `start_time_available` time(6) NOT NULL,
  `end_time_available` time(6) NOT NULL,
  `provision_description` longtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `requested_by_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `service_servic_requested_by_id_508f30e7_fk_providers_provider_id` (`requested_by_id`),
  KEY `service_servi_service_id_9dba7aeb_fk_service_healthierservice_id` (`service_id`),
  CONSTRAINT `service_servi_service_id_9dba7aeb_fk_service_healthierservice_id` FOREIGN KEY (`service_id`) REFERENCES `service_healthierservice` (`id`),
  CONSTRAINT `service_servic_requested_by_id_508f30e7_fk_providers_provider_id` FOREIGN KEY (`requested_by_id`) REFERENCES `providers_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_servicerequests`
--

LOCK TABLES `service_servicerequests` WRITE;
/*!40000 ALTER TABLE `service_servicerequests` DISABLE KEYS */;
INSERT INTO `service_servicerequests` VALUES (1,'2018-02-03 18:32:55.356455',30000.00,1,'MON','08:00:00.000000','08:00:00.000000','Yello.',1,8,1),(2,'2018-02-03 18:33:31.541684',15000.00,1,'EVR','08:00:00.000000','08:00:00.000000','RED.',1,8,3);
/*!40000 ALTER TABLE `service_servicerequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_suggestservice`
--

DROP TABLE IF EXISTS `service_suggestservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_suggestservice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(300) NOT NULL,
  `service_group` varchar(300) NOT NULL,
  `service_description` varchar(3000) NOT NULL,
  `service_suggestion_reason` varchar(3000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_suggestservice`
--

LOCK TABLES `service_suggestservice` WRITE;
/*!40000 ALTER TABLE `service_suggestservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_suggestservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_emaillist`
--

DROP TABLE IF EXISTS `user_emaillist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_emaillist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_user` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_emaillist`
--

LOCK TABLES `user_emaillist` WRITE;
/*!40000 ALTER TABLE `user_emaillist` DISABLE KEYS */;
INSERT INTO `user_emaillist` VALUES (1,'2018-02-03 17:39:41.602860','2018-02-03 17:39:41.654529','hihi@hihi.com',0);
/*!40000 ALTER TABLE `user_emaillist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_family`
--

DROP TABLE IF EXISTS `user_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `phone_number` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `healthier_id` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `added_on` date NOT NULL,
  `head_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `user_family_head_id_799d74fd_fk_user_healthieruser_id` (`head_id`),
  CONSTRAINT `user_family_head_id_799d74fd_fk_user_healthieruser_id` FOREIGN KEY (`head_id`) REFERENCES `user_healthieruser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_family`
--

LOCK TABLES `user_family` WRITE;
/*!40000 ALTER TABLE `user_family` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_faq`
--

DROP TABLE IF EXISTS `user_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) NOT NULL,
  `answer` longtext NOT NULL,
  `added_on` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_faq`
--

LOCK TABLES `user_faq` WRITE;
/*!40000 ALTER TABLE `user_faq` DISABLE KEYS */;
INSERT INTO `user_faq` VALUES (1,'What is HEALTHIER?','HEALTHIER is a personalized mobile health manager to identify healthcare needs and the best service providers for those needs.','2018-02-03 08:20:05.000000'),(11,'Why should I use HEALTHIER?','HEALTHIER manages your healthcare needs like buying health services, tracking your healthcare numbers, providing notifications for healthcare needs,booking appointment to save your time.','2018-02-03 08:21:17.000000'),(21,'How can I pay for health services?','HEALTHIER provides a secure platform for paying directly to your service providers account. You receive a payment confirmation from the provider, as soon as your payment is confirmed.','2018-02-03 08:21:31.000000'),(31,'Which platforms are supported?','Web and Mobile platforms like Android and iOS are supported','2018-02-03 08:21:44.000000'),(41,'How does the HEALTHIER platform to improve my Experience?','All service providers on HEALTHIER are vetted to ensure you continue to enjoy quality and trusted healthcare services. HEALTHIER also provides access to your health report through your mobile device, thereby improving your service experience.','2018-02-03 08:22:05.000000'),(51,'What are the other benefits of HEALTHIER?','Users have secure access to their Health information, Users can also view different types of health services, location of service providers and business hours.\n\nService providers can profile their services and acquire more clients, service providers also have a Dashboard that simplifies client management and reporting to clients.\n\nService providers can also offer service promos, track revenue and utilization and send reminders to clients','2018-02-03 08:22:41.000000'),(61,'Can I trust Service Providers on the HEALTHIER platform?','Services offered on HEALTHIER are continuously vetted by the portal administration to ensure service delivered is same as that offered. We also use previous User Experience to vet service providers.','2018-02-03 08:22:57.000000'),(71,'How secure is the HEALTHIER platform?','HEALTHIER platform security is benchmarked against the best Health technology standards. We also ensure that only the registered user can alter or view user accounts.','2018-02-03 08:23:17.000000'),(81,'Where can I use HEALTHIER?','HEALTHIER is a web and mobile platform available to Users and Service Providers anywhere in the world. A very important feature of HEALTHIER is the constant access of the User to their Health information.','2018-02-03 08:23:30.000000');
/*!40000 ALTER TABLE `user_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_healthieruser`
--

DROP TABLE IF EXISTS `user_healthieruser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_healthieruser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `account_type` varchar(3) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `city` varchar(200) NOT NULL,
  `phone_number` varchar(200) NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_logged_in` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `has_configured_account` tinyint(1) NOT NULL,
  `total_money` decimal(12,2) NOT NULL,
  `healthier_id` varchar(50) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `bank_account_name` varchar(400) NOT NULL,
  `bank_name` varchar(500) NOT NULL,
  `bank_account_number` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_healthieruser`
--

LOCK TABLES `user_healthieruser` WRITE;
/*!40000 ALTER TABLE `user_healthieruser` DISABLE KEYS */;
INSERT INTO `user_healthieruser` VALUES (8,'argon2$argon2i$v=19$m=512,t=2,p=2$YWxUN2t6cndHSmZD$QF2SUaHoCFBp4738HmM4ng','2018-02-05 06:55:27.815477','olamyy53@gmail.com','PRO','','','','','','','',0,0,1,0,1,1,0.00,'healthier_user_fn25fh34w5djua7k65iy','','','','',''),(9,'argon2$argon2i$v=19$m=512,t=2,p=2$ZGlQazZxSmxVMzlj$OrsoR9i1s/e+uewZ2RHt+Q','2018-02-05 06:54:24.492099','lekanmovearound@yahoo.com','','','','','','','','',1,1,1,0,1,1,0.00,'healthier_user_efvbfra6r3d56qi2pant','','','','','');
/*!40000 ALTER TABLE `user_healthieruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_healthieruser_groups`
--

DROP TABLE IF EXISTS `user_healthieruser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_healthieruser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `healthieruser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_healthieruser_groups_healthieruser_id_c98924a9_uniq` (`healthieruser_id`,`group_id`),
  KEY `user_healthieruser_groups_group_id_3b29988a_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_healthie_healthieruser_id_b3d0bf4d_fk_user_healthieruser_id` FOREIGN KEY (`healthieruser_id`) REFERENCES `user_healthieruser` (`id`),
  CONSTRAINT `user_healthieruser_groups_group_id_3b29988a_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_healthieruser_groups`
--

LOCK TABLES `user_healthieruser_groups` WRITE;
/*!40000 ALTER TABLE `user_healthieruser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_healthieruser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_healthieruser_user_permissions`
--

DROP TABLE IF EXISTS `user_healthieruser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_healthieruser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `healthieruser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_healthieruser_user_permissio_healthieruser_id_82f07c62_uniq` (`healthieruser_id`,`permission_id`),
  KEY `user_healthieruser__permission_id_c0074e20_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `user_healthie_healthieruser_id_0eac4742_fk_user_healthieruser_id` FOREIGN KEY (`healthieruser_id`) REFERENCES `user_healthieruser` (`id`),
  CONSTRAINT `user_healthieruser__permission_id_c0074e20_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_healthieruser_user_permissions`
--

LOCK TABLES `user_healthieruser_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_healthieruser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_healthieruser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_healthieruserailmentdata`
--

DROP TABLE IF EXISTS `user_healthieruserailmentdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_healthieruserailmentdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ailment_name` varchar(500) NOT NULL,
  `ailment_description` varchar(500) NOT NULL,
  `ailment_medication` varchar(500) NOT NULL,
  `healthier_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_healthi_healthier_user_id_73ddb75a_fk_user_healthieruser_id` (`healthier_user_id`),
  CONSTRAINT `user_healthi_healthier_user_id_73ddb75a_fk_user_healthieruser_id` FOREIGN KEY (`healthier_user_id`) REFERENCES `user_healthieruser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_healthieruserailmentdata`
--

LOCK TABLES `user_healthieruserailmentdata` WRITE;
/*!40000 ALTER TABLE `user_healthieruserailmentdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_healthieruserailmentdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_healthieruserblooddata`
--

DROP TABLE IF EXISTS `user_healthieruserblooddata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_healthieruserblooddata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_blood` varchar(50) NOT NULL,
  `dia_blood` varchar(50) NOT NULL,
  `random_blood` varchar(50) NOT NULL,
  `fasting_blood` varchar(50) NOT NULL,
  `healthier_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_healthi_healthier_user_id_76fbb75e_fk_user_healthieruser_id` (`healthier_user_id`),
  CONSTRAINT `user_healthi_healthier_user_id_76fbb75e_fk_user_healthieruser_id` FOREIGN KEY (`healthier_user_id`) REFERENCES `user_healthieruser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_healthieruserblooddata`
--

LOCK TABLES `user_healthieruserblooddata` WRITE;
/*!40000 ALTER TABLE `user_healthieruserblooddata` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_healthieruserblooddata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_healthieruserclinicaldata`
--

DROP TABLE IF EXISTS `user_healthieruserclinicaldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_healthieruserclinicaldata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clinic_name` varchar(500) NOT NULL,
  `clinic_address` varchar(500) NOT NULL,
  `clinic_email` varchar(500) NOT NULL,
  `healthier_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_healthi_healthier_user_id_593ae15d_fk_user_healthieruser_id` (`healthier_user_id`),
  CONSTRAINT `user_healthi_healthier_user_id_593ae15d_fk_user_healthieruser_id` FOREIGN KEY (`healthier_user_id`) REFERENCES `user_healthieruser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_healthieruserclinicaldata`
--

LOCK TABLES `user_healthieruserclinicaldata` WRITE;
/*!40000 ALTER TABLE `user_healthieruserclinicaldata` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_healthieruserclinicaldata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_healthierusermiscdata`
--

DROP TABLE IF EXISTS `user_healthierusermiscdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_healthierusermiscdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_cholesterol` varchar(50) NOT NULL,
  `user_weight` varchar(50) NOT NULL,
  `healthier_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_healthi_healthier_user_id_f8a26b4f_fk_user_healthieruser_id` (`healthier_user_id`),
  CONSTRAINT `user_healthi_healthier_user_id_f8a26b4f_fk_user_healthieruser_id` FOREIGN KEY (`healthier_user_id`) REFERENCES `user_healthieruser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_healthierusermiscdata`
--

LOCK TABLES `user_healthierusermiscdata` WRITE;
/*!40000 ALTER TABLE `user_healthierusermiscdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_healthierusermiscdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_termsandcondition`
--

DROP TABLE IF EXISTS `user_termsandcondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_termsandcondition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` date NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_termsandcondition`
--

LOCK TABLES `user_termsandcondition` WRITE;
/*!40000 ALTER TABLE `user_termsandcondition` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_termsandcondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_testimonials`
--

DROP TABLE IF EXISTS `user_testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_testimonials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(300) NOT NULL,
  `testimonial` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_testimonials`
--

LOCK TABLES `user_testimonials` WRITE;
/*!40000 ALTER TABLE `user_testimonials` DISABLE KEYS */;
INSERT INTO `user_testimonials` VALUES (1,'2018-02-03 20:24:01.089971','2018-02-03 20:25:04.234451','Fatimah','I have numerous providers in different countries where I can seek for secondary opinion regarding my health. Kudos'),(2,'2018-02-03 20:24:25.112735','2018-02-03 20:24:49.869856','Kelvin','I like the fact that I can compare different service providers before I make crucial decisions regarding my well-being'),(3,'2018-02-03 20:24:38.174797','2018-02-03 20:24:38.175401','Deola','The Personal Health Manager has helped me track important healthcare numbers, but its most astonishing feature is being able to get healthcare services for my family members, for example I can buy necessary vaccines for my nephew.');
/*!40000 ALTER TABLE `user_testimonials` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-07 17:55:47
