-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.14.04.1

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
-- Table structure for table `broadcast`
--

DROP TABLE IF EXISTS `broadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broadcast` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` text NOT NULL,
  `number_of_likes` int(11) NOT NULL,
  `number_of_dislikes` int(11) NOT NULL,
  `number_of_shares` int(11) NOT NULL,
  `base_broadcast_id` int(11) NOT NULL,
  `data` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broadcast`
--

LOCK TABLES `broadcast` WRITE;
/*!40000 ALTER TABLE `broadcast` DISABLE KEYS */;
INSERT INTO `broadcast` VALUES (2,'mancy',1,1,1,1,'hello_world','2017-03-22 15:51:17',0),(15,'',3,3,3,0,'','2017-03-22 23:48:03',0),(16,'mancy',0,0,0,2,'i\'m happy ','2017-03-12 12:44:06',1),(17,'mada',1,-1,1,3,'i\'m not  happy ','2017-04-11 20:30:43',2),(18,'fadia',0,0,0,4,'i\'m very happy ','2017-03-12 12:50:17',3),(19,'alaa',0,0,0,5,'i\'m just happy ','2017-03-12 12:50:40',4),(20,'mona',0,0,0,6,'i\'m so so happy ','2017-03-12 12:51:06',5),(21,'mancy',0,0,0,1,'i\'m so so happy','2017-03-22 16:08:02',5),(22,'mancy',0,0,0,1,'i\'m so so happy','2017-04-11 19:09:13',5),(23,'mancy',0,0,0,1,'i\'m so so happy','2017-04-11 19:09:22',5),(24,'mancy',1,1,1,1,'hello_world','2017-04-11 20:12:14',0),(25,'mancy',1,1,1,1,'hello_world','2017-04-11 20:12:33',0),(26,'mancy',1,1,1,1,'hello_world','2017-04-11 20:12:44',0),(27,'mancy',1,1,1,1,'hello_world','2017-04-11 20:13:01',0),(28,'mancy',1,1,1,1,'hello_world','2017-04-11 20:15:11',0),(29,'mancy',1,1,1,1,'hello_world','2017-04-11 20:16:01',0),(30,'',10,10,10,0,'','2017-04-11 20:26:06',0),(31,'',0,0,0,36,'donnnnne','2017-05-30 20:44:37',1),(32,'',0,0,0,36,'donnnnne','2017-05-30 20:56:07',1),(33,'',0,0,0,36,'donnnnne','2017-05-30 20:56:56',1),(34,'',0,0,0,36,'donnnnne','2017-05-30 21:01:25',1),(35,'',0,0,0,36,'donnnnne','2017-05-30 21:10:45',1),(36,'',0,0,0,36,'donnnnne','2017-05-30 21:11:57',1),(37,'',0,0,0,36,'donnnnne','2017-05-30 21:30:19',1),(38,'',0,0,0,36,'donnnnne','2017-05-30 21:49:01',1),(39,'',0,0,0,36,'donnnnne','2017-05-30 21:52:53',1),(40,'',0,0,0,36,'donnnnne','2017-05-30 21:53:14',1),(41,'',0,0,0,36,'donnnnne','2017-05-30 21:55:14',1),(42,'',0,0,0,36,'donnnnne','2017-05-30 21:59:33',1),(43,'',0,0,0,36,'donnnnne','2017-05-30 22:06:23',1),(44,'',0,0,0,36,'donnnnne','2017-05-30 22:06:50',1),(45,'',0,0,0,36,'donnnnne','2017-05-30 22:10:46',1),(46,'',0,0,0,36,'donnnnne','2017-05-30 22:13:20',1),(47,'ewrre',0,0,0,0,'oiregjreoipgjreoijgre','2017-06-11 18:28:47',114);
/*!40000 ALTER TABLE `broadcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customized_objects`
--

DROP TABLE IF EXISTS `customized_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customized_objects` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `resources` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customized_objects`
--

LOCK TABLES `customized_objects` WRITE;
/*!40000 ALTER TABLE `customized_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `customized_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `land`
--

DROP TABLE IF EXISTS `land`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `land` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `land_owner_id` int(11) NOT NULL,
  `row_number` int(11) NOT NULL,
  `column_number` int(11) NOT NULL,
  `block_data_path` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `land`
--

LOCK TABLES `land` WRITE;
/*!40000 ALTER TABLE `land` DISABLE KEYS */;
INSERT INTO `land` VALUES (1,0,66666,3,''),(2,0,66666,3,''),(3,7,66666,3,''),(4,2,66666,8,''),(5,2,66666,9,''),(6,2,66666,9,''),(7,0,66666,333,''),(8,7,7,9,''),(9,0,4,7,'');
/*!40000 ALTER TABLE `land` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) NOT NULL,
  `notification` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,114,'hello noti'),(2,114,'some one attacked you check the game');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `number_of_followers` int(11) NOT NULL,
  `number_of_following` int(11) NOT NULL,
  `number_of_level` int(11) NOT NULL,
  `number_of_broadcast` int(11) NOT NULL,
  `notifications` int(11) NOT NULL,
  `offline_messages` int(11) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `inventory` text NOT NULL,
  `profile_picture` text NOT NULL,
  `current_land_id` int(11) NOT NULL,
  `log` text NOT NULL,
  `user_name` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` text NOT NULL,
  `unique_string_identifier` int(11) NOT NULL,
  `email` text NOT NULL,
  `nationality` text NOT NULL,
  `birthdate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (0,0,0,0,0,0,0,'','',0,'','mancy',104,'22',0,'','','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','noehal',105,'21',0,'','','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','ola',106,'88',0,'','','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','ali',107,'99',0,'','','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','medo',108,'2',0,'','','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','cc',109,'1',0,'','','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','said',110,'898',0,'','','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','omar',111,'898656',0,'','','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','mada',112,'0000',0,'mohedsh@gmail.com','egyptian','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','mada1',113,'0000',0,'mohedsh@gmail.com','egyptian','2017-06-04'),(0,0,0,0,0,0,0,'','',0,'','mona adel',114,'342',0,'mona.adel20151995@gmail.com','Egyptian','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','mona tany',115,'11111',0,'hjsbjsb','Chinese','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','test',116,'123',0,'gg','Canadian','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','m',117,'1',0,'','American','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','t',118,'1',0,'','American','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','a',119,'1',0,'','American','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','go',120,'11',0,'','American','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','test app',121,'33',0,'','American','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','yassin',122,'123',0,'yasin_email','Egyptian','0000-00-00'),(0,0,0,0,0,0,0,'','content://com.android.providers.media.documents/document/image%3A132559',0,'','yassin',123,'123',0,'yasin_email','Egyptian','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','',124,'',0,'','American','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','mona adel',125,'342972015',0,'mona.adel@gmail.com','Egyptian','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','mona adel',126,'343972015',0,'mona.adel@gmail.com','Egyptian','0000-00-00'),(0,0,0,0,0,0,0,'','',0,'','mona',127,'342972015',0,'mona.adel@gmail.com','Egyptian','0000-00-00');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendeded`
--

DROP TABLE IF EXISTS `recommendeded`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommendeded` (
  `playerid` int(11) NOT NULL,
  `list` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`playerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendeded`
--

LOCK TABLES `recommendeded` WRITE;
/*!40000 ALTER TABLE `recommendeded` DISABLE KEYS */;
INSERT INTO `recommendeded` VALUES (1,'1,2,3,4,5,6'),(2,'849,8,34,7,3,'),(3,'849,');
/*!40000 ALTER TABLE `recommendeded` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergraph`
--

DROP TABLE IF EXISTS `usergraph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergraph` (
  `nodeFrom` int(11) NOT NULL,
  `nodeTo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergraph`
--

LOCK TABLES `usergraph` WRITE;
/*!40000 ALTER TABLE `usergraph` DISABLE KEYS */;
INSERT INTO `usergraph` VALUES (1,5),(3,8),(6,8),(6,8),(8,8),(10,8),(11,8);
/*!40000 ALTER TABLE `usergraph` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-20  9:06:31
