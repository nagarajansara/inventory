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

/*Table structure for table `c_location_type` */

DROP TABLE IF EXISTS `c_location_type`;

CREATE TABLE `c_location_type` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(5) NOT NULL,
  `modified_by` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `c_user_type` */

DROP TABLE IF EXISTS `c_user_type`;

CREATE TABLE `c_user_type` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(5) NOT NULL,
  `modified_by` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `c_users` */

DROP TABLE IF EXISTS `c_users`;

CREATE TABLE `c_users` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `location_id` int(3) DEFAULT NULL,
  `user_type_id` int(5) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status` enum('active','inactive','trash') NOT NULL DEFAULT 'active',
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(5) DEFAULT NULL,
  `modified_by` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_c_users>id>modified_by` (`modified_by`),
  KEY `FK_c_users>id>created_by` (`created_by`),
  KEY `FK_c_users>location_id>c_location_type>id` (`location_id`),
  KEY `FK_c_users>user_type_id>c_user_type>id` (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/* Procedure structure for procedure `delete_c_users` */

/*!50003 DROP PROCEDURE IF EXISTS  `delete_c_users` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_c_users`(`ip_id` int(5),`modified_by` int(5))
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
update 
	`c_users` 
set 
	`status`='trash',`last_modified_date`=now(),`modified_by`=`modified_by`
where 
	`id`=`ip_id`;
select 'SUCCESS';
COMMIT;
/*end >transaction*/
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_c_users` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_c_users` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_c_users`(`id` int(5))
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
/*start >get user details*/
if(id = -1) then
	set @id = "!=-1";
else
	set @id=CONCAT("=",`id`);
end if;
set @query=CONCAT("
	select 
		cu.name,clt.location_name,cut.user_type,cu.phone,cu.email,cu.created_date,cu.last_modified_date,cu.created_by,cu.modified_by 
	from 
		c_users cu,c_user_type cut,c_location_type clt
	where 
		cu.id ",@id," and status = 'active' and
		cu.location_id = clt.id and
		cu.user_type_id = cut.id");
PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
/*end >get user details*/
COMMIT;
/*end >transaction*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_c_users_login` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_c_users_login` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_c_users_login`(`username` varchar(50),`password` varchar(50))
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
/*start >get user session*/
select 
	cu.name,clt.location_name,cut.user_type,cu.phone,cu.email,cu.created_date,cu.last_modified_date,cu.created_by,cu.modified_by 
from 
	c_users cu,c_user_type cut,c_location_type clt 
where 
	cu.username = `username` and 
	cu.password = `password` and
	cu.status = 'active' and
	cu.location_id = clt.id and
	cu.user_type_id = cut.id;
/*end >get user session*/
COMMIT;
/*end >transaction*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `loginValidation` */

/*!50003 DROP PROCEDURE IF EXISTS  `loginValidation` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `loginValidation`(
  IN username VARCHAR(100),
   pass TEXT
)
BEGIN
   SELECT * FROM a_login WHERE a_login.username=username 
   AND a_login.pass = pass;
 END */$$
DELIMITER ;

/* Procedure structure for procedure `post_c_users` */

/*!50003 DROP PROCEDURE IF EXISTS  `post_c_users` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `post_c_users`(`name` varchar(50),`username` varchar(50),`password` varchar(50),`location_id` int(3),`user_type_id` int(5),`phone` varchar(15),`email` varchar(50),`created_by` int(5))
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
/*start >add user*/
	insert into `c_users`(
		`name`,`username`,`password`,`location_id`,`user_type_id`,`phone`,`email`,`status`,`created_date`,`created_by`) 
	values (
		`name`,`username`,`password`,`location_id`,`user_type_id`,`phone`,`email`,'active',now(),`created_by`);
SELECT 'SUCCESS';
/*end >add user*/
COMMIT;
/*end >transaction*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `put_c_users` */

/*!50003 DROP PROCEDURE IF EXISTS  `put_c_users` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `put_c_users`(`ip_id` int(5),`name` varchar(50),`username` varchar(50),`password` varchar(50),`location_id` int(3),`user_type_id` int(5),`phone` varchar(15),`status` varchar(10),`modified_by` int(5))
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
/*start >update user details*/
update 
	`c_users` 
set 
	`name`=`name`,`username`=`username`,`password`=`password`,`location_id`=`location_id`,`user_type_id`=`user_type_id`,`phone`=`phone`,`email`=`email`,`status`=`status`,`last_modified_date`=now(),`modified_by`=`modified_by`
where 
	`id`=`ip_id`;
/*end >update user details*/
COMMIT;
SELECT 'SUCCESS';
/*end >transaction*/
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
