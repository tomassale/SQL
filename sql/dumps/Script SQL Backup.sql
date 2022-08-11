-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: db_winehouse
-- ------------------------------------------------------
-- Server version	8.0.29


-- -------- BACKUP -------- --
-- Se crea un backup de los datos de las tablas
/* 
1- Account
2- Address
3- Company
4- Data
5- History
6- Logs
7- Page
8- Personal
9- User
*/


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('abelison3@hc360.com','DncpgPW','2022-05-08 05:51:13'),('afattorec@hud.gov','cNCT54Okf','2021-07-09 19:27:02'),('bbearward7@globo.com','7HI9JpnYMPRS','2022-05-16 03:30:05'),('dcassells1@bloomberg.com','4tKv989S1Lmk','2021-12-20 14:17:16'),('dmcinility6@rediff.com','u6jyjofjH','2021-11-04 23:19:33'),('fexonb@japanpost.jp','rIsxqOT','2022-06-26 14:16:24'),('ganwyl4@wordpress.com','qp3hpI8MBi','2022-05-02 02:49:30'),('hdoche9@diigo.com','0qbkEs0G','2022-02-21 13:12:03'),('mglowinski0@answers.com','ibbPz2v5Crk','2021-07-06 12:35:15'),('nblade8@creativecommons.org','DEYEVdeTfHz','2021-07-24 17:37:47'),('sbartkiewicze@shutterfly.com','e6riweUowTA','2022-02-07 11:19:51'),('scasol2@paypal.com','77RAlVtvA','2021-09-21 05:11:59'),('speacocka@g.co','p8yg6M','2021-12-25 18:47:14'),('tdelany5@arstechnica.com','uzVT84w40','2021-08-04 22:13:49'),('twetternd@1und1.de','QcxNh6R','2021-12-21 19:37:56');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('102.231.167.128','CN','Dachong','5709 Dunning Drive'),('107.191.247.221','KZ','Qulsary','4 Kim Circle'),('113.196.201.118','AR','Cipolletti','2 Moulton Plaza'),('125.207.210.105','IR','Kabudarahang','511 Green Alley'),('128.31.85.175','FR','Pouzauges','2791 Corscot Parkway'),('144.128.37.184','TO','Pangai','3244 Mosinee Park'),('170.2.31.135','FI','Lestijarvi','7 Pearson Parkway'),('182.104.207.141','FR','Levallois-Perret','1 Schiller Hill'),('198.1.168.51','NG','Maiyema','61 Carberry Point'),('199.52.19.14','US','Austin','6003 Moulton Road'),('23.206.0.188','BW','Ghanzi','7490 Hudson Parkway'),('237.155.207.205','CN','Dongqu','3726 Ramsey Avenue'),('240.253.8.236','ID','Manggis','560 Drewry Crossing'),('29.100.248.181','CN','Leiwang','334 Ilene Circle'),('92.178.65.217','PT','Soure','91048 Village Green Junction');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('04-413-3487','Jaxspan','Mibu',1,'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere'),('07-679-8593','Realpoint','Podeebrady',1,'blandit mi in porttitor pede justo eu massa donec dapibus duis at'),('13-844-8586','Mudo','Leluo',5,'posuere nonummy integer non velit donec diam neque vestibulum eget vulputate'),('19-854-1813','Wikido','Carregado',7,'at turpis donec posuere metus vitae ipsum aliquam non mauris'),('33-055-2198','Browsecat','Yate-Barrage',2,'libero quis orci nullam molestie nibh in lectus pellentesque at nulla'),('35-063-1428','Feedspan','Cipanjang',12,'amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque'),('37-113-3087','Feedmix','Maroua',4,'varius integer ac leo pellentesque ultrices mattis odio donec vitae'),('40-965-0993','Vidoo','Khiliomodhi',6,'rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis'),('41-017-6232','Yata','Taguing',2,'dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum'),('43-365-5872','Twinte','Esmeraldas',5,'rhoncus sed vestibulum sit amet cursus id turpis integer aliquet'),('46-781-5086','Photofeed','Pantaibesar',4,'lectus aliquam sit amet diam in magna bibendum imperdiet nullam'),('50-512-7635','Bluejam','Ranizow',10,'aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non'),('81-510-2753','Gigazoom','Gununganyar',7,'ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES (1,1,1,'2022-07-21 13:06:35'),(2,1,2,'2022-07-21 13:06:35'),(3,1,3,'2022-07-21 13:06:35'),(4,1,4,'2022-07-21 13:06:35'),(5,1,5,'2022-07-21 13:06:35'),(6,1,6,'2022-07-21 13:06:35'),(7,1,7,'2022-07-21 13:06:35'),(8,2,8,'2022-07-21 13:06:35'),(9,2,9,'2022-07-21 13:06:35'),(10,2,10,'2022-07-21 13:06:35'),(11,2,11,'2022-07-21 13:06:35'),(12,2,12,'2022-07-21 13:06:35'),(13,2,13,'2022-07-21 13:06:35'),(14,2,14,'2022-07-21 13:06:35'),(15,2,15,'2022-07-21 13:06:35');
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,1,'Gutkowski-Franecki'),(2,2,'Kub-Crist'),(3,3,'Douglas-Walsh'),(4,7,'Leffler-Dickens'),(5,4,'Leffler-Dickens'),(6,5,'Leffler-Dickens'),(7,6,'Shanahan Group'),(8,10,'Leffler-Dickens'),(9,12,'Leffler-Dickens'),(10,10,'Hoppe-Harber'),(11,2,'Leffler-Dickens'),(12,11,'Stanton-Fay'),(13,13,'Heaney-Wolf'),(14,8,'Leffler-Dickens'),(15,14,'Powlowski and Sons');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(2,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(3,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(4,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(5,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(6,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(7,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(8,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(9,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(10,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(11,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(12,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(13,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(14,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(15,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(16,'address','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(17,'address','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(18,'address','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(19,'address','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(20,'address','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(21,'address','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(22,'address','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(23,'address','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(24,'address','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(25,'address','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(26,'address','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(27,'address','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(28,'address','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(29,'address','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(30,'address','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(31,'page','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(32,'page','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(33,'page','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(34,'page','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(35,'page','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(36,'page','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(37,'page','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(38,'page','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(39,'page','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(40,'page','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(41,'page','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(42,'page','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(43,'page','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(44,'page','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(45,'page','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(46,'history','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(47,'history','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(48,'history','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(49,'history','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(50,'history','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(51,'history','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(52,'history','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(53,'history','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(54,'history','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(55,'history','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(56,'history','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(57,'history','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(58,'history','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(59,'history','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(60,'history','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(61,'account','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(62,'account','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(63,'account','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(64,'account','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(65,'account','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(66,'account','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(67,'account','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(68,'account','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(69,'account','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(70,'account','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(71,'account','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(72,'account','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(73,'account','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(74,'account','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(75,'account','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(76,'user','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(77,'user','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(78,'user','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(79,'user','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(80,'user','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(81,'user','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(82,'user','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(83,'user','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(84,'user','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(85,'user','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(86,'user','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(87,'user','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(88,'user','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(89,'user','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(90,'user','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(91,'data','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(92,'data','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(93,'data','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(94,'data','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(95,'data','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(96,'data','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(97,'data','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(98,'data','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(99,'data','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(100,'data','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(101,'data','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(102,'data','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(103,'data','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(104,'data','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(105,'data','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(106,'company','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(107,'company','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(108,'company','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(109,'company','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(110,'company','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(111,'company','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(112,'company','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(113,'company','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(114,'company','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(115,'company','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(116,'company','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(117,'company','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(118,'company','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(119,'company','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(120,'company','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(121,'company','Delete','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(122,'company','Delete','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(123,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(124,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(125,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(126,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(127,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(128,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(129,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29'),(130,'personal','Insert','2022-07-21 13:06:35','root@localhost','db_winehouse','8.0.29');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES ('Douglas-Walsh','2022-01-15 07:39:57','odio cras mi pede malesuada in imperdiet et commodo vulputate'),('Erdman','2022-05-04 07:59:01','eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor'),('Graham and Wuckert','2021-09-30 15:21:13','aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in'),('Gutkowski-Franecki','2022-04-02 13:11:30','eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit'),('Heaney-Wolf','2021-12-25 03:34:42','erat fermentum justo nec condimentum neque sapien placerat ante nulla justo'),('Hoppe-Harber','2022-06-09 02:14:28','malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem'),('Kub-Crist','2021-12-03 03:30:13','quis turpis sed ante vivamus tortor duis mattis egestas metus'),('Leffler-Dickens','2021-12-26 11:09:50','id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec'),('Lubowitz and Luettgen','2022-05-14 21:15:37','justo aliquam quis turpis eget elit sodales scelerisque mauris sit'),('Maggio and Pagac','2022-04-09 05:23:48','morbi a ipsum integer a nibh in quis justo maecenas rhoncus'),('Powlowski and Sons','2022-03-14 10:22:06','phasellus sit amet erat nulla tempus vivamus in felis eu'),('Shanahan Group','2022-04-03 19:56:46','sapien a libero nam dui proin leo odio porttitor id consequat in'),('Stanton-Fay','2022-01-18 21:59:57','nam nulla integer pede justo lacinia eget tincidunt eget tempus'),('Weber and Rohan','2022-03-07 13:20:18','pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum'),('Wiza and Powlowski','2022-03-30 23:10:31','id nisl venenatis lacinia aenean sit amet justo morbi ut odio');
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'Female','Jaimie','Dufton',30),(2,'Male','Jasun','Rossant',55),(3,'Female','Audrye','Guise',70),(4,'Female','Julietta','Frances',46),(5,'Female','Reiko','Forcer',21),(6,'Male','Kerwinn','Walkinshaw',17),(7,'Female','Doti','Moller',61),(8,'Female','Aveline','Thorndale',19),(9,'Female','Ema','Outlaw',23),(10,'Female','Amelita','Emanuel',41),(11,'Female','Agatha','Vel',86),(12,'Male','Charlton','Joderli',37),(13,'Female','Deidre','Inman',75),(14,'Male','Ernie','Goscar',46),(15,'Male','Der','Pinching',76),(16,'Male','Dominik','Blakemore',18),(17,'Female','Sofia','Pallaske',46),(18,'Female','Shena','Villaron',27),(19,'Female','Eugenia','Denyer',34),(20,'Female','Martynne','Incogna',50),(21,'Female','Anabelle','FitzGibbon',16),(22,'Male','Otto','Kingcote',14),(23,'Male','Decca','Vennings',25);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'abelison3@hc360.com',2,'199.52.19.14',2),(2,'mglowinski0@answers.com',15,'125.207.210.105',15),(3,'dmcinility6@rediff.com',1,'170.2.31.135',1),(4,'sbartkiewicze@shutterfly.com',4,'23.206.0.188',4),(5,'bbearward7@globo.com',6,'29.100.248.181',6),(6,'afattorec@hud.gov',7,'102.231.167.128',7),(7,'ganwyl4@wordpress.com',10,'182.104.207.141',10),(8,'tdelany5@arstechnica.com',12,'240.253.8.236',12),(9,'nblade8@creativecommons.org',5,'107.191.247.221',5),(10,'dcassells1@bloomberg.com',9,'198.1.168.51',9),(11,'speacocka@g.co',11,'144.128.37.184',11),(12,'fexonb@japanpost.jp',14,'128.31.85.175',14),(13,'scasol2@paypal.com',13,'92.178.65.217',13),(14,'hdoche9@diigo.com',3,'237.155.207.205',3),(15,'twetternd@1und1.de',8,'113.196.201.118',8);
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

-- Dump completed on 2022-07-30 14:25:48
