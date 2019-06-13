-- MySQL dump 10.15  Distrib 10.0.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db2017320151
-- ------------------------------------------------------
-- Server version	10.0.38-MariaDB-0ubuntu0.16.04.1

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
-- Table structure for table `battles`
--

DROP TABLE IF EXISTS `battles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battles` (
  `b_name` varchar(40) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`b_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battles`
--

LOCK TABLES `battles` WRITE;
/*!40000 ALTER TABLE `battles` DISABLE KEYS */;
INSERT INTO `battles` VALUES ('busan',1839),('chicago',1928),('dodgers',1938),('huston',1945),('london',1928),('sapporo',1893),('seoul',1978),('노량',1898);
/*!40000 ALTER TABLE `battles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `guest_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `date_from` varchar(10) NOT NULL DEFAULT '',
  `date_to` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`guest_id`,`hotel_id`,`room_id`,`date_from`,`date_to`),
  KEY `hotel_id` (`hotel_id`,`room_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`guest_id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`hotel_id`, `room_id`) REFERENCES `room` (`hotel_id`, `room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (12312,3832,103,'10/29','11/3'),(14124,8284,304,'11/23','11/26'),(32837,7071,301,'10/15','10/20'),(49874,7071,301,'10/11','10/15'),(51412,3251,107,'9/9','9/13'),(53243,3251,306,'10/25','10/30'),(53243,9478,708,'10/10','10/15'),(64743,9478,708,'10/23','10/24'),(64743,9490,504,'10/27','10/28');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `brand_id` int(10) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(20) NOT NULL,
  `launching_year` int(5) NOT NULL,
  `country` varchar(20) NOT NULL,
  `brand_info` text NOT NULL,
  PRIMARY KEY (`brand_id`),
  KEY `country` (`country`),
  CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`country`) REFERENCES `country` (`country_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'GUCCI',1873,'이탈리아','구찌갱'),(3,'Jil Stuart New York',1927,'미국','질스튜어트\r\n'),(5,'GIORDANO',1946,'스페인','지오다노'),(6,'H&M',1937,'스웨덴','H&M'),(7,'uniqlo',1987,'일본','유니클로'),(8,'covernat',2008,'대한민국','커버낫(COVERNAT)은 배럴즈(윤형석 대표)가 전개하는 2008년에 설립된 캐주얼 브랜드이다.');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `class` varchar(40) NOT NULL,
  `type` char(2) NOT NULL,
  `numGuns` int(11) DEFAULT NULL,
  `displacement` int(11) NOT NULL,
  PRIMARY KEY (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES ('apple','CC',19,12000),('black','BB',13,3200),('blue','CC',5,6000),('grape','CC',23,6000),('peach','DD',7,4500),('red','FF',8,3500),('white','BB',10,4300);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloth`
--

DROP TABLE IF EXISTS `cloth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloth` (
  `cloth_id` int(10) NOT NULL AUTO_INCREMENT,
  `cloth_name` varchar(40) NOT NULL,
  `brand_id` int(10) NOT NULL,
  `making_year` int(10) NOT NULL,
  `season_name` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `position` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `cloth_info` text NOT NULL,
  PRIMARY KEY (`cloth_id`),
  KEY `brand_id` (`brand_id`),
  KEY `season_name` (`season_name`),
  KEY `gender` (`gender`),
  KEY `position` (`position`,`type`),
  CONSTRAINT `cloth_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`),
  CONSTRAINT `cloth_ibfk_2` FOREIGN KEY (`season_name`) REFERENCES `season` (`season_name`),
  CONSTRAINT `cloth_ibfk_3` FOREIGN KEY (`gender`) REFERENCES `gender` (`gender_gender`),
  CONSTRAINT `cloth_ibfk_4` FOREIGN KEY (`position`, `type`) REFERENCES `kind` (`position`, `type`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloth`
--

LOCK TABLES `cloth` WRITE;
/*!40000 ALTER TABLE `cloth` DISABLE KEYS */;
INSERT INTO `cloth` VALUES (85,'uniqlo u',7,2019,'S/S','남성','상의','니트/스웨터','베이직에 혁신을 더해 더욱 단순화된 디테일과 실루엣이 다채로운 어스톤의 색조와 강렬한 엑센트 컬러를 강조해 역대 uniqlo u 컬렉션 중 가장 강렬한 컬러매칭을 보여준다.'),(86,'블루 체크 면혼방 긴팔셔츠',3,2019,'S/S','남성','상의','셔츠','깔끔한 체크가 포인트가 되는 베이직 한 핏의 셔츠 입니다. 봄부터 초여름 까지 단품으로 입기 좋은셔츠입니다.\r\n버튼을 하나 혹은 두개를 풀어 캐쥬얼한 데일리룩으로 연출하셔도 좋아요'),(90,'과잠',1,1999,'S/S','혼성','상의','점퍼','과잠!');
/*!40000 ALTER TABLE `cloth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `country_id` int(10) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(20) NOT NULL,
  PRIMARY KEY (`country_name`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'대한민국'),(2,'일본'),(3,'이탈리아'),(4,'프랑스'),(5,'스웨덴'),(6,'미국'),(7,'스페인');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily`
--

DROP TABLE IF EXISTS `daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily` (
  `daily_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `season_name` varchar(20) NOT NULL,
  `user` varchar(20) NOT NULL,
  `daily_info` text NOT NULL,
  `added_date` datetime NOT NULL,
  PRIMARY KEY (`daily_id`),
  KEY `season_name` (`season_name`),
  CONSTRAINT `daily_ibfk_1` FOREIGN KEY (`season_name`) REFERENCES `season` (`season_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily`
--

LOCK TABLES `daily` WRITE;
/*!40000 ALTER TABLE `daily` DISABLE KEYS */;
INSERT INTO `daily` VALUES (4,'데일리라이프','S/S','syz','로파이(LOFI)의 2019년 여름 시즌 룩북입니다. 가볍고 시원한 착용감을 가진 린넨 소재와 페이즐리 패턴으로 이루어진 반팔 셔츠, 무더운 날씨에도 쾌적한 느낌을 주는 여름 팬츠들을 조합하여 편안하고 자연스러운 데일리룩을 제안합니다.!','2019-05-21 15:08:18'),(5,'어썸믹스 1990','S/S','댁스터','\r\n댁스터(dexxter)의 19ss는 \"Awesome Mix 1990\" 이라는 시즌 컨셉을 앞세워 90년대 뉴욕의 레트로 감성과 현대 스트리트 패션의 접점을 찾아내 댁스터만의 스타일링을 현재의 시점에서 재해석하여 연출하였다. 새롭게 선보이는 체스트 리그 백, 핫 서머와 어울리는 네온 컬러 및 베이직 컬러 숏 팬츠, 스몰 로고 및 빅 로고를 활용한 그래픽/워싱 티셔츠 그리고 체크 패턴을 활용한 \"1990\"시리즈 볼캡 등 다양한 제품들을 만날 수 있다. \r\n ','2019-05-21 15:08:57');
/*!40000 ALTER TABLE `daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender` (
  `gender_id` int(10) NOT NULL AUTO_INCREMENT,
  `gender_gender` varchar(20) NOT NULL,
  PRIMARY KEY (`gender_gender`),
  KEY `gender_id` (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'남성'),(2,'여성'),(3,'혼성');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guest` (
  `guest_id` int(11) NOT NULL,
  `guest_name` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `guest_city` varchar(20) NOT NULL,
  PRIMARY KEY (`guest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (12312,'WooSung',51,'Busan'),(14124,'홍길동',34,'Daegu'),(32837,'Trout',28,'Los Angeles'),(49874,'JiHwan',24,'Seoul'),(51412,'Honda',64,'Sapporo'),(53243,'Altube',67,'Houston'),(64743,'Hazard',28,'London'),(73843,'Ronaldo',58,'Italy');
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `hotel_id` int(11) NOT NULL,
  `hotel_name` varchar(30) NOT NULL,
  `city` varchar(20) NOT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (3251,'Plus','California'),(3832,'Palace','Osaka'),(7071,'한국호텔','Seoul'),(8284,'Lexy','Daegu'),(9478,'London','London'),(9490,'Oxford','London');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue` (
  `issue_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `brand_id` int(10) NOT NULL,
  `added_date` datetime NOT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
INSERT INTO `issue` VALUES (9,'H&M, 새옷 아닌 중고의류 판다','H&M 그룹이 중고 의류와 빈티지 제품을 판매할 예정이다. 지난 4월 5일(현지시각) 독일 베를린에서 열린 2019 체인지 메이커스 랩(Change makers lab) 세미나에 참석한 H&M 그룹의 지속가능 경영 책임자 안나 게다(Anna Gedda)는 로이터 통신과의 인터뷰에서 “H&M이 스웨덴에서 중고 제품 온라인 판매를 시험 구동할 것”이라며 “먼저 ‘앤아더스토리즈’ 사이트로 시작해 다른 브랜드에까지 확대할 것”이라고 밝혔다. 앤아더스토리즈는 H&M 그룹의 글로벌 SPA(제조유통 일괄형)브랜드다.   \r\n\r\n',6,'2019-05-21 14:49:05'),(10,'유니클로,따끈따끈한 2019 s/s 유니클로 u 신상 ','글로벌 패션브랜드 유니클로가 오는 2월 1일 2019 s/s UNIQLO U 컬렉션을 출시한다.\r\n11일 유니클로는  2019 s/s UNIQLO U 컬렉션을 출시하고 티셔츠와 스웨트등 9개 아이템의 판매를 오는 14일 부터 판매한다고 밝혔다.\r\n 2019 s/s UNIQLO U는 세계적인 디자이너이자 유니클로 파리 R&D 센터의 아티스틱 디렉터 크리스토퍼 르메르가 이끄는 디자인 팀이 선보이는 컬렉션으로 베이직을 새롭게 재해석한 심플하면서도 디자인과 소재의 퀄리티를 중시한다.',7,'2019-05-21 14:49:29'),(11,'커버낫 인기상품 재입고','국내 브랜드 커버낫(COVERNAT)의 인기 상품들이 재입고 되었다. 레이아웃 로고 반소매 티셔츠, 패커블 쇼츠, 코듀라 럭색 등이 그 주인공. 반소매 티셔츠는 XL 사이즈가 추가해 선택의 폭을 넓혔고, 코듀라 어센틱 로고 럭색을 구입 하면 커버낫의 3단 지갑을 사은품으로 증정한다. ',8,'2019-05-21 15:06:30');
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kind`
--

DROP TABLE IF EXISTS `kind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kind` (
  `position` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`position`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kind`
--

LOCK TABLES `kind` WRITE;
/*!40000 ALTER TABLE `kind` DISABLE KEYS */;
INSERT INTO `kind` VALUES ('상의','가디건'),('상의','니트/스웨터'),('상의','블라우스'),('상의','셔츠'),('상의','수트/정장'),('상의','원피스'),('상의','자켓'),('상의','점퍼'),('상의','코트'),('상의','티셔츠'),('하의','스커트'),('하의','팬츠');
/*!40000 ALTER TABLE `kind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcomes`
--

DROP TABLE IF EXISTS `outcomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outcomes` (
  `s_name` varchar(50) NOT NULL,
  `b_name` varchar(40) NOT NULL DEFAULT '',
  `result` varchar(20) NOT NULL,
  PRIMARY KEY (`s_name`,`b_name`),
  KEY `b_name` (`b_name`),
  CONSTRAINT `outcomes_ibfk_1` FOREIGN KEY (`s_name`) REFERENCES `ships` (`s_name`),
  CONSTRAINT `outcomes_ibfk_2` FOREIGN KEY (`b_name`) REFERENCES `battles` (`b_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outcomes`
--

LOCK TABLES `outcomes` WRITE;
/*!40000 ALTER TABLE `outcomes` DISABLE KEYS */;
INSERT INTO `outcomes` VALUES ('g1','sapporo','침몰'),('j1','노량','침몰'),('k1','huston','ok'),('k1','노량','손상'),('k2','busan','침몰'),('u1','chicago','ok'),('u1','dodgers','손상'),('u1','huston','ok'),('u1','london','ok'),('u1','seoul','손상'),('u2','huston','손상'),('u3','busan','손상');
/*!40000 ALTER TABLE `outcomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `hotel_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`hotel_id`,`room_id`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (3251,107,'double_room',160000),(3251,205,'single_room',120000),(3251,306,'premium_room',210000),(3832,103,'premium_room',250000),(3832,201,'double_room',120000),(7071,205,'double_room',200000),(7071,207,'double_room',200000),(7071,301,'single_room',150000),(7071,501,'premium_room',350000),(8284,304,'single_room',90000),(8284,405,'double_room',130000),(9478,609,'double_room',220000),(9478,708,'premium_room',340000),(9490,504,'premium_room',280000),(9490,602,'single_room',180000);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season` (
  `season_id` int(10) NOT NULL AUTO_INCREMENT,
  `season_name` varchar(20) NOT NULL,
  PRIMARY KEY (`season_name`),
  KEY `season_id` (`season_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (1,'S/S'),(2,'F/W');
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ships`
--

DROP TABLE IF EXISTS `ships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ships` (
  `s_name` varchar(50) NOT NULL,
  `class` varchar(40) NOT NULL,
  `country` varchar(20) NOT NULL,
  `launched` int(11) NOT NULL,
  PRIMARY KEY (`s_name`),
  KEY `class` (`class`),
  CONSTRAINT `ships_ibfk_1` FOREIGN KEY (`class`) REFERENCES `classes` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ships`
--

LOCK TABLES `ships` WRITE;
/*!40000 ALTER TABLE `ships` DISABLE KEYS */;
INSERT INTO `ships` VALUES ('g1','red','독일',1840),('j1','white','일본',1870),('k1','apple','대한민국',1898),('k2','blue','대한민국',1783),('k3','grape','대한민국',1928),('u1','grape','미국',1900),('u2','apple','미국',1938),('u3','red','미국',1839);
/*!40000 ALTER TABLE `ships` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-14  4:21:33
