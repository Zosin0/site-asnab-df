-- MySQL dump 10.17  Distrib 10.3.23-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_booked
-- ------------------------------------------------------
-- Server version	10.3.23-MariaDB-0+deb10u1

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
-- Table structure for table `accessories`
--

DROP TABLE IF EXISTS `accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accessories` (
  `accessory_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `accessory_name` varchar(85) NOT NULL,
  `accessory_quantity` smallint(5) unsigned DEFAULT NULL,
  `legacyid` char(16) DEFAULT NULL,
  PRIMARY KEY (`accessory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessories`
--

LOCK TABLES `accessories` WRITE;
/*!40000 ALTER TABLE `accessories` DISABLE KEYS */;
/*!40000 ALTER TABLE `accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_activation`
--

DROP TABLE IF EXISTS `account_activation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_activation` (
  `account_activation_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `activation_code` varchar(30) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`account_activation_id`),
  UNIQUE KEY `activation_code_2` (`activation_code`),
  KEY `activation_code` (`activation_code`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `account_activation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_activation`
--

LOCK TABLES `account_activation` WRITE;
/*!40000 ALTER TABLE `account_activation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_activation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_groups`
--

DROP TABLE IF EXISTS `announcement_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_groups` (
  `announcementid` mediumint(8) unsigned NOT NULL,
  `group_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`announcementid`,`group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `announcement_groups_ibfk_1` FOREIGN KEY (`announcementid`) REFERENCES `announcements` (`announcementid`) ON DELETE CASCADE,
  CONSTRAINT `announcement_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_groups`
--

LOCK TABLES `announcement_groups` WRITE;
/*!40000 ALTER TABLE `announcement_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_resources`
--

DROP TABLE IF EXISTS `announcement_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_resources` (
  `announcementid` mediumint(8) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`announcementid`,`resource_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `announcement_resources_ibfk_1` FOREIGN KEY (`announcementid`) REFERENCES `announcements` (`announcementid`) ON DELETE CASCADE,
  CONSTRAINT `announcement_resources_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_resources`
--

LOCK TABLES `announcement_resources` WRITE;
/*!40000 ALTER TABLE `announcement_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `announcementid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `announcement_text` text NOT NULL,
  `priority` mediumint(8) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `display_page` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`announcementid`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `display_page` (`display_page`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES (3,'Sua reserva será aprovada pelo profissional. Ao selecionar o horário aguarde a confirmação da reserva no seu e-mail.',NULL,'2020-05-01 03:00:00','2020-12-31 03:00:00',1),(5,'Faça seu cadastro usando seu e-mail da Conab clicando em registrar.',NULL,'2020-05-01 03:00:00','2020-12-31 03:00:00',5),(8,'As reservas devem ser marcadas com pelo menos 24 horas de antecedência.',2,'2020-05-01 03:00:00','2020-12-31 03:00:00',5),(9,'As reservas devem ser marcadas com pelo menos 24 horas de antecedência.',1,'2020-05-01 03:00:00','2020-12-31 03:00:00',1),(11,'O sistema de agendamento está executando em caráter experimental, qualquer dificuldade envie um e-mail para asnabdf1@gmail.com',3,'2020-05-01 03:00:00','2020-12-31 03:00:00',1),(12,'No formulário de cadastro, prefira alterar  a &quot;Página Inicial Padrão&quot; para &quot;Agenda&quot;.',1,'2020-05-01 03:00:00','2020-12-31 03:00:00',5);
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackout_instances`
--

DROP TABLE IF EXISTS `blackout_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackout_instances` (
  `blackout_instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `blackout_series_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`blackout_instance_id`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `blackout_series_id` (`blackout_series_id`),
  CONSTRAINT `blackout_instances_ibfk_1` FOREIGN KEY (`blackout_series_id`) REFERENCES `blackout_series` (`blackout_series_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackout_instances`
--

LOCK TABLES `blackout_instances` WRITE;
/*!40000 ALTER TABLE `blackout_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackout_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackout_series`
--

DROP TABLE IF EXISTS `blackout_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackout_series` (
  `blackout_series_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `title` varchar(85) NOT NULL,
  `description` text DEFAULT NULL,
  `owner_id` mediumint(8) unsigned NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `repeat_type` varchar(10) DEFAULT NULL,
  `repeat_options` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`blackout_series_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackout_series`
--

LOCK TABLES `blackout_series` WRITE;
/*!40000 ALTER TABLE `blackout_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackout_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackout_series_resources`
--

DROP TABLE IF EXISTS `blackout_series_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackout_series_resources` (
  `blackout_series_id` int(10) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`blackout_series_id`,`resource_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `blackout_series_resources_ibfk_1` FOREIGN KEY (`blackout_series_id`) REFERENCES `blackout_series` (`blackout_series_id`) ON DELETE CASCADE,
  CONSTRAINT `blackout_series_resources_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackout_series_resources`
--

LOCK TABLES `blackout_series_resources` WRITE;
/*!40000 ALTER TABLE `blackout_series_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackout_series_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_log`
--

DROP TABLE IF EXISTS `credit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_log` (
  `credit_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `original_credit_count` decimal(7,2) DEFAULT NULL,
  `credit_count` decimal(7,2) DEFAULT NULL,
  `credit_note` varchar(1000) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`credit_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_log`
--

LOCK TABLES `credit_log` WRITE;
/*!40000 ALTER TABLE `credit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_attribute_entities`
--

DROP TABLE IF EXISTS `custom_attribute_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_attribute_entities` (
  `custom_attribute_id` mediumint(8) unsigned NOT NULL,
  `entity_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`custom_attribute_id`,`entity_id`),
  CONSTRAINT `custom_attribute_entities_ibfk_1` FOREIGN KEY (`custom_attribute_id`) REFERENCES `custom_attributes` (`custom_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_attribute_entities`
--

LOCK TABLES `custom_attribute_entities` WRITE;
/*!40000 ALTER TABLE `custom_attribute_entities` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_attribute_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_attribute_values`
--

DROP TABLE IF EXISTS `custom_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_attribute_values` (
  `custom_attribute_value_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `custom_attribute_id` mediumint(8) unsigned NOT NULL,
  `attribute_value` text NOT NULL,
  `entity_id` mediumint(8) unsigned NOT NULL,
  `attribute_category` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`custom_attribute_value_id`),
  KEY `custom_attribute_id` (`custom_attribute_id`),
  KEY `entity_id` (`entity_id`),
  KEY `attribute_category` (`attribute_category`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_attribute_values`
--

LOCK TABLES `custom_attribute_values` WRITE;
/*!40000 ALTER TABLE `custom_attribute_values` DISABLE KEYS */;
INSERT INTO `custom_attribute_values` VALUES (1,3,'001',2,4),(2,3,'002',1,4);
/*!40000 ALTER TABLE `custom_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_attributes`
--

DROP TABLE IF EXISTS `custom_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_attributes` (
  `custom_attribute_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `display_label` varchar(50) NOT NULL,
  `display_type` tinyint(2) unsigned NOT NULL,
  `attribute_category` tinyint(2) unsigned NOT NULL,
  `validation_regex` varchar(50) DEFAULT NULL,
  `is_required` tinyint(1) unsigned NOT NULL,
  `possible_values` text DEFAULT NULL,
  `sort_order` tinyint(2) unsigned DEFAULT NULL,
  `admin_only` tinyint(1) unsigned DEFAULT NULL,
  `secondary_category` tinyint(2) unsigned DEFAULT NULL,
  `secondary_entity_ids` varchar(2000) DEFAULT NULL,
  `is_private` tinyint(1) unsigned DEFAULT NULL,
  `entity_id` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`custom_attribute_id`),
  KEY `attribute_category` (`attribute_category`),
  KEY `display_label` (`display_label`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_attributes`
--

LOCK TABLES `custom_attributes` WRITE;
/*!40000 ALTER TABLE `custom_attributes` DISABLE KEYS */;
INSERT INTO `custom_attributes` VALUES (3,'Test Number',1,4,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Test String',1,4,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `custom_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_time_blocks`
--

DROP TABLE IF EXISTS `custom_time_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_time_blocks` (
  `custom_time_block_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `layout_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`custom_time_block_id`),
  KEY `layout_id` (`layout_id`),
  CONSTRAINT `custom_time_blocks_ibfk_1` FOREIGN KEY (`layout_id`) REFERENCES `layouts` (`layout_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_time_blocks`
--

LOCK TABLES `custom_time_blocks` WRITE;
/*!40000 ALTER TABLE `custom_time_blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_time_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbversion`
--

DROP TABLE IF EXISTS `dbversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbversion` (
  `version_number` double unsigned NOT NULL DEFAULT 0,
  `version_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbversion`
--

LOCK TABLES `dbversion` WRITE;
/*!40000 ALTER TABLE `dbversion` DISABLE KEYS */;
INSERT INTO `dbversion` VALUES (2.1,'2020-04-01 22:30:54'),(2.2,'2020-04-01 22:30:54'),(2.3,'2020-04-01 22:30:54'),(2.4,'2020-04-01 22:30:54'),(2.5,'2020-04-01 22:30:54'),(2.6,'2020-04-01 22:30:54'),(2.7,'2020-04-01 22:30:54');
/*!40000 ALTER TABLE `dbversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_resource_permissions`
--

DROP TABLE IF EXISTS `group_resource_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_resource_permissions` (
  `group_id` smallint(5) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  `permission_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`group_id`,`resource_id`),
  KEY `group_id` (`group_id`),
  KEY `resource_id` (`resource_id`),
  KEY `group_id_2` (`group_id`),
  KEY `resource_id_2` (`resource_id`),
  CONSTRAINT `group_resource_permissions_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `group_resource_permissions_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_resource_permissions`
--

LOCK TABLES `group_resource_permissions` WRITE;
/*!40000 ALTER TABLE `group_resource_permissions` DISABLE KEYS */;
INSERT INTO `group_resource_permissions` VALUES (5,1,1),(5,2,1);
/*!40000 ALTER TABLE `group_resource_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_roles`
--

DROP TABLE IF EXISTS `group_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_roles` (
  `group_id` smallint(8) unsigned NOT NULL,
  `role_id` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`role_id`),
  KEY `group_id` (`group_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `group_roles_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `group_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_roles`
--

LOCK TABLES `group_roles` WRITE;
/*!40000 ALTER TABLE `group_roles` DISABLE KEYS */;
INSERT INTO `group_roles` VALUES (1,1),(2,2),(4,4);
/*!40000 ALTER TABLE `group_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(85) NOT NULL,
  `admin_group_id` smallint(5) unsigned DEFAULT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `isdefault` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`group_id`),
  KEY `admin_group_id` (`admin_group_id`),
  KEY `isdefault` (`isdefault`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`admin_group_id`) REFERENCES `groups` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Group Administrators',NULL,NULL,0),(2,'Application Administrators',1,NULL,0),(3,'Resource Administrators',NULL,NULL,0),(4,'Schedule Administrators',NULL,NULL,0),(5,'Associado',1,NULL,1);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layouts`
--

DROP TABLE IF EXISTS `layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layouts` (
  `layout_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `timezone` varchar(50) NOT NULL,
  `layout_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layouts`
--

LOCK TABLES `layouts` WRITE;
/*!40000 ALTER TABLE `layouts` DISABLE KEYS */;
INSERT INTO `layouts` VALUES (22,'America/Sao_Paulo',0);
/*!40000 ALTER TABLE `layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_configuration`
--

DROP TABLE IF EXISTS `payment_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_configuration` (
  `payment_configuration_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `credit_cost` decimal(7,2) unsigned NOT NULL,
  `credit_currency` varchar(10) NOT NULL,
  PRIMARY KEY (`payment_configuration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_configuration`
--

LOCK TABLES `payment_configuration` WRITE;
/*!40000 ALTER TABLE `payment_configuration` DISABLE KEYS */;
INSERT INTO `payment_configuration` VALUES (1,0.00,'USD');
/*!40000 ALTER TABLE `payment_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_gateway_settings`
--

DROP TABLE IF EXISTS `payment_gateway_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_gateway_settings` (
  `gateway_type` varchar(255) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` varchar(1000) NOT NULL,
  PRIMARY KEY (`gateway_type`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_gateway_settings`
--

LOCK TABLES `payment_gateway_settings` WRITE;
/*!40000 ALTER TABLE `payment_gateway_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_gateway_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_transaction_log`
--

DROP TABLE IF EXISTS `payment_transaction_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_transaction_log` (
  `payment_transaction_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `status` varchar(255) NOT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `subtotal_amount` decimal(7,2) NOT NULL,
  `tax_amount` decimal(7,2) NOT NULL,
  `total_amount` decimal(7,2) NOT NULL,
  `transaction_fee` decimal(7,2) DEFAULT NULL,
  `currency` varchar(3) NOT NULL,
  `transaction_href` varchar(500) DEFAULT NULL,
  `refund_href` varchar(500) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `gateway_name` varchar(100) NOT NULL,
  `gateway_date_created` varchar(25) NOT NULL,
  `payment_response` text DEFAULT NULL,
  PRIMARY KEY (`payment_transaction_log_id`),
  KEY `user_id` (`user_id`),
  KEY `invoice_number` (`invoice_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_transaction_log`
--

LOCK TABLES `payment_transaction_log` WRITE;
/*!40000 ALTER TABLE `payment_transaction_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_transaction_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peak_times`
--

DROP TABLE IF EXISTS `peak_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peak_times` (
  `peak_times_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `schedule_id` smallint(5) unsigned NOT NULL,
  `all_day` tinyint(1) unsigned NOT NULL,
  `start_time` varchar(10) DEFAULT NULL,
  `end_time` varchar(10) DEFAULT NULL,
  `every_day` tinyint(1) unsigned NOT NULL,
  `peak_days` varchar(13) DEFAULT NULL,
  `all_year` tinyint(1) unsigned NOT NULL,
  `begin_month` tinyint(1) unsigned NOT NULL,
  `begin_day` tinyint(1) unsigned NOT NULL,
  `end_month` tinyint(1) unsigned NOT NULL,
  `end_day` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`peak_times_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `peak_times_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peak_times`
--

LOCK TABLES `peak_times` WRITE;
/*!40000 ALTER TABLE `peak_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `peak_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotas`
--

DROP TABLE IF EXISTS `quotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotas` (
  `quota_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `quota_limit` decimal(7,2) unsigned NOT NULL,
  `unit` varchar(25) NOT NULL,
  `duration` varchar(25) NOT NULL,
  `resource_id` smallint(5) unsigned DEFAULT NULL,
  `group_id` smallint(5) unsigned DEFAULT NULL,
  `schedule_id` smallint(5) unsigned DEFAULT NULL,
  `enforced_days` varchar(15) DEFAULT NULL,
  `enforced_time_start` time DEFAULT NULL,
  `enforced_time_end` time DEFAULT NULL,
  `scope` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`quota_id`),
  KEY `resource_id` (`resource_id`),
  KEY `group_id` (`group_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `quotas_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotas_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotas_ibfk_3` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotas`
--

LOCK TABLES `quotas` WRITE;
/*!40000 ALTER TABLE `quotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_transaction_log`
--

DROP TABLE IF EXISTS `refund_transaction_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund_transaction_log` (
  `refund_transaction_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_transaction_log_id` int(10) unsigned NOT NULL,
  `status` varchar(255) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `total_refund_amount` decimal(7,2) NOT NULL,
  `payment_refund_amount` decimal(7,2) DEFAULT NULL,
  `fee_refund_amount` decimal(7,2) DEFAULT NULL,
  `transaction_href` varchar(500) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `gateway_date_created` varchar(25) NOT NULL,
  `refund_response` text DEFAULT NULL,
  PRIMARY KEY (`refund_transaction_log_id`),
  KEY `payment_transaction_log_id` (`payment_transaction_log_id`),
  CONSTRAINT `refund_transaction_log_ibfk_1` FOREIGN KEY (`payment_transaction_log_id`) REFERENCES `payment_transaction_log` (`payment_transaction_log_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_transaction_log`
--

LOCK TABLES `refund_transaction_log` WRITE;
/*!40000 ALTER TABLE `refund_transaction_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_transaction_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders` (
  `reminder_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `address` text NOT NULL,
  `message` text NOT NULL,
  `sendtime` datetime NOT NULL,
  `refnumber` text NOT NULL,
  PRIMARY KEY (`reminder_id`),
  KEY `reminders_user_id` (`user_id`),
  CONSTRAINT `reminders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders`
--

LOCK TABLES `reminders` WRITE;
/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_accessories`
--

DROP TABLE IF EXISTS `reservation_accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_accessories` (
  `series_id` int(10) unsigned NOT NULL,
  `accessory_id` smallint(5) unsigned NOT NULL,
  `quantity` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`series_id`,`accessory_id`),
  KEY `accessory_id` (`accessory_id`),
  KEY `series_id` (`series_id`),
  CONSTRAINT `reservation_accessories_ibfk_1` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`accessory_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_accessories_ibfk_2` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_accessories`
--

LOCK TABLES `reservation_accessories` WRITE;
/*!40000 ALTER TABLE `reservation_accessories` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_color_rules`
--

DROP TABLE IF EXISTS `reservation_color_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_color_rules` (
  `reservation_color_rule_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `custom_attribute_id` mediumint(8) unsigned NOT NULL,
  `attribute_type` smallint(5) unsigned DEFAULT NULL,
  `required_value` text DEFAULT NULL,
  `comparison_type` smallint(5) unsigned DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`reservation_color_rule_id`),
  KEY `custom_attribute_id` (`custom_attribute_id`),
  CONSTRAINT `reservation_color_rules_ibfk_1` FOREIGN KEY (`custom_attribute_id`) REFERENCES `custom_attributes` (`custom_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_color_rules`
--

LOCK TABLES `reservation_color_rules` WRITE;
/*!40000 ALTER TABLE `reservation_color_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_color_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_files`
--

DROP TABLE IF EXISTS `reservation_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `series_id` int(10) unsigned NOT NULL,
  `file_name` varchar(250) NOT NULL,
  `file_type` varchar(75) DEFAULT NULL,
  `file_size` varchar(45) NOT NULL,
  `file_extension` varchar(10) NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `series_id` (`series_id`),
  CONSTRAINT `reservation_files_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_files`
--

LOCK TABLES `reservation_files` WRITE;
/*!40000 ALTER TABLE `reservation_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_guests`
--

DROP TABLE IF EXISTS `reservation_guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_guests` (
  `reservation_instance_id` int(10) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `reservation_user_level` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`reservation_instance_id`,`email`),
  KEY `reservation_guests_reservation_instance_id` (`reservation_instance_id`),
  KEY `reservation_guests_email_address` (`email`),
  KEY `reservation_guests_reservation_user_level` (`reservation_user_level`),
  CONSTRAINT `reservation_guests_ibfk_1` FOREIGN KEY (`reservation_instance_id`) REFERENCES `reservation_instances` (`reservation_instance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_guests`
--

LOCK TABLES `reservation_guests` WRITE;
/*!40000 ALTER TABLE `reservation_guests` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_instances`
--

DROP TABLE IF EXISTS `reservation_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_instances` (
  `reservation_instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `reference_number` varchar(50) NOT NULL,
  `series_id` int(10) unsigned NOT NULL,
  `checkin_date` datetime DEFAULT NULL,
  `checkout_date` datetime DEFAULT NULL,
  `previous_end_date` datetime DEFAULT NULL,
  `credit_count` decimal(7,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`reservation_instance_id`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `reference_number` (`reference_number`),
  KEY `series_id` (`series_id`),
  KEY `checkin_date` (`checkin_date`),
  CONSTRAINT `reservations_series` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_instances`
--

LOCK TABLES `reservation_instances` WRITE;
/*!40000 ALTER TABLE `reservation_instances` DISABLE KEYS */;
INSERT INTO `reservation_instances` VALUES (71,'2020-05-05 12:00:00','2020-05-05 13:00:00','5eaf64054eea0506299073',71,NULL,NULL,NULL,NULL),(72,'2020-05-05 13:00:00','2020-05-05 14:00:00','5eaf642f5d1a4744706590',72,NULL,NULL,NULL,NULL),(73,'2020-05-06 18:00:00','2020-05-06 19:00:00','5eb02ff7e307a473148372',73,NULL,NULL,NULL,NULL),(74,'2020-05-06 17:00:00','2020-05-06 18:00:00','5eb03023b9634192271145',74,NULL,NULL,NULL,NULL),(75,'2020-05-07 17:00:00','2020-05-07 18:00:00','5eb19e29edf99141140276',75,NULL,NULL,NULL,NULL),(76,'2020-05-07 14:00:00','2020-05-07 15:00:00','5eb19ed256284490280206',76,NULL,NULL,NULL,NULL),(77,'2020-05-08 13:00:00','2020-05-08 14:00:00','5eb4c12ca7f3b859544865',77,NULL,NULL,NULL,NULL),(78,'2020-05-21 14:00:00','2020-05-21 15:00:00','5ec427859c527190827650',78,NULL,NULL,NULL,NULL),(79,'2020-05-28 12:00:00','2020-05-28 13:00:00','5ecfa851c67eb854790548',79,NULL,NULL,NULL,NULL),(80,'2020-06-09 12:00:00','2020-06-09 13:00:00','5edf985d3caf4062704461',80,NULL,NULL,NULL,0.00),(81,'2020-06-12 12:00:00','2020-06-12 13:00:00','5ee38dfab2d6e869350824',81,NULL,NULL,NULL,0.00);
/*!40000 ALTER TABLE `reservation_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_reminders`
--

DROP TABLE IF EXISTS `reservation_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_reminders` (
  `reminder_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `series_id` int(10) unsigned NOT NULL,
  `minutes_prior` int(10) unsigned NOT NULL,
  `reminder_type` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`reminder_id`),
  KEY `series_id` (`series_id`),
  KEY `reminder_type` (`reminder_type`),
  CONSTRAINT `reservation_reminders_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_reminders`
--

LOCK TABLES `reservation_reminders` WRITE;
/*!40000 ALTER TABLE `reservation_reminders` DISABLE KEYS */;
INSERT INTO `reservation_reminders` VALUES (12,73,15,0),(13,74,15,0);
/*!40000 ALTER TABLE `reservation_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_resources`
--

DROP TABLE IF EXISTS `reservation_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_resources` (
  `series_id` int(10) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  `resource_level_id` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`series_id`,`resource_id`),
  KEY `resource_id` (`resource_id`),
  KEY `series_id` (`series_id`),
  CONSTRAINT `reservation_resources_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_resources_ibfk_2` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_resources`
--

LOCK TABLES `reservation_resources` WRITE;
/*!40000 ALTER TABLE `reservation_resources` DISABLE KEYS */;
INSERT INTO `reservation_resources` VALUES (71,1,1),(72,1,1),(73,1,1),(74,1,1),(75,1,1),(76,1,1),(77,1,1),(78,1,1),(79,1,1),(80,1,1),(81,1,1);
/*!40000 ALTER TABLE `reservation_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_series`
--

DROP TABLE IF EXISTS `reservation_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_series` (
  `series_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `allow_participation` tinyint(1) unsigned NOT NULL,
  `allow_anon_participation` tinyint(1) unsigned NOT NULL,
  `type_id` tinyint(2) unsigned NOT NULL,
  `status_id` tinyint(2) unsigned NOT NULL,
  `repeat_type` varchar(10) DEFAULT NULL,
  `repeat_options` varchar(255) DEFAULT NULL,
  `owner_id` mediumint(8) unsigned NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `last_action_by` mediumint(8) unsigned DEFAULT NULL,
  `terms_date_accepted` datetime DEFAULT NULL,
  PRIMARY KEY (`series_id`),
  KEY `type_id` (`type_id`),
  KEY `status_id` (`status_id`),
  KEY `reservations_owner` (`owner_id`),
  CONSTRAINT `reservations_owner` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `reservations_status` FOREIGN KEY (`status_id`) REFERENCES `reservation_statuses` (`status_id`) ON UPDATE CASCADE,
  CONSTRAINT `reservations_type` FOREIGN KEY (`type_id`) REFERENCES `reservation_types` (`type_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_series`
--

LOCK TABLES `reservation_series` WRITE;
/*!40000 ALTER TABLE `reservation_series` DISABLE KEYS */;
INSERT INTO `reservation_series` VALUES (71,'2020-05-04 00:38:29','2020-05-04 01:17:15','','',0,0,1,2,'none','',4,NULL,4,NULL),(72,'2020-05-04 00:39:11','2020-05-04 01:16:59','1ª Reserva','Reserva',0,0,1,2,'none','',23,NULL,4,NULL),(73,'2020-05-04 15:08:40','2020-05-04 15:24:06','Minha reserva com presença Thomé','Teste',0,0,1,2,'none','',23,NULL,23,NULL),(74,'2020-05-04 15:09:24','2020-05-04 15:25:50','Minha reserva','Teste reserva com presença Fred',0,0,1,2,'none','',25,NULL,25,NULL),(75,'2020-05-05 17:11:06','2020-05-05 17:12:59','Teste antes 24h','wrewerw',0,0,1,2,'none','',23,NULL,23,NULL),(76,'2020-05-05 17:13:54','2020-05-05 17:14:59','Teswtes menos 24h','dfwsafaes',0,0,1,2,'none','',23,NULL,23,NULL),(77,'2020-05-08 02:17:16','2020-05-08 02:17:51','','',0,0,1,2,'none','',24,NULL,24,NULL),(78,'2020-05-19 18:37:57',NULL,'','',0,0,1,1,'none','',4,NULL,4,NULL),(79,'2020-05-28 12:02:26',NULL,'','',0,0,1,1,'none','',4,NULL,4,NULL),(80,'2020-06-09 14:10:37','2020-06-09 14:11:49','','',0,0,1,2,'none','',4,NULL,4,NULL),(81,'2020-06-12 14:15:22','2020-06-12 14:28:54','','',0,0,1,2,'none','',4,NULL,4,NULL);
/*!40000 ALTER TABLE `reservation_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_statuses`
--

DROP TABLE IF EXISTS `reservation_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_statuses` (
  `status_id` tinyint(2) unsigned NOT NULL,
  `label` varchar(85) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_statuses`
--

LOCK TABLES `reservation_statuses` WRITE;
/*!40000 ALTER TABLE `reservation_statuses` DISABLE KEYS */;
INSERT INTO `reservation_statuses` VALUES (1,'Created'),(2,'Deleted'),(3,'Pending');
/*!40000 ALTER TABLE `reservation_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_types`
--

DROP TABLE IF EXISTS `reservation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_types` (
  `type_id` tinyint(2) unsigned NOT NULL,
  `label` varchar(85) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_types`
--

LOCK TABLES `reservation_types` WRITE;
/*!40000 ALTER TABLE `reservation_types` DISABLE KEYS */;
INSERT INTO `reservation_types` VALUES (1,'Reservation'),(2,'Blackout');
/*!40000 ALTER TABLE `reservation_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_users`
--

DROP TABLE IF EXISTS `reservation_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_users` (
  `reservation_instance_id` int(10) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `reservation_user_level` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`reservation_instance_id`,`user_id`),
  KEY `reservation_instance_id` (`reservation_instance_id`),
  KEY `user_id` (`user_id`),
  KEY `reservation_user_level` (`reservation_user_level`),
  CONSTRAINT `reservation_users_ibfk_1` FOREIGN KEY (`reservation_instance_id`) REFERENCES `reservation_instances` (`reservation_instance_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_users`
--

LOCK TABLES `reservation_users` WRITE;
/*!40000 ALTER TABLE `reservation_users` DISABLE KEYS */;
INSERT INTO `reservation_users` VALUES (71,4,1),(72,23,1),(73,23,1),(74,25,1),(75,23,1),(76,23,1),(77,24,1),(78,4,1),(79,4,1),(80,4,1),(81,4,1);
/*!40000 ALTER TABLE `reservation_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_waitlist_requests`
--

DROP TABLE IF EXISTS `reservation_waitlist_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_waitlist_requests` (
  `reservation_waitlist_request_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`reservation_waitlist_request_id`),
  KEY `user_id` (`user_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `reservation_waitlist_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `reservation_waitlist_requests_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_waitlist_requests`
--

LOCK TABLES `reservation_waitlist_requests` WRITE;
/*!40000 ALTER TABLE `reservation_waitlist_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_waitlist_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_accessories`
--

DROP TABLE IF EXISTS `resource_accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_accessories` (
  `resource_accessory_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` smallint(5) unsigned NOT NULL,
  `accessory_id` smallint(5) unsigned NOT NULL,
  `minimum_quantity` smallint(6) DEFAULT NULL,
  `maximum_quantity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`resource_accessory_id`),
  KEY `resource_id` (`resource_id`),
  KEY `accessory_id` (`accessory_id`),
  CONSTRAINT `resource_accessories_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE,
  CONSTRAINT `resource_accessories_ibfk_2` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`accessory_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_accessories`
--

LOCK TABLES `resource_accessories` WRITE;
/*!40000 ALTER TABLE `resource_accessories` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_group_assignment`
--

DROP TABLE IF EXISTS `resource_group_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_group_assignment` (
  `resource_group_id` mediumint(8) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`resource_group_id`,`resource_id`),
  KEY `resource_group_assignment_resource_id` (`resource_id`),
  KEY `resource_group_assignment_resource_group_id` (`resource_group_id`),
  CONSTRAINT `resource_group_assignment_ibfk_1` FOREIGN KEY (`resource_group_id`) REFERENCES `resource_groups` (`resource_group_id`) ON DELETE CASCADE,
  CONSTRAINT `resource_group_assignment_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_group_assignment`
--

LOCK TABLES `resource_group_assignment` WRITE;
/*!40000 ALTER TABLE `resource_group_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_group_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_groups`
--

DROP TABLE IF EXISTS `resource_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_groups` (
  `resource_group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `resource_group_name` varchar(75) DEFAULT NULL,
  `parent_id` mediumint(8) unsigned DEFAULT NULL,
  `public_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`resource_group_id`),
  KEY `resource_groups_parent_id` (`parent_id`),
  CONSTRAINT `resource_groups_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `resource_groups` (`resource_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_groups`
--

LOCK TABLES `resource_groups` WRITE;
/*!40000 ALTER TABLE `resource_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_images`
--

DROP TABLE IF EXISTS `resource_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_images` (
  `resource_image_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` smallint(5) unsigned NOT NULL,
  `image_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`resource_image_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `resource_images_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_images`
--

LOCK TABLES `resource_images` WRITE;
/*!40000 ALTER TABLE `resource_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_status_reasons`
--

DROP TABLE IF EXISTS `resource_status_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_status_reasons` (
  `resource_status_reason_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `status_id` tinyint(3) unsigned NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`resource_status_reason_id`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_status_reasons`
--

LOCK TABLES `resource_status_reasons` WRITE;
/*!40000 ALTER TABLE `resource_status_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_status_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_type_assignment`
--

DROP TABLE IF EXISTS `resource_type_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_type_assignment` (
  `resource_id` smallint(5) unsigned NOT NULL,
  `resource_type_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`resource_id`,`resource_type_id`),
  KEY `resource_type_id` (`resource_type_id`),
  CONSTRAINT `resource_type_assignment_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE,
  CONSTRAINT `resource_type_assignment_ibfk_2` FOREIGN KEY (`resource_type_id`) REFERENCES `resource_types` (`resource_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_type_assignment`
--

LOCK TABLES `resource_type_assignment` WRITE;
/*!40000 ALTER TABLE `resource_type_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_type_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_types`
--

DROP TABLE IF EXISTS `resource_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_types` (
  `resource_type_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `resource_type_name` varchar(75) DEFAULT NULL,
  `resource_type_description` text DEFAULT NULL,
  PRIMARY KEY (`resource_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_types`
--

LOCK TABLES `resource_types` WRITE;
/*!40000 ALTER TABLE `resource_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `resource_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(85) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `min_duration` int(11) DEFAULT NULL,
  `min_increment` int(11) DEFAULT NULL,
  `max_duration` int(11) DEFAULT NULL,
  `unit_cost` decimal(7,2) DEFAULT NULL,
  `autoassign` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `requires_approval` tinyint(1) unsigned NOT NULL,
  `allow_multiday_reservations` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `max_participants` mediumint(8) unsigned DEFAULT NULL,
  `min_notice_time_add` int(11) DEFAULT NULL,
  `max_notice_time` int(11) DEFAULT NULL,
  `image_name` varchar(50) DEFAULT NULL,
  `schedule_id` smallint(5) unsigned NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `admin_group_id` smallint(5) unsigned DEFAULT NULL,
  `public_id` varchar(20) DEFAULT NULL,
  `allow_calendar_subscription` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` smallint(5) unsigned DEFAULT NULL,
  `resource_type_id` mediumint(8) unsigned DEFAULT NULL,
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `resource_status_reason_id` smallint(5) unsigned DEFAULT NULL,
  `buffer_time` int(10) unsigned DEFAULT NULL,
  `enable_check_in` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `auto_release_minutes` smallint(5) unsigned DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `allow_display` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `credit_count` decimal(7,2) unsigned DEFAULT NULL,
  `peak_credit_count` decimal(7,2) unsigned DEFAULT NULL,
  `min_notice_time_update` int(11) DEFAULT NULL,
  `min_notice_time_delete` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`resource_id`),
  UNIQUE KEY `public_id` (`public_id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `admin_group_id` (`admin_group_id`),
  KEY `resource_type_id` (`resource_type_id`),
  KEY `resource_status_reason_id` (`resource_status_reason_id`),
  KEY `auto_release_minutes` (`auto_release_minutes`),
  CONSTRAINT `admin_group_id` FOREIGN KEY (`admin_group_id`) REFERENCES `groups` (`group_id`) ON DELETE SET NULL,
  CONSTRAINT `resources_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resources_ibfk_2` FOREIGN KEY (`resource_type_id`) REFERENCES `resource_types` (`resource_type_id`) ON DELETE SET NULL,
  CONSTRAINT `resources_ibfk_3` FOREIGN KEY (`resource_status_reason_id`) REFERENCES `resource_status_reasons` (`resource_status_reason_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,'Psicologia','https://meet.asnabdf.com.br/psico','sheyla@educatux.com.br','Atendimento psicológico durante o isolamento social',NULL,3600,NULL,3600,NULL,1,1,0,1,86400,NULL,'resource11586591286.png',1,NULL,NULL,'9ffa85f8ae292226c168',1,0,NULL,1,NULL,NULL,0,NULL,'#649aff',0,0.00,0.00,43200,NULL,NULL,'2020-05-04 00:04:08'),(2,'Advocacia','https://meet.asnabdf.com.br/adv',NULL,NULL,NULL,3000,NULL,3600,NULL,1,1,0,1,NULL,NULL,'resource21586591298.png',1,NULL,NULL,'d6b3c0b07326f14f43d8',0,0,NULL,0,NULL,NULL,0,NULL,'#ffb12c',0,0.00,0.00,NULL,NULL,NULL,'2020-04-28 03:25:05');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `role_id` tinyint(2) unsigned NOT NULL,
  `name` varchar(85) DEFAULT NULL,
  `role_level` tinyint(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Group Admin',1),(2,'Application Admin',2),(3,'Resource Admin',3),(4,'Schedule Admin',4);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_reports`
--

DROP TABLE IF EXISTS `saved_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_reports` (
  `saved_report_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `report_name` varchar(50) DEFAULT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `report_details` varchar(500) NOT NULL,
  PRIMARY KEY (`saved_report_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `saved_reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_reports`
--

LOCK TABLES `saved_reports` WRITE;
/*!40000 ALTER TABLE `saved_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules` (
  `schedule_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(85) NOT NULL,
  `isdefault` tinyint(1) unsigned NOT NULL,
  `weekdaystart` tinyint(2) unsigned NOT NULL,
  `daysvisible` tinyint(2) unsigned NOT NULL DEFAULT 7,
  `layout_id` mediumint(8) unsigned NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `public_id` varchar(20) DEFAULT NULL,
  `allow_calendar_subscription` tinyint(1) NOT NULL DEFAULT 0,
  `admin_group_id` smallint(5) unsigned DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `allow_concurrent_bookings` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `default_layout` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`schedule_id`),
  UNIQUE KEY `public_id` (`public_id`),
  KEY `layout_id` (`layout_id`),
  KEY `schedules_groups_admin_group_id` (`admin_group_id`),
  CONSTRAINT `schedules_groups_admin_group_id` FOREIGN KEY (`admin_group_id`) REFERENCES `groups` (`group_id`) ON DELETE SET NULL,
  CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`layout_id`) REFERENCES `layouts` (`layout_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (1,'ASNAB-DF ONLINE',1,100,7,22,NULL,'94ac180485531d40d319',1,4,NULL,NULL,0,0);
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms_of_service`
--

DROP TABLE IF EXISTS `terms_of_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terms_of_service` (
  `terms_of_service_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `terms_text` text DEFAULT NULL,
  `terms_url` varchar(255) DEFAULT NULL,
  `terms_file` varchar(50) DEFAULT NULL,
  `applicability` varchar(50) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`terms_of_service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms_of_service`
--

LOCK TABLES `terms_of_service` WRITE;
/*!40000 ALTER TABLE `terms_of_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `terms_of_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_blocks`
--

DROP TABLE IF EXISTS `time_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_blocks` (
  `block_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(85) DEFAULT NULL,
  `end_label` varchar(85) DEFAULT NULL,
  `availability_code` tinyint(2) unsigned NOT NULL,
  `layout_id` mediumint(8) unsigned NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `day_of_week` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`block_id`),
  KEY `layout_id` (`layout_id`),
  CONSTRAINT `time_blocks_ibfk_1` FOREIGN KEY (`layout_id`) REFERENCES `layouts` (`layout_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=498 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_blocks`
--

LOCK TABLES `time_blocks` WRITE;
/*!40000 ALTER TABLE `time_blocks` DISABLE KEYS */;
INSERT INTO `time_blocks` VALUES (451,NULL,NULL,2,22,'00:00:00','00:00:00',0),(452,NULL,NULL,2,22,'00:00:00','09:00:00',1),(453,NULL,NULL,1,22,'09:00:00','10:00:00',1),(454,NULL,NULL,1,22,'10:00:00','11:00:00',1),(455,NULL,NULL,1,22,'11:00:00','12:00:00',1),(456,NULL,NULL,2,22,'12:00:00','14:00:00',1),(457,NULL,NULL,1,22,'14:00:00','15:00:00',1),(458,NULL,NULL,1,22,'15:00:00','16:00:00',1),(459,NULL,NULL,1,22,'16:00:00','17:00:00',1),(460,NULL,NULL,2,22,'17:00:00','00:00:00',1),(461,NULL,NULL,2,22,'00:00:00','09:00:00',2),(462,NULL,NULL,1,22,'09:00:00','10:00:00',2),(463,NULL,NULL,1,22,'10:00:00','11:00:00',2),(464,NULL,NULL,1,22,'11:00:00','12:00:00',2),(465,NULL,NULL,2,22,'12:00:00','14:00:00',2),(466,NULL,NULL,1,22,'14:00:00','15:00:00',2),(467,NULL,NULL,1,22,'15:00:00','16:00:00',2),(468,NULL,NULL,1,22,'16:00:00','17:00:00',2),(469,NULL,NULL,2,22,'17:00:00','00:00:00',2),(470,NULL,NULL,2,22,'00:00:00','09:00:00',3),(471,NULL,NULL,1,22,'09:00:00','10:00:00',3),(472,NULL,NULL,1,22,'10:00:00','11:00:00',3),(473,NULL,NULL,1,22,'11:00:00','12:00:00',3),(474,NULL,NULL,2,22,'12:00:00','14:00:00',3),(475,NULL,NULL,1,22,'14:00:00','15:00:00',3),(476,NULL,NULL,1,22,'15:00:00','16:00:00',3),(477,NULL,NULL,1,22,'16:00:00','17:00:00',3),(478,NULL,NULL,2,22,'17:00:00','00:00:00',3),(479,NULL,NULL,2,22,'00:00:00','09:00:00',4),(480,NULL,NULL,1,22,'09:00:00','10:00:00',4),(481,NULL,NULL,1,22,'10:00:00','11:00:00',4),(482,NULL,NULL,1,22,'11:00:00','12:00:00',4),(483,NULL,NULL,2,22,'12:00:00','14:00:00',4),(484,NULL,NULL,1,22,'14:00:00','15:00:00',4),(485,NULL,NULL,1,22,'15:00:00','16:00:00',4),(486,NULL,NULL,1,22,'16:00:00','17:00:00',4),(487,NULL,NULL,2,22,'17:00:00','00:00:00',4),(488,NULL,NULL,2,22,'00:00:00','09:00:00',5),(489,NULL,NULL,1,22,'09:00:00','10:00:00',5),(490,NULL,NULL,1,22,'10:00:00','11:00:00',5),(491,NULL,NULL,1,22,'11:00:00','12:00:00',5),(492,NULL,NULL,2,22,'12:00:00','14:00:00',5),(493,NULL,NULL,1,22,'14:00:00','15:00:00',5),(494,NULL,NULL,1,22,'15:00:00','16:00:00',5),(495,NULL,NULL,1,22,'16:00:00','17:00:00',5),(496,NULL,NULL,2,22,'17:00:00','00:00:00',5),(497,NULL,NULL,2,22,'00:00:00','00:00:00',6);
/*!40000 ALTER TABLE `time_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_email_preferences`
--

DROP TABLE IF EXISTS `user_email_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_email_preferences` (
  `user_id` mediumint(8) unsigned NOT NULL,
  `event_category` varchar(45) NOT NULL,
  `event_type` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`,`event_category`,`event_type`),
  CONSTRAINT `user_email_preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_email_preferences`
--

LOCK TABLES `user_email_preferences` WRITE;
/*!40000 ALTER TABLE `user_email_preferences` DISABLE KEYS */;
INSERT INTO `user_email_preferences` VALUES (4,'reservation','approved'),(4,'reservation','created'),(4,'reservation','deleted'),(4,'reservation','participation_changed'),(4,'reservation','series_ending'),(4,'reservation','updated'),(20,'reservation','approved'),(20,'reservation','created'),(20,'reservation','deleted'),(20,'reservation','participation_changed'),(20,'reservation','series_ending'),(20,'reservation','updated'),(22,'reservation','approved'),(22,'reservation','created'),(22,'reservation','deleted'),(22,'reservation','participation_changed'),(22,'reservation','series_ending'),(22,'reservation','updated'),(23,'reservation','approved'),(23,'reservation','created'),(23,'reservation','deleted'),(23,'reservation','participation_changed'),(23,'reservation','series_ending'),(23,'reservation','updated'),(24,'reservation','approved'),(24,'reservation','created'),(24,'reservation','deleted'),(24,'reservation','participation_changed'),(24,'reservation','series_ending'),(24,'reservation','updated'),(25,'reservation','approved'),(25,'reservation','created'),(25,'reservation','deleted'),(25,'reservation','participation_changed'),(25,'reservation','series_ending'),(25,'reservation','updated');
/*!40000 ALTER TABLE `user_email_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `user_id` mediumint(8) unsigned NOT NULL,
  `group_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `user_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (3,1),(4,1),(20,1),(24,1),(3,2),(4,2),(20,2),(24,2),(3,3),(4,3),(20,3),(24,3),(3,4),(4,4),(20,4),(24,4),(4,5),(20,5),(22,5),(23,5),(24,5),(25,5);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `user_preferences_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`user_preferences_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (253,4,'CalendarFilter','|1|');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_resource_permissions`
--

DROP TABLE IF EXISTS `user_resource_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_resource_permissions` (
  `user_id` mediumint(8) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  `permission_id` tinyint(2) unsigned NOT NULL DEFAULT 1,
  `permission_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`resource_id`),
  KEY `user_id` (`user_id`),
  KEY `resource_id` (`resource_id`),
  KEY `user_id_2` (`user_id`),
  KEY `resource_id_2` (`resource_id`),
  CONSTRAINT `user_resource_permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_resource_permissions_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_resource_permissions`
--

LOCK TABLES `user_resource_permissions` WRITE;
/*!40000 ALTER TABLE `user_resource_permissions` DISABLE KEYS */;
INSERT INTO `user_resource_permissions` VALUES (3,1,1,0),(3,2,1,0),(4,1,1,0),(4,2,1,0),(20,1,1,0),(20,2,1,0),(22,1,1,0),(22,2,1,0),(23,1,1,0),(23,2,1,0),(24,1,1,0),(24,2,1,0),(25,1,1,0),(25,2,1,0);
/*!40000 ALTER TABLE `user_resource_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_session`
--

DROP TABLE IF EXISTS `user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_session` (
  `user_session_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `last_modified` datetime NOT NULL,
  `session_token` varchar(50) NOT NULL,
  `user_session_value` text NOT NULL,
  PRIMARY KEY (`user_session_id`),
  KEY `user_session_user_id` (`user_id`),
  KEY `user_session_session_token` (`session_token`),
  CONSTRAINT `user_session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_session`
--

LOCK TABLES `user_session` WRITE;
/*!40000 ALTER TABLE `user_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_statuses`
--

DROP TABLE IF EXISTS `user_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_statuses` (
  `status_id` tinyint(2) unsigned NOT NULL,
  `description` varchar(85) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_statuses`
--

LOCK TABLES `user_statuses` WRITE;
/*!40000 ALTER TABLE `user_statuses` DISABLE KEYS */;
INSERT INTO `user_statuses` VALUES (1,'Active'),(2,'Awaiting'),(3,'Inactive');
/*!40000 ALTER TABLE `user_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(85) DEFAULT NULL,
  `lname` varchar(85) DEFAULT NULL,
  `username` varchar(85) DEFAULT NULL,
  `email` varchar(85) NOT NULL,
  `password` varchar(85) NOT NULL,
  `salt` varchar(85) NOT NULL,
  `organization` varchar(85) DEFAULT NULL,
  `position` varchar(85) DEFAULT NULL,
  `phone` varchar(85) DEFAULT NULL,
  `timezone` varchar(85) NOT NULL,
  `language` varchar(10) NOT NULL,
  `homepageid` tinyint(2) unsigned NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `lastlogin` datetime DEFAULT NULL,
  `status_id` tinyint(2) unsigned NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `legacypassword` varchar(32) DEFAULT NULL,
  `public_id` varchar(20) DEFAULT NULL,
  `allow_calendar_subscription` tinyint(1) NOT NULL DEFAULT 0,
  `default_schedule_id` smallint(5) unsigned DEFAULT NULL,
  `credit_count` decimal(7,2) DEFAULT 0.00,
  `terms_date_accepted` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `public_id` (`public_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `user_statuses` (`status_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'evandro','alves rodrigues','evandrofisico','evandrofisico@gmail.com','42d487d50285773b59a8501f2c6e7c253fd1beb1','2e29a057','','','','America/Fortaleza','en_us',2,'2020-04-01 22:44:10','2020-04-15 21:10:40','2020-04-01 22:44:10',1,NULL,NULL,'e5b05bc639bfc0f28232',0,NULL,0.00,NULL),(4,'Aderbal','Botelho','aderbal','aderbal@gmail.com','4e220ee3054abc0b7f290daf560b7089da7275a9','1a42d1fd','ASNAB-DF','CTO','+5561982104404','America/Fortaleza','pt_br',2,'2020-04-02 14:39:34','2020-06-12 14:14:47','2020-06-12 14:14:47',1,NULL,NULL,'cda739785c3397a72674',0,NULL,0.00,NULL),(20,'Frederico','Cabral de Menezes','frederico.menezes@conab.gov.br','frederico.menezes@conab.gov.br','150796716f23e4af83034d248e2cb70fe2a7c123','59ca0610','Genoc','Analista','61996495122','America/Sao_Paulo','pt_br',2,'2020-04-29 14:37:21','2020-05-12 13:38:08','2020-05-12 13:38:08',1,NULL,NULL,'7de7d1e1cf51e0a070de',0,NULL,0.00,NULL),(22,'ASNAB-DF','ASNAB','ASNAB-DF','asnabdf1@gmail.com','77c480e5e4ce8f8dda5f404fd344f8bb3b337be5','620e18be','Teste','TESTE','61 996495122','America/Sao_Paulo','pt_br',2,'2020-04-30 19:44:26','2020-05-01 00:53:12','2020-05-01 00:53:12',1,NULL,NULL,'dc485dfd0b19fa77d211',0,NULL,0.00,NULL),(23,'Frederico','Gmail','Frederico Gmail','frederico.menezes@gmail.com','b76849156a1abfe0fb4661aa8c842a04acf96708','4f6587af','ASNAB-DF','Diretor','61 996495122','America/Sao_Paulo','pt_br',2,'2020-05-04 00:29:50','2020-05-05 17:08:04','2020-05-05 17:08:04',1,NULL,NULL,'ea74bc4fb73af407bfc8',0,NULL,0.00,NULL),(24,'EducatuX','Mídia','aderbal@educatux.com.br','aderbal@educatux.com.br','a75e92a3c30703af6a97bde94f632acb0d2e1b91','64f10436','','','','America/Sao_Paulo','pt_br',2,'2020-05-04 00:48:22','2020-05-16 21:36:33','2020-05-16 21:36:33',1,NULL,NULL,'e44e8b43d9c95a0308b2',0,NULL,0.00,NULL),(25,'THOME LUIZ','GUTH','thome.guth','thome.guth@conab.gov.br','c6069ebf3cc3f7e02e25a0c7230c09b2c4f3c0c4','18f67460','Gerpa','Gerente','61991892022','America/Sao_Paulo','pt_br',2,'2020-05-04 14:58:50','2020-05-06 15:09:28','2020-05-06 15:09:28',1,NULL,NULL,'5981eaf91814944f67fd',0,NULL,0.00,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-19  2:43:05
