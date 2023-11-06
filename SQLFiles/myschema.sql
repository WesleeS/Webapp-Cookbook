-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: CookBookWebapp
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Cookbook`
--

DROP TABLE IF EXISTS `Cookbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cookbook` (
  `CookBookID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Edition` varchar(10) DEFAULT NULL,
  `Genre` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`CookBookID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cookbook`
--

LOCK TABLES `Cookbook` WRITE;
/*!40000 ALTER TABLE `Cookbook` DISABLE KEYS */;
INSERT INTO `Cookbook` VALUES (1,'Betty Crocker\'s Best of Baking','1998','Baking');
/*!40000 ALTER TABLE `Cookbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ingredient`
--

DROP TABLE IF EXISTS `Ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ingredient` (
  `IngredientID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `VeID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`IngredientID`),
  KEY `VeID` (`VeID`),
  CONSTRAINT `Ingredient_ibfk_1` FOREIGN KEY (`VeID`) REFERENCES `VeganDetail` (`VeID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredient`
--

LOCK TABLES `Ingredient` WRITE;
/*!40000 ALTER TABLE `Ingredient` DISABLE KEYS */;
INSERT INTO `Ingredient` VALUES (1,'butter',NULL),(2,'chocolate',NULL),(3,'graham cracker',NULL),(4,'flaked coconut',1),(5,'nuts',2),(6,'granulated sugar',3),(7,'vanilla',4),(8,'powdered sugar',3),(9,'margarine',3),(10,'milk',NULL),(11,'almond milk',5);
/*!40000 ALTER TABLE `Ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IngredientSubstitution`
--

DROP TABLE IF EXISTS `IngredientSubstitution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IngredientSubstitution` (
  `FirstSub` int unsigned NOT NULL,
  `SecondSub` int unsigned NOT NULL,
  KEY `FirstSub` (`FirstSub`),
  KEY `SecondSub` (`SecondSub`),
  CONSTRAINT `IngredientSubstitution_ibfk_1` FOREIGN KEY (`FirstSub`) REFERENCES `Ingredient` (`IngredientID`) ON DELETE CASCADE,
  CONSTRAINT `IngredientSubstitution_ibfk_2` FOREIGN KEY (`SecondSub`) REFERENCES `Ingredient` (`IngredientID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IngredientSubstitution`
--

LOCK TABLES `IngredientSubstitution` WRITE;
/*!40000 ALTER TABLE `IngredientSubstitution` DISABLE KEYS */;
INSERT INTO `IngredientSubstitution` VALUES (1,9),(10,11);
/*!40000 ALTER TABLE `IngredientSubstitution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recipe`
--

DROP TABLE IF EXISTS `Recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recipe` (
  `RecipeID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Page` varchar(30) DEFAULT NULL,
  `CookbookID` int unsigned NOT NULL,
  PRIMARY KEY (`RecipeID`),
  UNIQUE KEY `Page` (`Page`),
  KEY `CookbookID` (`CookbookID`),
  CONSTRAINT `Recipe_ibfk_1` FOREIGN KEY (`CookbookID`) REFERENCES `Cookbook` (`CookBookID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recipe`
--

LOCK TABLES `Recipe` WRITE;
/*!40000 ALTER TABLE `Recipe` DISABLE KEYS */;
INSERT INTO `Recipe` VALUES (1,'Fudge Melt-Away Squares','./PLACEHOLDER.html/',1);
/*!40000 ALTER TABLE `Recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecipeIngredientLink`
--

DROP TABLE IF EXISTS `RecipeIngredientLink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RecipeIngredientLink` (
  `RecipeID` int unsigned NOT NULL,
  `IngredientID` int unsigned NOT NULL,
  KEY `RecipeID` (`RecipeID`),
  KEY `IngredientID` (`IngredientID`),
  CONSTRAINT `RecipeIngredientLink_ibfk_1` FOREIGN KEY (`RecipeID`) REFERENCES `Recipe` (`RecipeID`) ON DELETE CASCADE,
  CONSTRAINT `RecipeIngredientLink_ibfk_2` FOREIGN KEY (`IngredientID`) REFERENCES `Ingredient` (`IngredientID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecipeIngredientLink`
--

LOCK TABLES `RecipeIngredientLink` WRITE;
/*!40000 ALTER TABLE `RecipeIngredientLink` DISABLE KEYS */;
INSERT INTO `RecipeIngredientLink` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10);
/*!40000 ALTER TABLE `RecipeIngredientLink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VeganDetail`
--

DROP TABLE IF EXISTS `VeganDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VeganDetail` (
  `VeID` int unsigned NOT NULL AUTO_INCREMENT,
  `FoodType` varchar(30) NOT NULL,
  `IsImitation` tinyint(1) NOT NULL,
  `GlutenFree` tinyint(1) NOT NULL,
  PRIMARY KEY (`VeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VeganDetail`
--

LOCK TABLES `VeganDetail` WRITE;
/*!40000 ALTER TABLE `VeganDetail` DISABLE KEYS */;
INSERT INTO `VeganDetail` VALUES (1,'fruit',0,1),(2,'nut',0,1),(3,'other',0,1),(4,'spice',0,1),(5,'nut',1,1);
/*!40000 ALTER TABLE `VeganDetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-23  3:02:29
