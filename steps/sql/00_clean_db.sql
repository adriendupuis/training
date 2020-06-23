-- MySQL dump 10.17  Distrib 10.3.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ezplatform-ee-dev
-- ------------------------------------------------------
-- Server version	10.3.22-MariaDB-0ubuntu0.19.10.1

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
-- Table structure for table `ezbinaryfile`
--

DROP TABLE IF EXISTS `ezbinaryfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezbinaryfile` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT 0,
  `version` int(11) NOT NULL DEFAULT 0,
  `download_count` int(11) NOT NULL DEFAULT 0,
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
  `default_language_id` bigint(20) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `language_mask` bigint(20) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
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
  `default_language_id` bigint(20) NOT NULL DEFAULT 0,
  `identifier` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `language_mask` bigint(20) NOT NULL DEFAULT 0,
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
  `contentobject_state_group_id` int(11) NOT NULL DEFAULT 0,
  `real_language_id` bigint(20) NOT NULL DEFAULT 0,
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `language_id` bigint(20) NOT NULL DEFAULT 0,
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
  `contentobject_state_id` int(11) NOT NULL DEFAULT 0,
  `language_id` bigint(20) NOT NULL DEFAULT 0,
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
  `contentobject_id` int(11) NOT NULL DEFAULT 0,
  `contentobject_state_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`contentobject_id`,`contentobject_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state_link`
--

LOCK TABLES `ezcobj_state_link` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_link` DISABLE KEYS */;
INSERT INTO `ezcobj_state_link` VALUES (1,1),(4,1),(10,1),(11,1),(12,1),(13,1),(14,1),(41,1),(42,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1);
/*!40000 ALTER TABLE `ezcobj_state_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontent_language`
--

DROP TABLE IF EXISTS `ezcontent_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontent_language` (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `disabled` int(11) NOT NULL DEFAULT 0,
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
  `node_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
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
  `version` int(11) NOT NULL DEFAULT 0,
  `always_available` int(11) NOT NULL DEFAULT 0,
  `contentobject_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT 0,
  `creator_id` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `initial_language_id` bigint(20) NOT NULL DEFAULT 0,
  `is_container` int(11) NOT NULL DEFAULT 0,
  `language_mask` bigint(20) NOT NULL DEFAULT 0,
  `modified` int(11) NOT NULL DEFAULT 0,
  `modifier_id` int(11) NOT NULL DEFAULT 0,
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `serialized_description_list` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `serialized_name_list` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sort_field` int(11) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 1,
  `url_alias_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`version`),
  KEY `ezcontentclass_version` (`version`),
  KEY `ezcontentclass_identifier` (`identifier`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass`
--

LOCK TABLES `ezcontentclass` WRITE;
/*!40000 ALTER TABLE `ezcontentclass` DISABLE KEYS */;
INSERT INTO `ezcontentclass` VALUES (1,0,1,'<short_name|name>',1024392098,14,'folder',2,1,2,1448831672,14,'a3d405b81be900468eb153d774f4f0d2','a:0:{}','a:1:{s:6:\"eng-GB\";s:6:\"Folder\";}',1,1,NULL),(2,0,0,'<short_title|title>',1024392098,14,'article',2,1,3,1082454989,14,'c15b600eb9198b1924063b5a68758232',NULL,'a:2:{s:6:\"eng-GB\";s:7:\"Article\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL),(3,0,1,'<name>',1024392098,14,'user_group',2,1,3,1048494743,14,'25b4268cdcd01921b808a0d854b877ef',NULL,'a:2:{s:6:\"eng-GB\";s:10:\"User group\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL),(4,0,1,'<first_name> <last_name>',1024392098,14,'user',2,0,3,1082018364,14,'40faa822edc579b02c25f6bb7beec3ad',NULL,'a:2:{s:6:\"eng-GB\";s:4:\"User\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL),(5,0,1,'<name>',1031484992,14,'image',2,0,3,1048494784,14,'f6df12aa74e36230eb675f364fccd25a',NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL),(12,0,1,'<name>',1052385472,14,'file',2,0,3,1052385669,14,'637d58bfddf164627bdfd265733280a0',NULL,'a:2:{s:6:\"eng-GB\";s:4:\"File\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL),(42,0,1,'<name>',1435924826,14,'landing_page',2,1,2,1435924826,14,'60c03e9758465eb69d56b3afb6adf18e','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:12:\"Landing page\";}',2,0,''),(43,0,1,'<title>',1537166773,14,'form',2,0,2,1537166834,14,'6f7f21df775a33c1e4bbc76b48c38476','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Form\";}',2,0,'');
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
  `version` int(11) NOT NULL DEFAULT 0,
  `can_translate` int(11) DEFAULT 1,
  `category` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `contentclass_id` int(11) NOT NULL DEFAULT 0,
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
  `data_text5` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_type_string` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `identifier` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `is_information_collector` int(11) NOT NULL DEFAULT 0,
  `is_required` int(11) NOT NULL DEFAULT 0,
  `is_searchable` int(11) NOT NULL DEFAULT 0,
  `is_thumbnail` tinyint(1) NOT NULL DEFAULT 0,
  `placement` int(11) NOT NULL DEFAULT 0,
  `serialized_data_text` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `serialized_description_list` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `serialized_name_list` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`,`version`),
  KEY `ezcontentclass_attr_ccid` (`contentclass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass_attribute`
--

LOCK TABLES `ezcontentclass_attribute` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_attribute` DISABLE KEYS */;
INSERT INTO `ezcontentclass_attribute` VALUES (1,0,1,'',2,0,0,0,0,255,0,0,0,'New article','','','','','ezstring','title',0,1,1,0,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Title\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(4,0,1,'',1,NULL,NULL,NULL,NULL,255,0,NULL,NULL,'Folder',NULL,NULL,NULL,NULL,'ezstring','name',0,1,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}'),(6,0,1,'',3,0,0,0,0,255,0,0,0,'','','','',NULL,'ezstring','name',0,1,1,0,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Name\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(7,0,1,'',3,0,0,0,0,255,0,0,0,'','','','',NULL,'ezstring','description',0,0,1,0,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:11:\"Description\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(8,0,1,'',4,0,0,0,0,255,0,0,0,'','','','','','ezstring','first_name',0,1,1,0,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:10:\"First name\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(9,0,1,'',4,0,0,0,0,255,0,0,0,'','','','','','ezstring','last_name',0,1,1,0,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:9:\"Last name\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(12,0,0,'',4,0,0,0,0,7,10,0,0,'','^[^@]+$','','','','ezuser','user_account',0,1,0,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:12:\"User account\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(116,0,1,'',5,0,0,0,0,150,0,0,0,'','','','',NULL,'ezstring','name',0,1,1,0,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Name\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(117,0,1,'',5,0,0,0,0,10,0,0,0,'','','','',NULL,'ezrichtext','caption',0,0,1,0,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:7:\"Caption\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(118,0,1,'',5,0,0,0,0,10,0,0,0,'','','','',NULL,'ezimage','image',0,0,0,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(119,0,1,'',1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','short_description',0,0,1,0,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Short description\";}'),(120,0,1,'',2,0,0,0,0,10,0,0,0,'','','','','','ezrichtext','intro',0,1,1,0,4,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Intro\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(121,0,1,'',2,0,0,0,0,20,0,0,0,'','','','','','ezrichtext','body',0,0,1,0,5,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Body\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(123,0,0,'',2,0,0,0,0,0,0,0,0,'','','','','','ezboolean','enable_comments',0,0,0,0,6,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:15:\"Enable comments\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(146,0,1,'',12,0,0,0,0,0,0,0,0,'New file','','','',NULL,'ezstring','name',0,1,1,0,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Name\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(147,0,1,'',12,0,0,0,0,10,0,0,0,'','','','',NULL,'ezrichtext','description',0,0,1,0,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:11:\"Description\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(148,0,1,'',12,0,0,0,0,0,0,0,0,'','','','',NULL,'ezbinaryfile','file',0,1,0,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"File\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(152,0,1,'',2,0,0,0,0,255,0,0,0,'','','','','','ezstring','short_title',0,0,1,0,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:11:\"Short title\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(153,0,1,'',2,0,0,0,0,1,0,0,0,'','','','','','ezauthor','author',0,0,0,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:6:\"Author\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(154,0,1,'',2,0,0,0,0,0,0,0,0,'','','','','','ezobjectrelation','image',0,0,1,0,7,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(155,0,1,'',1,NULL,NULL,NULL,NULL,100,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','short_name',0,0,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:10:\"Short name\";}'),(156,0,1,'',1,NULL,NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','description',0,0,1,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}'),(179,0,1,'',4,0,0,0,0,10,0,0,0,'','','','','','eztext','signature',0,0,1,0,4,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:9:\"Signature\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(180,0,1,'',4,0,0,0,0,10,0,0,0,'','','','','','ezimage','image',0,0,0,0,5,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(185,0,1,'content',42,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','name',0,1,1,0,10,'N;','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(186,0,1,'content',42,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','description',0,1,1,0,20,'N;','a:1:{s:6:\"eng-GB\";s:24:\"Landing page description\";}','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}'),(187,0,1,'content',42,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezlandingpage','page',0,0,0,0,30,'N;','a:1:{s:6:\"eng-GB\";s:12:\"Landing page\";}','a:1:{s:6:\"eng-GB\";s:12:\"Landing page\";}'),(188,0,1,'content',43,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','title',0,1,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(189,0,1,'content',43,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezform','form',0,0,0,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Form\";}');
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
  `description` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_text` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_json` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
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
/*!40000 ALTER TABLE `ezcontentclass_attribute_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass_classgroup`
--

DROP TABLE IF EXISTS `ezcontentclass_classgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass_classgroup` (
  `contentclass_id` int(11) NOT NULL DEFAULT 0,
  `contentclass_version` int(11) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 0,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`contentclass_id`,`contentclass_version`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass_classgroup`
--

LOCK TABLES `ezcontentclass_classgroup` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_classgroup` DISABLE KEYS */;
INSERT INTO `ezcontentclass_classgroup` VALUES (1,0,1,'Content'),(2,0,1,'Content'),(3,0,2,'Users'),(4,0,2,'Users'),(5,0,3,'Media'),(12,0,3,'Media'),(42,0,1,'Content'),(43,0,1,'Content');
/*!40000 ALTER TABLE `ezcontentclass_classgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass_name`
--

DROP TABLE IF EXISTS `ezcontentclass_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass_name` (
  `contentclass_id` int(11) NOT NULL DEFAULT 0,
  `contentclass_version` int(11) NOT NULL DEFAULT 0,
  `language_id` bigint(20) NOT NULL DEFAULT 0,
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
INSERT INTO `ezcontentclass_name` VALUES (1,0,2,'eng-GB','Folder'),(2,0,3,'eng-GB','Article'),(3,0,3,'eng-GB','User group'),(4,0,3,'eng-GB','User'),(5,0,3,'eng-GB','Image'),(12,0,3,'eng-GB','File'),(42,0,2,'eng-GB','Landing page'),(43,0,2,'eng-GB','Form');
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
  `created` int(11) NOT NULL DEFAULT 0,
  `creator_id` int(11) NOT NULL DEFAULT 0,
  `modified` int(11) NOT NULL DEFAULT 0,
  `modifier_id` int(11) NOT NULL DEFAULT 0,
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
  `contentclass_id` int(11) NOT NULL DEFAULT 0,
  `current_version` int(11) DEFAULT NULL,
  `initial_language_id` bigint(20) NOT NULL DEFAULT 0,
  `language_mask` bigint(20) NOT NULL DEFAULT 0,
  `modified` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `owner_id` int(11) NOT NULL DEFAULT 0,
  `published` int(11) NOT NULL DEFAULT 0,
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `section_id` int(11) NOT NULL DEFAULT 0,
  `status` int(11) DEFAULT 0,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezcontentobject_remote_id` (`remote_id`),
  KEY `ezcontentobject_classid` (`contentclass_id`),
  KEY `ezcontentobject_lmask` (`language_mask`),
  KEY `ezcontentobject_pub` (`published`),
  KEY `ezcontentobject_section` (`section_id`),
  KEY `ezcontentobject_currentversion` (`current_version`),
  KEY `ezcontentobject_owner` (`owner_id`),
  KEY `ezcontentobject_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject`
--

LOCK TABLES `ezcontentobject` WRITE;
/*!40000 ALTER TABLE `ezcontentobject` DISABLE KEYS */;
INSERT INTO `ezcontentobject` VALUES (1,1,9,2,3,1448889046,'eZ Platform',14,1448889046,'9459d3c29e15006e45197295722c7ade',1,1,0),(4,3,1,2,3,1033917596,'Users',14,1033917596,'f5c88a2209584891056f987fd965b0ba',2,1,0),(10,4,2,2,3,1072180405,'Anonymous User',14,1033920665,'faaeb9be3bd98ed09f606fc16d144eca',2,1,0),(11,3,1,2,3,1033920746,'Guest accounts',14,1033920746,'5f7f0bdb3381d6a461d8c29ff53d908f',2,1,0),(12,3,1,2,3,1033920775,'Administrator users',14,1033920775,'9b47a45624b023b1a76c73b74d704acf',2,1,0),(13,3,1,2,3,1033920794,'Editors',14,1033920794,'3c160cca19fb135f83bd02d911f04db2',2,1,0),(14,4,3,2,3,1301062024,'Administrator User',14,1033920830,'1bb4fe25487f05527efa8bfd394cecc7',2,1,0),(41,1,1,2,3,1060695457,'Media',14,1060695457,'a6e35cbcb7cd6ae4b691f3eee30cd262',3,1,0),(42,3,1,2,3,1072180330,'Anonymous Users',14,1072180330,'15b256dbea2ae72418ff5facc999e8f9',2,1,0),(49,1,1,2,3,1080220197,'Images',14,1080220197,'e7ff633c6b8e0fd3531e74c6e712bead',3,1,0),(50,1,1,2,3,1080220220,'Files',14,1080220220,'732a5acd01b51a6fe6eab448ad4138a9',3,1,0),(51,1,1,2,3,1080220233,'Multimedia',14,1080220233,'09082deb98662a104f325aaa8c4933d3',3,1,0),(52,42,1,2,3,1442481743,'Welcome to eZ Platform Enterprise Edition',14,1442481743,'34720ff636e1d4ce512f762dc638e4ac',1,1,0),(53,1,1,2,3,1486473151,'Form Uploads',14,1486473151,'6797ab09a3e84316f09c4ccabce90e2d',3,1,0),(54,1,1,2,2,1537166893,'Forms',14,1537166893,'9e863fbb0fb835ce050032b4f00de61d',6,1,0);
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
  `version` int(11) NOT NULL DEFAULT 0,
  `attribute_original_id` int(11) DEFAULT 0,
  `contentclassattribute_id` int(11) NOT NULL DEFAULT 0,
  `contentobject_id` int(11) NOT NULL DEFAULT 0,
  `data_float` double DEFAULT NULL,
  `data_int` int(11) DEFAULT NULL,
  `data_text` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_type_string` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `language_code` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `language_id` bigint(20) NOT NULL DEFAULT 0,
  `sort_key_int` int(11) NOT NULL DEFAULT 0,
  `sort_key_string` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`version`),
  KEY `ezcontentobject_attribute_co_id_ver_lang_code` (`contentobject_id`,`version`,`language_code`),
  KEY `ezcontentobject_classattr_id` (`contentclassattribute_id`),
  KEY `sort_key_string` (`sort_key_string`(191)),
  KEY `ezcontentobject_attribute_language_code` (`language_code`),
  KEY `sort_key_int` (`sort_key_int`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_attribute`
--

LOCK TABLES `ezcontentobject_attribute` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_attribute` DISABLE KEYS */;
INSERT INTO `ezcontentobject_attribute` VALUES (1,9,0,4,1,NULL,NULL,'Welcome to eZ Platform','ezstring','eng-GB',3,0,'welcome to ez platform'),(2,9,0,119,1,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?><section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>You are now ready to start your project.</para></section>','ezrichtext','eng-GB',3,0,''),(7,1,0,7,4,NULL,NULL,'Main group','ezstring','eng-GB',3,0,''),(8,1,0,6,4,NULL,NULL,'Users','ezstring','eng-GB',3,0,''),(19,2,0,8,10,0,0,'Anonymous','ezstring','eng-GB',3,0,'anonymous'),(20,2,0,9,10,0,0,'User','ezstring','eng-GB',3,0,'user'),(21,2,0,12,10,0,0,'','ezuser','eng-GB',3,0,''),(22,1,0,6,11,0,0,'Guest accounts','ezstring','eng-GB',3,0,''),(23,1,0,7,11,0,0,'','ezstring','eng-GB',3,0,''),(24,1,0,6,12,0,0,'Administrator users','ezstring','eng-GB',3,0,''),(25,1,0,7,12,0,0,'','ezstring','eng-GB',3,0,''),(26,1,0,6,13,0,0,'Editors','ezstring','eng-GB',3,0,''),(27,1,0,7,13,0,0,'','ezstring','eng-GB',3,0,''),(28,3,0,8,14,0,0,'Administrator','ezstring','eng-GB',3,0,'administrator'),(29,3,0,9,14,0,0,'User','ezstring','eng-GB',3,0,'user'),(30,3,30,12,14,0,0,'','ezuser','eng-GB',3,0,''),(98,1,0,4,41,0,0,'Media','ezstring','eng-GB',3,0,''),(99,1,0,119,41,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(100,1,0,6,42,0,0,'Anonymous Users','ezstring','eng-GB',3,0,'anonymous users'),(101,1,0,7,42,0,0,'User group for the anonymous user','ezstring','eng-GB',3,0,'user group for the anonymous user'),(102,9,0,155,1,NULL,NULL,'eZ Platform','ezstring','eng-GB',3,0,'ez platform'),(103,1,0,155,41,0,0,'','ezstring','eng-GB',3,0,''),(104,9,0,156,1,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?><section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>This is the clean installation coming with eZ Platform. It\'s a bare-bones setup of the Platform, an excellent foundation to build upon if you want to start your project from scratch.</para></section>','ezrichtext','eng-GB',3,0,''),(105,1,0,156,41,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(142,1,0,4,49,0,0,'Images','ezstring','eng-GB',3,0,'images'),(143,1,0,155,49,0,0,'','ezstring','eng-GB',3,0,''),(144,1,0,119,49,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(145,1,0,156,49,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(147,1,0,4,50,0,0,'Files','ezstring','eng-GB',3,0,'files'),(148,1,0,155,50,0,0,'','ezstring','eng-GB',3,0,''),(149,1,0,119,50,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(150,1,0,156,50,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(152,1,0,4,51,0,0,'Multimedia','ezstring','eng-GB',3,0,'multimedia'),(153,1,0,155,51,0,0,'','ezstring','eng-GB',3,0,''),(154,1,0,119,51,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(155,1,0,156,51,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(177,2,0,179,10,0,0,'','eztext','eng-GB',3,0,''),(178,3,0,179,14,0,0,'','eztext','eng-GB',3,0,''),(179,2,0,180,10,0,0,'','ezimage','eng-GB',3,0,''),(180,3,0,180,14,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"\" filename=\"\" suffix=\"\" basename=\"\" dirpath=\"\" url=\"\" original_filename=\"\" mime_type=\"\" width=\"\" height=\"\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1301057722\"><original attribute_id=\"180\" attribute_version=\"3\" attribute_language=\"eng-GB\"/></ezimage>\n','ezimage','eng-GB',3,0,''),(242,1,0,185,52,NULL,NULL,'Welcome to eZ Platform Enterprise Edition','ezstring','eng-GB',3,0,'welcome to ez platform enterprise edition'),(243,1,0,186,52,NULL,NULL,'You are now ready to start your project.','ezstring','eng-GB',3,0,'you are now ready to start your project.'),(244,1,0,187,52,NULL,NULL,NULL,'ezlandingpage','eng-GB',3,0,'welcome to ez platform enterprise edition'),(245,1,0,4,53,NULL,NULL,'Form Uploads','ezstring','eng-GB',3,0,'form uploads'),(246,1,0,155,53,NULL,NULL,'form uploads','ezstring','eng-GB',3,0,'form uploads'),(247,1,0,119,53,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>Folder for file uploads</para></section>\n','ezrichtext','eng-GB',3,0,''),(248,1,0,156,53,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(249,1,0,4,54,NULL,NULL,'Forms','ezstring','eng-GB',2,0,'forms'),(250,1,0,155,54,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(251,1,0,119,54,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',2,0,''),(252,1,0,156,54,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',2,0,'');
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
  `contentclassattribute_id` int(11) NOT NULL DEFAULT 0,
  `from_contentobject_id` int(11) NOT NULL DEFAULT 0,
  `from_contentobject_version` int(11) NOT NULL DEFAULT 0,
  `relation_type` int(11) NOT NULL DEFAULT 1,
  `to_contentobject_id` int(11) NOT NULL DEFAULT 0,
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
  `contentobject_id` int(11) NOT NULL DEFAULT 0,
  `content_version` int(11) NOT NULL DEFAULT 0,
  `content_translation` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `language_id` bigint(20) NOT NULL DEFAULT 0,
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
INSERT INTO `ezcontentobject_name` VALUES (1,9,'eng-GB',2,'eZ Platform','eng-GB'),(4,1,'eng-GB',3,'Users','eng-GB'),(10,2,'eng-GB',3,'Anonymous User','eng-GB'),(11,1,'eng-GB',3,'Guest accounts','eng-GB'),(12,1,'eng-GB',3,'Administrator users','eng-GB'),(13,1,'eng-GB',3,'Editors','eng-GB'),(14,3,'eng-GB',3,'Administrator User','eng-GB'),(41,1,'eng-GB',3,'Media','eng-GB'),(42,1,'eng-GB',3,'Anonymous Users','eng-GB'),(49,1,'eng-GB',3,'Images','eng-GB'),(50,1,'eng-GB',3,'Files','eng-GB'),(51,1,'eng-GB',3,'Multimedia','eng-GB'),(52,1,'eng-GB',2,'Welcome to eZ Platform Enterprise Edition','eng-GB'),(53,1,'eng-GB',2,'Form Uploads','eng-GB'),(54,1,'eng-GB',3,'Forms','eng-GB');
/*!40000 ALTER TABLE `ezcontentobject_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_trash`
--

DROP TABLE IF EXISTS `ezcontentobject_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_trash` (
  `node_id` int(11) NOT NULL DEFAULT 0,
  `contentobject_id` int(11) DEFAULT NULL,
  `contentobject_version` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT 0,
  `is_hidden` int(11) NOT NULL DEFAULT 0,
  `is_invisible` int(11) NOT NULL DEFAULT 0,
  `main_node_id` int(11) DEFAULT NULL,
  `modified_subnode` int(11) DEFAULT 0,
  `parent_node_id` int(11) NOT NULL DEFAULT 0,
  `path_identification_string` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `path_string` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT 0,
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `sort_field` int(11) DEFAULT 1,
  `sort_order` int(11) DEFAULT 1,
  `trashed` int(11) NOT NULL DEFAULT 0,
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
  `depth` int(11) NOT NULL DEFAULT 0,
  `is_hidden` int(11) NOT NULL DEFAULT 0,
  `is_invisible` int(11) NOT NULL DEFAULT 0,
  `main_node_id` int(11) DEFAULT NULL,
  `modified_subnode` int(11) DEFAULT 0,
  `parent_node_id` int(11) NOT NULL DEFAULT 0,
  `path_identification_string` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `path_string` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT 0,
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `sort_field` int(11) DEFAULT 1,
  `sort_order` int(11) DEFAULT 1,
  PRIMARY KEY (`node_id`),
  KEY `ezcontentobject_tree_p_node_id` (`parent_node_id`),
  KEY `ezcontentobject_tree_path_ident` (`path_identification_string`(50)),
  KEY `ezcontentobject_tree_contentobject_id_path_string` (`path_string`(191),`contentobject_id`),
  KEY `ezcontentobject_tree_co_id` (`contentobject_id`),
  KEY `ezcontentobject_tree_depth` (`depth`),
  KEY `ezcontentobject_tree_path` (`path_string`(191)),
  KEY `modified_subnode` (`modified_subnode`),
  KEY `ezcontentobject_tree_remote_id` (`remote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_tree`
--

LOCK TABLES `ezcontentobject_tree` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_tree` DISABLE KEYS */;
INSERT INTO `ezcontentobject_tree` VALUES (1,0,1,1,0,0,0,1,1448999778,1,'','/1/',0,'629709ba256fe317c3ddcee35453a96a',1,1),(2,52,1,1,1,0,0,2,1301073466,1,'node_2','/1/2/',0,'f3e90596361e31d496d4026eb624c983',8,1),(5,4,1,1,1,0,0,5,1301062024,1,'users','/1/5/',0,'3f6d92f8044aed134f32153517850f5a',1,1),(12,11,1,1,2,0,0,12,1081860719,5,'users/guest_accounts','/1/5/12/',0,'602dcf84765e56b7f999eaafd3821dd3',1,1),(13,12,1,1,2,0,0,13,1301062024,5,'users/administrator_users','/1/5/13/',0,'769380b7aa94541679167eab817ca893',1,1),(14,13,1,1,2,0,0,14,1081860719,5,'users/editors','/1/5/14/',0,'f7dda2854fc68f7c8455d9cb14bd04a9',1,1),(15,14,1,3,3,0,0,15,1301062024,13,'users/administrator_users/administrator_user','/1/5/13/15/',0,'e5161a99f733200b9ed4e80f9c16187b',1,1),(42,1,1,9,2,0,0,42,1486473151,2,'node_2/ez_platform','/1/2/42/',0,'581da01017b80b1afb1e5e2a3081c724',1,1),(43,41,1,1,1,0,0,43,1081860720,1,'media','/1/43/',0,'75c715a51699d2d309a924eca6a95145',9,1),(44,42,1,1,2,0,0,44,1081860719,5,'users/anonymous_users','/1/5/44/',0,'4fdf0072da953bb276c0c7e0141c5c9b',9,1),(45,10,1,2,3,0,0,45,1081860719,44,'users/anonymous_users/anonymous_user','/1/5/44/45/',0,'2cf8343bee7b482bab82b269d8fecd76',9,1),(51,49,1,1,2,0,0,51,1081860720,43,'media/images','/1/43/51/',0,'1b26c0454b09bb49dfb1b9190ffd67cb',9,1),(52,50,1,1,2,0,0,52,1081860720,43,'media/files','/1/43/52/',0,'0b113a208f7890f9ad3c24444ff5988c',9,1),(53,51,1,1,2,0,0,53,1081860720,43,'media/multimedia','/1/43/53/',0,'4f18b82c75f10aad476cae5adf98c11f',9,1),(54,53,1,1,3,0,0,54,1486473151,52,'media/files/form_uploads','/1/43/52/54/',0,'0543630fa051a1e2be54dbd32da2420f',1,1),(55,54,1,1,1,0,0,55,1537166893,1,'forms','/1/55/',0,'1dad43be47e3a5c12cd06010aab65112',9,1);
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
  `created` int(11) NOT NULL DEFAULT 0,
  `creator_id` int(11) NOT NULL DEFAULT 0,
  `initial_language_id` bigint(20) NOT NULL DEFAULT 0,
  `language_mask` bigint(20) NOT NULL DEFAULT 0,
  `modified` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `version` int(11) NOT NULL DEFAULT 0,
  `workflow_event_pos` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ezcobj_version_status` (`status`),
  KEY `idx_object_version_objver` (`contentobject_id`,`version`),
  KEY `ezcontobj_version_obj_status` (`contentobject_id`,`status`),
  KEY `ezcobj_version_creator_id` (`creator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=515 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_version`
--

LOCK TABLES `ezcontentobject_version` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_version` DISABLE KEYS */;
INSERT INTO `ezcontentobject_version` VALUES (4,4,0,14,2,3,0,1,0,1,1),(439,11,1033920737,14,2,3,1033920746,1,0,1,0),(440,12,1033920760,14,2,3,1033920775,1,0,1,0),(441,13,1033920786,14,2,3,1033920794,1,0,1,0),(472,41,1060695450,14,2,3,1060695457,1,0,1,0),(473,42,1072180278,14,2,3,1072180330,1,0,1,0),(474,10,1072180337,14,2,3,1072180405,1,0,2,0),(488,49,1080220181,14,2,3,1080220197,1,0,1,0),(489,50,1080220211,14,2,3,1080220220,1,0,1,0),(490,51,1080220225,14,2,3,1080220233,1,0,1,0),(499,14,1301061783,14,2,3,1301062024,1,0,3,0),(506,1,1448889045,14,2,3,1448889046,1,0,9,0),(512,52,1442481742,14,2,3,1442481743,1,0,1,0),(513,53,1486473143,14,2,3,1486473151,1,0,1,0),(514,54,1537166893,14,2,2,1537166893,1,0,1,0);
/*!40000 ALTER TABLE `ezcontentobject_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezdatebasedpublisher_scheduled_entries`
--

DROP TABLE IF EXISTS `ezdatebasedpublisher_scheduled_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezdatebasedpublisher_scheduled_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `version_id` int(11) DEFAULT NULL,
  `version_number` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `action_timestamp` int(11) NOT NULL,
  `action` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `url_root` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_id_version_number_action` (`content_id`,`version_number`,`action`),
  KEY `content_id` (`content_id`),
  KEY `version_id` (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezdatebasedpublisher_scheduled_entries`
--

LOCK TABLES `ezdatebasedpublisher_scheduled_entries` WRITE;
/*!40000 ALTER TABLE `ezdatebasedpublisher_scheduled_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezdatebasedpublisher_scheduled_entries` ENABLE KEYS */;
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
  `size` bigint(20) unsigned NOT NULL DEFAULT 0,
  `mtime` int(11) NOT NULL DEFAULT 0,
  `expired` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
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
  `result` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_workflow_id_markings` (`workflow_id`),
  CONSTRAINT `fk_ezeditorialworkflow_markings_workflow_id` FOREIGN KEY (`workflow_id`) REFERENCES `ezeditorialworkflow_workflows` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezeditorialworkflow_markings`
--

LOCK TABLES `ezeditorialworkflow_markings` WRITE;
/*!40000 ALTER TABLE `ezeditorialworkflow_markings` DISABLE KEYS */;
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
  `comment` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezeditorialworkflow_workflows`
--

LOCK TABLES `ezeditorialworkflow_workflows` WRITE;
/*!40000 ALTER TABLE `ezeditorialworkflow_workflows` DISABLE KEYS */;
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
  `value` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
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
  `value` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
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
  `value` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
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
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT 0,
  `contentobject_version` int(11) NOT NULL DEFAULT 0,
  `latitude` double NOT NULL DEFAULT 0,
  `longitude` double NOT NULL DEFAULT 0,
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
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT 0,
  `filepath` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ezimagefile_file` (`filepath`(191)),
  KEY `ezimagefile_coid` (`contentobject_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezimagefile`
--

LOCK TABLES `ezimagefile` WRITE;
/*!40000 ALTER TABLE `ezimagefile` DISABLE KEYS */;
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
  `class_id` int(11) NOT NULL DEFAULT 0,
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
  `keyword_id` int(11) NOT NULL DEFAULT 0,
  `objectattribute_id` int(11) NOT NULL DEFAULT 0,
  `version` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ezkeyword_attr_link_oaid` (`objectattribute_id`),
  KEY `ezkeyword_attr_link_kid_oaid` (`keyword_id`,`objectattribute_id`),
  KEY `ezkeyword_attr_link_oaid_ver` (`objectattribute_id`,`version`)
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
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT 0,
  `version` int(11) NOT NULL DEFAULT 0,
  `controls` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `has_controller` int(11) DEFAULT 0,
  `height` int(11) DEFAULT NULL,
  `is_autoplay` int(11) DEFAULT 0,
  `is_loop` int(11) DEFAULT 0,
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
  `from_node_id` int(11) DEFAULT 0,
  `is_main` int(11) NOT NULL DEFAULT 0,
  `op_code` int(11) NOT NULL DEFAULT 0,
  `parent_node` int(11) DEFAULT NULL,
  `parent_remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `sort_field` int(11) DEFAULT 1,
  `sort_order` int(11) DEFAULT 1,
  `priority` int(11) NOT NULL DEFAULT 0,
  `is_hidden` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `eznode_assignment_is_main` (`is_main`),
  KEY `eznode_assignment_coid_cov` (`contentobject_id`,`contentobject_version`),
  KEY `eznode_assignment_parent_node` (`parent_node`),
  KEY `eznode_assignment_co_version` (`contentobject_version`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eznode_assignment`
--

LOCK TABLES `eznode_assignment` WRITE;
/*!40000 ALTER TABLE `eznode_assignment` DISABLE KEYS */;
INSERT INTO `eznode_assignment` VALUES (4,8,2,0,1,2,5,'','0',1,1,0,0),(5,42,1,0,1,2,5,'','0',9,1,0,0),(6,10,2,-1,1,2,44,'','0',9,1,0,0),(7,4,1,0,1,2,1,'','0',1,1,0,0),(8,12,1,0,1,2,5,'','0',1,1,0,0),(9,13,1,0,1,2,5,'','0',1,1,0,0),(11,41,1,0,1,2,1,'','0',1,1,0,0),(12,11,1,0,1,2,5,'','0',1,1,0,0),(27,49,1,0,1,2,43,'','0',9,1,0,0),(28,50,1,0,1,2,43,'','0',9,1,0,0),(29,51,1,0,1,2,43,'','0',9,1,0,0),(38,14,3,-1,1,2,13,'','0',1,1,0,0),(40,53,1,0,1,2,52,'0543630fa051a1e2be54dbd32da2420f','0',1,1,0,0),(41,54,1,0,1,2,2,'1dad43be47e3a5c12cd06010aab65112','0',9,1,0,0);
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
  `owner_id` int(11) NOT NULL DEFAULT 0,
  `is_pending` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT 0,
  `data` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
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
  `install_date` int(11) NOT NULL DEFAULT 0,
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
  `value` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_attributes`
--

LOCK TABLES `ezpage_attributes` WRITE;
/*!40000 ALTER TABLE `ezpage_attributes` DISABLE KEYS */;
INSERT INTO `ezpage_attributes` VALUES (1,'content','<p>This is the clean installation coming with eZ Platform Enterprise Edition. It\'s a bare-bones setup of the Platform, an excellent foundation to build upon if you want to start your project from scratch.</p>');
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
  `style` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `compiled` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
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
  `original_id` int(11) NOT NULL DEFAULT 0,
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
  `user_id` int(11) NOT NULL DEFAULT 0,
  `value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
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
  `is_new` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `value` char(1) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `version` int(11) DEFAULT 0,
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
  `contentclass_attribute_id` int(11) NOT NULL DEFAULT 0,
  `contentclass_id` int(11) NOT NULL DEFAULT 0,
  `contentobject_id` int(11) NOT NULL DEFAULT 0,
  `frequency` double NOT NULL DEFAULT 0,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `integer_value` int(11) NOT NULL DEFAULT 0,
  `next_word_id` int(11) NOT NULL DEFAULT 0,
  `placement` int(11) NOT NULL DEFAULT 0,
  `prev_word_id` int(11) NOT NULL DEFAULT 0,
  `published` int(11) NOT NULL DEFAULT 0,
  `section_id` int(11) NOT NULL DEFAULT 0,
  `word_id` int(11) NOT NULL DEFAULT 0,
  `language_mask` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ezsearch_object_word_link_object` (`contentobject_id`),
  KEY `ezsearch_object_word_link_identifier` (`identifier`(191)),
  KEY `ezsearch_object_word_link_integer_value` (`integer_value`),
  KEY `ezsearch_object_word_link_word` (`word_id`),
  KEY `ezsearch_object_word_link_frequency` (`frequency`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsearch_object_word_link`
--

LOCK TABLES `ezsearch_object_word_link` WRITE;
/*!40000 ALTER TABLE `ezsearch_object_word_link` DISABLE KEYS */;
INSERT INTO `ezsearch_object_word_link` VALUES (1,4,1,1,0,'name',0,2,0,0,1448889046,1,1,3),(2,4,1,1,0,'name',0,3,1,1,1448889046,1,2,3),(3,4,1,1,0,'name',0,4,2,2,1448889046,1,3,3),(4,4,1,1,0,'name',0,5,3,3,1448889046,1,4,3),(5,119,1,1,0,'short_description',0,6,4,4,1448889046,1,5,3),(6,119,1,1,0,'short_description',0,7,5,5,1448889046,1,6,3),(7,119,1,1,0,'short_description',0,8,6,6,1448889046,1,7,3),(8,119,1,1,0,'short_description',0,2,7,7,1448889046,1,8,3),(9,119,1,1,0,'short_description',0,9,8,8,1448889046,1,2,3),(10,119,1,1,0,'short_description',0,10,9,2,1448889046,1,9,3),(11,119,1,1,0,'short_description',0,11,10,9,1448889046,1,10,3),(12,119,1,1,0,'short_description',0,3,11,10,1448889046,1,11,3),(13,155,1,1,0,'short_name',0,4,12,11,1448889046,1,3,3),(14,155,1,1,0,'short_name',0,12,13,3,1448889046,1,4,3),(15,156,1,1,0,'description',0,13,14,4,1448889046,1,12,3),(16,156,1,1,0,'description',0,14,15,12,1448889046,1,13,3),(17,156,1,1,0,'description',0,15,16,13,1448889046,1,14,3),(18,156,1,1,0,'description',0,16,17,14,1448889046,1,15,3),(19,156,1,1,0,'description',0,17,18,15,1448889046,1,16,3),(20,156,1,1,0,'description',0,18,19,16,1448889046,1,17,3),(21,156,1,1,0,'description',0,3,20,17,1448889046,1,18,3),(22,156,1,1,0,'description',0,4,21,18,1448889046,1,3,3),(23,156,1,1,0,'description',0,19,22,3,1448889046,1,4,3),(24,156,1,1,0,'description',0,20,23,4,1448889046,1,19,3),(25,156,1,1,0,'description',0,21,24,19,1448889046,1,20,3),(26,156,1,1,0,'description',0,22,25,20,1448889046,1,21,3),(27,156,1,1,0,'description',0,23,26,21,1448889046,1,22,3),(28,156,1,1,0,'description',0,24,27,22,1448889046,1,23,3),(29,156,1,1,0,'description',0,25,28,23,1448889046,1,24,3),(30,156,1,1,0,'description',0,14,29,24,1448889046,1,25,3),(31,156,1,1,0,'description',0,4,30,25,1448889046,1,14,3),(32,156,1,1,0,'description',0,26,31,14,1448889046,1,4,3),(33,156,1,1,0,'description',0,27,32,4,1448889046,1,26,3),(34,156,1,1,0,'description',0,28,33,26,1448889046,1,27,3),(35,156,1,1,0,'description',0,2,34,27,1448889046,1,28,3),(36,156,1,1,0,'description',0,29,35,28,1448889046,1,2,3),(37,156,1,1,0,'description',0,30,36,2,1448889046,1,29,3),(38,156,1,1,0,'description',0,31,37,29,1448889046,1,30,3),(39,156,1,1,0,'description',0,5,38,30,1448889046,1,31,3),(40,156,1,1,0,'description',0,32,39,31,1448889046,1,5,3),(41,156,1,1,0,'description',0,2,40,5,1448889046,1,32,3),(42,156,1,1,0,'description',0,9,41,32,1448889046,1,2,3),(43,156,1,1,0,'description',0,10,42,2,1448889046,1,9,3),(44,156,1,1,0,'description',0,11,43,9,1448889046,1,10,3),(45,156,1,1,0,'description',0,33,44,10,1448889046,1,11,3),(46,156,1,1,0,'description',0,34,45,11,1448889046,1,33,3),(47,156,1,1,0,'description',0,0,46,33,1448889046,1,34,3),(48,7,3,4,0,'description',0,36,0,0,1033917596,2,35,3),(49,7,3,4,0,'description',0,37,1,35,1033917596,2,36,3),(50,6,3,4,0,'name',0,0,2,36,1033917596,2,37,3),(51,8,4,10,0,'first_name',0,39,0,0,1033920665,2,38,3),(52,9,4,10,0,'last_name',0,0,1,38,1033920665,2,39,3),(53,6,3,11,0,'name',0,41,0,0,1033920746,2,40,3),(54,6,3,11,0,'name',0,0,1,40,1033920746,2,41,3),(55,6,3,12,0,'name',0,37,0,0,1033920775,2,42,3),(56,6,3,12,0,'name',0,0,1,42,1033920775,2,37,3),(57,6,3,13,0,'name',0,0,0,0,1033920794,2,43,3),(58,8,4,14,0,'first_name',0,39,0,0,1033920830,2,42,3),(59,9,4,14,0,'last_name',0,0,1,42,1033920830,2,39,3),(60,4,1,41,0,'name',0,0,0,0,1060695457,3,44,3),(61,6,3,42,0,'name',0,37,0,0,1072180330,2,38,3),(62,6,3,42,0,'name',0,39,1,38,1072180330,2,37,3),(63,7,3,42,0,'description',0,36,2,37,1072180330,2,39,3),(64,7,3,42,0,'description',0,45,3,39,1072180330,2,36,3),(65,7,3,42,0,'description',0,14,4,36,1072180330,2,45,3),(66,7,3,42,0,'description',0,38,5,45,1072180330,2,14,3),(67,7,3,42,0,'description',0,39,6,14,1072180330,2,38,3),(68,7,3,42,0,'description',0,0,7,38,1072180330,2,39,3),(69,4,1,49,0,'name',0,0,0,0,1080220197,3,46,3),(70,4,1,50,0,'name',0,0,0,0,1080220220,3,47,3),(71,4,1,51,0,'name',0,0,0,0,1080220233,3,48,3),(72,185,42,52,0,'name',0,2,0,0,1442481743,1,1,3),(73,185,42,52,0,'name',0,3,1,1,1442481743,1,2,3),(74,185,42,52,0,'name',0,4,2,2,1442481743,1,3,3),(75,185,42,52,0,'name',0,49,3,3,1442481743,1,4,3),(76,185,42,52,0,'name',0,50,4,4,1442481743,1,49,3),(77,185,42,52,0,'name',0,5,5,49,1442481743,1,50,3),(78,186,42,52,0,'description',0,6,6,50,1442481743,1,5,3),(79,186,42,52,0,'description',0,7,7,5,1442481743,1,6,3),(80,186,42,52,0,'description',0,8,8,6,1442481743,1,7,3),(81,186,42,52,0,'description',0,2,9,7,1442481743,1,8,3),(82,186,42,52,0,'description',0,9,10,8,1442481743,1,2,3),(83,186,42,52,0,'description',0,10,11,2,1442481743,1,9,3),(84,186,42,52,0,'description',0,11,12,9,1442481743,1,10,3),(85,186,42,52,0,'description',0,0,13,10,1442481743,1,11,3),(86,4,1,53,0,'name',0,52,0,0,1486473151,3,51,3),(87,4,1,53,0,'name',0,51,1,51,1486473151,3,52,3),(88,155,1,53,0,'short_name',0,52,2,52,1486473151,3,51,3),(89,155,1,53,0,'short_name',0,53,3,51,1486473151,3,52,3),(90,119,1,53,0,'short_description',0,45,4,52,1486473151,3,53,3),(91,119,1,53,0,'short_description',0,54,5,53,1486473151,3,45,3),(92,119,1,53,0,'short_description',0,52,6,45,1486473151,3,54,3),(93,119,1,53,0,'short_description',0,0,7,54,1486473151,3,52,3),(94,4,1,54,0,'name',0,0,0,0,1537166893,6,55,2);
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
  `object_count` int(11) NOT NULL DEFAULT 0,
  `word` varchar(150) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezsearch_word_word_i` (`word`),
  KEY `ezsearch_word_obj_count` (`object_count`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsearch_word`
--

LOCK TABLES `ezsearch_word` WRITE;
/*!40000 ALTER TABLE `ezsearch_word` DISABLE KEYS */;
INSERT INTO `ezsearch_word` VALUES (1,2,'welcome'),(2,2,'to'),(3,2,'ez'),(4,2,'platform'),(5,2,'you'),(6,2,'are'),(7,2,'now'),(8,2,'ready'),(9,2,'start'),(10,2,'your'),(11,2,'project'),(12,1,'this'),(13,1,'is'),(14,2,'the'),(15,1,'clean'),(16,1,'installation'),(17,1,'coming'),(18,1,'with'),(19,1,'it'),(20,1,'s'),(21,1,'a'),(22,1,'bare'),(23,1,'bones'),(24,1,'setup'),(25,1,'of'),(26,1,'an'),(27,1,'excellent'),(28,1,'foundation'),(29,1,'build'),(30,1,'upon'),(31,1,'if'),(32,1,'want'),(33,1,'from'),(34,1,'scratch'),(35,1,'main'),(36,2,'group'),(37,3,'users'),(38,2,'anonymous'),(39,3,'user'),(40,1,'guest'),(41,1,'accounts'),(42,2,'administrator'),(43,1,'editors'),(44,1,'media'),(45,2,'for'),(46,1,'images'),(47,1,'files'),(48,1,'multimedia'),(49,1,'enterprise'),(50,1,'edition'),(51,1,'form'),(52,1,'uploads'),(53,1,'folder'),(54,1,'file'),(55,1,'forms');
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
INSERT INTO `ezsite_data` VALUES ('ezplatform-release','3.0.0');
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
  `created` int(11) NOT NULL DEFAULT 0,
  `is_valid` int(11) NOT NULL DEFAULT 1,
  `last_checked` int(11) NOT NULL DEFAULT 0,
  `modified` int(11) NOT NULL DEFAULT 0,
  `original_url_md5` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `url` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezurl_url` (`url`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurl`
--

LOCK TABLES `ezurl` WRITE;
/*!40000 ALTER TABLE `ezurl` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezurl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurl_object_link`
--

DROP TABLE IF EXISTS `ezurl_object_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurl_object_link` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT 0,
  `contentobject_attribute_version` int(11) NOT NULL DEFAULT 0,
  `url_id` int(11) NOT NULL DEFAULT 0,
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
  `forward_to_id` int(11) NOT NULL DEFAULT 0,
  `is_imported` int(11) NOT NULL DEFAULT 0,
  `is_internal` int(11) NOT NULL DEFAULT 1,
  `is_wildcard` int(11) NOT NULL DEFAULT 0,
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
  `parent` int(11) NOT NULL DEFAULT 0,
  `text_md5` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `action` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `action_type` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `alias_redirects` int(11) NOT NULL DEFAULT 1,
  `id` int(11) NOT NULL DEFAULT 0,
  `is_alias` int(11) NOT NULL DEFAULT 0,
  `is_original` int(11) NOT NULL DEFAULT 0,
  `lang_mask` bigint(20) NOT NULL DEFAULT 0,
  `link` int(11) NOT NULL DEFAULT 0,
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
INSERT INTO `ezurlalias_ml` VALUES (0,'50e2736330de124f6edea9b008556fe6','nop:','nop',1,17,0,0,1,17,'media2'),(0,'62933a2951ef01f4eafd9bdf4d3cd2f0','eznode:43','eznode',1,9,0,1,3,9,'Media'),(0,'76e323bf7efc1fad8935eb37bd557b92','eznode:42','eznode',0,40,0,1,3,40,'ez-platform'),(0,'86425c35a33507d479f71ade53a669aa','nop:','nop',1,3,0,0,1,3,'users2'),(0,'9bc65c2abec141778ffaa729489f3e87','eznode:5','eznode',1,2,0,1,3,2,'Users'),(0,'ac68b62abfd6a9fe26e8ac4236c8ce0c','eznode:55','eznode',0,39,0,1,2,39,'forms'),(0,'d41d8cd98f00b204e9800998ecf8427e','eznode:2','eznode',1,1,0,1,3,1,''),(2,'a147e136bfa717592f2bd70bd4b53b17','eznode:14','eznode',1,6,0,1,3,6,'Editors'),(2,'c2803c3fa1b0b5423237b4e018cae755','eznode:44','eznode',1,10,0,1,3,10,'Anonymous-Users'),(2,'e57843d836e3af8ab611fde9e2139b3a','eznode:12','eznode',1,4,0,1,3,4,'Guest-accounts'),(2,'f89fad7f8a3abc8c09e1deb46a420007','eznode:13','eznode',1,5,0,1,3,5,'Administrator-users'),(3,'505e93077a6dde9034ad97a14ab022b1','nop:','nop',1,11,0,0,1,11,'anonymous_users2'),(3,'70bb992820e73638731aa8de79b3329e','eznode:12','eznode',1,26,0,0,1,4,'guest_accounts'),(3,'a147e136bfa717592f2bd70bd4b53b17','eznode:14','eznode',1,29,0,0,1,6,'editors'),(3,'a7da338c20bf65f9f789c87296379c2a','nop:','nop',1,7,0,0,1,7,'administrator_users2'),(3,'aeb8609aa933b0899aa012c71139c58c','eznode:13','eznode',1,27,0,0,1,5,'administrator_users'),(3,'e9e5ad0c05ee1a43715572e5cc545926','eznode:44','eznode',1,30,0,0,1,10,'anonymous_users'),(5,'5a9d7b0ec93173ef4fedee023209cb61','eznode:15','eznode',1,8,0,1,3,8,'Administrator-User'),(7,'a3cca2de936df1e2f805710399989971','eznode:15','eznode',1,28,0,0,0,8,'administrator_user'),(9,'2e5bc8831f7ae6a29530e7f1bbf2de9c','eznode:53','eznode',1,20,0,1,3,20,'Multimedia'),(9,'45b963397aa40d4a0063e0d85e4fe7a1','eznode:52','eznode',1,19,0,1,3,19,'Files'),(9,'59b514174bffe4ae402b3d63aad79fe0','eznode:51','eznode',1,18,0,1,3,18,'Images'),(10,'ccb62ebca03a31272430bc414bd5cd5b','eznode:45','eznode',1,12,0,1,3,12,'Anonymous-User'),(11,'c593ec85293ecb0e02d50d4c5c6c20eb','eznode:45','eznode',1,31,0,0,1,12,'anonymous_user'),(17,'2e5bc8831f7ae6a29530e7f1bbf2de9c','eznode:53','eznode',1,34,0,0,1,20,'multimedia'),(17,'45b963397aa40d4a0063e0d85e4fe7a1','eznode:52','eznode',1,33,0,0,1,19,'files'),(17,'59b514174bffe4ae402b3d63aad79fe0','eznode:51','eznode',1,32,0,0,1,18,'images'),(19,'2c5f0c4eb6b8ba8d176b87665bdbe1af','eznode:54','eznode',0,38,0,1,3,38,'form-uploads');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurlalias_ml_incr`
--

LOCK TABLES `ezurlalias_ml_incr` WRITE;
/*!40000 ALTER TABLE `ezurlalias_ml_incr` DISABLE KEYS */;
INSERT INTO `ezurlalias_ml_incr` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40);
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
  `type` int(11) NOT NULL DEFAULT 0,
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
  `contentobject_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `login` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `password_hash_type` int(11) NOT NULL DEFAULT 1,
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
  `time` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
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
  `user_id` int(11) NOT NULL DEFAULT 0,
  `is_enabled` int(11) NOT NULL DEFAULT 0,
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

-- Dump completed on 2020-05-04 15:58:49
