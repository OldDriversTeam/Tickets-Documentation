-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ticketsdb
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema` (
  `cinema_id` varchar(100) NOT NULL,
  `cinema_name` varchar(100) NOT NULL,
  `cinema_address` varchar(100) DEFAULT NULL,
  `cinema_phone` varchar(100) DEFAULT NULL,
  `city_id` varchar(100) NOT NULL,
  PRIMARY KEY (`cinema_id`),
  KEY `fk_cinema_city1_idx` (`city_id`),
  CONSTRAINT `FK2lxd9v0mo9e6r5aq9qpadm19s` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`),
  CONSTRAINT `fk_cinema_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES ('c1','金逸珠江国际影城广州大学城店','番禺区小谷接到贝岗村中二横路1号GOGO新天地二期二楼','020-39340185','440100'),('c2','中华广场电影城','越秀区中山三路33号中华广场9楼','020-83739423','440100'),('c3','广州科学中心巨幕影院','番禺区广州大学城西六路168号','020-39348080','440100');
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `city_id` varchar(100) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES ('440100','广州');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` varchar(100) NOT NULL,
  `comment_title` varchar(100) DEFAULT NULL,
  `comment_content` varchar(1000) DEFAULT NULL,
  `comment_date` varchar(100) DEFAULT NULL,
  `cinema_id` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `showing_id` varchar(100) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_comment_cinema1_idx` (`cinema_id`),
  KEY `fk_comment_user1_idx` (`user_id`),
  KEY `fk_comment_show1_idx` (`showing_id`),
  CONSTRAINT `FK8kcum44fvpupyw6f5baccx25c` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKb4q634ptlhl06uv421bsla360` FOREIGN KEY (`showing_id`) REFERENCES `showing` (`showing_id`),
  CONSTRAINT `FKtfea74q6e2fupgl7ih6llgyry` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`),
  CONSTRAINT `fk_comment_cinema1` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_show1` FOREIGN KEY (`showing_id`) REFERENCES `showing` (`showing_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `movie_id` varchar(100) NOT NULL,
  `movie_name` varchar(100) NOT NULL,
  `movie_release_date` varchar(100) DEFAULT NULL,
  `movie_storyline` varchar(1000) DEFAULT NULL,
  `movie_detail` varchar(999) DEFAULT NULL,
  `movie_poster` varchar(9999) DEFAULT NULL,
  `movie_avgScore` float DEFAULT NULL,
  `movie_isShow` tinyint(1) DEFAULT NULL,
  `movie_type_id` varchar(100) NOT NULL,
  `avgScore` float DEFAULT NULL,
  `moive_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`movie_id`),
  KEY `fk_movie_movieType1_idx` (`movie_type_id`),
  CONSTRAINT `FK2b5ikg76gp4rgbiptqm68ejww` FOREIGN KEY (`movie_type_id`) REFERENCES `movietype` (`movie_type_id`),
  CONSTRAINT `fk_movie_movieType1` FOREIGN KEY (`movie_type_id`) REFERENCES `movietype` (`movie_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES ('m1','加勒比海盗5：死无对证','2017-05-26','杰克船长（约翰尼·德普饰）发现令人闻风丧胆的萨拉查船长 （哈维尔·巴登饰）竟率领着一众夺命亡灵水手逃出了百慕大三角区。他们扬言要杀尽世上所有的海盗，头号目标就是杰克船长。要想改写命运，杰克船长唯一的希望就是找到传说中海神波塞冬的三叉戟，拥有它就能拥有统治整个海洋的力量。为了寻获这件神器，杰克船长被迫和聪明美丽的天文学家卡琳娜·史密斯（卡雅·斯考达里奥饰）以及固执的年轻皇家海军亨利（布兰顿·思怀兹饰）联手出击。航行着他那破破烂烂的“黑珍珠”号，杰克船长不但决心要改变自己的厄运，同时也力求能从史上最狠毒可怕的敌人那里捡回一条命','中文名 加勒比海盗5：死无对证  外文名 Pirates of the Caribbean: Dead Men Tell No Tales/Salazar\'s Revenge  其它译名 死无对证、亡灵的缄默、亡者无言、死人不会告密、萨拉查的复仇  出品时间 2017年 出品公司 迪士尼影片公司、杰瑞·布鲁克海默电影公司 发行公司 迪士尼影片公司 制片地区 美国 制片成本 3亿美元（估） 拍摄地点 昆士兰、澳大利亚 拍摄日期 2015年 导    演乔阿吉姆·罗恩尼、艾斯彭·山德伯格 编    剧斯图尔特·比蒂、泰德·埃里奥特、杰夫·内桑森、特里·鲁西奥 制片人杰瑞·布鲁克海默 类    型 动作、奇幻、冒险、探险 主    演约翰尼·德普，奥兰多·布鲁姆，杰弗里·拉什，哈维尔·巴登，布兰顿·思怀兹，卡雅·斯考达里奥，凯文·麦克纳利 片    长 129分钟 上映时间 2017年5月26日(中国大陆/美国)  分    级 PG-13  对白语言 英语 色    彩 彩色 imdb编码 tt1790809','https://img3.doubanio.com/view/photo/photo/public/p2459723975.webp',9.5,1,'mt1'),('m2','摔跤吧！爸爸','2017-05-05','马哈维亚·辛格·珀尕是印度国家摔跤冠军，却因生活所迫放弃摔跤。他希望儿子可以帮他完成梦想——为印度赢得世界级金牌。不料命运捉弄让他生了四个女儿，偶然的机会他开始教女儿摔跤，努力使女儿变成世界级的摔跤手，期间趣事多多，但也由此引发了一连串有关舆论、宗教等社会话题的事件，尽管有极大的困难，最终大女儿们进入英联邦摔跤比赛并夺得冠军','中文名 摔跤吧！爸爸 外文名 Dangal 出品时间 2016年 出品公司 Aamir Khan Productions Ltd. 发行公司 UTV Motion Pictures 制片地区 印度 拍摄地点 印度 导    演尼特什·提瓦瑞 编    剧 比于什·古普塔、施热亚·简、尼特什·提瓦瑞 类    型 剧情、喜剧、传记、运动 主    演阿米尔·汗，萨卡诗·泰瓦，桑亚·玛荷塔，法缇玛·萨那·纱卡 片    长 169分钟 上映时间 2016年12月23日（印度）2017年5月5日（中国） 对白语言 北印度语 色    彩 彩色 主要奖项 第62届印度电影观众奖','https://img3.doubanio.com/view/photo/photo/public/p2457983084.webp',9.7,1,'mt2'),('m3','异星觉醒','2017-05-19','人类发现了一个火星上的生命体，宇航员们试图在空间站唤醒这个活体细胞并研究它，希望确保安全后把它带到地球。然而唤醒这个神秘外星生命后，未知的巨大灾难也随之而来。太空和急诊医学专家方凯文博士以及基因学专家亚当·卢瑟福博士，一切从发现外星生命开始。这个来自火星的幸存生命细胞既是肌肉又是大脑，它可能是有史以来最厉害的外星怪物，而唤醒它不仅威胁着空间站里每个宇航员的生命','中文名 异星觉醒 外文名 Life 其它译名 生命 发行公司 哥伦比亚电影公司[1]  制片地区 美国 导    演丹尼尔·伊斯皮诺萨 编    剧略特·里斯、保罗·韦尼克 类    型 科幻、灾难片 主    演杰克·吉伦哈尔，丽贝卡·弗格森，瑞安·雷诺兹，真田广之 上映时间 2017年3月24日（美国）[1]  对白语言 英语 色    彩 彩色 imdb编码 tt5442430','https://img3.doubanio.com/view/photo/photo/public/p2459315005.webp',7.8,1,'mt3');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movietype`
--

DROP TABLE IF EXISTS `movietype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movietype` (
  `movie_type_id` varchar(100) NOT NULL,
  `movie_type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`movie_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movietype`
--

LOCK TABLES `movietype` WRITE;
/*!40000 ALTER TABLE `movietype` DISABLE KEYS */;
INSERT INTO `movietype` VALUES ('mt1','动作/冒险/喜剧'),('mt2','剧情/传记/运动'),('mt3','科幻/惊悚/恐怖');
/*!40000 ALTER TABLE `movietype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_id` varchar(100) NOT NULL,
  `review_content` varchar(9999) DEFAULT NULL,
  `review_score` float DEFAULT NULL,
  `review_title` varchar(100) DEFAULT NULL,
  `review_date` varchar(100) DEFAULT NULL,
  `user_id` varchar(100) NOT NULL,
  `showing_id` varchar(100) NOT NULL,
  `movie_id` varchar(100) NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `fk_review_user1_idx` (`user_id`),
  KEY `fk_review_show1_idx` (`showing_id`),
  KEY `fk_review_movie1_idx` (`movie_id`),
  CONSTRAINT `FK8378dhlpvq0e9tnkn9mx0r64i` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `FKiyf57dy48lyiftdrf7y87rnxi` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKq35g83jwuwpm6nyqnwojfs3xf` FOREIGN KEY (`showing_id`) REFERENCES `showing` (`showing_id`),
  CONSTRAINT `fk_review_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_show1` FOREIGN KEY (`showing_id`) REFERENCES `showing` (`showing_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `room_id` varchar(100) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `room_type` varchar(100) DEFAULT NULL,
  `room_col` int(11) NOT NULL,
  `room_row` int(11) NOT NULL,
  `cinema_id` varchar(100) NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `fk_room_cinema1_idx` (`cinema_id`),
  CONSTRAINT `FK838jvntrkjvmbpm310wsdad1r` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`),
  CONSTRAINT `fk_room_cinema1` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES ('r1','一号厅','3D',20,50,'c1'),('r2','二号厅','3D',15,30,'c1');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showing`
--

DROP TABLE IF EXISTS `showing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `showing` (
  `showing_id` varchar(100) NOT NULL,
  `showing_date` varchar(100) NOT NULL,
  `room_id` varchar(100) NOT NULL,
  `movie_id` varchar(100) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`showing_id`),
  KEY `fk_show_room1_idx` (`room_id`),
  KEY `fk_show_movie1_idx` (`movie_id`),
  CONSTRAINT `FKckecuv87n9colbxuyf7qg8km2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `FKinjmth3x5dxn65pkek5n2olsa` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `fk_show_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_show_room1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showing`
--

LOCK TABLES `showing` WRITE;
/*!40000 ALTER TABLE `showing` DISABLE KEYS */;
INSERT INTO `showing` VALUES ('s1','2017-05-26-10-30','r1','m1',NULL),('s2','2017-05-27-20-30','r2','m2',NULL);
/*!40000 ALTER TABLE `showing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `ticket_id` varchar(100) NOT NULL,
  `ticket_seatColNum` int(11) NOT NULL,
  `ticket_seatRowNum` int(11) DEFAULT NULL,
  `ticket_price` float NOT NULL,
  `ticket_issold` tinyint(1) NOT NULL,
  `showing_id` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `fk_ticket_show1_idx` (`showing_id`),
  KEY `fk_ticket_user1_idx` (`user_id`),
  CONSTRAINT `FKqot0hu7iv6bxhxdquxtcue4fn` FOREIGN KEY (`showing_id`) REFERENCES `showing` (`showing_id`),
  CONSTRAINT `fk_ticket_show1` FOREIGN KEY (`showing_id`) REFERENCES `showing` (`showing_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES ('s1r1t55',5,5,38.5,1,'s1','123',NULL),('s1r1t56',5,6,38.5,1,'s1','123',NULL),('s2r2t78',7,8,40,1,'s2','124',NULL);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_phone` varchar(100) NOT NULL,
  `user_gender` varchar(10) DEFAULT NULL,
  `user_age` int(11) DEFAULT NULL,
  `user_email` varchar(30) DEFAULT NULL,
  `user_avatar` varchar(9999) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_phone_UNIQUE` (`user_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('123','hshhuan','123456','13660069700','male',18,'some@email.com',''),('124','abc','123456','11111111111','female',20,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-03 19:56:30
