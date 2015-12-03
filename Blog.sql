-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Blog
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1-log

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
-- Table structure for table `Blog_post`
--

DROP TABLE IF EXISTS `Blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `category` varchar(100) NOT NULL,
  `heroimage` varchar(100) NOT NULL,
  `optionalimage` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `published_date` datetime DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Blog_post_author_id_716a9b1b796a9765_fk_auth_user_id` (`author_id`),
  CONSTRAINT `Blog_post_author_id_716a9b1b796a9765_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Blog_post`
--

LOCK TABLES `Blog_post` WRITE;
/*!40000 ALTER TABLE `Blog_post` DISABLE KEYS */;
INSERT INTO `Blog_post` VALUES (1,'Laurent Koscielny set to face Sunderland but Arsenal wait on Alexis Sanchez and Santi Cazorla','Football','heroimg/football_hero.jpg','optionalimg/football_opt.jpg','Arsenal are hopeful Laurent Koscielny will be in contention for Saturday\'s Premier League home game against Sunderland.\r\n\r\nThe Framce defender had to be replaced by Gabriel after only 11 minutes of Sunday\'s 1-1 draw at Norwich after suffering a hip problem.\r\n\r\nHowever, the injury is not serious and the Gunners hope Koscielny will be back in training by the end of the week ahead of the Black Cats\' visit to the Emirates.\r\n\r\nAlexis Sanchez and Santi Cazorla suffered hamstring and knee injuries respectively at Carrow Road but Arsenal\'s medical staff are still assessing the midfield duo.\r\n\r\nLeft-back Kieran Gibbs has missed Arsenal\'s last two matches with a slight calf problem, but he is expected to return to full training this week and is likely to feature in the squad to face Sunderland.\r\n\r\nForward Theo Walcott looks set to remain on the sidelines this weekend - he has not played since suffering a calf injury in the 3-0 Capital One Cup defeat at Sheffield Wednesday on October 27 - but is poised to return to training and should be available for selection ahead of the Christmas period. ','2015-11-10 13:23:19',1),(2,'New Zealand keep faith in Guptill, Craig','Cricket','heroimg/cric_hero.jpg','optionalimg/cric_opt.jpg','New Zealand retained the out-of-form duo of Martin Guptill and Mark Craig as they pruned their Test squad from 16 to 12 for the two-match home series against Sri Lanka that begins on December 10. Opening the batting on their just-concluded tour of Australia, Guptill made a highest score of 23 in his six Test innings, while the offspinner Craig picked up eight wickets at an average of 64.12 while conceding more than five runs an over.\r\n\r\nOut of the squad that toured Australia, New Zealand left out fast bowlers Matt Henry and Mitchell McClenaghan, back-up wicketkeeper Luke Ronchi and back-up opener Hamish Rutherford. Allrounders Corey Anderson and James Neesham, who are both nursing back injuries, were not available for selection.\r\n\r\n\"Mark and Martin didn\'t perform to the level they would have liked over in Australia, but both have shown in the past what they\'re capable of and we\'re confident they\'ll make valuable contributions in the upcoming series,\" New Zealand coach Mike Hesson said.\r\n\r\nLeft-arm seamer Neil Wagner and allrounder Mitchell Santner, who made his debut during the day-night Test in Adelaide, also kept their places in the squad. Wagner didn\'t play any of the Tests in Australia, but picked-up a five-wicket haul in a tour game against a Western Australia XI.\r\n\r\n\"The level of composure Mitchell showed on debut was very impressive and he certainly displayed how exciting a player he is with both the bat and ball,\" Hesson said. \"His ability to bat in the top six and bowl good overs gives us options and assists the team balance. We\'re looking forward to watching Mitchell\'s continued development. Neil impressed in Australia and not only showed that he\'ll run in hard all day, but was swinging the ball again.\"\r\n\r\nWagner has also been included in the New Zealand Board President\'s XI, which will take on the Sri Lankans in a three-day warm-up match that begins on December 3.','2015-11-18 12:00:00',2),(3,'Formula 1 end-of-season gossip: Rosberg, Hamilton, McLaren','Racing','heroimg/form_hero.jpg','optionalimg/form_opt.jpg','Mercedes insists it must get to the bottom of Lewis Hamilton\'s recent struggles, with the team having no answer yet as to why he has been no match for Nico Rosberg. (Motorsport.com)\r\n\r\nFormula 1 champion Lewis Hamilton says that the relationship with his Mercedes team mate Nico Rosberg will always be tense. (Reuters)\r\n\r\nSir Jackie Stewart has expressed his hope that Nico Rosberg can up his game and beat his Mercedes team-mate, Lewis Hamilton, to the 2016 World Championship. (Fox Sports)\r\n\r\nMcLaren\'s Fernando Alonso and Ron Dennis have steered away from speculation the Spaniard might be taking a sabbatical in 2016. (GrandPrix.com)\r\n\r\nLotus owner Gerard Lopez says he has a Plan B if Renault fail to take over the cash-strapped Formula 1 team but is not expecting to use it .(Supersport.com)\r\n\r\nFelipe Nasr took to Twitter to acknowledge his Sauber team, writing: \"Thanks to everyone @SauberF1Team for this amazing first season! A year of learning, hard work and partnership!\"','2015-11-25 11:08:00',3),(4,'Saina Nehwal loses in China Open final','Badminton','heroimg/bad_hero.jpg','optionalimg/bad_opt.jpg','Indian ace shuttler Saina Nehwal\'s dream of defending her women\'s singles title came crashing as she suffered a straight-game defeat to Olympic champion Li Xuerui in the final of the USD 700,000 China Open Super Series Premier on Sunday.\r\nThe Olympic bronze medallist Saina, committed a litany of unforced errors to go down 12-21 15-21 against World No. 7 Li in the women\'s singles summit clash which lasted for 39 minutes at the Haixia Olympic Sports Center here. Up against an opponent against whom she has lost nine times in the past, Saina failed to create the pressure which could have wilted Li, who showed better understanding of the Indian\'s game to outdo her for the 10th time.\r\n\r\nIn their 12th meeting, Saina initially used her knowledge of the conditions to her advantage to zoom to a 4-1 lead early on but she committed too many unforced errors after that for Li to move ahead. Saina, who last played Li in Malaysian open, struggled with a few strokes going wide and also left gaps on her left which the Chinese exploited to wrest a 7-4 lead.\r\nSaina won a parallel game and a point when Li missed the line after a long rally but the Chinese used her net drops and rode on Saina\'s unforced errors to lead 11-6 at the break. Li, who has won the last five matches against Saina, continued her march after the interval even as the Indian kept breathing down her neck with some occasional points.\r\n\r\n\r\nLi made some immaculate saves while Saina started crumbling under pressure which allowed he Chinese to lead 19-10. Saina then again hit wide to gave Li a 10-point advantage at 20-10. Saina saved a couple before mistiming a return to give the first game to Li. In the second game, Saina surged ahead to a 4-0 lead once again. Playing their fifth final of the year, Li and Saina engaged in engrossing rallies and even though Li came up with some spectacular shots, she also committed some mistakes to allow Saina lead 11-6 at the interval.','2015-12-01 13:33:14',4),(5,'Rob Davies claims second European gold in para table tennis','TT','heroimg/tt_hero.jpg','optionalimg/tt_opt.jpg','Rob Davies has added a team gold to his individual victory at the Para Table Tennis European Championship.\r\n\r\nThe 31-year-old and fellow Welshman Tom Matthews took the title without playing after their German opponents withdrew with injury from the Class 1 final.\r\n\r\nCompatriot Paul Karabardak won silver with David Wetherill in the Class 6 final in Denmark.\r\n\r\n\"I\'m so happy to retain both titles. This team one with Tom is a brilliant experience for him,\" said Davies.\r\n\r\n\"I know we didn\'t get to play the last match against Germany because they are injured, but you can only play who is in front of you.\"\r\n\r\nDavies secured a named place at the 2016 Rio Paralympics by winning the individual title, although his selection for Rio still needs to be ratified by the British Paralympic Association.\r\n\r\n\"I\'m very happy with the way I\'m playing,\" added the former rugby player.\r\n\r\n\"I feel more at ease with myself and a bit more confident at the moment and going into next year that can only be good.\r\n\r\n\"I\'ve just got to take it to the other continents now and try and beat the Koreans and whoever else comes our way as well as the Europeans.\"\r\n\r\nSilver medals for Will Bayley and Billy Shilton (men\'s Class 7) and bronze for Aaron McKibbin and Ross Wilson (men\'s Class 8) took Great Britain\'s medal total to 11 at the championships.','2015-11-28 06:00:00',5);
/*!40000 ALTER TABLE `Blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add post',7,'add_post'),(20,'Can change post',7,'change_post'),(21,'Can delete post',7,'delete_post');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$0Gvb8deaEj0s$Se2QOLmBsqKBz2C5REgTNXV3Hp8c0JYdpvb7gYm/V30=','2015-12-01 12:50:05',1,'sreekanth','','','seeku.sreekanth@gmail.com',1,1,'2015-12-01 10:01:58'),(2,'pbkdf2_sha256$20000$Sf0xUo09FozL$rsfglXXUPa8golUfnr7GZqQFyyibHEAXqzfvpVj9wJc=',NULL,0,'somnath','','','',0,1,'2015-12-01 13:01:49'),(3,'pbkdf2_sha256$20000$Kuc8h2cZBPDB$ymAX7EXkhTjybGNC6HPm7oPbAhdNXr/LK1Nutg+K8PY=',NULL,0,'Ranganath','','','',0,1,'2015-12-01 13:02:15'),(4,'pbkdf2_sha256$20000$U8bKqh9OUJwQ$32tr1pYiYzZpLsExDFz0UY0JEqnR+vkdtUh/lyFpP64=',NULL,0,'chetan','','','',0,1,'2015-12-01 13:02:29'),(5,'pbkdf2_sha256$20000$sxeFvmh26oj4$CiSWFwzOThIC6+qxPl2MWFgw7y++edyFv27ioTS0uDY=',NULL,0,'Bharath','','','',0,1,'2015-12-01 13:02:46');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-12-01 13:01:49','2','somnath',1,'',4,1),(2,'2015-12-01 13:02:15','3','Ranganath',1,'',4,1),(3,'2015-12-01 13:02:29','4','chetan',1,'',4,1),(4,'2015-12-01 13:02:46','5','Bharath',1,'',4,1),(5,'2015-12-01 13:23:27','1','Laurent Koscielny set to face Sunderland but Arsenal wait on Alexis Sanchez and Santi Cazorla',1,'',7,1),(6,'2015-12-01 13:26:00','2','New Zealand keep faith in Guptill, Craig',1,'',7,1),(7,'2015-12-01 13:28:46','3','Formula 1 end-of-season gossip: Rosberg, Hamilton, McLaren',1,'',7,1),(8,'2015-12-01 13:33:17','4','Saina Nehwal loses in China Open final',1,'',7,1),(9,'2015-12-01 13:35:45','5','Rob Davies claims second European gold in para table tennis',1,'',7,1),(10,'2015-12-01 13:35:51','5','Rob Davies claims second European gold in para table tennis',2,'No fields changed.',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'Blog','post'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-12-01 09:59:51'),(2,'auth','0001_initial','2015-12-01 09:59:54'),(3,'admin','0001_initial','2015-12-01 09:59:55'),(4,'contenttypes','0002_remove_content_type_name','2015-12-01 09:59:55'),(5,'auth','0002_alter_permission_name_max_length','2015-12-01 09:59:56'),(6,'auth','0003_alter_user_email_max_length','2015-12-01 09:59:56'),(7,'auth','0004_alter_user_username_opts','2015-12-01 09:59:56'),(8,'auth','0005_alter_user_last_login_null','2015-12-01 09:59:57'),(9,'auth','0006_require_contenttypes_0002','2015-12-01 09:59:57'),(10,'sessions','0001_initial','2015-12-01 09:59:58'),(11,'Blog','0001_initial','2015-12-01 12:47:46');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('nwh7kfmh5xidqbd5f89b3jr8xwrj7pt8','MjFjODM5MWFiMjlmY2QxYjIxOWQyNDM1YjBiNjM4YzU3NjdkYTE1NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImY5ZTJiNzJlZjA3ZjUyZTUxNzRhNWI0NTkzZGY4Zjg5NzQyMzI1ZDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-12-15 12:50:06');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-03 11:38:36
