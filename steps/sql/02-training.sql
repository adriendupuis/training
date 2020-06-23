-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: ezplatform_3beta6
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `ezbinaryfile`
--

DROP TABLE IF EXISTS `ezbinaryfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezbinaryfile` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `download_count` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `original_filename` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`contentobject_attribute_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezbinaryfile`
--

LOCK TABLES `ezbinaryfile` WRITE;
/*!40000 ALTER TABLE `ezbinaryfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezbinaryfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state`
--

DROP TABLE IF EXISTS `ezcobj_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_language_id` bigint(20) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `identifier` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `language_mask` bigint(20) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezcobj_state_identifier` (`group_id`,`identifier`),
  KEY `ezcobj_state_priority` (`priority`),
  KEY `ezcobj_state_lmask` (`language_mask`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state`
--

LOCK TABLES `ezcobj_state` WRITE;
/*!40000 ALTER TABLE `ezcobj_state` DISABLE KEYS */;
INSERT INTO `ezcobj_state` VALUES (1,2,2,'not_locked',3,0),(2,2,2,'locked',3,1);
/*!40000 ALTER TABLE `ezcobj_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state_group`
--

DROP TABLE IF EXISTS `ezcobj_state_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_language_id` bigint(20) NOT NULL DEFAULT '0',
  `identifier` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `language_mask` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezcobj_state_group_identifier` (`identifier`),
  KEY `ezcobj_state_group_lmask` (`language_mask`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state_group`
--

LOCK TABLES `ezcobj_state_group` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_group` DISABLE KEYS */;
INSERT INTO `ezcobj_state_group` VALUES (2,2,'ez_lock',3);
/*!40000 ALTER TABLE `ezcobj_state_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state_group_language`
--

DROP TABLE IF EXISTS `ezcobj_state_group_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state_group_language` (
  `contentobject_state_group_id` int(11) NOT NULL DEFAULT '0',
  `real_language_id` bigint(20) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `language_id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`contentobject_state_group_id`,`real_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state_group_language`
--

LOCK TABLES `ezcobj_state_group_language` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_group_language` DISABLE KEYS */;
INSERT INTO `ezcobj_state_group_language` VALUES (2,2,'',3,'Lock');
/*!40000 ALTER TABLE `ezcobj_state_group_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state_language`
--

DROP TABLE IF EXISTS `ezcobj_state_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state_language` (
  `contentobject_state_id` int(11) NOT NULL DEFAULT '0',
  `language_id` bigint(20) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`contentobject_state_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state_language`
--

LOCK TABLES `ezcobj_state_language` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_language` DISABLE KEYS */;
INSERT INTO `ezcobj_state_language` VALUES (1,3,'','Not locked'),(2,3,'','Locked');
/*!40000 ALTER TABLE `ezcobj_state_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state_link`
--

DROP TABLE IF EXISTS `ezcobj_state_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state_link` (
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_state_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contentobject_id`,`contentobject_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state_link`
--

LOCK TABLES `ezcobj_state_link` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_link` DISABLE KEYS */;
INSERT INTO `ezcobj_state_link` VALUES (1,1),(4,1),(10,1),(11,1),(12,1),(13,1),(14,1),(41,1),(42,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1);
/*!40000 ALTER TABLE `ezcobj_state_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontent_language`
--

DROP TABLE IF EXISTS `ezcontent_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontent_language` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `disabled` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ezcontent_language_name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontent_language`
--

LOCK TABLES `ezcontent_language` WRITE;
/*!40000 ALTER TABLE `ezcontent_language` DISABLE KEYS */;
INSERT INTO `ezcontent_language` VALUES (2,0,'eng-GB','English (United Kingdom)');
/*!40000 ALTER TABLE `ezcontent_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentbrowsebookmark`
--

DROP TABLE IF EXISTS `ezcontentbrowsebookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentbrowsebookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ezcontentbrowsebookmark_location` (`node_id`),
  KEY `ezcontentbrowsebookmark_user` (`user_id`),
  KEY `ezcontentbrowsebookmark_user_location` (`user_id`,`node_id`),
  CONSTRAINT `ezcontentbrowsebookmark_location_fk` FOREIGN KEY (`node_id`) REFERENCES `ezcontentobject_tree` (`node_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ezcontentbrowsebookmark_user_fk` FOREIGN KEY (`user_id`) REFERENCES `ezuser` (`contentobject_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentbrowsebookmark`
--

LOCK TABLES `ezcontentbrowsebookmark` WRITE;
/*!40000 ALTER TABLE `ezcontentbrowsebookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcontentbrowsebookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass`
--

DROP TABLE IF EXISTS `ezcontentclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL DEFAULT '0',
  `always_available` int(11) NOT NULL DEFAULT '0',
  `contentobject_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `identifier` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `initial_language_id` bigint(20) NOT NULL DEFAULT '0',
  `is_container` int(11) NOT NULL DEFAULT '0',
  `language_mask` bigint(20) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `modifier_id` int(11) NOT NULL DEFAULT '0',
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `serialized_description_list` longtext COLLATE utf8mb4_unicode_520_ci,
  `serialized_name_list` longtext COLLATE utf8mb4_unicode_520_ci,
  `sort_field` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '1',
  `url_alias_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`version`),
  KEY `ezcontentclass_version` (`version`),
  KEY `ezcontentclass_identifier` (`identifier`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass`
--

LOCK TABLES `ezcontentclass` WRITE;
/*!40000 ALTER TABLE `ezcontentclass` DISABLE KEYS */;
INSERT INTO `ezcontentclass` VALUES (1,0,1,'<short_name|name>',1024392098,14,'folder',2,1,2,1448831672,14,'a3d405b81be900468eb153d774f4f0d2','a:0:{}','a:1:{s:6:\"eng-GB\";s:6:\"Folder\";}',1,1,NULL),(2,0,0,'<short_title|title>',1024392098,14,'article',2,1,3,1082454989,14,'c15b600eb9198b1924063b5a68758232',NULL,'a:2:{s:6:\"eng-GB\";s:7:\"Article\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL),(3,0,1,'<name>',1024392098,14,'user_group',2,1,3,1048494743,14,'25b4268cdcd01921b808a0d854b877ef',NULL,'a:2:{s:6:\"eng-GB\";s:10:\"User group\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL),(4,0,1,'<first_name> <last_name>',1024392098,14,'user',2,0,3,1082018364,14,'40faa822edc579b02c25f6bb7beec3ad',NULL,'a:2:{s:6:\"eng-GB\";s:4:\"User\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL),(5,0,1,'<name>',1031484992,14,'image',2,0,3,1048494784,14,'f6df12aa74e36230eb675f364fccd25a',NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL),(12,0,1,'<name>',1052385472,14,'file',2,0,3,1052385669,14,'637d58bfddf164627bdfd265733280a0',NULL,'a:2:{s:6:\"eng-GB\";s:4:\"File\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL),(42,0,1,'<name>',1435924826,14,'landing_page',2,1,2,1435924826,14,'60c03e9758465eb69d56b3afb6adf18e','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:12:\"Landing page\";}',2,0,''),(43,0,1,'<title>',1537166773,14,'form',2,0,2,1537166834,14,'6f7f21df775a33c1e4bbc76b48c38476','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Form\";}',2,0,''),(44,0,1,'<title>',1584827632,14,'bike_ride',2,0,2,1584827919,14,'a190c7f7a38e48be7825c9def314257f','a:0:{}','a:1:{s:6:\"eng-GB\";s:9:\"Bike Ride\";}',2,0,''),(45,0,1,'<title>',1584827956,14,'point_of_interest',2,0,2,1584828127,14,'8fa9ac4293c13aaeb877191d45d41468','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Point of Interest\";}',2,0,'');
/*!40000 ALTER TABLE `ezcontentclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass_attribute`
--

DROP TABLE IF EXISTS `ezcontentclass_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL DEFAULT '0',
  `can_translate` int(11) DEFAULT '1',
  `category` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `data_float1` double DEFAULT NULL,
  `data_float2` double DEFAULT NULL,
  `data_float3` double DEFAULT NULL,
  `data_float4` double DEFAULT NULL,
  `data_int1` int(11) DEFAULT NULL,
  `data_int2` int(11) DEFAULT NULL,
  `data_int3` int(11) DEFAULT NULL,
  `data_int4` int(11) DEFAULT NULL,
  `data_text1` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_text2` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_text3` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_text4` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_text5` longtext COLLATE utf8mb4_unicode_520_ci,
  `data_type_string` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `identifier` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `is_information_collector` int(11) NOT NULL DEFAULT '0',
  `is_required` int(11) NOT NULL DEFAULT '0',
  `is_searchable` int(11) NOT NULL DEFAULT '0',
  `is_thumbnail` tinyint(1) NOT NULL DEFAULT '0',
  `placement` int(11) NOT NULL DEFAULT '0',
  `serialized_data_text` longtext COLLATE utf8mb4_unicode_520_ci,
  `serialized_description_list` longtext COLLATE utf8mb4_unicode_520_ci,
  `serialized_name_list` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`,`version`),
  KEY `ezcontentclass_attr_ccid` (`contentclass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass_attribute`
--

LOCK TABLES `ezcontentclass_attribute` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_attribute` DISABLE KEYS */;
INSERT INTO `ezcontentclass_attribute` VALUES (1,0,1,'',2,0,0,0,0,255,0,0,0,'New article','','','','','ezstring','title',0,1,1,0,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Title\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(4,0,1,'',1,NULL,NULL,NULL,NULL,255,0,NULL,NULL,'Folder',NULL,NULL,NULL,NULL,'ezstring','name',0,1,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}'),(6,0,1,'',3,0,0,0,0,255,0,0,0,'','','','',NULL,'ezstring','name',0,1,1,0,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Name\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(7,0,1,'',3,0,0,0,0,255,0,0,0,'','','','',NULL,'ezstring','description',0,0,1,0,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:11:\"Description\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(8,0,1,'',4,0,0,0,0,255,0,0,0,'','','','','','ezstring','first_name',0,1,1,0,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:10:\"First name\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(9,0,1,'',4,0,0,0,0,255,0,0,0,'','','','','','ezstring','last_name',0,1,1,0,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:9:\"Last name\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(12,0,0,'',4,0,0,0,0,7,10,0,0,'','','','','','ezuser','user_account',0,1,0,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:12:\"User account\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(116,0,1,'',5,0,0,0,0,150,0,0,0,'','','','',NULL,'ezstring','name',0,1,1,0,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Name\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(117,0,1,'',5,0,0,0,0,10,0,0,0,'','','','',NULL,'ezrichtext','caption',0,0,1,0,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:7:\"Caption\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(118,0,1,'',5,0,0,0,0,10,0,0,0,'','','','',NULL,'ezimage','image',0,0,0,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(119,0,1,'',1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','short_description',0,0,1,0,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Short description\";}'),(120,0,1,'',2,0,0,0,0,10,0,0,0,'','','','','','ezrichtext','intro',0,1,1,0,4,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Intro\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(121,0,1,'',2,0,0,0,0,20,0,0,0,'','','','','','ezrichtext','body',0,0,1,0,5,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Body\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(123,0,0,'',2,0,0,0,0,0,0,0,0,'','','','','','ezboolean','enable_comments',0,0,0,0,6,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:15:\"Enable comments\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(146,0,1,'',12,0,0,0,0,0,0,0,0,'New file','','','',NULL,'ezstring','name',0,1,1,0,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Name\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(147,0,1,'',12,0,0,0,0,10,0,0,0,'','','','',NULL,'ezrichtext','description',0,0,1,0,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:11:\"Description\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(148,0,1,'',12,0,0,0,0,0,0,0,0,'','','','',NULL,'ezbinaryfile','file',0,1,0,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"File\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(152,0,1,'',2,0,0,0,0,255,0,0,0,'','','','','','ezstring','short_title',0,0,1,0,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:11:\"Short title\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(153,0,1,'',2,0,0,0,0,1,0,0,0,'','','','','','ezauthor','author',0,0,0,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:6:\"Author\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(154,0,1,'',2,0,0,0,0,0,0,0,0,'','','','','','ezobjectrelation','image',0,0,1,0,7,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(155,0,1,'',1,NULL,NULL,NULL,NULL,100,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','short_name',0,0,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:10:\"Short name\";}'),(156,0,1,'',1,NULL,NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','description',0,0,1,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}'),(179,0,1,'',4,0,0,0,0,10,0,0,0,'','','','','','eztext','signature',0,0,1,0,4,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:9:\"Signature\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(180,0,1,'',4,0,0,0,0,10,0,0,0,'','','','','','ezimage','image',0,0,0,0,5,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(185,0,1,'content',42,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','name',0,1,1,0,10,'N;','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(186,0,1,'content',42,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','description',0,1,1,0,20,'N;','a:1:{s:6:\"eng-GB\";s:24:\"Landing page description\";}','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}'),(187,0,1,'content',42,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezlandingpage','page',0,0,0,0,30,'N;','a:1:{s:6:\"eng-GB\";s:12:\"Landing page\";}','a:1:{s:6:\"eng-GB\";s:12:\"Landing page\";}'),(188,0,1,'content',43,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','title',0,1,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(189,0,1,'content',43,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezform','form',0,0,0,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Form\";}'),(190,0,1,'content',44,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','title',0,1,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(191,0,1,'content',44,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezimage','photo',0,0,0,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Photo\";}'),(192,0,1,'content',44,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','description',0,0,1,0,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}'),(193,0,1,'content',44,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezselection><options><option id=\"0\" name=\"Beginner\"/><option id=\"1\" name=\"Intermediate\"/><option id=\"2\" name=\"Advanced\"/></options></ezselection>\n','ezselection','difficulty',0,0,1,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:10:\"Difficulty\";}'),(194,0,1,'content',44,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezgmaplocation','starting_point',0,0,1,0,5,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:14:\"Starting Point\";}'),(195,0,1,'content',44,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezgmaplocation','ending_point',0,0,1,0,6,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:12:\"Ending Point\";}'),(196,0,1,'content',44,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'ezinteger','length',0,0,1,0,7,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:6:\"length\";}'),(197,0,1,'content',44,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezauthor','author',0,0,1,0,8,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:6:\"Author\";}'),(198,0,1,'content',45,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','title',0,0,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(199,0,1,'content',45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','description',0,0,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}'),(200,0,1,'content',45,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezimage','photo',0,0,0,0,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Photo\";}'),(201,0,1,'content',45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','photo_legend',0,0,1,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:12:\"Photo legend\";}'),(202,0,1,'content',45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezgmaplocation','place',0,0,1,0,5,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Place\";}');
/*!40000 ALTER TABLE `ezcontentclass_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass_attribute_ml`
--

DROP TABLE IF EXISTS `ezcontentclass_attribute_ml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass_attribute_ml` (
  `contentclass_attribute_id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `language_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `data_text` text COLLATE utf8mb4_unicode_520_ci,
  `data_json` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`contentclass_attribute_id`,`version`,`language_id`),
  KEY `ezcontentclass_attribute_ml_lang_fk` (`language_id`),
  CONSTRAINT `ezcontentclass_attribute_ml_lang_fk` FOREIGN KEY (`language_id`) REFERENCES `ezcontent_language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass_attribute_ml`
--

LOCK TABLES `ezcontentclass_attribute_ml` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_attribute_ml` DISABLE KEYS */;
INSERT INTO `ezcontentclass_attribute_ml` VALUES (190,0,2,'Title',NULL,NULL,NULL),(191,0,2,'Photo',NULL,NULL,NULL),(192,0,2,'Description',NULL,NULL,NULL),(193,0,2,'Difficulty',NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezselection><options><option id=\"0\" name=\"Beginner\"/><option id=\"1\" name=\"Intermediate\"/><option id=\"2\" name=\"Advanced\"/></options></ezselection>\n',NULL),(194,0,2,'Starting Point',NULL,NULL,NULL),(195,0,2,'Ending Point',NULL,NULL,NULL),(196,0,2,'length',NULL,NULL,NULL),(197,0,2,'Author',NULL,NULL,NULL),(198,0,2,'Title',NULL,NULL,NULL),(199,0,2,'Description',NULL,NULL,NULL),(200,0,2,'Photo',NULL,NULL,NULL),(201,0,2,'Photo legend',NULL,NULL,NULL),(202,0,2,'Place',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ezcontentclass_attribute_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass_classgroup`
--

DROP TABLE IF EXISTS `ezcontentclass_classgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass_classgroup` (
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `contentclass_version` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `group_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`contentclass_id`,`contentclass_version`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass_classgroup`
--

LOCK TABLES `ezcontentclass_classgroup` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_classgroup` DISABLE KEYS */;
INSERT INTO `ezcontentclass_classgroup` VALUES (1,0,1,'Content'),(2,0,1,'Content'),(3,0,2,'Users'),(4,0,2,'Users'),(5,0,3,'Media'),(12,0,3,'Media'),(42,0,1,'Content'),(43,0,1,'Content'),(44,0,1,'Content'),(45,0,1,'Content');
/*!40000 ALTER TABLE `ezcontentclass_classgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass_name`
--

DROP TABLE IF EXISTS `ezcontentclass_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass_name` (
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `contentclass_version` int(11) NOT NULL DEFAULT '0',
  `language_id` bigint(20) NOT NULL DEFAULT '0',
  `language_locale` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`contentclass_id`,`contentclass_version`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass_name`
--

LOCK TABLES `ezcontentclass_name` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_name` DISABLE KEYS */;
INSERT INTO `ezcontentclass_name` VALUES (1,0,2,'eng-GB','Folder'),(2,0,3,'eng-GB','Article'),(3,0,3,'eng-GB','User group'),(4,0,3,'eng-GB','User'),(5,0,3,'eng-GB','Image'),(12,0,3,'eng-GB','File'),(42,0,2,'eng-GB','Landing page'),(43,0,2,'eng-GB','Form'),(44,0,2,'eng-GB','Bike Ride'),(45,0,2,'eng-GB','Point of Interest');
/*!40000 ALTER TABLE `ezcontentclass_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclassgroup`
--

DROP TABLE IF EXISTS `ezcontentclassgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclassgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `modifier_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclassgroup`
--

LOCK TABLES `ezcontentclassgroup` WRITE;
/*!40000 ALTER TABLE `ezcontentclassgroup` DISABLE KEYS */;
INSERT INTO `ezcontentclassgroup` VALUES (1,1031216928,14,1033922106,14,'Content'),(2,1031216941,14,1033922113,14,'Users'),(3,1032009743,14,1033922120,14,'Media');
/*!40000 ALTER TABLE `ezcontentclassgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject`
--

DROP TABLE IF EXISTS `ezcontentobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `current_version` int(11) DEFAULT NULL,
  `initial_language_id` bigint(20) NOT NULL DEFAULT '0',
  `language_mask` bigint(20) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `published` int(11) NOT NULL DEFAULT '0',
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `section_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezcontentobject_remote_id` (`remote_id`),
  KEY `ezcontentobject_classid` (`contentclass_id`),
  KEY `ezcontentobject_lmask` (`language_mask`),
  KEY `ezcontentobject_pub` (`published`),
  KEY `ezcontentobject_section` (`section_id`),
  KEY `ezcontentobject_currentversion` (`current_version`),
  KEY `ezcontentobject_owner` (`owner_id`),
  KEY `ezcontentobject_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject`
--

LOCK TABLES `ezcontentobject` WRITE;
/*!40000 ALTER TABLE `ezcontentobject` DISABLE KEYS */;
INSERT INTO `ezcontentobject` VALUES (1,1,9,2,3,1448889046,'eZ Platform',14,1448889046,'9459d3c29e15006e45197295722c7ade',1,1,0),(4,3,1,2,3,1033917596,'Users',14,1033917596,'f5c88a2209584891056f987fd965b0ba',2,1,0),(10,4,2,2,3,1072180405,'Anonymous User',14,1033920665,'faaeb9be3bd98ed09f606fc16d144eca',2,1,0),(11,3,1,2,3,1033920746,'Guest accounts',14,1033920746,'5f7f0bdb3381d6a461d8c29ff53d908f',2,1,0),(12,3,1,2,3,1033920775,'Administrator users',14,1033920775,'9b47a45624b023b1a76c73b74d704acf',2,1,0),(13,3,1,2,3,1033920794,'Editors',14,1033920794,'3c160cca19fb135f83bd02d911f04db2',2,1,0),(14,4,3,2,3,1301062024,'Administrator User',14,1033920830,'1bb4fe25487f05527efa8bfd394cecc7',2,1,0),(41,1,1,2,3,1060695457,'Media',14,1060695457,'a6e35cbcb7cd6ae4b691f3eee30cd262',3,1,0),(42,3,1,2,3,1072180330,'Anonymous Users',14,1072180330,'15b256dbea2ae72418ff5facc999e8f9',2,1,0),(49,1,1,2,3,1080220197,'Images',14,1080220197,'e7ff633c6b8e0fd3531e74c6e712bead',3,1,0),(50,1,1,2,3,1080220220,'Files',14,1080220220,'732a5acd01b51a6fe6eab448ad4138a9',3,1,0),(51,1,1,2,3,1080220233,'Multimedia',14,1080220233,'09082deb98662a104f325aaa8c4933d3',3,1,0),(52,42,1,2,3,1442481743,'Home',14,1442481743,'34720ff636e1d4ce512f762dc638e4ac',1,1,0),(53,1,1,2,3,1486473151,'Form Uploads',14,1486473151,'6797ab09a3e84316f09c4ccabce90e2d',3,1,0),(54,1,1,2,2,1537166893,'Forms',14,1537166893,'9e863fbb0fb835ce050032b4f00de61d',6,1,0),(55,1,1,2,3,1584828302,'All Rides',14,1584828302,'c10243e9ce31f7fe5058ea7172561970',1,1,0),(57,44,1,2,3,1584829510,'Finnish coastline from Rauma to Pori',14,1584829510,'6dd5d810be0271496faf5b98e7e2fae1',1,1,0),(58,44,2,2,3,1584839674,'Baby tour of the Battenkill',14,1584829584,'8e04d773220974c7ed3f8e99b618c099',1,1,0),(59,44,2,2,3,1584839712,'Meillonnas terrain track',14,1584829676,'f3e33d3e66b167e68b5b0fc18aeca6ab',1,1,0),(60,44,2,2,3,1584839729,'Rallarvegen in Norway',14,1584829744,'4ac8ea1ebed449c38eca441c4c1620d9',1,1,0),(61,44,2,2,3,1584839696,'Lookouts between Coligny and Montagna-le-Reconduit',14,1584829820,'75255916a9d286d07b861f638ac9b602',1,1,0),(62,1,1,2,3,1584829873,'Points of Interest',14,1584829873,'9baa4d660c4b99a8ec1e06d58c097423',1,1,0),(63,45,2,2,3,1584839768,'Plateau de Vergongeat',14,1584829932,'ae813f070dedb0b3a944dac5685b0064',1,1,0),(64,45,2,2,3,1584839750,'Cross above Tarcia',14,1584829991,'a27b583071d1b0fb31f3fd0a7a1d4571',1,1,0);
/*!40000 ALTER TABLE `ezcontentobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_attribute`
--

DROP TABLE IF EXISTS `ezcontentobject_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL DEFAULT '0',
  `attribute_original_id` int(11) DEFAULT '0',
  `contentclassattribute_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `data_float` double DEFAULT NULL,
  `data_int` int(11) DEFAULT NULL,
  `data_text` longtext COLLATE utf8mb4_unicode_520_ci,
  `data_type_string` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `language_code` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `language_id` bigint(20) NOT NULL DEFAULT '0',
  `sort_key_int` int(11) NOT NULL DEFAULT '0',
  `sort_key_string` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`version`),
  KEY `ezcontentobject_attribute_co_id_ver_lang_code` (`contentobject_id`,`version`,`language_code`),
  KEY `ezcontentobject_classattr_id` (`contentclassattribute_id`),
  KEY `sort_key_string` (`sort_key_string`(191)),
  KEY `ezcontentobject_attribute_language_code` (`language_code`),
  KEY `sort_key_int` (`sort_key_int`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_attribute`
--

LOCK TABLES `ezcontentobject_attribute` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_attribute` DISABLE KEYS */;
INSERT INTO `ezcontentobject_attribute` VALUES (1,9,0,4,1,NULL,NULL,'Welcome to eZ Platform','ezstring','eng-GB',3,0,'welcome to ez platform'),(2,9,0,119,1,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>This is the clean install coming with eZ Platform. It’s a barebone setup of the platform, an excellent foundation to build upon if you want to build from scratch. For more ready to go base designs or demo sites, please check the documentation.</para></section>\n','ezrichtext','eng-GB',3,0,''),(7,1,0,7,4,NULL,NULL,'Main group','ezstring','eng-GB',3,0,''),(8,1,0,6,4,NULL,NULL,'Users','ezstring','eng-GB',3,0,''),(19,2,0,8,10,0,0,'Anonymous','ezstring','eng-GB',3,0,'anonymous'),(20,2,0,9,10,0,0,'User','ezstring','eng-GB',3,0,'user'),(21,2,0,12,10,0,0,'','ezuser','eng-GB',3,0,''),(22,1,0,6,11,0,0,'Guest accounts','ezstring','eng-GB',3,0,''),(23,1,0,7,11,0,0,'','ezstring','eng-GB',3,0,''),(24,1,0,6,12,0,0,'Administrator users','ezstring','eng-GB',3,0,''),(25,1,0,7,12,0,0,'','ezstring','eng-GB',3,0,''),(26,1,0,6,13,0,0,'Editors','ezstring','eng-GB',3,0,''),(27,1,0,7,13,0,0,'','ezstring','eng-GB',3,0,''),(28,3,0,8,14,0,0,'Administrator','ezstring','eng-GB',3,0,'administrator'),(29,3,0,9,14,0,0,'User','ezstring','eng-GB',3,0,'user'),(30,3,30,12,14,0,0,'','ezuser','eng-GB',3,0,''),(98,1,0,4,41,0,0,'Media','ezstring','eng-GB',3,0,''),(99,1,0,119,41,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(100,1,0,6,42,0,0,'Anonymous Users','ezstring','eng-GB',3,0,'anonymous users'),(101,1,0,7,42,0,0,'User group for the anonymous user','ezstring','eng-GB',3,0,'user group for the anonymous user'),(102,9,0,155,1,NULL,NULL,'eZ Platform','ezstring','eng-GB',3,0,'ez platform'),(103,1,0,155,41,0,0,'','ezstring','eng-GB',3,0,''),(104,9,0,156,1,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><title ezxhtml:level=\"2\">Welcome to eZ Platform</title><para>Congratulations, you just installed eZ Platform. eZ Platform is the new generation Content Management Platform from eZ Systems and the eZ Community replacing eZ Publish, our previous software.</para><title ezxhtml:level=\"3\">Need some guidance?</title><para>Check out the following resources:</para><title ezxhtml:level=\"4\"><link xlink:href=\"ezurl://23\" xlink:show=\"none\">User Manual</link> for eZ Platform (and eZ Studio)</title><title ezxhtml:level=\"4\"><link xlink:href=\"ezurl://24\" xlink:show=\"none\">Technical doc</link> for eZ Platform</title><title ezxhtml:level=\"4\"><link xlink:href=\"ezurl://25\" xlink:show=\"none\">eZ Platform</link> developer tutorial</title><title ezxhtml:level=\"4\"><link xlink:href=\"ezurl://26\" xlink:show=\"none\">Comparison guide</link> between eZ Platform and eZ Publish Platform</title><title ezxhtml:level=\"3\">Contribute to the project?</title><para>Join the community:</para><title ezxhtml:level=\"4\"><link xlink:href=\"ezurl://27\" xlink:show=\"none\">Github repositories</link> open to the public</title><title ezxhtml:level=\"4\">Register to the community on <link xlink:href=\"ezurl://28\" xlink:show=\"none\">discuss.ezplatform.com</link>, the community site, to access forums, tutorials and blogs</title><title ezxhtml:level=\"4\">Join the conversation on <link xlink:href=\"ezurl://29\" xlink:show=\"none\">the eZ Community Slack</link></title><para>Good luck!</para></section>\n','ezrichtext','eng-GB',3,0,''),(105,1,0,156,41,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(142,1,0,4,49,0,0,'Images','ezstring','eng-GB',3,0,'images'),(143,1,0,155,49,0,0,'','ezstring','eng-GB',3,0,''),(144,1,0,119,49,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(145,1,0,156,49,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(147,1,0,4,50,0,0,'Files','ezstring','eng-GB',3,0,'files'),(148,1,0,155,50,0,0,'','ezstring','eng-GB',3,0,''),(149,1,0,119,50,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(150,1,0,156,50,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(152,1,0,4,51,0,0,'Multimedia','ezstring','eng-GB',3,0,'multimedia'),(153,1,0,155,51,0,0,'','ezstring','eng-GB',3,0,''),(154,1,0,119,51,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(155,1,0,156,51,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(177,2,0,179,10,0,0,'','eztext','eng-GB',3,0,''),(178,3,0,179,14,0,0,'','eztext','eng-GB',3,0,''),(179,2,0,180,10,0,0,'','ezimage','eng-GB',3,0,''),(180,3,0,180,14,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"\" filename=\"\" suffix=\"\" basename=\"\" dirpath=\"\" url=\"\" original_filename=\"\" mime_type=\"\" width=\"\" height=\"\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1301057722\"><original attribute_id=\"180\" attribute_version=\"3\" attribute_language=\"eng-GB\"/></ezimage>\n','ezimage','eng-GB',3,0,''),(242,1,0,185,52,NULL,NULL,'Home','ezstring','eng-GB',3,0,'home'),(243,1,0,186,52,NULL,NULL,'Home Page','ezstring','eng-GB',3,0,'home page'),(244,1,0,187,52,NULL,NULL,NULL,'ezlandingpage','eng-GB',3,0,'home page'),(245,1,0,4,53,NULL,NULL,'Form Uploads','ezstring','eng-GB',3,0,'form uploads'),(246,1,0,155,53,NULL,NULL,'form uploads','ezstring','eng-GB',3,0,'form uploads'),(247,1,0,119,53,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>Folder for file uploads</para></section>\n','ezrichtext','eng-GB',3,0,''),(248,1,0,156,53,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(249,1,0,4,54,NULL,NULL,'Forms','ezstring','eng-GB',2,0,'forms'),(250,1,0,155,54,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(251,1,0,119,54,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',2,0,''),(252,1,0,156,54,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',2,0,''),(253,1,0,4,55,NULL,NULL,'All Rides','ezstring','eng-GB',3,0,'all rides'),(254,1,0,155,55,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(255,1,0,119,55,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(256,1,0,156,55,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(262,1,0,190,57,NULL,NULL,'Finnish coastline from Rauma to Pori','ezstring','eng-GB',3,0,'finnish coastline from rauma to pori'),(263,1,0,191,57,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"saaristo.jpg\"\n    suffix=\"jpg\" basename=\"saaristo\" dirpath=\"var/site/storage/images/3/6/2/0/263-1-eng-GB\" url=\"var/site/storage/images/3/6/2/0/263-1-eng-GB/saaristo.jpg\"\n    original_filename=\"saaristo.jpg\" mime_type=\"image/jpeg\" width=\"600\"\n    height=\"450\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1584829510\">\n  <original attribute_id=\"263\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"450\" Width=\"600\" IsColor=\"1\"/>\n</ezimage>','ezimage','eng-GB',3,0,''),(264,1,0,192,57,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(265,1,0,193,57,NULL,NULL,'0','ezselection','eng-GB',3,0,'0'),(266,1,0,194,57,NULL,1,'','ezgmaplocation','eng-GB',3,0,'rauma, finland'),(267,1,0,195,57,NULL,1,'','ezgmaplocation','eng-GB',3,0,'pori, finland'),(268,1,0,196,57,NULL,54,NULL,'ezinteger','eng-GB',3,54,''),(269,1,0,197,57,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezauthor><authors><author id=\"1\" name=\"Jan Doe\" email=\"jandoe@example.com\"/></authors></ezauthor>\n','ezauthor','eng-GB',3,0,'jan doe'),(270,1,0,190,58,NULL,NULL,'Baby tour of the Battenkill','ezstring','eng-GB',3,0,'baby tour of the battenkill'),(270,2,0,190,58,NULL,NULL,'Baby tour of the Battenkill','ezstring','eng-GB',3,0,'baby tour of the battenkill'),(271,1,0,191,58,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"battenkill.jpg\"\n    suffix=\"jpg\" basename=\"battenkill\" dirpath=\"var/site/storage/images/1/7/2/0/271-1-eng-GB\" url=\"var/site/storage/images/1/7/2/0/271-1-eng-GB/battenkill.jpg\"\n    original_filename=\"battenkill.jpg\" mime_type=\"image/jpeg\" width=\"500\"\n    height=\"375\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1584829584\">\n  <original attribute_id=\"271\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"375\" Width=\"500\" IsColor=\"1\"/>\n</ezimage>','ezimage','eng-GB',3,0,''),(271,2,0,191,58,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"battenkill.jpg\"\n    suffix=\"jpg\" basename=\"battenkill\" dirpath=\"var/site/storage/images/1/7/2/0/271-1-eng-GB\" url=\"var/site/storage/images/1/7/2/0/271-1-eng-GB/battenkill.jpg\"\n    original_filename=\"battenkill.jpg\" mime_type=\"image/jpeg\" width=\"500\"\n    height=\"375\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1584839674\">\n  <original attribute_id=\"271\" attribute_version=\"2\" attribute_language=\"eng-GB\"/>\n  <information Height=\"375\" Width=\"500\" IsColor=\"1\"/>\n</ezimage>','ezimage','eng-GB',3,0,''),(272,1,0,192,58,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>&lt;!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}--&gt;﻿Following on the route of the Battenkill, starting from Schueylerville and ending in Shushan this ride offers breathtaking views.</para></section>\n','ezrichtext','eng-GB',3,0,'<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->﻿Following on the route of the Battenkill, starting from Schueylerville and ending in Shushan this ride offers breathtaking views.'),(272,2,0,192,58,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>Following on the route of the Battenkill, starting from Schueylerville and ending in Shushan this ride offers breathtaking views.</para></section>\n','ezrichtext','eng-GB',3,0,'Following on the route of the Battenkill, starting from Schueylerville and ending in Shushan this ride offers breathtaking views.'),(273,1,0,193,58,NULL,NULL,'1','ezselection','eng-GB',3,0,'1'),(273,2,0,193,58,NULL,NULL,'1','ezselection','eng-GB',3,0,'1'),(274,1,0,194,58,NULL,1,'','ezgmaplocation','eng-GB',3,0,'schuylerville, ny, usa'),(274,2,0,194,58,NULL,1,'','ezgmaplocation','eng-GB',3,0,'schuylerville, ny, usa'),(275,1,0,195,58,NULL,1,'','ezgmaplocation','eng-GB',3,0,'shushan, ny, usa'),(275,2,0,195,58,NULL,1,'','ezgmaplocation','eng-GB',3,0,'shushan, ny, usa'),(276,1,0,196,58,NULL,37,NULL,'ezinteger','eng-GB',3,37,''),(276,2,0,196,58,NULL,37,NULL,'ezinteger','eng-GB',3,37,''),(277,1,0,197,58,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezauthor><authors><author id=\"1\" name=\"Jedi Doe\" email=\"jedidoe@example.com\"/></authors></ezauthor>\n','ezauthor','eng-GB',3,0,'jedi doe'),(277,2,0,197,58,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezauthor><authors><author id=\"1\" name=\"Jedi Doe\" email=\"jedidoe@example.com\"/></authors></ezauthor>\n','ezauthor','eng-GB',3,0,'jedi doe'),(278,1,0,190,59,NULL,NULL,'Meillonnas terrain track','ezstring','eng-GB',3,0,'meillonnas terrain track'),(278,2,0,190,59,NULL,NULL,'Meillonnas terrain track','ezstring','eng-GB',3,0,'meillonnas terrain track'),(279,1,0,191,59,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"cabatane_full.jpg\"\n    suffix=\"jpg\" basename=\"cabatane_full\" dirpath=\"var/site/storage/images/9/7/2/0/279-1-eng-GB\" url=\"var/site/storage/images/9/7/2/0/279-1-eng-GB/cabatane_full.jpg\"\n    original_filename=\"cabatane_full.jpg\" mime_type=\"image/jpeg\" width=\"760\"\n    height=\"760\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1584829676\">\n  <original attribute_id=\"279\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"760\" Width=\"760\" IsColor=\"1\"/>\n</ezimage>','ezimage','eng-GB',3,0,''),(279,2,0,191,59,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"cabatane_full.jpg\"\n    suffix=\"jpg\" basename=\"cabatane_full\" dirpath=\"var/site/storage/images/9/7/2/0/279-1-eng-GB\" url=\"var/site/storage/images/9/7/2/0/279-1-eng-GB/cabatane_full.jpg\"\n    original_filename=\"cabatane_full.jpg\" mime_type=\"image/jpeg\" width=\"760\"\n    height=\"760\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1584839712\">\n  <original attribute_id=\"279\" attribute_version=\"2\" attribute_language=\"eng-GB\"/>\n  <information Height=\"760\" Width=\"760\" IsColor=\"1\"/>\n</ezimage>','ezimage','eng-GB',3,0,''),(280,1,0,192,59,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>&lt;!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}--&gt;﻿This ride in the hills offers variety and spectacular scenery. Recommended for those seeking both a challenge and an opportunity to enjoy the views.</para></section>\n','ezrichtext','eng-GB',3,0,'<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->﻿This ride in the hills offers variety and spectacular scenery. Recommended for those seeking both a challenge and an opportunity to enjoy the views.'),(280,2,0,192,59,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>This ride in the hills offers variety and spectacular scenery. Recommended for those seeking both a challenge and an opportunity to enjoy the views.</para></section>\n','ezrichtext','eng-GB',3,0,'This ride in the hills offers variety and spectacular scenery. Recommended for those seeking both a challenge and an opportunity to enjoy the views.'),(281,1,0,193,59,NULL,NULL,'2','ezselection','eng-GB',3,0,'2'),(281,2,0,193,59,NULL,NULL,'2','ezselection','eng-GB',3,0,'2'),(282,1,0,194,59,NULL,1,'','ezgmaplocation','eng-GB',3,0,'meillonnas, france'),(282,2,0,194,59,NULL,1,'','ezgmaplocation','eng-GB',3,0,'meillonnas, france'),(283,1,0,195,59,NULL,1,'','ezgmaplocation','eng-GB',3,0,'pressiat, france'),(283,2,0,195,59,NULL,1,'','ezgmaplocation','eng-GB',3,0,'pressiat, france'),(284,1,0,196,59,NULL,18,NULL,'ezinteger','eng-GB',3,18,''),(284,2,0,196,59,NULL,18,NULL,'ezinteger','eng-GB',3,18,''),(285,1,0,197,59,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezauthor><authors><author id=\"1\" name=\"John Doe\" email=\"johndoe@example.com\"/></authors></ezauthor>\n','ezauthor','eng-GB',3,0,'john doe'),(285,2,0,197,59,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezauthor><authors><author id=\"1\" name=\"John Doe\" email=\"johndoe@example.com\"/></authors></ezauthor>\n','ezauthor','eng-GB',3,0,'john doe'),(286,1,0,190,60,NULL,NULL,'Rallarvegen in Norway','ezstring','eng-GB',3,0,'rallarvegen in norway'),(286,2,0,190,60,NULL,NULL,'Rallarvegen in Norway','ezstring','eng-GB',3,0,'rallarvegen in norway'),(287,1,0,191,60,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"rallarvagen.jpg\"\n    suffix=\"jpg\" basename=\"rallarvagen\" dirpath=\"var/site/storage/images/7/8/2/0/287-1-eng-GB\" url=\"var/site/storage/images/7/8/2/0/287-1-eng-GB/rallarvagen.jpg\"\n    original_filename=\"rallarvagen.jpg\" mime_type=\"image/jpeg\" width=\"1176\"\n    height=\"882\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1584829743\">\n  <original attribute_id=\"287\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"882\" Width=\"1176\" IsColor=\"1\"/>\n</ezimage>','ezimage','eng-GB',3,0,''),(287,2,0,191,60,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"rallarvagen.jpg\"\n    suffix=\"jpg\" basename=\"rallarvagen\" dirpath=\"var/site/storage/images/7/8/2/0/287-1-eng-GB\" url=\"var/site/storage/images/7/8/2/0/287-1-eng-GB/rallarvagen.jpg\"\n    original_filename=\"rallarvagen.jpg\" mime_type=\"image/jpeg\" width=\"1176\"\n    height=\"882\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1584839729\">\n  <original attribute_id=\"287\" attribute_version=\"2\" attribute_language=\"eng-GB\"/>\n  <information Height=\"882\" Width=\"1176\" IsColor=\"1\"/>\n</ezimage>','ezimage','eng-GB',3,0,''),(288,1,0,192,60,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para><literallayout class=\"normal\">&lt;!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}--&gt;﻿Rallarvegen is the service road built 1902-04 by the workers (\"rallar\") while building the highest parts of the railroad across the mountains between Oslo and Bergen. These days it\'s still used for railroad maintenance, but it\'s also popular with cycloturists in the summer. Driving is restricted, I was passed by just a single car. It\'s a gravel road, stretching from Haugastøl in the east, to Myrdal in the west, and then it forks: One way goes to Flåm by the Aurland fjord, the other to Voss. The full length is 123 km.\n\nI took a shorter route. From Haugastøl at 988 m.a.s.l. up to Finse at 1222 meters it\'s just 26 km (and the return trip is all downhill, of course). This is a high mountain ride, so it\'s all about having the weather on your side. You\'ll see snow even in July, as I did, and be prepared for wind, rain and cold.\n\nBut I was lucky! Starting at Haugastøl with a clear blue sky and very little wind, it was warm enough to ride in shorts and short sleeves, all the way up to Finse. As steep as the Norwegian fjords can be, the mountain plateaus can be pretty flat, as it is here. The road was mostly easy. Just a few places were steep or rough, but not so bad I had to walk. There are no trees up there, so I could enjoy fantastic mountain views all the way.\n\nIn a few places the road was wet/muddy because of melting snow patches right next to it. July is considered early season actually, in August-September there is less snow. For large parts of the way the railroad is actually quite far away, but you can see it in the distance and hear the whistle of the train passing.\n\nArriving at Finse railroad station there was a cafe and kiosk, and tables outside where I could enjoy a quick lunch and chat with other cyclists, before heading back down to Haugastøl again. This could have been a tough ride, but ended up being an easy, enjoyable one. But even in wind and rain you can enjoy the mountain air and marvel at the work the rallars did over a hundred years ago, using picks and showels and very little machinery. Highly recommended!\n﻿\nRallarvegen is the service road built 1902-04 by the workers (\"rallar\") while building the highest parts of the railroad across the mountains between Oslo and Bergen. These days it\'s still used for railroad maintenance, but it\'s also popular with cycloturists in the summer. Driving is restricted, I was passed by just a single car. It\'s a gravel road, stretching from Haugastøl in the east, to Myrdal in the west, and then it forks: One way goes to Flåm by the Aurland fjord, the other to Voss. The full length is 123 km.\n\nI took a shorter route. From Haugastøl at 988 m.a.s.l. up to Finse at 1222 meters it\'s just 26 km (and the return trip is all downhill, of course). This is a high mountain ride, so it\'s all about having the weather on your side. You\'ll see snow even in July, as I did, and be prepared for wind, rain and cold.\n\nBut I was lucky! Starting at Haugastøl with a clear blue sky and very little wind, it was warm enough to ride in shorts and short sleeves, all the way up to Finse. As steep as the Norwegian fjords can be, the mountain plateaus can be pretty flat, as it is here. The road was mostly easy. Just a few places were steep or rough, but not so bad I had to walk. There are no trees up there, so I could enjoy fantastic mountain views all the way.\n\nIn a few places the road was wet/muddy because of melting snow patches right next to it. July is considered early season actually, in August-September there is less snow. For large parts of the way the railroad is actually quite far away, but you can see it in the distance and hear the whistle of the train passing.\n\nArriving at Finse railroad station there was a cafe and kiosk, and tables outside where I could enjoy a quick lunch and chat with other cyclists, before heading back down to Haugastøl again. This could have been a tough ride, but ended up being an easy, enjoyable one. But even in wind and rain you can enjoy the mountain air and marvel at the work the rallars did over a hundred years ago, using picks and showels and very little machinery. Highly recommended!</literallayout></para></section>\n','ezrichtext','eng-GB',3,0,'<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->﻿Rallarvegen is the service road built 1902-04 by the workers (\"rallar\") while building the highest parts of the railroad across the mountains between Oslo and Bergen. These days it\'s st'),(288,2,0,192,60,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para><literallayout class=\"normal\">﻿Rallarvegen is the service road built 1902-04 by the workers (\"rallar\") while building the highest parts of the railroad across the mountains between Oslo and Bergen. These days it\'s still used for railroad maintenance, but it\'s also popular with cycloturists in the summer. Driving is restricted, I was passed by just a single car. It\'s a gravel road, stretching from Haugastøl in the east, to Myrdal in the west, and then it forks: One way goes to Flåm by the Aurland fjord, the other to Voss. The full length is 123 km.\n\nI took a shorter route. From Haugastøl at 988 m.a.s.l. up to Finse at 1222 meters it\'s just 26 km (and the return trip is all downhill, of course). This is a high mountain ride, so it\'s all about having the weather on your side. You\'ll see snow even in July, as I did, and be prepared for wind, rain and cold.\n\nBut I was lucky! Starting at Haugastøl with a clear blue sky and very little wind, it was warm enough to ride in shorts and short sleeves, all the way up to Finse. As steep as the Norwegian fjords can be, the mountain plateaus can be pretty flat, as it is here. The road was mostly easy. Just a few places were steep or rough, but not so bad I had to walk. There are no trees up there, so I could enjoy fantastic mountain views all the way.\n\nIn a few places the road was wet/muddy because of melting snow patches right next to it. July is considered early season actually, in August-September there is less snow. For large parts of the way the railroad is actually quite far away, but you can see it in the distance and hear the whistle of the train passing.\n\nArriving at Finse railroad station there was a cafe and kiosk, and tables outside where I could enjoy a quick lunch and chat with other cyclists, before heading back down to Haugastøl again. This could have been a tough ride, but ended up being an easy, enjoyable one. But even in wind and rain you can enjoy the mountain air and marvel at the work the rallars did over a hundred years ago, using picks and showels and very little machinery. Highly recommended!\n﻿\nRallarvegen is the service road built 1902-04 by the workers (\"rallar\") while building the highest parts of the railroad across the mountains between Oslo and Bergen. These days it\'s still used for railroad maintenance, but it\'s also popular with cycloturists in the summer. Driving is restricted, I was passed by just a single car. It\'s a gravel road, stretching from Haugastøl in the east, to Myrdal in the west, and then it forks: One way goes to Flåm by the Aurland fjord, the other to Voss. The full length is 123 km.\n\nI took a shorter route. From Haugastøl at 988 m.a.s.l. up to Finse at 1222 meters it\'s just 26 km (and the return trip is all downhill, of course). This is a high mountain ride, so it\'s all about having the weather on your side. You\'ll see snow even in July, as I did, and be prepared for wind, rain and cold.\n\nBut I was lucky! Starting at Haugastøl with a clear blue sky and very little wind, it was warm enough to ride in shorts and short sleeves, all the way up to Finse. As steep as the Norwegian fjords can be, the mountain plateaus can be pretty flat, as it is here. The road was mostly easy. Just a few places were steep or rough, but not so bad I had to walk. There are no trees up there, so I could enjoy fantastic mountain views all the way.\n\nIn a few places the road was wet/muddy because of melting snow patches right next to it. July is considered early season actually, in August-September there is less snow. For large parts of the way the railroad is actually quite far away, but you can see it in the distance and hear the whistle of the train passing.\n\nArriving at Finse railroad station there was a cafe and kiosk, and tables outside where I could enjoy a quick lunch and chat with other cyclists, before heading back down to Haugastøl again. This could have been a tough ride, but ended up being an easy, enjoyable one. But even in wind and rain you can enjoy the mountain air and marvel at the work the rallars did over a hundred years ago, using picks and showels and very little machinery. Highly recommended!</literallayout></para></section>\n','ezrichtext','eng-GB',3,0,'﻿Rallarvegen is the service road built 1902-04 by the workers (\"rallar\") while building the highest parts of the railroad across the mountains between Oslo and Bergen. These days it\'s still used for railroad maintenance, but it\'s also popular with cyclotu'),(289,1,0,193,60,NULL,NULL,'1','ezselection','eng-GB',3,0,'1'),(289,2,0,193,60,NULL,NULL,'1','ezselection','eng-GB',3,0,'1'),(290,1,0,194,60,NULL,1,'','ezgmaplocation','eng-GB',3,0,'haugastøl, hol, norway'),(290,2,0,194,60,NULL,1,'','ezgmaplocation','eng-GB',3,0,'haugastøl, hol, norway'),(291,1,0,195,60,NULL,1,'','ezgmaplocation','eng-GB',3,0,'finse, ulvik, norway'),(291,2,0,195,60,NULL,1,'','ezgmaplocation','eng-GB',3,0,'finse, ulvik, norway'),(292,1,0,196,60,NULL,28,NULL,'ezinteger','eng-GB',3,28,''),(292,2,0,196,60,NULL,28,NULL,'ezinteger','eng-GB',3,28,''),(293,1,0,197,60,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezauthor><authors><author id=\"1\" name=\"Jane Doe\" email=\"janedoe@example.com\"/></authors></ezauthor>\n','ezauthor','eng-GB',3,0,'jane doe'),(293,2,0,197,60,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezauthor><authors><author id=\"1\" name=\"Jane Doe\" email=\"janedoe@example.com\"/></authors></ezauthor>\n','ezauthor','eng-GB',3,0,'jane doe'),(294,1,0,190,61,NULL,NULL,'Lookouts between Coligny and Montagna-le-Reconduit','ezstring','eng-GB',3,0,'lookouts between coligny and montagna-le-reconduit'),(294,2,0,190,61,NULL,NULL,'Lookouts between Coligny and Montagna-le-Reconduit','ezstring','eng-GB',3,0,'lookouts between coligny and montagna-le-reconduit'),(295,1,0,191,61,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"cabatane_full.jpg\"\n    suffix=\"jpg\" basename=\"cabatane_full\" dirpath=\"var/site/storage/images/5/9/2/0/295-1-eng-GB\" url=\"var/site/storage/images/5/9/2/0/295-1-eng-GB/cabatane_full.jpg\"\n    original_filename=\"cabatane_full.jpg\" mime_type=\"image/jpeg\" width=\"760\"\n    height=\"760\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1584829820\">\n  <original attribute_id=\"295\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"760\" Width=\"760\" IsColor=\"1\"/>\n</ezimage>','ezimage','eng-GB',3,0,''),(295,2,0,191,61,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"cabatane_full.jpg\"\n    suffix=\"jpg\" basename=\"cabatane_full\" dirpath=\"var/site/storage/images/5/9/2/0/295-1-eng-GB\" url=\"var/site/storage/images/5/9/2/0/295-1-eng-GB/cabatane_full.jpg\"\n    original_filename=\"cabatane_full.jpg\" mime_type=\"image/jpeg\" width=\"760\"\n    height=\"760\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1584839696\">\n  <original attribute_id=\"295\" attribute_version=\"2\" attribute_language=\"eng-GB\"/>\n  <information Height=\"760\" Width=\"760\" IsColor=\"1\"/>\n</ezimage>','ezimage','eng-GB',3,0,''),(296,1,0,192,61,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>&lt;!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}--&gt;﻿An exciting ride in the eastern parts of France, in the foothills of the Franche-Comté province.</para></section>\n','ezrichtext','eng-GB',3,0,'<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->﻿An exciting ride in the eastern parts of France, in the foothills of the Franche-Comté province.'),(296,2,0,192,61,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>﻿An exciting ride in the eastern parts of France, in the foothills of the Franche-Comté province.</para></section>\n','ezrichtext','eng-GB',3,0,'﻿An exciting ride in the eastern parts of France, in the foothills of the Franche-Comté province.'),(297,1,0,193,61,NULL,NULL,'0','ezselection','eng-GB',3,0,'0'),(297,2,0,193,61,NULL,NULL,'0','ezselection','eng-GB',3,0,'0'),(298,1,0,194,61,NULL,1,'','ezgmaplocation','eng-GB',3,0,'coligny, france'),(298,2,0,194,61,NULL,1,'','ezgmaplocation','eng-GB',3,0,'coligny, france'),(299,1,0,195,61,NULL,1,'','ezgmaplocation','eng-GB',3,0,'montagna-le-reconduit, france'),(299,2,0,195,61,NULL,1,'','ezgmaplocation','eng-GB',3,0,'montagna-le-reconduit, france'),(300,1,0,196,61,NULL,19,NULL,'ezinteger','eng-GB',3,19,''),(300,2,0,196,61,NULL,19,NULL,'ezinteger','eng-GB',3,19,''),(301,1,0,197,61,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezauthor><authors><author id=\"1\" name=\"Jack Doe\" email=\"jackdoe@example.com\"/></authors></ezauthor>\n','ezauthor','eng-GB',3,0,'jack doe'),(301,2,0,197,61,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezauthor><authors><author id=\"1\" name=\"Jack Doe\" email=\"jackdoe@example.com\"/></authors></ezauthor>\n','ezauthor','eng-GB',3,0,'jack doe'),(302,1,0,4,62,NULL,NULL,'Points of Interest','ezstring','eng-GB',3,0,'points of interest'),(303,1,0,155,62,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(304,1,0,119,62,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(305,1,0,156,62,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(306,1,0,198,63,NULL,NULL,'Plateau de Vergongeat','ezstring','eng-GB',3,0,'plateau de vergongeat'),(306,2,0,198,63,NULL,NULL,'Plateau de Vergongeat','ezstring','eng-GB',3,0,'plateau de vergongeat'),(307,1,0,199,63,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>&lt;!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}--&gt;﻿Vergongeat Plateau, located between Coligny and Poisoux, allows great views to see the Jura Mountains and the Mont Blanc.</para></section>\n','ezrichtext','eng-GB',3,0,'<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->﻿Vergongeat Plateau, located between Coligny and Poisoux, allows great views to see the Jura Mountains and the Mont Blanc.'),(307,2,0,199,63,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>﻿Vergongeat Plateau, located between Coligny and Poisoux, allows great views to see the Jura Mountains and the Mont Blanc.</para></section>\n','ezrichtext','eng-GB',3,0,'﻿Vergongeat Plateau, located between Coligny and Poisoux, allows great views to see the Jura Mountains and the Mont Blanc.'),(308,1,0,200,63,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"vergongeat_full.jpg\"\n    suffix=\"jpg\" basename=\"vergongeat_full\" dirpath=\"var/site/storage/images/8/0/3/0/308-1-eng-GB\" url=\"var/site/storage/images/8/0/3/0/308-1-eng-GB/vergongeat_full.jpg\"\n    original_filename=\"vergongeat_full.jpg\" mime_type=\"image/jpeg\" width=\"760\"\n    height=\"249\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1584829932\">\n  <original attribute_id=\"308\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"249\" Width=\"760\" IsColor=\"1\"/>\n</ezimage>','ezimage','eng-GB',3,0,''),(308,2,0,200,63,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"vergongeat_full.jpg\"\n    suffix=\"jpg\" basename=\"vergongeat_full\" dirpath=\"var/site/storage/images/8/0/3/0/308-1-eng-GB\" url=\"var/site/storage/images/8/0/3/0/308-1-eng-GB/vergongeat_full.jpg\"\n    original_filename=\"vergongeat_full.jpg\" mime_type=\"image/jpeg\" width=\"760\"\n    height=\"249\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1584839768\">\n  <original attribute_id=\"308\" attribute_version=\"2\" attribute_language=\"eng-GB\"/>\n  <information Height=\"249\" Width=\"760\" IsColor=\"1\"/>\n</ezimage>','ezimage','eng-GB',3,0,''),(309,1,0,201,63,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>&lt;!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}--&gt;﻿Panorama view</para></section>\n','ezrichtext','eng-GB',3,0,'<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->﻿Panorama view'),(309,2,0,201,63,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>Panorama view</para></section>\n','ezrichtext','eng-GB',3,0,'Panorama view'),(310,1,0,202,63,NULL,1,'','ezgmaplocation','eng-GB',3,0,'vergongeat'),(310,2,0,202,63,NULL,1,'','ezgmaplocation','eng-GB',3,0,'vergongeat'),(311,1,0,198,64,NULL,NULL,'Cross above Tarcia','ezstring','eng-GB',3,0,'cross above tarcia'),(311,2,0,198,64,NULL,NULL,'Cross above Tarcia','ezstring','eng-GB',3,0,'cross above tarcia'),(312,1,0,199,64,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>&lt;!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}--&gt;﻿This is the cross that\'s above Tarcia in the hills.</para></section>\n','ezrichtext','eng-GB',3,0,'<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->﻿This is the cross that\'s above Tarcia in the hills.'),(312,2,0,199,64,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>This is the cross that\'s above Tarcia in the hills.</para></section>\n','ezrichtext','eng-GB',3,0,'This is the cross that\'s above Tarcia in the hills.'),(313,1,0,200,64,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"cross-tarcia.jpg\"\n    suffix=\"jpg\" basename=\"cross-tarcia\" dirpath=\"var/site/storage/images/3/1/3/0/313-1-eng-GB\" url=\"var/site/storage/images/3/1/3/0/313-1-eng-GB/cross-tarcia.jpg\"\n    original_filename=\"cross-tarcia.jpg\" mime_type=\"image/jpeg\" width=\"1536\"\n    height=\"864\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1584829991\">\n  <original attribute_id=\"313\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"864\" Width=\"1536\" IsColor=\"1\"/>\n</ezimage>','ezimage','eng-GB',3,0,''),(313,2,0,200,64,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"cross-tarcia.jpg\"\n    suffix=\"jpg\" basename=\"cross-tarcia\" dirpath=\"var/site/storage/images/3/1/3/0/313-1-eng-GB\" url=\"var/site/storage/images/3/1/3/0/313-1-eng-GB/cross-tarcia.jpg\"\n    original_filename=\"cross-tarcia.jpg\" mime_type=\"image/jpeg\" width=\"1536\"\n    height=\"864\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1584839750\">\n  <original attribute_id=\"313\" attribute_version=\"2\" attribute_language=\"eng-GB\"/>\n  <information Height=\"864\" Width=\"1536\" IsColor=\"1\"/>\n</ezimage>','ezimage','eng-GB',3,0,''),(314,1,0,201,64,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>&lt;!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}--&gt;﻿View of the top in the summer</para></section>\n','ezrichtext','eng-GB',3,0,'<!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}-->﻿View of the top in the summer'),(314,2,0,201,64,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>View of the top in the summer</para></section>\n','ezrichtext','eng-GB',3,0,'View of the top in the summer'),(315,1,0,202,64,NULL,1,'','ezgmaplocation','eng-GB',3,0,'tarcia'),(315,2,0,202,64,NULL,1,'','ezgmaplocation','eng-GB',3,0,'tarcia');
/*!40000 ALTER TABLE `ezcontentobject_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_link`
--

DROP TABLE IF EXISTS `ezcontentobject_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentclassattribute_id` int(11) NOT NULL DEFAULT '0',
  `from_contentobject_id` int(11) NOT NULL DEFAULT '0',
  `from_contentobject_version` int(11) NOT NULL DEFAULT '0',
  `relation_type` int(11) NOT NULL DEFAULT '1',
  `to_contentobject_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezco_link_to_co_id` (`to_contentobject_id`),
  KEY `ezco_link_from` (`from_contentobject_id`,`from_contentobject_version`,`contentclassattribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_link`
--

LOCK TABLES `ezcontentobject_link` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcontentobject_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_name`
--

DROP TABLE IF EXISTS `ezcontentobject_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_name` (
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `content_version` int(11) NOT NULL DEFAULT '0',
  `content_translation` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `language_id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `real_translation` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`contentobject_id`,`content_version`,`content_translation`),
  KEY `ezcontentobject_name_lang_id` (`language_id`),
  KEY `ezcontentobject_name_cov_id` (`content_version`),
  KEY `ezcontentobject_name_name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_name`
--

LOCK TABLES `ezcontentobject_name` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_name` DISABLE KEYS */;
INSERT INTO `ezcontentobject_name` VALUES (1,9,'eng-GB',2,'eZ Platform','eng-GB'),(4,1,'eng-GB',3,'Users','eng-GB'),(10,2,'eng-GB',3,'Anonymous User','eng-GB'),(11,1,'eng-GB',3,'Guest accounts','eng-GB'),(12,1,'eng-GB',3,'Administrator users','eng-GB'),(13,1,'eng-GB',3,'Editors','eng-GB'),(14,3,'eng-GB',3,'Administrator User','eng-GB'),(41,1,'eng-GB',3,'Media','eng-GB'),(42,1,'eng-GB',3,'Anonymous Users','eng-GB'),(49,1,'eng-GB',3,'Images','eng-GB'),(50,1,'eng-GB',3,'Files','eng-GB'),(51,1,'eng-GB',3,'Multimedia','eng-GB'),(52,1,'eng-GB',2,'Home','eng-GB'),(53,1,'eng-GB',2,'Form Uploads','eng-GB'),(54,1,'eng-GB',3,'Forms','eng-GB'),(55,1,'eng-GB',3,'All Rides','eng-GB'),(57,1,'eng-GB',3,'Finnish coastline from Rauma to Pori','eng-GB'),(58,1,'eng-GB',3,'Baby tour of the Battenkill','eng-GB'),(58,2,'eng-GB',3,'Baby tour of the Battenkill','eng-GB'),(59,1,'eng-GB',3,'Meillonnas terrain track','eng-GB'),(59,2,'eng-GB',3,'Meillonnas terrain track','eng-GB'),(60,1,'eng-GB',3,'Rallarvegen in Norway','eng-GB'),(60,2,'eng-GB',3,'Rallarvegen in Norway','eng-GB'),(61,1,'eng-GB',3,'Lookouts between Coligny and Montagna-le-Reconduit','eng-GB'),(61,2,'eng-GB',3,'Lookouts between Coligny and Montagna-le-Reconduit','eng-GB'),(62,1,'eng-GB',3,'Points of Interest','eng-GB'),(63,1,'eng-GB',3,'Plateau de Vergongeat','eng-GB'),(63,2,'eng-GB',3,'Plateau de Vergongeat','eng-GB'),(64,1,'eng-GB',3,'Cross above Tarcia','eng-GB'),(64,2,'eng-GB',3,'Cross above Tarcia','eng-GB');
/*!40000 ALTER TABLE `ezcontentobject_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_trash`
--

DROP TABLE IF EXISTS `ezcontentobject_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_trash` (
  `node_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_id` int(11) DEFAULT NULL,
  `contentobject_version` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT '0',
  `is_hidden` int(11) NOT NULL DEFAULT '0',
  `is_invisible` int(11) NOT NULL DEFAULT '0',
  `main_node_id` int(11) DEFAULT NULL,
  `modified_subnode` int(11) DEFAULT '0',
  `parent_node_id` int(11) NOT NULL DEFAULT '0',
  `path_identification_string` longtext COLLATE utf8mb4_unicode_520_ci,
  `path_string` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '0',
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `sort_field` int(11) DEFAULT '1',
  `sort_order` int(11) DEFAULT '1',
  `trashed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`node_id`),
  KEY `ezcobj_trash_depth` (`depth`),
  KEY `ezcobj_trash_p_node_id` (`parent_node_id`),
  KEY `ezcobj_trash_path_ident` (`path_identification_string`(50)),
  KEY `ezcobj_trash_co_id` (`contentobject_id`),
  KEY `ezcobj_trash_modified_subnode` (`modified_subnode`),
  KEY `ezcobj_trash_path` (`path_string`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_trash`
--

LOCK TABLES `ezcontentobject_trash` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcontentobject_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_tree`
--

DROP TABLE IF EXISTS `ezcontentobject_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_tree` (
  `node_id` int(11) NOT NULL AUTO_INCREMENT,
  `contentobject_id` int(11) DEFAULT NULL,
  `contentobject_is_published` int(11) DEFAULT NULL,
  `contentobject_version` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT '0',
  `is_hidden` int(11) NOT NULL DEFAULT '0',
  `is_invisible` int(11) NOT NULL DEFAULT '0',
  `main_node_id` int(11) DEFAULT NULL,
  `modified_subnode` int(11) DEFAULT '0',
  `parent_node_id` int(11) NOT NULL DEFAULT '0',
  `path_identification_string` longtext COLLATE utf8mb4_unicode_520_ci,
  `path_string` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '0',
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `sort_field` int(11) DEFAULT '1',
  `sort_order` int(11) DEFAULT '1',
  PRIMARY KEY (`node_id`),
  KEY `ezcontentobject_tree_p_node_id` (`parent_node_id`),
  KEY `ezcontentobject_tree_path_ident` (`path_identification_string`(50)),
  KEY `ezcontentobject_tree_contentobject_id_path_string` (`path_string`(191),`contentobject_id`),
  KEY `ezcontentobject_tree_co_id` (`contentobject_id`),
  KEY `ezcontentobject_tree_depth` (`depth`),
  KEY `ezcontentobject_tree_path` (`path_string`(191)),
  KEY `modified_subnode` (`modified_subnode`),
  KEY `ezcontentobject_tree_remote_id` (`remote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_tree`
--

LOCK TABLES `ezcontentobject_tree` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_tree` DISABLE KEYS */;
INSERT INTO `ezcontentobject_tree` VALUES (1,0,1,1,0,0,0,1,1584829847,1,'','/1/',0,'629709ba256fe317c3ddcee35453a96a',1,1),(2,52,1,1,1,0,0,2,1584829847,1,'','/1/2/',0,'f3e90596361e31d496d4026eb624c983',8,1),(5,4,1,1,1,0,0,5,1301062024,1,'users','/1/5/',0,'3f6d92f8044aed134f32153517850f5a',1,1),(12,11,1,1,2,0,0,12,1081860719,5,'users/guest_accounts','/1/5/12/',0,'602dcf84765e56b7f999eaafd3821dd3',1,1),(13,12,1,1,2,0,0,13,1301062024,5,'users/administrator_users','/1/5/13/',0,'769380b7aa94541679167eab817ca893',1,1),(14,13,1,1,2,0,0,14,1081860719,5,'users/editors','/1/5/14/',0,'f7dda2854fc68f7c8455d9cb14bd04a9',1,1),(15,14,1,3,3,0,0,15,1301062024,13,'users/administrator_users/administrator_user','/1/5/13/15/',0,'e5161a99f733200b9ed4e80f9c16187b',1,1),(42,1,1,9,2,0,0,42,1486473151,2,'home','/1/2/42/',0,'581da01017b80b1afb1e5e2a3081c724',1,1),(43,41,1,1,1,0,0,43,1081860720,1,'media','/1/43/',0,'75c715a51699d2d309a924eca6a95145',9,1),(44,42,1,1,2,0,0,44,1081860719,5,'users/anonymous_users','/1/5/44/',0,'4fdf0072da953bb276c0c7e0141c5c9b',9,1),(45,10,1,2,3,0,0,45,1081860719,44,'users/anonymous_users/anonymous_user','/1/5/44/45/',0,'2cf8343bee7b482bab82b269d8fecd76',9,1),(51,49,1,1,2,0,0,51,1081860720,43,'media/images','/1/43/51/',0,'1b26c0454b09bb49dfb1b9190ffd67cb',9,1),(52,50,1,1,2,0,0,52,1081860720,43,'media/files','/1/43/52/',0,'0b113a208f7890f9ad3c24444ff5988c',9,1),(53,51,1,1,2,0,0,53,1081860720,43,'media/multimedia','/1/43/53/',0,'4f18b82c75f10aad476cae5adf98c11f',9,1),(54,53,1,1,3,0,0,54,1486473151,52,'media/files/form_uploads','/1/43/52/54/',0,'0543630fa051a1e2be54dbd32da2420f',1,1),(55,54,1,1,1,0,0,55,1537166893,1,'forms','/1/55/',0,'1dad43be47e3a5c12cd06010aab65112',9,1),(56,55,1,1,2,0,0,56,1584828302,2,'all_rides','/1/2/56/',0,'f9e54674ae46d8936b10db061527c034',9,1),(58,57,1,1,3,0,0,58,1584829510,56,'all_rides/finnish_coastline_from_rauma_to_pori','/1/2/56/58/',0,'bcbc70c4e9b89ce96b53a5e11cdae5f6',9,1),(59,58,1,2,3,0,0,59,1584829584,56,'all_rides/baby_tour_of_the_battenkill','/1/2/56/59/',0,'24d9b5f9ffbda253191fdc36f78cf683',9,1),(60,59,1,2,3,0,0,60,1584829676,56,'all_rides/meillonnas_terrain_track','/1/2/56/60/',0,'bbd7acef624544f744a8029caa2317a9',9,1),(61,60,1,2,3,0,0,61,1584829744,56,'all_rides/rallarvegen_in_norway','/1/2/56/61/',0,'cd68fd2e4ca6b4db70f0c14b38646c59',9,1),(62,61,1,2,3,0,0,62,1584829820,56,'all_rides/lookouts_between_coligny_and_montagna_le_reconduit','/1/2/56/62/',0,'96cd8ad2d4d070c1b0b8b340abb34973',9,1),(63,62,1,1,2,0,0,63,1584829873,2,'points_of_interest','/1/2/63/',0,'4377ff94c602502f7f1fdc405b0bee28',9,1),(64,63,1,2,3,0,0,64,1584829932,63,'points_of_interest/plateau_de_vergongeat','/1/2/63/64/',0,'ae5e9be1ebadec8e7aaa671179fd5da4',9,1),(65,64,1,2,3,0,0,65,1584829991,63,'points_of_interest/cross_above_tarcia','/1/2/63/65/',0,'e3b146e8ad6520bdb1934f4d6be1f3f1',9,1);
/*!40000 ALTER TABLE `ezcontentobject_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_version`
--

DROP TABLE IF EXISTS `ezcontentobject_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentobject_id` int(11) DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `initial_language_id` bigint(20) NOT NULL DEFAULT '0',
  `language_mask` bigint(20) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `workflow_event_pos` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezcobj_version_status` (`status`),
  KEY `idx_object_version_objver` (`contentobject_id`,`version`),
  KEY `ezcontobj_version_obj_status` (`contentobject_id`,`status`),
  KEY `ezcobj_version_creator_id` (`creator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=531 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_version`
--

LOCK TABLES `ezcontentobject_version` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_version` DISABLE KEYS */;
INSERT INTO `ezcontentobject_version` VALUES (4,4,0,14,2,3,0,1,0,1,1),(439,11,1033920737,14,2,3,1033920746,1,0,1,0),(440,12,1033920760,14,2,3,1033920775,1,0,1,0),(441,13,1033920786,14,2,3,1033920794,1,0,1,0),(472,41,1060695450,14,2,3,1060695457,1,0,1,0),(473,42,1072180278,14,2,3,1072180330,1,0,1,0),(474,10,1072180337,14,2,3,1072180405,1,0,2,0),(488,49,1080220181,14,2,3,1080220197,1,0,1,0),(489,50,1080220211,14,2,3,1080220220,1,0,1,0),(490,51,1080220225,14,2,3,1080220233,1,0,1,0),(499,14,1301061783,14,2,3,1301062024,1,0,3,0),(506,1,1448889045,14,2,3,1448889046,1,0,9,0),(512,52,1442481742,14,2,3,1442481743,1,0,1,0),(513,53,1486473143,14,2,3,1486473151,1,0,1,0),(514,54,1537166893,14,2,2,1537166893,1,0,1,0),(515,55,1584828302,14,2,3,1584828302,1,0,1,0),(517,57,1584829510,14,2,3,1584829510,1,0,1,0),(518,58,1584829584,14,2,3,1584839674,3,0,1,0),(519,59,1584829676,14,2,3,1584839712,3,0,1,0),(520,60,1584829743,14,2,3,1584839729,3,0,1,0),(521,61,1584829820,14,2,3,1584839696,3,0,1,0),(522,62,1584829873,14,2,3,1584829873,1,0,1,0),(523,63,1584829932,14,2,3,1584839768,3,0,1,0),(524,64,1584829991,14,2,3,1584839750,3,0,1,0),(525,58,1584839664,14,2,3,1584839674,1,0,2,0),(526,61,1584839687,14,2,3,1584839696,1,0,2,0),(527,59,1584839702,14,2,3,1584839712,1,0,2,0),(528,60,1584839720,14,2,3,1584839729,1,0,2,0),(529,64,1584839736,14,2,3,1584839750,1,0,2,0),(530,63,1584839755,14,2,3,1584839768,1,0,2,0);
/*!40000 ALTER TABLE `ezcontentobject_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezdatebasedpublisher_scheduled_version`
--

DROP TABLE IF EXISTS `ezdatebasedpublisher_scheduled_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezdatebasedpublisher_scheduled_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `version_id` int(11) NOT NULL,
  `version_number` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `publication_date` int(11) NOT NULL,
  `url_root` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_id_version_number` (`content_id`,`version_number`),
  KEY `content_id` (`content_id`),
  KEY `version_id` (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezdatebasedpublisher_scheduled_version`
--

LOCK TABLES `ezdatebasedpublisher_scheduled_version` WRITE;
/*!40000 ALTER TABLE `ezdatebasedpublisher_scheduled_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezdatebasedpublisher_scheduled_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezdfsfile`
--

DROP TABLE IF EXISTS `ezdfsfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezdfsfile` (
  `name_hash` varchar(34) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name_trunk` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `datatype` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'application/octet-stream',
  `scope` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `expired` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name_hash`),
  KEY `ezdfsfile_name_trunk` (`name_trunk`(191)),
  KEY `ezdfsfile_expired_name` (`expired`,`name`(191)),
  KEY `ezdfsfile_name` (`name`(191)),
  KEY `ezdfsfile_mtime` (`mtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezdfsfile`
--

LOCK TABLES `ezdfsfile` WRITE;
/*!40000 ALTER TABLE `ezdfsfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezdfsfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezeditorialworkflow_markings`
--

DROP TABLE IF EXISTS `ezeditorialworkflow_markings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezeditorialworkflow_markings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `result` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`),
  KEY `fk_workflow_id_markings` (`workflow_id`),
  CONSTRAINT `fk_ezeditorialworkflow_markings_workflow_id` FOREIGN KEY (`workflow_id`) REFERENCES `ezeditorialworkflow_workflows` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezeditorialworkflow_markings`
--

LOCK TABLES `ezeditorialworkflow_markings` WRITE;
/*!40000 ALTER TABLE `ezeditorialworkflow_markings` DISABLE KEYS */;
INSERT INTO `ezeditorialworkflow_markings` VALUES (1,1,'draft','',NULL,'[]'),(3,3,'draft','',NULL,'[]'),(4,4,'draft','',NULL,'[]'),(5,5,'draft','',NULL,'[]'),(6,6,'draft','',NULL,'[]'),(7,7,'draft','',NULL,'[]'),(8,8,'draft','',NULL,'[]'),(9,9,'draft','',NULL,'[]'),(10,10,'draft','',NULL,'[]'),(11,11,'draft','',NULL,'[]'),(12,12,'draft','',NULL,'[]'),(13,13,'draft','',NULL,'[]'),(14,14,'draft','',NULL,'[]'),(15,15,'draft','',NULL,'[]'),(16,16,'draft','',NULL,'[]');
/*!40000 ALTER TABLE `ezeditorialworkflow_markings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezeditorialworkflow_transitions`
--

DROP TABLE IF EXISTS `ezeditorialworkflow_transitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezeditorialworkflow_transitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`),
  KEY `fk_workflow_id_transitions` (`workflow_id`),
  CONSTRAINT `fk_ezeditorialworkflow_transitions_workflow_id` FOREIGN KEY (`workflow_id`) REFERENCES `ezeditorialworkflow_workflows` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezeditorialworkflow_transitions`
--

LOCK TABLES `ezeditorialworkflow_transitions` WRITE;
/*!40000 ALTER TABLE `ezeditorialworkflow_transitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezeditorialworkflow_transitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezeditorialworkflow_workflows`
--

DROP TABLE IF EXISTS `ezeditorialworkflow_workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezeditorialworkflow_workflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `version_no` int(11) NOT NULL,
  `workflow_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `initial_owner_id` int(11) DEFAULT NULL,
  `start_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_workflow_id` (`id`),
  KEY `initial_owner_id` (`initial_owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezeditorialworkflow_workflows`
--

LOCK TABLES `ezeditorialworkflow_workflows` WRITE;
/*!40000 ALTER TABLE `ezeditorialworkflow_workflows` DISABLE KEYS */;
INSERT INTO `ezeditorialworkflow_workflows` VALUES (1,55,1,'quick_review',14,1584828302),(3,57,1,'quick_review',14,1584829510),(4,58,1,'quick_review',14,1584829584),(5,59,1,'quick_review',14,1584829676),(6,60,1,'quick_review',14,1584829744),(7,61,1,'quick_review',14,1584829820),(8,62,1,'quick_review',14,1584829873),(9,63,1,'quick_review',14,1584829932),(10,64,1,'quick_review',14,1584829991),(11,58,2,'quick_review',14,1584839674),(12,61,2,'quick_review',14,1584839696),(13,59,2,'quick_review',14,1584839712),(14,60,2,'quick_review',14,1584839729),(15,64,2,'quick_review',14,1584839750),(16,63,2,'quick_review',14,1584839768);
/*!40000 ALTER TABLE `ezeditorialworkflow_workflows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezform_field_attributes`
--

DROP TABLE IF EXISTS `ezform_field_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezform_field_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `identifier` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezform_field_attributes`
--

LOCK TABLES `ezform_field_attributes` WRITE;
/*!40000 ALTER TABLE `ezform_field_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezform_field_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezform_field_validators`
--

DROP TABLE IF EXISTS `ezform_field_validators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezform_field_validators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `identifier` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezform_field_validators`
--

LOCK TABLES `ezform_field_validators` WRITE;
/*!40000 ALTER TABLE `ezform_field_validators` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezform_field_validators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezform_fields`
--

DROP TABLE IF EXISTS `ezform_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezform_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `identifier` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezform_fields`
--

LOCK TABLES `ezform_fields` WRITE;
/*!40000 ALTER TABLE `ezform_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezform_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezform_form_submission_data`
--

DROP TABLE IF EXISTS `ezform_form_submission_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezform_form_submission_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_submission_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `identifier` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezform_form_submission_data`
--

LOCK TABLES `ezform_form_submission_data` WRITE;
/*!40000 ALTER TABLE `ezform_form_submission_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezform_form_submission_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezform_form_submissions`
--

DROP TABLE IF EXISTS `ezform_form_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezform_form_submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `language_code` varchar(6) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezform_form_submissions`
--

LOCK TABLES `ezform_form_submissions` WRITE;
/*!40000 ALTER TABLE `ezform_form_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezform_form_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezform_forms`
--

DROP TABLE IF EXISTS `ezform_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezform_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL,
  `version_no` int(11) DEFAULT NULL,
  `content_field_id` int(11) DEFAULT NULL,
  `language_code` varchar(16) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezform_forms`
--

LOCK TABLES `ezform_forms` WRITE;
/*!40000 ALTER TABLE `ezform_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezform_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezgmaplocation`
--

DROP TABLE IF EXISTS `ezgmaplocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezgmaplocation` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_version` int(11) NOT NULL DEFAULT '0',
  `latitude` double NOT NULL DEFAULT '0',
  `longitude` double NOT NULL DEFAULT '0',
  `address` varchar(150) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`contentobject_attribute_id`,`contentobject_version`),
  KEY `latitude_longitude_key` (`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezgmaplocation`
--

LOCK TABLES `ezgmaplocation` WRITE;
/*!40000 ALTER TABLE `ezgmaplocation` DISABLE KEYS */;
INSERT INTO `ezgmaplocation` VALUES (266,1,61.128915,21.50394,'Rauma, Finland'),(267,1,61.486554,21.796895,'Pori, Finland'),(274,1,43.100231,-73.581963,'Schuylerville, NY, USA'),(274,2,43.100231,-73.581963,'Schuylerville, NY, USA'),(275,1,43.090355,-73.342889,'Shushan, NY, USA'),(275,2,43.090355,-73.342889,'Shushan, NY, USA'),(282,1,46.245686,5.352833,'Meillonnas, France'),(282,2,46.245686,5.352833,'Meillonnas, France'),(283,1,46.320749,5.387482,'Pressiat, France'),(283,2,46.320749,5.387482,'Pressiat, France'),(290,1,60.511287,7.870521,'Haugastøl, Hol, Norway'),(290,2,60.511287,7.870521,'Haugastøl, Hol, Norway'),(291,1,60.602963,7.502078,'Finse, Ulvik, Norway'),(291,2,60.602963,7.502078,'Finse, Ulvik, Norway'),(298,1,46.3828,5.34526,'Coligny, France'),(298,2,46.3828,5.34526,'Coligny, France'),(299,1,46.4585,5.38581,'Montagna-le-Reconduit, France'),(299,2,46.4585,5.38581,'Montagna-le-Reconduit, France'),(310,1,46.381409,5.3666,'Vergongeat'),(310,2,46.381409,5.3666,'Vergongeat'),(315,1,46.384895,5.404414,'Tarcia'),(315,2,46.384895,5.404414,'Tarcia');
/*!40000 ALTER TABLE `ezgmaplocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezimagefile`
--

DROP TABLE IF EXISTS `ezimagefile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezimagefile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT '0',
  `filepath` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ezimagefile_file` (`filepath`(191)),
  KEY `ezimagefile_coid` (`contentobject_attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezimagefile`
--

LOCK TABLES `ezimagefile` WRITE;
/*!40000 ALTER TABLE `ezimagefile` DISABLE KEYS */;
INSERT INTO `ezimagefile` VALUES (1,263,'var/site/storage/images/3/6/2/0/263-1-eng-GB/saaristo.jpg'),(2,271,'var/site/storage/images/1/7/2/0/271-1-eng-GB/battenkill.jpg'),(3,279,'var/site/storage/images/9/7/2/0/279-1-eng-GB/cabatane_full.jpg'),(4,287,'var/site/storage/images/7/8/2/0/287-1-eng-GB/rallarvagen.jpg'),(5,295,'var/site/storage/images/5/9/2/0/295-1-eng-GB/cabatane_full.jpg'),(6,308,'var/site/storage/images/8/0/3/0/308-1-eng-GB/vergongeat_full.jpg'),(7,313,'var/site/storage/images/3/1/3/0/313-1-eng-GB/cross-tarcia.jpg'),(8,271,'var/site/storage/images/1/7/2/0/271-1-eng-GB/battenkill.jpg'),(9,271,'var/site/storage/images/1/7/2/0/271-1-eng-GB/battenkill.jpg'),(10,295,'var/site/storage/images/5/9/2/0/295-1-eng-GB/cabatane_full.jpg'),(11,295,'var/site/storage/images/5/9/2/0/295-1-eng-GB/cabatane_full.jpg'),(12,279,'var/site/storage/images/9/7/2/0/279-1-eng-GB/cabatane_full.jpg'),(13,279,'var/site/storage/images/9/7/2/0/279-1-eng-GB/cabatane_full.jpg'),(14,287,'var/site/storage/images/7/8/2/0/287-1-eng-GB/rallarvagen.jpg'),(15,287,'var/site/storage/images/7/8/2/0/287-1-eng-GB/rallarvagen.jpg'),(16,313,'var/site/storage/images/3/1/3/0/313-1-eng-GB/cross-tarcia.jpg'),(17,313,'var/site/storage/images/3/1/3/0/313-1-eng-GB/cross-tarcia.jpg'),(18,308,'var/site/storage/images/8/0/3/0/308-1-eng-GB/vergongeat_full.jpg'),(19,308,'var/site/storage/images/8/0/3/0/308-1-eng-GB/vergongeat_full.jpg');
/*!40000 ALTER TABLE `ezimagefile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezkeyword`
--

DROP TABLE IF EXISTS `ezkeyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezkeyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL DEFAULT '0',
  `keyword` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezkeyword_keyword` (`keyword`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezkeyword`
--

LOCK TABLES `ezkeyword` WRITE;
/*!40000 ALTER TABLE `ezkeyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezkeyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezkeyword_attribute_link`
--

DROP TABLE IF EXISTS `ezkeyword_attribute_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezkeyword_attribute_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_id` int(11) NOT NULL DEFAULT '0',
  `objectattribute_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezkeyword_attr_link_oaid` (`objectattribute_id`),
  KEY `ezkeyword_attr_link_kid_oaid` (`keyword_id`,`objectattribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezkeyword_attribute_link`
--

LOCK TABLES `ezkeyword_attribute_link` WRITE;
/*!40000 ALTER TABLE `ezkeyword_attribute_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezkeyword_attribute_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezmedia`
--

DROP TABLE IF EXISTS `ezmedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezmedia` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `controls` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `has_controller` int(11) DEFAULT '0',
  `height` int(11) DEFAULT NULL,
  `is_autoplay` int(11) DEFAULT '0',
  `is_loop` int(11) DEFAULT '0',
  `mime_type` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `original_filename` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `pluginspage` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `quality` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentobject_attribute_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezmedia`
--

LOCK TABLES `ezmedia` WRITE;
/*!40000 ALTER TABLE `ezmedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezmedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eznode_assignment`
--

DROP TABLE IF EXISTS `eznode_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eznode_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentobject_id` int(11) DEFAULT NULL,
  `contentobject_version` int(11) DEFAULT NULL,
  `from_node_id` int(11) DEFAULT '0',
  `is_main` int(11) NOT NULL DEFAULT '0',
  `op_code` int(11) NOT NULL DEFAULT '0',
  `parent_node` int(11) DEFAULT NULL,
  `parent_remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `sort_field` int(11) DEFAULT '1',
  `sort_order` int(11) DEFAULT '1',
  `priority` int(11) NOT NULL DEFAULT '0',
  `is_hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `eznode_assignment_is_main` (`is_main`),
  KEY `eznode_assignment_coid_cov` (`contentobject_id`,`contentobject_version`),
  KEY `eznode_assignment_parent_node` (`parent_node`),
  KEY `eznode_assignment_co_version` (`contentobject_version`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eznode_assignment`
--

LOCK TABLES `eznode_assignment` WRITE;
/*!40000 ALTER TABLE `eznode_assignment` DISABLE KEYS */;
INSERT INTO `eznode_assignment` VALUES (4,8,2,0,1,2,5,'','0',1,1,0,0),(5,42,1,0,1,2,5,'','0',9,1,0,0),(6,10,2,-1,1,2,44,'','0',9,1,0,0),(7,4,1,0,1,2,1,'','0',1,1,0,0),(8,12,1,0,1,2,5,'','0',1,1,0,0),(9,13,1,0,1,2,5,'','0',1,1,0,0),(11,41,1,0,1,2,1,'','0',1,1,0,0),(12,11,1,0,1,2,5,'','0',1,1,0,0),(27,49,1,0,1,2,43,'','0',9,1,0,0),(28,50,1,0,1,2,43,'','0',9,1,0,0),(29,51,1,0,1,2,43,'','0',9,1,0,0),(38,14,3,-1,1,2,13,'','0',1,1,0,0),(40,53,1,0,1,2,52,'0543630fa051a1e2be54dbd32da2420f','0',1,1,0,0),(41,54,1,0,1,2,2,'1dad43be47e3a5c12cd06010aab65112','0',9,1,0,0),(42,55,1,0,1,2,2,'f9e54674ae46d8936b10db061527c034','0',9,1,0,0),(43,56,1,0,1,2,2,'c8f1c1e167eebf1970fd963c06537999','0',9,1,0,0),(44,57,1,0,1,2,56,'bcbc70c4e9b89ce96b53a5e11cdae5f6','0',9,1,0,0),(45,58,1,0,1,2,56,'24d9b5f9ffbda253191fdc36f78cf683','0',9,1,0,0),(46,59,1,0,1,2,56,'bbd7acef624544f744a8029caa2317a9','0',9,1,0,0),(47,60,1,0,1,2,56,'cd68fd2e4ca6b4db70f0c14b38646c59','0',9,1,0,0),(48,61,1,0,1,2,56,'96cd8ad2d4d070c1b0b8b340abb34973','0',9,1,0,0),(49,62,1,0,1,2,2,'4377ff94c602502f7f1fdc405b0bee28','0',9,1,0,0),(50,63,1,0,1,2,63,'ae5e9be1ebadec8e7aaa671179fd5da4','0',9,1,0,0),(51,64,1,0,1,2,63,'e3b146e8ad6520bdb1934f4d6be1f3f1','0',9,1,0,0);
/*!40000 ALTER TABLE `eznode_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eznotification`
--

DROP TABLE IF EXISTS `eznotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eznotification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `is_pending` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`),
  KEY `eznotification_owner_is_pending` (`owner_id`,`is_pending`),
  KEY `eznotification_owner` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eznotification`
--

LOCK TABLES `eznotification` WRITE;
/*!40000 ALTER TABLE `eznotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `eznotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpackage`
--

DROP TABLE IF EXISTS `ezpackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpackage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `install_date` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `version` varchar(30) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpackage`
--

LOCK TABLES `ezpackage` WRITE;
/*!40000 ALTER TABLE `ezpackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezpackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_attributes`
--

DROP TABLE IF EXISTS `ezpage_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_attributes`
--

LOCK TABLES `ezpage_attributes` WRITE;
/*!40000 ALTER TABLE `ezpage_attributes` DISABLE KEYS */;
INSERT INTO `ezpage_attributes` VALUES (1,'content','<h1>eZ Studio</h1> <p>This is the clean install coming with eZ Studio. Now you can start creating your own design.</p>');
/*!40000 ALTER TABLE `ezpage_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_blocks`
--

DROP TABLE IF EXISTS `ezpage_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `view` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_blocks`
--

LOCK TABLES `ezpage_blocks` WRITE;
/*!40000 ALTER TABLE `ezpage_blocks` DISABLE KEYS */;
INSERT INTO `ezpage_blocks` VALUES (1,'tag','default','Tag');
/*!40000 ALTER TABLE `ezpage_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_blocks_design`
--

DROP TABLE IF EXISTS `ezpage_blocks_design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_blocks_design` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `style` text COLLATE utf8mb4_unicode_520_ci,
  `compiled` text COLLATE utf8mb4_unicode_520_ci,
  `class` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezpage_blocks_design_block_id` (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_blocks_design`
--

LOCK TABLES `ezpage_blocks_design` WRITE;
/*!40000 ALTER TABLE `ezpage_blocks_design` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezpage_blocks_design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_blocks_visibility`
--

DROP TABLE IF EXISTS `ezpage_blocks_visibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_blocks_visibility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `since` int(11) DEFAULT NULL,
  `till` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezpage_blocks_visibility_block_id` (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_blocks_visibility`
--

LOCK TABLES `ezpage_blocks_visibility` WRITE;
/*!40000 ALTER TABLE `ezpage_blocks_visibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezpage_blocks_visibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_map_attributes_blocks`
--

DROP TABLE IF EXISTS `ezpage_map_attributes_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_map_attributes_blocks` (
  `attribute_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_id`,`block_id`),
  KEY `ezpage_map_attributes_blocks_attribute_id` (`attribute_id`),
  KEY `ezpage_map_attributes_blocks_block_id` (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_map_attributes_blocks`
--

LOCK TABLES `ezpage_map_attributes_blocks` WRITE;
/*!40000 ALTER TABLE `ezpage_map_attributes_blocks` DISABLE KEYS */;
INSERT INTO `ezpage_map_attributes_blocks` VALUES (1,1);
/*!40000 ALTER TABLE `ezpage_map_attributes_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_map_blocks_zones`
--

DROP TABLE IF EXISTS `ezpage_map_blocks_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_map_blocks_zones` (
  `block_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  PRIMARY KEY (`block_id`,`zone_id`),
  KEY `ezpage_map_blocks_zones_block_id` (`block_id`),
  KEY `ezpage_map_blocks_zones_zone_id` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_map_blocks_zones`
--

LOCK TABLES `ezpage_map_blocks_zones` WRITE;
/*!40000 ALTER TABLE `ezpage_map_blocks_zones` DISABLE KEYS */;
INSERT INTO `ezpage_map_blocks_zones` VALUES (1,1);
/*!40000 ALTER TABLE `ezpage_map_blocks_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_map_zones_pages`
--

DROP TABLE IF EXISTS `ezpage_map_zones_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_map_zones_pages` (
  `zone_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`zone_id`,`page_id`),
  KEY `ezpage_map_zones_pages_zone_id` (`zone_id`),
  KEY `ezpage_map_zones_pages_page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_map_zones_pages`
--

LOCK TABLES `ezpage_map_zones_pages` WRITE;
/*!40000 ALTER TABLE `ezpage_map_zones_pages` DISABLE KEYS */;
INSERT INTO `ezpage_map_zones_pages` VALUES (1,1);
/*!40000 ALTER TABLE `ezpage_map_zones_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_pages`
--

DROP TABLE IF EXISTS `ezpage_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version_no` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `language_code` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `layout` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ezpage_pages_content_id_version_no` (`content_id`,`version_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_pages`
--

LOCK TABLES `ezpage_pages` WRITE;
/*!40000 ALTER TABLE `ezpage_pages` DISABLE KEYS */;
INSERT INTO `ezpage_pages` VALUES (1,1,52,'eng-GB','default');
/*!40000 ALTER TABLE `ezpage_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_zones`
--

DROP TABLE IF EXISTS `ezpage_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_zones`
--

LOCK TABLES `ezpage_zones` WRITE;
/*!40000 ALTER TABLE `ezpage_zones` DISABLE KEYS */;
INSERT INTO `ezpage_zones` VALUES (1,'default');
/*!40000 ALTER TABLE `ezpage_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpolicy`
--

DROP TABLE IF EXISTS `ezpolicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpolicy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `function_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `module_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `original_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezpolicy_role_id` (`role_id`),
  KEY `ezpolicy_original_id` (`original_id`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpolicy`
--

LOCK TABLES `ezpolicy` WRITE;
/*!40000 ALTER TABLE `ezpolicy` DISABLE KEYS */;
INSERT INTO `ezpolicy` VALUES (317,'*','content',0,3),(319,'login','user',0,3),(328,'read','content',0,1),(331,'login','user',0,1),(332,'*','*',0,2),(333,'read','content',0,4),(334,'view_embed','content',0,1),(340,'*','url',0,3);
/*!40000 ALTER TABLE `ezpolicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpolicy_limitation`
--

DROP TABLE IF EXISTS `ezpolicy_limitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpolicy_limitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `policy_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `policy_id` (`policy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpolicy_limitation`
--

LOCK TABLES `ezpolicy_limitation` WRITE;
/*!40000 ALTER TABLE `ezpolicy_limitation` DISABLE KEYS */;
INSERT INTO `ezpolicy_limitation` VALUES (251,'Section',328),(252,'Section',329),(253,'SiteAccess',331),(254,'Class',333),(255,'Owner',333),(256,'Class',334);
/*!40000 ALTER TABLE `ezpolicy_limitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpolicy_limitation_value`
--

DROP TABLE IF EXISTS `ezpolicy_limitation_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpolicy_limitation_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `limitation_id` int(11) DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezpolicy_limit_value_limit_id` (`limitation_id`),
  KEY `ezpolicy_limitation_value_val` (`value`(191))
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpolicy_limitation_value`
--

LOCK TABLES `ezpolicy_limitation_value` WRITE;
/*!40000 ALTER TABLE `ezpolicy_limitation_value` DISABLE KEYS */;
INSERT INTO `ezpolicy_limitation_value` VALUES (477,251,'1'),(478,252,'1'),(479,253,'1766001124'),(480,254,'4'),(481,255,'1'),(482,256,'5'),(483,256,'12'),(484,251,'3'),(485,251,'6');
/*!40000 ALTER TABLE `ezpolicy_limitation_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpreferences`
--

DROP TABLE IF EXISTS `ezpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpreferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`),
  KEY `ezpreferences_user_id_idx` (`user_id`,`name`),
  KEY `ezpreferences_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpreferences`
--

LOCK TABLES `ezpreferences` WRITE;
/*!40000 ALTER TABLE `ezpreferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezrole`
--

DROP TABLE IF EXISTS `ezrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_new` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `value` char(1) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `version` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezrole`
--

LOCK TABLES `ezrole` WRITE;
/*!40000 ALTER TABLE `ezrole` DISABLE KEYS */;
INSERT INTO `ezrole` VALUES (1,0,'Anonymous','',0),(2,0,'Administrator','0',0),(3,0,'Editor','',0),(4,0,'Member','',0);
/*!40000 ALTER TABLE `ezrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsearch_object_word_link`
--

DROP TABLE IF EXISTS `ezsearch_object_word_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsearch_object_word_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentclass_attribute_id` int(11) NOT NULL DEFAULT '0',
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `frequency` double NOT NULL DEFAULT '0',
  `identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `integer_value` int(11) NOT NULL DEFAULT '0',
  `next_word_id` int(11) NOT NULL DEFAULT '0',
  `placement` int(11) NOT NULL DEFAULT '0',
  `prev_word_id` int(11) NOT NULL DEFAULT '0',
  `published` int(11) NOT NULL DEFAULT '0',
  `section_id` int(11) NOT NULL DEFAULT '0',
  `word_id` int(11) NOT NULL DEFAULT '0',
  `language_mask` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezsearch_object_word_link_object` (`contentobject_id`),
  KEY `ezsearch_object_word_link_identifier` (`identifier`(191)),
  KEY `ezsearch_object_word_link_integer_value` (`integer_value`),
  KEY `ezsearch_object_word_link_word` (`word_id`),
  KEY `ezsearch_object_word_link_frequency` (`frequency`)
) ENGINE=InnoDB AUTO_INCREMENT=2213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsearch_object_word_link`
--

LOCK TABLES `ezsearch_object_word_link` WRITE;
/*!40000 ALTER TABLE `ezsearch_object_word_link` DISABLE KEYS */;
INSERT INTO `ezsearch_object_word_link` VALUES (1,4,1,1,0,'name',0,2,0,0,1448889046,1,1,3),(2,4,1,1,0,'name',0,3,1,1,1448889046,1,2,3),(3,4,1,1,0,'name',0,4,2,2,1448889046,1,3,3),(4,4,1,1,0,'name',0,5,3,3,1448889046,1,4,3),(5,119,1,1,0,'short_description',0,6,4,4,1448889046,1,5,3),(6,119,1,1,0,'short_description',0,7,5,5,1448889046,1,6,3),(7,119,1,1,0,'short_description',0,8,6,6,1448889046,1,7,3),(8,119,1,1,0,'short_description',0,9,7,7,1448889046,1,8,3),(9,119,1,1,0,'short_description',0,10,8,8,1448889046,1,9,3),(10,119,1,1,0,'short_description',0,11,9,9,1448889046,1,10,3),(11,119,1,1,0,'short_description',0,3,10,10,1448889046,1,11,3),(12,119,1,1,0,'short_description',0,4,11,11,1448889046,1,3,3),(13,119,1,1,0,'short_description',0,12,12,3,1448889046,1,4,3),(14,119,1,1,0,'short_description',0,13,13,4,1448889046,1,12,3),(15,119,1,1,0,'short_description',0,14,14,12,1448889046,1,13,3),(16,119,1,1,0,'short_description',0,15,15,13,1448889046,1,14,3),(17,119,1,1,0,'short_description',0,16,16,14,1448889046,1,15,3),(18,119,1,1,0,'short_description',0,17,17,15,1448889046,1,16,3),(19,119,1,1,0,'short_description',0,7,18,16,1448889046,1,17,3),(20,119,1,1,0,'short_description',0,4,19,17,1448889046,1,7,3),(21,119,1,1,0,'short_description',0,18,20,7,1448889046,1,4,3),(22,119,1,1,0,'short_description',0,19,21,4,1448889046,1,18,3),(23,119,1,1,0,'short_description',0,20,22,18,1448889046,1,19,3),(24,119,1,1,0,'short_description',0,2,23,19,1448889046,1,20,3),(25,119,1,1,0,'short_description',0,21,24,20,1448889046,1,2,3),(26,119,1,1,0,'short_description',0,22,25,2,1448889046,1,21,3),(27,119,1,1,0,'short_description',0,23,26,21,1448889046,1,22,3),(28,119,1,1,0,'short_description',0,24,27,22,1448889046,1,23,3),(29,119,1,1,0,'short_description',0,25,28,23,1448889046,1,24,3),(30,119,1,1,0,'short_description',0,2,29,24,1448889046,1,25,3),(31,119,1,1,0,'short_description',0,21,30,25,1448889046,1,2,3),(32,119,1,1,0,'short_description',0,26,31,2,1448889046,1,21,3),(33,119,1,1,0,'short_description',0,27,32,21,1448889046,1,26,3),(34,119,1,1,0,'short_description',0,28,33,26,1448889046,1,27,3),(35,119,1,1,0,'short_description',0,29,34,27,1448889046,1,28,3),(36,119,1,1,0,'short_description',0,30,35,28,1448889046,1,29,3),(37,119,1,1,0,'short_description',0,2,36,29,1448889046,1,30,3),(38,119,1,1,0,'short_description',0,31,37,30,1448889046,1,2,3),(39,119,1,1,0,'short_description',0,32,38,2,1448889046,1,31,3),(40,119,1,1,0,'short_description',0,33,39,31,1448889046,1,32,3),(41,119,1,1,0,'short_description',0,34,40,32,1448889046,1,33,3),(42,119,1,1,0,'short_description',0,35,41,33,1448889046,1,34,3),(43,119,1,1,0,'short_description',0,36,42,34,1448889046,1,35,3),(44,119,1,1,0,'short_description',0,37,43,35,1448889046,1,36,3),(45,119,1,1,0,'short_description',0,38,44,36,1448889046,1,37,3),(46,119,1,1,0,'short_description',0,7,45,37,1448889046,1,38,3),(47,119,1,1,0,'short_description',0,39,46,38,1448889046,1,7,3),(48,119,1,1,0,'short_description',0,3,47,7,1448889046,1,39,3),(49,155,1,1,0,'short_name',0,4,48,39,1448889046,1,3,3),(50,155,1,1,0,'short_name',0,1,49,3,1448889046,1,4,3),(51,156,1,1,0,'description',0,2,50,4,1448889046,1,1,3),(52,156,1,1,0,'description',0,3,51,1,1448889046,1,2,3),(53,156,1,1,0,'description',0,4,52,2,1448889046,1,3,3),(54,156,1,1,0,'description',0,40,53,3,1448889046,1,4,3),(55,156,1,1,0,'description',0,24,54,4,1448889046,1,40,3),(56,156,1,1,0,'description',0,41,55,40,1448889046,1,24,3),(57,156,1,1,0,'description',0,42,56,24,1448889046,1,41,3),(58,156,1,1,0,'description',0,3,57,41,1448889046,1,42,3),(59,156,1,1,0,'description',0,4,58,42,1448889046,1,3,3),(60,156,1,1,0,'description',0,3,59,3,1448889046,1,4,3),(61,156,1,1,0,'description',0,4,60,4,1448889046,1,3,3),(62,156,1,1,0,'description',0,6,61,3,1448889046,1,4,3),(63,156,1,1,0,'description',0,7,62,4,1448889046,1,6,3),(64,156,1,1,0,'description',0,43,63,6,1448889046,1,7,3),(65,156,1,1,0,'description',0,44,64,7,1448889046,1,43,3),(66,156,1,1,0,'description',0,45,65,43,1448889046,1,44,3),(67,156,1,1,0,'description',0,46,66,44,1448889046,1,45,3),(68,156,1,1,0,'description',0,4,67,45,1448889046,1,46,3),(69,156,1,1,0,'description',0,26,68,46,1448889046,1,4,3),(70,156,1,1,0,'description',0,3,69,4,1448889046,1,26,3),(71,156,1,1,0,'description',0,47,70,26,1448889046,1,3,3),(72,156,1,1,0,'description',0,48,71,3,1448889046,1,47,3),(73,156,1,1,0,'description',0,7,72,47,1448889046,1,48,3),(74,156,1,1,0,'description',0,3,73,48,1448889046,1,7,3),(75,156,1,1,0,'description',0,49,74,7,1448889046,1,3,3),(76,156,1,1,0,'description',0,50,75,3,1448889046,1,49,3),(77,156,1,1,0,'description',0,3,76,49,1448889046,1,50,3),(78,156,1,1,0,'description',0,51,77,50,1448889046,1,3,3),(79,156,1,1,0,'description',0,52,78,3,1448889046,1,51,3),(80,156,1,1,0,'description',0,53,79,51,1448889046,1,52,3),(81,156,1,1,0,'description',0,54,80,52,1448889046,1,53,3),(82,156,1,1,0,'description',0,55,81,53,1448889046,1,54,3),(83,156,1,1,0,'description',0,56,82,54,1448889046,1,55,3),(84,156,1,1,0,'description',0,57,83,55,1448889046,1,56,3),(85,156,1,1,0,'description',0,38,84,56,1448889046,1,57,3),(86,156,1,1,0,'description',0,58,85,57,1448889046,1,38,3),(87,156,1,1,0,'description',0,7,86,38,1448889046,1,58,3),(88,156,1,1,0,'description',0,59,87,58,1448889046,1,7,3),(89,156,1,1,0,'description',0,60,88,7,1448889046,1,59,3),(90,156,1,1,0,'description',0,61,89,59,1448889046,1,60,3),(91,156,1,1,0,'description',0,62,90,60,1448889046,1,61,3),(92,156,1,1,0,'description',0,28,91,61,1448889046,1,62,3),(93,156,1,1,0,'description',0,3,92,62,1448889046,1,28,3),(94,156,1,1,0,'description',0,4,93,28,1448889046,1,3,3),(95,156,1,1,0,'description',0,48,94,3,1448889046,1,4,3),(96,156,1,1,0,'description',0,3,95,4,1448889046,1,48,3),(97,156,1,1,0,'description',0,63,96,48,1448889046,1,3,3),(98,156,1,1,0,'description',0,64,97,3,1448889046,1,63,3),(99,156,1,1,0,'description',0,65,98,63,1448889046,1,64,3),(100,156,1,1,0,'description',0,28,99,64,1448889046,1,65,3),(101,156,1,1,0,'description',0,3,100,65,1448889046,1,28,3),(102,156,1,1,0,'description',0,4,101,28,1448889046,1,3,3),(103,156,1,1,0,'description',0,3,102,3,1448889046,1,4,3),(104,156,1,1,0,'description',0,4,103,4,1448889046,1,3,3),(105,156,1,1,0,'description',0,66,104,3,1448889046,1,4,3),(106,156,1,1,0,'description',0,67,105,4,1448889046,1,66,3),(107,156,1,1,0,'description',0,68,106,66,1448889046,1,67,3),(108,156,1,1,0,'description',0,69,107,67,1448889046,1,68,3),(109,156,1,1,0,'description',0,70,108,68,1448889046,1,69,3),(110,156,1,1,0,'description',0,3,109,69,1448889046,1,70,3),(111,156,1,1,0,'description',0,4,110,70,1448889046,1,3,3),(112,156,1,1,0,'description',0,48,111,3,1448889046,1,4,3),(113,156,1,1,0,'description',0,3,112,4,1448889046,1,48,3),(114,156,1,1,0,'description',0,51,113,48,1448889046,1,3,3),(115,156,1,1,0,'description',0,4,114,3,1448889046,1,51,3),(116,156,1,1,0,'description',0,71,115,51,1448889046,1,4,3),(117,156,1,1,0,'description',0,2,116,4,1448889046,1,71,3),(118,156,1,1,0,'description',0,7,117,71,1448889046,1,2,3),(119,156,1,1,0,'description',0,72,118,2,1448889046,1,7,3),(120,156,1,1,0,'description',0,73,119,7,1448889046,1,72,3),(121,156,1,1,0,'description',0,7,120,72,1448889046,1,73,3),(122,156,1,1,0,'description',0,49,121,73,1448889046,1,7,3),(123,156,1,1,0,'description',0,74,122,7,1448889046,1,49,3),(124,156,1,1,0,'description',0,75,123,49,1448889046,1,74,3),(125,156,1,1,0,'description',0,76,124,74,1448889046,1,75,3),(126,156,1,1,0,'description',0,2,125,75,1448889046,1,76,3),(127,156,1,1,0,'description',0,7,126,76,1448889046,1,2,3),(128,156,1,1,0,'description',0,77,127,2,1448889046,1,7,3),(129,156,1,1,0,'description',0,78,128,7,1448889046,1,77,3),(130,156,1,1,0,'description',0,2,129,77,1448889046,1,78,3),(131,156,1,1,0,'description',0,7,130,78,1448889046,1,2,3),(132,156,1,1,0,'description',0,49,131,2,1448889046,1,7,3),(133,156,1,1,0,'description',0,79,132,7,1448889046,1,49,3),(134,156,1,1,0,'description',0,80,133,49,1448889046,1,79,3),(135,156,1,1,0,'description',0,81,134,79,1448889046,1,80,3),(136,156,1,1,0,'description',0,82,135,80,1448889046,1,81,3),(137,156,1,1,0,'description',0,7,136,81,1448889046,1,82,3),(138,156,1,1,0,'description',0,49,137,82,1448889046,1,7,3),(139,156,1,1,0,'description',0,83,138,7,1448889046,1,49,3),(140,156,1,1,0,'description',0,2,139,49,1448889046,1,83,3),(141,156,1,1,0,'description',0,84,140,83,1448889046,1,2,3),(142,156,1,1,0,'description',0,85,141,2,1448889046,1,84,3),(143,156,1,1,0,'description',0,86,142,84,1448889046,1,85,3),(144,156,1,1,0,'description',0,48,143,85,1448889046,1,86,3),(145,156,1,1,0,'description',0,87,144,86,1448889046,1,48,3),(146,156,1,1,0,'description',0,73,145,48,1448889046,1,87,3),(147,156,1,1,0,'description',0,7,146,87,1448889046,1,73,3),(148,156,1,1,0,'description',0,88,147,73,1448889046,1,7,3),(149,156,1,1,0,'description',0,79,148,7,1448889046,1,88,3),(150,156,1,1,0,'description',0,7,149,88,1448889046,1,79,3),(151,156,1,1,0,'description',0,3,150,79,1448889046,1,7,3),(152,156,1,1,0,'description',0,49,151,7,1448889046,1,3,3),(153,156,1,1,0,'description',0,89,152,3,1448889046,1,49,3),(154,156,1,1,0,'description',0,90,153,49,1448889046,1,89,3),(155,156,1,1,0,'description',0,91,154,89,1448889046,1,90,3),(156,156,1,1,0,'description',0,0,155,90,1448889046,1,91,3),(157,7,3,4,0,'description',0,93,0,0,1033917596,2,92,3),(158,7,3,4,0,'description',0,94,1,92,1033917596,2,93,3),(159,6,3,4,0,'name',0,0,2,93,1033917596,2,94,3),(160,8,4,10,0,'first_name',0,61,0,0,1033920665,2,95,3),(161,9,4,10,0,'last_name',0,0,1,95,1033920665,2,61,3),(162,6,3,11,0,'name',0,97,0,0,1033920746,2,96,3),(163,6,3,11,0,'name',0,0,1,96,1033920746,2,97,3),(164,6,3,12,0,'name',0,94,0,0,1033920775,2,98,3),(165,6,3,12,0,'name',0,0,1,98,1033920775,2,94,3),(166,6,3,13,0,'name',0,0,0,0,1033920794,2,99,3),(167,8,4,14,0,'first_name',0,61,0,0,1033920830,2,98,3),(168,9,4,14,0,'last_name',0,0,1,98,1033920830,2,61,3),(169,4,1,41,0,'name',0,0,0,0,1060695457,3,100,3),(170,6,3,42,0,'name',0,94,0,0,1072180330,2,95,3),(171,6,3,42,0,'name',0,61,1,95,1072180330,2,94,3),(172,7,3,42,0,'description',0,93,2,94,1072180330,2,61,3),(173,7,3,42,0,'description',0,28,3,61,1072180330,2,93,3),(174,7,3,42,0,'description',0,7,4,93,1072180330,2,28,3),(175,7,3,42,0,'description',0,95,5,28,1072180330,2,7,3),(176,7,3,42,0,'description',0,61,6,7,1072180330,2,95,3),(177,7,3,42,0,'description',0,0,7,95,1072180330,2,61,3),(178,4,1,49,0,'name',0,0,0,0,1080220197,3,101,3),(179,4,1,50,0,'name',0,0,0,0,1080220220,3,102,3),(180,4,1,51,0,'name',0,0,0,0,1080220233,3,103,3),(181,185,42,52,0,'name',0,104,0,0,1442481743,1,104,3),(182,186,42,52,0,'description',0,105,1,104,1442481743,1,104,3),(183,186,42,52,0,'description',0,0,2,104,1442481743,1,105,3),(184,4,1,53,0,'name',0,107,0,0,1486473151,3,106,3),(185,4,1,53,0,'name',0,106,1,106,1486473151,3,107,3),(186,155,1,53,0,'short_name',0,107,2,107,1486473151,3,106,3),(187,155,1,53,0,'short_name',0,108,3,106,1486473151,3,107,3),(188,119,1,53,0,'short_description',0,28,4,107,1486473151,3,108,3),(189,119,1,53,0,'short_description',0,109,5,108,1486473151,3,28,3),(190,119,1,53,0,'short_description',0,107,6,28,1486473151,3,109,3),(191,119,1,53,0,'short_description',0,0,7,109,1486473151,3,107,3),(192,4,1,54,0,'name',0,0,0,0,1537166893,6,110,2),(193,4,1,55,0,'name',0,112,0,0,1584828302,1,111,3),(194,4,1,55,0,'name',0,0,1,111,1584828302,1,112,3),(198,190,44,57,0,'title',0,116,0,0,1584829510,1,115,3),(199,190,44,57,0,'title',0,26,1,115,1584829510,1,116,3),(200,190,44,57,0,'title',0,117,2,116,1584829510,1,26,3),(201,190,44,57,0,'title',0,2,3,26,1584829510,1,117,3),(202,190,44,57,0,'title',0,118,4,117,1584829510,1,2,3),(203,190,44,57,0,'title',0,119,5,2,1584829510,1,118,3),(204,193,44,57,0,'difficulty',0,117,6,118,1584829510,1,119,3),(205,194,44,57,0,'starting_point',0,120,7,119,1584829510,1,117,3),(206,194,44,57,0,'starting_point',0,118,8,117,1584829510,1,120,3),(207,195,44,57,0,'ending_point',0,120,9,120,1584829510,1,118,3),(208,195,44,57,0,'ending_point',0,121,10,118,1584829510,1,120,3),(209,196,44,57,0,'length',54,122,11,120,1584829510,1,121,3),(210,197,44,57,0,'author',0,123,12,121,1584829510,1,122,3),(211,197,44,57,0,'author',0,0,13,122,1584829510,1,123,3),(1164,4,1,62,0,'name',0,17,0,0,1584829873,1,374,3),(1165,4,1,62,0,'name',0,375,1,374,1584829873,1,17,3),(1166,4,1,62,0,'name',0,0,2,17,1584829873,1,375,3),(1258,190,44,58,0,'title',0,394,0,0,1584829584,1,393,3),(1259,190,44,58,0,'title',0,17,1,393,1584829584,1,394,3),(1260,190,44,58,0,'title',0,7,2,394,1584829584,1,17,3),(1261,190,44,58,0,'title',0,395,3,17,1584829584,1,7,3),(1262,190,44,58,0,'title',0,59,4,7,1584829584,1,395,3),(1263,192,44,58,0,'description',0,79,5,395,1584829584,1,59,3),(1264,192,44,58,0,'description',0,7,6,59,1584829584,1,79,3),(1265,192,44,58,0,'description',0,138,7,79,1584829584,1,7,3),(1266,192,44,58,0,'description',0,17,8,7,1584829584,1,138,3),(1267,192,44,58,0,'description',0,7,9,138,1584829584,1,17,3),(1268,192,44,58,0,'description',0,395,10,17,1584829584,1,7,3),(1269,192,44,58,0,'description',0,139,11,7,1584829584,1,395,3),(1270,192,44,58,0,'description',0,26,12,395,1584829584,1,139,3),(1271,192,44,58,0,'description',0,396,13,139,1584829584,1,26,3),(1272,192,44,58,0,'description',0,48,14,26,1584829584,1,396,3),(1273,192,44,58,0,'description',0,397,15,396,1584829584,1,48,3),(1274,192,44,58,0,'description',0,142,16,48,1584829584,1,397,3),(1275,192,44,58,0,'description',0,398,17,397,1584829584,1,142,3),(1276,192,44,58,0,'description',0,5,18,142,1584829584,1,398,3),(1277,192,44,58,0,'description',0,144,19,398,1584829584,1,5,3),(1278,192,44,58,0,'description',0,145,20,5,1584829584,1,144,3),(1279,192,44,58,0,'description',0,399,21,144,1584829584,1,145,3),(1280,192,44,58,0,'description',0,147,22,145,1584829584,1,399,3),(1281,192,44,58,0,'description',0,148,23,399,1584829584,1,147,3),(1282,193,44,58,0,'difficulty',0,400,24,147,1584829584,1,148,3),(1283,194,44,58,0,'starting_point',0,401,25,148,1584829584,1,400,3),(1284,194,44,58,0,'starting_point',0,402,26,400,1584829584,1,401,3),(1285,194,44,58,0,'starting_point',0,398,27,401,1584829584,1,402,3),(1286,195,44,58,0,'ending_point',0,401,28,402,1584829584,1,398,3),(1287,195,44,58,0,'ending_point',0,402,29,398,1584829584,1,401,3),(1288,195,44,58,0,'ending_point',0,403,30,401,1584829584,1,402,3),(1289,196,44,58,0,'length',37,404,31,402,1584829584,1,403,3),(1290,197,44,58,0,'author',0,123,32,403,1584829584,1,404,3),(1291,197,44,58,0,'author',0,0,33,404,1584829584,1,123,3),(1292,190,44,61,0,'title',0,70,0,0,1584829820,1,405,3),(1293,190,44,61,0,'title',0,362,1,405,1584829820,1,70,3),(1294,190,44,61,0,'title',0,48,2,70,1584829820,1,362,3),(1295,190,44,61,0,'title',0,406,3,362,1584829820,1,48,3),(1296,190,44,61,0,'title',0,407,4,48,1584829820,1,406,3),(1297,190,44,61,0,'title',0,408,5,406,1584829820,1,407,3),(1298,190,44,61,0,'title',0,18,6,407,1584829820,1,408,3),(1299,192,44,61,0,'description',0,409,7,408,1584829820,1,18,3),(1300,192,44,61,0,'description',0,144,8,18,1584829820,1,409,3),(1301,192,44,61,0,'description',0,142,9,409,1584829820,1,144,3),(1302,192,44,61,0,'description',0,7,10,144,1584829820,1,142,3),(1303,192,44,61,0,'description',0,410,11,142,1584829820,1,7,3),(1304,192,44,61,0,'description',0,186,12,7,1584829820,1,410,3),(1305,192,44,61,0,'description',0,17,13,410,1584829820,1,186,3),(1306,192,44,61,0,'description',0,169,14,186,1584829820,1,17,3),(1307,192,44,61,0,'description',0,142,15,17,1584829820,1,169,3),(1308,192,44,61,0,'description',0,7,16,169,1584829820,1,142,3),(1309,192,44,61,0,'description',0,411,17,142,1584829820,1,7,3),(1310,192,44,61,0,'description',0,17,18,7,1584829820,1,411,3),(1311,192,44,61,0,'description',0,7,19,411,1584829820,1,17,3),(1312,192,44,61,0,'description',0,412,20,17,1584829820,1,7,3),(1313,192,44,61,0,'description',0,413,21,7,1584829820,1,412,3),(1314,192,44,61,0,'description',0,414,22,412,1584829820,1,413,3),(1315,192,44,61,0,'description',0,119,23,413,1584829820,1,414,3),(1316,193,44,61,0,'difficulty',0,362,24,414,1584829820,1,119,3),(1317,194,44,61,0,'starting_point',0,169,25,119,1584829820,1,362,3),(1318,194,44,61,0,'starting_point',0,406,26,362,1584829820,1,169,3),(1319,195,44,61,0,'ending_point',0,407,27,169,1584829820,1,406,3),(1320,195,44,61,0,'ending_point',0,408,28,406,1584829820,1,407,3),(1321,195,44,61,0,'ending_point',0,169,29,407,1584829820,1,408,3),(1322,195,44,61,0,'ending_point',0,415,30,408,1584829820,1,169,3),(1323,196,44,61,0,'length',19,416,31,169,1584829820,1,415,3),(1324,197,44,61,0,'author',0,123,32,415,1584829820,1,416,3),(1325,197,44,61,0,'author',0,0,33,416,1584829820,1,123,3),(1326,190,44,59,0,'title',0,418,0,0,1584829676,1,417,3),(1327,190,44,59,0,'title',0,419,1,417,1584829676,1,418,3),(1328,190,44,59,0,'title',0,5,2,418,1584829676,1,419,3),(1329,192,44,59,0,'description',0,144,3,419,1584829676,1,5,3),(1330,192,44,59,0,'description',0,142,4,5,1584829676,1,144,3),(1331,192,44,59,0,'description',0,7,5,144,1584829676,1,142,3),(1332,192,44,59,0,'description',0,157,6,142,1584829676,1,7,3),(1333,192,44,59,0,'description',0,145,7,7,1584829676,1,157,3),(1334,192,44,59,0,'description',0,420,8,157,1584829676,1,145,3),(1335,192,44,59,0,'description',0,48,9,145,1584829676,1,420,3),(1336,192,44,59,0,'description',0,421,10,420,1584829676,1,48,3),(1337,192,44,59,0,'description',0,422,11,48,1584829676,1,421,3),(1338,192,44,59,0,'description',0,161,12,421,1584829676,1,422,3),(1339,192,44,59,0,'description',0,28,13,422,1584829676,1,161,3),(1340,192,44,59,0,'description',0,423,14,161,1584829676,1,28,3),(1341,192,44,59,0,'description',0,424,15,28,1584829676,1,423,3),(1342,192,44,59,0,'description',0,425,16,423,1584829676,1,424,3),(1343,192,44,59,0,'description',0,14,17,424,1584829676,1,425,3),(1344,192,44,59,0,'description',0,426,18,425,1584829676,1,14,3),(1345,192,44,59,0,'description',0,48,19,14,1584829676,1,426,3),(1346,192,44,59,0,'description',0,18,20,426,1584829676,1,48,3),(1347,192,44,59,0,'description',0,427,21,48,1584829676,1,18,3),(1348,192,44,59,0,'description',0,2,22,18,1584829676,1,427,3),(1349,192,44,59,0,'description',0,167,23,427,1584829676,1,2,3),(1350,192,44,59,0,'description',0,7,24,2,1584829676,1,167,3),(1351,192,44,59,0,'description',0,147,25,167,1584829676,1,7,3),(1352,192,44,59,0,'description',0,428,26,7,1584829676,1,147,3),(1353,193,44,59,0,'difficulty',0,417,27,147,1584829676,1,428,3),(1354,194,44,59,0,'starting_point',0,169,28,428,1584829676,1,417,3),(1355,194,44,59,0,'starting_point',0,429,29,417,1584829676,1,169,3),(1356,195,44,59,0,'ending_point',0,169,30,169,1584829676,1,429,3),(1357,195,44,59,0,'ending_point',0,430,31,429,1584829676,1,169,3),(1358,196,44,59,0,'length',18,431,32,169,1584829676,1,430,3),(1359,197,44,59,0,'author',0,123,33,430,1584829676,1,431,3),(1360,197,44,59,0,'author',0,0,34,431,1584829676,1,123,3),(1361,190,44,60,0,'title',0,142,0,0,1584829744,1,432,3),(1362,190,44,60,0,'title',0,433,1,432,1584829744,1,142,3),(1363,190,44,60,0,'title',0,432,2,142,1584829744,1,433,3),(1364,192,44,60,0,'description',0,6,3,433,1584829744,1,432,3),(1365,192,44,60,0,'description',0,7,4,432,1584829744,1,6,3),(1366,192,44,60,0,'description',0,434,5,6,1584829744,1,7,3),(1367,192,44,60,0,'description',0,435,6,7,1584829744,1,434,3),(1368,192,44,60,0,'description',0,436,7,434,1584829744,1,435,3),(1369,192,44,60,0,'description',0,437,8,435,1584829744,1,436,3),(1370,192,44,60,0,'description',0,438,9,436,1584829744,1,437,3),(1371,192,44,60,0,'description',0,439,10,437,1584829744,1,438,3),(1372,192,44,60,0,'description',0,7,11,438,1584829744,1,439,3),(1373,192,44,60,0,'description',0,440,12,439,1584829744,1,7,3),(1374,192,44,60,0,'description',0,441,13,7,1584829744,1,440,3),(1375,192,44,60,0,'description',0,442,14,440,1584829744,1,441,3),(1376,192,44,60,0,'description',0,443,15,441,1584829744,1,442,3),(1377,192,44,60,0,'description',0,7,16,442,1584829744,1,443,3),(1378,192,44,60,0,'description',0,444,17,443,1584829744,1,7,3),(1379,192,44,60,0,'description',0,186,18,7,1584829744,1,444,3),(1380,192,44,60,0,'description',0,17,19,444,1584829744,1,186,3),(1381,192,44,60,0,'description',0,7,20,186,1584829744,1,17,3),(1382,192,44,60,0,'description',0,445,21,17,1584829744,1,7,3),(1383,192,44,60,0,'description',0,446,22,7,1584829744,1,445,3),(1384,192,44,60,0,'description',0,7,23,445,1584829744,1,446,3),(1385,192,44,60,0,'description',0,189,24,446,1584829744,1,7,3),(1386,192,44,60,0,'description',0,70,25,7,1584829744,1,189,3),(1387,192,44,60,0,'description',0,447,26,189,1584829744,1,70,3),(1388,192,44,60,0,'description',0,48,27,70,1584829744,1,447,3),(1389,192,44,60,0,'description',0,448,28,447,1584829744,1,48,3),(1390,192,44,60,0,'description',0,449,29,48,1584829744,1,448,3),(1391,192,44,60,0,'description',0,450,30,448,1584829744,1,449,3),(1392,192,44,60,0,'description',0,12,31,449,1584829744,1,450,3),(1393,192,44,60,0,'description',0,13,32,450,1584829744,1,12,3),(1394,192,44,60,0,'description',0,451,33,12,1584829744,1,13,3),(1395,192,44,60,0,'description',0,452,34,13,1584829744,1,451,3),(1396,192,44,60,0,'description',0,28,35,451,1584829744,1,452,3),(1397,192,44,60,0,'description',0,445,36,452,1584829744,1,28,3),(1398,192,44,60,0,'description',0,453,37,28,1584829744,1,445,3),(1399,192,44,60,0,'description',0,454,38,445,1584829744,1,453,3),(1400,192,44,60,0,'description',0,12,39,453,1584829744,1,454,3),(1401,192,44,60,0,'description',0,13,40,454,1584829744,1,12,3),(1402,192,44,60,0,'description',0,455,41,12,1584829744,1,13,3),(1403,192,44,60,0,'description',0,456,42,13,1584829744,1,455,3),(1404,192,44,60,0,'description',0,11,43,455,1584829744,1,456,3),(1405,192,44,60,0,'description',0,457,44,456,1584829744,1,11,3),(1406,192,44,60,0,'description',0,142,45,11,1584829744,1,457,3),(1407,192,44,60,0,'description',0,7,46,457,1584829744,1,142,3),(1408,192,44,60,0,'description',0,201,47,142,1584829744,1,7,3),(1409,192,44,60,0,'description',0,458,48,7,1584829744,1,201,3),(1410,192,44,60,0,'description',0,6,49,201,1584829744,1,458,3),(1411,192,44,60,0,'description',0,459,50,458,1584829744,1,6,3),(1412,192,44,60,0,'description',0,460,51,6,1584829744,1,459,3),(1413,192,44,60,0,'description',0,461,52,459,1584829744,1,460,3),(1414,192,44,60,0,'description',0,462,53,460,1584829744,1,461,3),(1415,192,44,60,0,'description',0,439,54,461,1584829744,1,462,3),(1416,192,44,60,0,'description',0,41,55,462,1584829744,1,439,3),(1417,192,44,60,0,'description',0,14,56,439,1584829744,1,41,3),(1418,192,44,60,0,'description',0,463,57,41,1584829744,1,14,3),(1419,192,44,60,0,'description',0,464,58,14,1584829744,1,463,3),(1420,192,44,60,0,'description',0,12,59,463,1584829744,1,464,3),(1421,192,44,60,0,'description',0,13,60,464,1584829744,1,12,3),(1422,192,44,60,0,'description',0,14,61,12,1584829744,1,13,3),(1423,192,44,60,0,'description',0,465,62,13,1584829744,1,14,3),(1424,192,44,60,0,'description',0,435,63,14,1584829744,1,465,3),(1425,192,44,60,0,'description',0,466,64,465,1584829744,1,435,3),(1426,192,44,60,0,'description',0,26,65,435,1584829744,1,466,3),(1427,192,44,60,0,'description',0,467,66,466,1584829744,1,26,3),(1428,192,44,60,0,'description',0,142,67,26,1584829744,1,467,3),(1429,192,44,60,0,'description',0,7,68,467,1584829744,1,142,3),(1430,192,44,60,0,'description',0,468,69,142,1584829744,1,7,3),(1431,192,44,60,0,'description',0,2,70,7,1584829744,1,468,3),(1432,192,44,60,0,'description',0,469,71,468,1584829744,1,2,3),(1433,192,44,60,0,'description',0,142,72,2,1584829744,1,469,3),(1434,192,44,60,0,'description',0,7,73,469,1584829744,1,142,3),(1435,192,44,60,0,'description',0,470,74,142,1584829744,1,7,3),(1436,192,44,60,0,'description',0,48,75,7,1584829744,1,470,3),(1437,192,44,60,0,'description',0,471,76,470,1584829744,1,48,3),(1438,192,44,60,0,'description',0,12,77,48,1584829744,1,471,3),(1439,192,44,60,0,'description',0,472,78,471,1584829744,1,12,3),(1440,192,44,60,0,'description',0,473,79,12,1584829744,1,472,3),(1441,192,44,60,0,'description',0,474,80,472,1584829744,1,473,3),(1442,192,44,60,0,'description',0,475,81,473,1584829744,1,474,3),(1443,192,44,60,0,'description',0,2,82,474,1584829744,1,475,3),(1444,192,44,60,0,'description',0,476,83,475,1584829744,1,2,3),(1445,192,44,60,0,'description',0,439,84,2,1584829744,1,476,3),(1446,192,44,60,0,'description',0,7,85,476,1584829744,1,439,3),(1447,192,44,60,0,'description',0,477,86,439,1584829744,1,7,3),(1448,192,44,60,0,'description',0,478,87,7,1584829744,1,477,3),(1449,192,44,60,0,'description',0,7,88,477,1584829744,1,478,3),(1450,192,44,60,0,'description',0,479,89,478,1584829744,1,7,3),(1451,192,44,60,0,'description',0,2,90,7,1584829744,1,479,3),(1452,192,44,60,0,'description',0,480,91,479,1584829744,1,2,3),(1453,192,44,60,0,'description',0,7,92,2,1584829744,1,480,3),(1454,192,44,60,0,'description',0,481,93,480,1584829744,1,7,3),(1455,192,44,60,0,'description',0,482,94,7,1584829744,1,481,3),(1456,192,44,60,0,'description',0,6,95,481,1584829744,1,482,3),(1457,192,44,60,0,'description',0,483,96,482,1584829744,1,6,3),(1458,192,44,60,0,'description',0,484,97,6,1584829744,1,483,3),(1459,192,44,60,0,'description',0,460,98,483,1584829744,1,484,3),(1460,192,44,60,0,'description',0,485,99,484,1584829744,1,460,3),(1461,192,44,60,0,'description',0,14,100,460,1584829744,1,485,3),(1462,192,44,60,0,'description',0,486,101,485,1584829744,1,14,3),(1463,192,44,60,0,'description',0,138,102,14,1584829744,1,486,3),(1464,192,44,60,0,'description',0,26,103,486,1584829744,1,138,3),(1465,192,44,60,0,'description',0,467,104,138,1584829744,1,26,3),(1466,192,44,60,0,'description',0,487,105,26,1584829744,1,467,3),(1467,192,44,60,0,'description',0,488,106,467,1584829744,1,487,3),(1468,192,44,60,0,'description',0,489,107,487,1584829744,1,488,3),(1469,192,44,60,0,'description',0,14,108,488,1584829744,1,489,3),(1470,192,44,60,0,'description',0,13,109,489,1584829744,1,14,3),(1471,192,44,60,0,'description',0,490,110,14,1584829744,1,13,3),(1472,192,44,60,0,'description',0,491,111,13,1584829744,1,490,3),(1473,192,44,60,0,'description',0,2,112,490,1584829744,1,491,3),(1474,192,44,60,0,'description',0,492,113,491,1584829744,1,2,3),(1475,192,44,60,0,'description',0,487,114,2,1584829744,1,492,3),(1476,192,44,60,0,'description',0,493,115,492,1584829744,1,487,3),(1477,192,44,60,0,'description',0,494,116,487,1584829744,1,493,3),(1478,192,44,60,0,'description',0,12,117,493,1584829744,1,494,3),(1479,192,44,60,0,'description',0,13,118,494,1584829744,1,12,3),(1480,192,44,60,0,'description',0,41,119,12,1584829744,1,13,3),(1481,192,44,60,0,'description',0,495,120,13,1584829744,1,41,3),(1482,192,44,60,0,'description',0,484,121,41,1584829744,1,495,3),(1483,192,44,60,0,'description',0,48,122,495,1584829744,1,484,3),(1484,192,44,60,0,'description',0,7,123,484,1584829744,1,48,3),(1485,192,44,60,0,'description',0,496,124,48,1584829744,1,7,3),(1486,192,44,60,0,'description',0,497,125,7,1584829744,1,496,3),(1487,192,44,60,0,'description',0,6,126,496,1584829744,1,497,3),(1488,192,44,60,0,'description',0,111,127,497,1584829744,1,6,3),(1489,192,44,60,0,'description',0,498,128,6,1584829744,1,111,3),(1490,192,44,60,0,'description',0,17,129,111,1584829744,1,498,3),(1491,192,44,60,0,'description',0,499,130,498,1584829744,1,17,3),(1492,192,44,60,0,'description',0,5,131,17,1584829744,1,499,3),(1493,192,44,60,0,'description',0,6,132,499,1584829744,1,5,3),(1494,192,44,60,0,'description',0,14,133,5,1584829744,1,6,3),(1495,192,44,60,0,'description',0,500,134,6,1584829744,1,14,3),(1496,192,44,60,0,'description',0,501,135,14,1584829744,1,500,3),(1497,192,44,60,0,'description',0,144,136,500,1584829744,1,501,3),(1498,192,44,60,0,'description',0,502,137,501,1584829744,1,144,3),(1499,192,44,60,0,'description',0,12,138,144,1584829744,1,502,3),(1500,192,44,60,0,'description',0,13,139,502,1584829744,1,12,3),(1501,192,44,60,0,'description',0,111,140,12,1584829744,1,13,3),(1502,192,44,60,0,'description',0,503,141,13,1584829744,1,111,3),(1503,192,44,60,0,'description',0,504,142,111,1584829744,1,503,3),(1504,192,44,60,0,'description',0,7,143,503,1584829744,1,504,3),(1505,192,44,60,0,'description',0,505,144,504,1584829744,1,7,3),(1506,192,44,60,0,'description',0,79,145,7,1584829744,1,505,3),(1507,192,44,60,0,'description',0,506,146,505,1584829744,1,79,3),(1508,192,44,60,0,'description',0,507,147,79,1584829744,1,506,3),(1509,192,44,60,0,'description',0,24,148,506,1584829744,1,507,3),(1510,192,44,60,0,'description',0,508,149,507,1584829744,1,24,3),(1511,192,44,60,0,'description',0,253,150,24,1584829744,1,508,3),(1512,192,44,60,0,'description',0,509,151,508,1584829744,1,253,3),(1513,192,44,60,0,'description',0,510,152,253,1584829744,1,509,3),(1514,192,44,60,0,'description',0,142,153,509,1584829744,1,510,3),(1515,192,44,60,0,'description',0,511,154,510,1584829744,1,142,3),(1516,192,44,60,0,'description',0,512,155,142,1584829744,1,511,3),(1517,192,44,60,0,'description',0,460,156,511,1584829744,1,512,3),(1518,192,44,60,0,'description',0,513,157,512,1584829744,1,460,3),(1519,192,44,60,0,'description',0,48,158,460,1584829744,1,513,3),(1520,192,44,60,0,'description',0,514,159,513,1584829744,1,48,3),(1521,192,44,60,0,'description',0,515,160,48,1584829744,1,514,3),(1522,192,44,60,0,'description',0,28,161,514,1584829744,1,515,3),(1523,192,44,60,0,'description',0,516,162,515,1584829744,1,28,3),(1524,192,44,60,0,'description',0,517,163,28,1584829744,1,516,3),(1525,192,44,60,0,'description',0,48,164,516,1584829744,1,517,3),(1526,192,44,60,0,'description',0,518,165,517,1584829744,1,48,3),(1527,192,44,60,0,'description',0,454,166,48,1584829744,1,518,3),(1528,192,44,60,0,'description',0,460,167,518,1584829744,1,454,3),(1529,192,44,60,0,'description',0,461,168,454,1584829744,1,460,3),(1530,192,44,60,0,'description',0,519,169,460,1584829744,1,461,3),(1531,192,44,60,0,'description',0,139,170,461,1584829744,1,519,3),(1532,192,44,60,0,'description',0,487,171,519,1584829744,1,139,3),(1533,192,44,60,0,'description',0,467,172,139,1584829744,1,487,3),(1534,192,44,60,0,'description',0,11,173,487,1584829744,1,467,3),(1535,192,44,60,0,'description',0,14,174,467,1584829744,1,11,3),(1536,192,44,60,0,'description',0,520,175,11,1584829744,1,14,3),(1537,192,44,60,0,'description',0,521,176,14,1584829744,1,520,3),(1538,192,44,60,0,'description',0,522,177,520,1584829744,1,521,3),(1539,192,44,60,0,'description',0,48,178,521,1584829744,1,522,3),(1540,192,44,60,0,'description',0,523,179,522,1584829744,1,48,3),(1541,192,44,60,0,'description',0,524,180,48,1584829744,1,523,3),(1542,192,44,60,0,'description',0,516,181,523,1584829744,1,524,3),(1543,192,44,60,0,'description',0,12,182,524,1584829744,1,516,3),(1544,192,44,60,0,'description',0,461,183,516,1584829744,1,12,3),(1545,192,44,60,0,'description',0,525,184,12,1584829744,1,461,3),(1546,192,44,60,0,'description',0,526,185,461,1584829744,1,525,3),(1547,192,44,60,0,'description',0,2,186,525,1584829744,1,526,3),(1548,192,44,60,0,'description',0,144,187,526,1584829744,1,2,3),(1549,192,44,60,0,'description',0,142,188,2,1584829744,1,144,3),(1550,192,44,60,0,'description',0,527,189,144,1584829744,1,142,3),(1551,192,44,60,0,'description',0,48,190,142,1584829744,1,527,3),(1552,192,44,60,0,'description',0,528,191,527,1584829744,1,48,3),(1553,192,44,60,0,'description',0,529,192,48,1584829744,1,528,3),(1554,192,44,60,0,'description',0,111,193,528,1584829744,1,529,3),(1555,192,44,60,0,'description',0,7,194,529,1584829744,1,111,3),(1556,192,44,60,0,'description',0,474,195,111,1584829744,1,7,3),(1557,192,44,60,0,'description',0,491,196,7,1584829744,1,474,3),(1558,192,44,60,0,'description',0,2,197,474,1584829744,1,491,3),(1559,192,44,60,0,'description',0,492,198,491,1584829744,1,2,3),(1560,192,44,60,0,'description',0,512,199,2,1584829744,1,492,3),(1561,192,44,60,0,'description',0,530,200,492,1584829744,1,512,3),(1562,192,44,60,0,'description',0,512,201,512,1584829744,1,530,3),(1563,192,44,60,0,'description',0,7,202,530,1584829744,1,512,3),(1564,192,44,60,0,'description',0,531,203,512,1584829744,1,7,3),(1565,192,44,60,0,'description',0,532,204,7,1584829744,1,531,3),(1566,192,44,60,0,'description',0,533,205,531,1584829744,1,532,3),(1567,192,44,60,0,'description',0,514,206,532,1584829744,1,533,3),(1568,192,44,60,0,'description',0,7,207,533,1584829744,1,514,3),(1569,192,44,60,0,'description',0,501,208,514,1584829744,1,7,3),(1570,192,44,60,0,'description',0,534,209,7,1584829744,1,501,3),(1571,192,44,60,0,'description',0,533,210,501,1584829744,1,534,3),(1572,192,44,60,0,'description',0,514,211,534,1584829744,1,533,3),(1573,192,44,60,0,'description',0,535,212,533,1584829744,1,514,3),(1574,192,44,60,0,'description',0,536,213,514,1584829744,1,535,3),(1575,192,44,60,0,'description',0,512,214,535,1584829744,1,536,3),(1576,192,44,60,0,'description',0,12,215,536,1584829744,1,512,3),(1577,192,44,60,0,'description',0,6,216,512,1584829744,1,12,3),(1578,192,44,60,0,'description',0,537,217,12,1584829744,1,6,3),(1579,192,44,60,0,'description',0,7,218,6,1584829744,1,537,3),(1580,192,44,60,0,'description',0,435,219,537,1584829744,1,7,3),(1581,192,44,60,0,'description',0,461,220,7,1584829744,1,435,3),(1582,192,44,60,0,'description',0,538,221,435,1584829744,1,461,3),(1583,192,44,60,0,'description',0,539,222,461,1584829744,1,538,3),(1584,192,44,60,0,'description',0,41,223,538,1584829744,1,539,3),(1585,192,44,60,0,'description',0,14,224,539,1584829744,1,41,3),(1586,192,44,60,0,'description',0,540,225,41,1584829744,1,14,3),(1587,192,44,60,0,'description',0,541,226,14,1584829744,1,540,3),(1588,192,44,60,0,'description',0,542,227,540,1584829744,1,541,3),(1589,192,44,60,0,'description',0,530,228,541,1584829744,1,542,3),(1590,192,44,60,0,'description',0,34,229,542,1584829744,1,530,3),(1591,192,44,60,0,'description',0,543,230,530,1584829744,1,34,3),(1592,192,44,60,0,'description',0,454,231,34,1584829744,1,543,3),(1593,192,44,60,0,'description',0,544,232,543,1584829744,1,454,3),(1594,192,44,60,0,'description',0,502,233,454,1584829744,1,544,3),(1595,192,44,60,0,'description',0,545,234,544,1584829744,1,502,3),(1596,192,44,60,0,'description',0,460,235,502,1584829744,1,545,3),(1597,192,44,60,0,'description',0,546,236,545,1584829744,1,460,3),(1598,192,44,60,0,'description',0,2,237,460,1584829744,1,546,3),(1599,192,44,60,0,'description',0,547,238,546,1584829744,1,2,3),(1600,192,44,60,0,'description',0,548,239,2,1584829744,1,547,3),(1601,192,44,60,0,'description',0,549,240,547,1584829744,1,548,3),(1602,192,44,60,0,'description',0,550,241,548,1584829744,1,549,3),(1603,192,44,60,0,'description',0,551,242,549,1584829744,1,550,3),(1604,192,44,60,0,'description',0,491,243,550,1584829744,1,551,3),(1605,192,44,60,0,'description',0,548,244,551,1584829744,1,491,3),(1606,192,44,60,0,'description',0,502,245,491,1584829744,1,548,3),(1607,192,44,60,0,'description',0,460,246,548,1584829744,1,502,3),(1608,192,44,60,0,'description',0,552,247,502,1584829744,1,460,3),(1609,192,44,60,0,'description',0,167,248,460,1584829744,1,552,3),(1610,192,44,60,0,'description',0,553,249,552,1584829744,1,167,3),(1611,192,44,60,0,'description',0,501,250,167,1584829744,1,553,3),(1612,192,44,60,0,'description',0,147,251,553,1584829744,1,501,3),(1613,192,44,60,0,'description',0,111,252,501,1584829744,1,147,3),(1614,192,44,60,0,'description',0,7,253,147,1584829744,1,111,3),(1615,192,44,60,0,'description',0,474,254,111,1584829744,1,7,3),(1616,192,44,60,0,'description',0,142,255,7,1584829744,1,474,3),(1617,192,44,60,0,'description',0,14,256,474,1584829744,1,142,3),(1618,192,44,60,0,'description',0,540,257,142,1584829744,1,14,3),(1619,192,44,60,0,'description',0,541,258,14,1584829744,1,540,3),(1620,192,44,60,0,'description',0,7,259,540,1584829744,1,541,3),(1621,192,44,60,0,'description',0,435,260,541,1584829744,1,7,3),(1622,192,44,60,0,'description',0,461,261,7,1584829744,1,435,3),(1623,192,44,60,0,'description',0,554,262,435,1584829744,1,461,3),(1624,192,44,60,0,'description',0,555,263,461,1584829744,1,554,3),(1625,192,44,60,0,'description',0,556,264,554,1584829744,1,555,3),(1626,192,44,60,0,'description',0,17,265,555,1584829744,1,556,3),(1627,192,44,60,0,'description',0,557,266,556,1584829744,1,17,3),(1628,192,44,60,0,'description',0,509,267,17,1584829744,1,557,3),(1629,192,44,60,0,'description',0,558,268,557,1584829744,1,509,3),(1630,192,44,60,0,'description',0,559,269,509,1584829744,1,558,3),(1631,192,44,60,0,'description',0,560,270,558,1584829744,1,559,3),(1632,192,44,60,0,'description',0,2,271,559,1584829744,1,560,3),(1633,192,44,60,0,'description',0,12,272,560,1584829744,1,2,3),(1634,192,44,60,0,'description',0,511,273,2,1584829744,1,12,3),(1635,192,44,60,0,'description',0,6,274,12,1584829744,1,511,3),(1636,192,44,60,0,'description',0,561,275,511,1584829744,1,6,3),(1637,192,44,60,0,'description',0,562,276,6,1584829744,1,561,3),(1638,192,44,60,0,'description',0,563,277,561,1584829744,1,562,3),(1639,192,44,60,0,'description',0,564,278,562,1584829744,1,563,3),(1640,192,44,60,0,'description',0,142,279,563,1584829744,1,564,3),(1641,192,44,60,0,'description',0,565,280,564,1584829744,1,142,3),(1642,192,44,60,0,'description',0,566,281,142,1584829744,1,565,3),(1643,192,44,60,0,'description',0,548,282,565,1584829744,1,566,3),(1644,192,44,60,0,'description',0,6,283,566,1584829744,1,548,3),(1645,192,44,60,0,'description',0,567,284,548,1584829744,1,6,3),(1646,192,44,60,0,'description',0,509,285,6,1584829744,1,567,3),(1647,192,44,60,0,'description',0,28,286,567,1584829744,1,509,3),(1648,192,44,60,0,'description',0,568,287,509,1584829744,1,28,3),(1649,192,44,60,0,'description',0,186,288,28,1584829744,1,568,3),(1650,192,44,60,0,'description',0,17,289,568,1584829744,1,186,3),(1651,192,44,60,0,'description',0,7,290,186,1584829744,1,17,3),(1652,192,44,60,0,'description',0,474,291,17,1584829744,1,7,3),(1653,192,44,60,0,'description',0,7,292,7,1584829744,1,474,3),(1654,192,44,60,0,'description',0,445,293,474,1584829744,1,7,3),(1655,192,44,60,0,'description',0,6,294,7,1584829744,1,445,3),(1656,192,44,60,0,'description',0,564,295,445,1584829744,1,6,3),(1657,192,44,60,0,'description',0,569,296,6,1584829744,1,564,3),(1658,192,44,60,0,'description',0,570,297,564,1584829744,1,569,3),(1659,192,44,60,0,'description',0,571,298,569,1584829744,1,570,3),(1660,192,44,60,0,'description',0,454,299,570,1584829744,1,571,3),(1661,192,44,60,0,'description',0,24,300,571,1584829744,1,454,3),(1662,192,44,60,0,'description',0,533,301,454,1584829744,1,24,3),(1663,192,44,60,0,'description',0,253,302,24,1584829744,1,533,3),(1664,192,44,60,0,'description',0,12,303,533,1584829744,1,253,3),(1665,192,44,60,0,'description',0,142,304,253,1584829744,1,12,3),(1666,192,44,60,0,'description',0,7,305,12,1584829744,1,142,3),(1667,192,44,60,0,'description',0,572,306,142,1584829744,1,7,3),(1668,192,44,60,0,'description',0,48,307,7,1584829744,1,572,3),(1669,192,44,60,0,'description',0,573,308,572,1584829744,1,48,3),(1670,192,44,60,0,'description',0,7,309,48,1584829744,1,573,3),(1671,192,44,60,0,'description',0,574,310,573,1584829744,1,7,3),(1672,192,44,60,0,'description',0,17,311,7,1584829744,1,574,3),(1673,192,44,60,0,'description',0,7,312,574,1584829744,1,17,3),(1674,192,44,60,0,'description',0,575,313,17,1584829744,1,7,3),(1675,192,44,60,0,'description',0,576,314,7,1584829744,1,575,3),(1676,192,44,60,0,'description',0,577,315,575,1584829744,1,576,3),(1677,192,44,60,0,'description',0,487,316,576,1584829744,1,577,3),(1678,192,44,60,0,'description',0,492,317,577,1584829744,1,487,3),(1679,192,44,60,0,'description',0,445,318,487,1584829744,1,492,3),(1680,192,44,60,0,'description',0,578,319,492,1584829744,1,445,3),(1681,192,44,60,0,'description',0,548,320,445,1584829744,1,578,3),(1682,192,44,60,0,'description',0,461,321,578,1584829744,1,548,3),(1683,192,44,60,0,'description',0,14,322,548,1584829744,1,461,3),(1684,192,44,60,0,'description',0,579,323,461,1584829744,1,14,3),(1685,192,44,60,0,'description',0,48,324,14,1584829744,1,579,3),(1686,192,44,60,0,'description',0,580,325,579,1584829744,1,48,3),(1687,192,44,60,0,'description',0,48,326,48,1584829744,1,580,3),(1688,192,44,60,0,'description',0,581,327,580,1584829744,1,48,3),(1689,192,44,60,0,'description',0,582,328,48,1584829744,1,581,3),(1690,192,44,60,0,'description',0,583,329,581,1584829744,1,582,3),(1691,192,44,60,0,'description',0,460,330,582,1584829744,1,583,3),(1692,192,44,60,0,'description',0,552,331,583,1584829744,1,460,3),(1693,192,44,60,0,'description',0,167,332,460,1584829744,1,552,3),(1694,192,44,60,0,'description',0,14,333,552,1584829744,1,167,3),(1695,192,44,60,0,'description',0,584,334,167,1584829744,1,14,3),(1696,192,44,60,0,'description',0,585,335,14,1584829744,1,584,3),(1697,192,44,60,0,'description',0,48,336,584,1584829744,1,585,3),(1698,192,44,60,0,'description',0,586,337,585,1584829744,1,48,3),(1699,192,44,60,0,'description',0,11,338,48,1584829744,1,586,3),(1700,192,44,60,0,'description',0,479,339,586,1584829744,1,11,3),(1701,192,44,60,0,'description',0,587,340,11,1584829744,1,479,3),(1702,192,44,60,0,'description',0,588,341,479,1584829744,1,587,3),(1703,192,44,60,0,'description',0,589,342,587,1584829744,1,588,3),(1704,192,44,60,0,'description',0,590,343,588,1584829744,1,589,3),(1705,192,44,60,0,'description',0,591,344,589,1584829744,1,590,3),(1706,192,44,60,0,'description',0,2,345,590,1584829744,1,591,3),(1707,192,44,60,0,'description',0,467,346,591,1584829744,1,2,3),(1708,192,44,60,0,'description',0,592,347,2,1584829744,1,467,3),(1709,192,44,60,0,'description',0,5,348,467,1584829744,1,592,3),(1710,192,44,60,0,'description',0,552,349,592,1584829744,1,5,3),(1711,192,44,60,0,'description',0,593,350,5,1584829744,1,552,3),(1712,192,44,60,0,'description',0,594,351,552,1584829744,1,593,3),(1713,192,44,60,0,'description',0,14,352,593,1584829744,1,594,3),(1714,192,44,60,0,'description',0,595,353,594,1584829744,1,14,3),(1715,192,44,60,0,'description',0,144,354,14,1584829744,1,595,3),(1716,192,44,60,0,'description',0,454,355,595,1584829744,1,144,3),(1717,192,44,60,0,'description',0,596,356,144,1584829744,1,454,3),(1718,192,44,60,0,'description',0,491,357,454,1584829744,1,596,3),(1719,192,44,60,0,'description',0,597,358,596,1584829744,1,491,3),(1720,192,44,60,0,'description',0,18,359,491,1584829744,1,597,3),(1721,192,44,60,0,'description',0,539,360,597,1584829744,1,18,3),(1722,192,44,60,0,'description',0,598,361,18,1584829744,1,539,3),(1723,192,44,60,0,'description',0,473,362,539,1584829744,1,598,3),(1724,192,44,60,0,'description',0,454,363,598,1584829744,1,473,3),(1725,192,44,60,0,'description',0,510,364,473,1584829744,1,454,3),(1726,192,44,60,0,'description',0,142,365,454,1584829744,1,510,3),(1727,192,44,60,0,'description',0,516,366,510,1584829744,1,142,3),(1728,192,44,60,0,'description',0,48,367,142,1584829744,1,516,3),(1729,192,44,60,0,'description',0,517,368,516,1584829744,1,48,3),(1730,192,44,60,0,'description',0,24,369,48,1584829744,1,517,3),(1731,192,44,60,0,'description',0,533,370,517,1584829744,1,24,3),(1732,192,44,60,0,'description',0,167,371,24,1584829744,1,533,3),(1733,192,44,60,0,'description',0,7,372,533,1584829744,1,167,3),(1734,192,44,60,0,'description',0,501,373,167,1584829744,1,7,3),(1735,192,44,60,0,'description',0,599,374,7,1584829744,1,501,3),(1736,192,44,60,0,'description',0,48,375,501,1584829744,1,599,3),(1737,192,44,60,0,'description',0,600,376,599,1584829744,1,48,3),(1738,192,44,60,0,'description',0,487,377,48,1584829744,1,600,3),(1739,192,44,60,0,'description',0,7,378,600,1584829744,1,487,3),(1740,192,44,60,0,'description',0,601,379,487,1584829744,1,7,3),(1741,192,44,60,0,'description',0,7,380,7,1584829744,1,601,3),(1742,192,44,60,0,'description',0,602,381,601,1584829744,1,7,3),(1743,192,44,60,0,'description',0,513,382,7,1584829744,1,602,3),(1744,192,44,60,0,'description',0,603,383,602,1584829744,1,513,3),(1745,192,44,60,0,'description',0,14,384,513,1584829744,1,603,3),(1746,192,44,60,0,'description',0,604,385,603,1584829744,1,14,3),(1747,192,44,60,0,'description',0,605,386,14,1584829744,1,604,3),(1748,192,44,60,0,'description',0,606,387,604,1584829744,1,605,3),(1749,192,44,60,0,'description',0,607,388,605,1584829744,1,606,3),(1750,192,44,60,0,'description',0,608,389,606,1584829744,1,607,3),(1751,192,44,60,0,'description',0,48,390,607,1584829744,1,608,3),(1752,192,44,60,0,'description',0,609,391,608,1584829744,1,48,3),(1753,192,44,60,0,'description',0,48,392,48,1584829744,1,609,3),(1754,192,44,60,0,'description',0,523,393,609,1584829744,1,48,3),(1755,192,44,60,0,'description',0,524,394,48,1584829744,1,523,3),(1756,192,44,60,0,'description',0,610,395,523,1584829744,1,524,3),(1757,192,44,60,0,'description',0,611,396,524,1584829744,1,610,3),(1758,192,44,60,0,'description',0,161,397,610,1584829744,1,611,3),(1759,192,44,60,0,'description',0,432,398,611,1584829744,1,161,3),(1760,192,44,60,0,'description',0,6,399,161,1584829744,1,432,3),(1761,192,44,60,0,'description',0,7,400,432,1584829744,1,6,3),(1762,192,44,60,0,'description',0,434,401,6,1584829744,1,7,3),(1763,192,44,60,0,'description',0,435,402,7,1584829744,1,434,3),(1764,192,44,60,0,'description',0,436,403,434,1584829744,1,435,3),(1765,192,44,60,0,'description',0,437,404,435,1584829744,1,436,3),(1766,192,44,60,0,'description',0,438,405,436,1584829744,1,437,3),(1767,192,44,60,0,'description',0,439,406,437,1584829744,1,438,3),(1768,192,44,60,0,'description',0,7,407,438,1584829744,1,439,3),(1769,192,44,60,0,'description',0,440,408,439,1584829744,1,7,3),(1770,192,44,60,0,'description',0,441,409,7,1584829744,1,440,3),(1771,192,44,60,0,'description',0,442,410,440,1584829744,1,441,3),(1772,192,44,60,0,'description',0,443,411,441,1584829744,1,442,3),(1773,192,44,60,0,'description',0,7,412,442,1584829744,1,443,3),(1774,192,44,60,0,'description',0,444,413,443,1584829744,1,7,3),(1775,192,44,60,0,'description',0,186,414,7,1584829744,1,444,3),(1776,192,44,60,0,'description',0,17,415,444,1584829744,1,186,3),(1777,192,44,60,0,'description',0,7,416,186,1584829744,1,17,3),(1778,192,44,60,0,'description',0,445,417,17,1584829744,1,7,3),(1779,192,44,60,0,'description',0,446,418,7,1584829744,1,445,3),(1780,192,44,60,0,'description',0,7,419,445,1584829744,1,446,3),(1781,192,44,60,0,'description',0,189,420,446,1584829744,1,7,3),(1782,192,44,60,0,'description',0,70,421,7,1584829744,1,189,3),(1783,192,44,60,0,'description',0,447,422,189,1584829744,1,70,3),(1784,192,44,60,0,'description',0,48,423,70,1584829744,1,447,3),(1785,192,44,60,0,'description',0,448,424,447,1584829744,1,48,3),(1786,192,44,60,0,'description',0,449,425,48,1584829744,1,448,3),(1787,192,44,60,0,'description',0,450,426,448,1584829744,1,449,3),(1788,192,44,60,0,'description',0,12,427,449,1584829744,1,450,3),(1789,192,44,60,0,'description',0,13,428,450,1584829744,1,12,3),(1790,192,44,60,0,'description',0,451,429,12,1584829744,1,13,3),(1791,192,44,60,0,'description',0,452,430,13,1584829744,1,451,3),(1792,192,44,60,0,'description',0,28,431,451,1584829744,1,452,3),(1793,192,44,60,0,'description',0,445,432,452,1584829744,1,28,3),(1794,192,44,60,0,'description',0,453,433,28,1584829744,1,445,3),(1795,192,44,60,0,'description',0,454,434,445,1584829744,1,453,3),(1796,192,44,60,0,'description',0,12,435,453,1584829744,1,454,3),(1797,192,44,60,0,'description',0,13,436,454,1584829744,1,12,3),(1798,192,44,60,0,'description',0,455,437,12,1584829744,1,13,3),(1799,192,44,60,0,'description',0,456,438,13,1584829744,1,455,3),(1800,192,44,60,0,'description',0,11,439,455,1584829744,1,456,3),(1801,192,44,60,0,'description',0,457,440,456,1584829744,1,11,3),(1802,192,44,60,0,'description',0,142,441,11,1584829744,1,457,3),(1803,192,44,60,0,'description',0,7,442,457,1584829744,1,142,3),(1804,192,44,60,0,'description',0,201,443,142,1584829744,1,7,3),(1805,192,44,60,0,'description',0,458,444,7,1584829744,1,201,3),(1806,192,44,60,0,'description',0,6,445,201,1584829744,1,458,3),(1807,192,44,60,0,'description',0,459,446,458,1584829744,1,6,3),(1808,192,44,60,0,'description',0,460,447,6,1584829744,1,459,3),(1809,192,44,60,0,'description',0,461,448,459,1584829744,1,460,3),(1810,192,44,60,0,'description',0,462,449,460,1584829744,1,461,3),(1811,192,44,60,0,'description',0,439,450,461,1584829744,1,462,3),(1812,192,44,60,0,'description',0,41,451,462,1584829744,1,439,3),(1813,192,44,60,0,'description',0,14,452,439,1584829744,1,41,3),(1814,192,44,60,0,'description',0,463,453,41,1584829744,1,14,3),(1815,192,44,60,0,'description',0,464,454,14,1584829744,1,463,3),(1816,192,44,60,0,'description',0,12,455,463,1584829744,1,464,3),(1817,192,44,60,0,'description',0,13,456,464,1584829744,1,12,3),(1818,192,44,60,0,'description',0,14,457,12,1584829744,1,13,3),(1819,192,44,60,0,'description',0,465,458,13,1584829744,1,14,3),(1820,192,44,60,0,'description',0,435,459,14,1584829744,1,465,3),(1821,192,44,60,0,'description',0,466,460,465,1584829744,1,435,3),(1822,192,44,60,0,'description',0,26,461,435,1584829744,1,466,3),(1823,192,44,60,0,'description',0,467,462,466,1584829744,1,26,3),(1824,192,44,60,0,'description',0,142,463,26,1584829744,1,467,3),(1825,192,44,60,0,'description',0,7,464,467,1584829744,1,142,3),(1826,192,44,60,0,'description',0,468,465,142,1584829744,1,7,3),(1827,192,44,60,0,'description',0,2,466,7,1584829744,1,468,3),(1828,192,44,60,0,'description',0,469,467,468,1584829744,1,2,3),(1829,192,44,60,0,'description',0,142,468,2,1584829744,1,469,3),(1830,192,44,60,0,'description',0,7,469,469,1584829744,1,142,3),(1831,192,44,60,0,'description',0,470,470,142,1584829744,1,7,3),(1832,192,44,60,0,'description',0,48,471,7,1584829744,1,470,3),(1833,192,44,60,0,'description',0,471,472,470,1584829744,1,48,3),(1834,192,44,60,0,'description',0,12,473,48,1584829744,1,471,3),(1835,192,44,60,0,'description',0,472,474,471,1584829744,1,12,3),(1836,192,44,60,0,'description',0,473,475,12,1584829744,1,472,3),(1837,192,44,60,0,'description',0,474,476,472,1584829744,1,473,3),(1838,192,44,60,0,'description',0,475,477,473,1584829744,1,474,3),(1839,192,44,60,0,'description',0,2,478,474,1584829744,1,475,3),(1840,192,44,60,0,'description',0,476,479,475,1584829744,1,2,3),(1841,192,44,60,0,'description',0,439,480,2,1584829744,1,476,3),(1842,192,44,60,0,'description',0,7,481,476,1584829744,1,439,3),(1843,192,44,60,0,'description',0,477,482,439,1584829744,1,7,3),(1844,192,44,60,0,'description',0,478,483,7,1584829744,1,477,3),(1845,192,44,60,0,'description',0,7,484,477,1584829744,1,478,3),(1846,192,44,60,0,'description',0,479,485,478,1584829744,1,7,3),(1847,192,44,60,0,'description',0,2,486,7,1584829744,1,479,3),(1848,192,44,60,0,'description',0,480,487,479,1584829744,1,2,3),(1849,192,44,60,0,'description',0,7,488,2,1584829744,1,480,3),(1850,192,44,60,0,'description',0,481,489,480,1584829744,1,7,3),(1851,192,44,60,0,'description',0,482,490,7,1584829744,1,481,3),(1852,192,44,60,0,'description',0,6,491,481,1584829744,1,482,3),(1853,192,44,60,0,'description',0,483,492,482,1584829744,1,6,3),(1854,192,44,60,0,'description',0,484,493,6,1584829744,1,483,3),(1855,192,44,60,0,'description',0,460,494,483,1584829744,1,484,3),(1856,192,44,60,0,'description',0,485,495,484,1584829744,1,460,3),(1857,192,44,60,0,'description',0,14,496,460,1584829744,1,485,3),(1858,192,44,60,0,'description',0,486,497,485,1584829744,1,14,3),(1859,192,44,60,0,'description',0,138,498,14,1584829744,1,486,3),(1860,192,44,60,0,'description',0,26,499,486,1584829744,1,138,3),(1861,192,44,60,0,'description',0,467,500,138,1584829744,1,26,3),(1862,192,44,60,0,'description',0,487,501,26,1584829744,1,467,3),(1863,192,44,60,0,'description',0,488,502,467,1584829744,1,487,3),(1864,192,44,60,0,'description',0,489,503,487,1584829744,1,488,3),(1865,192,44,60,0,'description',0,14,504,488,1584829744,1,489,3),(1866,192,44,60,0,'description',0,13,505,489,1584829744,1,14,3),(1867,192,44,60,0,'description',0,490,506,14,1584829744,1,13,3),(1868,192,44,60,0,'description',0,491,507,13,1584829744,1,490,3),(1869,192,44,60,0,'description',0,2,508,490,1584829744,1,491,3),(1870,192,44,60,0,'description',0,492,509,491,1584829744,1,2,3),(1871,192,44,60,0,'description',0,487,510,2,1584829744,1,492,3),(1872,192,44,60,0,'description',0,493,511,492,1584829744,1,487,3),(1873,192,44,60,0,'description',0,494,512,487,1584829744,1,493,3),(1874,192,44,60,0,'description',0,12,513,493,1584829744,1,494,3),(1875,192,44,60,0,'description',0,13,514,494,1584829744,1,12,3),(1876,192,44,60,0,'description',0,41,515,12,1584829744,1,13,3),(1877,192,44,60,0,'description',0,495,516,13,1584829744,1,41,3),(1878,192,44,60,0,'description',0,484,517,41,1584829744,1,495,3),(1879,192,44,60,0,'description',0,48,518,495,1584829744,1,484,3),(1880,192,44,60,0,'description',0,7,519,484,1584829744,1,48,3),(1881,192,44,60,0,'description',0,496,520,48,1584829744,1,7,3),(1882,192,44,60,0,'description',0,497,521,7,1584829744,1,496,3),(1883,192,44,60,0,'description',0,6,522,496,1584829744,1,497,3),(1884,192,44,60,0,'description',0,111,523,497,1584829744,1,6,3),(1885,192,44,60,0,'description',0,498,524,6,1584829744,1,111,3),(1886,192,44,60,0,'description',0,17,525,111,1584829744,1,498,3),(1887,192,44,60,0,'description',0,499,526,498,1584829744,1,17,3),(1888,192,44,60,0,'description',0,5,527,17,1584829744,1,499,3),(1889,192,44,60,0,'description',0,6,528,499,1584829744,1,5,3),(1890,192,44,60,0,'description',0,14,529,5,1584829744,1,6,3),(1891,192,44,60,0,'description',0,500,530,6,1584829744,1,14,3),(1892,192,44,60,0,'description',0,501,531,14,1584829744,1,500,3),(1893,192,44,60,0,'description',0,144,532,500,1584829744,1,501,3),(1894,192,44,60,0,'description',0,502,533,501,1584829744,1,144,3),(1895,192,44,60,0,'description',0,12,534,144,1584829744,1,502,3),(1896,192,44,60,0,'description',0,13,535,502,1584829744,1,12,3),(1897,192,44,60,0,'description',0,111,536,12,1584829744,1,13,3),(1898,192,44,60,0,'description',0,503,537,13,1584829744,1,111,3),(1899,192,44,60,0,'description',0,504,538,111,1584829744,1,503,3),(1900,192,44,60,0,'description',0,7,539,503,1584829744,1,504,3),(1901,192,44,60,0,'description',0,505,540,504,1584829744,1,7,3),(1902,192,44,60,0,'description',0,79,541,7,1584829744,1,505,3),(1903,192,44,60,0,'description',0,506,542,505,1584829744,1,79,3),(1904,192,44,60,0,'description',0,507,543,79,1584829744,1,506,3),(1905,192,44,60,0,'description',0,24,544,506,1584829744,1,507,3),(1906,192,44,60,0,'description',0,508,545,507,1584829744,1,24,3),(1907,192,44,60,0,'description',0,253,546,24,1584829744,1,508,3),(1908,192,44,60,0,'description',0,509,547,508,1584829744,1,253,3),(1909,192,44,60,0,'description',0,510,548,253,1584829744,1,509,3),(1910,192,44,60,0,'description',0,142,549,509,1584829744,1,510,3),(1911,192,44,60,0,'description',0,511,550,510,1584829744,1,142,3),(1912,192,44,60,0,'description',0,512,551,142,1584829744,1,511,3),(1913,192,44,60,0,'description',0,460,552,511,1584829744,1,512,3),(1914,192,44,60,0,'description',0,513,553,512,1584829744,1,460,3),(1915,192,44,60,0,'description',0,48,554,460,1584829744,1,513,3),(1916,192,44,60,0,'description',0,514,555,513,1584829744,1,48,3),(1917,192,44,60,0,'description',0,515,556,48,1584829744,1,514,3),(1918,192,44,60,0,'description',0,28,557,514,1584829744,1,515,3),(1919,192,44,60,0,'description',0,516,558,515,1584829744,1,28,3),(1920,192,44,60,0,'description',0,517,559,28,1584829744,1,516,3),(1921,192,44,60,0,'description',0,48,560,516,1584829744,1,517,3),(1922,192,44,60,0,'description',0,518,561,517,1584829744,1,48,3),(1923,192,44,60,0,'description',0,454,562,48,1584829744,1,518,3),(1924,192,44,60,0,'description',0,460,563,518,1584829744,1,454,3),(1925,192,44,60,0,'description',0,461,564,454,1584829744,1,460,3),(1926,192,44,60,0,'description',0,519,565,460,1584829744,1,461,3),(1927,192,44,60,0,'description',0,139,566,461,1584829744,1,519,3),(1928,192,44,60,0,'description',0,487,567,519,1584829744,1,139,3),(1929,192,44,60,0,'description',0,467,568,139,1584829744,1,487,3),(1930,192,44,60,0,'description',0,11,569,487,1584829744,1,467,3),(1931,192,44,60,0,'description',0,14,570,467,1584829744,1,11,3),(1932,192,44,60,0,'description',0,520,571,11,1584829744,1,14,3),(1933,192,44,60,0,'description',0,521,572,14,1584829744,1,520,3),(1934,192,44,60,0,'description',0,522,573,520,1584829744,1,521,3),(1935,192,44,60,0,'description',0,48,574,521,1584829744,1,522,3),(1936,192,44,60,0,'description',0,523,575,522,1584829744,1,48,3),(1937,192,44,60,0,'description',0,524,576,48,1584829744,1,523,3),(1938,192,44,60,0,'description',0,516,577,523,1584829744,1,524,3),(1939,192,44,60,0,'description',0,12,578,524,1584829744,1,516,3),(1940,192,44,60,0,'description',0,461,579,516,1584829744,1,12,3),(1941,192,44,60,0,'description',0,525,580,12,1584829744,1,461,3),(1942,192,44,60,0,'description',0,526,581,461,1584829744,1,525,3),(1943,192,44,60,0,'description',0,2,582,525,1584829744,1,526,3),(1944,192,44,60,0,'description',0,144,583,526,1584829744,1,2,3),(1945,192,44,60,0,'description',0,142,584,2,1584829744,1,144,3),(1946,192,44,60,0,'description',0,527,585,144,1584829744,1,142,3),(1947,192,44,60,0,'description',0,48,586,142,1584829744,1,527,3),(1948,192,44,60,0,'description',0,528,587,527,1584829744,1,48,3),(1949,192,44,60,0,'description',0,529,588,48,1584829744,1,528,3),(1950,192,44,60,0,'description',0,111,589,528,1584829744,1,529,3),(1951,192,44,60,0,'description',0,7,590,529,1584829744,1,111,3),(1952,192,44,60,0,'description',0,474,591,111,1584829744,1,7,3),(1953,192,44,60,0,'description',0,491,592,7,1584829744,1,474,3),(1954,192,44,60,0,'description',0,2,593,474,1584829744,1,491,3),(1955,192,44,60,0,'description',0,492,594,491,1584829744,1,2,3),(1956,192,44,60,0,'description',0,512,595,2,1584829744,1,492,3),(1957,192,44,60,0,'description',0,530,596,492,1584829744,1,512,3),(1958,192,44,60,0,'description',0,512,597,512,1584829744,1,530,3),(1959,192,44,60,0,'description',0,7,598,530,1584829744,1,512,3),(1960,192,44,60,0,'description',0,531,599,512,1584829744,1,7,3),(1961,192,44,60,0,'description',0,532,600,7,1584829744,1,531,3),(1962,192,44,60,0,'description',0,533,601,531,1584829744,1,532,3),(1963,192,44,60,0,'description',0,514,602,532,1584829744,1,533,3),(1964,192,44,60,0,'description',0,7,603,533,1584829744,1,514,3),(1965,192,44,60,0,'description',0,501,604,514,1584829744,1,7,3),(1966,192,44,60,0,'description',0,534,605,7,1584829744,1,501,3),(1967,192,44,60,0,'description',0,533,606,501,1584829744,1,534,3),(1968,192,44,60,0,'description',0,514,607,534,1584829744,1,533,3),(1969,192,44,60,0,'description',0,535,608,533,1584829744,1,514,3),(1970,192,44,60,0,'description',0,536,609,514,1584829744,1,535,3),(1971,192,44,60,0,'description',0,512,610,535,1584829744,1,536,3),(1972,192,44,60,0,'description',0,12,611,536,1584829744,1,512,3),(1973,192,44,60,0,'description',0,6,612,512,1584829744,1,12,3),(1974,192,44,60,0,'description',0,537,613,12,1584829744,1,6,3),(1975,192,44,60,0,'description',0,7,614,6,1584829744,1,537,3),(1976,192,44,60,0,'description',0,435,615,537,1584829744,1,7,3),(1977,192,44,60,0,'description',0,461,616,7,1584829744,1,435,3),(1978,192,44,60,0,'description',0,538,617,435,1584829744,1,461,3),(1979,192,44,60,0,'description',0,539,618,461,1584829744,1,538,3),(1980,192,44,60,0,'description',0,41,619,538,1584829744,1,539,3),(1981,192,44,60,0,'description',0,14,620,539,1584829744,1,41,3),(1982,192,44,60,0,'description',0,540,621,41,1584829744,1,14,3),(1983,192,44,60,0,'description',0,541,622,14,1584829744,1,540,3),(1984,192,44,60,0,'description',0,542,623,540,1584829744,1,541,3),(1985,192,44,60,0,'description',0,530,624,541,1584829744,1,542,3),(1986,192,44,60,0,'description',0,34,625,542,1584829744,1,530,3),(1987,192,44,60,0,'description',0,543,626,530,1584829744,1,34,3),(1988,192,44,60,0,'description',0,454,627,34,1584829744,1,543,3),(1989,192,44,60,0,'description',0,544,628,543,1584829744,1,454,3),(1990,192,44,60,0,'description',0,502,629,454,1584829744,1,544,3),(1991,192,44,60,0,'description',0,545,630,544,1584829744,1,502,3),(1992,192,44,60,0,'description',0,460,631,502,1584829744,1,545,3),(1993,192,44,60,0,'description',0,546,632,545,1584829744,1,460,3),(1994,192,44,60,0,'description',0,2,633,460,1584829744,1,546,3),(1995,192,44,60,0,'description',0,547,634,546,1584829744,1,2,3),(1996,192,44,60,0,'description',0,548,635,2,1584829744,1,547,3),(1997,192,44,60,0,'description',0,549,636,547,1584829744,1,548,3),(1998,192,44,60,0,'description',0,550,637,548,1584829744,1,549,3),(1999,192,44,60,0,'description',0,551,638,549,1584829744,1,550,3),(2000,192,44,60,0,'description',0,491,639,550,1584829744,1,551,3),(2001,192,44,60,0,'description',0,548,640,551,1584829744,1,491,3),(2002,192,44,60,0,'description',0,502,641,491,1584829744,1,548,3),(2003,192,44,60,0,'description',0,460,642,548,1584829744,1,502,3),(2004,192,44,60,0,'description',0,552,643,502,1584829744,1,460,3),(2005,192,44,60,0,'description',0,167,644,460,1584829744,1,552,3),(2006,192,44,60,0,'description',0,553,645,552,1584829744,1,167,3),(2007,192,44,60,0,'description',0,501,646,167,1584829744,1,553,3),(2008,192,44,60,0,'description',0,147,647,553,1584829744,1,501,3),(2009,192,44,60,0,'description',0,111,648,501,1584829744,1,147,3),(2010,192,44,60,0,'description',0,7,649,147,1584829744,1,111,3),(2011,192,44,60,0,'description',0,474,650,111,1584829744,1,7,3),(2012,192,44,60,0,'description',0,142,651,7,1584829744,1,474,3),(2013,192,44,60,0,'description',0,14,652,474,1584829744,1,142,3),(2014,192,44,60,0,'description',0,540,653,142,1584829744,1,14,3),(2015,192,44,60,0,'description',0,541,654,14,1584829744,1,540,3),(2016,192,44,60,0,'description',0,7,655,540,1584829744,1,541,3),(2017,192,44,60,0,'description',0,435,656,541,1584829744,1,7,3),(2018,192,44,60,0,'description',0,461,657,7,1584829744,1,435,3),(2019,192,44,60,0,'description',0,554,658,435,1584829744,1,461,3),(2020,192,44,60,0,'description',0,555,659,461,1584829744,1,554,3),(2021,192,44,60,0,'description',0,556,660,554,1584829744,1,555,3),(2022,192,44,60,0,'description',0,17,661,555,1584829744,1,556,3),(2023,192,44,60,0,'description',0,557,662,556,1584829744,1,17,3),(2024,192,44,60,0,'description',0,509,663,17,1584829744,1,557,3),(2025,192,44,60,0,'description',0,558,664,557,1584829744,1,509,3),(2026,192,44,60,0,'description',0,559,665,509,1584829744,1,558,3),(2027,192,44,60,0,'description',0,560,666,558,1584829744,1,559,3),(2028,192,44,60,0,'description',0,2,667,559,1584829744,1,560,3),(2029,192,44,60,0,'description',0,12,668,560,1584829744,1,2,3),(2030,192,44,60,0,'description',0,511,669,2,1584829744,1,12,3),(2031,192,44,60,0,'description',0,6,670,12,1584829744,1,511,3),(2032,192,44,60,0,'description',0,561,671,511,1584829744,1,6,3),(2033,192,44,60,0,'description',0,562,672,6,1584829744,1,561,3),(2034,192,44,60,0,'description',0,563,673,561,1584829744,1,562,3),(2035,192,44,60,0,'description',0,564,674,562,1584829744,1,563,3),(2036,192,44,60,0,'description',0,142,675,563,1584829744,1,564,3),(2037,192,44,60,0,'description',0,565,676,564,1584829744,1,142,3),(2038,192,44,60,0,'description',0,566,677,142,1584829744,1,565,3),(2039,192,44,60,0,'description',0,548,678,565,1584829744,1,566,3),(2040,192,44,60,0,'description',0,6,679,566,1584829744,1,548,3),(2041,192,44,60,0,'description',0,567,680,548,1584829744,1,6,3),(2042,192,44,60,0,'description',0,509,681,6,1584829744,1,567,3),(2043,192,44,60,0,'description',0,28,682,567,1584829744,1,509,3),(2044,192,44,60,0,'description',0,568,683,509,1584829744,1,28,3),(2045,192,44,60,0,'description',0,186,684,28,1584829744,1,568,3),(2046,192,44,60,0,'description',0,17,685,568,1584829744,1,186,3),(2047,192,44,60,0,'description',0,7,686,186,1584829744,1,17,3),(2048,192,44,60,0,'description',0,474,687,17,1584829744,1,7,3),(2049,192,44,60,0,'description',0,7,688,7,1584829744,1,474,3),(2050,192,44,60,0,'description',0,445,689,474,1584829744,1,7,3),(2051,192,44,60,0,'description',0,6,690,7,1584829744,1,445,3),(2052,192,44,60,0,'description',0,564,691,445,1584829744,1,6,3),(2053,192,44,60,0,'description',0,569,692,6,1584829744,1,564,3),(2054,192,44,60,0,'description',0,570,693,564,1584829744,1,569,3),(2055,192,44,60,0,'description',0,571,694,569,1584829744,1,570,3),(2056,192,44,60,0,'description',0,454,695,570,1584829744,1,571,3),(2057,192,44,60,0,'description',0,24,696,571,1584829744,1,454,3),(2058,192,44,60,0,'description',0,533,697,454,1584829744,1,24,3),(2059,192,44,60,0,'description',0,253,698,24,1584829744,1,533,3),(2060,192,44,60,0,'description',0,12,699,533,1584829744,1,253,3),(2061,192,44,60,0,'description',0,142,700,253,1584829744,1,12,3),(2062,192,44,60,0,'description',0,7,701,12,1584829744,1,142,3),(2063,192,44,60,0,'description',0,572,702,142,1584829744,1,7,3),(2064,192,44,60,0,'description',0,48,703,7,1584829744,1,572,3),(2065,192,44,60,0,'description',0,573,704,572,1584829744,1,48,3),(2066,192,44,60,0,'description',0,7,705,48,1584829744,1,573,3),(2067,192,44,60,0,'description',0,574,706,573,1584829744,1,7,3),(2068,192,44,60,0,'description',0,17,707,7,1584829744,1,574,3),(2069,192,44,60,0,'description',0,7,708,574,1584829744,1,17,3),(2070,192,44,60,0,'description',0,575,709,17,1584829744,1,7,3),(2071,192,44,60,0,'description',0,576,710,7,1584829744,1,575,3),(2072,192,44,60,0,'description',0,577,711,575,1584829744,1,576,3),(2073,192,44,60,0,'description',0,487,712,576,1584829744,1,577,3),(2074,192,44,60,0,'description',0,492,713,577,1584829744,1,487,3),(2075,192,44,60,0,'description',0,445,714,487,1584829744,1,492,3),(2076,192,44,60,0,'description',0,578,715,492,1584829744,1,445,3),(2077,192,44,60,0,'description',0,548,716,445,1584829744,1,578,3),(2078,192,44,60,0,'description',0,461,717,578,1584829744,1,548,3),(2079,192,44,60,0,'description',0,14,718,548,1584829744,1,461,3),(2080,192,44,60,0,'description',0,579,719,461,1584829744,1,14,3),(2081,192,44,60,0,'description',0,48,720,14,1584829744,1,579,3),(2082,192,44,60,0,'description',0,580,721,579,1584829744,1,48,3),(2083,192,44,60,0,'description',0,48,722,48,1584829744,1,580,3),(2084,192,44,60,0,'description',0,581,723,580,1584829744,1,48,3),(2085,192,44,60,0,'description',0,582,724,48,1584829744,1,581,3),(2086,192,44,60,0,'description',0,583,725,581,1584829744,1,582,3),(2087,192,44,60,0,'description',0,460,726,582,1584829744,1,583,3),(2088,192,44,60,0,'description',0,552,727,583,1584829744,1,460,3),(2089,192,44,60,0,'description',0,167,728,460,1584829744,1,552,3),(2090,192,44,60,0,'description',0,14,729,552,1584829744,1,167,3),(2091,192,44,60,0,'description',0,584,730,167,1584829744,1,14,3),(2092,192,44,60,0,'description',0,585,731,14,1584829744,1,584,3),(2093,192,44,60,0,'description',0,48,732,584,1584829744,1,585,3),(2094,192,44,60,0,'description',0,586,733,585,1584829744,1,48,3),(2095,192,44,60,0,'description',0,11,734,48,1584829744,1,586,3),(2096,192,44,60,0,'description',0,479,735,586,1584829744,1,11,3),(2097,192,44,60,0,'description',0,587,736,11,1584829744,1,479,3),(2098,192,44,60,0,'description',0,588,737,479,1584829744,1,587,3),(2099,192,44,60,0,'description',0,589,738,587,1584829744,1,588,3),(2100,192,44,60,0,'description',0,590,739,588,1584829744,1,589,3),(2101,192,44,60,0,'description',0,591,740,589,1584829744,1,590,3),(2102,192,44,60,0,'description',0,2,741,590,1584829744,1,591,3),(2103,192,44,60,0,'description',0,467,742,591,1584829744,1,2,3),(2104,192,44,60,0,'description',0,592,743,2,1584829744,1,467,3),(2105,192,44,60,0,'description',0,5,744,467,1584829744,1,592,3),(2106,192,44,60,0,'description',0,552,745,592,1584829744,1,5,3),(2107,192,44,60,0,'description',0,593,746,5,1584829744,1,552,3),(2108,192,44,60,0,'description',0,594,747,552,1584829744,1,593,3),(2109,192,44,60,0,'description',0,14,748,593,1584829744,1,594,3),(2110,192,44,60,0,'description',0,595,749,594,1584829744,1,14,3),(2111,192,44,60,0,'description',0,144,750,14,1584829744,1,595,3),(2112,192,44,60,0,'description',0,454,751,595,1584829744,1,144,3),(2113,192,44,60,0,'description',0,596,752,144,1584829744,1,454,3),(2114,192,44,60,0,'description',0,491,753,454,1584829744,1,596,3),(2115,192,44,60,0,'description',0,597,754,596,1584829744,1,491,3),(2116,192,44,60,0,'description',0,18,755,491,1584829744,1,597,3),(2117,192,44,60,0,'description',0,539,756,597,1584829744,1,18,3),(2118,192,44,60,0,'description',0,598,757,18,1584829744,1,539,3),(2119,192,44,60,0,'description',0,473,758,539,1584829744,1,598,3),(2120,192,44,60,0,'description',0,454,759,598,1584829744,1,473,3),(2121,192,44,60,0,'description',0,510,760,473,1584829744,1,454,3),(2122,192,44,60,0,'description',0,142,761,454,1584829744,1,510,3),(2123,192,44,60,0,'description',0,516,762,510,1584829744,1,142,3),(2124,192,44,60,0,'description',0,48,763,142,1584829744,1,516,3),(2125,192,44,60,0,'description',0,517,764,516,1584829744,1,48,3),(2126,192,44,60,0,'description',0,24,765,48,1584829744,1,517,3),(2127,192,44,60,0,'description',0,533,766,517,1584829744,1,24,3),(2128,192,44,60,0,'description',0,167,767,24,1584829744,1,533,3),(2129,192,44,60,0,'description',0,7,768,533,1584829744,1,167,3),(2130,192,44,60,0,'description',0,501,769,167,1584829744,1,7,3),(2131,192,44,60,0,'description',0,599,770,7,1584829744,1,501,3),(2132,192,44,60,0,'description',0,48,771,501,1584829744,1,599,3),(2133,192,44,60,0,'description',0,600,772,599,1584829744,1,48,3),(2134,192,44,60,0,'description',0,487,773,48,1584829744,1,600,3),(2135,192,44,60,0,'description',0,7,774,600,1584829744,1,487,3),(2136,192,44,60,0,'description',0,601,775,487,1584829744,1,7,3),(2137,192,44,60,0,'description',0,7,776,7,1584829744,1,601,3),(2138,192,44,60,0,'description',0,602,777,601,1584829744,1,7,3),(2139,192,44,60,0,'description',0,513,778,7,1584829744,1,602,3),(2140,192,44,60,0,'description',0,603,779,602,1584829744,1,513,3),(2141,192,44,60,0,'description',0,14,780,513,1584829744,1,603,3),(2142,192,44,60,0,'description',0,604,781,603,1584829744,1,14,3),(2143,192,44,60,0,'description',0,605,782,14,1584829744,1,604,3),(2144,192,44,60,0,'description',0,606,783,604,1584829744,1,605,3),(2145,192,44,60,0,'description',0,607,784,605,1584829744,1,606,3),(2146,192,44,60,0,'description',0,608,785,606,1584829744,1,607,3),(2147,192,44,60,0,'description',0,48,786,607,1584829744,1,608,3),(2148,192,44,60,0,'description',0,609,787,608,1584829744,1,48,3),(2149,192,44,60,0,'description',0,48,788,48,1584829744,1,609,3),(2150,192,44,60,0,'description',0,523,789,609,1584829744,1,48,3),(2151,192,44,60,0,'description',0,524,790,48,1584829744,1,523,3),(2152,192,44,60,0,'description',0,610,791,523,1584829744,1,524,3),(2153,192,44,60,0,'description',0,611,792,524,1584829744,1,610,3),(2154,192,44,60,0,'description',0,161,793,610,1584829744,1,611,3),(2155,192,44,60,0,'description',0,148,794,611,1584829744,1,161,3),(2156,193,44,60,0,'difficulty',0,467,795,161,1584829744,1,148,3),(2157,194,44,60,0,'starting_point',0,612,796,148,1584829744,1,467,3),(2158,194,44,60,0,'starting_point',0,433,797,467,1584829744,1,612,3),(2159,194,44,60,0,'starting_point',0,492,798,612,1584829744,1,433,3),(2160,195,44,60,0,'ending_point',0,613,799,433,1584829744,1,492,3),(2161,195,44,60,0,'ending_point',0,433,800,492,1584829744,1,613,3),(2162,195,44,60,0,'ending_point',0,614,801,613,1584829744,1,433,3),(2163,196,44,60,0,'length',28,615,802,433,1584829744,1,614,3),(2164,197,44,60,0,'author',0,123,803,614,1584829744,1,615,3),(2165,197,44,60,0,'author',0,0,804,615,1584829744,1,123,3),(2166,198,45,64,0,'title',0,617,0,0,1584829991,1,616,3),(2167,198,45,64,0,'title',0,618,1,616,1584829991,1,617,3),(2168,198,45,64,0,'title',0,5,2,617,1584829991,1,618,3),(2169,199,45,64,0,'description',0,6,3,618,1584829991,1,5,3),(2170,199,45,64,0,'description',0,7,4,5,1584829991,1,6,3),(2171,199,45,64,0,'description',0,616,5,6,1584829991,1,7,3),(2172,199,45,64,0,'description',0,619,6,7,1584829991,1,616,3),(2173,199,45,64,0,'description',0,13,7,616,1584829991,1,619,3),(2174,199,45,64,0,'description',0,617,8,619,1584829991,1,13,3),(2175,199,45,64,0,'description',0,618,9,13,1584829991,1,617,3),(2176,199,45,64,0,'description',0,142,10,617,1584829991,1,618,3),(2177,199,45,64,0,'description',0,7,11,618,1584829991,1,142,3),(2178,199,45,64,0,'description',0,157,12,142,1584829991,1,7,3),(2179,199,45,64,0,'description',0,387,13,7,1584829991,1,157,3),(2180,201,45,64,0,'photo_legend',0,17,14,157,1584829991,1,387,3),(2181,201,45,64,0,'photo_legend',0,7,15,387,1584829991,1,17,3),(2182,201,45,64,0,'photo_legend',0,620,16,17,1584829991,1,7,3),(2183,201,45,64,0,'photo_legend',0,142,17,7,1584829991,1,620,3),(2184,201,45,64,0,'photo_legend',0,7,18,620,1584829991,1,142,3),(2185,201,45,64,0,'photo_legend',0,201,19,142,1584829991,1,7,3),(2186,201,45,64,0,'photo_legend',0,618,20,7,1584829991,1,201,3),(2187,202,45,64,0,'place',0,0,21,201,1584829991,1,618,3),(2188,198,45,63,0,'title',0,622,0,0,1584829932,1,621,3),(2189,198,45,63,0,'title',0,623,1,621,1584829932,1,622,3),(2190,198,45,63,0,'title',0,623,2,622,1584829932,1,623,3),(2191,199,45,63,0,'description',0,621,3,623,1584829932,1,623,3),(2192,199,45,63,0,'description',0,624,4,623,1584829932,1,621,3),(2193,199,45,63,0,'description',0,70,5,621,1584829932,1,624,3),(2194,199,45,63,0,'description',0,362,6,624,1584829932,1,70,3),(2195,199,45,63,0,'description',0,48,7,70,1584829932,1,362,3),(2196,199,45,63,0,'description',0,625,8,362,1584829932,1,48,3),(2197,199,45,63,0,'description',0,626,9,48,1584829932,1,625,3),(2198,199,45,63,0,'description',0,627,10,625,1584829932,1,626,3),(2199,199,45,63,0,'description',0,147,11,626,1584829932,1,627,3),(2200,199,45,63,0,'description',0,2,12,627,1584829932,1,147,3),(2201,199,45,63,0,'description',0,253,13,147,1584829932,1,2,3),(2202,199,45,63,0,'description',0,7,14,2,1584829932,1,253,3),(2203,199,45,63,0,'description',0,628,15,253,1584829932,1,7,3),(2204,199,45,63,0,'description',0,189,16,7,1584829932,1,628,3),(2205,199,45,63,0,'description',0,48,17,628,1584829932,1,189,3),(2206,199,45,63,0,'description',0,7,18,189,1584829932,1,48,3),(2207,199,45,63,0,'description',0,629,19,48,1584829932,1,7,3),(2208,199,45,63,0,'description',0,630,20,7,1584829932,1,629,3),(2209,199,45,63,0,'description',0,631,21,629,1584829932,1,630,3),(2210,201,45,63,0,'photo_legend',0,387,22,630,1584829932,1,631,3),(2211,201,45,63,0,'photo_legend',0,623,23,631,1584829932,1,387,3),(2212,202,45,63,0,'place',0,0,24,387,1584829932,1,623,3);
/*!40000 ALTER TABLE `ezsearch_object_word_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsearch_word`
--

DROP TABLE IF EXISTS `ezsearch_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsearch_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_count` int(11) NOT NULL DEFAULT '0',
  `word` varchar(150) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezsearch_word_word_i` (`word`),
  KEY `ezsearch_word_obj_count` (`object_count`)
) ENGINE=InnoDB AUTO_INCREMENT=632 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsearch_word`
--

LOCK TABLES `ezsearch_word` WRITE;
/*!40000 ALTER TABLE `ezsearch_word` DISABLE KEYS */;
INSERT INTO `ezsearch_word` VALUES (1,1,'welcome'),(2,5,'to'),(3,1,'ez'),(4,1,'platform'),(5,5,'this'),(6,3,'is'),(7,8,'the'),(8,1,'clean'),(9,1,'install'),(10,1,'coming'),(11,2,'with'),(12,2,'it'),(13,3,'s'),(14,3,'a'),(15,1,'barebone'),(16,1,'setup'),(17,6,'of'),(18,4,'an'),(19,1,'excellent'),(20,1,'foundation'),(21,1,'build'),(22,1,'upon'),(23,1,'if'),(24,2,'you'),(25,1,'want'),(26,4,'from'),(27,1,'scratch'),(28,5,'for'),(29,1,'more'),(30,1,'ready'),(31,1,'go'),(32,1,'base'),(33,1,'designs'),(34,2,'or'),(35,1,'demo'),(36,1,'sites'),(37,1,'please'),(38,1,'check'),(39,1,'documentation'),(40,1,'congratulations'),(41,2,'just'),(42,1,'installed'),(43,1,'new'),(44,1,'generation'),(45,1,'content'),(46,1,'management'),(47,1,'systems'),(48,6,'and'),(49,1,'community'),(50,1,'replacing'),(51,1,'publish'),(52,1,'our'),(53,1,'previous'),(54,1,'software'),(55,1,'need'),(56,1,'some'),(57,1,'guidance'),(58,1,'out'),(59,2,'following'),(60,1,'resources'),(61,4,'user'),(62,1,'manual'),(63,1,'studio'),(64,1,'technical'),(65,1,'doc'),(66,1,'developer'),(67,1,'tutorial'),(68,1,'comparison'),(69,1,'guide'),(70,4,'between'),(71,1,'contribute'),(72,1,'project'),(73,1,'join'),(74,1,'github'),(75,1,'repositories'),(76,1,'open'),(77,1,'public'),(78,1,'register'),(79,3,'on'),(80,1,'discuss'),(81,1,'ezplatform'),(82,1,'com'),(83,1,'site'),(84,1,'access'),(85,1,'forums'),(86,1,'tutorials'),(87,1,'blogs'),(88,1,'conversation'),(89,1,'slack'),(90,1,'good'),(91,1,'luck'),(92,1,'main'),(93,2,'group'),(94,3,'users'),(95,2,'anonymous'),(96,1,'guest'),(97,1,'accounts'),(98,2,'administrator'),(99,1,'editors'),(100,1,'media'),(101,1,'images'),(102,1,'files'),(103,1,'multimedia'),(104,1,'home'),(105,1,'page'),(106,1,'form'),(107,1,'uploads'),(108,1,'folder'),(109,1,'file'),(110,1,'forms'),(111,2,'all'),(112,1,'rides'),(115,1,'finnish'),(116,1,'coastline'),(117,1,'rauma'),(118,1,'pori'),(119,2,'beginner'),(120,1,'finland'),(121,1,'54'),(122,1,'jan'),(123,5,'doe'),(138,2,'route'),(139,2,'starting'),(142,5,'in'),(144,4,'ride'),(145,2,'offers'),(147,4,'views'),(148,2,'intermediate'),(157,2,'hills'),(161,2,'recommended'),(167,2,'enjoy'),(169,2,'france'),(186,2,'parts'),(189,2,'mountains'),(201,2,'summer'),(253,2,'see'),(362,2,'coligny'),(374,1,'points'),(375,1,'interest'),(387,2,'view'),(393,1,'baby'),(394,1,'tour'),(395,1,'battenkill'),(396,1,'schueylerville'),(397,1,'ending'),(398,1,'shushan'),(399,1,'breathtaking'),(400,1,'schuylerville'),(401,1,'ny'),(402,1,'usa'),(403,1,'37'),(404,1,'jedi'),(405,1,'lookouts'),(406,1,'montagna'),(407,1,'le'),(408,1,'reconduit'),(409,1,'exciting'),(410,1,'eastern'),(411,1,'foothills'),(412,1,'franche'),(413,1,'comte'),(414,1,'province'),(415,1,'19'),(416,1,'jack'),(417,1,'meillonnas'),(418,1,'terrain'),(419,1,'track'),(420,1,'variety'),(421,1,'spectacular'),(422,1,'scenery'),(423,1,'those'),(424,1,'seeking'),(425,1,'both'),(426,1,'challenge'),(427,1,'opportunity'),(428,1,'advanced'),(429,1,'pressiat'),(430,1,'18'),(431,1,'john'),(432,1,'rallarvegen'),(433,1,'norway'),(434,1,'service'),(435,1,'road'),(436,1,'built'),(437,1,'1902'),(438,1,'04'),(439,1,'by'),(440,1,'workers'),(441,1,'rallar'),(442,1,'while'),(443,1,'building'),(444,1,'highest'),(445,1,'railroad'),(446,1,'across'),(447,1,'oslo'),(448,1,'bergen'),(449,1,'these'),(450,1,'days'),(451,1,'still'),(452,1,'used'),(453,1,'maintenance'),(454,1,'but'),(455,1,'also'),(456,1,'popular'),(457,1,'cycloturists'),(458,1,'driving'),(459,1,'restricted'),(460,1,'i'),(461,1,'was'),(462,1,'passed'),(463,1,'single'),(464,1,'car'),(465,1,'gravel'),(466,1,'stretching'),(467,1,'haugastoel'),(468,1,'east'),(469,1,'myrdal'),(470,1,'west'),(471,1,'then'),(472,1,'forks'),(473,1,'one'),(474,1,'way'),(475,1,'goes'),(476,1,'flaam'),(477,1,'aurland'),(478,1,'fjord'),(479,1,'other'),(480,1,'voss'),(481,1,'full'),(482,1,'length'),(483,1,'123'),(484,1,'km'),(485,1,'took'),(486,1,'shorter'),(487,1,'at'),(488,1,'988'),(489,1,'m'),(490,1,'l'),(491,1,'up'),(492,1,'finse'),(493,1,'1222'),(494,1,'meters'),(495,1,'26'),(496,1,'return'),(497,1,'trip'),(498,1,'downhill'),(499,1,'course'),(500,1,'high'),(501,1,'mountain'),(502,1,'so'),(503,1,'about'),(504,1,'having'),(505,1,'weather'),(506,1,'your'),(507,1,'side'),(508,1,'ll'),(509,1,'snow'),(510,1,'even'),(511,1,'july'),(512,1,'as'),(513,1,'did'),(514,1,'be'),(515,1,'prepared'),(516,1,'wind'),(517,1,'rain'),(518,1,'cold'),(519,1,'lucky'),(520,1,'clear'),(521,1,'blue'),(522,1,'sky'),(523,1,'very'),(524,1,'little'),(525,1,'warm'),(526,1,'enough'),(527,1,'shorts'),(528,1,'short'),(529,1,'sleeves'),(530,1,'steep'),(531,1,'norwegian'),(532,1,'fjords'),(533,1,'can'),(534,1,'plateaus'),(535,1,'pretty'),(536,1,'flat'),(537,1,'here'),(538,1,'mostly'),(539,1,'easy'),(540,1,'few'),(541,1,'places'),(542,1,'were'),(543,1,'rough'),(544,1,'not'),(545,1,'bad'),(546,1,'had'),(547,1,'walk'),(548,1,'there'),(549,1,'are'),(550,1,'no'),(551,1,'trees'),(552,1,'could'),(553,1,'fantastic'),(554,1,'wet'),(555,1,'muddy'),(556,1,'because'),(557,1,'melting'),(558,1,'patches'),(559,1,'right'),(560,1,'next'),(561,1,'considered'),(562,1,'early'),(563,1,'season'),(564,1,'actually'),(565,1,'august'),(566,1,'september'),(567,1,'less'),(568,1,'large'),(569,1,'quite'),(570,1,'far'),(571,1,'away'),(572,1,'distance'),(573,1,'hear'),(574,1,'whistle'),(575,1,'train'),(576,1,'passing'),(577,1,'arriving'),(578,1,'station'),(579,1,'cafe'),(580,1,'kiosk'),(581,1,'tables'),(582,1,'outside'),(583,1,'where'),(584,1,'quick'),(585,1,'lunch'),(586,1,'chat'),(587,1,'cyclists'),(588,1,'before'),(589,1,'heading'),(590,1,'back'),(591,1,'down'),(592,1,'again'),(593,1,'have'),(594,1,'been'),(595,1,'tough'),(596,1,'ended'),(597,1,'being'),(598,1,'enjoyable'),(599,1,'air'),(600,1,'marvel'),(601,1,'work'),(602,1,'rallars'),(603,1,'over'),(604,1,'hundred'),(605,1,'years'),(606,1,'ago'),(607,1,'using'),(608,1,'picks'),(609,1,'showels'),(610,1,'machinery'),(611,1,'highly'),(612,1,'hol'),(613,1,'ulvik'),(614,1,'28'),(615,1,'jane'),(616,1,'cross'),(617,1,'above'),(618,1,'tarcia'),(619,1,'that'),(620,1,'top'),(621,1,'plateau'),(622,1,'de'),(623,1,'vergongeat'),(624,1,'located'),(625,1,'poisoux'),(626,1,'allows'),(627,1,'great'),(628,1,'jura'),(629,1,'mont'),(630,1,'blanc'),(631,1,'panorama');
/*!40000 ALTER TABLE `ezsearch_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsection`
--

DROP TABLE IF EXISTS `ezsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `navigation_part_identifier` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT 'ezcontentnavigationpart',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsection`
--

LOCK TABLES `ezsection` WRITE;
/*!40000 ALTER TABLE `ezsection` DISABLE KEYS */;
INSERT INTO `ezsection` VALUES (1,'standard','','Standard','ezcontentnavigationpart'),(2,'users','','Users','ezusernavigationpart'),(3,'media','','Media','ezmedianavigationpart'),(6,'form',NULL,'Form','ezcontentnavigationpart');
/*!40000 ALTER TABLE `ezsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsite`
--

DROP TABLE IF EXISTS `ezsite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsite`
--

LOCK TABLES `ezsite` WRITE;
/*!40000 ALTER TABLE `ezsite` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezsite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsite_data`
--

DROP TABLE IF EXISTS `ezsite_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsite_data` (
  `name` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsite_data`
--

LOCK TABLES `ezsite_data` WRITE;
/*!40000 ALTER TABLE `ezsite_data` DISABLE KEYS */;
INSERT INTO `ezsite_data` VALUES ('ezplatform-release','3.0.0'),('ezpublish-version','8.0.0');
/*!40000 ALTER TABLE `ezsite_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsite_public_access`
--

DROP TABLE IF EXISTS `ezsite_public_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsite_public_access` (
  `public_access_identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `site_access_group` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `status` int(11) NOT NULL,
  `config` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `site_matcher_host` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`public_access_identifier`),
  KEY `ezsite_public_access_site_id` (`site_id`),
  CONSTRAINT `fk_ezsite_public_access_site_id` FOREIGN KEY (`site_id`) REFERENCES `ezsite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsite_public_access`
--

LOCK TABLES `ezsite_public_access` WRITE;
/*!40000 ALTER TABLE `ezsite_public_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezsite_public_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurl`
--

DROP TABLE IF EXISTS `ezurl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL DEFAULT '0',
  `is_valid` int(11) NOT NULL DEFAULT '1',
  `last_checked` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `original_url_md5` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `url` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`),
  KEY `ezurl_url` (`url`(191))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurl`
--

LOCK TABLES `ezurl` WRITE;
/*!40000 ALTER TABLE `ezurl` DISABLE KEYS */;
INSERT INTO `ezurl` VALUES (23,1448832197,1,0,1448832197,'f76e41d421b2a72232264943026a6ee5','https://doc.ez.no/display/USER/'),(24,1448832277,1,0,1505717756,'a00ab36edb35bb641cc027eb27410934','https://doc.ezplatform.com/en/latest/'),(25,1448832412,1,0,1505717756,'03c4188f5fdcb679192e25a7dad09c2d','https://doc.ezplatform.com/en/latest/tutorials/platform_beginner/building_a_bicycle_route_tracker_in_ez_platform/'),(26,1448832436,1,0,1505717756,'5af7e9599b5583ccd0103a400ddacfdd','https://doc.ez.no/display/MAIN/Transitioning+from+eZ+Publish+to+eZ+Platform%3A+Feature+Comparison'),(27,1448832661,1,0,1448832661,'f9bf96304c434139d0ff5773b6eee157','https://github.com/ezsystems'),(28,1448832661,1,0,1510739262,'265d537bfba0e5ed4e85fbcd7f30ea84','https://discuss.ezplatform.com'),(29,1448832661,1,0,1448832661,'7441963094866aa9d1cbb8a59cca541c','http://ez-community-on-slack.herokuapp.com/');
/*!40000 ALTER TABLE `ezurl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurl_object_link`
--

DROP TABLE IF EXISTS `ezurl_object_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurl_object_link` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_attribute_version` int(11) NOT NULL DEFAULT '0',
  `url_id` int(11) NOT NULL DEFAULT '0',
  KEY `ezurl_ol_coa_id` (`contentobject_attribute_id`),
  KEY `ezurl_ol_url_id` (`url_id`),
  KEY `ezurl_ol_coa_version` (`contentobject_attribute_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurl_object_link`
--

LOCK TABLES `ezurl_object_link` WRITE;
/*!40000 ALTER TABLE `ezurl_object_link` DISABLE KEYS */;
INSERT INTO `ezurl_object_link` VALUES (104,9,23),(104,9,24),(104,9,25),(104,9,26),(104,9,27),(104,9,28),(104,9,29),(104,9,23),(104,9,24),(104,9,25),(104,9,26),(104,9,27),(104,9,28),(104,9,29);
/*!40000 ALTER TABLE `ezurl_object_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurlalias`
--

DROP TABLE IF EXISTS `ezurlalias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurlalias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_url` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `forward_to_id` int(11) NOT NULL DEFAULT '0',
  `is_imported` int(11) NOT NULL DEFAULT '0',
  `is_internal` int(11) NOT NULL DEFAULT '1',
  `is_wildcard` int(11) NOT NULL DEFAULT '0',
  `source_md5` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `source_url` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ezurlalias_source_md5` (`source_md5`),
  KEY `ezurlalias_wcard_fwd` (`is_wildcard`,`forward_to_id`),
  KEY `ezurlalias_forward_to_id` (`forward_to_id`),
  KEY `ezurlalias_imp_wcard_fwd` (`is_imported`,`is_wildcard`,`forward_to_id`),
  KEY `ezurlalias_source_url` (`source_url`(191)),
  KEY `ezurlalias_desturl` (`destination_url`(191))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurlalias`
--

LOCK TABLES `ezurlalias` WRITE;
/*!40000 ALTER TABLE `ezurlalias` DISABLE KEYS */;
INSERT INTO `ezurlalias` VALUES (12,'content/view/full/2',0,1,1,0,'d41d8cd98f00b204e9800998ecf8427e',''),(13,'content/view/full/5',0,1,1,0,'9bc65c2abec141778ffaa729489f3e87','users'),(15,'content/view/full/12',0,1,1,0,'02d4e844e3a660857a3f81585995ffe1','users/guest_accounts'),(16,'content/view/full/13',0,1,1,0,'1b1d79c16700fd6003ea7be233e754ba','users/administrator_users'),(17,'content/view/full/14',0,1,1,0,'0bb9dd665c96bbc1cf36b79180786dea','users/editors'),(18,'content/view/full/15',0,1,1,0,'f1305ac5f327a19b451d82719e0c3f5d','users/administrator_users/administrator_user'),(20,'content/view/full/43',0,1,1,0,'62933a2951ef01f4eafd9bdf4d3cd2f0','media'),(21,'content/view/full/44',0,1,1,0,'3ae1aac958e1c82013689d917d34967a','users/anonymous_users'),(22,'content/view/full/45',0,1,1,0,'aad93975f09371695ba08292fd9698db','users/anonymous_users/anonymous_user'),(28,'content/view/full/51',0,1,1,0,'38985339d4a5aadfc41ab292b4527046','media/images'),(29,'content/view/full/52',0,1,1,0,'ad5a8c6f6aac3b1b9df267fe22e7aef6','media/files'),(30,'content/view/full/53',0,1,1,0,'562a0ac498571c6c3529173184a2657c','media/multimedia');
/*!40000 ALTER TABLE `ezurlalias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurlalias_ml`
--

DROP TABLE IF EXISTS `ezurlalias_ml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurlalias_ml` (
  `parent` int(11) NOT NULL DEFAULT '0',
  `text_md5` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `action` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `action_type` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `alias_redirects` int(11) NOT NULL DEFAULT '1',
  `id` int(11) NOT NULL DEFAULT '0',
  `is_alias` int(11) NOT NULL DEFAULT '0',
  `is_original` int(11) NOT NULL DEFAULT '0',
  `lang_mask` bigint(20) NOT NULL DEFAULT '0',
  `link` int(11) NOT NULL DEFAULT '0',
  `text` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`parent`,`text_md5`),
  KEY `ezurlalias_ml_actt_org_al` (`action_type`,`is_original`,`is_alias`),
  KEY `ezurlalias_ml_text_lang` (`text`(32),`lang_mask`,`parent`),
  KEY `ezurlalias_ml_par_act_id_lnk` (`action`(32),`id`,`link`,`parent`),
  KEY `ezurlalias_ml_par_lnk_txt` (`parent`,`text`(32),`link`),
  KEY `ezurlalias_ml_act_org` (`action`(32),`is_original`),
  KEY `ezurlalias_ml_text` (`text`(32),`id`,`link`),
  KEY `ezurlalias_ml_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurlalias_ml`
--

LOCK TABLES `ezurlalias_ml` WRITE;
/*!40000 ALTER TABLE `ezurlalias_ml` DISABLE KEYS */;
INSERT INTO `ezurlalias_ml` VALUES (0,'3b9effd9776474f4dc4ba6add25c7c60','eznode:63','eznode',0,48,0,1,3,48,'points-of-interest'),(0,'50e2736330de124f6edea9b008556fe6','nop:','nop',1,17,0,0,1,17,'media2'),(0,'62933a2951ef01f4eafd9bdf4d3cd2f0','eznode:43','eznode',1,9,0,1,3,9,'Media'),(0,'76e323bf7efc1fad8935eb37bd557b92','eznode:42','eznode',0,40,0,1,3,40,'ez-platform'),(0,'86425c35a33507d479f71ade53a669aa','nop:','nop',1,3,0,0,1,3,'users2'),(0,'9bc65c2abec141778ffaa729489f3e87','eznode:5','eznode',1,2,0,1,3,2,'Users'),(0,'ac68b62abfd6a9fe26e8ac4236c8ce0c','eznode:55','eznode',0,39,0,1,2,39,'forms'),(0,'d41d8cd98f00b204e9800998ecf8427e','eznode:2','eznode',1,1,0,1,3,1,''),(0,'e9b05f6557c0adad7c548b8ac4ccb334','eznode:56','eznode',0,41,0,1,3,41,'all-rides'),(2,'a147e136bfa717592f2bd70bd4b53b17','eznode:14','eznode',1,6,0,1,3,6,'Editors'),(2,'c2803c3fa1b0b5423237b4e018cae755','eznode:44','eznode',1,10,0,1,3,10,'Anonymous-Users'),(2,'e57843d836e3af8ab611fde9e2139b3a','eznode:12','eznode',1,4,0,1,3,4,'Guest-accounts'),(2,'f89fad7f8a3abc8c09e1deb46a420007','eznode:13','eznode',1,5,0,1,3,5,'Administrator-users'),(3,'505e93077a6dde9034ad97a14ab022b1','nop:','nop',1,11,0,0,1,11,'anonymous_users2'),(3,'70bb992820e73638731aa8de79b3329e','eznode:12','eznode',1,26,0,0,1,4,'guest_accounts'),(3,'a147e136bfa717592f2bd70bd4b53b17','eznode:14','eznode',1,29,0,0,1,6,'editors'),(3,'a7da338c20bf65f9f789c87296379c2a','nop:','nop',1,7,0,0,1,7,'administrator_users2'),(3,'aeb8609aa933b0899aa012c71139c58c','eznode:13','eznode',1,27,0,0,1,5,'administrator_users'),(3,'e9e5ad0c05ee1a43715572e5cc545926','eznode:44','eznode',1,30,0,0,1,10,'anonymous_users'),(5,'5a9d7b0ec93173ef4fedee023209cb61','eznode:15','eznode',1,8,0,1,3,8,'Administrator-User'),(7,'a3cca2de936df1e2f805710399989971','eznode:15','eznode',1,28,0,0,0,8,'administrator_user'),(9,'2e5bc8831f7ae6a29530e7f1bbf2de9c','eznode:53','eznode',1,20,0,1,3,20,'Multimedia'),(9,'45b963397aa40d4a0063e0d85e4fe7a1','eznode:52','eznode',1,19,0,1,3,19,'Files'),(9,'59b514174bffe4ae402b3d63aad79fe0','eznode:51','eznode',1,18,0,1,3,18,'Images'),(10,'ccb62ebca03a31272430bc414bd5cd5b','eznode:45','eznode',1,12,0,1,3,12,'Anonymous-User'),(11,'c593ec85293ecb0e02d50d4c5c6c20eb','eznode:45','eznode',1,31,0,0,1,12,'anonymous_user'),(17,'2e5bc8831f7ae6a29530e7f1bbf2de9c','eznode:53','eznode',1,34,0,0,1,20,'multimedia'),(17,'45b963397aa40d4a0063e0d85e4fe7a1','eznode:52','eznode',1,33,0,0,1,19,'files'),(17,'59b514174bffe4ae402b3d63aad79fe0','eznode:51','eznode',1,32,0,0,1,18,'images'),(19,'2c5f0c4eb6b8ba8d176b87665bdbe1af','eznode:54','eznode',0,38,0,1,3,38,'form-uploads'),(41,'17ca0da4a30b54ddde8999f371ac1455','eznode:58','eznode',0,43,0,1,3,43,'finnish-coastline-from-rauma-to-pori'),(41,'ae95ff7623ff6f6ea6acd4384649f5fd','eznode:61','eznode',1,46,0,1,3,46,'rallarvegen-in-norway'),(41,'d35acb17ec0d0f90b13aee364acb3bc7','eznode:59','eznode',1,44,0,1,3,44,'baby-tour-of-the-battenkill'),(41,'ef449d96788bc3c56d32d0dddc0f0231','eznode:60','eznode',1,45,0,1,3,45,'meillonnas-terrain-track'),(41,'ef6af7589e8365c81ae5af713032bd4c','eznode:62','eznode',1,47,0,1,3,47,'lookouts-between-coligny-and-montagna-le-reconduit'),(48,'a803537cd8be46e54eed190daa10cc67','eznode:64','eznode',1,49,0,1,3,49,'plateau-de-vergongeat'),(48,'f2ff093ce4ec5aad7fab7dc8aadebb69','eznode:65','eznode',1,50,0,1,3,50,'cross-above-tarcia');
/*!40000 ALTER TABLE `ezurlalias_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurlalias_ml_incr`
--

DROP TABLE IF EXISTS `ezurlalias_ml_incr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurlalias_ml_incr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurlalias_ml_incr`
--

LOCK TABLES `ezurlalias_ml_incr` WRITE;
/*!40000 ALTER TABLE `ezurlalias_ml_incr` DISABLE KEYS */;
INSERT INTO `ezurlalias_ml_incr` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50);
/*!40000 ALTER TABLE `ezurlalias_ml_incr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurlwildcard`
--

DROP TABLE IF EXISTS `ezurlwildcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurlwildcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_url` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `source_url` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurlwildcard`
--

LOCK TABLES `ezurlwildcard` WRITE;
/*!40000 ALTER TABLE `ezurlwildcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezurlwildcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezuser`
--

DROP TABLE IF EXISTS `ezuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezuser` (
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `login` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `password_hash_type` int(11) NOT NULL DEFAULT '1',
  `password_updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentobject_id`),
  UNIQUE KEY `ezuser_login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezuser`
--

LOCK TABLES `ezuser` WRITE;
/*!40000 ALTER TABLE `ezuser` DISABLE KEYS */;
INSERT INTO `ezuser` VALUES (10,'nospam@ez.no','anonymous','$2y$10$35gOSQs6JK4u4whyERaeUuVeQBi2TUBIZIfP7HEj7sfz.MxvTuOeC',7,NULL),(14,'nospam@ez.no','admin','$2y$10$FDn9NPwzhq85cLLxfD5Wu.L3SL3Z/LNCvhkltJUV0wcJj7ciJg2oy',7,NULL);
/*!40000 ALTER TABLE `ezuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezuser_accountkey`
--

DROP TABLE IF EXISTS `ezuser_accountkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezuser_accountkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash_key` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hash_key` (`hash_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezuser_accountkey`
--

LOCK TABLES `ezuser_accountkey` WRITE;
/*!40000 ALTER TABLE `ezuser_accountkey` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezuser_accountkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezuser_role`
--

DROP TABLE IF EXISTS `ezuser_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezuser_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentobject_id` int(11) DEFAULT NULL,
  `limit_identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `limit_value` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezuser_role_role_id` (`role_id`),
  KEY `ezuser_role_contentobject_id` (`contentobject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezuser_role`
--

LOCK TABLES `ezuser_role` WRITE;
/*!40000 ALTER TABLE `ezuser_role` DISABLE KEYS */;
INSERT INTO `ezuser_role` VALUES (28,11,'','',1),(31,42,'','',1),(32,13,'Subtree','/1/2/',3),(33,13,'Subtree','/1/43/',3),(34,12,'','',2),(35,13,'','',4);
/*!40000 ALTER TABLE `ezuser_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezuser_setting`
--

DROP TABLE IF EXISTS `ezuser_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezuser_setting` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `is_enabled` int(11) NOT NULL DEFAULT '0',
  `max_login` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezuser_setting`
--

LOCK TABLES `ezuser_setting` WRITE;
/*!40000 ALTER TABLE `ezuser_setting` DISABLE KEYS */;
INSERT INTO `ezuser_setting` VALUES (10,1,1000),(14,1,10);
/*!40000 ALTER TABLE `ezuser_setting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-22  2:16:49