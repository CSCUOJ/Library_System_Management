CREATE DATABASE  IF NOT EXISTS `librarydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `librarydb`;
-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: librarydb
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `books` (
  `BookID` varchar(5) NOT NULL,
  `Title` varchar(225) DEFAULT NULL,
  `Author` varchar(225) DEFAULT NULL,
  `MCID` varchar(5) DEFAULT NULL,
  `SCID` varchar(5) DEFAULT NULL,
  `YearOfPublishing` varchar(4) DEFAULT NULL,
  `LastPrintedYear` varchar(4) DEFAULT NULL,
  `ISBNno` varchar(17) DEFAULT NULL,
  `NoOfPages` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`BookID`),
  KEY `MCID_idx` (`MCID`),
  KEY `SCID_idx` (`SCID`),
  CONSTRAINT `BMC` FOREIGN KEY (`MCID`) REFERENCES `main` (`mcid`),
  CONSTRAINT `BSC` FOREIGN KEY (`SCID`) REFERENCES `sub` (`scid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('B0001','test','test','MC004','SC005','2009','2012','123456789','256'),('B0002','test title','test author','MC001','SC001','2017','2017','null','111'),('B0003','Avatar','James Cameron','MC001','SC001','2009','2009','184575421','336'),('B0004','Titanic','James Cameron','MC001','SC001','1992','1992','98657584652','658'),('B0005','Harry Potter','J.K.Rowlin','MC001','SC001','1997','2018','98857855445','588');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main`
--

DROP TABLE IF EXISTS `main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `main` (
  `MCID` varchar(5) NOT NULL,
  `MCName` varchar(225) NOT NULL,
  PRIMARY KEY (`MCID`),
  UNIQUE KEY `ClassificationName_UNIQUE` (`MCName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main`
--

LOCK TABLES `main` WRITE;
/*!40000 ALTER TABLE `main` DISABLE KEYS */;
INSERT INTO `main` VALUES ('MC004','Comics'),('MC001','Engineering'),('MC003','Literature'),('MC002','Medicine');
/*!40000 ALTER TABLE `main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub`
--

DROP TABLE IF EXISTS `sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sub` (
  `SCID` varchar(5) NOT NULL,
  `SCName` varchar(225) NOT NULL,
  `MCID` varchar(5) NOT NULL,
  PRIMARY KEY (`SCID`),
  UNIQUE KEY `SCName_UNIQUE` (`SCName`),
  KEY `MCID_idx` (`MCID`),
  CONSTRAINT `MCSC` FOREIGN KEY (`MCID`) REFERENCES `main` (`mcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub`
--

LOCK TABLES `sub` WRITE;
/*!40000 ALTER TABLE `sub` DISABLE KEYS */;
INSERT INTO `sub` VALUES ('SC001','Software Engineering','MC001'),('SC002','Sidha','MC002'),('SC003','Tamil literature','MC003'),('SC004','Action comics','MC004'),('SC005','Horror Comics','MC004'),('SC006','English Literature','MC003');
/*!40000 ALTER TABLE `sub` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-11 16:28:09
