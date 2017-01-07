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

/*Table structure for table `c_department` */

DROP TABLE IF EXISTS `c_department`;

CREATE TABLE `c_department` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
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

/*Table structure for table `c_org_location` */

DROP TABLE IF EXISTS `c_org_location`;

CREATE TABLE `c_org_location` (
  `id` varchar(50) NOT NULL,
  `parent_id` varchar(50) NOT NULL,
  `location_name` varchar(50) NOT NULL,
  `locatioin_type_id` int(5) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `status` enum('active','inactive','trash') NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `c_session` */

DROP TABLE IF EXISTS `c_session`;

CREATE TABLE `c_session` (
  `c_session_id` varchar(50) NOT NULL,
  `c_user_id` varchar(50) NOT NULL,
  `c_session_in_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `c_session_out_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('active','trash') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

/*Table structure for table `co_product_list` */

DROP TABLE IF EXISTS `co_product_list`;

CREATE TABLE `co_product_list` (
  `id` varchar(50) NOT NULL,
  `parent_id` varchar(50) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `product_description` varchar(250) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `co_vendor` */

DROP TABLE IF EXISTS `co_vendor`;

CREATE TABLE `co_vendor` (
  `id` varchar(50) NOT NULL,
  `vendor_name` varchar(50) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pan_card` varchar(10) DEFAULT NULL,
  `service_tax_no` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `account_no` varchar(50) DEFAULT NULL,
  `ifsc_code` varchar(50) DEFAULT NULL,
  `status` enum('active','inactive','trash') NOT NULL,
  `created_by_location_id` varchar(50) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* Procedure structure for procedure `c_session_delete` */

/*!50003 DROP PROCEDURE IF EXISTS  `c_session_delete` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_session_delete`(`ip_c_session_id` varchar(50),`ip_c_user_id` varchar(50))
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
	update `c_session` set status = 'trash', c_session_out_date = now()
	where c_session_id = ip_c_session_id and c_user_id = ip_c_user_id;
	select 'SUCCESS';
COMMIT;
/*end >transaction*/
    END */$$
DELIMITER ;

/* Procedure structure for procedure `c_session_post` */

/*!50003 DROP PROCEDURE IF EXISTS  `c_session_post` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_session_post`(`ip_username` varchar(50),`ip_password` varchar(50))
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
/*start >create session*/
	set @t_id = (select id from c_users where username = ip_username and password = ip_password);
	if(@t_id != 0) then
		set @t_session_id = (FLOOR(RAND() * 100000) + 1000);
		insert into c_session (c_session_id,c_user_id,status) values(@t_session_id,@t_id,'active');
		select 'SUCCESS' as status,@t_session_id as c_session_id;
	else
		select 'FAILED' as status,'INVALID USER';
	end if;
/*end >end sessioin*/
COMMIT;
/*end >transaction*/
    END */$$
DELIMITER ;

/* Procedure structure for procedure `c_users_delete` */

/*!50003 DROP PROCEDURE IF EXISTS  `c_users_delete` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_users_delete`(`ip_id` int(5),`modified_by` int(5))
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

/* Procedure structure for procedure `c_users_get` */

/*!50003 DROP PROCEDURE IF EXISTS  `c_users_get` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_users_get`(`ip_c_session_id` varchar(50 ))
BEGIN
/*
requirement
input : session_id
get user_id by using session id
get user details by using user_id
return 
status,user details
'success','valid_session_id','user details'
'failed','invalid_session_id','user details'
*/
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
/*start >get user details*/
set @t_c_user_id = (select c_user_id from c_session where c_session_id = ip_c_session_id and status = 'active');
if(@t_c_user_id !='') then
	select 
		cu.name,clt.location_name,cut.user_type,cu.phone,cu.email,cu.created_date,cu.last_modified_date,cu.created_by,cu.modified_by 
	from 
		c_users cu,c_user_type cut,c_location_type clt
	where 
		cu.id = @t_c_user_id and 
		status = 'active' and
		cu.location_id = clt.id and
		cu.user_type_id = cut.id;
end if;
/*end >get user details*/
COMMIT;
/*end >transaction*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `c_users_login_get` */

/*!50003 DROP PROCEDURE IF EXISTS  `c_users_login_get` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_users_login_get`(`username` varchar(50),`password` varchar(50))
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

/* Procedure structure for procedure `c_users_post` */

/*!50003 DROP PROCEDURE IF EXISTS  `c_users_post` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_users_post`(`name` varchar(50),`username` varchar(50),`password` varchar(50),`location_id` int(3),`user_type_id` int(5),`phone` varchar(15),`email` varchar(50),`created_by` int(5))
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

/* Procedure structure for procedure `c_users_put` */

/*!50003 DROP PROCEDURE IF EXISTS  `c_users_put` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_users_put`(`ip_id` int(5),`name` varchar(50),`username` varchar(50),`password` varchar(50),`location_id` int(3),`user_type_id` int(5),`phone` varchar(15),`status` varchar(10),`modified_by` int(5))
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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;




DELIMITER $$

USE `inventory_erp`$$

DROP PROCEDURE IF EXISTS `loginValidation`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `loginValidation`(
  IN username VARCHAR(100),
   pass TEXT
)
BEGIN
   SELECT id AS userid, username, pass, STATUS, createdat FROM a_login WHERE a_login.username=username 
   AND a_login.pass = pass;
 END$$

DELIMITER ;



DELIMITER $$

USE `inventory_erp`$$

DROP PROCEDURE IF EXISTS `insertSession`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSession`(IN userid INT(11),IN apikey TEXT)
BEGIN
    INSERT INTO a_session (userid,apikey) VALUES (userid ,apikey);
 END$$

DELIMITER ;


DELIMITER $$

USE `inventory_erp`$$

DROP PROCEDURE IF EXISTS `c_user_type_post`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `c_user_type_post`(IN ip_user_type VARCHAR(50))
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
/*start >add user*/
	INSERT INTO c_user_type(
		user_type,created_date) 
	VALUES (
		ip_user_type,NOW());
SELECT 'SUCCESS' AS STATUS;
/*end >add user*/
COMMIT;
/*end >transaction*/
    END$$

DELIMITER ;



DELIMITER $$

USE `inventory_erp`$$

DROP PROCEDURE IF EXISTS `c_user_type_get`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `c_user_type_get`()
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
/*start >add user*/
	SELECT * FROM c_user_type;
/*end >add user*/
COMMIT;
/*end >transaction*/
    END$$

DELIMITER ;


DELIMITER $$

USE `inventory_erp`$$

DROP PROCEDURE IF EXISTS `c_user_type_delete`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `c_user_type_delete`(IN ip_id INT(5))
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
DELETE FROM c_user_type WHERE id = ip_id;
SELECT 'SUCCESS';
COMMIT;
/*end >transaction*/
    END$$

DELIMITER ;


DELIMITER $$

USE `inventory_erp`$$

DROP PROCEDURE IF EXISTS `c_user_type_put`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `c_user_type_put`(IN ip_id INT(5),IN ip_user_type VARCHAR(50))
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
/*start >update user details*/
UPDATE 
	`c_user_type` 
SET 
	`user_type`=`ip_user_type`
WHERE 
	`id`=`ip_id`;
/*end >update user details*/
COMMIT;
SELECT 'SUCCESS';
/*end >transaction*/
    END$$

DELIMITER ;





