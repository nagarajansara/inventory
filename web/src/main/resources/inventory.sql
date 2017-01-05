/*
SQLyog Enterprise - MySQL GUI v7.02 
MySQL - 5.5.15 : Database - inventory_erp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`inventory_erp` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `inventory_erp`;

/*Table structure for table `a_login` */

DROP TABLE IF EXISTS `a_login`;

CREATE TABLE `a_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `pass` text,
  `status` enum('active','deactive') DEFAULT 'active',
  `createdat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastlogin` datetime DEFAULT NULL,
  `lastlogout` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `a_session` */

DROP TABLE IF EXISTS `a_session`;

CREATE TABLE `a_session` (
  `userid` int(11) NOT NULL,
  `apikey` text,
  `status` enum('active','deactive') DEFAULT 'active',
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* Procedure structure for procedure `loginValidation` */

