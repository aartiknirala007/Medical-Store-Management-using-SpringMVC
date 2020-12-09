-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: spring
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1

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
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS` (
  `username` varchar(51) NOT NULL,
  `password` varchar(51) NOT NULL,
  `enabled` int(11) DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES ('admin','pass',1),('aartik','nirala',1),('inventory','invpass',1),('inventory1','invpass',1),('reception','recpass',1),('reception1','recpass',1),('gurmeet','saini',1);
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS_ROLES`
--

DROP TABLE IF EXISTS `USERS_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS_ROLES` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(51) NOT NULL,
  `role` varchar(51) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `FK_USERS` (`user`),
  CONSTRAINT `FK_USERS` FOREIGN KEY (`user`) REFERENCES `USERS` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS_ROLES`
--

LOCK TABLES `USERS_ROLES` WRITE;
/*!40000 ALTER TABLE `USERS_ROLES` DISABLE KEYS */;
INSERT INTO `USERS_ROLES` VALUES (1,'admin','ROLE_ADMIN'),(2,'aartik','ROLE_ADMIN'),(3,'inventory','ROLE_INVENTORY'),(4,'inventory1','ROLE_INVENTORY'),(5,'reception','ROLE_RECEPTION'),(6,'reception1','ROLE_RECEPTION'),(7,'gurmeet','ROLE_USER');
/*!40000 ALTER TABLE `USERS_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancellation`
--

DROP TABLE IF EXISTS `cancellation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancellation` (
  `order_id` int(11) NOT NULL,
  `reception` varchar(51) NOT NULL,
  `cancel_date` date DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `for1` (`reception`),
  CONSTRAINT `cancellation_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `cancellation_ibfk_2` FOREIGN KEY (`reception`) REFERENCES `employee` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancellation`
--

LOCK TABLES `cancellation` WRITE;
/*!40000 ALTER TABLE `cancellation` DISABLE KEYS */;
INSERT INTO `cancellation` VALUES (3,'reception','2019-10-09'),(5,'reception','2019-10-09'),(7,'reception','2019-10-09'),(8,'reception1','2019-10-05'),(10,'reception1','2019-10-05');
/*!40000 ALTER TABLE `cancellation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `reception` varchar(51) NOT NULL,
  `customer` varchar(51) DEFAULT NULL,
  `medicine_name` varchar(51) DEFAULT NULL,
  `batch_number` varchar(51) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `available` varchar(10) DEFAULT 'yes',
  PRIMARY KEY (`reception`,`batch_number`),
  KEY `customer` (`customer`),
  KEY `medicine_name` (`medicine_name`),
  KEY `batch_number` (`batch_number`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`reception`) REFERENCES `employee` (`username`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`customer`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`medicine_name`) REFERENCES `medicine` (`name`),
  CONSTRAINT `cart_ibfk_4` FOREIGN KEY (`batch_number`) REFERENCES `stock` (`batch_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` varchar(51) NOT NULL,
  `name` varchar(51) NOT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(51) DEFAULT NULL,
  `phone` mediumtext,
  `detail` varchar(51) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('utkarsh123','Utkarsh','1999-12-22','aaa','9533839229','dd'),('akash123','Akash Patel','1999-02-21','roorkee','8596732742','hqijfe'),('meena123','ashok meena','1999-07-08','hghgh','7894524330',''),('pandey123','rahul pandey','2222-02-22','ghi','34',''),('vivek123','vivek kumar','2222-02-22','','22','');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `name` varchar(51) NOT NULL,
  `address` varchar(51) DEFAULT NULL,
  `salary` mediumtext NOT NULL,
  `joining_date` date DEFAULT NULL,
  `username` varchar(51) NOT NULL,
  `mail` varchar(51) DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`username`) REFERENCES `USERS` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('ajay','rververv','11111','2000-09-02','inventory','jn@jn'),('akash patel','room number 158 vishwesarriya','15000','2000-09-04','inventory1',NULL),('Ram','roorkee','15000','2018-10-09','reception',NULL),('Ayush','haridwar','45000','2018-07-26','reception1',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicine` (
  `name` varchar(51) NOT NULL,
  `company` varchar(51) DEFAULT NULL,
  `detail` varchar(51) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES ('burnol','abott','lotion'),('Citrizine','Cipla','cold'),('metrogyl','abott',''),('Paracetamol','Cipla','fever'),('torex','cipla','cough');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `order_id` int(11) NOT NULL,
  `batch_number` varchar(51) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`batch_number`),
  KEY `batch_number` (`batch_number`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`batch_number`) REFERENCES `stock` (`batch_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (9,'ABC1231',10),(9,'ABC12311',2),(1,'ABC1234',12),(6,'CIt123',12),(2,'CIt123',12),(4,'ABC12311',2),(11,'ABC1234',5),(12,'ABC1234',5),(12,'CIt123',3),(13,'ABC1234',20),(14,'ABC12311',5),(14,'ABC1234',10),(14,'CIt123',10),(15,'ABC12311',1),(16,'ABC1234',20),(16,'CIt123',10),(16,'qwerty',20),(17,'ABC1231',10),(17,'CIt123',241),(18,'ABC1231',11),(19,'ABC12311',22),(20,'ABC1234',12),(20,'CIt123',2),(21,'ABC1234',5),(21,'qwerty',10),(22,'xsxwe',14),(23,'ABC1234',5),(23,'CIt123',7),(24,'CIt123',3),(24,'citi',12),(25,'aaaa',5),(25,'citi',3),(26,'ABC1231',9),(27,'ABC1231',10),(28,'citi',5);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(51) NOT NULL,
  `reception` varchar(51) NOT NULL,
  `amount` float DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `cancelled` varchar(51) DEFAULT 'no',
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `reception` (`reception`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`reception`) REFERENCES `employee` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'akash123','reception1',1000,'2019-10-02','no'),(2,'akash123','reception1',40,'2019-10-02','no'),(3,'akash123','reception1',56,'2019-10-02','yes'),(4,'akash123','reception1',32,'2019-10-02','no'),(5,'akash123','reception1',250,'2018-10-02','yes'),(6,'akash123','reception1',250,'2019-10-02','no'),(7,'akash123','reception1',250,'2019-10-02','yes'),(8,'akash123','reception1',96,'2019-10-02','yes'),(9,'akash123','reception1',600,'2019-10-02','no'),(10,'akash123','reception1',156,'2019-10-02','yes'),(11,'akash123','reception1',40,'2019-10-02','no'),(12,'akash123','reception1',55,'2019-10-02','no'),(13,'akash123','reception1',160,'2019-10-02','no'),(14,'akash123','reception1',380,'2019-10-03','no'),(15,'akash123','reception1',50,'2019-10-05','no'),(16,'meena123','reception1',1770,'2019-10-08','no'),(17,'akash123','reception1',1705,'2019-10-09','no'),(18,'meena123','reception1',178,'2019-10-09','no'),(19,'meena123','reception1',860,'2019-10-09','no'),(20,'akash123','reception1',860,'2019-10-09','no'),(21,'akash123','reception1',820,'2019-10-09','no'),(22,'meena123','reception1',154,'2019-10-09','no'),(23,'akash123','reception1',75,'2019-10-09','no'),(24,'akash123','reception1',111,'2019-10-09','no'),(25,'meena123','reception',49,'2019-10-09','no'),(26,'akash123','reception',450,'2019-10-09','no'),(27,'akash123','reception',500,'2019-10-09','no'),(28,'utkarsh123','reception',40,'2019-10-09','no');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller` (
  `name` varchar(51) NOT NULL,
  `regno` varchar(51) NOT NULL,
  `location` varchar(51) DEFAULT NULL,
  `phone` mediumtext,
  PRIMARY KEY (`regno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES ('anshul sharma','sharma123','dbeb','333'),('patel','patel123','Varaanasi','9854968574'),('gaurav','gaurav123','varanasi','7845969974'),('aartik','aartik123','varanasi','98765'),('ashu','ashu123','varanasi','9432960683'),('Ramesh','seller1','Varanasi','7894561234'),('Mukesh','seller2','varanasi','8596748585');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `batch_number` varchar(51) NOT NULL,
  `expiry` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `name` varchar(51) NOT NULL,
  `seller_reg` varchar(51) NOT NULL,
  `manager` varchar(51) NOT NULL,
  `cost` float NOT NULL,
  PRIMARY KEY (`batch_number`),
  KEY `name` (`name`),
  KEY `manager` (`manager`),
  KEY `seller` (`seller_reg`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`name`) REFERENCES `medicine` (`name`),
  CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`manager`) REFERENCES `USERS` (`username`),
  CONSTRAINT `stock_ibfk_3` FOREIGN KEY (`seller_reg`) REFERENCES `seller` (`regno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES ('aaaa','1111-11-11',0,5,'Citrizine','sharma123','inventory',55),('ABC1231','2020-02-21',3,50,'paracetamol','patel123','inventory',0),('ABC12311','2020-02-21',42,50,'paracetamol','patel123','inventory',0),('ABC1234','2020-08-09',0,8,'Citrizine','seller2','inventory',10),('CIt123','2020-09-09',0,5,'Citrizine','seller1','inventory',0),('citi','2022-02-22',0,8,'Citrizine','ashu123','inventory',20),('nwkj','2199-10-22',8002114,8,'Citrizine','patel123','inventory',88),('qead','2034-02-02',7,13,'Citrizine','patel123','inventory',15),('qwerty','1999-10-26',0,78,'Citrizine','seller1','inventory',76),('sksajda','1111-11-11',0,7,'metrogyl','aartik123','inventory',9),('xsxwe','1111-11-11',0,11,'metrogyl','patel123','inventory',11);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-09 14:59:12
