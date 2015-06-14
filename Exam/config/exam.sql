/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.1.51-community : Database - exam
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`exam` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `exam`;

/*Table structure for table `exam` */

DROP TABLE IF EXISTS `exam`;

CREATE TABLE `exam` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SINGLESCORE` int(11) DEFAULT NULL,
  `MORESCORE` int(11) DEFAULT NULL,
  `SCORE` int(11) DEFAULT NULL,
  `EXAMDATE` datetime DEFAULT NULL,
  `BEGINDATE` datetime DEFAULT NULL,
  `ENDDATE` datetime DEFAULT NULL,
  `STUIP` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `STUDENTID` bigint(20) DEFAULT NULL,
  `PAPERID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_h748o6vghfpqu45vfgmtmd7jf` (`STUDENTID`),
  KEY `FK_619f14ryehk6l5wjwsbrqgg06` (`PAPERID`),
  CONSTRAINT `FK_619f14ryehk6l5wjwsbrqgg06` FOREIGN KEY (`PAPERID`) REFERENCES `paper` (`ID`),
  CONSTRAINT `FK_h748o6vghfpqu45vfgmtmd7jf` FOREIGN KEY (`STUDENTID`) REFERENCES `student` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `exam` */

insert  into `exam`(`ID`,`SINGLESCORE`,`MORESCORE`,`SCORE`,`EXAMDATE`,`BEGINDATE`,`ENDDATE`,`STUIP`,`STUDENTID`,`PAPERID`) values (1,10,0,10,'2015-03-29 19:23:26',NULL,NULL,'127.0.0.1',1,1),(2,0,0,0,'2015-03-29 19:28:36',NULL,NULL,'127.0.0.1',1,1),(3,0,0,0,'2015-03-29 23:57:13',NULL,NULL,'127.0.0.1',1,1);

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PHONE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `FLAG` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `manager` */

insert  into `manager`(`ID`,`NAME`,`PASSWORD`,`PHONE`,`FLAG`) values (1,'admin','admin',NULL,'1');

/*Table structure for table `paper` */

DROP TABLE IF EXISTS `paper`;

CREATE TABLE `paper` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PAPERNAME` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `joinDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `paper` */

insert  into `paper`(`ID`,`PAPERNAME`,`joinDate`) values (1,'传奇战队收人测试','2015-03-29 16:04:03');

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SUBJECT` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `JOINTIME` datetime DEFAULT NULL,
  `OPTIONA` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `OPTIONB` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `OPTIONC` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `OPTIOND` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `ANSWER` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `STUDENTANSWER` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PAPERID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_oxnjst0b7p9utqsun6wm20qjv` (`PAPERID`),
  CONSTRAINT `FK_oxnjst0b7p9utqsun6wm20qjv` FOREIGN KEY (`PAPERID`) REFERENCES `paper` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `question` */

insert  into `question`(`ID`,`SUBJECT`,`TYPE`,`JOINTIME`,`OPTIONA`,`OPTIONB`,`OPTIONC`,`OPTIOND`,`ANSWER`,`STUDENTANSWER`,`PAPERID`) values (1,'对cf的看法1','1','2015-03-29 00:00:00','很好1','良好1','一般1','差1','A',NULL,1),(2,'对cf的看法2','1','2015-03-29 00:00:00','很好2','良好2','一般2','差2','A',NULL,1),(3,'对cf的看法3','1','2015-03-29 00:00:00','很好2','良好2','一般2','差2','A',NULL,1),(4,'对cf的看法4','1','2015-03-29 00:00:00','很好2','良好2','一般2','差2','A',NULL,1),(5,'对cf的看法5','1','2015-03-29 00:00:00','很好2','良好2','一般2','差2','A',NULL,1),(6,'对cf的看法6','1','2015-03-29 00:00:00','很好2','良好2','一般2','差2','A',NULL,1),(7,'对cf的看法7','1','2015-03-29 00:00:00','很好2','良好2','一般2','差2','A',NULL,1),(8,'对cf的看法8','1','2015-03-29 00:00:00','很好2','良好2','一般2','差2','A',NULL,1),(9,'对cf的看法9','1','2015-03-29 00:00:00','很好2','良好2','一般2','差2','A',NULL,1),(10,'对cf的看法10','1','2015-03-29 00:00:00','很好2','良好2','一般2','差2','A',NULL,1),(11,'对cf的看法11','1','2015-03-29 00:00:00','很好2','良好2','一般2','差2','A',NULL,1),(12,'对cf的看法12','1','2015-03-29 00:00:00','很好2','良好2','一般2','差2','A',NULL,1),(13,'对cf的看法13','1','2015-03-29 00:00:00','很好2','良好2','一般2','差2','A',NULL,1),(14,'对cf的看法14','1','2015-03-29 00:00:00','很好2','良好2','一般2','差2','A',NULL,1),(15,'对cf的看法14多选题1','2','2015-03-29 00:00:00','很好2','良好2','一般2','差233333','A#B',NULL,1),(16,'对cf的看法14多选题2','2','2015-03-29 00:00:00','很好2','良好2','一般2','差22323','A#B',NULL,1),(17,'对cf的看法14多选题3','2','2015-03-29 00:00:00','很好2','良好2','一般2','差2','A#B',NULL,1),(18,'对cf的看法14多选题4','2','2015-03-29 00:00:00','很好2','良好2','一般2','差222222','A#B',NULL,1),(19,'对cf的看法14多选题5','2','2015-03-29 00:00:00','很好2','良好2','一般2','差26666','A#B',NULL,1),(21,'对cf的看法14多选题7','2','2015-03-29 00:00:00','很好2','良好2','一般2','差2111111','A#B',NULL,1);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `SEX` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `FLAG` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `SCHOOL` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `MAJOR` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `student` */

insert  into `student`(`ID`,`NAME`,`PASSWORD`,`SEX`,`FLAG`,`SCHOOL`,`MAJOR`,`PHONE`) values (1,'sss1','sss1',NULL,'2',NULL,NULL,NULL),(5,'aa','aaa','男','2','aa','a','aaa'),(6,'dfasdasd','asd','男','2','asd','asd','asd'),(7,'dfasdasd','asd','女','2','asd','asd','asd'),(8,'dfasdasd','ads','男','2','ads','asd','asd'),(9,'dfasdasd','asd','男','2','asd','asd','asd');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
