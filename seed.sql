# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.01 (MySQL 5.7.36)
# Database: verse
# Generation Time: 2022-02-01 09:27:03 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table announcements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `announcements`;

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gzbdikojldnkfnzjywwmdtgaonanicbnjrys` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_ypovringnuwpnkhtafwwhhdmgycfxrwajjyg` (`dateRead`),
  KEY `fk_iuhvskyrubqkyvwxufnlhgvxptlgcxwuugnk` (`pluginId`),
  CONSTRAINT `fk_iuhvskyrubqkyvwxufnlhgvxptlgcxwuugnk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vmefqpvdafmypdbbqrtbotkuajhsyxhvapic` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table assetindexdata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assetindexdata`;

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uwsenycrkyxbiscqiseoiohtqzrmipcyskrm` (`sessionId`,`volumeId`),
  KEY `idx_yzmixhmabjqmhoijyndojtgnxodttrfsgwnn` (`volumeId`),
  CONSTRAINT `fk_pibaurghllnbeljdqtrwqjekirfodezkxloj` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table assets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assets`;

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fsamktjjcnikfochpfcinkwddjolviwthvez` (`filename`,`folderId`),
  KEY `idx_iyhwprujrohdalayjgyeaxswakrydzmbipyp` (`folderId`),
  KEY `idx_nptyzwxfjtzrtljkgkfeajmblazdvqnuofre` (`volumeId`),
  KEY `fk_mizckznpggvhsmlhdfhykcwcrbfcsficojqf` (`uploaderId`),
  CONSTRAINT `fk_kvpugqxfioxwakssmwqgagfcwzrslnjdbtsp` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mizckznpggvhsmlhdfhykcwcrbfcsficojqf` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mxnyujhbekpwgxxycrlmkbklspjwmbgzbvsb` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_voegioetzkremrwylytgkzwlhwkdpvhyzvhg` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(7,1,2,1,'copy-with-image.png','image',580,418,360272,NULL,0,0,'2022-01-29 20:52:41','2022-01-29 20:52:41','2022-01-29 20:52:41','36403d27-6031-44ce-aee7-409f2d94c7f8'),
	(42,1,1,1,'card-1.png','image',373,240,174966,NULL,NULL,NULL,'2022-01-29 20:58:32','2022-01-29 20:58:33','2022-01-29 20:58:33','88010df4-3fb9-454a-b7bd-19c11686e083'),
	(45,1,1,1,'card-2.png','image',373,240,148092,NULL,NULL,NULL,'2022-01-29 20:58:55','2022-01-29 20:58:55','2022-01-29 20:58:55','428092b2-dd83-4525-bf55-8608f565fb37'),
	(48,1,1,1,'card-3.png','image',373,240,134876,NULL,NULL,NULL,'2022-01-29 20:59:00','2022-01-29 20:59:00','2022-01-29 20:59:00','a1961925-f207-4355-9210-6d023906ff02'),
	(73,1,7,1,'copy-with-image.png','image',580,418,360272,NULL,NULL,NULL,'2022-01-29 21:00:46','2022-01-29 21:00:46','2022-01-29 21:00:46','6eadf105-37bc-44f8-a5f3-9fd9609fa416'),
	(283,1,2,1,'hero-image-opt.jpeg','image',1920,1280,449958,NULL,NULL,NULL,'2022-01-30 22:27:16','2022-01-30 22:27:16','2022-01-30 22:27:16','36dd3399-080b-4e89-86a8-b64268de80d0'),
	(284,1,2,1,'verse-hero-3.jpeg','image',1920,1280,255600,NULL,NULL,NULL,'2022-01-30 22:33:21','2022-01-30 22:33:21','2022-01-30 22:33:21','5140103f-8be2-466f-b75e-8e1586b56bf8'),
	(285,1,2,1,'verse-hero-2.jpeg','image',1920,1280,297920,NULL,NULL,NULL,'2022-01-30 22:33:21','2022-01-30 22:33:21','2022-01-30 22:33:21','451e8e21-f096-42a2-8e5a-f1899f323a0d');

/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table assettransformindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assettransformindex`;

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dxtlnwyrkfkcujsgqodpebwjqezdglafodfn` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table assettransforms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assettransforms`;

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ssnzqiaugpjuogrxpozgtrcrcazwlkcivjaz` (`name`),
  KEY `idx_fkedbhghjeunxzqptmieviyhmgprznkxptuh` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bgblcpsutpqwetvoznpmtscjpaekzmpzyakz` (`groupId`),
  KEY `fk_apjspihknemvncwdqhiilhqlewazowffafet` (`parentId`),
  CONSTRAINT `fk_apjspihknemvncwdqhiilhqlewazowffafet` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_klxhomlpmfvqnogpprpvccifqarbomzqfxcg` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qmfhoharwcfwdpijdnvdjrxizxwygihairpq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table categorygroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorygroups`;

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wfjzmupcvvptsjvgyjvkzxyffiimzixjjmqu` (`name`),
  KEY `idx_zuvnhtmqpixtwqcseegpmctmhyplxfrmwfgp` (`handle`),
  KEY `idx_hztcbfqlaaiypiypgtvqmwbiijjstmkocllu` (`structureId`),
  KEY `idx_avmdomzeamgncqtvarjeuigaymtwxqglikge` (`fieldLayoutId`),
  KEY `idx_bntleqbptwfespyoeraxrqgkxyijiilsxost` (`dateDeleted`),
  CONSTRAINT `fk_jzyluhwyasjkgyimorszhdesbntvhrkwhrkf` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qszjycacnctendxoddjfzeaubwtixxbzekvy` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table categorygroups_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorygroups_sites`;

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gkchlsyaeefmboxautddmkxkooofebudufmi` (`groupId`,`siteId`),
  KEY `idx_pmfygitscapugigllszsdnhquwuyvdhlrurv` (`siteId`),
  CONSTRAINT `fk_afruoqagzivqbioukydokjqxyowtztpnkiyt` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_slxdweznruaipeengobvtgpyqxnmjrqwumzi` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table changedattributes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `changedattributes`;

CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_ezgnltldqyvlmbjugbebdojrhvyfgjbihgfp` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_malludvucnyhwcyodofbtzblgjhbrbhpkkkq` (`siteId`),
  KEY `fk_zpvxiueudmdhiipqoderbjxzdgqehivzjcnr` (`userId`),
  CONSTRAINT `fk_ghogwzpcudpawvlizsaatetxkwluaifdeoiq` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_malludvucnyhwcyodofbtzblgjhbrbhpkkkq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zpvxiueudmdhiipqoderbjxzdgqehivzjcnr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`)
VALUES
	(1,1,'firstName','2022-01-31 22:02:31',0,1),
	(1,1,'lastName','2022-01-31 22:02:31',0,1),
	(1,1,'lastPasswordChangeDate','2022-01-31 22:02:31',0,1),
	(1,1,'password','2022-01-31 22:02:31',0,1),
	(41,1,'slug','2022-01-29 20:58:20',0,1),
	(41,1,'title','2022-01-29 20:58:20',0,1),
	(44,1,'slug','2022-01-29 20:58:43',0,1),
	(44,1,'title','2022-01-29 20:58:43',0,1),
	(47,1,'slug','2022-01-29 20:59:06',0,1),
	(47,1,'title','2022-01-29 20:59:06',0,1);

/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table changedfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `changedfields`;

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_oxpdbhiasalmlvbnrhirwscnivkkojczyyyr` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_gxnksuzpwenfmpgzusmgcivlzcvnydvfwbvk` (`siteId`),
  KEY `fk_sdaelwhyzqpcbydmgtidcrplibzobrccyhnf` (`fieldId`),
  KEY `fk_cjigqfznnejtmphzhjhxyvtjvxdbeptrmstw` (`userId`),
  CONSTRAINT `fk_cjigqfznnejtmphzhjhxyvtjvxdbeptrmstw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_epmwbxtzjfmdbuzqwhvbxyaieshltubybjny` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_gxnksuzpwenfmpgzusmgcivlzcvnydvfwbvk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sdaelwhyzqpcbydmgtidcrplibzobrccyhnf` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`)
VALUES
	(2,1,1,'2022-01-30 22:40:09',0,1),
	(34,1,24,'2022-01-30 22:40:09',0,1),
	(35,1,6,'2022-01-30 21:44:35',0,1),
	(35,1,7,'2022-01-30 21:44:35',0,1),
	(35,1,8,'2022-01-30 21:44:35',0,1),
	(36,1,11,'2022-01-30 21:44:35',0,1),
	(41,1,19,'2022-01-29 20:58:33',0,1),
	(41,1,20,'2022-01-29 20:58:23',0,1),
	(41,1,21,'2022-01-29 20:58:28',0,1),
	(44,1,19,'2022-01-29 20:58:55',0,1),
	(44,1,20,'2022-01-29 20:58:46',0,1),
	(44,1,21,'2022-01-29 20:58:52',0,1),
	(47,1,19,'2022-01-29 20:59:00',0,1),
	(47,1,20,'2022-01-29 20:59:02',0,1),
	(47,1,21,'2022-01-29 20:59:10',0,1),
	(65,1,13,'2022-01-30 21:44:35',0,1),
	(65,1,14,'2022-01-30 21:44:35',0,1),
	(65,1,15,'2022-01-30 21:44:35',0,1),
	(65,1,16,'2022-01-30 21:44:35',0,1),
	(66,1,17,'2022-01-30 21:44:35',0,1),
	(66,1,18,'2022-01-30 21:44:35',0,1),
	(105,1,22,'2022-01-30 21:44:35',0,1),
	(149,1,25,'2022-01-30 21:44:35',0,1),
	(149,1,26,'2022-01-30 21:44:35',0,1),
	(149,1,27,'2022-01-30 21:44:35',0,1),
	(149,1,28,'2022-01-30 21:44:35',0,1),
	(149,1,29,'2022-01-30 22:40:09',0,1),
	(174,1,25,'2022-01-30 21:44:35',0,1),
	(174,1,26,'2022-01-30 21:44:35',0,1),
	(174,1,27,'2022-01-30 21:44:35',0,1),
	(174,1,28,'2022-01-30 21:45:09',0,1),
	(174,1,29,'2022-01-30 22:40:09',0,1),
	(242,1,28,'2022-01-30 22:18:35',0,1),
	(242,1,29,'2022-01-30 22:40:09',0,1);

