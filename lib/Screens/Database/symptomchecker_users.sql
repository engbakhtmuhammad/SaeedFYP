-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: localhost    Database: symptomchecker
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `bio` varchar(150) DEFAULT NULL,
  `usertype` varchar(10) DEFAULT NULL,
  `language` varchar(150) DEFAULT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'root','Bakht','Khilji','bakhtkhilji@gmail.com','this is bio of user root','user','English, urdu, pashto','Acngj-rjhjg-skfj34-54nsdf'),(2,'iftikhar','Iftikhar','jan','jan@gmail.com','this is the ifto bios','user','Arabic, persian, turkish','$pcks$64,10000,64$530f8afbc74536b9a963b4f1c4cb738bcea7403d4d606b6e074ec5d3baf39d18$7acc26f1f1be650c1be637392e0d26b96bb9adf1113327e7a07472dc2df4efec2a2052c1f1e52e136725b659e92b945752d4c75e4543d004e20663749b96fe59'),(3,'ali','Ali','jan','ali@gmail.com','ali bio updated','user','english, french','$pcks$64,10000,64$530f8afbc74536b9a963b4f1c4cb738bcea7403d4d606b6e074ec5d3baf39d18$7acc26f1f1be650c1be637392e0d26b96bb9adf1113327e7a07472dc2df4efec2a2052c1f1e52e136725b659e92b945752d4c75e4543d004e20663749b96fe59'),(4,'hussian','husssian','khan','hussain@gmail.com','this is the bio','user','English','$pcks$64,10000,64$530f8afbc74536b9a963b4f1c4cb738bcea7403d4d606b6e074ec5d3baf39d18$7acc26f1f1be650c1be637392e0d26b96bb9adf1113327e7a07472dc2df4efec2a2052c1f1e52e136725b659e92b945752d4c75e4543d004e20663749b96fe59'),(5,'admin','Admin','khan','admin@gmail.com','this account is for admin','admin','admin','$pcks$64,10000,64$530f8afbc74536b9a963b4f1c4cb738bcea7403d4d606b6e074ec5d3baf39d18$56158864e365bd78f6afda27f9a239bcb3f2b7a4773d4c0d0858c86266119d1e35aae9ca1a4777ed3d85c42caeed0c57cc7e09fe7d152d5d4d4ee08506c2b41a'),(6,'drmumraiz','Dr','Mumraiz','mumraiz@gmail.com','this is mumraiz\'s bio','doctor','Eglish','$pcks$64,10000,64$530f8afbc74536b9a963b4f1c4cb738bcea7403d4d606b6e074ec5d3baf39d18$7acc26f1f1be650c1be637392e0d26b96bb9adf1113327e7a07472dc2df4efec2a2052c1f1e52e136725b659e92b945752d4c75e4543d004e20663749b96fe59'),(7,'bakhtiar','Dr ','Bakhtiar','bakhtiar@gmail.com','this is Dean\'s bio','doctor','English, Urdu, Pashto','$pcks$64,10000,64$530f8afbc74536b9a963b4f1c4cb738bcea7403d4d606b6e074ec5d3baf39d18$7acc26f1f1be650c1be637392e0d26b96bb9adf1113327e7a07472dc2df4efec2a2052c1f1e52e136725b659e92b945752d4c75e4543d004e20663749b96fe59'),(8,'hashim','Dr','Hashim','hashim@gmail.com','this is hashim\'s bio','doctor','Englsh','$pcks$64,10000,64$530f8afbc74536b9a963b4f1c4cb738bcea7403d4d606b6e074ec5d3baf39d18$7acc26f1f1be650c1be637392e0d26b96bb9adf1113327e7a07472dc2df4efec2a2052c1f1e52e136725b659e92b945752d4c75e4543d004e20663749b96fe59');
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

-- Dump completed on 2021-12-13 12:21:23
