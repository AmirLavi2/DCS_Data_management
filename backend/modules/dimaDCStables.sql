-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: dcsserverstats
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aircrafts`
--

DROP TABLE IF EXISTS `aircrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aircrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `flights` int(11) NOT NULL DEFAULT '0',
  `flighttime` int(11) NOT NULL DEFAULT '0',
  `ejects` int(11) NOT NULL DEFAULT '0',
  `crashes` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `shots` int(11) NOT NULL DEFAULT '0',
  `kills` int(11) NOT NULL DEFAULT '0',
  `inc_hits` int(11) NOT NULL DEFAULT '0',
  `inc_kills` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircrafts`
--

LOCK TABLES `aircrafts` WRITE;
/*!40000 ALTER TABLE `aircrafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `aircrafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcs_events`
--

DROP TABLE IF EXISTS `dcs_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dcs_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` bigint(20) NOT NULL,
  `missiontime` bigint(20) NOT NULL,
  `event` varchar(255) NOT NULL,
  `InitiatorID` int(11) NOT NULL,
  `InitiatorCoa` varchar(255) NOT NULL,
  `InitiatorGroupCat` varchar(255) NOT NULL,
  `InitiatorType` varchar(255) NOT NULL,
  `InitiatorPlayer` varchar(255) NOT NULL,
  `WeaponCat` varchar(255) NOT NULL,
  `WeaponName` varchar(255) NOT NULL,
  `TargetID` int(11) NOT NULL,
  `TargetCoa` varchar(255) NOT NULL,
  `TargetGroupCat` varchar(255) NOT NULL,
  `TargetType` varchar(255) NOT NULL,
  `TargetPlayer` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcs_events`
--

LOCK TABLES `dcs_events` WRITE;
/*!40000 ALTER TABLE `dcs_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcs_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcs_parser_log`
--

DROP TABLE IF EXISTS `dcs_parser_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dcs_parser_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  `durationms` int(11) NOT NULL,
  `events` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcs_parser_log`
--

LOCK TABLES `dcs_parser_log` WRITE;
/*!40000 ALTER TABLE `dcs_parser_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcs_parser_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `flights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pilotid` int(11) NOT NULL,
  `aircraftid` int(11) NOT NULL,
  `takeofftime` int(11) NOT NULL,
  `takeoffmissiontime` int(11) NOT NULL,
  `landingtime` int(11) NOT NULL,
  `landingmissiontime` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `coalition` varchar(255) NOT NULL,
  `endofflighttype` varchar(255) NOT NULL DEFAULT 'landing',
  `raw_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hitsshotskills`
--

DROP TABLE IF EXISTS `hitsshotskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hitsshotskills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `initiatorPid` int(11) NOT NULL,
  `initiatorAcid` int(11) NOT NULL,
  `initiatorCoa` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `missiontime` int(11) NOT NULL,
  `targetPid` int(11) NOT NULL DEFAULT '0',
  `targetAcid` int(11) NOT NULL DEFAULT '0',
  `targetCoa` varchar(255) NOT NULL DEFAULT '',
  `weaponid` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `target_raw_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hitsshotskills`
--

LOCK TABLES `hitsshotskills` WRITE;
/*!40000 ALTER TABLE `hitsshotskills` DISABLE KEYS */;
/*!40000 ALTER TABLE `hitsshotskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilot_aircrafts`
--

DROP TABLE IF EXISTS `pilot_aircrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pilot_aircrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pilotid` int(11) NOT NULL,
  `aircraftid` int(11) NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  `flights` int(11) NOT NULL DEFAULT '0',
  `crashes` int(11) NOT NULL DEFAULT '0',
  `ejects` int(11) NOT NULL DEFAULT '0',
  `shots` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `kills` int(11) NOT NULL DEFAULT '0',
  `inc_hits` int(11) NOT NULL DEFAULT '0',
  `inc_kills` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilot_aircrafts`
--

LOCK TABLES `pilot_aircrafts` WRITE;
/*!40000 ALTER TABLE `pilot_aircrafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilot_aircrafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilots`
--

DROP TABLE IF EXISTS `pilots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pilots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `disp_name` varchar(255) NOT NULL,
  `flighttime` int(11) NOT NULL DEFAULT '0',
  `flights` int(11) NOT NULL DEFAULT '0',
  `crashes` int(11) NOT NULL DEFAULT '0',
  `ejects` int(11) NOT NULL DEFAULT '0',
  `shots` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `kills` int(11) NOT NULL DEFAULT '0',
  `inc_hits` int(11) NOT NULL DEFAULT '0',
  `inc_kills` int(11) NOT NULL DEFAULT '0',
  `lastactive` int(11) NOT NULL DEFAULT '0',
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `show_kills` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilots`
--

LOCK TABLES `pilots` WRITE;
/*!40000 ALTER TABLE `pilots` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_data`
--

DROP TABLE IF EXISTS `position_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `position_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pilotid` int(11) NOT NULL,
  `aircraftid` int(11) NOT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  `alt` double NOT NULL,
  `time` int(11) NOT NULL,
  `missiontime` int(11) NOT NULL,
  `raw_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1121 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_data`
--

LOCK TABLES `position_data` WRITE;
/*!40000 ALTER TABLE `position_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `position_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons`
--

DROP TABLE IF EXISTS `weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `weapons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `shots` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `kills` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons`
--

LOCK TABLES `weapons` WRITE;
/*!40000 ALTER TABLE `weapons` DISABLE KEYS */;
/*!40000 ALTER TABLE `weapons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-05 11:16:12
