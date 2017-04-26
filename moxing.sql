-- MySQL dump 10.14  Distrib 5.5.52-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: moxing
-- ------------------------------------------------------
-- Server version	5.5.52-MariaDB

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
-- Table structure for table `evaluate`
--

DROP TABLE IF EXISTS `evaluate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_id` int(11) DEFAULT NULL COMMENT '发送者的id',
  `rece_id` int(11) DEFAULT NULL COMMENT '接受者的id',
  `level` int(1) DEFAULT NULL COMMENT '评分 0-5',
  `cDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluate_sender` (`send_id`),
  KEY `evaluate_receiver` (`rece_id`),
  CONSTRAINT `evaluate_receiver` FOREIGN KEY (`rece_id`) REFERENCES `user` (`id`),
  CONSTRAINT `evaluate_sender` FOREIGN KEY (`send_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='旅行完后对对方的评价';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluate`
--

LOCK TABLES `evaluate` WRITE;
/*!40000 ALTER TABLE `evaluate` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label`
--

DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `extraversion_score` int(11) DEFAULT NULL,
  `agreeableness_score` int(11) DEFAULT NULL,
  `conscientiousness_score` int(11) DEFAULT NULL,
  `warmth` bit(1) DEFAULT NULL,
  `gregariousness` bit(1) DEFAULT NULL,
  `assertiveness` bit(1) DEFAULT NULL,
  `excitement_seeking` bit(1) DEFAULT NULL,
  `activity` bit(1) DEFAULT NULL,
  `positive_emotions` bit(1) DEFAULT NULL,
  `trust` bit(1) DEFAULT NULL,
  `straightforwardness` bit(1) DEFAULT NULL,
  `altruism` bit(1) DEFAULT NULL,
  `compliance` bit(1) DEFAULT NULL,
  `modesty` bit(1) DEFAULT NULL,
  `tender-mindedness` bit(1) DEFAULT NULL,
  `competence` bit(1) DEFAULT NULL,
  `order0` bit(1) DEFAULT NULL,
  `dutifulness` bit(1) DEFAULT NULL,
  `achievement_striving` bit(1) DEFAULT NULL,
  `self-discipline` bit(1) DEFAULT NULL,
  `deliberation` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label`
--

LOCK TABLES `label` WRITE;
/*!40000 ALTER TABLE `label` DISABLE KEYS */;
INSERT INTO `label` VALUES (1,3,5,13,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,9,34,12,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `travel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `liker` (`user_id`),
  KEY `liked` (`travel_id`),
  CONSTRAINT `liked` FOREIGN KEY (`travel_id`) REFERENCES `travel` (`id`),
  CONSTRAINT `liker` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='点赞，相互对对方发布的行程点赞才会匹配';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
INSERT INTO `like` VALUES (2,2,4),(3,2,3),(4,3,2);
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_log`
--

DROP TABLE IF EXISTS `login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `cDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`user_id`),
  CONSTRAINT `login` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_log`
--

LOCK TABLES `login_log` WRITE;
/*!40000 ALTER TABLE `login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match`
--

DROP TABLE IF EXISTS `match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_travel_id` int(11) DEFAULT NULL,
  `second_travel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `first_user_id` (`first_travel_id`),
  KEY `second_user_id` (`second_travel_id`),
  CONSTRAINT `first_user_id` FOREIGN KEY (`first_travel_id`) REFERENCES `user` (`id`),
  CONSTRAINT `second_user_id` FOREIGN KEY (`second_travel_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match`
--

LOCK TABLES `match` WRITE;
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
INSERT INTO `match` VALUES (3,3,2);
/*!40000 ALTER TABLE `match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_id` int(11) DEFAULT NULL COMMENT '发送者id',
  `rece_id` int(11) DEFAULT NULL COMMENT '接受者id',
  `content` varchar(255) DEFAULT NULL COMMENT '消息内容',
  `cDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sender` (`send_id`),
  KEY `receiver` (`rece_id`),
  CONSTRAINT `receiver` FOREIGN KEY (`rece_id`) REFERENCES `user` (`id`),
  CONSTRAINT `sender` FOREIGN KEY (`send_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,2,3,'你好','2017-03-14 09:36:48'),(2,3,2,'halo，我是b','2017-03-14 10:37:01'),(3,2,3,'我是a，hhh','2017-03-15 09:37:08'),(4,3,2,'我们的旅行匹配到一起啦，来聊聊吧','2017-03-20 21:36:17');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel`
--

DROP TABLE IF EXISTS `travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '发布者id',
  `friend_id` int(11) DEFAULT NULL COMMENT '匹配到的用户id，若还没有，则为0',
  `begin_pos_prov` varchar(255) DEFAULT NULL COMMENT '出发地',
  `begin_pos_city` varchar(255) DEFAULT NULL,
  `dest_pos_prov` varchar(255) DEFAULT NULL COMMENT '目的地',
  `dest_pos_city` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL COMMENT '发布的图片位置',
  `state` int(1) DEFAULT NULL COMMENT '状态，0表示未匹配到，1表示匹配到进行中，2表示已完成',
  `title` varchar(20) DEFAULT NULL COMMENT '旅行的标题',
  `description` varchar(255) DEFAULT NULL COMMENT '旅行的内容',
  `cDate` datetime DEFAULT NULL COMMENT '发布日期',
  `begin_date` datetime DEFAULT NULL COMMENT '开始日期',
  `end_date` datetime DEFAULT NULL COMMENT '结束日期',
  `longitude` double DEFAULT NULL COMMENT '精度',
  `latitude` double DEFAULT NULL COMMENT '纬度',
  `is_expired` bit(1) DEFAULT NULL COMMENT '判断行程是否过期',
  `like_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_belong` (`user_id`),
  KEY `user_friend` (`friend_id`),
  CONSTRAINT `user_belong` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_friend` FOREIGN KEY (`friend_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel`
--

LOCK TABLES `travel` WRITE;
/*!40000 ALTER TABLE `travel` DISABLE KEYS */;
INSERT INTO `travel` VALUES (2,2,3,'广东','广州','北京','北京','www.taobao.com',0,'出游','halo,Beijing',NULL,'2017-01-20 00:00:00','2017-01-25 00:00:00',56.34,45.23,'\0',1),(3,3,2,'广东','广州','北京','北京','www.taobao.com',0,'出游','halo,Beijing',NULL,'2017-01-20 00:00:00','2017-01-25 00:00:00',56.34,45.23,'\0',1),(4,9,NULL,'广东','广州','北京','北京','www.taobao.com',0,'出游','halo, Beijing',NULL,'2017-01-20 00:00:00','2017-01-27 00:00:00',56.23,25.56,'\0',1),(5,5,NULL,'山东','青岛','广东','清远',NULL,0,'出游啦',NULL,NULL,'2017-01-25 00:00:00','2017-02-02 00:00:00',56.66,45.78,'\0',0);
/*!40000 ALTER TABLE `travel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `phone_num` varchar(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cDate` datetime DEFAULT NULL,
  `mDate` datetime DEFAULT NULL,
  `is_valid` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'abc','abc',NULL,NULL,''),(2,'13750065376','123123',NULL,NULL,''),(3,'10086','123456',NULL,NULL,''),(4,'100861','123456',NULL,NULL,''),(5,'234','87',NULL,NULL,''),(6,'31231','313',NULL,NULL,''),(9,'12740054376','46523',NULL,NULL,''),(10,'12740054379','46523',NULL,NULL,''),(11,'13430054312','123123',NULL,NULL,'');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `phone_num` varchar(11) DEFAULT NULL COMMENT '注册的手机号码',
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `headimg_url` varchar(255) DEFAULT NULL COMMENT '头像的url',
  `pos_city` varchar(255) DEFAULT NULL,
  `sex` bit(1) DEFAULT NULL COMMENT '性别',
  `cDate` datetime DEFAULT NULL COMMENT '创建时间',
  `mDate` datetime DEFAULT NULL COMMENT '修改时间',
  `user_id` int(10) DEFAULT NULL COMMENT '外键，用于连接到user表',
  `pos_prov` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'13430054316','小红','www.taobao.com','珠海','','2017-03-07 22:02:22',NULL,3,'广东'),(2,'13430052345','小兰','www.taobao.com','深圳','','2017-03-06 22:01:14',NULL,2,'广东'),(4,'13430054312','小明','www.taobao.com','广州','\0','2017-03-03 12:01:21',NULL,11,'广东');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-26 15:27:21