/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content`;

CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_cardAbstract_pviifqql` text COLLATE utf8_unicode_ci,
  `field_cardButton_yivhlchv` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nvwbsllfsmkmerypzwrbbdwounjefjvpvbae` (`elementId`,`siteId`),
  KEY `idx_eosjzscwvtrhqiwypbuhuobkhsomnrzdaiwk` (`siteId`),
  KEY `idx_esxinayqwhvxelyxzqvclobnpbzvuoxwsduo` (`title`),
  CONSTRAINT `fk_dnzrqdvtdepwtmsdtnicgwjvhpeiilhcpodp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gosggfildezltsvfdtwfqmmmbzkazqexvetl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_cardAbstract_pviifqql`, `field_cardButton_yivhlchv`)
VALUES
	(1,1,1,NULL,'2022-01-29 20:36:14','2022-01-31 22:02:30','36d8a617-be58-42bf-980b-5390b1c6caaf',NULL,NULL),
	(2,2,1,'Homepage','2022-01-29 20:39:48','2022-01-30 22:40:09','f7504066-6efe-45cc-96c6-f58dbbd07dff',NULL,NULL),
	(3,3,1,'Homepage','2022-01-29 20:39:48','2022-01-29 20:39:48','f8878737-8977-4882-89fa-872271f1fa95',NULL,NULL),
	(4,4,1,'Homepage','2022-01-29 20:51:32','2022-01-29 20:51:32','c0270d6e-9384-4e6b-8f3c-94e08ffd2b6e',NULL,NULL),
	(6,7,1,'Copy with image','2022-01-29 20:52:41','2022-01-29 20:52:41','441525a6-bc88-42dd-aa9f-a4bdfd548511',NULL,NULL),
	(7,37,1,'Homepage','2022-01-29 20:54:31','2022-01-29 20:54:31','d8215bb6-ba67-43f5-b87c-b7c0ded71b20',NULL,NULL),
	(8,41,1,'This is a wide container title stretching two lines.','2022-01-29 20:58:15','2022-01-29 20:58:38','7b5c162b-461a-4793-8701-0a306bc4de51','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipiscing.','[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]'),
	(9,42,1,'Card 1','2022-01-29 20:58:32','2022-01-29 20:58:32','5530f4bd-8127-4b88-8cb2-d4ee47bbc06e',NULL,NULL),
	(10,43,1,'This is a wide container title stretching two lines.','2022-01-29 20:58:38','2022-01-29 20:58:38','c049f0d2-93b6-4bb1-aff6-87a9e1c9cab8','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipiscing.','[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]'),
	(11,44,1,'This is a wide container title stretching two lines.','2022-01-29 20:58:39','2022-01-29 20:58:57','bca3de00-0712-45ba-ac60-0733d5cf569e','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipiscing.','[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]'),
	(12,45,1,'Card 2','2022-01-29 20:58:54','2022-01-29 20:58:54','88c48521-22ec-4180-b4b2-13bfb37d9efa',NULL,NULL),
	(13,46,1,'This is a wide container title stretching two lines.','2022-01-29 20:58:57','2022-01-29 20:58:57','25526096-0622-4716-8444-efb740bfaefa','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipiscing.','[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]'),
	(14,47,1,'This is a wide container title stretching two lines.','2022-01-29 20:58:57','2022-01-29 20:59:11','75c731a8-ddca-4f2d-a4b8-68e5e3b43462','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipiscing.','[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]'),
	(15,48,1,'Card 3','2022-01-29 20:59:00','2022-01-29 20:59:00','a4717b44-20d7-4fd8-b283-abd84aea25bc',NULL,NULL),
	(16,49,1,'This is a wide container title stretching two lines.','2022-01-29 20:59:11','2022-01-29 20:59:11','fbbcc0ba-6e56-4a36-ad13-5b210e7cbdaa','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipiscing.','[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]'),
	(18,67,1,'Homepage','2022-01-29 21:00:10','2022-01-29 21:00:10','39b28578-ebb6-417a-8cd3-89e6e09d24fd',NULL,NULL),
	(19,73,1,'Copy with image','2022-01-29 21:00:46','2022-01-29 21:00:46','5e6e051e-d064-4cc3-9adc-a84e0c45fcef',NULL,NULL),
	(21,80,1,'Homepage','2022-01-29 21:01:00','2022-01-29 21:01:00','ca6288c9-6f58-45cb-9b75-7d92fa851f46',NULL,NULL),
	(23,92,1,'Homepage','2022-01-29 23:25:44','2022-01-29 23:25:44','1ee61977-682c-450d-aaa1-83f4bd46ce09',NULL,NULL),
	(25,106,1,'Homepage','2022-01-29 23:33:15','2022-01-29 23:33:15','e255189b-b2cf-44bf-b930-461fce7143a0',NULL,NULL),
	(27,120,1,'Homepage','2022-01-29 23:34:58','2022-01-29 23:34:58','a780897f-3800-4562-9a0e-ea838fcf6f3c',NULL,NULL),
	(29,134,1,'Homepage','2022-01-29 23:43:37','2022-01-29 23:43:37','0446af40-4953-45e2-a0c5-1a2c1ef1a366',NULL,NULL),
	(31,150,1,'Homepage','2022-01-30 21:42:10','2022-01-30 21:42:10','a00e47b3-0d52-4849-9b82-e1c15978dad4',NULL,NULL),
	(33,175,1,'Homepage','2022-01-30 21:44:27','2022-01-30 21:44:27','9dd5220b-285b-4980-9631-71e84b5a7e8e',NULL,NULL),
	(35,193,1,'Homepage','2022-01-30 21:44:35','2022-01-30 21:44:35','bae83a07-ebe8-4d8c-bad9-b1551537bfbb',NULL,NULL),
	(37,211,1,'Homepage','2022-01-30 21:45:09','2022-01-30 21:45:09','32783a43-58c7-45ef-b3a5-7461b7d4c078',NULL,NULL),
	(39,243,1,'Homepage','2022-01-30 21:45:54','2022-01-30 21:45:54','7e22b14c-542f-4c38-9775-b45b4299c0db',NULL,NULL),
	(41,263,1,'Homepage','2022-01-30 22:18:35','2022-01-30 22:18:35','63733a14-763e-4fbd-a792-7714a38ee568',NULL,NULL),
	(43,283,1,'Hero image opt','2022-01-30 22:27:16','2022-01-30 22:27:16','2d534bb9-568a-4525-98ec-ea50718c70d8',NULL,NULL),
	(44,284,1,'Verse hero 3','2022-01-30 22:33:20','2022-01-30 22:33:20','3625e63f-56c0-4915-b9bc-e40dc4e899d2',NULL,NULL),
	(45,285,1,'Verse hero 2','2022-01-30 22:33:21','2022-01-30 22:33:21','d67257d6-89f6-4aaa-b6fd-fabab7f633ef',NULL,NULL),
	(46,286,1,'Homepage','2022-01-30 22:33:43','2022-01-30 22:33:43','70c0ed5f-5467-46b4-afc1-ac16aff79767',NULL,NULL),
	(48,306,1,'Homepage','2022-01-30 22:40:10','2022-01-30 22:40:10','40f800f4-8c3b-4100-9562-3c7de7427c5f',NULL,NULL);

/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craftidtokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craftidtokens`;

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_smsycdssxtkjturxjtyfkvtjxkyrwqhdhmpw` (`userId`),
  CONSTRAINT `fk_smsycdssxtkjturxjtyfkvtjxkyrwqhdhmpw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table deprecationerrors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deprecationerrors`;

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rkekgruoeohqafjvxwkldocmhnkekjzfxjoq` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table drafts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `drafts`;

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_jydytalhxrfpmgmtsdgtkwetxiveogujjedm` (`creatorId`,`provisional`),
  KEY `idx_ymxmwohrnbnvmhsaqeazxlvnlfvzdpoqmavf` (`saved`),
  KEY `fk_gtwemwngwxqnhogdbukzaoynongtwkkplcdx` (`sourceId`),
  CONSTRAINT `fk_curzrdygfqsuttsrdlomugqylllmjeayfzte` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_gtwemwngwxqnhogdbukzaoynongtwkkplcdx` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table elementindexsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elementindexsettings`;

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iilozdsnpgzzheshouhvdkkzusriszqdwmoy` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table elements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elements`;

CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_foxhseqqpbeknxifmawgxotiafcsdlwsfiec` (`dateDeleted`),
  KEY `idx_hdrnjnmkakqnkdinksomliirevjjyfhjgbhw` (`fieldLayoutId`),
  KEY `idx_dbbtywdicosegvoxoyajnqcikdexjbdbiyly` (`type`),
  KEY `idx_dayxpecvkwzwhymztumwxrwnuqrexrlirdji` (`enabled`),
  KEY `idx_mobxigflkfeebvzmbbzhioobwgfujpulvkab` (`archived`,`dateCreated`),
  KEY `idx_qnhtllcouoertwpcetztlygaxyakotzzapcu` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `fk_qgdyzwrgvsmiojnomnxevbwjnavpmqgqvhoo` (`canonicalId`),
  KEY `fk_chhelgiezjrjghimjrfijbdelxpviygszaaa` (`draftId`),
  KEY `fk_aifzmyrkdvvjaodfmjwmsptfmfgrtvgniqoh` (`revisionId`),
  CONSTRAINT `fk_aifzmyrkdvvjaodfmjwmsptfmfgrtvgniqoh` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_chhelgiezjrjghimjrfijbdelxpviygszaaa` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qgdyzwrgvsmiojnomnxevbwjnavpmqgqvhoo` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sfnsmrxabayslmtuurazrcqvnliouncjaysn` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2022-01-29 20:36:14','2022-01-31 22:02:30',NULL,NULL,'b4a73b39-95ea-4057-ad4b-17276b3b70b8'),
	(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-01-29 20:39:48','2022-01-30 22:40:09',NULL,NULL,'f0bab61f-2b82-49c7-88d9-ca00254f717a'),
	(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2022-01-29 20:39:48','2022-01-29 20:39:48',NULL,NULL,'423fffce-e474-4294-b1e8-b0f69c33344f'),
	(4,2,NULL,2,1,'craft\\elements\\Entry',1,0,'2022-01-29 20:51:32','2022-01-29 20:51:32',NULL,NULL,'614f24fe-18c1-4cb7-94ce-a92068098c19'),
	(6,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:51:42','2022-01-29 20:51:42',NULL,'2022-01-29 20:52:41','7bef106c-3ac0-4853-9f51-cc849d259adb'),
	(7,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2022-01-29 20:52:41','2022-01-29 20:52:41',NULL,'2022-01-30 22:33:15','d52a04b7-bd4e-4e4f-b1c8-0a01f6760ca1'),
	(8,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:52:41','2022-01-29 20:52:41',NULL,'2022-01-29 20:52:50','5610f749-c5f8-4db4-a1a5-13e8960b0f65'),
	(9,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:52:50','2022-01-29 20:52:50',NULL,'2022-01-29 20:53:02','6b9650b9-cf41-4b33-998c-472d41b4fac4'),
	(10,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:02','2022-01-29 20:53:02',NULL,'2022-01-29 20:53:03','dbceeef7-db25-48e9-9eb3-236a64585145'),
	(11,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:03','2022-01-29 20:53:03',NULL,'2022-01-29 20:53:05','b5cf4a05-2868-41db-add1-0e8bbbcd0fc3'),
	(12,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:05','2022-01-29 20:53:05',NULL,'2022-01-29 20:53:08','39d5e699-80ed-431c-8cc2-bccd69a7fcd8'),
	(13,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:08','2022-01-29 20:53:08',NULL,'2022-01-29 20:53:09','399c7fb2-78c8-40b2-b470-a57418d26fc0'),
	(14,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:09','2022-01-29 20:53:09',NULL,'2022-01-29 20:53:15','60324574-6843-445d-8fdc-e4298ce8e97e'),
	(15,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:15','2022-01-29 20:53:15',NULL,'2022-01-29 20:53:23','1f0cded8-7007-4eac-ae95-a7bfb9eedbec'),
	(16,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:15','2022-01-29 20:53:15',NULL,'2022-01-29 20:53:23','1c4e17c0-4fe6-4ffe-a711-ffb4de1d1675'),
	(17,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:23','2022-01-29 20:53:23',NULL,'2022-01-29 20:53:26','f13a789b-0622-4249-956d-632aa70109fd'),
	(18,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:23','2022-01-29 20:53:23',NULL,'2022-01-29 20:53:26','23cdb3f6-a9cb-438c-b67e-f84064f99357'),
	(19,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:26','2022-01-29 20:53:26',NULL,'2022-01-29 20:53:26','3fdf05bb-31f2-4745-b660-f642f2fca502'),
	(20,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:26','2022-01-29 20:53:26',NULL,'2022-01-29 20:53:26','758336b4-c9cc-4a2b-8934-8a2e6b9cbcf5'),
	(21,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:26','2022-01-29 20:53:26',NULL,'2022-01-29 20:53:29','5363755e-749d-4919-a381-ea2e654a6815'),
	(22,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:26','2022-01-29 20:53:26',NULL,'2022-01-29 20:53:29','b18b04c7-71bd-4439-9e94-ac66180df4c1'),
	(23,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:29','2022-01-29 20:53:29',NULL,'2022-01-29 20:53:30','d35f618d-2c63-47a1-9c00-2cd948fefa2c'),
	(24,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:29','2022-01-29 20:53:29',NULL,'2022-01-29 20:53:30','71f1fd3f-9fba-4376-b5eb-5343271de891'),
	(25,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:30','2022-01-29 20:53:30',NULL,'2022-01-29 20:53:35','ff1bcafc-94a9-4f4a-ac73-80c4fed064e4'),
	(26,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:30','2022-01-29 20:53:30',NULL,'2022-01-29 20:53:35','a23b14c1-91eb-4cff-97d7-c5757fff6c8d'),
	(27,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:35','2022-01-29 20:53:35',NULL,'2022-01-29 20:53:38','34681bc2-fbc1-4f2d-b824-6621ee5d247f'),
	(28,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:35','2022-01-29 20:53:35',NULL,'2022-01-29 20:53:38','b840e7f8-2f81-4553-a7a9-0070b9cf4c91'),
	(29,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:37','2022-01-29 20:53:37',NULL,'2022-01-29 20:53:40','e39c9c7b-d432-45d4-8584-d8364fd14dcb'),
	(30,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:53:37','2022-01-29 20:53:37',NULL,'2022-01-29 20:53:40','64470e3f-cd02-409a-af0d-86d59eed81cd'),
	(34,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:54:31','2022-01-30 22:40:09',NULL,NULL,'f25d986a-9e32-4149-abe5-27fefbad43df'),
	(35,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:54:31','2022-01-30 22:40:09',NULL,NULL,'65a3b1bf-64c2-4cf2-8c1b-69a1e0864742'),
	(36,NULL,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:54:31','2022-01-30 22:40:09',NULL,NULL,'5bae9808-98b3-4463-9453-fac7a894385c'),
	(37,2,NULL,3,1,'craft\\elements\\Entry',1,0,'2022-01-29 20:54:31','2022-01-29 20:54:31',NULL,NULL,'7caa67fe-e285-46c3-a27e-071a5d1b3406'),
	(38,34,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:54:31','2022-01-29 20:54:31',NULL,NULL,'a4cf3a9c-75d6-4a1d-8783-b77f1c8e3108'),
	(39,35,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:54:31','2022-01-29 20:54:31',NULL,NULL,'c183fd03-2d18-4d8f-bf78-2c92f521592b'),
	(40,36,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:54:31','2022-01-29 20:54:31',NULL,NULL,'efaf10f6-4c25-4ddd-87ab-e318be648308'),
	(41,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2022-01-29 20:58:15','2022-01-29 20:58:38',NULL,NULL,'c895704a-3e8b-40d2-9444-7b6c3e900b28'),
	(42,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2022-01-29 20:58:32','2022-01-29 20:58:32',NULL,NULL,'8d9c9155-b49d-4a25-b0f4-2d539e7bc5b4'),
	(43,41,NULL,4,8,'craft\\elements\\Entry',1,0,'2022-01-29 20:58:38','2022-01-29 20:58:38',NULL,NULL,'00ae1637-a6d8-4a1f-95e6-7ccdf2a65904'),
	(44,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2022-01-29 20:58:39','2022-01-29 20:58:57',NULL,NULL,'68882a40-7680-4330-9b23-bb5613698337'),
	(45,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2022-01-29 20:58:54','2022-01-29 20:58:54',NULL,NULL,'e6f0ba32-c11d-4005-9d97-5cf40dfcde68'),
	(46,44,NULL,5,8,'craft\\elements\\Entry',1,0,'2022-01-29 20:58:57','2022-01-29 20:58:57',NULL,NULL,'c0385ed9-3bc0-4803-be76-4c41bac387da'),
	(47,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2022-01-29 20:58:57','2022-01-29 20:59:11',NULL,NULL,'e8534b81-6ba3-4117-b825-d1b202aa4ead'),
	(48,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2022-01-29 20:59:00','2022-01-29 20:59:00',NULL,NULL,'5f91a4f7-df0b-47d5-8f43-bfaa8238138a'),
	(49,47,NULL,6,8,'craft\\elements\\Entry',1,0,'2022-01-29 20:59:11','2022-01-29 20:59:11',NULL,NULL,'a0733742-036e-474a-8d4e-5fedb8c36564'),
	(54,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:59:45','2022-01-29 20:59:45',NULL,'2022-01-29 20:59:53','7030b968-2133-4874-97c6-71a43619ffdf'),
	(55,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:59:52','2022-01-29 20:59:52',NULL,'2022-01-29 20:59:56','3a0dc9c2-4060-4541-a74f-46351000af50'),
	(56,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:59:52','2022-01-29 20:59:52',NULL,'2022-01-29 20:59:56','d317b434-c3e5-4430-b875-8b5cdd76d12c'),
	(57,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:59:56','2022-01-29 20:59:56',NULL,'2022-01-29 21:00:02','48688ac1-74fb-4e5b-87c6-8fac678c99a4'),
	(58,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 20:59:56','2022-01-29 20:59:56',NULL,'2022-01-29 21:00:02','c1b7873b-98c1-46c9-998f-8b6a984f8de2'),
	(59,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 21:00:02','2022-01-29 21:00:02',NULL,'2022-01-29 21:00:03','2bde63a1-0f57-411c-b073-602b0c2bc5f4'),
	(60,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 21:00:02','2022-01-29 21:00:02',NULL,'2022-01-29 21:00:03','28887f5c-919d-45a7-b57a-b209abfd9a9b'),
	(61,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 21:00:03','2022-01-29 21:00:03',NULL,'2022-01-29 21:00:08','c50a9f83-cc9d-40e7-9c6d-5d12aa3131a4'),
	(62,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 21:00:03','2022-01-29 21:00:03',NULL,'2022-01-29 21:00:08','ac043cbe-c444-4701-b852-4ef16a003ae9'),
	(65,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 21:00:09','2022-01-30 22:40:09',NULL,NULL,'62dffb05-aedd-41ee-a656-9baf88329093'),
	(66,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 21:00:09','2022-01-30 22:40:09',NULL,NULL,'ae690f5f-4833-4a9a-9e7d-e9915621c66d'),
	(67,2,NULL,7,1,'craft\\elements\\Entry',1,0,'2022-01-29 21:00:09','2022-01-29 21:00:10',NULL,NULL,'7f39fa26-de78-477c-b964-db0845723f1f'),
	(68,34,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 21:00:10','2022-01-29 21:00:10',NULL,NULL,'31146072-edcc-4a12-a02c-61d7c375c57c'),
	(69,35,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 21:00:10','2022-01-29 21:00:10',NULL,NULL,'9c558389-ef65-47a0-b379-b0e77db3693c'),
	(70,36,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 21:00:10','2022-01-29 21:00:10',NULL,NULL,'58e1c300-ddf3-425b-9dea-e29fc8cb28f4'),
	(71,65,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 21:00:10','2022-01-29 21:00:10',NULL,NULL,'4a97922d-239c-4d7a-917e-681bbc4238d9'),
	(72,66,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 21:00:10','2022-01-29 21:00:10',NULL,NULL,'ebc6a1ca-277a-4bb5-870f-4130245a67fc'),
	(73,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2022-01-29 21:00:46','2022-01-29 21:00:46',NULL,NULL,'81b5e74e-1af2-4467-a292-f8d98404baa1'),
	(80,2,NULL,8,1,'craft\\elements\\Entry',1,0,'2022-01-29 21:01:00','2022-01-29 21:01:00',NULL,NULL,'5e4540f6-f20b-4309-8ee4-c8b51bce0883'),
	(81,34,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 21:01:01','2022-01-29 21:01:01',NULL,NULL,'ba71326c-0a92-4717-b485-6b45dd15b95d'),
	(82,35,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 21:01:01','2022-01-29 21:01:01',NULL,NULL,'8032fc34-9cab-4911-9987-9e80447b3830'),
	(83,36,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 21:01:01','2022-01-29 21:01:01',NULL,NULL,'ec12dd60-1049-48d9-93c3-847e18828517'),
	(84,65,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 21:01:01','2022-01-29 21:01:01',NULL,NULL,'bdcddbd8-b2ae-4ba5-be98-266ba25a0e32'),
	(85,66,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 21:01:01','2022-01-29 21:01:01',NULL,NULL,'95980d32-d707-44b5-aeda-2c97f31c1350'),
	(92,2,NULL,9,1,'craft\\elements\\Entry',1,0,'2022-01-29 23:25:43','2022-01-29 23:25:44',NULL,NULL,'4df87107-0f2d-4186-ba0b-67d3bed5038d'),
	(93,34,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:25:44','2022-01-29 23:25:44',NULL,NULL,'a12d7625-9b05-4e02-9fde-83f4fb881f9c'),
	(94,35,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:25:44','2022-01-29 23:25:44',NULL,NULL,'bbdb8256-16c3-4d4d-85cd-3fb34e10c6b1'),
	(95,36,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:25:44','2022-01-29 23:25:44',NULL,NULL,'15cef669-a7e1-4611-a0d0-d74d40d77de7'),
	(96,65,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:25:44','2022-01-29 23:25:44',NULL,NULL,'3362bc51-2ca7-4816-a79a-18381475f964'),
	(97,66,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:25:44','2022-01-29 23:25:44',NULL,NULL,'c933f1ba-e568-44c4-ae96-bca3dac98969'),
	(105,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:33:15','2022-01-30 22:40:09',NULL,NULL,'074d672c-33db-4f39-a00a-a8f6cbadcaa0'),
	(106,2,NULL,10,1,'craft\\elements\\Entry',1,0,'2022-01-29 23:33:15','2022-01-29 23:33:15',NULL,NULL,'bcded63f-5981-4053-9945-7f40895973bc'),
	(107,34,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:33:15','2022-01-29 23:33:15',NULL,NULL,'5e5849b2-ffa0-4f01-ad1c-ac92d095f645'),
	(108,35,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:33:15','2022-01-29 23:33:15',NULL,NULL,'911ffc8b-d478-47d8-9103-00f6ee4ceef5'),
	(109,36,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:33:15','2022-01-29 23:33:15',NULL,NULL,'7f57622b-ec11-4055-a9fe-dedd05615b77'),
	(110,65,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:33:15','2022-01-29 23:33:15',NULL,NULL,'19bf9d05-49d1-478a-99cd-bd7aa185bbd7'),
	(111,66,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:33:15','2022-01-29 23:33:15',NULL,NULL,'f41d88d2-6ab7-440c-a34e-f26d1a5413dd'),
	(112,105,NULL,NULL,NULL,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:33:15','2022-01-29 23:33:15',NULL,NULL,'25354d18-133a-4d12-ba6a-98955473b7c8'),
	(120,2,NULL,11,1,'craft\\elements\\Entry',1,0,'2022-01-29 23:34:58','2022-01-29 23:34:58',NULL,NULL,'b604ddab-a0e3-465b-ad45-b29836267ded'),
	(121,34,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:34:58','2022-01-29 23:34:58',NULL,NULL,'cdb3bbf2-65d0-481c-b5d8-cb08273ca704'),
	(122,35,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:34:58','2022-01-29 23:34:58',NULL,NULL,'63d02434-1898-4af9-807b-b7ff8b05c991'),
	(123,36,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:34:58','2022-01-29 23:34:58',NULL,NULL,'a531ab71-243d-412d-b42f-634a107e94d6'),
	(124,65,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:34:58','2022-01-29 23:34:58',NULL,NULL,'f155c81b-8ad3-4957-8895-6e20c8b3ec88'),
	(125,66,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:34:58','2022-01-29 23:34:58',NULL,NULL,'0c73598a-9c8c-44d2-a8bb-96b12c618c26'),
	(126,105,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:34:58','2022-01-29 23:34:58',NULL,NULL,'1b269230-1734-414e-b2e1-a90c48914f97'),
	(134,2,NULL,12,1,'craft\\elements\\Entry',1,0,'2022-01-29 23:43:37','2022-01-29 23:43:37',NULL,NULL,'8528ba9e-1fbd-47e9-8f4d-b99d2ed00042'),
	(135,34,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:43:37','2022-01-29 23:43:37',NULL,NULL,'d341aa2a-050d-4687-8cb9-ff43791dc8d7'),
	(136,35,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:43:37','2022-01-29 23:43:37',NULL,NULL,'c78d3f81-ad70-470a-abff-1978d3fe2dcd'),
	(137,36,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:43:37','2022-01-29 23:43:37',NULL,NULL,'6b4b9d2d-190d-42fe-bc18-7b3006daf732'),
	(138,65,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:43:37','2022-01-29 23:43:37',NULL,NULL,'7bd0dbbc-60c8-44c8-9a98-733bc34fd38f'),
	(139,66,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:43:37','2022-01-29 23:43:37',NULL,NULL,'cc1a6ff3-250c-4978-bbb7-76c0bf207720'),
	(140,105,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-01-29 23:43:37','2022-01-29 23:43:37',NULL,NULL,'d343cd01-4a48-4f3d-9932-4967cb40cd2c'),
	(149,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:42:10','2022-01-30 22:40:09',NULL,NULL,'378fe7bf-0484-462e-b7f7-401f83d92aaa'),
	(150,2,NULL,13,1,'craft\\elements\\Entry',1,0,'2022-01-30 21:42:10','2022-01-30 21:42:10',NULL,NULL,'f11e4c5a-00f5-4ff2-b21b-5a4811aaf46d'),
	(151,34,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:42:10','2022-01-30 21:42:10',NULL,NULL,'0ffe5c6a-470b-417c-9da2-8035459b8ff8'),
	(152,149,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:42:10','2022-01-30 21:42:10',NULL,NULL,'92b781b8-3758-4b33-85a4-d196aad0d943'),
	(153,35,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:42:10','2022-01-30 21:42:10',NULL,NULL,'e8b5d656-25e6-473d-847b-c70f04841d3e'),
	(154,36,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:42:10','2022-01-30 21:42:10',NULL,NULL,'5d0209bf-4d36-4f3a-98cc-f34df94ae42b'),
	(155,65,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:42:10','2022-01-30 21:42:10',NULL,NULL,'ca2eb26b-4bad-472c-8637-76bde2981d9c'),
	(156,66,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:42:10','2022-01-30 21:42:10',NULL,NULL,'8d4aba88-bd62-453c-b5ea-00ead360da49'),
	(157,105,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:42:10','2022-01-30 21:42:10',NULL,NULL,'c61c2a03-462f-4238-91ea-7af4e313a32d'),
	(166,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:44:03','2022-01-30 21:44:03',NULL,'2022-01-30 21:44:08','788dfa53-e71d-4e9f-9303-285360309dd2'),
	(167,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:44:08','2022-01-30 21:44:08',NULL,'2022-01-30 21:44:11','471c6751-9b55-4d5b-b118-c2298c3f531c'),
	(168,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:44:11','2022-01-30 21:44:11',NULL,'2022-01-30 21:44:15','b31e3fb4-8bf5-41c4-804a-29e25a11faab'),
	(169,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:44:15','2022-01-30 21:44:15',NULL,'2022-01-30 21:44:17','0922d7b3-6446-4d24-a02c-c788272c58b7'),
	(170,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:44:17','2022-01-30 21:44:17',NULL,'2022-01-30 21:44:20','b57239cf-67d7-4143-ab24-77a666f799db'),
	(171,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:44:20','2022-01-30 21:44:20',NULL,'2022-01-30 21:44:23','52a10ddc-257f-4277-a426-6618e688aa55'),
	(172,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:44:23','2022-01-30 21:44:23',NULL,'2022-01-30 21:44:26','2ad699dc-7cd7-41b8-86d9-d3e7c4f88b9e'),
	(174,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:44:27','2022-01-30 22:40:09',NULL,NULL,'7d286ead-91e2-4e29-ba46-50482a666188'),
	(175,2,NULL,14,1,'craft\\elements\\Entry',1,0,'2022-01-30 21:44:27','2022-01-30 21:44:27',NULL,NULL,'86678eae-f255-4ed1-8619-1baf8a3b8db7'),
	(176,34,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:44:27','2022-01-30 21:44:27',NULL,NULL,'792f3dd7-ae73-45ce-a28b-b905c6dc8968'),
	(177,149,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:44:27','2022-01-30 21:44:27',NULL,NULL,'b72f1bcb-357a-44d1-882a-d943b53628be'),
	(178,174,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:44:27','2022-01-30 21:44:27',NULL,NULL,'af502cde-62e0-4701-896d-f5fbf50cb01d'),
	(179,35,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:44:27','2022-01-30 21:44:27',NULL,NULL,'80efa776-bdca-4847-b5bd-9a4b8aca26fd'),
	(180,36,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:44:27','2022-01-30 21:44:27',NULL,NULL,'f94f2523-2cab-498d-8589-edcc3645e686'),
	(181,65,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:44:27','2022-01-30 21:44:27',NULL,NULL,'fff0dbdf-6e9a-4506-a0f1-9d39ea23fbbd'),
	(182,66,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:44:27','2022-01-30 21:44:27',NULL,NULL,'c01016ba-2210-4940-958d-d8332397ac96'),
	(183,105,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:44:27','2022-01-30 21:44:27',NULL,NULL,'194c30d2-a99c-4b34-9538-0ce3188cfa16'),
	(193,2,NULL,15,1,'craft\\elements\\Entry',1,0,'2022-01-30 21:44:35','2022-01-30 21:44:35',NULL,NULL,'ac3e33ac-0e13-467c-a4e1-20724f6eee39'),
	(194,34,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:44:35','2022-01-30 21:44:35',NULL,NULL,'820f71b5-da91-4a94-87d9-1bac5f09c80d'),
	(195,149,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:44:35','2022-01-30 21:44:35',NULL,NULL,'103fdec2-6993-47b4-b273-4cdff4a48ce8'),
	(196,174,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:44:35','2022-01-30 21:44:35',NULL,NULL,'be55ec6f-2fde-4958-a641-d3f4052eba61'),
	(197,35,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:44:35','2022-01-30 21:44:35',NULL,NULL,'e432a15e-86d4-4b02-a2ac-2de3f23248f0'),
	(198,36,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:44:35','2022-01-30 21:44:35',NULL,NULL,'28b144d3-5000-4243-91da-2e81aaa4a90a'),
	(199,65,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:44:35','2022-01-30 21:44:35',NULL,NULL,'b8a0e240-5cce-467f-96be-d4c5b5ef1522'),
	(200,66,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:44:35','2022-01-30 21:44:35',NULL,NULL,'74d693e6-3e7b-47b2-8c7c-15cc6af07aa2'),
	(201,105,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:44:35','2022-01-30 21:44:35',NULL,NULL,'37c4af70-d6f3-47a1-882e-9f8a9ae1868e'),
	(211,2,NULL,16,1,'craft\\elements\\Entry',1,0,'2022-01-30 21:45:09','2022-01-30 21:45:09',NULL,NULL,'46110f07-b87d-4be2-9428-c992158c2c9d'),
	(212,34,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:45:09','2022-01-30 21:45:09',NULL,NULL,'ff48bfff-f498-4ad7-b2c6-3b1c6f0123dc'),
	(213,149,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:45:09','2022-01-30 21:45:09',NULL,NULL,'e29be5b0-bec8-4a15-bfbe-5e7b6ab68737'),
	(214,174,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:45:09','2022-01-30 21:45:09',NULL,NULL,'eca7ad86-e4a1-456f-b297-446af0fdf9ad'),
	(215,35,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:45:09','2022-01-30 21:45:09',NULL,NULL,'661d6550-e6e9-4ad1-8223-feec5906cf8d'),
	(216,36,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:45:09','2022-01-30 21:45:09',NULL,NULL,'c1d50fe0-50d1-4fdf-af4d-529bc5a4463f'),
	(217,65,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:45:09','2022-01-30 21:45:09',NULL,NULL,'fcad77ec-1e50-4b75-a745-0793cd23cd72'),
	(218,66,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:45:09','2022-01-30 21:45:09',NULL,NULL,'b8f4b7ce-33b6-4e14-9c14-141085a46d38'),
	(219,105,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:45:09','2022-01-30 21:45:09',NULL,NULL,'a3a08c75-740b-43ce-9df3-e465651b6980'),
	(229,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:45:17','2022-01-30 21:45:17',NULL,'2022-01-30 21:45:22','633c6fd7-788e-4318-a027-939f29bdbb9d'),
	(230,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:45:22','2022-01-30 21:45:22',NULL,'2022-01-30 21:45:24','a31c041b-e100-4040-9ce4-a31b7b1bf334'),
	(231,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:45:24','2022-01-30 21:45:24',NULL,'2022-01-30 21:45:32','7401d602-4317-476b-b7f4-93816de698ff'),
	(232,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:45:32','2022-01-30 21:45:32',NULL,'2022-01-30 21:45:34','b9296851-6b34-4fe1-a2bb-5bc52a0ef311'),
	(233,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:45:34','2022-01-30 21:45:34',NULL,'2022-01-30 21:45:41','a8e84051-018f-4664-b9e4-f728dbce5ccc'),
	(234,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:45:41','2022-01-30 21:45:41',NULL,'2022-01-30 21:45:41','64e1bdc4-8a46-4cc7-8a4b-8cb0899bec8c'),
	(235,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:45:41','2022-01-30 21:45:41',NULL,'2022-01-30 21:45:43','0ee2c317-30fd-424e-ae66-59505557a2f5'),
	(236,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:45:43','2022-01-30 21:45:43',NULL,'2022-01-30 21:45:45','e5bdb653-0299-428c-a999-59f311e35095'),
	(237,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:45:45','2022-01-30 21:45:45',NULL,'2022-01-30 21:45:46','73186723-ad02-4025-8ae6-230d8f2741ba'),
	(238,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:45:46','2022-01-30 21:45:46',NULL,'2022-01-30 21:45:47','a4b43ca1-a969-458a-8b69-7f05f151a4c7'),
	(239,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:45:47','2022-01-30 21:45:47',NULL,'2022-01-30 21:45:49','fad53fea-faf9-4dab-a4eb-faecb57c24e0'),
	(240,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:45:49','2022-01-30 21:45:49',NULL,'2022-01-30 21:45:51','8f39f278-7446-47b6-8ace-12c52f5fead9'),
	(242,NULL,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:45:54','2022-01-30 22:40:09',NULL,NULL,'63505d98-e005-490a-83ba-7cc99895be69'),
	(243,2,NULL,17,1,'craft\\elements\\Entry',1,0,'2022-01-30 21:45:53','2022-01-30 21:45:54',NULL,NULL,'c95c55e7-1021-4db8-8769-41264afda91b'),
	(244,34,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:45:54','2022-01-30 21:45:54',NULL,NULL,'ad113dab-aae4-49fd-acfd-156fada45a58'),
	(245,149,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:45:54','2022-01-30 21:45:54',NULL,NULL,'ff3c4db1-eeff-4ac3-a870-0a45267b2dc8'),
	(246,174,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:45:54','2022-01-30 21:45:54',NULL,NULL,'b38990f5-0281-4531-b392-3c186e7a06e3'),
	(247,242,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 21:45:54','2022-01-30 21:45:54',NULL,NULL,'6756707c-3951-424d-b614-677775d881aa'),
	(248,35,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:45:54','2022-01-30 21:45:54',NULL,NULL,'a514c2aa-f465-4a77-9ddf-69ab9fe3eaac'),
	(249,36,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:45:54','2022-01-30 21:45:54',NULL,NULL,'c917b0c5-59a3-43bd-ad54-3b983d2f5e3a'),
	(250,65,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:45:54','2022-01-30 21:45:54',NULL,NULL,'f2a28c44-e0f1-47c1-96db-8ed065f6e6eb'),
	(251,66,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:45:54','2022-01-30 21:45:54',NULL,NULL,'b50b63e1-35de-405a-baf9-e98ef2a650b0'),
	(252,105,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 21:45:54','2022-01-30 21:45:54',NULL,NULL,'583c0635-aa83-47f3-b5bf-d51453d22518'),
	(263,2,NULL,18,1,'craft\\elements\\Entry',1,0,'2022-01-30 22:18:35','2022-01-30 22:18:35',NULL,NULL,'b5697d15-1b62-46b5-8476-c7c428b083c4'),
	(264,34,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 22:18:35','2022-01-30 22:18:35',NULL,NULL,'bdc0cc4b-9fee-416f-a4a2-8353028c4e44'),
	(265,149,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 22:18:35','2022-01-30 22:18:35',NULL,NULL,'bb0762fb-c97a-4644-b446-dd32f8212016'),
	(266,174,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 22:18:35','2022-01-30 22:18:35',NULL,NULL,'14b4f7a0-7bee-4df9-87a7-f4d16327990a'),
	(267,242,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 22:18:35','2022-01-30 22:18:35',NULL,NULL,'26ca0907-316e-4af2-96af-96a884934877'),
	(268,35,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 22:18:35','2022-01-30 22:18:35',NULL,NULL,'1a7d7310-9c6f-419e-a5b2-497de977b47c'),
	(269,36,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 22:18:35','2022-01-30 22:18:35',NULL,NULL,'01fb9d8b-e54d-4dd0-a0d6-95f4327fa848'),
	(270,65,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 22:18:35','2022-01-30 22:18:35',NULL,NULL,'d1e54a1f-d8af-4702-bad7-53aa93681cb8'),
	(271,66,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 22:18:35','2022-01-30 22:18:35',NULL,NULL,'b650d3c1-d937-4086-82df-198754b40d50'),
	(272,105,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 22:18:35','2022-01-30 22:18:35',NULL,NULL,'4609f6ae-4b2f-4442-803a-26c886e5c26f'),
	(283,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2022-01-30 22:27:16','2022-01-30 22:27:16',NULL,NULL,'06359b6e-24d8-4e91-9bdf-3bc948411919'),
	(284,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2022-01-30 22:33:20','2022-01-30 22:33:20',NULL,NULL,'0a889eea-c72e-4fe3-be31-90191aede81e'),
	(285,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2022-01-30 22:33:21','2022-01-30 22:33:21',NULL,NULL,'cf932832-5762-463d-9736-c924eb68fb83'),
	(286,2,NULL,19,1,'craft\\elements\\Entry',1,0,'2022-01-30 22:33:43','2022-01-30 22:33:43',NULL,NULL,'dc11fbd1-a674-48c9-aa0e-7ad22f3fd189'),
	(287,34,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 22:33:43','2022-01-30 22:33:43',NULL,NULL,'4b88685c-7e42-44f3-aed9-4e39230e6e2f'),
	(288,149,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 22:33:43','2022-01-30 22:33:43',NULL,NULL,'799521ea-2cd4-41ef-851f-88edb8bf66dd'),
	(289,174,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 22:33:44','2022-01-30 22:33:44',NULL,NULL,'2a0f775f-1938-401e-8f40-e3e53aecf122'),
	(290,242,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 22:33:44','2022-01-30 22:33:44',NULL,NULL,'34fb46ea-b926-488c-b05a-92c0e0eb29e4'),
	(291,35,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 22:33:44','2022-01-30 22:33:44',NULL,NULL,'aca8a306-9f78-4110-9675-f3cf47d68d25'),
	(292,36,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 22:33:44','2022-01-30 22:33:44',NULL,NULL,'41ce1d19-8eff-4900-8ad8-841526a8c419'),
	(293,65,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 22:33:44','2022-01-30 22:33:44',NULL,NULL,'1afef371-dd98-48c8-89f5-1cef352631bf'),
	(294,66,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 22:33:44','2022-01-30 22:33:44',NULL,NULL,'8e421154-5735-46dd-a38d-ea487138e060'),
	(295,105,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 22:33:44','2022-01-30 22:33:44',NULL,NULL,'c3653b3d-a89a-49ec-8d63-ff71bd350848'),
	(306,2,NULL,20,1,'craft\\elements\\Entry',1,0,'2022-01-30 22:40:09','2022-01-30 22:40:10',NULL,NULL,'23a9ab1b-e772-43c9-a74b-8dd486d29765'),
	(307,34,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 22:40:10','2022-01-30 22:40:10',NULL,NULL,'e31ef914-014c-43d6-a332-47012b9385c6'),
	(308,149,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 22:40:10','2022-01-30 22:40:10',NULL,NULL,'4cf55269-f8e6-4da4-b848-c9667b2997e5'),
	(309,174,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 22:40:10','2022-01-30 22:40:10',NULL,NULL,'135c5673-ea55-4c3e-a536-0899e7f2687e'),
	(310,242,NULL,NULL,12,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2022-01-30 22:40:10','2022-01-30 22:40:10',NULL,NULL,'8b7c2e97-5b16-42de-a93a-bc6cae508988'),
	(311,35,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 22:40:10','2022-01-30 22:40:10',NULL,NULL,'7afbf076-05c6-4a1f-a7fe-3d5dc621ae2b'),
	(312,36,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 22:40:10','2022-01-30 22:40:10',NULL,NULL,'4479dd5c-6117-4bc6-ab27-2330d782f03c'),
	(313,65,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 22:40:10','2022-01-30 22:40:10',NULL,NULL,'06c343c3-31ff-47fb-ab6b-ce4357b275b2'),
	(314,66,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 22:40:10','2022-01-30 22:40:10',NULL,NULL,'5e244370-31cd-47cf-a0a7-321a9255c06e'),
	(315,105,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-01-30 22:40:10','2022-01-30 22:40:10',NULL,NULL,'32c9068a-f322-48a0-a193-43a51b324025');

/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table elements_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elements_sites`;

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ezbmuoxccxozdvjifyjhtcfgdgsuntkhspdj` (`elementId`,`siteId`),
  KEY `idx_akrzivvogfhrwtgrbxcktkfajmadnkwqtwsw` (`siteId`),
  KEY `idx_bksbwlzdcczzeppxyjjnajeauxrhkefynaja` (`slug`,`siteId`),
  KEY `idx_aoyeqivplipguokoxwuyeeleyopiclqhqvqx` (`enabled`),
  KEY `idx_jdehzkxnsdhmyfojyhfcrosuosktfiscwqrz` (`uri`,`siteId`),
  CONSTRAINT `fk_dszergvatjiqawcemxxartlxvsgpjmpnuols` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_umccatgebjonsgxcupzfxcsyhadiagbiakaa` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,NULL,NULL,1,'2022-01-29 20:36:14','2022-01-29 20:36:14','64ec01be-c12b-409a-a479-02691b416202'),
	(2,2,1,'homepage','__home__',1,'2022-01-29 20:39:48','2022-01-29 20:39:48','dd9684eb-f1bd-49cc-81ec-eaa8695c63f6'),
	(3,3,1,'homepage','__home__',1,'2022-01-29 20:39:48','2022-01-29 20:39:48','9acb2a8a-633b-4be1-893b-8c64e2fb9202'),
	(4,4,1,'homepage','__home__',1,'2022-01-29 20:51:32','2022-01-29 20:51:32','8a98805b-5feb-4d7d-b9bf-220446be1b1f'),
	(6,6,1,NULL,NULL,1,'2022-01-29 20:51:42','2022-01-29 20:51:42','23d13e3f-2ac7-4ae8-ba4d-b5be9400e639'),
	(7,7,1,NULL,NULL,1,'2022-01-29 20:52:41','2022-01-29 20:52:41','dd5b1483-1f3c-4d88-9f91-008586ed78f7'),
	(8,8,1,NULL,NULL,1,'2022-01-29 20:52:41','2022-01-29 20:52:41','1962ed1f-953b-46d0-b915-42b5074d4cfe'),
	(9,9,1,NULL,NULL,1,'2022-01-29 20:52:50','2022-01-29 20:52:50','ad7c4209-6581-4d9f-9297-18dd244d0243'),
	(10,10,1,NULL,NULL,1,'2022-01-29 20:53:02','2022-01-29 20:53:02','dc280a97-5f9d-42e4-8a13-bd9ab6db9510'),
	(11,11,1,NULL,NULL,1,'2022-01-29 20:53:03','2022-01-29 20:53:03','b25d69a7-649a-48ac-8916-0b1169d01af3'),
	(12,12,1,NULL,NULL,1,'2022-01-29 20:53:05','2022-01-29 20:53:05','dfd5c9c8-cab0-4176-bcbe-81b5fc55cf3f'),
	(13,13,1,NULL,NULL,1,'2022-01-29 20:53:08','2022-01-29 20:53:08','4e6e0940-9451-4b9a-a8b1-428617fb9ba6'),
	(14,14,1,NULL,NULL,1,'2022-01-29 20:53:09','2022-01-29 20:53:09','8453f6f6-d087-462a-a143-ee42cf03df4d'),
	(15,15,1,NULL,NULL,1,'2022-01-29 20:53:15','2022-01-29 20:53:15','49379279-d522-4c43-9b44-a2b9b51eb43a'),
	(16,16,1,NULL,NULL,1,'2022-01-29 20:53:15','2022-01-29 20:53:15','8ef56e37-6b50-4fb2-8f5e-1c299fd0803d'),
	(17,17,1,NULL,NULL,1,'2022-01-29 20:53:23','2022-01-29 20:53:23','e9da6ca2-598d-4e21-be4e-1fb2e0e25351'),
	(18,18,1,NULL,NULL,1,'2022-01-29 20:53:23','2022-01-29 20:53:23','3b3d62ca-b04f-4c64-a6ac-96d11ef46a05'),
	(19,19,1,NULL,NULL,1,'2022-01-29 20:53:26','2022-01-29 20:53:26','f8c135fd-1acb-4688-8fbe-5376af1edf4e'),
	(20,20,1,NULL,NULL,1,'2022-01-29 20:53:26','2022-01-29 20:53:26','451873e7-8a89-4d01-bc94-b1162cf48634'),
	(21,21,1,NULL,NULL,1,'2022-01-29 20:53:26','2022-01-29 20:53:26','5aca7a5e-9dee-4a30-aac3-fc19cc6c0f93'),
	(22,22,1,NULL,NULL,1,'2022-01-29 20:53:26','2022-01-29 20:53:26','f925f04d-1db8-4cc2-a357-3e336827fa63'),
	(23,23,1,NULL,NULL,1,'2022-01-29 20:53:29','2022-01-29 20:53:29','3c6c4770-2790-4e0d-a7f7-6bd4a98fd7fb'),
	(24,24,1,NULL,NULL,1,'2022-01-29 20:53:29','2022-01-29 20:53:29','cb688639-9670-4a1d-956a-806da494bd4c'),
	(25,25,1,NULL,NULL,1,'2022-01-29 20:53:30','2022-01-29 20:53:30','ea5dbb95-d20b-4b8d-bf93-e2a8ab254fef'),
	(26,26,1,NULL,NULL,1,'2022-01-29 20:53:30','2022-01-29 20:53:30','dcf378db-ed20-4a3c-bbcf-618488c39359'),
	(27,27,1,NULL,NULL,1,'2022-01-29 20:53:35','2022-01-29 20:53:35','8e1d3217-dd2c-472d-8b5a-3938e7d8f4cc'),
	(28,28,1,NULL,NULL,1,'2022-01-29 20:53:35','2022-01-29 20:53:35','4531ac05-d86a-4f87-b857-2423c0601d95'),
	(29,29,1,NULL,NULL,1,'2022-01-29 20:53:37','2022-01-29 20:53:37','9b397e2e-46e5-44e0-9ae7-b889792f37a1'),
	(30,30,1,NULL,NULL,1,'2022-01-29 20:53:37','2022-01-29 20:53:37','fc9c5b0c-f927-4583-ae48-6cc7a8199abe'),
	(34,34,1,NULL,NULL,1,'2022-01-29 20:54:31','2022-01-29 20:54:31','2cc8747a-ca62-43dc-b9db-b65c2d3b58bb'),
	(35,35,1,NULL,NULL,1,'2022-01-29 20:54:31','2022-01-29 20:54:31','9fc30a82-5d69-4fc5-903d-492d06dbec18'),
	(36,36,1,NULL,NULL,1,'2022-01-29 20:54:31','2022-01-29 20:54:31','7e356865-e979-40e2-b2bc-c42d3c3824d9'),
	(37,37,1,'homepage','__home__',1,'2022-01-29 20:54:31','2022-01-29 20:54:31','4e0d8c75-e705-4b1b-9620-113ff577c6cd'),
	(38,38,1,NULL,NULL,1,'2022-01-29 20:54:31','2022-01-29 20:54:31','5dce36b0-aa1e-4dd4-b3cd-18481d140053'),
	(39,39,1,NULL,NULL,1,'2022-01-29 20:54:31','2022-01-29 20:54:31','10edb05b-d740-4a12-af19-a40eb7140905'),
	(40,40,1,NULL,NULL,1,'2022-01-29 20:54:31','2022-01-29 20:54:31','7677c9b2-db7a-4ce2-ba8f-dfcc3a2a3372'),
	(41,41,1,'this-is-a-wide-container-title-stretching-two-lines',NULL,1,'2022-01-29 20:58:15','2022-01-29 20:58:20','2be76c58-43f5-4f1d-a16f-5a1f07d3bc43'),
	(42,42,1,NULL,NULL,1,'2022-01-29 20:58:32','2022-01-29 20:58:32','2ebe8477-3134-4a25-9348-9ae85ee47ac7'),
	(43,43,1,'this-is-a-wide-container-title-stretching-two-lines',NULL,1,'2022-01-29 20:58:38','2022-01-29 20:58:38','5b8fe063-70ec-40da-be5e-db5ac4b41b85'),
	(44,44,1,'this-is-a-wide-container-title-stretching-two-lines',NULL,1,'2022-01-29 20:58:39','2022-01-29 20:58:43','c25e490c-8ed3-49a3-99d0-27cc5136f36e'),
	(45,45,1,NULL,NULL,1,'2022-01-29 20:58:54','2022-01-29 20:58:54','9e6b2b0c-7fcf-433e-b06d-80fc37cf06d0'),
	(46,46,1,'this-is-a-wide-container-title-stretching-two-lines',NULL,1,'2022-01-29 20:58:57','2022-01-29 20:58:57','9a4ebcf6-d70b-4314-836d-5ddaa1599634'),
	(47,47,1,'this-is-a-wide-container-title-stretching-two-lines',NULL,1,'2022-01-29 20:58:57','2022-01-29 20:59:05','445644f7-0f6a-4ba1-b81c-ea4b8b0bdc86'),
	(48,48,1,NULL,NULL,1,'2022-01-29 20:59:00','2022-01-29 20:59:00','bdc2a1ba-84fa-45be-b0d5-96c237bd7f78'),
	(49,49,1,'this-is-a-wide-container-title-stretching-two-lines',NULL,1,'2022-01-29 20:59:11','2022-01-29 20:59:11','9e75aa36-05a3-4e09-94e3-639f6b322a4f'),
	(54,54,1,NULL,NULL,1,'2022-01-29 20:59:45','2022-01-29 20:59:45','5d794f4c-becd-4962-b132-158d68a7079f'),
	(55,55,1,NULL,NULL,1,'2022-01-29 20:59:52','2022-01-29 20:59:52','4e25fc42-80f1-4dee-96f8-0c6ddf0c52ec'),
	(56,56,1,NULL,NULL,1,'2022-01-29 20:59:52','2022-01-29 20:59:52','c6b0b280-f708-4d19-81bd-b3e0c60a5813'),
	(57,57,1,NULL,NULL,1,'2022-01-29 20:59:56','2022-01-29 20:59:56','c5ace498-51a5-459c-b5d5-dcac99eeeaee'),
	(58,58,1,NULL,NULL,1,'2022-01-29 20:59:56','2022-01-29 20:59:56','e045e0eb-889e-4339-b838-26b262a9b103'),
	(59,59,1,NULL,NULL,1,'2022-01-29 21:00:02','2022-01-29 21:00:02','ab065cc7-4bfc-43a0-8638-6a77398fce91'),
	(60,60,1,NULL,NULL,1,'2022-01-29 21:00:02','2022-01-29 21:00:02','7673df29-0db9-4d0a-b31c-fae7f437f360'),
	(61,61,1,NULL,NULL,1,'2022-01-29 21:00:03','2022-01-29 21:00:03','c3bb54da-a306-4cf5-b374-685318948676'),
	(62,62,1,NULL,NULL,1,'2022-01-29 21:00:03','2022-01-29 21:00:03','6915f10a-3e45-4fb6-8f8f-9f47f3cb6ea6'),
	(65,65,1,NULL,NULL,1,'2022-01-29 21:00:09','2022-01-29 21:00:09','f022ea2a-e3a2-4f03-b59e-9c96765034e4'),
	(66,66,1,NULL,NULL,1,'2022-01-29 21:00:09','2022-01-29 21:00:09','4f9b9950-5f7c-45fb-9ea8-607cdb53c837'),
	(67,67,1,'homepage','__home__',1,'2022-01-29 21:00:10','2022-01-29 21:00:10','63b424bf-e097-4f61-8557-71eaae5e6c1e'),
	(68,68,1,NULL,NULL,1,'2022-01-29 21:00:10','2022-01-29 21:00:10','347d63ba-9e10-43b5-a42f-538b92cd6b14'),
	(69,69,1,NULL,NULL,1,'2022-01-29 21:00:10','2022-01-29 21:00:10','00347e17-d114-4b49-b4cd-86ffa3555571'),
	(70,70,1,NULL,NULL,1,'2022-01-29 21:00:10','2022-01-29 21:00:10','5f412405-4d8b-4bb0-9d5d-7a91b696c431'),
	(71,71,1,NULL,NULL,1,'2022-01-29 21:00:10','2022-01-29 21:00:10','c6acdc6c-0d36-4170-8249-4fb283630f05'),
	(72,72,1,NULL,NULL,1,'2022-01-29 21:00:10','2022-01-29 21:00:10','fd34b93d-14f7-421a-8631-37ce5a26e6c0'),
	(73,73,1,NULL,NULL,1,'2022-01-29 21:00:46','2022-01-29 21:00:46','4978ebd7-0d3a-4358-a39c-e0bb177db25e'),
	(80,80,1,'homepage','__home__',1,'2022-01-29 21:01:00','2022-01-29 21:01:00','9fdb6481-e7fc-42bd-b51e-63d92f723cfa'),
	(81,81,1,NULL,NULL,1,'2022-01-29 21:01:01','2022-01-29 21:01:01','6f0617a1-541a-49a4-95a5-79a7f2346a14'),
	(82,82,1,NULL,NULL,1,'2022-01-29 21:01:01','2022-01-29 21:01:01','2063bd0e-6120-4220-9a43-c1d31e76a6e2'),
	(83,83,1,NULL,NULL,1,'2022-01-29 21:01:01','2022-01-29 21:01:01','18e28547-2cd1-475c-857a-eae2fd904d86'),
	(84,84,1,NULL,NULL,1,'2022-01-29 21:01:01','2022-01-29 21:01:01','b35ee147-c813-485b-809c-3d19d6999a27'),
	(85,85,1,NULL,NULL,1,'2022-01-29 21:01:01','2022-01-29 21:01:01','6811674f-aa99-4101-a5c4-75029b18da41'),
	(92,92,1,'homepage','__home__',1,'2022-01-29 23:25:44','2022-01-29 23:25:44','4c7d7cfd-4404-4f2f-8ac6-db4838d3586c'),
	(93,93,1,NULL,NULL,1,'2022-01-29 23:25:44','2022-01-29 23:25:44','4fae11c9-8a6a-44be-a0af-20e07da589aa'),
	(94,94,1,NULL,NULL,1,'2022-01-29 23:25:44','2022-01-29 23:25:44','d842c5a9-bb74-43e6-9694-2310d8b2a3a8'),
	(95,95,1,NULL,NULL,1,'2022-01-29 23:25:44','2022-01-29 23:25:44','f6b22a6e-5ef2-436b-96e0-c8d2c8e948af'),
	(96,96,1,NULL,NULL,1,'2022-01-29 23:25:44','2022-01-29 23:25:44','6ac3fc61-3ed8-4970-ac09-e66a2d09c6a3'),
	(97,97,1,NULL,NULL,1,'2022-01-29 23:25:44','2022-01-29 23:25:44','48448598-93a4-4263-8a17-25cee418604d'),
	(105,105,1,NULL,NULL,1,'2022-01-29 23:33:15','2022-01-29 23:33:15','33089930-265e-4197-a6d8-24409ff4bb31'),
	(106,106,1,'homepage','__home__',1,'2022-01-29 23:33:15','2022-01-29 23:33:15','9154cb70-d68b-4c0a-bc6e-b20ba0ced7bb'),
	(107,107,1,NULL,NULL,1,'2022-01-29 23:33:15','2022-01-29 23:33:15','537100d5-a410-4adc-9616-c0d8f1c4863f'),
	(108,108,1,NULL,NULL,1,'2022-01-29 23:33:15','2022-01-29 23:33:15','3e5b8ad1-0414-4149-b4f5-a5751a5b51ab'),
	(109,109,1,NULL,NULL,1,'2022-01-29 23:33:15','2022-01-29 23:33:15','26f1f039-a2b7-4dbe-847a-2899d40ecb85'),
	(110,110,1,NULL,NULL,1,'2022-01-29 23:33:15','2022-01-29 23:33:15','469098fe-6616-47cc-8f05-bdd201b6d961'),
	(111,111,1,NULL,NULL,1,'2022-01-29 23:33:15','2022-01-29 23:33:15','c0186b92-bcb0-45c0-816a-3fc61693e3c2'),
	(112,112,1,NULL,NULL,1,'2022-01-29 23:33:15','2022-01-29 23:33:15','f331f6ed-e73c-4c64-a24e-1d1fbb01fd3c'),
	(120,120,1,'homepage','__home__',1,'2022-01-29 23:34:58','2022-01-29 23:34:58','d05a7d5f-7ae7-4642-b0fc-be02608bcb37'),
	(121,121,1,NULL,NULL,1,'2022-01-29 23:34:58','2022-01-29 23:34:58','70a7c3fd-5d54-46c4-bed7-f8a94b265b22'),
	(122,122,1,NULL,NULL,1,'2022-01-29 23:34:58','2022-01-29 23:34:58','16bf6b64-07ad-4e78-afd0-967c420df9ca'),
	(123,123,1,NULL,NULL,1,'2022-01-29 23:34:58','2022-01-29 23:34:58','2a248128-a0b8-420e-9629-35067d0f6e45'),
	(124,124,1,NULL,NULL,1,'2022-01-29 23:34:58','2022-01-29 23:34:58','0229d690-b348-4a63-9379-3ce2ad4ae549'),
	(125,125,1,NULL,NULL,1,'2022-01-29 23:34:58','2022-01-29 23:34:58','3081cc95-3756-4c0f-8c93-26de39bdbc99'),
	(126,126,1,NULL,NULL,1,'2022-01-29 23:34:58','2022-01-29 23:34:58','9692e6cf-62d1-4fb9-aa18-c9ac7b292fa9'),
	(134,134,1,'homepage','__home__',1,'2022-01-29 23:43:37','2022-01-29 23:43:37','7c4e1c33-38b2-4bd0-b310-07fa70f1ce89'),
	(135,135,1,NULL,NULL,1,'2022-01-29 23:43:37','2022-01-29 23:43:37','f7150099-466c-49e1-a3b7-3a5e2110f617'),
	(136,136,1,NULL,NULL,1,'2022-01-29 23:43:37','2022-01-29 23:43:37','18340a38-d246-4c36-8d96-ad864d9c15cd'),
	(137,137,1,NULL,NULL,1,'2022-01-29 23:43:37','2022-01-29 23:43:37','83a5885b-61f4-47c3-9c73-9e1acde5ed80'),
	(138,138,1,NULL,NULL,1,'2022-01-29 23:43:37','2022-01-29 23:43:37','5cd84842-c6d6-464e-8ee3-c617ec799191'),
	(139,139,1,NULL,NULL,1,'2022-01-29 23:43:37','2022-01-29 23:43:37','8ce79854-1f17-4f35-93a4-b50c46eddd46'),
	(140,140,1,NULL,NULL,1,'2022-01-29 23:43:37','2022-01-29 23:43:37','267c8834-9a39-4ab6-8239-ae5982f8b771'),
	(149,149,1,NULL,NULL,1,'2022-01-30 21:42:10','2022-01-30 21:42:10','81b2ac87-f32d-498c-8254-29c640ada317'),
	(150,150,1,'homepage','__home__',1,'2022-01-30 21:42:10','2022-01-30 21:42:10','719a98cb-e008-4a45-80e5-4079d8ec6049'),
	(151,151,1,NULL,NULL,1,'2022-01-30 21:42:10','2022-01-30 21:42:10','b67bfa1d-b739-449e-a051-bc8fd270f78e'),
	(152,152,1,NULL,NULL,1,'2022-01-30 21:42:10','2022-01-30 21:42:10','6856c888-bab4-479e-80b5-9531445cd2f7'),
	(153,153,1,NULL,NULL,1,'2022-01-30 21:42:10','2022-01-30 21:42:10','2e54bc70-14b7-44e4-9da9-53b78d6cb1ae'),
	(154,154,1,NULL,NULL,1,'2022-01-30 21:42:10','2022-01-30 21:42:10','7907562a-924f-493d-9540-332cc55bbecc'),
	(155,155,1,NULL,NULL,1,'2022-01-30 21:42:10','2022-01-30 21:42:10','f3afa03f-cd87-4833-b734-a7d6a53a945f'),
	(156,156,1,NULL,NULL,1,'2022-01-30 21:42:10','2022-01-30 21:42:10','7ef1553e-8e43-47ae-90be-5ed83f20f92e'),
	(157,157,1,NULL,NULL,1,'2022-01-30 21:42:10','2022-01-30 21:42:10','010f6f3f-5eb9-43d9-b1f8-e33638283fe7'),
	(166,166,1,NULL,NULL,1,'2022-01-30 21:44:03','2022-01-30 21:44:03','722d9116-ef27-4865-b4a4-aa920391dab8'),
	(167,167,1,NULL,NULL,1,'2022-01-30 21:44:08','2022-01-30 21:44:08','0ffa96a4-2575-4027-8a37-79afe137ebfc'),
	(168,168,1,NULL,NULL,1,'2022-01-30 21:44:11','2022-01-30 21:44:11','922acc81-2e09-41b7-9200-2ae4e7e095be'),
	(169,169,1,NULL,NULL,1,'2022-01-30 21:44:15','2022-01-30 21:44:15','caeea675-0214-46e2-a286-e1201fca5ba4'),
	(170,170,1,NULL,NULL,1,'2022-01-30 21:44:17','2022-01-30 21:44:17','231546ca-7f77-44cf-acbb-989290fd350c'),
	(171,171,1,NULL,NULL,1,'2022-01-30 21:44:20','2022-01-30 21:44:20','26eb2c64-a00b-4f8a-9790-ced9eec61400'),
	(172,172,1,NULL,NULL,1,'2022-01-30 21:44:23','2022-01-30 21:44:23','b4dfc322-9d5d-4b42-a32b-6676f6bdf0dc'),
	(174,174,1,NULL,NULL,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','59b108ed-b724-4289-b61b-dab92b74af2a'),
	(175,175,1,'homepage','__home__',1,'2022-01-30 21:44:27','2022-01-30 21:44:27','6f0a313c-8a65-4ef3-9a90-292a2a01e501'),
	(176,176,1,NULL,NULL,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','6981f5eb-8b84-4c4c-a4f1-d7f4c49ee3da'),
	(177,177,1,NULL,NULL,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','d8e25547-dc1d-4b95-9b26-93da4f7a124e'),
	(178,178,1,NULL,NULL,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','ea755044-f7b3-447d-9897-ee47b5a26d34'),
	(179,179,1,NULL,NULL,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','669956ce-d023-4001-961a-b0b80f784d71'),
	(180,180,1,NULL,NULL,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','b1efc943-d394-47b3-aa92-d5f8d1194235'),
	(181,181,1,NULL,NULL,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','c7a32d3b-cf1d-4271-aaf4-72e36e06ad12'),
	(182,182,1,NULL,NULL,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','c1432ac8-f374-4867-a869-e0eaffed94b3'),
	(183,183,1,NULL,NULL,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','e43a640a-42e9-4fdc-a527-621049198900'),
	(193,193,1,'homepage','__home__',1,'2022-01-30 21:44:35','2022-01-30 21:44:35','04191ed7-c37a-45ab-9403-fa1da94edc6e'),
	(194,194,1,NULL,NULL,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','96b0d9fe-f345-4fad-82c3-1711373ffa25'),
	(195,195,1,NULL,NULL,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','fcff0cfb-6555-4e78-91d8-e4085388d1da'),
	(196,196,1,NULL,NULL,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','84052e95-7417-45fd-b51d-b57416077a04'),
	(197,197,1,NULL,NULL,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','504c2b65-406c-4db0-87ff-2def7e12b882'),
	(198,198,1,NULL,NULL,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','8e659e5a-a298-4335-828b-d103f1aa10fe'),
	(199,199,1,NULL,NULL,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','204dcf4f-3ffd-42fb-a66d-6be41ba152a1'),
	(200,200,1,NULL,NULL,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','c1f73b9d-6451-4e07-9769-1c9e1fb42450'),
	(201,201,1,NULL,NULL,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','22a2d9f8-558e-47ef-8b13-9c3325e8f74d'),
	(211,211,1,'homepage','__home__',1,'2022-01-30 21:45:09','2022-01-30 21:45:09','d3d87661-b9d5-4234-9e56-1dfd2843c04e'),
	(212,212,1,NULL,NULL,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','914241c2-cb1b-4f45-b00a-76ebc5ba2472'),
	(213,213,1,NULL,NULL,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','a05d0a35-1ebb-4aa8-b9f5-37d62b87464f'),
	(214,214,1,NULL,NULL,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','60b594f2-c076-44ca-9309-ee2e73dea8c0'),
	(215,215,1,NULL,NULL,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','21405f49-aada-41e3-b516-3c067aa9258f'),
	(216,216,1,NULL,NULL,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','2bbd8525-6c8d-4c8f-86c5-9d542e7ff3c9'),
	(217,217,1,NULL,NULL,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','27d80ca2-f848-4444-9707-026989c09a16'),
	(218,218,1,NULL,NULL,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','5ec4ceed-952f-4db7-b4d5-23c4e13a262a'),
	(219,219,1,NULL,NULL,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','d9a2d20e-0ca9-4347-92e0-d8d8f83797a1'),
	(229,229,1,NULL,NULL,1,'2022-01-30 21:45:17','2022-01-30 21:45:17','1cb6df97-43f7-48f8-9b1c-e8a6a34da59e'),
	(230,230,1,NULL,NULL,1,'2022-01-30 21:45:22','2022-01-30 21:45:22','ab4ed076-ff10-4126-97ef-eda842bdbcfe'),
	(231,231,1,NULL,NULL,1,'2022-01-30 21:45:24','2022-01-30 21:45:24','99f96f9a-b979-4a5b-9997-76d8f74c092a'),
	(232,232,1,NULL,NULL,1,'2022-01-30 21:45:32','2022-01-30 21:45:32','97731053-d720-442e-887f-a57856637d36'),
	(233,233,1,NULL,NULL,1,'2022-01-30 21:45:34','2022-01-30 21:45:34','10478c6a-2c27-4c91-b4d1-7ba58ec3ad77'),
	(234,234,1,NULL,NULL,1,'2022-01-30 21:45:41','2022-01-30 21:45:41','0efc5a5e-0c52-4760-a0c8-1a854ceec749'),
	(235,235,1,NULL,NULL,1,'2022-01-30 21:45:41','2022-01-30 21:45:41','cf20941f-c3cb-4ff0-8db9-bbf4c9ef5d11'),
	(236,236,1,NULL,NULL,1,'2022-01-30 21:45:43','2022-01-30 21:45:43','68235cf8-849d-4089-9cdc-11bfe7f95690'),
	(237,237,1,NULL,NULL,1,'2022-01-30 21:45:45','2022-01-30 21:45:45','1bfbb7c2-761e-4ffb-a1d1-084822916bc8'),
	(238,238,1,NULL,NULL,1,'2022-01-30 21:45:46','2022-01-30 21:45:46','b161dc21-90e1-444e-b7bb-e2023406fed1'),
	(239,239,1,NULL,NULL,1,'2022-01-30 21:45:47','2022-01-30 21:45:47','5f9cba0a-3833-4c3c-bacc-bf2cabd68dc3'),
	(240,240,1,NULL,NULL,1,'2022-01-30 21:45:49','2022-01-30 21:45:49','aac2c8af-efcf-416a-affb-89dbb0457fd2'),
	(242,242,1,NULL,NULL,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','eba998d7-ebb8-4313-8e63-f6de415f67ee'),
	(243,243,1,'homepage','__home__',1,'2022-01-30 21:45:54','2022-01-30 21:45:54','e28c253a-69b6-4b26-b73f-d5c5f87f6335'),
	(244,244,1,NULL,NULL,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','cb309cff-a1e7-40b1-b8f6-18d051505e83'),
	(245,245,1,NULL,NULL,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','67bbdcd9-3e81-4f1b-af5b-b79abc19e524'),
	(246,246,1,NULL,NULL,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','6776f340-538f-45e5-982f-594d77d52b72'),
	(247,247,1,NULL,NULL,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','eb4c88e8-89e1-47d3-9411-c222678dff7b'),
	(248,248,1,NULL,NULL,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','a4140b88-7270-4a2d-9867-d11619b70bf2'),
	(249,249,1,NULL,NULL,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','d33b8d3f-a86d-4aa3-aeaf-c3b55e1a9cd2'),
	(250,250,1,NULL,NULL,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','6fac08de-688f-43fd-85cf-de678f5322ca'),
	(251,251,1,NULL,NULL,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','96e92686-c7b2-4892-a48f-3cfa27443bc9'),
	(252,252,1,NULL,NULL,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','2ebd0c49-a43a-41db-8ac8-dbb5d86c6008'),
	(263,263,1,'homepage','__home__',1,'2022-01-30 22:18:35','2022-01-30 22:18:35','5bfeae29-4178-4141-8cc8-0fe358944119'),
	(264,264,1,NULL,NULL,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','0b7df6d4-0a1b-4f34-9762-65436e7867e8'),
	(265,265,1,NULL,NULL,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','ce1a7aa7-b964-4e6f-8687-6d01a076514f'),
	(266,266,1,NULL,NULL,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','adbadebf-3808-455e-b884-4117206b0999'),
	(267,267,1,NULL,NULL,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','9fc62f6d-7ac0-44f9-8b9d-45db7ef920e4'),
	(268,268,1,NULL,NULL,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','bcf09d21-2c7b-4c85-a986-712e547a1380'),
	(269,269,1,NULL,NULL,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','bf17ba07-e455-4d42-be12-7175e6da7956'),
	(270,270,1,NULL,NULL,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','898d61da-f360-436e-a91d-06b2b22d18f5'),
	(271,271,1,NULL,NULL,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','894068a4-b549-4a27-adf9-650fdf86be23'),
	(272,272,1,NULL,NULL,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','7a69c42f-a23d-4ae4-9226-c60128b88424'),
	(283,283,1,NULL,NULL,1,'2022-01-30 22:27:16','2022-01-30 22:27:16','ea38db43-874c-42dc-9d40-c394e1a70c3a'),
	(284,284,1,NULL,NULL,1,'2022-01-30 22:33:20','2022-01-30 22:33:20','79c96fe0-fa16-476a-812b-430540c74daa'),
	(285,285,1,NULL,NULL,1,'2022-01-30 22:33:21','2022-01-30 22:33:21','c991ee74-4063-4bc3-952d-931d6d50bfb2'),
	(286,286,1,'homepage','__home__',1,'2022-01-30 22:33:43','2022-01-30 22:33:43','d8a39a6a-635b-4acf-98f5-f22395cbed6f'),
	(287,287,1,NULL,NULL,1,'2022-01-30 22:33:43','2022-01-30 22:33:43','0f517520-bbb7-4e46-864e-b89cb1760ad3'),
	(288,288,1,NULL,NULL,1,'2022-01-30 22:33:43','2022-01-30 22:33:43','5baf1986-f547-418a-95e4-6ac4bcdd7e82'),
	(289,289,1,NULL,NULL,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','e8bb8617-0431-4b16-aaad-07528e3ebbe2'),
	(290,290,1,NULL,NULL,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','d4a95902-43bb-45fc-8178-24d660cf2ba1'),
	(291,291,1,NULL,NULL,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','d5303a7b-b6b6-4913-b4f5-ebbd7b6be0bd'),
	(292,292,1,NULL,NULL,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','11b13c4b-d9b1-4d61-8953-cb11ec7af2f9'),
	(293,293,1,NULL,NULL,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','4e110642-86e0-4d5b-a8f7-dee5e62b3f20'),
	(294,294,1,NULL,NULL,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','a718e972-e0ef-4e73-8445-ac6e5c15fd2f'),
	(295,295,1,NULL,NULL,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','1f3bd1e0-d7a9-4940-8d38-4ee25e4e2426'),
	(306,306,1,'homepage','__home__',1,'2022-01-30 22:40:10','2022-01-30 22:40:10','30b227f6-4d8e-45f0-95e1-7cb308c1f4b7'),
	(307,307,1,NULL,NULL,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','ec7c989e-53e1-4f51-991d-8bb658768618'),
	(308,308,1,NULL,NULL,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','6a2b6e97-6cd5-4719-98cd-f18732d2456e'),
	(309,309,1,NULL,NULL,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','d0fe14b6-1c66-4182-8b4f-74c7c9ac1e34'),
	(310,310,1,NULL,NULL,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','7285bc8a-5676-41c8-a6dc-eb2c5a7b9c28'),
	(311,311,1,NULL,NULL,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','103175f1-1ad9-4a52-acb4-39cfa6260cae'),
	(312,312,1,NULL,NULL,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','4e13d647-b954-412b-a63f-24e8d3ef1027'),
	(313,313,1,NULL,NULL,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','62ac7661-f687-4cf4-b5b2-df7aac719160'),
	(314,314,1,NULL,NULL,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','128276d3-ef10-4c53-90c6-1bf6306ea638'),
	(315,315,1,NULL,NULL,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','5359be56-e8b2-4215-9d77-3d1632f9de96');

/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entries`;

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bqgqgzrqjveibhtbgmdipxoptwlxbyrunenv` (`postDate`),
  KEY `idx_xovxkcvqmgfnmmvpjrwyamidwwupmtafdpka` (`expiryDate`),
  KEY `idx_eotxenuvqjsjrayvjmfbqgkjgwyypijdmfvj` (`authorId`),
  KEY `idx_qzvjpiekqhvzkuxrjguwszbmkpldselscrlx` (`sectionId`),
  KEY `idx_onvgqcvrudiozujqzwhbwqhfcytelyswaavk` (`typeId`),
  KEY `fk_eyldsgjdfkiknprabncejdsojymqzrxjhhii` (`parentId`),
  CONSTRAINT `fk_bmoveooguhfwvbtjsjstqpkhelzpurgvemim` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_eyldsgjdfkiknprabncejdsojymqzrxjhhii` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_frxcpofufmnmkrfkeledseagruhxmyugjswt` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gppycgddooaaimxlnfnfvkfmmtcyydcxlgyv` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hckeglecvaluvozmxqiyuosqrhbufiasejmp` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,1,NULL,1,NULL,'2022-01-29 20:39:00',NULL,NULL,'2022-01-29 20:39:48','2022-01-29 20:39:48','569bc57f-c558-47db-8866-46f5aad7e5f2'),
	(3,1,NULL,1,NULL,'2022-01-29 20:39:00',NULL,NULL,'2022-01-29 20:39:48','2022-01-29 20:39:48','372679de-474d-4f59-907a-6531975bd3e5'),
	(4,1,NULL,1,NULL,'2022-01-29 20:39:00',NULL,NULL,'2022-01-29 20:51:32','2022-01-29 20:51:32','7f0b63ce-03c8-4dcf-bfd3-de8c146f0b8d'),
	(37,1,NULL,1,NULL,'2022-01-29 20:39:00',NULL,NULL,'2022-01-29 20:54:31','2022-01-29 20:54:31','de53f48f-7690-446d-8466-9296d7f453a5'),
	(41,2,NULL,2,1,'2022-01-29 20:58:00',NULL,NULL,'2022-01-29 20:58:15','2022-01-29 20:58:15','327b9f51-2233-41dd-9455-13c5a993d572'),
	(43,2,NULL,2,1,'2022-01-29 20:58:00',NULL,NULL,'2022-01-29 20:58:38','2022-01-29 20:58:38','fa2651cf-5f33-4b08-90a1-4e0de1d2ba30'),
	(44,2,NULL,2,1,'2022-01-29 20:58:00',NULL,NULL,'2022-01-29 20:58:39','2022-01-29 20:58:39','1da40932-2728-4fef-a6e0-970892c7397c'),
	(46,2,NULL,2,1,'2022-01-29 20:58:00',NULL,NULL,'2022-01-29 20:58:57','2022-01-29 20:58:57','bf4b3e14-1bbe-42e8-85e5-4ea760d73e2e'),
	(47,2,NULL,2,1,'2022-01-29 20:58:00',NULL,NULL,'2022-01-29 20:58:57','2022-01-29 20:58:57','074c4121-5617-4ff4-991d-dcfa11589b86'),
	(49,2,NULL,2,1,'2022-01-29 20:58:00',NULL,NULL,'2022-01-29 20:59:11','2022-01-29 20:59:11','fdfc22ff-92bb-4d7a-8abb-c41e4a436de8'),
	(67,1,NULL,1,NULL,'2022-01-29 20:39:00',NULL,NULL,'2022-01-29 21:00:10','2022-01-29 21:00:10','a3e1949e-21db-415b-8e3c-36d76595468e'),
	(80,1,NULL,1,NULL,'2022-01-29 20:39:00',NULL,NULL,'2022-01-29 21:01:00','2022-01-29 21:01:00','0afa857b-748c-436f-8036-b333da0da25c'),
	(92,1,NULL,1,NULL,'2022-01-29 20:39:00',NULL,NULL,'2022-01-29 23:25:44','2022-01-29 23:25:44','c2305b70-2616-4dbf-938c-924093de9d0d'),
	(106,1,NULL,1,NULL,'2022-01-29 20:39:00',NULL,NULL,'2022-01-29 23:33:15','2022-01-29 23:33:15','f30bc5bf-925f-47cf-a487-e2f0f46342d6'),
	(120,1,NULL,1,NULL,'2022-01-29 20:39:00',NULL,NULL,'2022-01-29 23:34:58','2022-01-29 23:34:58','c32e6f6b-958c-4b6f-8338-cd859fb2ec8b'),
	(134,1,NULL,1,NULL,'2022-01-29 20:39:00',NULL,NULL,'2022-01-29 23:43:37','2022-01-29 23:43:37','581a4714-0a8d-4bc6-a62f-aa6eefc164eb'),
	(150,1,NULL,1,NULL,'2022-01-29 20:39:00',NULL,NULL,'2022-01-30 21:42:10','2022-01-30 21:42:10','f5fe5bbc-fff7-49f4-926e-214bafbc09e6'),
	(175,1,NULL,1,NULL,'2022-01-29 20:39:00',NULL,NULL,'2022-01-30 21:44:27','2022-01-30 21:44:27','8fffc922-b8fe-481b-a477-fd2dece571a0'),
	(193,1,NULL,1,NULL,'2022-01-29 20:39:00',NULL,NULL,'2022-01-30 21:44:35','2022-01-30 21:44:35','34d0bd28-3307-418d-9e55-ffefc0d7778f'),
	(211,1,NULL,1,NULL,'2022-01-29 20:39:00',NULL,NULL,'2022-01-30 21:45:09','2022-01-30 21:45:09','c7e13c6b-2842-4eba-92da-e3fb7afeb579'),
	(243,1,NULL,1,NULL,'2022-01-29 20:39:00',NULL,NULL,'2022-01-30 21:45:54','2022-01-30 21:45:54','26c2973e-c825-469d-ae9c-ceb212bc4adb'),
	(263,1,NULL,1,NULL,'2022-01-29 20:39:00',NULL,NULL,'2022-01-30 22:18:35','2022-01-30 22:18:35','96e79826-9a54-4c47-83b7-58beb2228f4d'),
	(286,1,NULL,1,NULL,'2022-01-29 20:39:00',NULL,NULL,'2022-01-30 22:33:43','2022-01-30 22:33:43','af8e3b1b-e852-4a9c-9c42-2bc4a1d0af87'),
	(306,1,NULL,1,NULL,'2022-01-29 20:39:00',NULL,NULL,'2022-01-30 22:40:10','2022-01-30 22:40:10','b4b764cb-ba6a-4ebd-b347-2c0475005fc6');

/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entrytypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entrytypes`;

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gzcdigfytmtvenpccqhitxdhuuqrwnmbbyef` (`name`,`sectionId`),
  KEY `idx_rkfkdnrrzhfyrqvamkumyawflidrtfneifuz` (`handle`,`sectionId`),
  KEY `idx_kzxohmnxmyyoeehoaeqccdmherdlyelpnhqs` (`sectionId`),
  KEY `idx_kimldhblkymktfuykphzkpdcwhyvtbuuxksj` (`fieldLayoutId`),
  KEY `idx_ehihzcawnijutybqihvvjxfkxujmrqutyvqp` (`dateDeleted`),
  CONSTRAINT `fk_nbnxeecmbbikymrechkaevetrnydpvmogsyd` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yzhzsrklrfrfnhsbioqftsbjynvkumqnqqjh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,1,'Homepage','homepage',0,'site',NULL,'{section.name|raw}',1,'2022-01-29 20:39:48','2022-01-29 20:39:48',NULL,'b5da51f5-d9b1-4ed1-8780-9c80c659891a'),
	(2,2,8,'Default','default',1,'site',NULL,NULL,1,'2022-01-29 20:55:17','2022-01-29 20:55:17',NULL,'784f2565-57bc-455f-9ff9-484ca800e333'),
	(3,3,11,'Default','default',1,'site',NULL,NULL,1,'2022-01-30 21:35:37','2022-01-30 21:35:37','2022-01-30 22:51:47','20f847c3-1373-4b10-83e5-dd67c21dede9');

/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldgroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldgroups`;

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gmwnyrahissfujqjvpdcixlybtyvmnwoehmo` (`name`),
  KEY `idx_mamxvwgyauzxuqmircwdwlxcvmykibsmrzkq` (`dateDeleted`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'Common','2022-01-29 20:36:14','2022-01-29 20:36:14',NULL,'d3ff529d-f0b8-4b6d-a8a6-987dd86d4e24'),
	(2,'Card','2022-01-29 20:55:24','2022-01-29 20:55:28',NULL,'d4e3d852-e984-4784-af34-69145961849c');

/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayoutfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayoutfields`;

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kzomjngxdideletpprhecxvofdktpxfmqeqs` (`layoutId`,`fieldId`),
  KEY `idx_utbmzgjfiljbsgckkvjzpffwkyouhetqxxye` (`sortOrder`),
  KEY `idx_bdnnvqdnnsfbfgzfhxezbbqqnetkllmeshlh` (`tabId`),
  KEY `idx_mkvwsubwcferrrzbitbjrirkwyswobitcbqj` (`fieldId`),
  CONSTRAINT `fk_civwsxsvagltyuhtjymjlkjdtmiyqhtopoao` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_itrbfenfiaualgbuqondgqzhwgyixjmslzkp` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nrslgaqxycxhialaiemwxblnyzxibqxggftb` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(44,1,16,1,0,1,'2022-01-29 20:51:32','2022-01-29 20:51:32','22381a1e-2990-474b-97a0-6a73caf171ef'),
	(260,6,94,14,1,0,'2022-01-30 22:51:37','2022-01-30 22:51:37','61525398-c723-43b3-bc19-93cce9307c27'),
	(261,6,94,16,1,1,'2022-01-30 22:51:37','2022-01-30 22:51:37','e464369c-0caf-495b-ab36-7d02e29d6238'),
	(262,6,94,15,0,2,'2022-01-30 22:51:37','2022-01-30 22:51:37','e386ce17-4ef0-42cd-a86c-9a9a21a01603'),
	(263,6,94,13,0,3,'2022-01-30 22:51:37','2022-01-30 22:51:37','f9d9d925-d662-414d-bea2-106e8e559c4f'),
	(264,7,95,18,0,0,'2022-01-30 22:51:37','2022-01-30 22:51:37','4f82c551-0052-49bf-a8b5-32edb39a79df'),
	(265,7,95,17,0,1,'2022-01-30 22:51:37','2022-01-30 22:51:37','9794e5e1-8ae0-42ef-a89f-41706680c9e2'),
	(266,12,96,26,1,0,'2022-01-30 22:51:38','2022-01-30 22:51:38','cf450130-6ee0-420b-91e8-eb06dd82ce94'),
	(267,12,96,29,0,1,'2022-01-30 22:51:38','2022-01-30 22:51:38','d148f0ba-f9a6-4cd9-a3d2-987f87526d32'),
	(268,12,96,25,1,2,'2022-01-30 22:51:38','2022-01-30 22:51:38','974ac1e3-8e19-44e4-80a0-38590cd47e13'),
	(269,12,96,27,0,3,'2022-01-30 22:51:38','2022-01-30 22:51:38','c67c190b-a9fd-4db3-8c56-6c3dcfe6e035'),
	(270,12,96,28,0,4,'2022-01-30 22:51:38','2022-01-30 22:51:38','d066a1b7-de67-473e-9edb-0bf3edad8c81'),
	(271,2,97,24,0,0,'2022-01-30 22:51:38','2022-01-30 22:51:38','8ebd09ea-7d93-4faf-bc17-cad160fa0df5'),
	(272,4,98,7,0,0,'2022-01-30 22:51:38','2022-01-30 22:51:38','9742954b-ab11-49cd-bcbb-cc69a3f14079'),
	(273,4,98,6,0,1,'2022-01-30 22:51:38','2022-01-30 22:51:38','d9dda76e-f3d9-4f4d-a1b4-b5124ac9aeb7'),
	(274,4,98,8,0,2,'2022-01-30 22:51:38','2022-01-30 22:51:38','c084f8fd-d96b-44a1-99ba-6bbc339a35fe'),
	(275,5,99,11,1,0,'2022-01-30 22:51:38','2022-01-30 22:51:38','7f4a78c3-8024-4c3f-9d6d-8692a3334fe9'),
	(276,10,100,22,0,0,'2022-01-30 22:51:38','2022-01-30 22:51:38','460e801b-78a2-415d-b8d5-cc6c5272a23a'),
	(277,8,101,19,1,1,'2022-01-30 22:52:06','2022-01-30 22:52:06','f0ca30db-1eb9-4b5a-a312-9bca24cdb83e'),
	(278,8,101,20,0,2,'2022-01-30 22:52:06','2022-01-30 22:52:06','d67aa491-6984-4ff2-b376-0e452a4e46eb'),
	(279,8,101,21,0,3,'2022-01-30 22:52:06','2022-01-30 22:52:06','38c8d871-7beb-4b31-8a23-a6aa8209acac');

/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayouts`;

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uidctyklzvmwzothzmqmctzqvlktmdbomknb` (`dateDeleted`),
  KEY `idx_pnqintpymttlhtnlnvswlbqouyyrtxwpxjzr` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'craft\\elements\\Entry','2022-01-29 20:39:48','2022-01-29 20:39:48',NULL,'0dd5e6d4-bd13-4973-8864-c1be99307e39'),
	(2,'craft\\elements\\MatrixBlock','2022-01-29 20:41:18','2022-01-29 20:41:18',NULL,'5484cb0a-57c0-4bd6-8964-329c7a8d8e29'),
	(3,'craft\\elements\\Asset','2022-01-29 20:46:56','2022-01-29 20:46:56',NULL,'a4e559fd-26cd-4ea8-8173-1221b6746273'),
	(4,'craft\\elements\\MatrixBlock','2022-01-29 20:48:00','2022-01-29 20:48:00',NULL,'e53a97aa-7416-4253-8ce0-b01584d7ca4a'),
	(5,'craft\\elements\\MatrixBlock','2022-01-29 20:49:29','2022-01-29 20:49:29',NULL,'aaa50586-018e-475a-87a8-189e0e97c502'),
	(6,'craft\\elements\\MatrixBlock','2022-01-29 20:51:20','2022-01-29 20:51:20',NULL,'ddb66937-0cd3-44ba-a72e-274e7de06b57'),
	(7,'craft\\elements\\MatrixBlock','2022-01-29 20:51:20','2022-01-29 20:51:20',NULL,'010096f1-9026-4c4a-adf0-c09ab46f4cc7'),
	(8,'craft\\elements\\Entry','2022-01-29 20:55:17','2022-01-29 20:55:17',NULL,'60fb108f-06e5-45d2-abd7-7e0b411cdea1'),
	(9,'craft\\elements\\Asset','2022-01-29 20:56:12','2022-01-29 20:56:12',NULL,'cc8cbc34-5a34-48cc-9964-bfd0663cace2'),
	(10,'craft\\elements\\MatrixBlock','2022-01-29 23:34:19','2022-01-29 23:34:19',NULL,'9748c455-33cf-4c29-b8f7-7e8a0710587a'),
	(11,'craft\\elements\\Entry','2022-01-30 21:35:37','2022-01-30 21:35:37','2022-01-30 22:51:47','18009f52-54ad-48a2-995b-177728672525'),
	(12,'verbb\\supertable\\elements\\SuperTableBlockElement','2022-01-30 21:40:41','2022-01-30 21:40:41',NULL,'6725325b-19b6-49b8-8057-7ff5378bf2a9');

/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayouttabs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayouttabs`;

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qsqjlhzxpdnlnyfwwnibkovmnhclekirqqro` (`sortOrder`),
  KEY `idx_lgoaipepwbqhqtlavrjwyamhxlsxhfpaikto` (`layoutId`),
  CONSTRAINT `fk_rcgoxdenmavfifdhtncxgjsilibayjcigqqo` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(10,3,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2022-01-29 20:49:58','2022-01-29 20:49:58','58229179-1934-4ab1-bc3c-3e9e696291f3'),
	(16,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"86f51cdf-0594-49d7-88cd-8cf8daddfd02\"}]',1,'2022-01-29 20:51:32','2022-01-29 20:51:32','665fbfc2-d5c5-48ff-965b-33e556d99fdf'),
	(23,9,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2022-01-29 20:56:12','2022-01-29 20:56:12','1c149139-6c45-4c84-8c3e-17ab512959b7'),
	(58,11,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2022-01-30 21:35:37','2022-01-30 21:35:37','3bd63309-dc27-41b0-893a-4c9877166e6c'),
	(94,6,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"388af34e-6bb7-471c-a169-42bbf595ebd2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"f7946b18-b82b-45f0-8a76-efdba41894bd\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d0a3a7bc-42c3-4290-832c-467cade4d237\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1bd75347-c828-488f-8b65-2b5ece47b5e1\"}]',1,'2022-01-30 22:51:37','2022-01-30 22:51:37','10a17511-ef73-4512-b9f6-7c4c5f5d703a'),
	(95,7,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"348dbe41-4699-43c4-aa30-5a9e894bb750\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5c506142-7e92-44a4-80d4-e3141c44deb1\"}]',1,'2022-01-30 22:51:37','2022-01-30 22:51:37','730e72e5-f2b0-420b-a148-9f00341e4c0c'),
	(96,12,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"98ce7158-cb01-4c67-a1c6-0ef140775fb1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"298ac298-c6d5-46d3-837b-f992d3053ecf\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"61f629b2-0417-448a-8350-aff0bac1ec3b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"b9f2742e-ae14-4113-a183-6bd3de2cf384\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f5c321e4-4cc3-457e-ab1a-610791af7d11\"}]',1,'2022-01-30 22:51:38','2022-01-30 22:51:38','33ed622b-87c7-4d80-872c-4c24c227ee55'),
	(97,2,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"b41264ca-8671-443b-876c-ca52160072e9\"}]',1,'2022-01-30 22:51:38','2022-01-30 22:51:38','d0aa8222-1bf7-478b-92c3-af63d19dabae'),
	(98,4,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"702d9892-92f3-4ebd-92eb-d3ce59d96b2d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"8bab4a25-1ca5-43a3-946f-7eb03bcd5d36\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"784f0689-cbe8-44df-97a8-b2b7edb9d2f9\"}]',1,'2022-01-30 22:51:38','2022-01-30 22:51:38','51b91823-eea4-4819-8987-96c8cbccc65d'),
	(99,5,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"9983f131-2c73-48e5-a123-879d42e1be5d\"}]',1,'2022-01-30 22:51:38','2022-01-30 22:51:38','7a67a204-03a5-47de-9b1c-4be9244241da'),
	(100,10,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"22443ea1-187e-49b2-84c4-90598d169bf5\"}]',1,'2022-01-30 22:51:38','2022-01-30 22:51:38','db75a992-db62-4e14-9505-c0bdfac583a5'),
	(101,8,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":\"\",\"instructions\":\"\",\"tip\":null,\"warning\":null,\"required\":\"1\",\"width\":100,\"fieldUid\":\"fe126841-dabc-4168-8e73-d14cf3293ebf\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"badbce7d-5fea-44f2-871f-66b5597ee650\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"a14102a0-5269-4c9f-a971-5a3063a568d9\"}]',1,'2022-01-30 22:52:06','2022-01-30 22:52:06','e7479286-df99-47e0-ada5-7fe5cd917209');

/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fields`;

CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xsadribzimpfmyaxisxlwboryxjnvwiwhplj` (`handle`,`context`),
  KEY `idx_tmgzxqbtjwlnlitzfwpczfqgasqnbwxzhkcm` (`groupId`),
  KEY `idx_bbxanczdzfikhvgucscvaricvheboendmnvc` (`context`),
  CONSTRAINT `fk_sqfuibnyouomprrjklstvjzlxjqhmibgxsqu` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'Components','components','global',NULL,'',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_components}}\",\"maxBlocks\":\"\",\"minBlocks\":\"1\",\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2022-01-29 20:41:18','2022-01-30 22:51:37','86f51cdf-0594-49d7-88cd-8cf8daddfd02'),
	(6,NULL,'Copy','copy','matrixBlockType:c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4',NULL,'',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"Simple.json\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2022-01-29 20:48:00','2022-01-29 20:58:10','8bab4a25-1ca5-43a3-946f-7eb03bcd5d36'),
	(7,NULL,'Heading','heading','matrixBlockType:c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4',NULL,'',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-01-29 20:48:00','2022-01-29 20:49:28','702d9892-92f3-4ebd-92eb-d3ce59d96b2d'),
	(8,NULL,'Button','button','matrixBlockType:c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4',NULL,'',0,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a row\",\"columnType\":\"text\",\"columns\":{\"col1\":{\"heading\":\"Text\",\"handle\":\"text\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Link\",\"handle\":\"link\",\"width\":\"\",\"type\":\"singleline\"}},\"maxRows\":\"1\",\"minRows\":\"\"}','2022-01-29 20:48:00','2022-01-29 20:54:55','784f0689-cbe8-44df-97a8-b2b7edb9d2f9'),
	(11,NULL,'Entries','entries','matrixBlockType:8ccccc07-e07b-4c7e-8056-68a3a2a564d8',NULL,'',0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"limit\":\"3\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":null,\"sources\":[\"section:56b811ad-a1bd-49ec-913d-1fe0a0e4ad46\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2022-01-29 20:49:29','2022-01-29 20:58:11','9983f131-2c73-48e5-a123-879d42e1be5d'),
	(13,NULL,'Button','button','matrixBlockType:f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7',NULL,'',0,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a row\",\"columnType\":\"text\",\"columns\":{\"col1\":{\"heading\":\"Text\",\"handle\":\"text\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Link\",\"handle\":\"link\",\"width\":\"\",\"type\":\"singleline\"}},\"maxRows\":\"1\",\"minRows\":\"\"}','2022-01-29 20:51:20','2022-01-29 20:54:56','1bd75347-c828-488f-8b65-2b5ece47b5e1'),
	(14,NULL,'Image','image','matrixBlockType:f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7',NULL,'',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5\",\"singleUploadLocationSubpath\":\"copy-with-image\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":true,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2022-01-29 20:51:20','2022-01-29 21:00:36','388af34e-6bb7-471c-a169-42bbf595ebd2'),
	(15,NULL,'Copy','copy','matrixBlockType:f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7',NULL,'',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"Simple.json\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2022-01-29 20:51:20','2022-01-29 20:58:11','d0a3a7bc-42c3-4290-832c-467cade4d237'),
	(16,NULL,'Heading','heading','matrixBlockType:f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7',NULL,'',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-01-29 20:51:20','2022-01-29 20:54:56','f7946b18-b82b-45f0-8a76-efdba41894bd'),
	(17,NULL,'Abstract','abstract','matrixBlockType:ed04d794-983e-4ce4-acd7-d9f624be015b',NULL,'',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-01-29 20:51:20','2022-01-29 20:54:56','5c506142-7e92-44a4-80d4-e3141c44deb1'),
	(18,NULL,'Heading','heading','matrixBlockType:ed04d794-983e-4ce4-acd7-d9f624be015b',NULL,'',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-01-29 20:51:20','2022-01-29 20:54:56','348dbe41-4699-43c4-aa30-5a9e894bb750'),
	(19,2,'Thumbnail','cardThumbnail','global',NULL,'',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":true,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2022-01-29 20:55:47','2022-01-29 20:59:25','fe126841-dabc-4168-8e73-d14cf3293ebf'),
	(20,2,'Abstract','cardAbstract','global','pviifqql','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-01-29 20:56:42','2022-01-29 20:56:42','badbce7d-5fea-44f2-871f-66b5597ee650'),
	(21,2,'Button','cardButton','global','yivhlchv','',0,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a row\",\"columnType\":\"text\",\"columns\":{\"col1\":{\"heading\":\"Text\",\"handle\":\"text\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Link\",\"handle\":\"link\",\"width\":\"\",\"type\":\"singleline\"}},\"maxRows\":\"1\",\"minRows\":\"\"}','2022-01-29 20:57:05','2022-01-29 20:57:05','a14102a0-5269-4c9f-a971-5a3063a568d9'),
	(22,NULL,'Heading','heading','matrixBlockType:b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121',NULL,'',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-01-29 23:34:19','2022-01-29 23:35:56','22443ea1-187e-49b2-84c4-90598d169bf5'),
	(24,NULL,'Slides','slides','matrixBlockType:503608ce-5321-4dcc-b1a4-68d5b8f0fbcf',NULL,'',0,'site',NULL,'verbb\\supertable\\fields\\SuperTableField','{\"columns\":{\"98ce7158-cb01-4c67-a1c6-0ef140775fb1\":{\"width\":\"\"},\"298ac298-c6d5-46d3-837b-f992d3053ecf\":{\"width\":\"\"},\"61f629b2-0417-448a-8350-aff0bac1ec3b\":{\"width\":\"\"},\"b9f2742e-ae14-4113-a183-6bd3de2cf384\":{\"width\":\"\"},\"f5c321e4-4cc3-457e-ab1a-610791af7d11\":{\"width\":\"\"}},\"contentTable\":\"{{%stc_1_slides}}\",\"fieldLayout\":\"matrix\",\"maxRows\":\"\",\"minRows\":\"\",\"placeholderKey\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"selectionLabel\":\"\",\"staticField\":\"\"}','2022-01-30 21:40:41','2022-01-30 21:51:59','b41264ca-8671-443b-876c-ca52160072e9'),
	(25,NULL,'Heading','heading','superTableBlockType:9bc45838-e825-42a4-86cd-a368de3ba8b8',NULL,'',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-01-30 21:40:41','2022-01-30 21:41:55','61f629b2-0417-448a-8350-aff0bac1ec3b'),
	(26,NULL,'Point','point','superTableBlockType:9bc45838-e825-42a4-86cd-a368de3ba8b8',NULL,'',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-01-30 21:40:41','2022-01-30 21:41:55','98ce7158-cb01-4c67-a1c6-0ef140775fb1'),
	(27,NULL,'Copy','copy','superTableBlockType:9bc45838-e825-42a4-86cd-a368de3ba8b8',NULL,'',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"Simple.json\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2022-01-30 21:40:41','2022-01-30 21:43:27','b9f2742e-ae14-4113-a183-6bd3de2cf384'),
	(28,NULL,'Button','button','superTableBlockType:9bc45838-e825-42a4-86cd-a368de3ba8b8',NULL,'',0,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a row\",\"columnType\":\"text\",\"columns\":{\"col1\":{\"heading\":\"Text\",\"handle\":\"text\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Link\",\"handle\":\"link\",\"width\":\"\",\"type\":\"singleline\"}},\"maxRows\":\"1\",\"minRows\":\"\"}','2022-01-30 21:41:56','2022-01-30 21:46:33','f5c321e4-4cc3-457e-ab1a-610791af7d11'),
	(29,NULL,'Image','image','superTableBlockType:9bc45838-e825-42a4-86cd-a368de3ba8b8',NULL,'',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5\",\"singleUploadLocationSubpath\":\"hero\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":true,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2022-01-30 21:43:27','2022-01-30 21:46:33','298ac298-c6d5-46d3-837b-f992d3053ecf');

/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table globalsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `globalsets`;

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_thfyicuthqgwhbbiwayhlrgtogwpfnrdapzt` (`name`),
  KEY `idx_qkmokfqtlkbglwqrdpausyxoyefaxoaepolk` (`handle`),
  KEY `idx_dnvajatfjmwynngdybhymspwkdigdssozvrd` (`fieldLayoutId`),
  KEY `idx_zrlsgohorgmjepilbdzbbhcubjwjtcpffqqv` (`sortOrder`),
  CONSTRAINT `fk_rctbfcvojkhieqfyfzqqlvabhgfwrjpxkqjp` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zmqzuqkvoaqzrryeusckumrsqtyvwoinpsuc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table gqlschemas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gqlschemas`;

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;

INSERT INTO `gqlschemas` (`id`, `name`, `scope`, `isPublic`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Public Schema','[\"sections.56b811ad-a1bd-49ec-913d-1fe0a0e4ad46:read\",\"entrytypes.784f2565-57bc-455f-9ff9-484ca800e333:read\",\"sections.ed6307e6-38a4-472d-b6bd-609ec660cec3:read\",\"entrytypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a:read\",\"volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5:read\",\"volumes.00ba4136-4522-4595-918d-d5c47a106881:read\"]',1,'2022-01-29 21:01:15','2022-01-29 21:01:36','cb8562a1-d98c-4f8f-ab71-138ec54875d1'),
	(2,'Verse Schema','[\"sections.56b811ad-a1bd-49ec-913d-1fe0a0e4ad46:read\",\"entrytypes.784f2565-57bc-455f-9ff9-484ca800e333:read\",\"sections.ed6307e6-38a4-472d-b6bd-609ec660cec3:read\",\"entrytypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a:read\",\"volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5:read\",\"volumes.00ba4136-4522-4595-918d-d5c47a106881:read\"]',0,'2022-02-01 09:22:54','2022-02-01 09:22:54','268674e8-5a06-4a63-9604-27e45158a894');

/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gqltokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gqltokens`;

CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_eljixifcnhutlrnjzctgeiqryprfdlpwutml` (`accessToken`),
  UNIQUE KEY `idx_mawzjcorljqsseivwwgykofagynwxjvabcdw` (`name`),
  KEY `fk_hpilgrctjuglboivqiujrpzspibtddevraon` (`schemaId`),
  CONSTRAINT `fk_hpilgrctjuglboivqiujrpzspibtddevraon` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;

INSERT INTO `gqltokens` (`id`, `name`, `accessToken`, `enabled`, `expiryDate`, `lastUsed`, `schemaId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Public Token','__PUBLIC__',1,NULL,NULL,1,'2022-01-29 21:01:15','2022-01-29 21:01:15','70af5216-5a70-4e78-9334-85f7ef59a11c'),
	(2,'Verse Token','HnbNZZqLcTvlXmV1tFQWH44jHV96zR9u',1,NULL,NULL,2,'2022-02-01 09:20:37','2022-02-01 09:24:02','955bb496-afc0-4e0d-91d5-8524e6f87fee');

/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `info`;

CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'3.7.30.1','3.7.8',0,'jcdpobbkqnkt','2@vlkcrxypch','2022-01-29 20:36:13','2022-02-01 09:24:07','e9454be7-c215-498e-92be-44bdf7fb8f9e');

/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table matrixblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixblocks`;

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gupyhdhtgxcvsmdxqutpteualdemfwodurar` (`ownerId`),
  KEY `idx_rqzigyutglmriskvirhixokfdzlcskcatndx` (`fieldId`),
  KEY `idx_ezpheeputrbbtfingoozooejhrosqrebqane` (`typeId`),
  KEY `idx_wshsilcnnlmmrcqzifxquerizdmqgznpbqfh` (`sortOrder`),
  CONSTRAINT `fk_gnuajzibwqqbycnisjzdfqrqhxzpxixjksvc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pbtljylisqqpoqnjhkppemkiikqsrudspbxk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ycmxedeleihpjzjyvuwtvbaslpmzlulbjdtt` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ylqxtyhkmtmmbiqeldelmskdvknevwisfjtt` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;

INSERT INTO `matrixblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `deletedWithOwner`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(34,2,1,1,1,NULL,'2022-01-29 20:54:31','2022-01-29 20:54:31','b7c2d7fc-e649-4535-8966-70ce6116e3ce'),
	(35,2,1,2,2,NULL,'2022-01-29 20:54:31','2022-01-29 20:54:31','3b7ddcad-ff51-4b74-8926-64cbe013220e'),
	(36,2,1,3,3,NULL,'2022-01-29 20:54:31','2022-01-29 20:54:31','f0a1e184-1a77-41bf-a92b-a66fe8f6d00f'),
	(38,37,1,1,1,NULL,'2022-01-29 20:54:31','2022-01-29 20:54:31','82d287a6-5858-4659-abfc-83933b1dde5b'),
	(39,37,1,2,2,NULL,'2022-01-29 20:54:31','2022-01-29 20:54:31','9d9ab5e2-9058-478b-a722-299f32e62580'),
	(40,37,1,3,3,NULL,'2022-01-29 20:54:31','2022-01-29 20:54:31','803f4dd4-4f72-4fda-8d89-e7cae028333e'),
	(65,2,1,4,4,NULL,'2022-01-29 21:00:09','2022-01-29 21:00:09','464bc06d-f131-45fc-b237-03936d8bf8cd'),
	(66,2,1,5,5,NULL,'2022-01-29 21:00:09','2022-01-29 21:00:09','12fa09a0-3e8b-4abc-8db2-7373010f16af'),
	(68,67,1,1,1,NULL,'2022-01-29 21:00:10','2022-01-29 21:00:10','bcd224ed-4916-4c35-a2e5-9c1ae6583b35'),
	(69,67,1,2,2,NULL,'2022-01-29 21:00:10','2022-01-29 21:00:10','f389679c-586d-4702-9648-95e394ce922a'),
	(70,67,1,3,3,NULL,'2022-01-29 21:00:10','2022-01-29 21:00:10','39810388-a082-4394-aab8-568f9a00b117'),
	(71,67,1,4,4,NULL,'2022-01-29 21:00:10','2022-01-29 21:00:10','aa4f7c46-0ed6-43e2-a252-cf1bdc94166c'),
	(72,67,1,5,5,NULL,'2022-01-29 21:00:10','2022-01-29 21:00:10','6a16d586-4de3-473d-b717-53e4f94308b2'),
	(81,80,1,1,1,NULL,'2022-01-29 21:01:01','2022-01-29 21:01:01','5b9a9866-cdc5-45fe-a6dd-5d3152ebae1e'),
	(82,80,1,2,2,NULL,'2022-01-29 21:01:01','2022-01-29 21:01:01','77fda151-9a92-4505-ae0d-e616d8d273b6'),
	(83,80,1,3,3,NULL,'2022-01-29 21:01:01','2022-01-29 21:01:01','447d4dd7-6754-4ed9-96c2-af78a5468525'),
	(84,80,1,4,4,NULL,'2022-01-29 21:01:01','2022-01-29 21:01:01','a853b3d9-7f35-4a68-acc9-fbb6184a6f56'),
	(85,80,1,5,5,NULL,'2022-01-29 21:01:01','2022-01-29 21:01:01','dac4de31-a2b9-4c9e-90fa-7eb64674b174'),
	(93,92,1,1,1,NULL,'2022-01-29 23:25:44','2022-01-29 23:25:44','ecaa7869-03e6-455a-8a59-86d3b1a32705'),
	(94,92,1,2,2,NULL,'2022-01-29 23:25:44','2022-01-29 23:25:44','212b9838-2493-4bb5-b1de-fe22f0d3e4ad'),
	(95,92,1,3,3,NULL,'2022-01-29 23:25:44','2022-01-29 23:25:44','3deb69de-a496-4948-b14e-4a4109d924d2'),
	(96,92,1,4,4,NULL,'2022-01-29 23:25:44','2022-01-29 23:25:44','c1a6fc29-c1f8-4ed9-abbd-79e1eb092b6c'),
	(97,92,1,5,5,NULL,'2022-01-29 23:25:44','2022-01-29 23:25:44','ac755b69-8bb3-4997-aab2-96532389cb21'),
	(105,2,1,6,6,NULL,'2022-01-29 23:33:15','2022-01-29 23:33:15','bcf7ebdc-7e5b-4d6d-8479-4e315d190994'),
	(107,106,1,1,1,NULL,'2022-01-29 23:33:15','2022-01-29 23:33:15','7e4beb42-1be1-4d9b-bd49-ea2143378504'),
	(108,106,1,2,2,NULL,'2022-01-29 23:33:15','2022-01-29 23:33:15','49afe7ae-4906-4380-9da5-ed41f6ce860d'),
	(109,106,1,3,3,NULL,'2022-01-29 23:33:15','2022-01-29 23:33:15','c01713d0-2fbb-4101-86b7-6f8f37a25d78'),
	(110,106,1,4,4,NULL,'2022-01-29 23:33:15','2022-01-29 23:33:15','75543214-e472-4b3c-9547-ec6f9527cdd6'),
	(111,106,1,5,5,NULL,'2022-01-29 23:33:15','2022-01-29 23:33:15','a9a023c6-1622-4893-a0ad-455c0c02e6fd'),
	(112,106,1,6,6,NULL,'2022-01-29 23:33:15','2022-01-29 23:33:15','99e6ac5f-016b-480a-9e62-861c67b3cf32'),
	(121,120,1,1,1,NULL,'2022-01-29 23:34:58','2022-01-29 23:34:58','e938f52f-8c31-4233-946c-d5ab64a4bc79'),
	(122,120,1,2,2,NULL,'2022-01-29 23:34:58','2022-01-29 23:34:58','46089577-4074-408b-b344-ca84fdd76bab'),
	(123,120,1,3,3,NULL,'2022-01-29 23:34:58','2022-01-29 23:34:58','28a9087f-f8fe-466a-8f08-55038757ae49'),
	(124,120,1,4,4,NULL,'2022-01-29 23:34:58','2022-01-29 23:34:58','c743fae3-561d-4502-9a9c-4d4f53553dcf'),
	(125,120,1,5,5,NULL,'2022-01-29 23:34:58','2022-01-29 23:34:58','c06ffb38-3fb4-4c2b-8103-fc4d045c10e7'),
	(126,120,1,6,6,NULL,'2022-01-29 23:34:58','2022-01-29 23:34:58','7272704c-b2fa-4769-b099-12b43ed1e83c'),
	(135,134,1,1,1,NULL,'2022-01-29 23:43:37','2022-01-29 23:43:37','8f971dc2-9edb-432b-af11-9aea6b2ccc31'),
	(136,134,1,2,2,NULL,'2022-01-29 23:43:37','2022-01-29 23:43:37','b9fc6e0a-4471-4225-be88-569af85d4d58'),
	(137,134,1,3,3,NULL,'2022-01-29 23:43:37','2022-01-29 23:43:37','4f100e04-268f-4fba-848c-f91055ab3292'),
	(138,134,1,4,4,NULL,'2022-01-29 23:43:37','2022-01-29 23:43:37','636272c3-b8ff-4f37-8140-eefd40c0154a'),
	(139,134,1,5,5,NULL,'2022-01-29 23:43:37','2022-01-29 23:43:37','365b917b-ed17-46dd-85cd-1cf4e9fd7b00'),
	(140,134,1,6,6,NULL,'2022-01-29 23:43:37','2022-01-29 23:43:37','9374da59-04c1-46f3-ab53-b35375684e4b'),
	(151,150,1,1,1,NULL,'2022-01-30 21:42:10','2022-01-30 21:42:10','7d6182a9-7358-4896-9d38-a1366239d276'),
	(153,150,1,2,2,NULL,'2022-01-30 21:42:10','2022-01-30 21:42:10','8acee23a-c07b-43fe-8536-0fd401bed757'),
	(154,150,1,3,3,NULL,'2022-01-30 21:42:10','2022-01-30 21:42:10','8bd0b6c9-4331-487f-9159-0272ad08e217'),
	(155,150,1,4,4,NULL,'2022-01-30 21:42:10','2022-01-30 21:42:10','e22b839c-1b38-4919-acac-f3623cf81c79'),
	(156,150,1,5,5,NULL,'2022-01-30 21:42:10','2022-01-30 21:42:10','e343cddb-941e-470a-b273-0469587f0f1a'),
	(157,150,1,6,6,NULL,'2022-01-30 21:42:10','2022-01-30 21:42:10','e32d463a-f334-4031-aee2-37caafaedb7e'),
	(176,175,1,1,1,NULL,'2022-01-30 21:44:27','2022-01-30 21:44:27','b10f4d60-62bd-48c4-aa12-501bc4205057'),
	(179,175,1,2,2,NULL,'2022-01-30 21:44:27','2022-01-30 21:44:27','da6485b4-278b-4b14-8c0c-5f141cd014f5'),
	(180,175,1,3,3,NULL,'2022-01-30 21:44:27','2022-01-30 21:44:27','b294465c-cc69-4ce3-984c-aa22cdc9b19f'),
	(181,175,1,4,4,NULL,'2022-01-30 21:44:27','2022-01-30 21:44:27','d7460be3-8f0d-4db3-88b5-c30833cb68c4'),
	(182,175,1,5,5,NULL,'2022-01-30 21:44:27','2022-01-30 21:44:27','6964637d-dea8-4a13-a7cf-cf40eafc3af4'),
	(183,175,1,6,6,NULL,'2022-01-30 21:44:27','2022-01-30 21:44:27','a1043533-08be-4b04-9278-6dba46497eda'),
	(194,193,1,1,1,NULL,'2022-01-30 21:44:35','2022-01-30 21:44:35','aa89a2d3-477c-49cf-bef3-ba77c6c26736'),
	(197,193,1,2,2,NULL,'2022-01-30 21:44:35','2022-01-30 21:44:35','637fbc4a-153f-4c02-902b-4c455f477243'),
	(198,193,1,3,3,NULL,'2022-01-30 21:44:35','2022-01-30 21:44:35','aa75edf9-02ee-4b99-bdea-ff51a33480c7'),
	(199,193,1,4,4,NULL,'2022-01-30 21:44:35','2022-01-30 21:44:35','1e7f243f-9381-4c9b-b2d9-d356f70515fc'),
	(200,193,1,5,5,NULL,'2022-01-30 21:44:35','2022-01-30 21:44:35','396fcdd1-81e7-4a7b-bdb0-d5bd5e04680a'),
	(201,193,1,6,6,NULL,'2022-01-30 21:44:35','2022-01-30 21:44:35','3249b691-3741-412d-bab8-433237253933'),
	(212,211,1,1,1,NULL,'2022-01-30 21:45:09','2022-01-30 21:45:09','9ce88406-c8bc-4329-90a2-06da1460a94c'),
	(215,211,1,2,2,NULL,'2022-01-30 21:45:09','2022-01-30 21:45:09','9d92df58-1959-42dc-b251-637802e834ca'),
	(216,211,1,3,3,NULL,'2022-01-30 21:45:09','2022-01-30 21:45:09','0abb2530-504a-4a2f-8f87-eec067de3cf2'),
	(217,211,1,4,4,NULL,'2022-01-30 21:45:09','2022-01-30 21:45:09','0ff8a890-985b-45e2-b7c8-32cf67446b8e'),
	(218,211,1,5,5,NULL,'2022-01-30 21:45:09','2022-01-30 21:45:09','cb48a8b2-f903-442e-8908-df5532e58652'),
	(219,211,1,6,6,NULL,'2022-01-30 21:45:09','2022-01-30 21:45:09','04b15223-157d-4982-b9c3-b55ab752afe0'),
	(244,243,1,1,1,NULL,'2022-01-30 21:45:54','2022-01-30 21:45:54','dfa0963b-b202-4293-bb80-1c78e5ca2531'),
	(248,243,1,2,2,NULL,'2022-01-30 21:45:54','2022-01-30 21:45:54','a294cafb-d9e3-4a90-9e56-fcbbd69f4430'),
	(249,243,1,3,3,NULL,'2022-01-30 21:45:54','2022-01-30 21:45:54','a0978dce-67f6-4f4a-b724-d072c36b25e1'),
	(250,243,1,4,4,NULL,'2022-01-30 21:45:54','2022-01-30 21:45:54','b2624174-3925-4ddd-ba2b-90acdee12ca8'),
	(251,243,1,5,5,NULL,'2022-01-30 21:45:54','2022-01-30 21:45:54','770d314c-1b10-4c08-b8ca-4595ecd60826'),
	(252,243,1,6,6,NULL,'2022-01-30 21:45:54','2022-01-30 21:45:54','4fc90301-6b7f-4956-9057-99be03cab84d'),
	(264,263,1,1,1,NULL,'2022-01-30 22:18:35','2022-01-30 22:18:35','081e286e-9ff8-41ac-b278-aaefe72b4974'),
	(268,263,1,2,2,NULL,'2022-01-30 22:18:35','2022-01-30 22:18:35','a08e6189-b650-4655-b72e-a4a37d6eaece'),
	(269,263,1,3,3,NULL,'2022-01-30 22:18:35','2022-01-30 22:18:35','5f147fde-0f63-4aea-a38b-255c6f2c2f55'),
	(270,263,1,4,4,NULL,'2022-01-30 22:18:35','2022-01-30 22:18:35','935ff0e1-2bd7-4eb6-bf0e-7d629f730c87'),
	(271,263,1,5,5,NULL,'2022-01-30 22:18:35','2022-01-30 22:18:35','4f5e0fb2-2eec-40f7-8881-73f00163b221'),
	(272,263,1,6,6,NULL,'2022-01-30 22:18:35','2022-01-30 22:18:35','e2aa5dd8-eb81-40e6-8e37-939a07797cf7'),
	(287,286,1,1,1,NULL,'2022-01-30 22:33:43','2022-01-30 22:33:43','de5cfb43-6773-4168-aa65-80fea050e9b2'),
	(291,286,1,2,2,NULL,'2022-01-30 22:33:44','2022-01-30 22:33:44','5beebccf-0485-4040-8b4d-615aa30ec55d'),
	(292,286,1,3,3,NULL,'2022-01-30 22:33:44','2022-01-30 22:33:44','37564cfa-199e-4f72-9540-5edc934afb62'),
	(293,286,1,4,4,NULL,'2022-01-30 22:33:44','2022-01-30 22:33:44','c63d1a7e-6078-4968-928e-90b485b32012'),
	(294,286,1,5,5,NULL,'2022-01-30 22:33:44','2022-01-30 22:33:44','539ed06a-7d54-4fb4-9a94-fdc2bf32b24d'),
	(295,286,1,6,6,NULL,'2022-01-30 22:33:44','2022-01-30 22:33:44','d3579152-e05f-48e1-83e9-4537ee142afb'),
	(307,306,1,1,1,NULL,'2022-01-30 22:40:10','2022-01-30 22:40:10','04494262-7a85-438e-8ae4-019d066fc504'),
	(311,306,1,2,2,NULL,'2022-01-30 22:40:10','2022-01-30 22:40:10','ef62be7d-1a5a-49dc-b2b6-63cd8d76187a'),
	(312,306,1,3,3,NULL,'2022-01-30 22:40:10','2022-01-30 22:40:10','19e039bd-4402-4f77-91f4-a690f915c99a'),
	(313,306,1,4,4,NULL,'2022-01-30 22:40:10','2022-01-30 22:40:10','03cb43bb-d4c1-471e-9631-9a52498a3138'),
	(314,306,1,5,5,NULL,'2022-01-30 22:40:10','2022-01-30 22:40:10','52412029-91f7-4611-a3e6-db86350eab9a'),
	(315,306,1,6,6,NULL,'2022-01-30 22:40:10','2022-01-30 22:40:10','f38ee8e6-69de-4492-b9ff-f8b7d22d7384');

/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table matrixblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixblocktypes`;

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xtbqppktgvedukulcvhcspnmviafkrpowgch` (`name`,`fieldId`),
  KEY `idx_mdfqkchpnqhykdzkfcrweowirxaqqknqxfdt` (`handle`,`fieldId`),
  KEY `idx_uysdgbngkhfdzlfgacdclnvrkkcsetsqsxbl` (`fieldId`),
  KEY `idx_jygjwywuojxlztczodewyqlsmdibztpjjmhr` (`fieldLayoutId`),
  CONSTRAINT `fk_qtjafnbvrruydhcwshhgijvfilhyvjokgurl` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tnowdxnoaliyghyhnxmwbdotqyywvqmbaxhn` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;

INSERT INTO `matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,2,'Hero','hero',3,'2022-01-29 20:41:18','2022-01-29 23:35:56','503608ce-5321-4dcc-b1a4-68d5b8f0fbcf'),
	(2,1,4,'Call to Action','callToAction',4,'2022-01-29 20:48:00','2022-01-29 23:35:56','c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4'),
	(3,1,5,'Cards','cards',5,'2022-01-29 20:49:29','2022-01-29 23:35:56','8ccccc07-e07b-4c7e-8056-68a3a2a564d8'),
	(4,1,6,'Copy with Image','copyWithImage',1,'2022-01-29 20:51:20','2022-01-29 23:35:56','f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7'),
	(5,1,7,'Get In Touch','getInTouch',2,'2022-01-29 20:51:20','2022-01-29 23:35:56','ed04d794-983e-4ce4-acd7-d9f624be015b'),
	(6,1,10,'Contact','contact',6,'2022-01-29 23:31:31','2022-01-29 23:34:19','b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121');

/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table matrixcontent_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixcontent_components`;

CREATE TABLE `matrixcontent_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_callToAction_copy` text COLLATE utf8_unicode_ci,
  `field_callToAction_heading` text COLLATE utf8_unicode_ci,
  `field_callToAction_button` text COLLATE utf8_unicode_ci,
  `field_copyWithImage_button` text COLLATE utf8_unicode_ci,
  `field_copyWithImage_copy` text COLLATE utf8_unicode_ci,
  `field_copyWithImage_heading` text COLLATE utf8_unicode_ci,
  `field_getInTouch_abstract` text COLLATE utf8_unicode_ci,
  `field_getInTouch_heading` text COLLATE utf8_unicode_ci,
  `field_contact_heading` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hdnwnncgvnwcyslwqacthvhvwuhvftvotfex` (`elementId`,`siteId`),
  KEY `fk_akfxxsykstlsgmnyfneygeccofwyzairquzj` (`siteId`),
  CONSTRAINT `fk_akfxxsykstlsgmnyfneygeccofwyzairquzj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jtsrjzvldivbwlpsvskchbqykoqbakqspepw` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `matrixcontent_components` WRITE;
/*!40000 ALTER TABLE `matrixcontent_components` DISABLE KEYS */;

INSERT INTO `matrixcontent_components` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_callToAction_copy`, `field_callToAction_heading`, `field_callToAction_button`, `field_copyWithImage_button`, `field_copyWithImage_copy`, `field_copyWithImage_heading`, `field_getInTouch_abstract`, `field_getInTouch_heading`, `field_contact_heading`)
VALUES
	(1,6,1,'2022-01-29 20:51:42','2022-01-29 20:51:42','d930faff-f806-4131-bca2-ef485e569702',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,8,1,'2022-01-29 20:52:41','2022-01-29 20:52:41','4a67a455-1415-4281-a2ab-7081c9edb610',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,9,1,'2022-01-29 20:52:50','2022-01-29 20:52:50','11b66162-33bf-410f-8bef-09c5a1aa012f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,10,1,'2022-01-29 20:53:02','2022-01-29 20:53:02','17c4c4e2-ec2c-4714-9c7f-e0691493075e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(5,11,1,'2022-01-29 20:53:03','2022-01-29 20:53:03','fdc1092f-2f36-4a91-8b88-4397ee6d38e6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(6,12,1,'2022-01-29 20:53:05','2022-01-29 20:53:05','2a8225d8-dfeb-4d1d-bcb8-dbd6d3f31747',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(7,13,1,'2022-01-29 20:53:08','2022-01-29 20:53:08','b3565b73-7d39-4356-8a3d-fd26c6805e00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(8,14,1,'2022-01-29 20:53:09','2022-01-29 20:53:09','1bb2d86a-47d5-4a36-93ad-5ddc2793a485',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(9,15,1,'2022-01-29 20:53:15','2022-01-29 20:53:15','b476f0b2-1630-4eca-8d0a-f938e8128554',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(10,16,1,'2022-01-29 20:53:15','2022-01-29 20:53:15','d1ab3627-15be-4cc9-9d7c-68ea4df8c902',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(11,17,1,'2022-01-29 20:53:23','2022-01-29 20:53:23','402d72fd-c6fa-475c-83d5-2c7bd562b41a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(12,18,1,'2022-01-29 20:53:23','2022-01-29 20:53:23','0840868d-cd40-4a4c-9bc3-07ed0e34ba36',NULL,'Here we have a two line  display headline',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(13,19,1,'2022-01-29 20:53:26','2022-01-29 20:53:26','5935d447-8568-4c64-abb8-7aa4f0c398d9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(14,20,1,'2022-01-29 20:53:26','2022-01-29 20:53:26','3236beaf-93b8-4582-afaa-d9cdf29d0aa1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat.','Here we have a two line  display headline',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(15,21,1,'2022-01-29 20:53:26','2022-01-29 20:53:26','a91e308e-59d0-4d2c-8896-934be66de419',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(16,22,1,'2022-01-29 20:53:26','2022-01-29 20:53:26','afdce766-9a04-408c-850d-416419dd8c3a','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat.','Here we have a two line  display headline','[{\"col1\":\"\",\"col2\":\"\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(17,23,1,'2022-01-29 20:53:29','2022-01-29 20:53:29','2068d6cf-120d-4268-b4be-d943aaa9e694',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(18,24,1,'2022-01-29 20:53:29','2022-01-29 20:53:29','9dc160d0-1d1b-4026-89c0-67ff95d60291','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat.','Here we have a two line  display headline','[{\"col1\":\"\",\"col2\":\"\"},{\"col1\":\"\",\"col2\":\"\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(19,25,1,'2022-01-29 20:53:30','2022-01-29 20:53:30','8c8a2696-94cf-4f51-9a36-9825a4381269',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(20,26,1,'2022-01-29 20:53:30','2022-01-29 20:53:30','8541d5e3-6bbc-4c5a-aeef-7d6bd96a5383','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat.','Here we have a two line  display headline','[{\"col1\":\"\",\"col2\":\"\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(21,27,1,'2022-01-29 20:53:35','2022-01-29 20:53:35','3c52fb50-abab-4052-8e13-a87dbb03893f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(22,28,1,'2022-01-29 20:53:35','2022-01-29 20:53:35','f8fd8af6-9854-424b-a061-e82f5b5cd4d1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat.','Here we have a two line  display headline','[{\"col1\":\"Button\",\"col2\":\"\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(23,29,1,'2022-01-29 20:53:37','2022-01-29 20:53:37','4c3705be-e7c1-4829-9982-ed047483a983',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(24,30,1,'2022-01-29 20:53:37','2022-01-29 20:53:37','f9d802da-df18-4c6b-a346-ea1192286dd4','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat.','Here we have a two line  display headline','[{\"col1\":\"Button Text\",\"col2\":\"#\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(28,34,1,'2022-01-29 20:54:31','2022-01-30 22:40:09','16162a04-f05b-4861-9cf2-9c74bd555602',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(29,35,1,'2022-01-29 20:54:31','2022-01-30 22:40:09','ebf4e236-c2ec-4b57-a4d2-67142523b9f8','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line  display headline','[{\"col1\":\"Button Text\",\"col2\":\"#\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(30,36,1,'2022-01-29 20:54:31','2022-01-30 22:40:09','60891fa5-1fc8-4e4b-9c4d-1527e7a0b167',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(31,38,1,'2022-01-29 20:54:31','2022-01-29 20:54:31','fc7527e3-6fed-41b0-bdef-b79a6b8edbf0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(32,39,1,'2022-01-29 20:54:31','2022-01-29 20:54:31','9f1128d4-6be0-434f-a460-f8a4d161f147','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat.','Here we have a two line  display headline','[{\"col1\":\"Button Text\",\"col2\":\"#\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(33,40,1,'2022-01-29 20:54:31','2022-01-29 20:54:31','f8682906-4708-4c2e-a2b7-d9b042c936e9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(37,54,1,'2022-01-29 20:59:45','2022-01-29 20:59:45','3f529576-454c-4867-b0de-e2a9a19583ee',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(38,55,1,'2022-01-29 20:59:52','2022-01-29 20:59:52','c1c99b50-1e05-4073-ba4d-33d9738a7914',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(39,56,1,'2022-01-29 20:59:52','2022-01-29 20:59:52','03dca40f-21a2-487e-af6e-ec36e2c6766b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(40,57,1,'2022-01-29 20:59:56','2022-01-29 20:59:56','85fa015c-b1dd-4a11-8258-29f2ddf4defb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(41,58,1,'2022-01-29 20:59:56','2022-01-29 20:59:56','3d716512-52d3-41b6-8c76-f1a634bdf89f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(42,59,1,'2022-01-29 21:00:02','2022-01-29 21:00:02','a6006dab-ff55-449c-a2e0-3a2cd351a5d1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(43,60,1,'2022-01-29 21:00:02','2022-01-29 21:00:02','30dd599d-0510-433c-b1fb-0f0c2be3e872',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(44,61,1,'2022-01-29 21:00:03','2022-01-29 21:00:03','51362839-c199-4956-aa89-275ec76edabd',NULL,NULL,NULL,'[{\"col1\":\"\",\"col2\":\"\"}]',NULL,'Here we have a two line display.',NULL,NULL,NULL),
	(45,62,1,'2022-01-29 21:00:03','2022-01-29 21:00:03','20756add-417f-4fce-b5a4-7b057ca4844f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(48,65,1,'2022-01-29 21:00:09','2022-01-30 22:40:09','bcba6d7f-d662-401e-bcbb-fcf380c471d5',NULL,NULL,NULL,'[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line display.',NULL,NULL,NULL),
	(49,66,1,'2022-01-29 21:00:09','2022-01-30 22:40:09','1beb9e6c-6302-4a71-a2cb-e9874535ea85',NULL,NULL,NULL,NULL,NULL,NULL,'+ 44 (0) 1234 567 890','A message followed bya way to get in touch',NULL),
	(50,68,1,'2022-01-29 21:00:10','2022-01-29 21:00:10','863731a2-9285-47a8-b8b9-f3bc7957fef0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(51,69,1,'2022-01-29 21:00:10','2022-01-29 21:00:10','97cf1780-7066-47cb-a644-c65f66c41c7c','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Here we have a two line  display headline','[{\"col1\":\"Button Text\",\"col2\":\"#\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(52,70,1,'2022-01-29 21:00:10','2022-01-29 21:00:10','078406f4-a0e6-4f4a-b838-3282b68baee1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(53,71,1,'2022-01-29 21:00:10','2022-01-29 21:00:10','dc8e5033-b556-457c-ad4e-3f8ab2c2b80c',NULL,NULL,NULL,'[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]',NULL,'Here we have a two line display.',NULL,NULL,NULL),
	(54,72,1,'2022-01-29 21:00:10','2022-01-29 21:00:10','e2aef65d-dfbc-4e36-94dd-684ab2c07045',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(60,81,1,'2022-01-29 21:01:01','2022-01-29 21:01:01','cd31e442-d5d8-4c82-925e-f94ad11bfe70',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(61,82,1,'2022-01-29 21:01:01','2022-01-29 21:01:01','258dac0d-8c23-42ec-9766-02c1c0246721','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Here we have a two line  display headline','[{\"col1\":\"Button Text\",\"col2\":\"#\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(62,83,1,'2022-01-29 21:01:01','2022-01-29 21:01:01','14fc78dc-b010-4fa5-b234-e545ec256eef',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(63,84,1,'2022-01-29 21:01:01','2022-01-29 21:01:01','1f6b87d0-e0b8-4d59-bdd2-fa5caa6e5916',NULL,NULL,NULL,'[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]',NULL,'Here we have a two line display.',NULL,NULL,NULL),
	(64,85,1,'2022-01-29 21:01:01','2022-01-29 21:01:01','cdab70e4-fd22-4fb9-ac51-ded01e2669ba',NULL,NULL,NULL,NULL,NULL,NULL,'+ 44 (0) 1234 567 890','A message followed by\na way to get in touch',NULL),
	(70,93,1,'2022-01-29 23:25:44','2022-01-29 23:25:44','dc3e77be-a611-418e-a53d-b4c9f800583f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(71,94,1,'2022-01-29 23:25:44','2022-01-29 23:25:44','3493e8af-f4e0-4f5b-8ccf-9ac4ca679d9a','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Here we have a two line  display headline','[{\"col1\":\"Button Text\",\"col2\":\"#\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(72,95,1,'2022-01-29 23:25:44','2022-01-29 23:25:44','62e97ada-8ab8-430f-830d-82951172734a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(73,96,1,'2022-01-29 23:25:44','2022-01-29 23:25:44','3c092511-e8ab-49fc-aff2-595f96fe1084',NULL,NULL,NULL,'[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line display.',NULL,NULL,NULL),
	(74,97,1,'2022-01-29 23:25:44','2022-01-29 23:25:44','4e0a94f5-6eac-4d93-bfd3-ecfece4cc9f3',NULL,NULL,NULL,NULL,NULL,NULL,'+ 44 (0) 1234 567 890','A message followed by\na way to get in touch',NULL),
	(81,105,1,'2022-01-29 23:33:15','2022-01-30 22:40:09','713e4671-7064-44da-9baf-c8b69f6cdf48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Content'),
	(82,107,1,'2022-01-29 23:33:15','2022-01-29 23:33:15','fb828deb-3a97-41ce-971c-e5d6ac3e0403',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(83,108,1,'2022-01-29 23:33:15','2022-01-29 23:33:15','e75e0aaa-a64d-48cf-9abe-d93bb695fa7d','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Here we have a two line  display headline','[{\"col1\":\"Button Text\",\"col2\":\"#\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(84,109,1,'2022-01-29 23:33:15','2022-01-29 23:33:15','2c28d9e6-07d0-4a2d-84af-4cd51abf262f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(85,110,1,'2022-01-29 23:33:15','2022-01-29 23:33:15','18978321-898c-4e7b-bf86-bcf4cc3a8b0d',NULL,NULL,NULL,'[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line display.',NULL,NULL,NULL),
	(86,111,1,'2022-01-29 23:33:15','2022-01-29 23:33:15','10feaa44-5f3e-4a44-b9a7-3dc34349d15d',NULL,NULL,NULL,NULL,NULL,NULL,'+ 44 (0) 1234 567 890','A message followed by\na way to get in touch',NULL),
	(87,112,1,'2022-01-29 23:33:15','2022-01-29 23:33:15','78f9ab1b-b7c7-40da-a090-ea1029e14121',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(94,121,1,'2022-01-29 23:34:58','2022-01-29 23:34:58','71974a6b-cb73-4a5d-b20b-7172cdb560f5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(95,122,1,'2022-01-29 23:34:58','2022-01-29 23:34:58','69d87609-a448-4a93-b60c-1902d33f724d','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Here we have a two line  display headline','[{\"col1\":\"Button Text\",\"col2\":\"#\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(96,123,1,'2022-01-29 23:34:58','2022-01-29 23:34:58','9b1043ac-67e2-4d3a-a282-f77e5fc9ebb9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(97,124,1,'2022-01-29 23:34:58','2022-01-29 23:34:58','5cd6aab4-dd5a-49d8-8301-c84a0b0f5dd9',NULL,NULL,NULL,'[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line display.',NULL,NULL,NULL),
	(98,125,1,'2022-01-29 23:34:58','2022-01-29 23:34:58','a5d6e5be-f4b9-47dc-8f79-784b597d071c',NULL,NULL,NULL,NULL,NULL,NULL,'+ 44 (0) 1234 567 890','A message followed by\na way to get in touch',NULL),
	(99,126,1,'2022-01-29 23:34:58','2022-01-29 23:34:58','bc3a07fe-581b-41f6-bab4-20918e4abb8b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Content'),
	(106,135,1,'2022-01-29 23:43:37','2022-01-29 23:43:37','b10c727e-8dbe-4710-abcb-95d39992bdb8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(107,136,1,'2022-01-29 23:43:37','2022-01-29 23:43:37','4e02c5d8-332d-4f5e-bada-a05ee3c3ca8e','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Here we have a two line  display headline','[{\"col1\":\"Button Text\",\"col2\":\"#\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(108,137,1,'2022-01-29 23:43:37','2022-01-29 23:43:37','86ca4de4-6d6e-41e2-874f-963260daaf11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(109,138,1,'2022-01-29 23:43:37','2022-01-29 23:43:37','b392cd78-35e1-430a-95c8-5bb2b7212a12',NULL,NULL,NULL,'[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line display.',NULL,NULL,NULL),
	(110,139,1,'2022-01-29 23:43:37','2022-01-29 23:43:37','7621a237-71fb-4f37-8319-c4275f8239c5',NULL,NULL,NULL,NULL,NULL,NULL,'+ 44 (0) 1234 567 890','A message followed by\na way to get in touch',NULL),
	(111,140,1,'2022-01-29 23:43:37','2022-01-29 23:43:37','511a3c98-ec39-4c25-a8b0-7e71f2cdc0d4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Content'),
	(118,151,1,'2022-01-30 21:42:10','2022-01-30 21:42:10','ea88dc78-082d-400e-97f8-8a4f0c8c4037',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(119,153,1,'2022-01-30 21:42:10','2022-01-30 21:42:10','495d2240-22d5-483d-bbf5-4dcb39e6c724','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Here we have a two line  display headline','[{\"col1\":\"Button Text\",\"col2\":\"#\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(120,154,1,'2022-01-30 21:42:10','2022-01-30 21:42:10','e61d4dcc-72d5-45af-a30e-a5b71eae55e9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(121,155,1,'2022-01-30 21:42:10','2022-01-30 21:42:10','38eb4319-9a54-4f90-b35e-ebcf1b7524ac',NULL,NULL,NULL,'[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line display.',NULL,NULL,NULL),
	(122,156,1,'2022-01-30 21:42:10','2022-01-30 21:42:10','a3ce0515-6bca-42e9-9ce3-93065edff700',NULL,NULL,NULL,NULL,NULL,NULL,'+ 44 (0) 1234 567 890','A message followed by\na way to get in touch',NULL),
	(123,157,1,'2022-01-30 21:42:10','2022-01-30 21:42:10','87bcdab2-5dfb-4509-93b0-92f4c423cd8a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Content'),
	(130,176,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','45cb0424-6a51-444e-ac5b-1b233caff128',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(131,179,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','112d867c-5d7b-4b04-bd59-045a74461a51','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Here we have a two line  display headline','[{\"col1\":\"Button Text\",\"col2\":\"#\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(132,180,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','ef5d32d7-7a65-4033-8b3d-1945928c522f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(133,181,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','c2ddc0f0-cea7-4745-a225-024b803edf2b',NULL,NULL,NULL,'[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line display.',NULL,NULL,NULL),
	(134,182,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','9462601c-971e-4e7f-8d95-98c3c3177476',NULL,NULL,NULL,NULL,NULL,NULL,'+ 44 (0) 1234 567 890','A message followed by\na way to get in touch',NULL),
	(135,183,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','11339bf7-cace-421b-87ff-b2592b7a54ca',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Content'),
	(142,194,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','385707f1-7a55-4b0b-aa73-06b7fb1a059e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(143,197,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','e4da8eb5-e6c6-47cb-a35b-7235f5b26b4a','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line  display headline','[{\"col1\":\"Button Text\",\"col2\":\"#\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(144,198,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','e7dc9f0f-7a35-4872-8da5-3ed257169038',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(145,199,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','b677a068-f263-4d71-b8fd-fec4d4c3a85d',NULL,NULL,NULL,'[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line display.',NULL,NULL,NULL),
	(146,200,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','5faad091-d217-4bf1-8ee7-01d0dd279613',NULL,NULL,NULL,NULL,NULL,NULL,'+ 44 (0) 1234 567 890','A message followed bya way to get in touch',NULL),
	(147,201,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','e6677f29-74a8-428e-aaf6-53cf2b0c1aae',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Content'),
	(154,212,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','ea0f527f-9161-42ca-b1f3-e68a1afd2737',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(155,215,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','21a31309-fdfd-4587-8f76-12da8814f719','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line  display headline','[{\"col1\":\"Button Text\",\"col2\":\"#\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(156,216,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','20c38de4-98cd-4cf9-ac47-a219a9b60fea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(157,217,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','a29a4795-18ed-4ca9-96c1-36fcf53af109',NULL,NULL,NULL,'[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line display.',NULL,NULL,NULL),
	(158,218,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','443d5cae-9a69-49d8-bafc-f2b7f06f13f8',NULL,NULL,NULL,NULL,NULL,NULL,'+ 44 (0) 1234 567 890','A message followed bya way to get in touch',NULL),
	(159,219,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','26358270-ec70-442d-9d93-9dabb490920d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Content'),
	(166,244,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','8c87bbd1-1985-48ae-81a8-7824f5982be4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(167,248,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','eb629e85-9188-444e-b8da-0f32d076eb4f','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line  display headline','[{\"col1\":\"Button Text\",\"col2\":\"#\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(168,249,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','6371188f-b2c7-4b5b-8c51-b54d58065acd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(169,250,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','992e9baa-bda4-4b67-a38c-af30ac08d9f9',NULL,NULL,NULL,'[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line display.',NULL,NULL,NULL),
	(170,251,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','794a3e7c-b179-48e8-be19-757104de887b',NULL,NULL,NULL,NULL,NULL,NULL,'+ 44 (0) 1234 567 890','A message followed bya way to get in touch',NULL),
	(171,252,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','5b36ce6a-2bb8-46d2-98e4-a8fce77e70b5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Content'),
	(178,264,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','497b4d4d-060d-4bed-bef2-fde40692395e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(179,268,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','019d42c8-8b81-464e-b0aa-5e5b982d202b','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line  display headline','[{\"col1\":\"Button Text\",\"col2\":\"#\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(180,269,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','c627d636-f20a-402a-afd2-4d7ec16229fc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(181,270,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','f90a5d23-0f0c-4d94-8ce1-18253d43987e',NULL,NULL,NULL,'[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line display.',NULL,NULL,NULL),
	(182,271,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','a47abb35-ce3a-4ddb-96d1-9b7703057395',NULL,NULL,NULL,NULL,NULL,NULL,'+ 44 (0) 1234 567 890','A message followed bya way to get in touch',NULL),
	(183,272,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','a1832abb-df72-49c0-a1a4-806b1c6504a3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Content'),
	(190,287,1,'2022-01-30 22:33:43','2022-01-30 22:33:43','6816abc4-1a9e-4c86-8779-f0e0ee2b057b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(191,291,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','2d5c0374-d568-4fdf-abc5-2c602ab33c32','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line  display headline','[{\"col1\":\"Button Text\",\"col2\":\"#\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(192,292,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','393ca492-1522-4c04-b7cd-665fb0d66655',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(193,293,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','36d0d896-7f51-4a29-b5b2-d4edbe20aa9e',NULL,NULL,NULL,'[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line display.',NULL,NULL,NULL),
	(194,294,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','7d0de582-42fe-4b74-9de5-f114e0cb76c1',NULL,NULL,NULL,NULL,NULL,NULL,'+ 44 (0) 1234 567 890','A message followed bya way to get in touch',NULL),
	(195,295,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','234ac886-6b61-4098-9a61-505c0151cc83',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Content'),
	(202,307,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','3d028537-60bb-4451-9688-404b5d646913',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(203,311,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','7d2acee1-0184-4770-a075-205a51f309a7','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line  display headline','[{\"col1\":\"Button Text\",\"col2\":\"#\"}]',NULL,NULL,NULL,NULL,NULL,NULL),
	(204,312,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','122bbe70-4d43-4d1c-a662-c16bc059b0fc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(205,313,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','5ce083a9-327c-425b-b7f3-f3a64f7d9d35',NULL,NULL,NULL,'[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','Here we have a two line display.',NULL,NULL,NULL),
	(206,314,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','7aa4905b-2aa8-486a-baac-2b62ed16efba',NULL,NULL,NULL,NULL,NULL,NULL,'+ 44 (0) 1234 567 890','A message followed bya way to get in touch',NULL),
	(207,315,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','5ae96626-7ad5-4cb6-bb8a-a0a7ed07a9cf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Content');

/*!40000 ALTER TABLE `matrixcontent_components` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ycahutuqrsfdpkgvdavmmzeeoculkcowbtxd` (`track`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'craft','Install','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','c168e7f4-85c6-45f7-a917-1415ac9d4a34'),
	(2,'craft','m150403_183908_migrations_table_changes','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','2baca1f6-60f3-4cea-b7b0-30a4b23d53e4'),
	(3,'craft','m150403_184247_plugins_table_changes','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','45f9ee0b-fe73-4384-b2eb-95541fad5cb4'),
	(4,'craft','m150403_184533_field_version','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','65415dac-5c02-4097-9508-06055c203f08'),
	(5,'craft','m150403_184729_type_columns','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','9202805c-426e-4bc6-a9a2-3564fcd0ffef'),
	(6,'craft','m150403_185142_volumes','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','077ad8f1-be76-4bec-ab13-519b5555b30c'),
	(7,'craft','m150428_231346_userpreferences','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','d6fa0f1f-37c9-478e-8bde-e48d24155d82'),
	(8,'craft','m150519_150900_fieldversion_conversion','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','5fd9db54-97d1-4154-9b9a-9c318553bb3a'),
	(9,'craft','m150617_213829_update_email_settings','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','3d35cca8-e145-458c-9277-70ce61ec4849'),
	(10,'craft','m150721_124739_templatecachequeries','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','9e6baa62-b1ed-4617-a11d-206b3dfa4db0'),
	(11,'craft','m150724_140822_adjust_quality_settings','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','bc3681aa-6950-41cf-8685-76b6e31bdc76'),
	(12,'craft','m150815_133521_last_login_attempt_ip','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','3e37bc34-a85c-48ca-bae6-eed03eea8270'),
	(13,'craft','m151002_095935_volume_cache_settings','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','f1b8297f-948c-4c94-8294-f91540b02df1'),
	(14,'craft','m151005_142750_volume_s3_storage_settings','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','98c8a1c1-a163-40e1-a8ed-d7ccb8c55023'),
	(15,'craft','m151016_133600_delete_asset_thumbnails','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','ba1122db-2d86-49f0-a214-c8dd868412af'),
	(16,'craft','m151209_000000_move_logo','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','26726e69-7e5c-4d44-bb3d-cc44cd6566a5'),
	(17,'craft','m151211_000000_rename_fileId_to_assetId','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','b4fa1f9b-f47e-42f6-b795-0f2e19b6b6c6'),
	(18,'craft','m151215_000000_rename_asset_permissions','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','a4964093-4178-43a5-8ae8-349b6ff7e43d'),
	(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','c3597c64-b619-4daf-ada7-12ce9999f4a9'),
	(20,'craft','m160708_185142_volume_hasUrls_setting','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','ac25a0e3-3eac-40e6-a49d-7adad9cecf38'),
	(21,'craft','m160714_000000_increase_max_asset_filesize','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','e4c968c9-5646-4c6b-8a6b-b336f179a30a'),
	(22,'craft','m160727_194637_column_cleanup','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','d4d204ff-e87d-4869-9a67-d710f7d315d2'),
	(23,'craft','m160804_110002_userphotos_to_assets','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','81917c1f-5d38-4882-9eeb-7c7113d74af7'),
	(24,'craft','m160807_144858_sites','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','4599a0a8-8234-49a9-9fc0-8c4f98a229af'),
	(25,'craft','m160829_000000_pending_user_content_cleanup','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','efb263ee-f282-4d82-938e-0178ba7fc765'),
	(26,'craft','m160830_000000_asset_index_uri_increase','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','d048a8e8-000e-4570-8cdd-c37f223cfc21'),
	(27,'craft','m160912_230520_require_entry_type_id','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','41caa596-b3f2-4b83-b09c-1551849ec7d0'),
	(28,'craft','m160913_134730_require_matrix_block_type_id','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','8a4ba30f-8c60-4e0f-bf95-76ab70d8f104'),
	(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','228bb6ee-a25f-43b6-8801-146c36a3e01b'),
	(30,'craft','m160920_231045_usergroup_handle_title_unique','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','1e85f508-a3b2-4ed7-abb4-7985eee72f24'),
	(31,'craft','m160925_113941_route_uri_parts','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','771331b7-477d-488e-aba1-9f85dc8b38fb'),
	(32,'craft','m161006_205918_schemaVersion_not_null','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','2ef76993-a280-4530-855f-73343c84327c'),
	(33,'craft','m161007_130653_update_email_settings','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','81c2c95c-a72d-4165-97a7-c659f89d0f7b'),
	(34,'craft','m161013_175052_newParentId','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','9590ca60-57c6-4233-af7f-991162749883'),
	(35,'craft','m161021_102916_fix_recent_entries_widgets','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','c67e2dd9-b5b7-4470-a199-3406a36e60db'),
	(36,'craft','m161021_182140_rename_get_help_widget','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','b723a8d3-de85-44e5-bcb0-bced883abfea'),
	(37,'craft','m161025_000000_fix_char_columns','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','819f877e-67bd-4e07-8af1-81baaef3bebe'),
	(38,'craft','m161029_124145_email_message_languages','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','471fac6f-5ca0-464d-8876-7a39254fa6fe'),
	(39,'craft','m161108_000000_new_version_format','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','7a00b880-93a4-4ebd-90eb-898949174092'),
	(40,'craft','m161109_000000_index_shuffle','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','a954800a-4d14-47a8-ba52-a49a8735233a'),
	(41,'craft','m161122_185500_no_craft_app','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','50e0eac2-e4a1-46d2-bce6-05e8fc8af3a1'),
	(42,'craft','m161125_150752_clear_urlmanager_cache','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','1e240017-c845-4d7f-9882-19286f340b0f'),
	(43,'craft','m161220_000000_volumes_hasurl_notnull','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','b0be901b-0e24-4d91-a57f-30122e6e3a51'),
	(44,'craft','m170114_161144_udates_permission','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','aea87e94-0d7e-4760-a116-44d1a1a7433b'),
	(45,'craft','m170120_000000_schema_cleanup','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','355cc86f-e416-4d3d-b608-551d3306cb52'),
	(46,'craft','m170126_000000_assets_focal_point','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','ac9b0e8a-55b3-4dba-8cd2-12fc1f3f8577'),
	(47,'craft','m170206_142126_system_name','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','401368e1-a0dc-413d-8c72-d86bb27fd579'),
	(48,'craft','m170217_044740_category_branch_limits','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','1fa70df2-180f-4c0c-a118-f48de4bf3584'),
	(49,'craft','m170217_120224_asset_indexing_columns','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','ae3d2d9a-5100-4a3f-916d-bdbb4d47b959'),
	(50,'craft','m170223_224012_plain_text_settings','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','604d5f4b-948f-4b3c-b80a-ff28165c9e4e'),
	(51,'craft','m170227_120814_focal_point_percentage','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','cc19e8b3-6d37-486d-a799-57d74c414ca7'),
	(52,'craft','m170228_171113_system_messages','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','1a15b365-14cb-4e6e-a9c3-951007776b5e'),
	(53,'craft','m170303_140500_asset_field_source_settings','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','47def038-b71e-4e62-98dd-39e8bb641cc3'),
	(54,'craft','m170306_150500_asset_temporary_uploads','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','cd2089fd-d6b2-480c-b853-a37f30992a83'),
	(55,'craft','m170523_190652_element_field_layout_ids','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','0d650c5b-0ece-4766-b11f-f87da4d8d137'),
	(56,'craft','m170621_195237_format_plugin_handles','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','8405bea4-1c8f-432c-ad3c-831670790c49'),
	(57,'craft','m170630_161027_deprecation_line_nullable','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','acf40e18-91aa-42fe-aa84-92e60dd7fb4b'),
	(58,'craft','m170630_161028_deprecation_changes','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','332ca4f9-c70d-45fd-ae31-6340e805da94'),
	(59,'craft','m170703_181539_plugins_table_tweaks','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','f0938a86-5628-47d2-8d33-783ffc0171f5'),
	(60,'craft','m170704_134916_sites_tables','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','efdeea9c-9cd3-4ce4-bd29-cb140e3805d6'),
	(61,'craft','m170706_183216_rename_sequences','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','b6743e25-5d30-42f3-9df7-9840e2593966'),
	(62,'craft','m170707_094758_delete_compiled_traits','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','5d8b4863-96f8-4f8c-8734-2e5d36fc1e30'),
	(63,'craft','m170731_190138_drop_asset_packagist','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','3e1a2038-7d55-4181-8154-bd402ec74f7f'),
	(64,'craft','m170810_201318_create_queue_table','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','89aec28f-d90b-43b3-bf24-aec6269d0204'),
	(65,'craft','m170903_192801_longblob_for_queue_jobs','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','0190031d-e176-4968-aafe-32a0b4cc592e'),
	(66,'craft','m170914_204621_asset_cache_shuffle','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','95d6d4b9-3302-40de-b13f-1143ae2b3486'),
	(67,'craft','m171011_214115_site_groups','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','d8fa8773-2d72-4675-9948-9799046f8bea'),
	(68,'craft','m171012_151440_primary_site','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','98675242-7c37-4c9d-9846-34e99a92238d'),
	(69,'craft','m171013_142500_transform_interlace','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','fa49b6ac-5fa9-4885-9838-0500edb631d7'),
	(70,'craft','m171016_092553_drop_position_select','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','1f94930b-8dcd-4ea3-b727-701dc2112c9a'),
	(71,'craft','m171016_221244_less_strict_translation_method','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','cef20dd3-cf96-4430-a289-8f0f90e736f1'),
	(72,'craft','m171107_000000_assign_group_permissions','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','604668d6-e462-41ce-ae89-9b14c417127f'),
	(73,'craft','m171117_000001_templatecache_index_tune','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','f7fe4ae1-8b85-495e-b2cc-70850762e036'),
	(74,'craft','m171126_105927_disabled_plugins','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','de87fd9f-f3e1-4428-b713-9e9a9f35acac'),
	(75,'craft','m171130_214407_craftidtokens_table','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','f99fccfd-1e0d-4b6e-a3a8-c4bcb16b7f45'),
	(76,'craft','m171202_004225_update_email_settings','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','41957d38-4a22-4159-b18f-db14b9c0b538'),
	(77,'craft','m171204_000001_templatecache_index_tune_deux','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','c5eb89ad-6f5c-4581-bc6f-d9a6f0676fe5'),
	(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','5e9f5818-e847-4363-a121-c9ea28270a04'),
	(79,'craft','m171218_143135_longtext_query_column','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','5b1b69de-df4b-4a16-a33a-843473a59b23'),
	(80,'craft','m171231_055546_environment_variables_to_aliases','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','1831eda3-7906-47d4-a2cc-a4defd6354b7'),
	(81,'craft','m180113_153740_drop_users_archived_column','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','95034d51-f45b-4cad-910b-29701c783c00'),
	(82,'craft','m180122_213433_propagate_entries_setting','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','a3a500ac-98ad-4fa6-a2eb-4e0b56e6442d'),
	(83,'craft','m180124_230459_fix_propagate_entries_values','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','329af0b8-aa3e-41f7-92c5-887b8bd2dbf5'),
	(84,'craft','m180128_235202_set_tag_slugs','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','6f14bb99-c839-47e8-99b8-ac2877798560'),
	(85,'craft','m180202_185551_fix_focal_points','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','6b313c5f-11f4-4435-aa3f-cd4adc97669d'),
	(86,'craft','m180217_172123_tiny_ints','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','562807cc-b80b-4d6f-9863-eff3bd2a8e8e'),
	(87,'craft','m180321_233505_small_ints','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','c56c0432-e109-498e-8199-7a722dda2043'),
	(88,'craft','m180404_182320_edition_changes','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','58bcf90c-36c1-4d6f-a123-d093903aca26'),
	(89,'craft','m180411_102218_fix_db_routes','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','efa87457-f2e9-4eda-8915-d2ffb0aeb954'),
	(90,'craft','m180416_205628_resourcepaths_table','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','b7735ac8-6462-44a1-893e-ee6df5f8b177'),
	(91,'craft','m180418_205713_widget_cleanup','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','afbbf183-4c4b-46bb-8902-bbbcd8c16673'),
	(92,'craft','m180425_203349_searchable_fields','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','1b78666c-a137-4cfb-ad93-1f419b6e1c2a'),
	(93,'craft','m180516_153000_uids_in_field_settings','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','c99ba03a-c145-4f22-aaa9-63e5d8616eee'),
	(94,'craft','m180517_173000_user_photo_volume_to_uid','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','3a5f0ca2-b1e5-4d64-a739-5c042ff96906'),
	(95,'craft','m180518_173000_permissions_to_uid','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','9d70868a-ce21-44a1-abd8-601b5985a81b'),
	(96,'craft','m180520_173000_matrix_context_to_uids','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','65600120-9f17-470b-bd31-cdd6d9d301b4'),
	(97,'craft','m180521_172900_project_config_table','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','c37d97b7-36e9-465f-8a82-3b5f30aafdc8'),
	(98,'craft','m180521_173000_initial_yml_and_snapshot','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','72eb7923-4b34-4c65-95a1-23a0d14f350c'),
	(99,'craft','m180731_162030_soft_delete_sites','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','82399b4a-feea-4bba-88c3-5604895e7d4f'),
	(100,'craft','m180810_214427_soft_delete_field_layouts','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','356816f2-879c-44bd-a744-564727c9e18f'),
	(101,'craft','m180810_214439_soft_delete_elements','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','2a1266a9-bcde-4281-97a4-18bab23b138c'),
	(102,'craft','m180824_193422_case_sensitivity_fixes','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','6898e16d-2f35-4e59-b0d5-930ceae15ef2'),
	(103,'craft','m180901_151639_fix_matrixcontent_tables','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','297859f3-1f4d-40ad-bc9e-c05f20ceba2e'),
	(104,'craft','m180904_112109_permission_changes','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','cf76af8a-7d00-4480-a6d2-01eaf4848fb2'),
	(105,'craft','m180910_142030_soft_delete_sitegroups','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','9a5f6d22-29f3-45dd-94a1-abf1731bd29d'),
	(106,'craft','m181011_160000_soft_delete_asset_support','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','5907b7cf-cea6-4d88-8fa1-b1792ffd68d1'),
	(107,'craft','m181016_183648_set_default_user_settings','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','619afea7-2b47-4f33-9485-5af77d2a25d8'),
	(108,'craft','m181017_225222_system_config_settings','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','5ceb8dc7-6559-47de-adbf-670f9318456d'),
	(109,'craft','m181018_222343_drop_userpermissions_from_config','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','d8b8fc4a-fab4-4de3-a5bf-3c9a20d803df'),
	(110,'craft','m181029_130000_add_transforms_routes_to_config','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','e23b6974-257d-4ca9-8f1d-36f5839df2ad'),
	(111,'craft','m181112_203955_sequences_table','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','0d23b7df-2e0e-411e-8f7f-e1aa6ac6e225'),
	(112,'craft','m181121_001712_cleanup_field_configs','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','2c9074f3-9cc0-4e42-971e-5a25fbf70569'),
	(113,'craft','m181128_193942_fix_project_config','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','d8b47145-c1ae-4702-a14b-dda729f7a05f'),
	(114,'craft','m181130_143040_fix_schema_version','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','77107c32-7472-4230-a72e-bdd20aa3b31c'),
	(115,'craft','m181211_143040_fix_entry_type_uids','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','557c661c-c49e-4de7-acab-7c6eaf223e72'),
	(116,'craft','m181217_153000_fix_structure_uids','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','95620084-9bba-4220-bcaf-d121f3bd1783'),
	(117,'craft','m190104_152725_store_licensed_plugin_editions','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','2c4649e9-f537-4e32-9f96-2824e079b41a'),
	(118,'craft','m190108_110000_cleanup_project_config','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','2652707e-6da9-4e03-af09-2e838eb0a272'),
	(119,'craft','m190108_113000_asset_field_setting_change','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','5958a5d3-7c9d-4cb2-9548-5a7d5eb990ba'),
	(120,'craft','m190109_172845_fix_colspan','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','e18e55ee-504d-42eb-baf8-c7c4fc676344'),
	(121,'craft','m190110_150000_prune_nonexisting_sites','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','15a7f701-9074-402d-b771-7d52473de75c'),
	(122,'craft','m190110_214819_soft_delete_volumes','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','1bad42df-08d8-4bcd-b51d-b3b345b9bf39'),
	(123,'craft','m190112_124737_fix_user_settings','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','ffde906d-5a5a-4efe-bfb1-a784eeaabe60'),
	(124,'craft','m190112_131225_fix_field_layouts','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','46214a5c-4821-4736-9ab8-5c79ece46a41'),
	(125,'craft','m190112_201010_more_soft_deletes','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','7fb0c832-8959-42d2-a64c-9cb338573b00'),
	(126,'craft','m190114_143000_more_asset_field_setting_changes','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','1129e98d-106d-47a1-97fe-9cf1f0493f9f'),
	(127,'craft','m190121_120000_rich_text_config_setting','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','8b6c2c94-8194-4b7b-83ea-8bd978cde9f9'),
	(128,'craft','m190125_191628_fix_email_transport_password','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','c30025eb-9555-4e7d-ab60-eea1a2021990'),
	(129,'craft','m190128_181422_cleanup_volume_folders','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','0f7984fc-aba9-4031-ac51-33054c97f44e'),
	(130,'craft','m190205_140000_fix_asset_soft_delete_index','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','d7c10be6-4752-4c9c-88dd-701bd21cd7c9'),
	(131,'craft','m190218_143000_element_index_settings_uid','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','01b57398-36a5-4f55-8728-235da5261e61'),
	(132,'craft','m190312_152740_element_revisions','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','e5975363-935c-4a78-a272-cb2c279a7192'),
	(133,'craft','m190327_235137_propagation_method','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','ded40d65-ab26-42c8-b511-153ed94af0aa'),
	(134,'craft','m190401_223843_drop_old_indexes','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','d29fdb4c-4720-4e0e-ad96-6c0cc6b87fcc'),
	(135,'craft','m190416_014525_drop_unique_global_indexes','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','405e3a46-4f67-46aa-8fcf-900e6338ade9'),
	(136,'craft','m190417_085010_add_image_editor_permissions','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','850e0384-e3c8-4d28-9e38-c7628f384049'),
	(137,'craft','m190502_122019_store_default_user_group_uid','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','a7da06cd-7e51-48e5-8de3-9ca4f434968f'),
	(138,'craft','m190504_150349_preview_targets','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','2c709e7f-48a4-4cde-8f45-c3b961aa9b6e'),
	(139,'craft','m190516_184711_job_progress_label','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','e5ea9728-caa8-4313-9303-35edb5255c0a'),
	(140,'craft','m190523_190303_optional_revision_creators','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','1a6958f2-d519-4cba-8651-03f26a3b5f94'),
	(141,'craft','m190529_204501_fix_duplicate_uids','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','3aeb295b-1319-4005-9fd4-2abdf67cc2e3'),
	(142,'craft','m190605_223807_unsaved_drafts','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','da66356d-4df7-4945-a112-f9322e5fa9ab'),
	(143,'craft','m190607_230042_entry_revision_error_tables','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','d9df4211-fc32-46f4-8ef4-f04e6656dcf5'),
	(144,'craft','m190608_033429_drop_elements_uid_idx','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','da3ecfaa-d577-4f9c-8bb9-a5d7b3cddf96'),
	(145,'craft','m190617_164400_add_gqlschemas_table','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','465e0d6e-f13e-4357-996f-5935fbb013a0'),
	(146,'craft','m190624_234204_matrix_propagation_method','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','56818884-316f-4cdc-9a69-f8e25938cb40'),
	(147,'craft','m190711_153020_drop_snapshots','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','437e7a1b-63ef-4bf2-a26a-60b79f5528f3'),
	(148,'craft','m190712_195914_no_draft_revisions','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','2eab8f1e-c8e4-445e-984a-b5ad2529f483'),
	(149,'craft','m190723_140314_fix_preview_targets_column','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','8f9559fe-5eff-4afa-901a-a8fb9d869f2a'),
	(150,'craft','m190820_003519_flush_compiled_templates','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','94985e6c-9ec0-4a44-8526-ebd0b0ca6f25'),
	(151,'craft','m190823_020339_optional_draft_creators','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','1ff66fb7-7804-4eb3-a45e-7151dfc98630'),
	(152,'craft','m190913_152146_update_preview_targets','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','296c8869-7462-4dae-87ce-4229679eb7c9'),
	(153,'craft','m191107_122000_add_gql_project_config_support','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','7be9258c-6290-4b48-91f2-953ce93b13a3'),
	(154,'craft','m191204_085100_pack_savable_component_settings','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','e7a02372-4466-4b06-95bf-f3a9d6e68420'),
	(155,'craft','m191206_001148_change_tracking','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','661dd7b7-b25b-4db4-be61-a17e8c8e3d7c'),
	(156,'craft','m191216_191635_asset_upload_tracking','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','cabbb2e0-c9d1-406e-bd13-d28378d3fe59'),
	(157,'craft','m191222_002848_peer_asset_permissions','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','a3de6c45-3cc0-4eb3-bd81-d3c76c12dfb1'),
	(158,'craft','m200127_172522_queue_channels','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','eefc05ff-ee2e-4ab9-b03f-3a75adc50194'),
	(159,'craft','m200211_175048_truncate_element_query_cache','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','01533f1d-b817-4a7d-a442-8a720e3111de'),
	(160,'craft','m200213_172522_new_elements_index','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','5755abea-25a7-49a7-a88b-4ad007abf7f4'),
	(161,'craft','m200228_195211_long_deprecation_messages','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','b01af7cd-a49b-4327-841d-034c1f079d95'),
	(162,'craft','m200306_054652_disabled_sites','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','3c1d93db-f58e-43da-8d72-09a1cfb32802'),
	(163,'craft','m200522_191453_clear_template_caches','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','b800a866-b242-4a29-bdf2-cfdd733501b6'),
	(164,'craft','m200606_231117_migration_tracks','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','a9ef2c83-b0bc-4b8c-b8a9-e16e0469c56e'),
	(165,'craft','m200619_215137_title_translation_method','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','dbf5c036-1125-4283-9acb-4bd0fab04563'),
	(166,'craft','m200620_005028_user_group_descriptions','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','8d6d4dc8-c24a-4ced-8e72-a3596dbcb93c'),
	(167,'craft','m200620_230205_field_layout_changes','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','8f1597c7-8095-4996-af14-c91a43efd5d8'),
	(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','692e772e-1e05-4d46-88a4-b423cc192c51'),
	(169,'craft','m200629_112700_remove_project_config_legacy_files','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','88903a47-cbbf-4859-9af8-514610e2e5ac'),
	(170,'craft','m200630_183000_drop_configmap','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','445972dd-7a8c-4614-a687-28368a269ffd'),
	(171,'craft','m200715_113400_transform_index_error_flag','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','15f37016-8d14-44a6-83e1-cce7bd5c39d2'),
	(172,'craft','m200716_110900_replace_file_asset_permissions','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','66e101d2-e8f4-4291-95d5-d39b465e16ed'),
	(173,'craft','m200716_153800_public_token_settings_in_project_config','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','1b621fdc-b016-4d28-95c6-46cb7e672998'),
	(174,'craft','m200720_175543_drop_unique_constraints','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','aa199d74-02ef-4b5f-aaa9-e92e73dc0145'),
	(175,'craft','m200825_051217_project_config_version','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','0f60a683-2851-4e53-af16-fdd0f47ffceb'),
	(176,'craft','m201116_190500_asset_title_translation_method','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','bae2c35f-dc54-4a51-82c4-01c5e2e44d55'),
	(177,'craft','m201124_003555_plugin_trials','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','5acdb130-e8b7-44b2-a4bb-efaf650c3b0b'),
	(178,'craft','m210209_135503_soft_delete_field_groups','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','59809c83-0d93-4b3d-b87c-4fd56ff6e517'),
	(179,'craft','m210212_223539_delete_invalid_drafts','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','3cd860d7-9990-4ea5-a689-f21377b02f48'),
	(180,'craft','m210214_202731_track_saved_drafts','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','681e2942-1009-43b3-b561-e64d5c4f9903'),
	(181,'craft','m210223_150900_add_new_element_gql_schema_components','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','c114c65a-5c9f-4035-905f-9b799b597dc7'),
	(182,'craft','m210302_212318_canonical_elements','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','1d986156-3618-4731-b176-d431a9de0230'),
	(183,'craft','m210326_132000_invalidate_projectconfig_cache','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','534e9f9c-2a43-48ce-bf3d-dd03bdda3676'),
	(184,'craft','m210329_214847_field_column_suffixes','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','3f2214f9-5354-4db9-9a65-e6e37e3199f9'),
	(185,'craft','m210331_220322_null_author','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','f3a2d691-b4ff-46a8-8179-02a19148ad0d'),
	(186,'craft','m210405_231315_provisional_drafts','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','c3454b76-4446-44e7-aed1-9ed7f83e9fb5'),
	(187,'craft','m210602_111300_project_config_names_in_config','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','db951b94-6be6-41ba-9a4e-1a5dd898252a'),
	(188,'craft','m210611_233510_default_placement_settings','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','4fcc9956-f62d-4534-8637-644682b960d8'),
	(189,'craft','m210613_145522_sortable_global_sets','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','2b28411a-2a0b-4ee4-b881-05253b61dd44'),
	(190,'craft','m210613_184103_announcements','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','39238f38-259a-4024-9a1e-4e50f1e574a0'),
	(191,'craft','m210829_000000_element_index_tweak','2022-01-29 20:36:15','2022-01-29 20:36:15','2022-01-29 20:36:15','d9f5bff8-c2e6-4155-82ac-5d3f425cae30'),
	(192,'plugin:redactor','m180430_204710_remove_old_plugins','2022-01-29 20:40:28','2022-01-29 20:40:28','2022-01-29 20:40:28','4cb434b0-3fb9-4277-ab7e-cc0c82804568'),
	(193,'plugin:redactor','Install','2022-01-29 20:40:28','2022-01-29 20:40:28','2022-01-29 20:40:28','76e311eb-ca5f-437b-9a0b-79eba01e7c17'),
	(194,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2022-01-29 20:40:28','2022-01-29 20:40:28','2022-01-29 20:40:28','724bda9a-6c48-44fc-918b-ae54ebb6b1aa'),
	(195,'plugin:super-table','Install','2022-01-30 21:36:31','2022-01-30 21:36:31','2022-01-30 21:36:31','47acf171-3f20-487c-b1c7-09dee1c9b4ac'),
	(196,'plugin:super-table','m180210_000000_migrate_content_tables','2022-01-30 21:36:31','2022-01-30 21:36:31','2022-01-30 21:36:31','da6b5497-c3ac-4fc5-9e55-d56c05443019'),
	(197,'plugin:super-table','m180211_000000_type_columns','2022-01-30 21:36:31','2022-01-30 21:36:31','2022-01-30 21:36:31','f00304f9-86da-44b4-bce6-da79c42e24e0'),
	(198,'plugin:super-table','m180219_000000_sites','2022-01-30 21:36:31','2022-01-30 21:36:31','2022-01-30 21:36:31','33d6555a-cc52-4131-ae27-0dce7e77f7eb'),
	(199,'plugin:super-table','m180220_000000_fix_context','2022-01-30 21:36:31','2022-01-30 21:36:31','2022-01-30 21:36:31','173a1997-a1d9-4a3a-bfa8-028643233a6d'),
	(200,'plugin:super-table','m190117_000000_soft_deletes','2022-01-30 21:36:31','2022-01-30 21:36:31','2022-01-30 21:36:31','0291df0c-5b56-4a18-ab1e-ee9a399bde3a'),
	(201,'plugin:super-table','m190117_000001_context_to_uids','2022-01-30 21:36:31','2022-01-30 21:36:31','2022-01-30 21:36:31','f5ff23f6-82c2-4c65-8cb6-341047328cf7'),
	(202,'plugin:super-table','m190120_000000_fix_supertablecontent_tables','2022-01-30 21:36:31','2022-01-30 21:36:31','2022-01-30 21:36:31','bc0363c2-3eb2-4bb6-8d21-eb0dec6e4d00'),
	(203,'plugin:super-table','m190131_000000_fix_supertable_missing_fields','2022-01-30 21:36:31','2022-01-30 21:36:31','2022-01-30 21:36:31','38623695-dd8e-4faf-8c6b-d7bcc53e0e85'),
	(204,'plugin:super-table','m190227_100000_fix_project_config','2022-01-30 21:36:31','2022-01-30 21:36:31','2022-01-30 21:36:31','0b286db8-78af-403b-963c-d5428461af2f'),
	(205,'plugin:super-table','m190511_100000_fix_project_config','2022-01-30 21:36:31','2022-01-30 21:36:31','2022-01-30 21:36:31','774f2f5e-04a7-43cd-859b-4e59daa02fee'),
	(206,'plugin:super-table','m190520_000000_fix_project_config','2022-01-30 21:36:31','2022-01-30 21:36:31','2022-01-30 21:36:31','c5459e1b-aa79-45bb-8b59-30626878596b'),
	(207,'plugin:super-table','m190714_000000_propagation_method','2022-01-30 21:36:31','2022-01-30 21:36:31','2022-01-30 21:36:31','e4ffb461-1379-42f9-8f34-71f725337e82'),
	(208,'plugin:super-table','m191127_000000_fix_width','2022-01-30 21:36:31','2022-01-30 21:36:31','2022-01-30 21:36:31','f3360525-4d20-40a8-9fb7-164ef65d8979');

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plugins`;

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fotfbvqsjcnmhuuimfxmbcwvmlnrtzrsvsev` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'redactor','2.8.8','2.3.0','unknown',NULL,'2022-01-29 20:40:28','2022-01-29 20:40:28','2022-02-01 09:19:23','178475f2-da49-4fd0-bbe7-641678d029dd'),
	(2,'element-api','2.8.4','1.0.0','unknown',NULL,'2022-01-30 21:08:52','2022-01-30 21:08:53','2022-02-01 09:19:23','56b8d07b-07c9-4fba-8a30-2c51644349db'),
	(3,'super-table','2.7.1','2.2.1','unknown',NULL,'2022-01-30 21:36:31','2022-01-30 21:36:31','2022-02-01 09:19:23','b5dac83e-cad7-4f70-85ab-b1f24f4bdc3d');

/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projectconfig
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projectconfig`;

CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;

INSERT INTO `projectconfig` (`path`, `value`)
VALUES
	('dateModified','1643707447'),
	('email.fromEmail','\"alexrees1993@googlemail.com\"'),
	('email.fromName','\"Verse\"'),
	('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.autocapitalize','true'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.autocomplete','false'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.autocorrect','true'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.class','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.disabled','false'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.id','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.instructions','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.label','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.max','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.min','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.name','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.orientation','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.placeholder','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.readonly','false'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.requirable','false'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.size','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.step','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.tip','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.title','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.warning','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.0.width','100'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.1.fieldUid','\"fe126841-dabc-4168-8e73-d14cf3293ebf\"'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.1.instructions','\"\"'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.1.label','\"\"'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.1.required','\"1\"'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.1.tip','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.1.warning','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.1.width','100'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.2.fieldUid','\"badbce7d-5fea-44f2-871f-66b5597ee650\"'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.2.instructions','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.2.label','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.2.required','false'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.2.tip','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.2.warning','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.2.width','100'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.3.fieldUid','\"a14102a0-5269-4c9f-a971-5a3063a568d9\"'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.3.instructions','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.3.label','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.3.required','false'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.3.tip','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.3.warning','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.elements.3.width','100'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.name','\"Content\"'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.fieldLayouts.60fb108f-06e5-45d2-abd7-7e0b411cdea1.tabs.0.sortOrder','1'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.handle','\"default\"'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.hasTitleField','true'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.name','\"Default\"'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.section','\"56b811ad-a1bd-49ec-913d-1fe0a0e4ad46\"'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.sortOrder','1'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.titleFormat','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.titleTranslationKeyFormat','null'),
	('entryTypes.784f2565-57bc-455f-9ff9-484ca800e333.titleTranslationMethod','\"site\"'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.autocapitalize','true'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.autocomplete','false'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.autocorrect','true'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.class','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.disabled','false'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.id','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.instructions','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.label','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.max','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.min','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.name','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.orientation','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.placeholder','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.readonly','false'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.requirable','false'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.size','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.step','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.tip','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.title','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.warning','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.0.width','100'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.1.fieldUid','\"86f51cdf-0594-49d7-88cd-8cf8daddfd02\"'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.1.instructions','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.1.label','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.1.required','false'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.1.tip','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.1.warning','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.elements.1.width','100'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.name','\"Content\"'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.fieldLayouts.0dd5e6d4-bd13-4973-8864-c1be99307e39.tabs.0.sortOrder','1'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.handle','\"homepage\"'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.hasTitleField','false'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.name','\"Homepage\"'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.section','\"ed6307e6-38a4-472d-b6bd-609ec660cec3\"'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.sortOrder','1'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.titleFormat','\"{section.name|raw}\"'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.titleTranslationKeyFormat','null'),
	('entryTypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a.titleTranslationMethod','\"site\"'),
	('fieldGroups.d3ff529d-f0b8-4b6d-a8a6-987dd86d4e24.name','\"Common\"'),
	('fieldGroups.d4e3d852-e984-4784-af34-69145961849c.name','\"Card\"'),
	('fields.86f51cdf-0594-49d7-88cd-8cf8daddfd02.columnSuffix','null'),
	('fields.86f51cdf-0594-49d7-88cd-8cf8daddfd02.contentColumnType','\"string\"'),
	('fields.86f51cdf-0594-49d7-88cd-8cf8daddfd02.fieldGroup','\"d3ff529d-f0b8-4b6d-a8a6-987dd86d4e24\"'),
	('fields.86f51cdf-0594-49d7-88cd-8cf8daddfd02.handle','\"components\"'),
	('fields.86f51cdf-0594-49d7-88cd-8cf8daddfd02.instructions','\"\"'),
	('fields.86f51cdf-0594-49d7-88cd-8cf8daddfd02.name','\"Components\"'),
	('fields.86f51cdf-0594-49d7-88cd-8cf8daddfd02.searchable','false'),
	('fields.86f51cdf-0594-49d7-88cd-8cf8daddfd02.settings.contentTable','\"{{%matrixcontent_components}}\"'),
	('fields.86f51cdf-0594-49d7-88cd-8cf8daddfd02.settings.maxBlocks','\"\"'),
	('fields.86f51cdf-0594-49d7-88cd-8cf8daddfd02.settings.minBlocks','\"1\"'),
	('fields.86f51cdf-0594-49d7-88cd-8cf8daddfd02.settings.propagationKeyFormat','null'),
	('fields.86f51cdf-0594-49d7-88cd-8cf8daddfd02.settings.propagationMethod','\"all\"'),
	('fields.86f51cdf-0594-49d7-88cd-8cf8daddfd02.translationKeyFormat','null'),
	('fields.86f51cdf-0594-49d7-88cd-8cf8daddfd02.translationMethod','\"site\"'),
	('fields.86f51cdf-0594-49d7-88cd-8cf8daddfd02.type','\"craft\\\\fields\\\\Matrix\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.columnSuffix','\"yivhlchv\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.contentColumnType','\"text\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.fieldGroup','\"d4e3d852-e984-4784-af34-69145961849c\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.handle','\"cardButton\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.instructions','\"\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.name','\"Button\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.searchable','false'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.addRowLabel','\"Add a row\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columns.__assoc__.0.0','\"col1\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Text\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columns.__assoc__.0.1.__assoc__.1.1','\"text\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columns.__assoc__.0.1.__assoc__.3.1','\"singleline\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columns.__assoc__.1.0','\"col2\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columns.__assoc__.1.1.__assoc__.0.0','\"heading\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columns.__assoc__.1.1.__assoc__.0.1','\"Link\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columns.__assoc__.1.1.__assoc__.1.0','\"handle\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columns.__assoc__.1.1.__assoc__.1.1','\"link\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columns.__assoc__.1.1.__assoc__.2.0','\"width\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columns.__assoc__.1.1.__assoc__.2.1','\"\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columns.__assoc__.1.1.__assoc__.3.0','\"type\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columns.__assoc__.1.1.__assoc__.3.1','\"singleline\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.columnType','\"text\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.maxRows','\"1\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.settings.minRows','\"\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.translationKeyFormat','null'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.translationMethod','\"none\"'),
	('fields.a14102a0-5269-4c9f-a971-5a3063a568d9.type','\"craft\\\\fields\\\\Table\"'),
	('fields.badbce7d-5fea-44f2-871f-66b5597ee650.columnSuffix','\"pviifqql\"'),
	('fields.badbce7d-5fea-44f2-871f-66b5597ee650.contentColumnType','\"text\"'),
	('fields.badbce7d-5fea-44f2-871f-66b5597ee650.fieldGroup','\"d4e3d852-e984-4784-af34-69145961849c\"'),
	('fields.badbce7d-5fea-44f2-871f-66b5597ee650.handle','\"cardAbstract\"'),
	('fields.badbce7d-5fea-44f2-871f-66b5597ee650.instructions','\"\"'),
	('fields.badbce7d-5fea-44f2-871f-66b5597ee650.name','\"Abstract\"'),
	('fields.badbce7d-5fea-44f2-871f-66b5597ee650.searchable','false'),
	('fields.badbce7d-5fea-44f2-871f-66b5597ee650.settings.byteLimit','null'),
	('fields.badbce7d-5fea-44f2-871f-66b5597ee650.settings.charLimit','null'),
	('fields.badbce7d-5fea-44f2-871f-66b5597ee650.settings.code','\"\"'),
	('fields.badbce7d-5fea-44f2-871f-66b5597ee650.settings.columnType','null'),
	('fields.badbce7d-5fea-44f2-871f-66b5597ee650.settings.initialRows','\"4\"'),
	('fields.badbce7d-5fea-44f2-871f-66b5597ee650.settings.multiline','\"\"'),
	('fields.badbce7d-5fea-44f2-871f-66b5597ee650.settings.placeholder','null'),
	('fields.badbce7d-5fea-44f2-871f-66b5597ee650.settings.uiMode','\"normal\"'),
	('fields.badbce7d-5fea-44f2-871f-66b5597ee650.translationKeyFormat','null'),
	('fields.badbce7d-5fea-44f2-871f-66b5597ee650.translationMethod','\"none\"'),
	('fields.badbce7d-5fea-44f2-871f-66b5597ee650.type','\"craft\\\\fields\\\\PlainText\"'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.columnSuffix','null'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.contentColumnType','\"string\"'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.fieldGroup','\"d4e3d852-e984-4784-af34-69145961849c\"'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.handle','\"cardThumbnail\"'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.instructions','\"\"'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.name','\"Thumbnail\"'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.searchable','false'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.allowedKinds.0','\"image\"'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.allowSelfRelations','false'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.allowUploads','true'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.defaultUploadLocationSource','\"volume:c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5\"'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.defaultUploadLocationSubpath','\"\"'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.limit','\"1\"'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.localizeRelations','false'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.previewMode','\"full\"'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.restrictFiles','\"1\"'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.selectionLabel','\"\"'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.showSiteMenu','true'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.showUnpermittedFiles','false'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.showUnpermittedVolumes','false'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.singleUploadLocationSource','\"volume:c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5\"'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.singleUploadLocationSubpath','\"\"'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.source','null'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.sources','\"*\"'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.targetSiteId','null'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.useSingleFolder','true'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.validateRelatedElements','false'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.settings.viewMode','\"list\"'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.translationKeyFormat','null'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.translationMethod','\"site\"'),
	('fields.fe126841-dabc-4168-8e73-d14cf3293ebf.type','\"craft\\\\fields\\\\Assets\"'),
	('graphql.publicToken.enabled','true'),
	('graphql.publicToken.expiryDate','null'),
	('graphql.schemas.268674e8-5a06-4a63-9604-27e45158a894.isPublic','false'),
	('graphql.schemas.268674e8-5a06-4a63-9604-27e45158a894.name','\"Verse Schema\"'),
	('graphql.schemas.268674e8-5a06-4a63-9604-27e45158a894.scope.0','\"sections.56b811ad-a1bd-49ec-913d-1fe0a0e4ad46:read\"'),
	('graphql.schemas.268674e8-5a06-4a63-9604-27e45158a894.scope.1','\"entrytypes.784f2565-57bc-455f-9ff9-484ca800e333:read\"'),
	('graphql.schemas.268674e8-5a06-4a63-9604-27e45158a894.scope.2','\"sections.ed6307e6-38a4-472d-b6bd-609ec660cec3:read\"'),
	('graphql.schemas.268674e8-5a06-4a63-9604-27e45158a894.scope.3','\"entrytypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a:read\"'),
	('graphql.schemas.268674e8-5a06-4a63-9604-27e45158a894.scope.4','\"volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5:read\"'),
	('graphql.schemas.268674e8-5a06-4a63-9604-27e45158a894.scope.5','\"volumes.00ba4136-4522-4595-918d-d5c47a106881:read\"'),
	('graphql.schemas.cb8562a1-d98c-4f8f-ab71-138ec54875d1.isPublic','true'),
	('graphql.schemas.cb8562a1-d98c-4f8f-ab71-138ec54875d1.name','\"Public Schema\"'),
	('graphql.schemas.cb8562a1-d98c-4f8f-ab71-138ec54875d1.scope.0','\"sections.56b811ad-a1bd-49ec-913d-1fe0a0e4ad46:read\"'),
	('graphql.schemas.cb8562a1-d98c-4f8f-ab71-138ec54875d1.scope.1','\"entrytypes.784f2565-57bc-455f-9ff9-484ca800e333:read\"'),
	('graphql.schemas.cb8562a1-d98c-4f8f-ab71-138ec54875d1.scope.2','\"sections.ed6307e6-38a4-472d-b6bd-609ec660cec3:read\"'),
	('graphql.schemas.cb8562a1-d98c-4f8f-ab71-138ec54875d1.scope.3','\"entrytypes.b5da51f5-d9b1-4ed1-8780-9c80c659891a:read\"'),
	('graphql.schemas.cb8562a1-d98c-4f8f-ab71-138ec54875d1.scope.4','\"volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5:read\"'),
	('graphql.schemas.cb8562a1-d98c-4f8f-ab71-138ec54875d1.scope.5','\"volumes.00ba4136-4522-4595-918d-d5c47a106881:read\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.field','\"86f51cdf-0594-49d7-88cd-8cf8daddfd02\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fieldLayouts.5484cb0a-57c0-4bd6-8964-329c7a8d8e29.tabs.0.elements.0.fieldUid','\"b41264ca-8671-443b-876c-ca52160072e9\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fieldLayouts.5484cb0a-57c0-4bd6-8964-329c7a8d8e29.tabs.0.elements.0.instructions','null'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fieldLayouts.5484cb0a-57c0-4bd6-8964-329c7a8d8e29.tabs.0.elements.0.label','null'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fieldLayouts.5484cb0a-57c0-4bd6-8964-329c7a8d8e29.tabs.0.elements.0.required','false'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fieldLayouts.5484cb0a-57c0-4bd6-8964-329c7a8d8e29.tabs.0.elements.0.tip','null'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fieldLayouts.5484cb0a-57c0-4bd6-8964-329c7a8d8e29.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fieldLayouts.5484cb0a-57c0-4bd6-8964-329c7a8d8e29.tabs.0.elements.0.warning','null'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fieldLayouts.5484cb0a-57c0-4bd6-8964-329c7a8d8e29.tabs.0.elements.0.width','100'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fieldLayouts.5484cb0a-57c0-4bd6-8964-329c7a8d8e29.tabs.0.name','\"Content\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fieldLayouts.5484cb0a-57c0-4bd6-8964-329c7a8d8e29.tabs.0.sortOrder','1'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.columnSuffix','null'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.contentColumnType','\"string\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.fieldGroup','null'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.handle','\"slides\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.instructions','\"\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.name','\"Slides\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.searchable','false'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.columns.__assoc__.0.0','\"98ce7158-cb01-4c67-a1c6-0ef140775fb1\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.columns.__assoc__.0.1.__assoc__.0.0','\"width\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.columns.__assoc__.0.1.__assoc__.0.1','\"\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.columns.__assoc__.1.0','\"298ac298-c6d5-46d3-837b-f992d3053ecf\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.columns.__assoc__.1.1.__assoc__.0.0','\"width\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.columns.__assoc__.1.1.__assoc__.0.1','\"\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.columns.__assoc__.2.0','\"61f629b2-0417-448a-8350-aff0bac1ec3b\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.columns.__assoc__.2.1.__assoc__.0.0','\"width\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.columns.__assoc__.2.1.__assoc__.0.1','\"\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.columns.__assoc__.3.0','\"b9f2742e-ae14-4113-a183-6bd3de2cf384\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.columns.__assoc__.3.1.__assoc__.0.0','\"width\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.columns.__assoc__.3.1.__assoc__.0.1','\"\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.columns.__assoc__.4.0','\"f5c321e4-4cc3-457e-ab1a-610791af7d11\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.columns.__assoc__.4.1.__assoc__.0.0','\"width\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.columns.__assoc__.4.1.__assoc__.0.1','\"\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.contentTable','\"{{%stc_1_slides}}\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.fieldLayout','\"matrix\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.maxRows','\"\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.minRows','\"\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.placeholderKey','null'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.propagationKeyFormat','null'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.propagationMethod','\"all\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.selectionLabel','\"\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.settings.staticField','\"\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.translationKeyFormat','null'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.translationMethod','\"site\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.fields.b41264ca-8671-443b-876c-ca52160072e9.type','\"verbb\\\\supertable\\\\fields\\\\SuperTableField\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.handle','\"hero\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.name','\"Hero\"'),
	('matrixBlockTypes.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf.sortOrder','3'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.field','\"86f51cdf-0594-49d7-88cd-8cf8daddfd02\"'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fieldLayouts.aaa50586-018e-475a-87a8-189e0e97c502.tabs.0.elements.0.fieldUid','\"9983f131-2c73-48e5-a123-879d42e1be5d\"'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fieldLayouts.aaa50586-018e-475a-87a8-189e0e97c502.tabs.0.elements.0.instructions','null'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fieldLayouts.aaa50586-018e-475a-87a8-189e0e97c502.tabs.0.elements.0.label','null'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fieldLayouts.aaa50586-018e-475a-87a8-189e0e97c502.tabs.0.elements.0.required','true'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fieldLayouts.aaa50586-018e-475a-87a8-189e0e97c502.tabs.0.elements.0.tip','null'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fieldLayouts.aaa50586-018e-475a-87a8-189e0e97c502.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fieldLayouts.aaa50586-018e-475a-87a8-189e0e97c502.tabs.0.elements.0.warning','null'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fieldLayouts.aaa50586-018e-475a-87a8-189e0e97c502.tabs.0.elements.0.width','100'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fieldLayouts.aaa50586-018e-475a-87a8-189e0e97c502.tabs.0.name','\"Content\"'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fieldLayouts.aaa50586-018e-475a-87a8-189e0e97c502.tabs.0.sortOrder','1'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.columnSuffix','null'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.contentColumnType','\"string\"'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.fieldGroup','null'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.handle','\"entries\"'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.instructions','\"\"'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.name','\"Entries\"'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.searchable','false'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.settings.allowSelfRelations','false'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.settings.limit','\"3\"'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.settings.localizeRelations','false'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.settings.selectionLabel','\"\"'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.settings.showSiteMenu','true'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.settings.source','null'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.settings.sources.0','\"section:56b811ad-a1bd-49ec-913d-1fe0a0e4ad46\"'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.settings.targetSiteId','null'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.settings.validateRelatedElements','false'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.settings.viewMode','null'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.translationKeyFormat','null'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.translationMethod','\"site\"'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.fields.9983f131-2c73-48e5-a123-879d42e1be5d.type','\"craft\\\\fields\\\\Entries\"'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.handle','\"cards\"'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.name','\"Cards\"'),
	('matrixBlockTypes.8ccccc07-e07b-4c7e-8056-68a3a2a564d8.sortOrder','5'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.field','\"86f51cdf-0594-49d7-88cd-8cf8daddfd02\"'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fieldLayouts.9748c455-33cf-4c29-b8f7-7e8a0710587a.tabs.0.elements.0.fieldUid','\"22443ea1-187e-49b2-84c4-90598d169bf5\"'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fieldLayouts.9748c455-33cf-4c29-b8f7-7e8a0710587a.tabs.0.elements.0.instructions','null'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fieldLayouts.9748c455-33cf-4c29-b8f7-7e8a0710587a.tabs.0.elements.0.label','null'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fieldLayouts.9748c455-33cf-4c29-b8f7-7e8a0710587a.tabs.0.elements.0.required','false'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fieldLayouts.9748c455-33cf-4c29-b8f7-7e8a0710587a.tabs.0.elements.0.tip','null'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fieldLayouts.9748c455-33cf-4c29-b8f7-7e8a0710587a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fieldLayouts.9748c455-33cf-4c29-b8f7-7e8a0710587a.tabs.0.elements.0.warning','null'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fieldLayouts.9748c455-33cf-4c29-b8f7-7e8a0710587a.tabs.0.elements.0.width','100'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fieldLayouts.9748c455-33cf-4c29-b8f7-7e8a0710587a.tabs.0.name','\"Content\"'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fieldLayouts.9748c455-33cf-4c29-b8f7-7e8a0710587a.tabs.0.sortOrder','1'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fields.22443ea1-187e-49b2-84c4-90598d169bf5.columnSuffix','null'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fields.22443ea1-187e-49b2-84c4-90598d169bf5.contentColumnType','\"text\"'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fields.22443ea1-187e-49b2-84c4-90598d169bf5.fieldGroup','null'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fields.22443ea1-187e-49b2-84c4-90598d169bf5.handle','\"heading\"'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fields.22443ea1-187e-49b2-84c4-90598d169bf5.instructions','\"\"'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fields.22443ea1-187e-49b2-84c4-90598d169bf5.name','\"Heading\"'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fields.22443ea1-187e-49b2-84c4-90598d169bf5.searchable','false'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fields.22443ea1-187e-49b2-84c4-90598d169bf5.settings.byteLimit','null'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fields.22443ea1-187e-49b2-84c4-90598d169bf5.settings.charLimit','null'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fields.22443ea1-187e-49b2-84c4-90598d169bf5.settings.code','\"\"'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fields.22443ea1-187e-49b2-84c4-90598d169bf5.settings.columnType','null'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fields.22443ea1-187e-49b2-84c4-90598d169bf5.settings.initialRows','\"4\"'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fields.22443ea1-187e-49b2-84c4-90598d169bf5.settings.multiline','\"\"'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fields.22443ea1-187e-49b2-84c4-90598d169bf5.settings.placeholder','null'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fields.22443ea1-187e-49b2-84c4-90598d169bf5.settings.uiMode','\"normal\"'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fields.22443ea1-187e-49b2-84c4-90598d169bf5.translationKeyFormat','null'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fields.22443ea1-187e-49b2-84c4-90598d169bf5.translationMethod','\"none\"'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.fields.22443ea1-187e-49b2-84c4-90598d169bf5.type','\"craft\\\\fields\\\\PlainText\"'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.handle','\"contact\"'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.name','\"Contact\"'),
	('matrixBlockTypes.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121.sortOrder','6'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.field','\"86f51cdf-0594-49d7-88cd-8cf8daddfd02\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.0.fieldUid','\"702d9892-92f3-4ebd-92eb-d3ce59d96b2d\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.0.instructions','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.0.label','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.0.required','false'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.0.tip','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.0.warning','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.0.width','100'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.1.fieldUid','\"8bab4a25-1ca5-43a3-946f-7eb03bcd5d36\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.1.instructions','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.1.label','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.1.required','false'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.1.tip','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.1.warning','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.1.width','100'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.2.fieldUid','\"784f0689-cbe8-44df-97a8-b2b7edb9d2f9\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.2.instructions','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.2.label','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.2.required','false'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.2.tip','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.2.warning','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.elements.2.width','100'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.name','\"Content\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fieldLayouts.e53a97aa-7416-4253-8ce0-b01584d7ca4a.tabs.0.sortOrder','1'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.702d9892-92f3-4ebd-92eb-d3ce59d96b2d.columnSuffix','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.702d9892-92f3-4ebd-92eb-d3ce59d96b2d.contentColumnType','\"text\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.702d9892-92f3-4ebd-92eb-d3ce59d96b2d.fieldGroup','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.702d9892-92f3-4ebd-92eb-d3ce59d96b2d.handle','\"heading\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.702d9892-92f3-4ebd-92eb-d3ce59d96b2d.instructions','\"\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.702d9892-92f3-4ebd-92eb-d3ce59d96b2d.name','\"Heading\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.702d9892-92f3-4ebd-92eb-d3ce59d96b2d.searchable','false'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.702d9892-92f3-4ebd-92eb-d3ce59d96b2d.settings.byteLimit','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.702d9892-92f3-4ebd-92eb-d3ce59d96b2d.settings.charLimit','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.702d9892-92f3-4ebd-92eb-d3ce59d96b2d.settings.code','\"\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.702d9892-92f3-4ebd-92eb-d3ce59d96b2d.settings.columnType','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.702d9892-92f3-4ebd-92eb-d3ce59d96b2d.settings.initialRows','\"4\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.702d9892-92f3-4ebd-92eb-d3ce59d96b2d.settings.multiline','\"\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.702d9892-92f3-4ebd-92eb-d3ce59d96b2d.settings.placeholder','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.702d9892-92f3-4ebd-92eb-d3ce59d96b2d.settings.uiMode','\"normal\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.702d9892-92f3-4ebd-92eb-d3ce59d96b2d.translationKeyFormat','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.702d9892-92f3-4ebd-92eb-d3ce59d96b2d.translationMethod','\"none\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.702d9892-92f3-4ebd-92eb-d3ce59d96b2d.type','\"craft\\\\fields\\\\PlainText\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.columnSuffix','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.contentColumnType','\"text\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.fieldGroup','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.handle','\"button\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.instructions','\"\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.name','\"Button\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.searchable','false'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.addRowLabel','\"Add a row\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columns.__assoc__.0.0','\"col1\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Text\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columns.__assoc__.0.1.__assoc__.1.1','\"text\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columns.__assoc__.0.1.__assoc__.3.1','\"singleline\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columns.__assoc__.1.0','\"col2\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columns.__assoc__.1.1.__assoc__.0.0','\"heading\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columns.__assoc__.1.1.__assoc__.0.1','\"Link\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columns.__assoc__.1.1.__assoc__.1.0','\"handle\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columns.__assoc__.1.1.__assoc__.1.1','\"link\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columns.__assoc__.1.1.__assoc__.2.0','\"width\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columns.__assoc__.1.1.__assoc__.2.1','\"\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columns.__assoc__.1.1.__assoc__.3.0','\"type\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columns.__assoc__.1.1.__assoc__.3.1','\"singleline\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.columnType','\"text\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.maxRows','\"1\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.settings.minRows','\"\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.translationKeyFormat','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.translationMethod','\"none\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.784f0689-cbe8-44df-97a8-b2b7edb9d2f9.type','\"craft\\\\fields\\\\Table\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.columnSuffix','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.contentColumnType','\"text\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.fieldGroup','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.handle','\"copy\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.instructions','\"\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.name','\"Copy\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.searchable','false'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.settings.availableTransforms','\"*\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.settings.availableVolumes','\"*\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.settings.cleanupHtml','true'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.settings.columnType','\"text\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.settings.configSelectionMode','\"choose\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.settings.defaultTransform','\"\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.settings.manualConfig','\"\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.settings.purifierConfig','\"\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.settings.purifyHtml','\"1\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.settings.redactorConfig','\"Simple.json\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.settings.removeEmptyTags','\"1\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.settings.removeInlineStyles','\"1\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.settings.removeNbsp','\"1\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.settings.showHtmlButtonForNonAdmins','\"\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.settings.showUnpermittedFiles','false'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.settings.showUnpermittedVolumes','false'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.settings.uiMode','\"enlarged\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.translationKeyFormat','null'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.translationMethod','\"none\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.fields.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36.type','\"craft\\\\redactor\\\\Field\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.handle','\"callToAction\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.name','\"Call to Action\"'),
	('matrixBlockTypes.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4.sortOrder','4'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.field','\"86f51cdf-0594-49d7-88cd-8cf8daddfd02\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fieldLayouts.010096f1-9026-4c4a-adf0-c09ab46f4cc7.tabs.0.elements.0.fieldUid','\"348dbe41-4699-43c4-aa30-5a9e894bb750\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fieldLayouts.010096f1-9026-4c4a-adf0-c09ab46f4cc7.tabs.0.elements.0.instructions','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fieldLayouts.010096f1-9026-4c4a-adf0-c09ab46f4cc7.tabs.0.elements.0.label','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fieldLayouts.010096f1-9026-4c4a-adf0-c09ab46f4cc7.tabs.0.elements.0.required','false'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fieldLayouts.010096f1-9026-4c4a-adf0-c09ab46f4cc7.tabs.0.elements.0.tip','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fieldLayouts.010096f1-9026-4c4a-adf0-c09ab46f4cc7.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fieldLayouts.010096f1-9026-4c4a-adf0-c09ab46f4cc7.tabs.0.elements.0.warning','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fieldLayouts.010096f1-9026-4c4a-adf0-c09ab46f4cc7.tabs.0.elements.0.width','100'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fieldLayouts.010096f1-9026-4c4a-adf0-c09ab46f4cc7.tabs.0.elements.1.fieldUid','\"5c506142-7e92-44a4-80d4-e3141c44deb1\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fieldLayouts.010096f1-9026-4c4a-adf0-c09ab46f4cc7.tabs.0.elements.1.instructions','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fieldLayouts.010096f1-9026-4c4a-adf0-c09ab46f4cc7.tabs.0.elements.1.label','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fieldLayouts.010096f1-9026-4c4a-adf0-c09ab46f4cc7.tabs.0.elements.1.required','false'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fieldLayouts.010096f1-9026-4c4a-adf0-c09ab46f4cc7.tabs.0.elements.1.tip','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fieldLayouts.010096f1-9026-4c4a-adf0-c09ab46f4cc7.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fieldLayouts.010096f1-9026-4c4a-adf0-c09ab46f4cc7.tabs.0.elements.1.warning','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fieldLayouts.010096f1-9026-4c4a-adf0-c09ab46f4cc7.tabs.0.elements.1.width','100'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fieldLayouts.010096f1-9026-4c4a-adf0-c09ab46f4cc7.tabs.0.name','\"Content\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fieldLayouts.010096f1-9026-4c4a-adf0-c09ab46f4cc7.tabs.0.sortOrder','1'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.348dbe41-4699-43c4-aa30-5a9e894bb750.columnSuffix','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.348dbe41-4699-43c4-aa30-5a9e894bb750.contentColumnType','\"text\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.348dbe41-4699-43c4-aa30-5a9e894bb750.fieldGroup','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.348dbe41-4699-43c4-aa30-5a9e894bb750.handle','\"heading\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.348dbe41-4699-43c4-aa30-5a9e894bb750.instructions','\"\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.348dbe41-4699-43c4-aa30-5a9e894bb750.name','\"Heading\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.348dbe41-4699-43c4-aa30-5a9e894bb750.searchable','false'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.348dbe41-4699-43c4-aa30-5a9e894bb750.settings.byteLimit','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.348dbe41-4699-43c4-aa30-5a9e894bb750.settings.charLimit','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.348dbe41-4699-43c4-aa30-5a9e894bb750.settings.code','\"\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.348dbe41-4699-43c4-aa30-5a9e894bb750.settings.columnType','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.348dbe41-4699-43c4-aa30-5a9e894bb750.settings.initialRows','\"4\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.348dbe41-4699-43c4-aa30-5a9e894bb750.settings.multiline','\"\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.348dbe41-4699-43c4-aa30-5a9e894bb750.settings.placeholder','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.348dbe41-4699-43c4-aa30-5a9e894bb750.settings.uiMode','\"normal\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.348dbe41-4699-43c4-aa30-5a9e894bb750.translationKeyFormat','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.348dbe41-4699-43c4-aa30-5a9e894bb750.translationMethod','\"none\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.348dbe41-4699-43c4-aa30-5a9e894bb750.type','\"craft\\\\fields\\\\PlainText\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.5c506142-7e92-44a4-80d4-e3141c44deb1.columnSuffix','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.5c506142-7e92-44a4-80d4-e3141c44deb1.contentColumnType','\"text\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.5c506142-7e92-44a4-80d4-e3141c44deb1.fieldGroup','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.5c506142-7e92-44a4-80d4-e3141c44deb1.handle','\"abstract\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.5c506142-7e92-44a4-80d4-e3141c44deb1.instructions','\"\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.5c506142-7e92-44a4-80d4-e3141c44deb1.name','\"Abstract\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.5c506142-7e92-44a4-80d4-e3141c44deb1.searchable','false'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.5c506142-7e92-44a4-80d4-e3141c44deb1.settings.byteLimit','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.5c506142-7e92-44a4-80d4-e3141c44deb1.settings.charLimit','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.5c506142-7e92-44a4-80d4-e3141c44deb1.settings.code','\"\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.5c506142-7e92-44a4-80d4-e3141c44deb1.settings.columnType','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.5c506142-7e92-44a4-80d4-e3141c44deb1.settings.initialRows','\"4\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.5c506142-7e92-44a4-80d4-e3141c44deb1.settings.multiline','\"\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.5c506142-7e92-44a4-80d4-e3141c44deb1.settings.placeholder','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.5c506142-7e92-44a4-80d4-e3141c44deb1.settings.uiMode','\"normal\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.5c506142-7e92-44a4-80d4-e3141c44deb1.translationKeyFormat','null'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.5c506142-7e92-44a4-80d4-e3141c44deb1.translationMethod','\"none\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.fields.5c506142-7e92-44a4-80d4-e3141c44deb1.type','\"craft\\\\fields\\\\PlainText\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.handle','\"getInTouch\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.name','\"Get In Touch\"'),
	('matrixBlockTypes.ed04d794-983e-4ce4-acd7-d9f624be015b.sortOrder','2'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.field','\"86f51cdf-0594-49d7-88cd-8cf8daddfd02\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.0.fieldUid','\"388af34e-6bb7-471c-a169-42bbf595ebd2\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.0.instructions','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.0.label','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.0.required','true'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.0.tip','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.0.warning','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.0.width','100'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.1.fieldUid','\"f7946b18-b82b-45f0-8a76-efdba41894bd\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.1.instructions','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.1.label','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.1.required','true'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.1.tip','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.1.warning','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.1.width','100'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.2.fieldUid','\"d0a3a7bc-42c3-4290-832c-467cade4d237\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.2.instructions','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.2.label','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.2.required','false'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.2.tip','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.2.warning','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.2.width','100'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.3.fieldUid','\"1bd75347-c828-488f-8b65-2b5ece47b5e1\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.3.instructions','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.3.label','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.3.required','false'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.3.tip','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.3.warning','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.elements.3.width','100'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.name','\"Content\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fieldLayouts.ddb66937-0cd3-44ba-a72e-274e7de06b57.tabs.0.sortOrder','1'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.columnSuffix','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.contentColumnType','\"text\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.fieldGroup','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.handle','\"button\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.instructions','\"\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.name','\"Button\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.searchable','false'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.addRowLabel','\"Add a row\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columns.__assoc__.0.0','\"col1\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Text\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columns.__assoc__.0.1.__assoc__.1.1','\"text\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columns.__assoc__.0.1.__assoc__.3.1','\"singleline\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columns.__assoc__.1.0','\"col2\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columns.__assoc__.1.1.__assoc__.0.0','\"heading\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columns.__assoc__.1.1.__assoc__.0.1','\"Link\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columns.__assoc__.1.1.__assoc__.1.0','\"handle\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columns.__assoc__.1.1.__assoc__.1.1','\"link\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columns.__assoc__.1.1.__assoc__.2.0','\"width\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columns.__assoc__.1.1.__assoc__.2.1','\"\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columns.__assoc__.1.1.__assoc__.3.0','\"type\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columns.__assoc__.1.1.__assoc__.3.1','\"singleline\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.columnType','\"text\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.maxRows','\"1\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.settings.minRows','\"\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.translationKeyFormat','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.translationMethod','\"none\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.1bd75347-c828-488f-8b65-2b5ece47b5e1.type','\"craft\\\\fields\\\\Table\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.columnSuffix','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.contentColumnType','\"string\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.fieldGroup','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.handle','\"image\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.instructions','\"\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.name','\"Image\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.searchable','false'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.allowedKinds.0','\"image\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.allowSelfRelations','false'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.allowUploads','true'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.defaultUploadLocationSource','\"volume:c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.defaultUploadLocationSubpath','\"\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.limit','\"1\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.localizeRelations','false'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.previewMode','\"full\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.restrictFiles','\"1\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.selectionLabel','\"\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.showSiteMenu','true'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.showUnpermittedFiles','false'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.showUnpermittedVolumes','false'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.singleUploadLocationSource','\"volume:c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.singleUploadLocationSubpath','\"copy-with-image\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.source','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.sources','\"*\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.targetSiteId','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.useSingleFolder','true'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.validateRelatedElements','false'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.settings.viewMode','\"list\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.translationKeyFormat','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.translationMethod','\"site\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.388af34e-6bb7-471c-a169-42bbf595ebd2.type','\"craft\\\\fields\\\\Assets\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.columnSuffix','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.contentColumnType','\"text\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.fieldGroup','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.handle','\"copy\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.instructions','\"\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.name','\"Copy\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.searchable','false'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.settings.availableTransforms','\"*\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.settings.availableVolumes','\"*\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.settings.cleanupHtml','true'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.settings.columnType','\"text\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.settings.configSelectionMode','\"choose\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.settings.defaultTransform','\"\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.settings.manualConfig','\"\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.settings.purifierConfig','\"\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.settings.purifyHtml','\"1\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.settings.redactorConfig','\"Simple.json\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.settings.removeEmptyTags','\"1\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.settings.removeInlineStyles','\"1\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.settings.removeNbsp','\"1\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.settings.showHtmlButtonForNonAdmins','\"\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.settings.showUnpermittedFiles','false'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.settings.showUnpermittedVolumes','false'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.settings.uiMode','\"enlarged\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.translationKeyFormat','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.translationMethod','\"none\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.d0a3a7bc-42c3-4290-832c-467cade4d237.type','\"craft\\\\redactor\\\\Field\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.f7946b18-b82b-45f0-8a76-efdba41894bd.columnSuffix','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.f7946b18-b82b-45f0-8a76-efdba41894bd.contentColumnType','\"text\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.f7946b18-b82b-45f0-8a76-efdba41894bd.fieldGroup','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.f7946b18-b82b-45f0-8a76-efdba41894bd.handle','\"heading\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.f7946b18-b82b-45f0-8a76-efdba41894bd.instructions','\"\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.f7946b18-b82b-45f0-8a76-efdba41894bd.name','\"Heading\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.f7946b18-b82b-45f0-8a76-efdba41894bd.searchable','false'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.f7946b18-b82b-45f0-8a76-efdba41894bd.settings.byteLimit','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.f7946b18-b82b-45f0-8a76-efdba41894bd.settings.charLimit','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.f7946b18-b82b-45f0-8a76-efdba41894bd.settings.code','\"\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.f7946b18-b82b-45f0-8a76-efdba41894bd.settings.columnType','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.f7946b18-b82b-45f0-8a76-efdba41894bd.settings.initialRows','\"4\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.f7946b18-b82b-45f0-8a76-efdba41894bd.settings.multiline','\"\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.f7946b18-b82b-45f0-8a76-efdba41894bd.settings.placeholder','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.f7946b18-b82b-45f0-8a76-efdba41894bd.settings.uiMode','\"normal\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.f7946b18-b82b-45f0-8a76-efdba41894bd.translationKeyFormat','null'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.f7946b18-b82b-45f0-8a76-efdba41894bd.translationMethod','\"none\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.fields.f7946b18-b82b-45f0-8a76-efdba41894bd.type','\"craft\\\\fields\\\\PlainText\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.handle','\"copyWithImage\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.name','\"Copy with Image\"'),
	('matrixBlockTypes.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7.sortOrder','1'),
	('meta.__names__.00ba4136-4522-4595-918d-d5c47a106881','\"Card\"'),
	('meta.__names__.06c04a9c-5709-4012-b643-be89edbaf6d2','\"Verse\"'),
	('meta.__names__.0c37405b-1568-48a8-b355-7c0388e76a43','\"Heading\"'),
	('meta.__names__.1bd75347-c828-488f-8b65-2b5ece47b5e1','\"Button\"'),
	('meta.__names__.22443ea1-187e-49b2-84c4-90598d169bf5','\"Heading\"'),
	('meta.__names__.268674e8-5a06-4a63-9604-27e45158a894','\"Verse Schema\"'),
	('meta.__names__.298ac298-c6d5-46d3-837b-f992d3053ecf','\"Image\"'),
	('meta.__names__.348dbe41-4699-43c4-aa30-5a9e894bb750','\"Heading\"'),
	('meta.__names__.37f099e0-9846-469f-a4e3-abba7e1bbf61','\"Button\"'),
	('meta.__names__.388af34e-6bb7-471c-a169-42bbf595ebd2','\"Image\"'),
	('meta.__names__.503608ce-5321-4dcc-b1a4-68d5b8f0fbcf','\"Hero\"'),
	('meta.__names__.56b811ad-a1bd-49ec-913d-1fe0a0e4ad46','\"Card\"'),
	('meta.__names__.5c506142-7e92-44a4-80d4-e3141c44deb1','\"Abstract\"'),
	('meta.__names__.61f629b2-0417-448a-8350-aff0bac1ec3b','\"Heading\"'),
	('meta.__names__.702d9892-92f3-4ebd-92eb-d3ce59d96b2d','\"Heading\"'),
	('meta.__names__.7388ec92-49aa-477e-8f0d-18d09b43f38b','\"Verse\"'),
	('meta.__names__.784f0689-cbe8-44df-97a8-b2b7edb9d2f9','\"Button\"'),
	('meta.__names__.784f2565-57bc-455f-9ff9-484ca800e333','\"Default\"'),
	('meta.__names__.7c525289-a105-41be-91cb-e05e450b1367','\"Heading\"'),
	('meta.__names__.86f51cdf-0594-49d7-88cd-8cf8daddfd02','\"Components\"'),
	('meta.__names__.8bab4a25-1ca5-43a3-946f-7eb03bcd5d36','\"Copy\"'),
	('meta.__names__.8ccccc07-e07b-4c7e-8056-68a3a2a564d8','\"Cards\"'),
	('meta.__names__.8cd78bca-66f0-4c7e-9a9d-b10f5e81ea6e','\"Button\"'),
	('meta.__names__.951145e5-8882-4843-9e23-ce508b0f9c44','\"Image\"'),
	('meta.__names__.98ce7158-cb01-4c67-a1c6-0ef140775fb1','\"Point\"'),
	('meta.__names__.9983f131-2c73-48e5-a123-879d42e1be5d','\"Entries\"'),
	('meta.__names__.a14102a0-5269-4c9f-a971-5a3063a568d9','\"Button\"'),
	('meta.__names__.a620e457-98d6-426e-88c2-d0278e5b8fb2','\"Copy\"'),
	('meta.__names__.b3c6d4f9-a29b-4862-bf7d-e7a4df8fe121','\"Contact\"'),
	('meta.__names__.b41264ca-8671-443b-876c-ca52160072e9','\"Slides\"'),
	('meta.__names__.b5da51f5-d9b1-4ed1-8780-9c80c659891a','\"Homepage\"'),
	('meta.__names__.b9f2742e-ae14-4113-a183-6bd3de2cf384','\"Copy\"'),
	('meta.__names__.badbce7d-5fea-44f2-871f-66b5597ee650','\"Abstract\"'),
	('meta.__names__.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5','\"Components\"'),
	('meta.__names__.c39ba9f1-bb52-4d48-a6ff-70bd8a69dcc4','\"Call to Action\"'),
	('meta.__names__.cb8562a1-d98c-4f8f-ab71-138ec54875d1','\"Public Schema\"'),
	('meta.__names__.d0a3a7bc-42c3-4290-832c-467cade4d237','\"Copy\"'),
	('meta.__names__.d3ff529d-f0b8-4b6d-a8a6-987dd86d4e24','\"Common\"'),
	('meta.__names__.d4e3d852-e984-4784-af34-69145961849c','\"Card\"'),
	('meta.__names__.dfe86b4e-eb76-4daa-ac3d-2750861ab479','\"Abstract\"'),
	('meta.__names__.ed04d794-983e-4ce4-acd7-d9f624be015b','\"Get In Touch\"'),
	('meta.__names__.ed6307e6-38a4-472d-b6bd-609ec660cec3','\"Homepage\"'),
	('meta.__names__.f17b5a6d-0d50-4627-a8c1-a2555dd9d2c7','\"Copy with Image\"'),
	('meta.__names__.f5c321e4-4cc3-457e-ab1a-610791af7d11','\"Button\"'),
	('meta.__names__.f7946b18-b82b-45f0-8a76-efdba41894bd','\"Heading\"'),
	('meta.__names__.fa3b9545-6fb6-4912-b982-a1031b5b0a53','\"Points\"'),
	('meta.__names__.fe126841-dabc-4168-8e73-d14cf3293ebf','\"Thumbnail\"'),
	('plugins.element-api.edition','\"standard\"'),
	('plugins.element-api.enabled','true'),
	('plugins.element-api.schemaVersion','\"1.0.0\"'),
	('plugins.redactor.edition','\"standard\"'),
	('plugins.redactor.enabled','true'),
	('plugins.redactor.schemaVersion','\"2.3.0\"'),
	('plugins.super-table.edition','\"standard\"'),
	('plugins.super-table.enabled','true'),
	('plugins.super-table.schemaVersion','\"2.2.1\"'),
	('sections.56b811ad-a1bd-49ec-913d-1fe0a0e4ad46.defaultPlacement','\"end\"'),
	('sections.56b811ad-a1bd-49ec-913d-1fe0a0e4ad46.enableVersioning','true'),
	('sections.56b811ad-a1bd-49ec-913d-1fe0a0e4ad46.handle','\"card\"'),
	('sections.56b811ad-a1bd-49ec-913d-1fe0a0e4ad46.name','\"Card\"'),
	('sections.56b811ad-a1bd-49ec-913d-1fe0a0e4ad46.propagationMethod','\"all\"'),
	('sections.56b811ad-a1bd-49ec-913d-1fe0a0e4ad46.siteSettings.06c04a9c-5709-4012-b643-be89edbaf6d2.enabledByDefault','true'),
	('sections.56b811ad-a1bd-49ec-913d-1fe0a0e4ad46.siteSettings.06c04a9c-5709-4012-b643-be89edbaf6d2.hasUrls','false'),
	('sections.56b811ad-a1bd-49ec-913d-1fe0a0e4ad46.siteSettings.06c04a9c-5709-4012-b643-be89edbaf6d2.template','null'),
	('sections.56b811ad-a1bd-49ec-913d-1fe0a0e4ad46.siteSettings.06c04a9c-5709-4012-b643-be89edbaf6d2.uriFormat','null'),
	('sections.56b811ad-a1bd-49ec-913d-1fe0a0e4ad46.type','\"channel\"'),
	('sections.ed6307e6-38a4-472d-b6bd-609ec660cec3.defaultPlacement','\"end\"'),
	('sections.ed6307e6-38a4-472d-b6bd-609ec660cec3.enableVersioning','true'),
	('sections.ed6307e6-38a4-472d-b6bd-609ec660cec3.handle','\"homepage\"'),
	('sections.ed6307e6-38a4-472d-b6bd-609ec660cec3.name','\"Homepage\"'),
	('sections.ed6307e6-38a4-472d-b6bd-609ec660cec3.propagationMethod','\"all\"'),
	('sections.ed6307e6-38a4-472d-b6bd-609ec660cec3.siteSettings.06c04a9c-5709-4012-b643-be89edbaf6d2.enabledByDefault','true'),
	('sections.ed6307e6-38a4-472d-b6bd-609ec660cec3.siteSettings.06c04a9c-5709-4012-b643-be89edbaf6d2.hasUrls','true'),
	('sections.ed6307e6-38a4-472d-b6bd-609ec660cec3.siteSettings.06c04a9c-5709-4012-b643-be89edbaf6d2.template','\"homepage/_entry\"'),
	('sections.ed6307e6-38a4-472d-b6bd-609ec660cec3.siteSettings.06c04a9c-5709-4012-b643-be89edbaf6d2.uriFormat','\"__home__\"'),
	('sections.ed6307e6-38a4-472d-b6bd-609ec660cec3.type','\"single\"'),
	('siteGroups.7388ec92-49aa-477e-8f0d-18d09b43f38b.name','\"Verse\"'),
	('sites.06c04a9c-5709-4012-b643-be89edbaf6d2.baseUrl','\"$PRIMARY_SITE_URL\"'),
	('sites.06c04a9c-5709-4012-b643-be89edbaf6d2.enabled','true'),
	('sites.06c04a9c-5709-4012-b643-be89edbaf6d2.handle','\"default\"'),
	('sites.06c04a9c-5709-4012-b643-be89edbaf6d2.hasUrls','true'),
	('sites.06c04a9c-5709-4012-b643-be89edbaf6d2.language','\"en-GB\"'),
	('sites.06c04a9c-5709-4012-b643-be89edbaf6d2.name','\"Verse\"'),
	('sites.06c04a9c-5709-4012-b643-be89edbaf6d2.primary','true'),
	('sites.06c04a9c-5709-4012-b643-be89edbaf6d2.siteGroup','\"7388ec92-49aa-477e-8f0d-18d09b43f38b\"'),
	('sites.06c04a9c-5709-4012-b643-be89edbaf6d2.sortOrder','1'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.field','\"b41264ca-8671-443b-876c-ca52160072e9\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.0.fieldUid','\"98ce7158-cb01-4c67-a1c6-0ef140775fb1\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.0.instructions','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.0.label','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.0.required','true'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.0.tip','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.0.warning','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.0.width','100'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.1.fieldUid','\"298ac298-c6d5-46d3-837b-f992d3053ecf\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.1.instructions','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.1.label','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.1.required','false'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.1.tip','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.1.warning','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.1.width','100'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.2.fieldUid','\"61f629b2-0417-448a-8350-aff0bac1ec3b\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.2.instructions','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.2.label','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.2.required','true'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.2.tip','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.2.warning','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.2.width','100'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.3.fieldUid','\"b9f2742e-ae14-4113-a183-6bd3de2cf384\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.3.instructions','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.3.label','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.3.required','false'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.3.tip','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.3.warning','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.3.width','100'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.4.fieldUid','\"f5c321e4-4cc3-457e-ab1a-610791af7d11\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.4.instructions','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.4.label','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.4.required','false'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.4.tip','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.4.warning','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.elements.4.width','100'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.name','\"Content\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fieldLayouts.6725325b-19b6-49b8-8057-7ff5378bf2a9.tabs.0.sortOrder','1'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.columnSuffix','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.contentColumnType','\"string\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.fieldGroup','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.handle','\"image\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.instructions','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.name','\"Image\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.searchable','false'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.allowedKinds.0','\"image\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.allowSelfRelations','false'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.allowUploads','true'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.defaultUploadLocationSource','\"volume:c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.defaultUploadLocationSubpath','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.limit','\"1\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.localizeRelations','false'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.previewMode','\"full\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.restrictFiles','\"1\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.selectionLabel','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.showSiteMenu','true'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.showUnpermittedFiles','false'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.showUnpermittedVolumes','false'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.singleUploadLocationSource','\"volume:c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.singleUploadLocationSubpath','\"hero\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.source','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.sources','\"*\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.targetSiteId','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.useSingleFolder','true'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.validateRelatedElements','false'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.settings.viewMode','\"list\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.translationKeyFormat','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.translationMethod','\"site\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.298ac298-c6d5-46d3-837b-f992d3053ecf.type','\"craft\\\\fields\\\\Assets\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.61f629b2-0417-448a-8350-aff0bac1ec3b.columnSuffix','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.61f629b2-0417-448a-8350-aff0bac1ec3b.contentColumnType','\"text\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.61f629b2-0417-448a-8350-aff0bac1ec3b.fieldGroup','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.61f629b2-0417-448a-8350-aff0bac1ec3b.handle','\"heading\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.61f629b2-0417-448a-8350-aff0bac1ec3b.instructions','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.61f629b2-0417-448a-8350-aff0bac1ec3b.name','\"Heading\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.61f629b2-0417-448a-8350-aff0bac1ec3b.searchable','false'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.61f629b2-0417-448a-8350-aff0bac1ec3b.settings.byteLimit','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.61f629b2-0417-448a-8350-aff0bac1ec3b.settings.charLimit','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.61f629b2-0417-448a-8350-aff0bac1ec3b.settings.code','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.61f629b2-0417-448a-8350-aff0bac1ec3b.settings.columnType','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.61f629b2-0417-448a-8350-aff0bac1ec3b.settings.initialRows','\"4\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.61f629b2-0417-448a-8350-aff0bac1ec3b.settings.multiline','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.61f629b2-0417-448a-8350-aff0bac1ec3b.settings.placeholder','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.61f629b2-0417-448a-8350-aff0bac1ec3b.settings.uiMode','\"normal\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.61f629b2-0417-448a-8350-aff0bac1ec3b.translationKeyFormat','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.61f629b2-0417-448a-8350-aff0bac1ec3b.translationMethod','\"none\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.61f629b2-0417-448a-8350-aff0bac1ec3b.type','\"craft\\\\fields\\\\PlainText\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.98ce7158-cb01-4c67-a1c6-0ef140775fb1.columnSuffix','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.98ce7158-cb01-4c67-a1c6-0ef140775fb1.contentColumnType','\"text\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.98ce7158-cb01-4c67-a1c6-0ef140775fb1.fieldGroup','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.98ce7158-cb01-4c67-a1c6-0ef140775fb1.handle','\"point\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.98ce7158-cb01-4c67-a1c6-0ef140775fb1.instructions','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.98ce7158-cb01-4c67-a1c6-0ef140775fb1.name','\"Point\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.98ce7158-cb01-4c67-a1c6-0ef140775fb1.searchable','false'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.98ce7158-cb01-4c67-a1c6-0ef140775fb1.settings.byteLimit','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.98ce7158-cb01-4c67-a1c6-0ef140775fb1.settings.charLimit','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.98ce7158-cb01-4c67-a1c6-0ef140775fb1.settings.code','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.98ce7158-cb01-4c67-a1c6-0ef140775fb1.settings.columnType','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.98ce7158-cb01-4c67-a1c6-0ef140775fb1.settings.initialRows','\"4\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.98ce7158-cb01-4c67-a1c6-0ef140775fb1.settings.multiline','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.98ce7158-cb01-4c67-a1c6-0ef140775fb1.settings.placeholder','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.98ce7158-cb01-4c67-a1c6-0ef140775fb1.settings.uiMode','\"normal\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.98ce7158-cb01-4c67-a1c6-0ef140775fb1.translationKeyFormat','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.98ce7158-cb01-4c67-a1c6-0ef140775fb1.translationMethod','\"none\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.98ce7158-cb01-4c67-a1c6-0ef140775fb1.type','\"craft\\\\fields\\\\PlainText\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.columnSuffix','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.contentColumnType','\"text\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.fieldGroup','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.handle','\"copy\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.instructions','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.name','\"Copy\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.searchable','false'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.settings.availableTransforms','\"*\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.settings.availableVolumes','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.settings.cleanupHtml','true'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.settings.columnType','\"text\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.settings.configSelectionMode','\"choose\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.settings.defaultTransform','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.settings.manualConfig','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.settings.purifierConfig','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.settings.purifyHtml','\"1\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.settings.redactorConfig','\"Simple.json\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.settings.removeEmptyTags','\"1\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.settings.removeInlineStyles','\"1\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.settings.removeNbsp','\"1\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.settings.showHtmlButtonForNonAdmins','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.settings.showUnpermittedFiles','false'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.settings.showUnpermittedVolumes','false'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.settings.uiMode','\"enlarged\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.translationKeyFormat','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.translationMethod','\"none\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.b9f2742e-ae14-4113-a183-6bd3de2cf384.type','\"craft\\\\redactor\\\\Field\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.columnSuffix','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.contentColumnType','\"text\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.fieldGroup','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.handle','\"button\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.instructions','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.name','\"Button\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.searchable','false'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.addRowLabel','\"Add a row\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columns.__assoc__.0.0','\"col1\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Text\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columns.__assoc__.0.1.__assoc__.1.1','\"text\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columns.__assoc__.0.1.__assoc__.3.1','\"singleline\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columns.__assoc__.1.0','\"col2\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columns.__assoc__.1.1.__assoc__.0.0','\"heading\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columns.__assoc__.1.1.__assoc__.0.1','\"Link\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columns.__assoc__.1.1.__assoc__.1.0','\"handle\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columns.__assoc__.1.1.__assoc__.1.1','\"link\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columns.__assoc__.1.1.__assoc__.2.0','\"width\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columns.__assoc__.1.1.__assoc__.2.1','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columns.__assoc__.1.1.__assoc__.3.0','\"type\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columns.__assoc__.1.1.__assoc__.3.1','\"singleline\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.columnType','\"text\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.maxRows','\"1\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.settings.minRows','\"\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.translationKeyFormat','null'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.translationMethod','\"none\"'),
	('superTableBlockTypes.9bc45838-e825-42a4-86cd-a368de3ba8b8.fields.f5c321e4-4cc3-457e-ab1a-610791af7d11.type','\"craft\\\\fields\\\\Table\"'),
	('system.edition','\"pro\"'),
	('system.live','true'),
	('system.name','\"Verse\"'),
	('system.schemaVersion','\"3.7.8\"'),
	('system.timeZone','\"America/Los_Angeles\"'),
	('users.allowPublicRegistration','false'),
	('users.defaultGroup','null'),
	('users.photoSubpath','null'),
	('users.photoVolumeUid','null'),
	('users.requireEmailVerification','true'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.autocapitalize','true'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.autocomplete','false'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.autocorrect','true'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.class','null'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.disabled','false'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.id','null'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.instructions','null'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.label','null'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.max','null'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.min','null'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.name','null'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.orientation','null'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.placeholder','null'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.readonly','false'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.requirable','false'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.size','null'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.step','null'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.tip','null'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.title','null'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.warning','null'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.elements.0.width','100'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.name','\"Content\"'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.fieldLayouts.cc8cbc34-5a34-48cc-9964-bfd0663cace2.tabs.0.sortOrder','1'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.handle','\"card\"'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.hasUrls','true'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.name','\"Card\"'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.settings.path','\"@webroot/images/components\"'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.sortOrder','2'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.titleTranslationKeyFormat','null'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.titleTranslationMethod','\"site\"'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.type','\"craft\\\\volumes\\\\Local\"'),
	('volumes.00ba4136-4522-4595-918d-d5c47a106881.url','\"@web/images/components\"'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.autocapitalize','true'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.autocomplete','false'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.autocorrect','true'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.class','null'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.disabled','false'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.id','null'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.instructions','null'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.label','null'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.max','null'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.min','null'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.name','null'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.orientation','null'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.placeholder','null'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.readonly','false'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.requirable','false'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.size','null'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.step','null'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.tip','null'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.title','null'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.warning','null'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.elements.0.width','100'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.name','\"Content\"'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.fieldLayouts.a4e559fd-26cd-4ea8-8173-1221b6746273.tabs.0.sortOrder','1'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.handle','\"components\"'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.hasUrls','true'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.name','\"Components\"'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.settings.path','\"@webroot/images/components\"'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.sortOrder','1'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.titleTranslationKeyFormat','null'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.titleTranslationMethod','\"site\"'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.type','\"craft\\\\volumes\\\\Local\"'),
	('volumes.c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5.url','\"@web/images/components\"');

/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `queue`;

CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_vhlbqxqedooojltznmhbaokfjtkotkfeovin` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_xzkvlxctflkirxadsrfpwjdrhilkfycnssji` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `relations`;

CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ylqinagqypqialmhgtkxcerndksssrttjccd` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_uqanqdzjmhwpivmltewkppudqbdhttwzswlu` (`sourceId`),
  KEY `idx_jpkxtcwryojabrfhkeppurfasjotquaxpbqz` (`targetId`),
  KEY `idx_jzhnyhulnxssluwlqhllyotzfymgndkjyytq` (`sourceSiteId`),
  CONSTRAINT `fk_pqcazulsldnnvelzqomjryevnhdmsootqpny` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qnsdaydwfwgiezsopwsadrbbqkidfmoomjaj` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yhulhwtmymctiiwtheepoiohmdzdwhhjfpmt` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zbbphqaouhtcwnxdjfjdqrzpnsimrucyvhdp` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(19,19,41,NULL,42,1,'2022-01-29 20:58:33','2022-01-29 20:58:33','de0583d5-49dd-442c-af02-7a01fc04659c'),
	(20,19,43,NULL,42,1,'2022-01-29 20:58:38','2022-01-29 20:58:38','4152dc57-c9e9-476d-9854-486c0f9a4499'),
	(21,19,44,NULL,45,1,'2022-01-29 20:58:55','2022-01-29 20:58:55','58d81074-040a-4eca-a37e-0fa73261b607'),
	(22,19,46,NULL,45,1,'2022-01-29 20:58:57','2022-01-29 20:58:57','7ddb0ec7-5862-4159-9059-7d93e3620c6f'),
	(23,19,47,NULL,48,1,'2022-01-29 20:59:00','2022-01-29 20:59:00','637b83f7-484b-4a8c-8741-a45b9daf4375'),
	(24,19,49,NULL,48,1,'2022-01-29 20:59:11','2022-01-29 20:59:11','f7aab110-9c53-4cdc-a88d-afe334723350'),
	(29,11,36,NULL,41,1,'2022-01-29 21:00:09','2022-01-29 21:00:09','c6f940eb-69f6-4669-b992-c181b8561a2e'),
	(30,11,36,NULL,44,2,'2022-01-29 21:00:09','2022-01-29 21:00:09','b4897c31-db92-4bf5-a5e9-41029a6eeb48'),
	(31,11,36,NULL,47,3,'2022-01-29 21:00:09','2022-01-29 21:00:09','a436e068-f8f6-4d47-acc6-0151b138583a'),
	(33,11,70,NULL,41,1,'2022-01-29 21:00:10','2022-01-29 21:00:10','ed8308eb-8437-4f15-a198-86abf8919938'),
	(34,11,70,NULL,44,2,'2022-01-29 21:00:10','2022-01-29 21:00:10','78d35b6d-560c-4ee9-8287-2c1f23abf915'),
	(35,11,70,NULL,47,3,'2022-01-29 21:00:10','2022-01-29 21:00:10','4750e0c3-cc43-4631-93e8-6e420814d27e'),
	(41,14,65,NULL,73,1,'2022-01-29 21:01:00','2022-01-29 21:01:00','491265a7-2baf-4dcb-8a29-a5ebd524d528'),
	(43,11,83,NULL,41,1,'2022-01-29 21:01:01','2022-01-29 21:01:01','a2d294d1-a5b7-46f2-92aa-d729c585eaed'),
	(44,11,83,NULL,44,2,'2022-01-29 21:01:01','2022-01-29 21:01:01','3ddda7bc-474a-4a18-b02f-6e3317189840'),
	(45,11,83,NULL,47,3,'2022-01-29 21:01:01','2022-01-29 21:01:01','88dfe52d-05e4-474b-a8ed-b80ab3e4a37b'),
	(46,14,84,NULL,73,1,'2022-01-29 21:01:01','2022-01-29 21:01:01','568b5058-8353-4d68-b41e-863f895cd523'),
	(53,11,95,NULL,41,1,'2022-01-29 23:25:44','2022-01-29 23:25:44','fe4f103e-7db2-44a2-b2a5-32a49eeb47ca'),
	(54,11,95,NULL,44,2,'2022-01-29 23:25:44','2022-01-29 23:25:44','f95cbe06-00e5-4d60-bd70-688f20e06484'),
	(55,11,95,NULL,47,3,'2022-01-29 23:25:44','2022-01-29 23:25:44','b63ec042-5960-4c0c-8b72-b830f586d716'),
	(56,14,96,NULL,73,1,'2022-01-29 23:25:44','2022-01-29 23:25:44','66c950aa-794d-42cb-adcf-bbe0a6cc6fe1'),
	(63,11,109,NULL,41,1,'2022-01-29 23:33:15','2022-01-29 23:33:15','ad96b74f-c166-43da-94d1-5e5943f44125'),
	(64,11,109,NULL,44,2,'2022-01-29 23:33:15','2022-01-29 23:33:15','09437f1b-26b4-42d9-ae4a-f33a6830e5fe'),
	(65,11,109,NULL,47,3,'2022-01-29 23:33:15','2022-01-29 23:33:15','c3929882-9484-48b4-bebd-2d74cb2a4b50'),
	(66,14,110,NULL,73,1,'2022-01-29 23:33:15','2022-01-29 23:33:15','da980b4f-d944-4d88-b8a0-e3e8502053db'),
	(73,11,123,NULL,41,1,'2022-01-29 23:34:58','2022-01-29 23:34:58','d88967ab-2c44-40d7-abfc-bcb4ec3fbd9a'),
	(74,11,123,NULL,44,2,'2022-01-29 23:34:58','2022-01-29 23:34:58','fd967745-4c3b-4e40-bd61-f6e7eab6e70a'),
	(75,11,123,NULL,47,3,'2022-01-29 23:34:58','2022-01-29 23:34:58','392b24d8-b26c-48f2-9d60-73c0193d24a7'),
	(76,14,124,NULL,73,1,'2022-01-29 23:34:58','2022-01-29 23:34:58','3059eff6-9943-477d-9995-f185752408ee'),
	(83,11,137,NULL,41,1,'2022-01-29 23:43:37','2022-01-29 23:43:37','d2b0babb-0243-44e4-b348-a2421dc4653c'),
	(84,11,137,NULL,44,2,'2022-01-29 23:43:37','2022-01-29 23:43:37','abf8350a-03c1-46d9-8b63-8a987ea4ac32'),
	(85,11,137,NULL,47,3,'2022-01-29 23:43:37','2022-01-29 23:43:37','c7aa6dab-9801-4288-a8af-9663990cff7c'),
	(86,14,138,NULL,73,1,'2022-01-29 23:43:37','2022-01-29 23:43:37','51af6aa3-b454-41ed-810c-ffc6af7e6a58'),
	(93,11,154,NULL,41,1,'2022-01-30 21:42:10','2022-01-30 21:42:10','e2064e87-215a-4301-9ac2-b9fdcaedc5d3'),
	(94,11,154,NULL,44,2,'2022-01-30 21:42:10','2022-01-30 21:42:10','c4491bb7-f7e5-4d6f-b2a0-ef867c6c0763'),
	(95,11,154,NULL,47,3,'2022-01-30 21:42:10','2022-01-30 21:42:10','53b69008-d27c-43b6-b800-f742bc987cbe'),
	(96,14,155,NULL,73,1,'2022-01-30 21:42:10','2022-01-30 21:42:10','ecaf9ff1-5461-40da-98de-5a9743dc4a7f'),
	(103,29,168,NULL,7,1,'2022-01-30 21:44:11','2022-01-30 21:44:11','4446a90e-54ba-4e58-afda-e105064b797f'),
	(104,29,169,NULL,7,1,'2022-01-30 21:44:15','2022-01-30 21:44:15','0dc703c6-ab5b-455c-a3a9-2e6a2fd6e6b5'),
	(105,29,170,NULL,7,1,'2022-01-30 21:44:17','2022-01-30 21:44:17','216f50ab-e36d-4ecb-9322-c2ea017a5d92'),
	(106,29,171,NULL,7,1,'2022-01-30 21:44:20','2022-01-30 21:44:20','8cef950d-fbd1-4f08-b8db-55764b7db790'),
	(107,29,172,NULL,7,1,'2022-01-30 21:44:23','2022-01-30 21:44:23','7fb0607e-1f68-4e4e-bd53-02a8b7ea27b6'),
	(112,29,177,NULL,7,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','07117bbf-b703-4e6a-8a70-a1ba263d9e59'),
	(113,29,178,NULL,7,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','6bb5c366-bb2d-4d22-966a-d612dee86000'),
	(114,11,180,NULL,41,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','68060934-2dbb-4ea1-9f57-ec4b4f62d2bd'),
	(115,11,180,NULL,44,2,'2022-01-30 21:44:27','2022-01-30 21:44:27','02367c68-94c8-4618-a46e-62bac0fac44f'),
	(116,11,180,NULL,47,3,'2022-01-30 21:44:27','2022-01-30 21:44:27','5606c0c4-cecf-462f-a3b8-21476bfefb89'),
	(117,14,181,NULL,73,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','6deb9721-ab18-4f0e-bed6-68fc1f8dcb7d'),
	(126,29,195,NULL,7,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','e995c400-a15f-4cc7-a9b9-303e206757c1'),
	(127,29,196,NULL,7,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','37a54763-408d-4a7d-bc84-d23692c8e560'),
	(128,11,198,NULL,41,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','62f5839e-954f-4e5b-a9f6-6f5e53e93bbf'),
	(129,11,198,NULL,44,2,'2022-01-30 21:44:35','2022-01-30 21:44:35','43a56785-f064-470a-8757-e0dc853a2ce4'),
	(130,11,198,NULL,47,3,'2022-01-30 21:44:35','2022-01-30 21:44:35','5a62b3ef-a0db-4cfa-9f55-434c290aa075'),
	(131,14,199,NULL,73,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','826b6b1b-c66d-4ef2-a033-e5702ee58709'),
	(140,29,213,NULL,7,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','fd40ba0b-5425-4677-b7aa-2b6121233b04'),
	(141,29,214,NULL,7,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','dc822e5f-7ce5-408f-80b3-8b78ffd64704'),
	(142,11,216,NULL,41,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','375be114-4a3c-4cb3-bc5a-c4ed9dad6775'),
	(143,11,216,NULL,44,2,'2022-01-30 21:45:09','2022-01-30 21:45:09','1c436858-738e-4133-a175-e0ea28cba036'),
	(144,11,216,NULL,47,3,'2022-01-30 21:45:09','2022-01-30 21:45:09','a4ffa6a5-34dd-4d0f-8eab-e780ebb41411'),
	(145,14,217,NULL,73,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','2eacf6a4-92eb-4a8d-8de9-047503ccd303'),
	(153,29,231,NULL,7,1,'2022-01-30 21:45:24','2022-01-30 21:45:24','81ce28f5-a47e-4d40-9018-6113077f0081'),
	(154,29,232,NULL,7,1,'2022-01-30 21:45:32','2022-01-30 21:45:32','0f2c66ab-0601-4efe-b6ef-515f5a382519'),
	(155,29,233,NULL,7,1,'2022-01-30 21:45:34','2022-01-30 21:45:34','370fd996-43d9-41fb-ad13-4077e92eecd7'),
	(156,29,234,NULL,7,1,'2022-01-30 21:45:41','2022-01-30 21:45:41','d28797bc-9bbc-481b-9b19-33db4a53ca56'),
	(157,29,235,NULL,7,1,'2022-01-30 21:45:41','2022-01-30 21:45:41','304c27e3-988a-47cc-aa6b-07694844abde'),
	(158,29,236,NULL,7,1,'2022-01-30 21:45:43','2022-01-30 21:45:43','5ae8b5dc-9344-439d-926e-934b65f14921'),
	(159,29,237,NULL,7,1,'2022-01-30 21:45:45','2022-01-30 21:45:45','bcb0e645-34a9-4373-9adf-67830159c0ef'),
	(160,29,238,NULL,7,1,'2022-01-30 21:45:46','2022-01-30 21:45:46','ecfe453f-0aec-473f-b990-856cb698a0ec'),
	(161,29,239,NULL,7,1,'2022-01-30 21:45:47','2022-01-30 21:45:47','8dc04c5e-dc58-4be1-b728-15d86bce6c77'),
	(162,29,240,NULL,7,1,'2022-01-30 21:45:49','2022-01-30 21:45:49','0243386c-bc41-49e3-b819-b6879f963f7e'),
	(166,29,245,NULL,7,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','72f990af-03cf-44f0-8ded-40fa17a521b9'),
	(167,29,246,NULL,7,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','44204633-33a7-4a07-83a8-773931d0fc22'),
	(168,29,247,NULL,7,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','885fd674-8201-4681-b0cd-b34cd127b72a'),
	(169,11,249,NULL,41,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','3fa86ec3-fccc-4f43-bf2e-b39fb434ce9f'),
	(170,11,249,NULL,44,2,'2022-01-30 21:45:54','2022-01-30 21:45:54','fdd607f0-fc53-4d96-afe1-9c7f9e34cb9e'),
	(171,11,249,NULL,47,3,'2022-01-30 21:45:54','2022-01-30 21:45:54','d42c940a-5c27-4dc5-b780-eccd302bd37d'),
	(172,14,250,NULL,73,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','b92ed165-3c72-457f-b471-7db1bf541e88'),
	(182,29,265,NULL,7,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','33a9e1b3-c41b-4e0e-8d23-ebe47f7f152b'),
	(183,29,266,NULL,7,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','44f46bf6-f6a6-4540-b417-f6e6573e345d'),
	(184,29,267,NULL,7,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','74bc723f-3ebe-4327-9bff-e9628cc3d98b'),
	(185,11,269,NULL,41,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','bce7c33d-78b1-428c-aaf5-54b650127c8a'),
	(186,11,269,NULL,44,2,'2022-01-30 22:18:35','2022-01-30 22:18:35','2973cecf-89ed-495c-9dc8-4f27a43b22c8'),
	(187,11,269,NULL,47,3,'2022-01-30 22:18:35','2022-01-30 22:18:35','76b9f147-2506-4e32-906d-15ccc93d0cd6'),
	(188,14,270,NULL,73,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','3189033e-9ad2-4084-be58-b01cea931a30'),
	(204,29,288,NULL,285,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','c8e00815-ef88-4db9-a0d6-15b1687cd53e'),
	(205,29,289,NULL,284,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','05d16dcd-f487-4180-977c-79981eb882a7'),
	(206,11,292,NULL,41,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','b48e143d-8408-440d-a56b-c06ce8c1a2ce'),
	(207,11,292,NULL,44,2,'2022-01-30 22:33:44','2022-01-30 22:33:44','32b1811b-6a34-4763-a2f2-1993b58cf624'),
	(208,11,292,NULL,47,3,'2022-01-30 22:33:44','2022-01-30 22:33:44','d51fe6d2-c2a1-459c-b6ce-0d634abc86c5'),
	(209,14,293,NULL,73,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','6fbe2bf5-22c6-4f8f-952c-76296d873bb6'),
	(220,29,149,NULL,283,1,'2022-01-30 22:40:09','2022-01-30 22:40:09','f889cf1a-1df3-4e76-a71c-9635c723a08a'),
	(221,29,174,NULL,285,1,'2022-01-30 22:40:09','2022-01-30 22:40:09','b445be38-688d-46fd-907c-ed1f262860ac'),
	(222,29,242,NULL,284,1,'2022-01-30 22:40:09','2022-01-30 22:40:09','8131ac78-fd99-4221-bb83-6379f167d860'),
	(224,29,308,NULL,283,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','27270337-b8a1-4f06-9362-4decb6c3efe6'),
	(225,29,309,NULL,285,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','c5a14ea0-3aba-47e6-a1b6-34d620bd9bce'),
	(226,29,310,NULL,284,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','7dea484f-fd91-4846-bc14-cab9d71854fe'),
	(227,11,312,NULL,41,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','c1f58c79-a788-47c5-88cc-4567b566e8a7'),
	(228,11,312,NULL,44,2,'2022-01-30 22:40:10','2022-01-30 22:40:10','cfede829-61ee-40c9-b748-e04cf45cb4d9'),
	(229,11,312,NULL,47,3,'2022-01-30 22:40:10','2022-01-30 22:40:10','6bd061f9-1576-4dce-be53-e57b15bb6fa2'),
	(230,14,313,NULL,73,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','cfea9fb9-dd02-46f4-83a7-3bdf8dea4e97');

/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table resourcepaths
# ------------------------------------------------------------

DROP TABLE IF EXISTS `resourcepaths`;

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;

INSERT INTO `resourcepaths` (`hash`, `path`)
VALUES
	('153f4dc8','@craft/web/assets/iframeresizer/dist'),
	('15986204','@app/web/assets/edituser/dist'),
	('1702cbe7','@app/web/assets/elementresizedetector/dist'),
	('1856a491','@app/web/assets/picturefill/dist'),
	('1e5e447f','@craft/web/assets/d3/dist'),
	('1f088ebb','@app/web/assets/xregexp/dist'),
	('2107f13c','@app/web/assets/jqueryui/dist'),
	('23d31687','@app/web/assets/admintable/dist'),
	('2c57c9ba','@app/web/assets/focusvisible/dist'),
	('2e863369','@app/web/assets/clearcaches/dist'),
	('308b5ad9','@app/web/assets/jquerytouchevents/dist'),
	('33c01f16','@app/web/assets/axios/dist'),
	('34ea749d','@verbb/base/resources/dist'),
	('355488f3','@app/web/assets/vue/dist'),
	('35e254fc','@app/web/assets/editsection/dist'),
	('385a6c90','@craft/web/assets/axios/dist'),
	('46b6236','@craft/web/assets/cp/dist'),
	('4a6370a4','@app/web/assets/fabric/dist'),
	('4b2c2d3','@craft/redactor/assets/redactor-plugins/dist/video'),
	('4eb3ccc2','@craft/web/assets/fabric/dist'),
	('529232e3','@app/web/assets/matrix/dist'),
	('5db010d7','@app/web/assets/editentry/dist'),
	('5e995afc','@craft/web/assets/utilities/dist'),
	('61512779','@app/web/assets/prismjs/dist'),
	('6601fbd5','@craft/web/assets/garnish/dist'),
	('690d1ad','@craft/web/assets/focusvisible/dist'),
	('6e7d170','@craft/redactor/assets/redactor/dist'),
	('7339b346','@verbb/supertable/resources/dist'),
	('778fb82a','@craft/web/assets/admintable/dist'),
	('78d9c855','@app/web/assets/velocity/dist'),
	('7a71fc99','@app/web/assets/fields/dist'),
	('7d16d2d7','@app/web/assets/dashboard/dist'),
	('82357473','@craft/web/assets/datepickeri18n/dist'),
	('823c07e','@craft/web/assets/selectize/dist'),
	('86b5b092','@craft/web/assets/clearcaches/dist'),
	('89a9ff03','@craft/web/assets/velocity/dist'),
	('8ada4488','@app/web/assets/selectize/dist'),
	('8beebd16','@app/web/assets/installer/dist'),
	('8c3efdb4','@craft/web/assets/jquerypayment/dist'),
	('8c6d22d6','@craft/web/assets/jquerytouchevents/dist'),
	('8ff256cf','@app/web/assets/graphiql/dist'),
	('90afda21','@app/web/assets/fieldsettings/dist'),
	('937e55b9','@app/web/assets/craftsupport/dist'),
	('93ebfae9','@craft/redactor/assets/field/dist'),
	('94da4274','@app/web/assets/datepickeri18n/dist'),
	('96c60f17','@app/web/assets/iframeresizer/dist'),
	('9a50be6c','@app/web/assets/fileupload/dist'),
	('9d892758','@craft/web/assets/vue/dist'),
	('9dd1d707','@craft/web/assets/editsection/dist'),
	('9decf978','@app/web/assets/updateswidget/dist'),
	('a356bb16','@app/web/assets/recententries/dist'),
	('a42ebad2','@app/web/assets/d3/dist'),
	('a523d1b0','@app/web/assets/pluginstore/dist'),
	('ab639d3a','@craft/redactor/assets/redactor-plugins/dist/fullscreen'),
	('b065276a','@craft/web/assets/picturefill/dist'),
	('b1bffa63','@craft/web/assets/login/dist'),
	('ba2589e5','@app/web/assets/login/dist'),
	('bbdd9a6a','@craft/web/assets/xregexp/dist'),
	('be1b9c9b','@app/web/assets/cp/dist'),
	('bf17d7d6','@craft/web/assets/timepicker/dist'),
	('c284f623','@app/web/assets/userpermissions/dist'),
	('c2d4ef04','@app/web/assets/garnish/dist'),
	('c58433a8','@craft/web/assets/prismjs/dist'),
	('c700d725','@app/web/assets/feed/dist'),
	('ce0c10c1','@craft/web/assets/fileupload/dist'),
	('d077c66a','@craft/web/assets/jqueryui/dist'),
	('d54ab055','@app/web/assets/tablesettings/dist'),
	('da90567c','@bower/jquery/dist'),
	('dc60de0a','@app/web/assets/utilities/dist'),
	('df499421','@craft/web/assets/editentry/dist'),
	('df704994','@craft/web/assets/elementresizedetector/dist'),
	('eb4b797b','@app/web/assets/timepicker/dist'),
	('f6ca834a','@app/web/assets/matrixsettings/dist'),
	('fc7bf6b','@app/web/assets/jquerypayment/dist');

/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table revisions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `revisions`;

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lupqgfzxkmrmhpcejmzmlvqhpptqgmwgqrhv` (`sourceId`,`num`),
  KEY `fk_cqctkofuctuuniztcupqesnbsoyajojedbyf` (`creatorId`),
  CONSTRAINT `fk_cqctkofuctuuniztcupqesnbsoyajojedbyf` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_fqhxadtteihtewjwprkkpeqbwbofwtaqrllp` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;

INSERT INTO `revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`)
VALUES
	(1,2,1,1,NULL),
	(2,2,1,2,NULL),
	(3,2,1,3,'Applied “Draft 1”'),
	(4,41,1,1,''),
	(5,44,1,1,''),
	(6,47,1,1,''),
	(7,2,1,4,'Applied “Draft 1”'),
	(8,2,1,5,'Applied “Draft 1”'),
	(9,2,1,6,'Applied “Draft 1”'),
	(10,2,1,7,'Applied “Draft 1”'),
	(11,2,1,8,'Applied “Draft 1”'),
	(12,2,1,9,'Applied “Draft 1”'),
	(13,2,1,10,'Applied “Draft 1”'),
	(14,2,1,11,'Applied “Draft 1”'),
	(15,2,1,12,'Applied “Draft 1”'),
	(16,2,1,13,'Applied “Draft 1”'),
	(17,2,1,14,'Applied “Draft 1”'),
	(18,2,1,15,'Applied “Draft 1”'),
	(19,2,1,16,'Applied “Draft 1”'),
	(20,2,1,17,'Applied “Draft 1”');

/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table searchindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `searchindex`;

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_vwjgwtypisyjyryijzudzqnvhxjlxdwomjzd` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`)
VALUES
	(1,'username',0,1,' admin '),
	(1,'lastname',0,1,''),
	(1,'fullname',0,1,''),
	(1,'firstname',0,1,''),
	(34,'slug',0,1,''),
	(35,'slug',0,1,''),
	(2,'slug',0,1,' homepage '),
	(2,'title',0,1,' homepage '),
	(6,'slug',0,1,''),
	(7,'filename',0,1,' copy with image png '),
	(7,'extension',0,1,' png '),
	(7,'kind',0,1,' image '),
	(7,'slug',0,1,''),
	(7,'title',0,1,' copy with image '),
	(36,'slug',0,1,''),
	(41,'slug',0,1,' this is a wide container title stretching two lines '),
	(41,'title',0,1,' this is a wide container title stretching two lines '),
	(42,'filename',0,1,' card 1 png '),
	(42,'extension',0,1,' png '),
	(42,'kind',0,1,' image '),
	(42,'slug',0,1,''),
	(42,'title',0,1,' card 1 '),
	(44,'title',0,1,' this is a wide container title stretching two lines '),
	(44,'slug',0,1,' this is a wide container title stretching two lines '),
	(45,'filename',0,1,' card 2 png '),
	(45,'extension',0,1,' png '),
	(45,'kind',0,1,' image '),
	(45,'slug',0,1,''),
	(45,'title',0,1,' card 2 '),
	(47,'slug',0,1,' this is a wide container title stretching two lines '),
	(48,'filename',0,1,' card 3 png '),
	(48,'extension',0,1,' png '),
	(48,'kind',0,1,' image '),
	(48,'slug',0,1,''),
	(48,'title',0,1,' card 3 '),
	(47,'title',0,1,' this is a wide container title stretching two lines '),
	(65,'slug',0,1,''),
	(66,'slug',0,1,''),
	(73,'filename',0,1,' copy with image png '),
	(73,'extension',0,1,' png '),
	(73,'kind',0,1,' image '),
	(73,'slug',0,1,''),
	(73,'title',0,1,' copy with image '),
	(105,'slug',0,1,''),
	(149,'slug',0,1,''),
	(174,'slug',0,1,''),
	(242,'slug',0,1,''),
	(283,'filename',0,1,' hero image opt jpeg '),
	(283,'extension',0,1,' jpeg '),
	(283,'kind',0,1,' image '),
	(283,'slug',0,1,''),
	(283,'title',0,1,' hero image opt '),
	(284,'filename',0,1,' verse hero 3 jpeg '),
	(284,'extension',0,1,' jpeg '),
	(284,'kind',0,1,' image '),
	(284,'slug',0,1,''),
	(284,'title',0,1,' verse hero 3 '),
	(285,'filename',0,1,' verse hero 2 jpeg '),
	(285,'extension',0,1,' jpeg '),
	(285,'kind',0,1,' image '),
	(285,'slug',0,1,''),
	(285,'title',0,1,' verse hero 2 '),
	(1,'email',0,1,' alexrees1993 googlemail com '),
	(1,'slug',0,1,'');

/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_znzyaklapfbkrgkcxrbhuniinwzhapuugeil` (`handle`),
  KEY `idx_axmwvvfrthizudgqfqomejtfvyxlnpbwwgix` (`name`),
  KEY `idx_yfvlyespjhqieftvfltmmnkgpebxuxljmnoi` (`structureId`),
  KEY `idx_qfokrqjymassnfscpfvqfrumczqtkzrkitan` (`dateDeleted`),
  CONSTRAINT `fk_bfcnngnbhtfavpjzqeywbdcfvaydyitfjzta` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `defaultPlacement`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,'Homepage','homepage','single',1,'all','end',NULL,'2022-01-29 20:39:48','2022-01-29 20:39:48',NULL,'ed6307e6-38a4-472d-b6bd-609ec660cec3'),
	(2,NULL,'Card','card','channel',1,'all','end',NULL,'2022-01-29 20:55:17','2022-01-29 20:55:17',NULL,'56b811ad-a1bd-49ec-913d-1fe0a0e4ad46'),
	(3,NULL,'Hero','hero','channel',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2022-01-30 21:35:37','2022-01-30 21:35:37','2022-01-30 22:51:47','05e4d40f-5f94-4651-a4af-ae0e5c5a7a68');

/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sections_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections_sites`;

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qahnzcwrspzalufepkczikbgwwhchurjfoxr` (`sectionId`,`siteId`),
  KEY `idx_pzfrvuvmmtjabavebzxectplhupplnrppivf` (`siteId`),
  CONSTRAINT `fk_lrkbjuhegljjggfevjdkmrrolsmmrwxkqpst` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_oahiccoelmjpvubquvltkokimvjwogvmjquu` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,1,'__home__','homepage/_entry',1,'2022-01-29 20:39:48','2022-01-29 20:39:48','862d6ba2-c169-4a3a-9f1a-add470df4d65'),
	(2,2,1,0,NULL,NULL,1,'2022-01-29 20:55:17','2022-01-29 20:55:17','07697d36-7b0f-4202-8b7f-e767f68caabc'),
	(3,3,1,0,NULL,NULL,1,'2022-01-30 21:35:37','2022-01-30 21:35:37','0e3fa2a1-7f37-456d-b317-a0f798063c8c');

/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sequences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sequences`;

CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ltnghgtmivxkcwonprxhmgtvvpwwgbtybzti` (`uid`),
  KEY `idx_gtqwxrycrrfoxwpjzswgsbtlduzhjbmnknji` (`token`),
  KEY `idx_nviqyzwhlihnfboawfapcgiyczkjfctslrdm` (`dateUpdated`),
  KEY `idx_onqpteolacflxqncxieerowlwkgezpdqotly` (`userId`),
  CONSTRAINT `fk_uraeufecdpmuqtykrzhpgdxuolherrwozdyp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(4,1,'a6TX43CLRp0wNUfM1ZiviorAe515f18faNtTclFp5S5LX4ypR85MxBHZ3XOPZRCe6p7AA23PeuEjYJ7U9-flcNdh6MoyLWXFAwU8','2022-02-01 09:12:26','2022-02-01 09:13:55','f3628fdd-ff5f-446f-b993-5296f060c7d0'),
	(5,1,'TvsJGBGKy1bgFf8iAf8AkE_C8uUhjp4LRx-XSBKyTmMjonnfChygiFloPAc4kMfZsjU39TWoUzZb4tceZF4EZg1qsRuinEUW9QYr','2022-02-01 09:19:12','2022-02-01 09:26:58','4a10bcfc-6dd1-4459-80c6-bbcca402da50');

/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shunnedmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shunnedmessages`;

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_eeqfaiajrvhsvhnvhitpjkszpkgohphawqvw` (`userId`,`message`),
  CONSTRAINT `fk_nthunxugwkgxztkpawgkyubnwbetwzlpzptm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sitegroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sitegroups`;

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_khdqljplzowjccupkghgnjhhqhwwnwblddoq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'Verse','2022-01-29 20:36:14','2022-01-29 20:36:14',NULL,'7388ec92-49aa-477e-8f0d-18d09b43f38b');

/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sites`;

CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cjdraojbonpurjupszmjtzjspvkrfexfikgu` (`dateDeleted`),
  KEY `idx_ibeidfuldumjcjwhtilfowqmuevisjbvosvc` (`handle`),
  KEY `idx_tygqpjyirpeafvvzsydvuanaszdunchjiboy` (`sortOrder`),
  KEY `fk_apxlfmbfholuszpvdedtrapsvzmojdyqkidi` (`groupId`),
  CONSTRAINT `fk_apxlfmbfholuszpvdedtrapsvzmojdyqkidi` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,1,1,'Verse','default','en-GB',1,'$PRIMARY_SITE_URL',1,'2022-01-29 20:36:14','2022-01-29 20:36:14',NULL,'06c04a9c-5709-4012-b643-be89edbaf6d2');

/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stc_1_slides
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stc_1_slides`;

CREATE TABLE `stc_1_slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_heading` text COLLATE utf8_unicode_ci,
  `field_point` text COLLATE utf8_unicode_ci,
  `field_copy` text COLLATE utf8_unicode_ci,
  `field_button` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sjceepkusarwxnpbyyqeascmekcldjapmoyq` (`elementId`,`siteId`),
  KEY `idx_lwnnbwthuhtmvwjyomigkgznbwpciobxwpxs` (`siteId`),
  CONSTRAINT `fk_iwtwprohrhnvtmdykvvbrragixtaddrdcqel` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kgbjccrieyochhslrpfmbptrdhxzyjrpvvyr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `stc_1_slides` WRITE;
/*!40000 ALTER TABLE `stc_1_slides` DISABLE KEYS */;

INSERT INTO `stc_1_slides` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_heading`, `field_point`, `field_copy`, `field_button`)
VALUES
	(2,149,1,'2022-01-30 21:42:10','2022-01-30 22:40:09','18a28d1e-31a0-455b-add9-81a842947c1f','Here we have a two line display intro.','Innovation Partner','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]'),
	(3,152,1,'2022-01-30 21:42:10','2022-01-30 21:42:10','f0e042c9-1943-4188-90a2-3e57be8a8dd4','Here we have a two line display intro.','Innovation Partner',NULL,NULL),
	(5,166,1,'2022-01-30 21:44:03','2022-01-30 21:44:03','06781027-0975-4de3-b552-51c5db282068',NULL,NULL,NULL,NULL),
	(6,167,1,'2022-01-30 21:44:08','2022-01-30 21:44:08','f3f406c5-7cd0-498b-aa0f-5f1d51d45c8c',NULL,'Top Class Team',NULL,NULL),
	(7,168,1,'2022-01-30 21:44:11','2022-01-30 21:44:11','85182642-c964-40b2-a675-993a4d642e4f',NULL,'Top Class Team',NULL,NULL),
	(8,169,1,'2022-01-30 21:44:15','2022-01-30 21:44:15','4391d1bd-6ebe-44c2-b330-169742595e7d','Here we have a two line display intro.','Top Class Team',NULL,NULL),
	(9,170,1,'2022-01-30 21:44:17','2022-01-30 21:44:17','ea6374e6-08c7-4a07-954a-233d11d9bc68','Here is another we have a two line display intro.','Top Class Team',NULL,NULL),
	(10,171,1,'2022-01-30 21:44:20','2022-01-30 21:44:20','9aba7ab7-6553-400e-a714-29001bbb5be2','Here is another two line display intro.','Top Class Team',NULL,NULL),
	(11,172,1,'2022-01-30 21:44:23','2022-01-30 21:44:23','85f26575-70cc-4e40-af00-a4be99e52c91','Here is another two line display intro.','Top Class Team','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>',NULL),
	(13,174,1,'2022-01-30 21:44:27','2022-01-30 22:40:09','9f10e2c3-c5e8-48a9-a19b-0175ae2e210c','Here is another two line display intro.','Top Class Team','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>','[{\"col1\":\"Link with Arrow\",\"col2\":\"#\"}]'),
	(14,177,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','2243fa88-b36a-4f50-aef9-004b13fb23ce','Here we have a two line display intro.','Innovation Partner','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]'),
	(15,178,1,'2022-01-30 21:44:27','2022-01-30 21:44:27','f9ac949c-7962-4fc8-932f-3ed2d49c8f6b','Here is another two line display intro.','Top Class Team','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>',NULL),
	(18,195,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','c9fec2d7-f202-4867-80fd-7d0f67d869f9','Here we have a two line display intro.','Innovation Partner','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]'),
	(19,196,1,'2022-01-30 21:44:35','2022-01-30 21:44:35','51b50919-5290-46b2-9c2a-00dfefc0b1cb','Here is another two line display intro.','Top Class Team','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>',NULL),
	(22,213,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','e3aebf32-e1ca-42d5-88a4-fae4f0d13448','Here we have a two line display intro.','Innovation Partner','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]'),
	(23,214,1,'2022-01-30 21:45:09','2022-01-30 21:45:09','09c07595-353e-40df-abe9-f73e71a43c00','Here is another two line display intro.','Top Class Team','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>','[{\"col1\":\"Link with Arrow\",\"col2\":\"#\"}]'),
	(26,229,1,'2022-01-30 21:45:17','2022-01-30 21:45:17','e4f37dd6-e502-4342-b5a5-039c241eb592',NULL,NULL,NULL,NULL),
	(27,230,1,'2022-01-30 21:45:22','2022-01-30 21:45:22','662191fe-fecb-4a28-bcd4-1f5cec0c282f',NULL,'Corporate Solutions',NULL,NULL),
	(28,231,1,'2022-01-30 21:45:24','2022-01-30 21:45:24','d0fd1ed5-4b4a-431c-bbd0-19c70d2c2254',NULL,'Corporate Solutions',NULL,NULL),
	(29,232,1,'2022-01-30 21:45:32','2022-01-30 21:45:32','84cfc83d-c2eb-45ed-84de-ee66ae3a6e80','Here is another two line display intro.','Corporate Solutions',NULL,NULL),
	(30,233,1,'2022-01-30 21:45:34','2022-01-30 21:45:34','399f86ac-2518-45e1-850d-b244e6a474fc','Here is the final two line display intro.','Corporate Solutions',NULL,NULL),
	(31,234,1,'2022-01-30 21:45:41','2022-01-30 21:45:41','c0275516-2d4f-4c9f-a997-11eeee3cf45d','Here is the final two line display intro.','Corporate Solutions','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>',NULL),
	(32,235,1,'2022-01-30 21:45:41','2022-01-30 21:45:41','18ecb7ad-088e-4964-8fc6-892ae2313c71','Here is the final two line display intro.','Corporate Solutions','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"\",\"col2\":\"\"}]'),
	(33,236,1,'2022-01-30 21:45:43','2022-01-30 21:45:43','973424d9-e57e-449c-a05b-246eb49b023c','Here is the final two line display intro.','Corporate Solutions','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"link\",\"col2\":\"\"}]'),
	(34,237,1,'2022-01-30 21:45:45','2022-01-30 21:45:45','ab9b8c30-1ccc-46bd-81d1-48c8b5580404','Here is the final two line display intro.','Corporate Solutions','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"Text\",\"col2\":\"\"}]'),
	(35,238,1,'2022-01-30 21:45:46','2022-01-30 21:45:46','02d1fc05-8b51-4ef2-846b-75be48f3b597','Here is the final two line display intro.','Corporate Solutions','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"Text\",\"col2\":\"\"},{\"col1\":\"\",\"col2\":\"\"}]'),
	(36,239,1,'2022-01-30 21:45:47','2022-01-30 21:45:47','5b57df52-dc87-4db5-8c09-3233bc11e6ee','Here is the final two line display intro.','Corporate Solutions','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"Text\",\"col2\":\"\"},{\"col1\":\"Link\",\"col2\":\"\"}]'),
	(37,240,1,'2022-01-30 21:45:49','2022-01-30 21:45:49','9493c050-0712-4f32-91c2-4b2b28635549','Here is the final two line display intro.','Corporate Solutions','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"Text\",\"col2\":\"\"}]'),
	(39,242,1,'2022-01-30 21:45:54','2022-01-30 22:40:09','ac7a0cda-72a9-4b33-b6f6-dbba0d2da2b1','Here is the final two line display intro.','Corporate Solutions','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"Arrow Link\",\"col2\":\"#\"}]'),
	(40,245,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','ab55e7e8-d9d9-44b2-a064-3b6c4450efaf','Here we have a two line display intro.','Innovation Partner','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]'),
	(41,246,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','b3a5e05c-b9ba-48da-bafe-f0e8db0b0d01','Here is another two line display intro.','Top Class Team','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>','[{\"col1\":\"Link with Arrow\",\"col2\":\"#\"}]'),
	(42,247,1,'2022-01-30 21:45:54','2022-01-30 21:45:54','51ff90ca-a940-4e7f-bef3-e96f7b7eabe9','Here is the final two line display intro.','Corporate Solutions','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"Text\",\"col2\":\"#\"}]'),
	(46,265,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','547a7161-b98a-443d-a3ae-b9df1cf7c931','Here we have a two line display intro.','Innovation Partner','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]'),
	(47,266,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','384426a3-78d9-42d8-8f03-2b05228de545','Here is another two line display intro.','Top Class Team','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>','[{\"col1\":\"Link with Arrow\",\"col2\":\"#\"}]'),
	(48,267,1,'2022-01-30 22:18:35','2022-01-30 22:18:35','01425cb3-819b-45c8-be0f-850e7af7e135','Here is the final two line display intro.','Corporate Solutions','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"Arrow Link\",\"col2\":\"#\"}]'),
	(52,288,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','522aee54-c096-4616-9f15-b84282ea9e29','Here we have a two line display intro.','Innovation Partner','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]'),
	(53,289,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','16d96cfc-9fdc-464f-b323-64587632186b','Here is another two line display intro.','Top Class Team','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>','[{\"col1\":\"Link with Arrow\",\"col2\":\"#\"}]'),
	(54,290,1,'2022-01-30 22:33:44','2022-01-30 22:33:44','ee094187-38e1-4103-beba-199c44d0d702','Here is the final two line display intro.','Corporate Solutions','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"Arrow Link\",\"col2\":\"#\"}]'),
	(58,308,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','b11b6bb4-b279-412e-be1a-74fb1c708928','Here we have a two line display intro.','Innovation Partner','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"Link & Arrow\",\"col2\":\"#\"}]'),
	(59,309,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','712675b2-46c6-4b10-8ab4-372d1e34efd1','Here is another two line display intro.','Top Class Team','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>','[{\"col1\":\"Link with Arrow\",\"col2\":\"#\"}]'),
	(60,310,1,'2022-01-30 22:40:10','2022-01-30 22:40:10','955f5134-45ce-4988-9f56-6bf8298c883a','Here is the final two line display intro.','Corporate Solutions','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>','[{\"col1\":\"Arrow Link\",\"col2\":\"#\"}]');

/*!40000 ALTER TABLE `stc_1_slides` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table structureelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `structureelements`;

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wjfnhinpcdyeymynxjkvdmafnbxhaajzchcr` (`structureId`,`elementId`),
  KEY `idx_uwobvlvvjmozgemxsklswxzzvjofquwgxvmm` (`root`),
  KEY `idx_zssusyszbretafzxyyssvwdwikoldtsjvfyh` (`lft`),
  KEY `idx_muztehbxcifpcoahwoxnbqegwmkclewznztb` (`rgt`),
  KEY `idx_aytbxygdznayslsccrreixrlgjjhnixdjxff` (`level`),
  KEY `idx_tyyfjlmemxhampqdfcbzrpdqkqhpoijhikbv` (`elementId`),
  CONSTRAINT `fk_hauajaiywpfgltfkqmixfwvptnxodoglfxva` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ygwuheotzldykfirahmnqqnhgjlwevgwavsb` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table structures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `structures`;

CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ovgqdlpvefcksnagaatdxdcqdzswsgmuxehp` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table supertableblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supertableblocks`;

CREATE TABLE `supertableblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cchblbbabmeoyjxiswulrimxfwlkucyugixe` (`ownerId`),
  KEY `idx_qfvtrypbqnyjvupzyqjjfostbhsmtcgyvihd` (`fieldId`),
  KEY `idx_qpnghelhigyasrefuloslmkebgihrxyiqmxa` (`typeId`),
  KEY `idx_qovqumqtxwpeftqgmnonwjnejcdzvxztlmua` (`sortOrder`),
  CONSTRAINT `fk_bmnsewyxcwxlowqagkurvwwpeyabcghznayb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_smnqopfdjuphpwrmjuvhwyiejpkdrtuafuuv` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yhjadewilbxpwwxvvuzgplywgljfaeurrdok` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zsmlwanyhzkajttrhglohohwqxowkqrtfylv` FOREIGN KEY (`typeId`) REFERENCES `supertableblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `supertableblocks` WRITE;
/*!40000 ALTER TABLE `supertableblocks` DISABLE KEYS */;

INSERT INTO `supertableblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `deletedWithOwner`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(149,34,24,1,1,NULL,'2022-01-30 21:42:10','2022-01-30 21:42:10','cea56a85-4499-4733-b8ac-9c7733c850b8'),
	(152,151,24,1,1,NULL,'2022-01-30 21:42:10','2022-01-30 21:42:10','1154e74d-dbe4-4420-9329-17e9bf5533ca'),
	(174,34,24,1,2,NULL,'2022-01-30 21:44:27','2022-01-30 21:44:27','daf7b211-a16f-4b95-bdca-b8848f961b89'),
	(177,176,24,1,1,NULL,'2022-01-30 21:44:27','2022-01-30 21:44:27','42f4fb08-3f3d-4a56-bb2d-2ca2e5ab0755'),
	(178,176,24,1,2,NULL,'2022-01-30 21:44:27','2022-01-30 21:44:27','a7a32386-9f46-42b3-a199-73426cba1e8c'),
	(195,194,24,1,1,NULL,'2022-01-30 21:44:35','2022-01-30 21:44:35','4c140854-3d29-424d-908e-1b603ac29707'),
	(196,194,24,1,2,NULL,'2022-01-30 21:44:35','2022-01-30 21:44:35','a9f9b307-ec65-4987-8ba5-46583fe5421c'),
	(213,212,24,1,1,NULL,'2022-01-30 21:45:09','2022-01-30 21:45:09','e1319258-66a2-4136-a8b7-0dcfbfee360c'),
	(214,212,24,1,2,NULL,'2022-01-30 21:45:09','2022-01-30 21:45:09','1f70b11b-0151-49a4-ae87-964562558ebf'),
	(242,34,24,1,3,NULL,'2022-01-30 21:45:54','2022-01-30 21:45:54','1ba531f6-d39b-4230-9a06-0b5182810e0c'),
	(245,244,24,1,1,NULL,'2022-01-30 21:45:54','2022-01-30 21:45:54','a15db093-3926-41ec-86d5-42e8c2c80f7f'),
	(246,244,24,1,2,NULL,'2022-01-30 21:45:54','2022-01-30 21:45:54','e7ea3f6c-569e-44fe-b473-3253f1baff7d'),
	(247,244,24,1,3,NULL,'2022-01-30 21:45:54','2022-01-30 21:45:54','f31b6bbc-1f80-41bc-b29d-708deaf40172'),
	(265,264,24,1,1,NULL,'2022-01-30 22:18:35','2022-01-30 22:18:35','4a28271a-fea7-4536-9105-97d2f7de0e52'),
	(266,264,24,1,2,NULL,'2022-01-30 22:18:35','2022-01-30 22:18:35','d03479f9-8591-43c6-b73e-963598fbe124'),
	(267,264,24,1,3,NULL,'2022-01-30 22:18:35','2022-01-30 22:18:35','22d888bd-5cfc-4324-a25e-ecaa104cfe51'),
	(288,287,24,1,1,NULL,'2022-01-30 22:33:44','2022-01-30 22:33:44','a1ebb20f-e24e-4edc-beff-bf3e4c15a4bd'),
	(289,287,24,1,2,NULL,'2022-01-30 22:33:44','2022-01-30 22:33:44','e9d9db4a-88bd-4c94-803d-160c70a413ab'),
	(290,287,24,1,3,NULL,'2022-01-30 22:33:44','2022-01-30 22:33:44','a199d447-0a82-4872-a670-f691f5700c0f'),
	(308,307,24,1,1,NULL,'2022-01-30 22:40:10','2022-01-30 22:40:10','f5f6a797-d045-4986-971f-a477f4d5cf66'),
	(309,307,24,1,2,NULL,'2022-01-30 22:40:10','2022-01-30 22:40:10','a273ed71-5114-43e6-8194-60f1eefc7540'),
	(310,307,24,1,3,NULL,'2022-01-30 22:40:10','2022-01-30 22:40:10','4c6040d7-ee4d-4cc4-8ac9-c260c5b96896');

/*!40000 ALTER TABLE `supertableblocks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table supertableblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supertableblocktypes`;

CREATE TABLE `supertableblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oseokekhosixpahmmwexwnyogmnybbnmjqwg` (`fieldId`),
  KEY `idx_hlfsjyxmsvpgqnwrbuzqsanrorztrkzyaajm` (`fieldLayoutId`),
  CONSTRAINT `fk_breixlirmkgrgltlsqbrmzppoixpxajjusjn` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jnixczdfsvnabxrkuqephmjocccxhxbfsitd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `supertableblocktypes` WRITE;
/*!40000 ALTER TABLE `supertableblocktypes` DISABLE KEYS */;

INSERT INTO `supertableblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,24,12,'2022-01-30 21:40:41','2022-01-30 21:40:41','9bc45838-e825-42a4-86cd-a368de3ba8b8');

/*!40000 ALTER TABLE `supertableblocktypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table systemmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `systemmessages`;

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ehxfcnyrvsopomxztpvpkzkhmdzpcahpbvdt` (`key`,`language`),
  KEY `idx_xlbxdxdquonikeyewcedihvmabhdxildbzup` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table taggroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taggroups`;

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gaobkxemvyikuhibbsuwbnfszvqkmeslihjw` (`name`),
  KEY `idx_urovmeuaylafvseukvgqrzalvrmirrrkjgxy` (`handle`),
  KEY `idx_bxhfmfjexmpaiwoczbirsatqwxsgsierfujx` (`dateDeleted`),
  KEY `fk_junptuoqjjrrvzumbvonmuppedsxbsctrymn` (`fieldLayoutId`),
  CONSTRAINT `fk_junptuoqjjrrvzumbvonmuppedsxbsctrymn` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dapdrqrmevgrnxvmocfghsserbmkxlwmzprw` (`groupId`),
  CONSTRAINT `fk_njhdwxeicjsteocbxbfsbukxertyzegqfmnm` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_puodbqrbseblzjyhcrnhxkbeqqkiiftwvesp` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table templatecacheelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecacheelements`;

CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ocegcmkluscontqecvrwlbxaxhzwchzybomd` (`cacheId`),
  KEY `idx_kmqttnpjtueybqbdeftemqoosoileotknhdh` (`elementId`),
  CONSTRAINT `fk_bqzfekrsqtsonixrytwuhwyrvxbuoxrkromx` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nstjbnxekhpjzzozzftlbplegmmvnqizicxl` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table templatecachequeries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecachequeries`;

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_hhbyfidmzsurngpsrsuhhbwoohlykpxgowpj` (`cacheId`),
  KEY `idx_mltssoirrpeguajodnyuacjndwsbhzarqyys` (`type`),
  CONSTRAINT `fk_fzrjxpahdivxlacrllzplftwgoqqntmosrwu` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table templatecaches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecaches`;

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sgdoqpvgbtiqdozpjxzwunyflhfjqynqorgp` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `idx_zvygmedlziwlonyxlamrzuseswsmhcyhwfds` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `idx_emhdclhjvzuqqopkzeckstabcnobvcmshliy` (`siteId`),
  CONSTRAINT `fk_lpugycrbvykqhnhldtjjtktprykxeiatnwwy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_njuuttvsxztznyudtaevzgnlubwvwxcperox` (`token`),
  KEY `idx_qxpbrvzhlzzlpdhbbmmwfbqjzjnqarugurih` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usergroups`;

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_njstbhuwudwmbscewidlsqychkdmeeczrnwh` (`handle`),
  KEY `idx_doqnjzxfsxisncdogmvhrlivxohxyjqxwxbz` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table usergroups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usergroups_users`;

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kgpzeavpeyodhmpnxdldimnjabjlsohcmkov` (`groupId`,`userId`),
  KEY `idx_btuysqisvztlbfgfoeyujndkuhyukxlfyrja` (`userId`),
  CONSTRAINT `fk_qtaraotxsivbvzchutibqrbawzlljasoiiwp` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rmtaqajlnwptzgagmnskhwerxefisqljwekt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table userpermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions`;

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yjdegbbyqbcrmnojdbfseoarogxuddmsyfch` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table userpermissions_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions_usergroups`;

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ygdlvqsmgpssutsiohcmhjsqrqnrcmhrguff` (`permissionId`,`groupId`),
  KEY `idx_ljwujcynfurbmrtbdkokmopchmqlyoaewkeh` (`groupId`),
  CONSTRAINT `fk_kijngapwpvgreoqctpnvifaaulgveuifnnee` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tdvywrvevnstiircklqsfupejsxpfwbahcnk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table userpermissions_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions_users`;

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lftgfgtdlpuiuujderwsudpedznzivaevhyp` (`permissionId`,`userId`),
  KEY `idx_uqfzamgtkjyokvksxyylgesotvvkctedmuch` (`userId`),
  CONSTRAINT `fk_rftryjmhmabisptvqiowxslllutdxmbaihrh` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zjbipilujjtbioibixfgwhgpeuuvmuoiuapr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table userpreferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpreferences`;

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_chkowfbfiomrthvynsgsbjjvdobgqqsvwdpz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;

INSERT INTO `userpreferences` (`userId`, `preferences`)
VALUES
	(1,'{\"language\":\"en-GB\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');

/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vuwlntpsyfstnrkewscihvhrugzcqcwvmdtq` (`uid`),
  KEY `idx_woqipifsdhrpqmvdugqoaqumiobtfqrnffjo` (`verificationCode`),
  KEY `idx_vlrglcuwqdzudavpdppqiysrojstumfrwquo` (`email`),
  KEY `idx_cfmuqhaklgcjguvqilhorfyzuvigmkpwelkn` (`username`),
  KEY `fk_ydwrgxopjbrbrtyprkbufidlztrilpdqvoij` (`photoId`),
  CONSTRAINT `fk_vdknvveuhodeijfqkghvlpspfldwgbydwral` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ydwrgxopjbrbrtyprkbufidlztrilpdqvoij` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'admin',NULL,'','','alexrees1993@googlemail.com','$2y$13$X.KkXqUWnvG6YwLSm/.m1Ollj3mRhUI95iBNqgISJITv74n/WIL4C',1,0,0,0,'2022-02-01 09:19:12',NULL,NULL,NULL,'2022-01-31 22:01:57',NULL,1,NULL,NULL,NULL,0,'2022-01-31 22:02:31','2022-01-29 20:36:14','2022-02-01 09:19:12','90098734-61f0-46f8-8aa3-450591b96d94');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table volumefolders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volumefolders`;

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mrzesmdzozgdpcpmglosapucrprojlspfaxh` (`name`,`parentId`,`volumeId`),
  KEY `idx_ocucaopjtmqtebztlpudfbiodxzbwrjlxgvt` (`parentId`),
  KEY `idx_lpqxnabaikkhnnbgqbhqihsjyeibqbmqezoz` (`volumeId`),
  CONSTRAINT `fk_eufchpcpqsmfcbzzcqyfvjlfpswtdjkrqkjo` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qnkegulndyzijacbuwtwkhutlhljbbgrqefe` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,1,'Components','','2022-01-29 20:46:56','2022-01-29 20:49:58','063566e6-77e9-41bc-9476-3b75b87e0caf'),
	(2,1,1,'hero','hero/','2022-01-29 20:51:36','2022-01-29 20:51:36','9da43939-5764-4032-b3ed-93f5c99adc8d'),
	(3,NULL,NULL,'Temporary source',NULL,'2022-01-29 20:51:36','2022-01-29 20:51:36','85f26cdc-ff79-412b-bdf3-1ad9b867634a'),
	(4,3,NULL,'user_1','user_1/','2022-01-29 20:51:36','2022-01-29 20:51:36','f9403d02-dc8f-4e75-bf3e-121ca28c27c2'),
	(5,1,1,'cards','cards/','2022-01-29 20:51:37','2022-01-29 20:51:37','342814d7-69fa-47d7-b4ec-c0c591ede025'),
	(6,NULL,2,'Card','','2022-01-29 20:56:12','2022-01-29 20:56:12','f6c505cf-b50a-4638-a7be-287c256f638d'),
	(7,1,1,'copy-with-image','copy-with-image/','2022-01-29 21:00:39','2022-01-29 21:00:39','1de76954-3880-42ea-9e55-152dbc7f590e');

/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table volumes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volumes`;

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ypenpczllnhkivpmkcypckofuxpgqradiiba` (`name`),
  KEY `idx_wpqrplmazrkbnxyxvybfjcmbllgtaednhfyg` (`handle`),
  KEY `idx_hblawammbumshfmvwcsuaqfqwhdymifnnptn` (`fieldLayoutId`),
  KEY `idx_qkblwctrjhahqcswltvsavoixzbvsnsmuolt` (`dateDeleted`),
  CONSTRAINT `fk_madvcutmcfqisblzaqibihaxyxoenmrmjgad` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,3,'Components','components','craft\\volumes\\Local',1,'@web/images/components','site',NULL,'{\"path\":\"@webroot/images/components\"}',1,'2022-01-29 20:46:56','2022-01-29 20:49:58',NULL,'c0a88e6f-7dc9-46ee-9c9f-cabe689dd5d5'),
	(2,9,'Card','card','craft\\volumes\\Local',1,'@web/images/components','site',NULL,'{\"path\":\"@webroot/images/components\"}',2,'2022-01-29 20:56:12','2022-01-29 20:56:12',NULL,'00ba4136-4522-4595-918d-d5c47a106881');

/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `widgets`;

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oqdrhefjdtpuulervfnljhrqbfxnxwaxzovu` (`userId`),
  CONSTRAINT `fk_kxzbsrrxxhlwokitjcatzwjvgglruubqdbeb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2022-01-29 20:39:34','2022-01-29 20:39:34','b80c24fb-10fa-4db8-8720-e933d0415232'),
	(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2022-01-29 20:39:34','2022-01-29 20:39:34','c362b526-4ef1-493a-b11f-6e0d25a3a460'),
	(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2022-01-29 20:39:34','2022-01-29 20:39:34','7096f805-5ca3-4ed4-8eb4-56170b8f970d'),
	(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2022-01-29 20:39:34','2022-01-29 20:39:34','72de08ce-2967-44f4-b2f8-f8e948c6ed83');

/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
