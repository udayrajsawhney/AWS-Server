-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: gratify
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `channel_member`
--

DROP TABLE IF EXISTS `channel_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_member` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`channelId`),
  KEY `channelId` (`channelId`),
  CONSTRAINT `channel_member_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `channel_member_ibfk_2` FOREIGN KEY (`channelId`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_member`
--

LOCK TABLES `channel_member` WRITE;
/*!40000 ALTER TABLE `channel_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `public` tinyint(1) DEFAULT '1',
  `dm` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `teamId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teamId` (`teamId`),
  CONSTRAINT `channels_ibfk_1` FOREIGN KEY (`teamId`) REFERENCES `teams` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,'general',1,0,'2018-12-09 20:10:26','2018-12-09 20:10:26',1),(2,'ASE',1,0,'2018-12-09 20:16:57','2018-12-09 20:16:57',1),(3,'general',1,0,'2018-12-09 20:20:33','2018-12-09 20:20:33',2),(4,'general',1,0,'2018-12-09 20:31:36','2018-12-09 20:31:36',3),(5,'general',1,0,'2018-12-09 20:31:50','2018-12-09 20:31:50',4),(6,'general',1,0,'2018-12-09 20:32:07','2018-12-09 20:32:07',5),(7,'subhadeep',0,1,'2018-12-09 20:46:02','2018-12-09 20:46:02',1),(8,'general',1,0,'2018-12-09 20:51:32','2018-12-09 20:51:32',6),(9,'TOC',0,0,'2018-12-09 20:51:47','2018-12-09 20:51:47',1);
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direct_messages`
--

DROP TABLE IF EXISTS `direct_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direct_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `teamId` int(11) DEFAULT NULL,
  `receiverId` int(11) DEFAULT NULL,
  `senderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teamId` (`teamId`),
  KEY `receiverId` (`receiverId`),
  KEY `senderId` (`senderId`),
  CONSTRAINT `direct_messages_ibfk_1` FOREIGN KEY (`teamId`) REFERENCES `teams` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `direct_messages_ibfk_2` FOREIGN KEY (`receiverId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `direct_messages_ibfk_3` FOREIGN KEY (`senderId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direct_messages`
--

LOCK TABLES `direct_messages` WRITE;
/*!40000 ALTER TABLE `direct_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `direct_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `admin` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  `teamId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`teamId`),
  KEY `teamId` (`teamId`),
  CONSTRAINT `members_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `members_ibfk_2` FOREIGN KEY (`teamId`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'2018-12-09 20:10:26','2018-12-09 20:10:26',1,1),(1,'2018-12-09 20:31:50','2018-12-09 20:31:50',1,4),(0,'2018-12-09 20:20:03','2018-12-09 20:20:03',2,1),(1,'2018-12-09 20:20:33','2018-12-09 20:20:33',2,2),(1,'2018-12-09 20:31:36','2018-12-09 20:31:36',2,3),(1,'2018-12-09 20:32:07','2018-12-09 20:32:07',2,5),(0,'2018-12-09 20:45:42','2018-12-09 20:45:42',3,1),(1,'2018-12-09 20:51:32','2018-12-09 20:51:32',3,6);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `filetype` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `channelId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channelId` (`channelId`),
  KEY `userId` (`userId`),
  KEY `messages_created_at` (`createdAt`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`channelId`) REFERENCES `channels` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'Hi',NULL,NULL,'2018-12-09 20:17:07','2018-12-09 20:17:07',1,1),(2,'Hi',NULL,NULL,'2018-12-09 20:20:39','2018-12-09 20:20:39',1,2),(3,'Do u know we have evaluation tommorrow?',NULL,NULL,'2018-12-09 20:21:36','2018-12-09 20:21:36',1,2),(4,'Ha, I\'m ready for it.',NULL,NULL,'2018-12-09 20:21:47','2018-12-09 20:21:47',1,1),(5,NULL,'files\\upload_0da2e0359c819ef9acde00383d6e0e58','image/png','2018-12-09 20:23:30','2018-12-09 20:23:30',1,1),(6,'How\'z that image for our grp???',NULL,NULL,'2018-12-09 20:23:49','2018-12-09 20:23:49',1,1),(7,'Its looking dope',NULL,NULL,'2018-12-09 20:25:16','2018-12-09 20:25:16',1,2),(8,'thanks',NULL,NULL,'2018-12-09 20:25:20','2018-12-09 20:25:20',1,1),(9,'welcome',NULL,NULL,'2018-12-09 20:25:40','2018-12-09 20:25:40',1,2),(10,'k bye',NULL,NULL,'2018-12-09 20:26:08','2018-12-09 20:26:08',1,1),(11,'bye',NULL,NULL,'2018-12-09 20:26:11','2018-12-09 20:26:11',1,2),(12,'A',NULL,NULL,'2018-12-09 20:28:36','2018-12-09 20:28:36',2,2),(13,'B',NULL,NULL,'2018-12-09 20:28:41','2018-12-09 20:28:41',2,1),(14,'C',NULL,NULL,'2018-12-09 20:28:42','2018-12-09 20:28:42',2,1),(15,'D',NULL,NULL,'2018-12-09 20:28:43','2018-12-09 20:28:43',2,1),(16,'E',NULL,NULL,'2018-12-09 20:28:44','2018-12-09 20:28:44',2,1),(17,'F',NULL,NULL,'2018-12-09 20:28:45','2018-12-09 20:28:45',2,1),(18,'G',NULL,NULL,'2018-12-09 20:28:46','2018-12-09 20:28:46',2,1),(19,'H',NULL,NULL,'2018-12-09 20:28:48','2018-12-09 20:28:48',2,1),(20,'I',NULL,NULL,'2018-12-09 20:28:49','2018-12-09 20:28:49',2,1),(21,'J',NULL,NULL,'2018-12-09 20:28:51','2018-12-09 20:28:51',2,1),(22,'K',NULL,NULL,'2018-12-09 20:28:52','2018-12-09 20:28:52',2,1),(23,'L',NULL,NULL,'2018-12-09 20:28:53','2018-12-09 20:28:53',2,1),(24,'M',NULL,NULL,'2018-12-09 20:28:54','2018-12-09 20:28:54',2,1),(25,'N',NULL,NULL,'2018-12-09 20:28:55','2018-12-09 20:28:55',2,1),(26,'O',NULL,NULL,'2018-12-09 20:28:56','2018-12-09 20:28:56',2,1),(27,'P',NULL,NULL,'2018-12-09 20:28:57','2018-12-09 20:28:57',2,1),(28,'Q',NULL,NULL,'2018-12-09 20:28:58','2018-12-09 20:28:58',2,1),(29,'R',NULL,NULL,'2018-12-09 20:29:25','2018-12-09 20:29:25',2,1),(30,'S',NULL,NULL,'2018-12-09 20:29:26','2018-12-09 20:29:26',2,1),(31,'T',NULL,NULL,'2018-12-09 20:29:27','2018-12-09 20:29:27',2,1),(32,'U',NULL,NULL,'2018-12-09 20:29:30','2018-12-09 20:29:30',2,2),(33,'V',NULL,NULL,'2018-12-09 20:29:31','2018-12-09 20:29:31',2,2),(34,'W',NULL,NULL,'2018-12-09 20:29:33','2018-12-09 20:29:33',2,2),(35,'X',NULL,NULL,'2018-12-09 20:29:34','2018-12-09 20:29:34',2,2),(36,'Y',NULL,NULL,'2018-12-09 20:29:35','2018-12-09 20:29:35',2,2),(37,'Z',NULL,NULL,'2018-12-09 20:29:39','2018-12-09 20:29:39',2,1),(38,'1',NULL,NULL,'2018-12-09 20:34:06','2018-12-09 20:34:06',6,2),(39,'2',NULL,NULL,'2018-12-09 20:34:07','2018-12-09 20:34:07',6,2),(40,'3',NULL,NULL,'2018-12-09 20:34:08','2018-12-09 20:34:08',6,2),(41,'4',NULL,NULL,'2018-12-09 20:34:09','2018-12-09 20:34:09',6,2),(42,'hi',NULL,NULL,'2018-12-09 20:46:07','2018-12-09 20:46:07',7,1),(43,'hi',NULL,NULL,'2018-12-09 20:46:15','2018-12-09 20:46:15',7,3),(44,'how are you',NULL,NULL,'2018-12-09 20:46:22','2018-12-09 20:46:22',7,1),(45,'Im fine',NULL,NULL,'2018-12-09 20:46:26','2018-12-09 20:46:26',7,3),(46,'great',NULL,NULL,'2018-12-09 20:46:30','2018-12-09 20:46:30',7,1),(47,'AA',NULL,NULL,'2018-12-09 20:46:33','2018-12-09 20:46:33',7,1),(48,'AB',NULL,NULL,'2018-12-09 20:46:35','2018-12-09 20:46:35',7,1),(49,'AC',NULL,NULL,'2018-12-09 20:46:37','2018-12-09 20:46:37',7,1),(50,'AD',NULL,NULL,'2018-12-09 20:46:38','2018-12-09 20:46:38',7,1),(51,'AE',NULL,NULL,'2018-12-09 20:46:39','2018-12-09 20:46:39',7,1),(52,'AF',NULL,NULL,'2018-12-09 20:46:40','2018-12-09 20:46:40',7,1),(53,'AGA',NULL,NULL,'2018-12-09 20:46:43','2018-12-09 20:46:43',7,1),(54,'AH',NULL,NULL,'2018-12-09 20:46:44','2018-12-09 20:46:44',7,1),(55,'AJ',NULL,NULL,'2018-12-09 20:46:45','2018-12-09 20:46:45',7,1),(56,'AK',NULL,NULL,'2018-12-09 20:46:46','2018-12-09 20:46:46',7,1),(57,'AL',NULL,NULL,'2018-12-09 20:46:47','2018-12-09 20:46:47',7,1),(58,'AQ',NULL,NULL,'2018-12-09 20:46:49','2018-12-09 20:46:49',7,1),(59,'AW',NULL,NULL,'2018-12-09 20:46:50','2018-12-09 20:46:50',7,1),(60,'AE',NULL,NULL,'2018-12-09 20:46:51','2018-12-09 20:46:51',7,1),(61,'AR',NULL,NULL,'2018-12-09 20:46:52','2018-12-09 20:46:52',7,1),(62,'AT',NULL,NULL,'2018-12-09 20:46:53','2018-12-09 20:46:53',7,1),(63,'AY',NULL,NULL,'2018-12-09 20:46:54','2018-12-09 20:46:54',7,1),(64,'AU',NULL,NULL,'2018-12-09 20:46:55','2018-12-09 20:46:55',7,1),(65,'AI',NULL,NULL,'2018-12-09 20:46:56','2018-12-09 20:46:56',7,1),(66,'AO',NULL,NULL,'2018-12-09 20:46:59','2018-12-09 20:46:59',7,1),(67,'AP',NULL,NULL,'2018-12-09 20:47:00','2018-12-09 20:47:00',7,1),(68,'AZ',NULL,NULL,'2018-12-09 20:47:10','2018-12-09 20:47:10',7,1),(69,'AX',NULL,NULL,'2018-12-09 20:47:12','2018-12-09 20:47:12',7,1),(70,'AC',NULL,NULL,'2018-12-09 20:47:12','2018-12-09 20:47:12',7,1),(71,'AV',NULL,NULL,'2018-12-09 20:47:14','2018-12-09 20:47:14',7,1),(72,'AB',NULL,NULL,'2018-12-09 20:47:15','2018-12-09 20:47:15',7,1),(73,'AN',NULL,NULL,'2018-12-09 20:47:16','2018-12-09 20:47:16',7,1),(74,'AM',NULL,NULL,'2018-12-09 20:47:17','2018-12-09 20:47:17',7,1),(75,'AL',NULL,NULL,'2018-12-09 20:47:19','2018-12-09 20:47:19',7,1),(76,'AG',NULL,NULL,'2018-12-09 20:47:23','2018-12-09 20:47:23',7,3),(77,'AH',NULL,NULL,'2018-12-09 20:47:26','2018-12-09 20:47:26',7,3),(78,'AJ',NULL,NULL,'2018-12-09 20:47:26','2018-12-09 20:47:26',7,3),(79,'AK',NULL,NULL,'2018-12-09 20:47:27','2018-12-09 20:47:27',7,3),(80,'AL',NULL,NULL,'2018-12-09 20:47:28','2018-12-09 20:47:28',7,3),(81,'AB',NULL,NULL,'2018-12-09 20:47:31','2018-12-09 20:47:31',7,3),(82,'ba',NULL,NULL,'2018-12-09 20:47:32','2018-12-09 20:47:32',7,3),(83,'great',NULL,NULL,'2018-12-09 20:47:34','2018-12-09 20:47:34',7,3),(84,'it was nice chatting with you',NULL,NULL,'2018-12-09 20:47:46','2018-12-09 20:47:46',7,1),(85,'same here',NULL,NULL,'2018-12-09 20:47:53','2018-12-09 20:47:53',7,3),(86,'11',NULL,NULL,'2018-12-09 20:52:06','2018-12-09 20:52:06',9,3),(87,'12',NULL,NULL,'2018-12-09 20:52:07','2018-12-09 20:52:07',9,3),(88,'k',NULL,NULL,'2018-12-09 20:52:09','2018-12-09 20:52:09',9,3),(89,'asf',NULL,NULL,'2018-12-09 20:52:09','2018-12-09 20:52:09',9,3),(90,'dsg',NULL,NULL,'2018-12-09 20:52:10','2018-12-09 20:52:10',9,3),(91,'sdfh',NULL,NULL,'2018-12-09 20:52:11','2018-12-09 20:52:11',9,3),(92,'fh',NULL,NULL,'2018-12-09 20:52:11','2018-12-09 20:52:11',9,3),(93,'fd',NULL,NULL,'2018-12-09 20:52:11','2018-12-09 20:52:11',9,3),(94,'h',NULL,NULL,'2018-12-09 20:52:12','2018-12-09 20:52:12',9,3),(95,'h',NULL,NULL,'2018-12-09 20:52:12','2018-12-09 20:52:12',9,3),(96,'fd',NULL,NULL,'2018-12-09 20:52:12','2018-12-09 20:52:12',9,3),(97,'h',NULL,NULL,'2018-12-09 20:52:12','2018-12-09 20:52:12',9,3),(98,'h',NULL,NULL,'2018-12-09 20:52:12','2018-12-09 20:52:12',9,3),(99,'f',NULL,NULL,'2018-12-09 20:52:13','2018-12-09 20:52:13',9,3),(100,'h',NULL,NULL,'2018-12-09 20:52:13','2018-12-09 20:52:13',9,3),(101,'fdhb',NULL,NULL,'2018-12-09 20:52:14','2018-12-09 20:52:14',9,3),(102,'asf',NULL,NULL,'2018-12-09 20:52:17','2018-12-09 20:52:17',9,1),(103,'f',NULL,NULL,'2018-12-09 20:52:17','2018-12-09 20:52:17',9,1),(104,'sf',NULL,NULL,'2018-12-09 20:52:17','2018-12-09 20:52:17',9,1),(105,'fa',NULL,NULL,'2018-12-09 20:52:18','2018-12-09 20:52:18',9,1),(106,'g',NULL,NULL,'2018-12-09 20:52:18','2018-12-09 20:52:18',9,1),(107,'dg',NULL,NULL,'2018-12-09 20:52:18','2018-12-09 20:52:18',9,1),(108,'d',NULL,NULL,'2018-12-09 20:52:18','2018-12-09 20:52:18',9,1),(109,'g',NULL,NULL,'2018-12-09 20:52:18','2018-12-09 20:52:18',9,1),(110,'d',NULL,NULL,'2018-12-09 20:52:19','2018-12-09 20:52:19',9,1),(111,'g',NULL,NULL,'2018-12-09 20:52:19','2018-12-09 20:52:19',9,1),(112,'dg',NULL,NULL,'2018-12-09 20:52:19','2018-12-09 20:52:19',9,1),(113,'d',NULL,NULL,'2018-12-09 20:52:20','2018-12-09 20:52:20',9,1),(114,'g',NULL,NULL,'2018-12-09 20:52:20','2018-12-09 20:52:20',9,1),(115,'g',NULL,NULL,'2018-12-09 20:52:20','2018-12-09 20:52:20',9,1),(116,'g',NULL,NULL,'2018-12-09 20:52:20','2018-12-09 20:52:20',9,1),(117,'g',NULL,NULL,'2018-12-09 20:52:21','2018-12-09 20:52:21',9,1),(118,'g',NULL,NULL,'2018-12-09 20:52:21','2018-12-09 20:52:21',9,1),(119,'g',NULL,NULL,'2018-12-09 20:52:21','2018-12-09 20:52:21',9,1),(120,'hi',NULL,NULL,'2018-12-09 20:52:23','2018-12-09 20:52:23',9,1),(121,'hi',NULL,NULL,'2018-12-09 20:52:27','2018-12-09 20:52:27',9,3),(122,'this a private chat',NULL,NULL,'2018-12-09 20:52:34','2018-12-09 20:52:34',9,3),(123,'ya i know',NULL,NULL,'2018-12-09 20:52:39','2018-12-09 20:52:39',9,1);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcmembers`
--

DROP TABLE IF EXISTS `pcmembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcmembers` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`channelId`),
  KEY `channelId` (`channelId`),
  CONSTRAINT `pcmembers_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pcmembers_ibfk_2` FOREIGN KEY (`channelId`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcmembers`
--

LOCK TABLES `pcmembers` WRITE;
/*!40000 ALTER TABLE `pcmembers` DISABLE KEYS */;
INSERT INTO `pcmembers` VALUES ('2018-12-09 20:46:02','2018-12-09 20:46:02',1,7),('2018-12-09 20:51:47','2018-12-09 20:51:47',1,9),('2018-12-09 20:46:02','2018-12-09 20:46:02',3,7),('2018-12-09 20:51:47','2018-12-09 20:51:47',3,9);
/*!40000 ALTER TABLE `pcmembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `teams_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'IIITS','2018-12-09 20:10:26','2018-12-09 20:10:26'),(2,'IIITD','2018-12-09 20:20:33','2018-12-09 20:20:33'),(3,'TEAM2','2018-12-09 20:31:36','2018-12-09 20:31:36'),(4,'NIE','2018-12-09 20:31:50','2018-12-09 20:31:50'),(5,'SAM','2018-12-09 20:32:07','2018-12-09 20:32:07'),(6,'Youth','2018-12-09 20:51:32','2018-12-09 20:51:32');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `masterId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `masterId` (`masterId`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_masterId_unique` (`masterId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jahangir','syedjahangir.p16@iiits.in',NULL,47,'2018-12-09 20:09:51','2018-12-09 20:09:51'),(2,'tejkiran','tejkiran.v16@iiits.in',NULL,35,'2018-12-09 20:19:21','2018-12-09 20:19:21'),(3,'subhadeep','subhadeep.d16@iiits.in',NULL,111,'2018-12-09 20:44:29','2018-12-09 20:44:29');
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

-- Dump completed on 2018-12-10  2:27:48
