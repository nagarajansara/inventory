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

/*Data for the table `a_login` */

LOCK TABLES `a_login` WRITE;

insert  into `a_login`(`id`,`username`,`pass`,`status`,`createdat`,`lastlogin`,`lastlogout`) values (1,'jmnethaji','nethajijm','active','2017-01-08 01:24:39',NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `a_session` */

DROP TABLE IF EXISTS `a_session`;

CREATE TABLE `a_session` (
  `userid` int(11) NOT NULL,
  `apikey` text,
  `status` enum('active','deactive') DEFAULT 'active',
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `a_session` */

LOCK TABLES `a_session` WRITE;

insert  into `a_session`(`userid`,`apikey`,`status`,`createddate`) values (1,'2c117ff8-da0d-4afd-a5e8-3de6575e9367','active','2017-01-08 02:01:22'),(1,'23c87db0-735f-4126-8aa2-001bc24d00aa','active','2017-01-08 02:02:04'),(1,'dfe05a9d-f0e3-4ab3-95bb-95e3dbc04ecf','active','2017-01-08 02:04:53'),(1,'d3afa0ef-e44f-4304-9874-6f9a4d7eba76','active','2017-01-08 02:09:41'),(1,'a883bc2b-97b0-4e9b-8876-221c14ad40a3','active','2017-01-08 02:12:36'),(1,'fdc218d1-852b-4e12-82f1-a1094c576952','active','2017-01-08 02:13:46'),(1,'34278060-a89a-42d3-b10b-5cbe6cc8952a','active','2017-01-08 02:16:34'),(1,'b7649968-bd5f-4211-a4c2-6e2495332ee6','active','2017-01-08 02:43:24'),(1,'5066ca31-e996-48d4-9579-cb570d96c251','active','2017-01-08 02:47:53'),(1,'5a538966-ca06-4114-a7a5-1e2146f52d95','active','2017-01-08 03:02:00'),(1,'526af82d-86aa-45cf-9769-929770ac82ab','active','2017-01-08 15:02:23'),(1,'8b131b4b-76ba-4c2e-820b-60596ac00205','active','2017-01-09 20:59:39'),(1,'6a528325-f51e-4321-8cb0-78cc441a4f7d','active','2017-01-09 21:01:06'),(1,'4afd02ec-8b38-46b3-9f49-52663840cff3','active','2017-01-09 21:03:34'),(1,'aa627554-5097-430d-b0dc-23bd6086b3ec','active','2017-01-09 21:05:16'),(1,'993be8fe-07d5-4e68-b47b-6cfd897a13cb','active','2017-01-09 21:05:38'),(1,'00f4217f-3cd1-4722-b889-59e1871d3d95','active','2017-01-09 21:06:21'),(1,'e78ce199-90df-4d71-8719-d83746722fef','active','2017-01-09 21:06:31'),(1,'e3a2b3d6-bebf-4b16-8aa5-62f93e572ef2','active','2017-01-09 21:06:41'),(1,'a80a49b9-091c-4d73-a174-ece6d75adeba','active','2017-01-09 21:48:59'),(1,'87874231-f70a-4ea7-a689-4117466b9982','active','2017-01-10 00:10:51'),(1,'d0d78e2e-7ee9-45c7-a1fd-becdeae105ef','active','2017-01-10 00:45:38'),(1,'6da5a36a-724c-41ae-83ea-9b2485f9c193','active','2017-01-11 00:20:29'),(1,'e8c895ab-7551-4ea1-85c7-5f46549d086a','active','2017-01-11 00:23:30'),(1,'cbe04663-1776-4f05-b121-bc40cc7fc997','active','2017-01-11 00:32:34'),(1,'f85c1dea-4503-4e10-822e-d516dcedecaa','active','2017-01-11 00:48:56'),(1,'473ac2a0-b385-48bb-be64-773f95b08a81','active','2017-01-11 00:49:55'),(1,'f1e3d16e-8349-407f-9ad4-4f5095f31228','active','2017-01-11 01:53:11');

UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `c_department` */

LOCK TABLES `c_department` WRITE;

insert  into `c_department`(`id`,`department_name`,`description`,`created_by`,`modified_by`,`created_date`,`modified_date`) values (1,'Director','Desc','1',NULL,'2017-01-11 00:05:50','0000-00-00 00:00:00'),(2,'Purchase Department','Desc','1',NULL,'2017-01-11 00:05:47','0000-00-00 00:00:00'),(3,'Sales Department','Desc','1',NULL,'2017-01-11 00:05:47','0000-00-00 00:00:00'),(4,'Staff','Desc','1',NULL,'2017-01-11 00:05:47','0000-00-00 00:00:00'),(5,'Trade','College_Trade','1',NULL,'2017-01-11 00:05:31','0000-00-00 00:00:00');

UNLOCK TABLES;

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

/*Data for the table `c_location_type` */

LOCK TABLES `c_location_type` WRITE;

insert  into `c_location_type`(`id`,`location_name`,`created_date`,`modified_date`,`created_by`,`modified_by`) values (1,'HeadOffice','2017-01-10 21:27:39','0000-00-00 00:00:00',1,NULL);

UNLOCK TABLES;

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

/*Data for the table `c_org_location` */

LOCK TABLES `c_org_location` WRITE;

UNLOCK TABLES;

/*Table structure for table `c_session` */

DROP TABLE IF EXISTS `c_session`;

CREATE TABLE `c_session` (
  `c_session_id` varchar(50) NOT NULL,
  `c_user_id` varchar(50) NOT NULL,
  `c_session_in_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `c_session_out_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('active','trash') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `c_session` */

LOCK TABLES `c_session` WRITE;

insert  into `c_session`(`c_session_id`,`c_user_id`,`c_session_in_date`,`c_session_out_date`,`status`) values ('32948','1','2017-01-10 21:25:36','0000-00-00 00:00:00','active');

UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `c_user_type` */

LOCK TABLES `c_user_type` WRITE;

insert  into `c_user_type`(`id`,`user_type`,`created_date`,`modified_date`,`created_by`,`modified_by`) values (1,'AppAdmin','2017-01-08 02:43:36','0000-00-00 00:00:00',1,NULL),(2,'SuperAdmin','2017-01-09 22:05:15','0000-00-00 00:00:00',1,NULL),(3,'Admin','2017-01-11 00:07:12','0000-00-00 00:00:00',1,NULL),(4,'User','2017-01-11 00:07:24','0000-00-00 00:00:00',1,NULL),(5,'Test','2017-01-11 00:37:12','0000-00-00 00:00:00',0,NULL),(6,'TestType','2017-01-11 00:50:24','0000-00-00 00:00:00',0,NULL),(7,'Abcd','2017-01-11 01:54:01','0000-00-00 00:00:00',0,NULL),(8,'Abcd','2017-01-11 02:00:59','0000-00-00 00:00:00',0,NULL);

UNLOCK TABLES;

/*Table structure for table `c_users` */

DROP TABLE IF EXISTS `c_users`;

CREATE TABLE `c_users` (
  `id` varchar(50) NOT NULL,
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
  `created_by` varchar(50) DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_c_users>id>modified_by` (`modified_by`),
  KEY `FK_c_users>id>created_by` (`created_by`),
  KEY `FK_c_users>location_id>c_location_type>id` (`location_id`),
  KEY `FK_c_users>user_type_id>c_user_type>id` (`user_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `c_users` */

LOCK TABLES `c_users` WRITE;

insert  into `c_users`(`id`,`name`,`username`,`password`,`location_id`,`user_type_id`,`phone`,`email`,`status`,`created_date`,`last_modified_date`,`created_by`,`modified_by`) values ('1','Nethaji Moorthi','jmnethaji','nethajijm',1,1,'9095622490','jmnethaji@gmail.com','active','2017-01-10 21:25:22','0000-00-00 00:00:00','1',NULL),('6a88047e-18a3-4a2c-b99c-645093b48410','Nagarajan Ramalingam','nagarajan','nagarajan',1,1,'8248482141','nagarajan.ramalingam@gmail.com','active','2017-01-11 01:09:56','0000-00-00 00:00:00','1',NULL),('6a88047e-18a3-4a2c-b99c-645093b48422','Nagarajan Ramalingam','nagarajan','nagarajan',1,1,'8248482141','nagarajan.ramalingam@gmail.com','active','2017-01-11 01:19:02','0000-00-00 00:00:00','1',NULL);

UNLOCK TABLES;

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

/*Data for the table `co_product_list` */

LOCK TABLES `co_product_list` WRITE;

insert  into `co_product_list`(`id`,`parent_id`,`product_name`,`product_description`,`created_by`,`modified_by`,`created_date`,`modified_date`) values ('1','','SuperRoot','SuperRoot_Desc','1','1','2017-01-10 22:31:51','0000-00-00 00:00:00'),('9bf50e84-18c5-4d67-bca4-01b112d4502a','1','Product1Put','ProductDesc1Put','1','1','2017-01-10 22:52:35','2017-01-10 22:52:40');

UNLOCK TABLES;

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

/*Data for the table `co_vendor` */

LOCK TABLES `co_vendor` WRITE;

insert  into `co_vendor`(`id`,`vendor_name`,`company_name`,`phone`,`email`,`pan_card`,`service_tax_no`,`fax`,`website`,`bank_name`,`account_no`,`ifsc_code`,`status`,`created_by_location_id`,`created_by`,`modified_by`,`created_date`,`modified_date`) values ('4b9a517c-422e-4176-a90f-37a80337fe16','Vendor1put','Company1put','044-321432put','jmnethaji@gmail.comput','AJPPN2271p','service_tax_noput','fax_noput','website_name.comput','bank_put','20104001735put','ifsc0001put','active','1','1','1','2017-01-10 23:26:25','2017-01-10 23:52:04');

UNLOCK TABLES;

/* Procedure structure for procedure `co_product_list_delete` */

/*!50003 DROP PROCEDURE IF EXISTS  `co_product_list_delete` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `co_product_list_delete`(IN ip_id INT(5))
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
DELETE FROM co_product_list WHERE id = ip_id;
SELECT 'SUCCESS';
COMMIT;
/*end >transaction*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `co_product_list_get` */

/*!50003 DROP PROCEDURE IF EXISTS  `co_product_list_get` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `co_product_list_get`()
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
/*start >add user*/
	SELECT id,parent_id,product_name,product_description,created_by,modified_by,created_date,modified_date FROM co_product_list;
/*end >add user*/
COMMIT;
/*end >transaction*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `co_product_list_post` */

/*!50003 DROP PROCEDURE IF EXISTS  `co_product_list_post` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `co_product_list_post`(IN ip_id varchar(50),IN ip_parent_id varchar(50),IN ip_product_name varchar(250),IN ip_product_description varchar(250),IN ip_created_by varchar(50))
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
/*start >add product details*/
	insert into `co_product_list`(
		`id`,`parent_id`,`product_name`,`product_description`,`created_by`,`created_date`) 
	values (
		ip_id,ip_parent_id,ip_product_name,ip_product_description,ip_created_by,now());
SELECT 'SUCCESS';
/*end >add product details*/
COMMIT;
/*end >transaction*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `co_product_list_put` */

/*!50003 DROP PROCEDURE IF EXISTS  `co_product_list_put` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `co_product_list_put`(IN ip_id varchar(50),IN ip_product_name varchar(50),IN ip_product_description varchar(50))
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
	`co_product_list` 
SET 
	`product_name` = ip_product_name,
	`product_description` = ip_product_description,
	`modified_by` = '1',
	`modified_date` = now()
WHERE 
	`id`=`ip_id`;
/*end >update user details*/
COMMIT;
SELECT 'SUCCESS';
/*end >transaction*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `co_vendor_delete` */

/*!50003 DROP PROCEDURE IF EXISTS  `co_vendor_delete` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `co_vendor_delete`(IN ip_id varchar(50),IN ip_status varchar(50),IN ip_modified_by varchar(50))
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
update
	co_vendor
set
	status = ip_status,
	modified_by = ip_modified_by
WHERE id = ip_id;
SELECT 'SUCCESS';
COMMIT;
/*end >transaction*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `co_vendor_get` */

/*!50003 DROP PROCEDURE IF EXISTS  `co_vendor_get` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `co_vendor_get`()
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
/*start >add user*/
SELECT 
	id,vendor_name,company_name,phone,email,pan_card,service_tax_no,fax,website,bank_name,account_no,ifsc_code,created_by,modified_by,status
FROM 
	co_vendor;
/*end >add user*/
COMMIT;
/*end >transaction*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `co_vendor_post` */

/*!50003 DROP PROCEDURE IF EXISTS  `co_vendor_post` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `co_vendor_post`(IN ip_id varchar(50),IN ip_vendor_name varchar(50),IN ip_company_name varchar(50),IN ip_phone varchar(15),IN ip_email varchar(50),IN ip_pan_card varchar(10),IN ip_service_tax_no varchar(50),IN ip_fax varchar(50),IN ip_website varchar(50),IN ip_bank_name varchar(50),IN ip_account_no varchar(50),IN ip_ifsc_code varchar(50),IN ip_created_by_location_id varchar(50),IN ip_created_by varchar(50))
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
/*start >add user*/
	insert into `co_vendor`(
		`id`,`vendor_name`,`company_name`,`phone`,`email`,`pan_card`,`service_tax_no`,`fax`,`website`,`bank_name`,account_no,ifsc_code,created_by_location_id,created_by,created_date) 
	values (
		`ip_id`,`ip_vendor_name`,`ip_company_name`,`ip_phone`,`ip_email`,`ip_pan_card`,`ip_service_tax_no`,`ip_fax`,`ip_website`,`ip_bank_name`,`ip_account_no`,`ip_ifsc_code`,`ip_created_by_location_id`,`ip_created_by`,now());
SELECT 'SUCCESS';
/*end >add user*/
COMMIT;
/*end >transaction*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `co_vendor_put` */

/*!50003 DROP PROCEDURE IF EXISTS  `co_vendor_put` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `co_vendor_put`(IN ip_id varchar(50),IN ip_vendor_name varchar(50),IN ip_company_name varchar(50),IN ip_phone varchar(15),IN ip_email varchar(50),IN ip_pan_card varchar(10),IN ip_service_tax_no varchar(50),IN ip_fax varchar(50),IN ip_website varchar(50),IN ip_bank_name varchar(50),IN ip_account_no varchar(50),IN ip_ifsc_code varchar(50),IN ip_status varchar(10),IN ip_modified_by varchar(50))
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
	`co_vendor`
SET 
	vendor_name = ip_vendor_name,
	company_name = ip_company_name,
	phone = ip_phone,
	email = ip_email,
	pan_card = ip_pan_card,
	service_tax_no = ip_service_tax_no,
	fax = ip_fax,
	website = ip_website,
	bank_name = ip_bank_name,
	account_no = ip_account_no,
	ifsc_code = ip_ifsc_code,
	status = ip_status,
	modified_by = ip_modified_by,
	modified_date = now()
WHERE 
	`id`=`ip_id`;
/*end >update user details*/
COMMIT;
SELECT 'SUCCESS';
/*end >transaction*/
END */$$
DELIMITER ;

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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_users_get`(`ip_id` varchar(50 ))
BEGIN
/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `c_users_get`(`ip_c_session_id` varchar(50 ))
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
/*set @t_c_user_id = (select c_user_id from c_session where c_session_id = ip_c_session_id and status = 'active');
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
end if;*/
select id,name,username,password,location_id,user_type_id,phone,email,status,created_date,last_modified_date,created_by,modified_by from c_users where id = ip_id;
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_users_post`(IN `ip_id` varchar(50),IN `ip_name` varchar(50),IN `ip_username` varchar(50),IN `ip_password` varchar(50),IN `ip_location_id` int(3),IN `ip_user_type_id` int(5),IN `ip_phone` varchar(15),IN `ip_email` varchar(50),IN `ip_created_by` varchar(50))
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
		`id`,`name`,`username`,`password`,`location_id`,`user_type_id`,`phone`,`email`,`status`,`created_date`,`created_by`) 
	values (
		`ip_id`,`ip_name`,`ip_username`,`ip_password`,`ip_location_id`,`ip_user_type_id`,`ip_phone`,`ip_email`,'active',now(),`ip_created_by`);
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

/* Procedure structure for procedure `c_user_type_delete` */

/*!50003 DROP PROCEDURE IF EXISTS  `c_user_type_delete` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_user_type_delete`(IN ip_id INT(5))
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
    END */$$
DELIMITER ;

/* Procedure structure for procedure `c_user_type_get` */

/*!50003 DROP PROCEDURE IF EXISTS  `c_user_type_get` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_user_type_get`()
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
/*start >add user*/
	SELECT id,user_type,created_date,modified_date,created_by,modified_by FROM c_user_type;
/*end >add user*/
COMMIT;
/*end >transaction*/
    END */$$
DELIMITER ;

/* Procedure structure for procedure `c_user_type_post` */

/*!50003 DROP PROCEDURE IF EXISTS  `c_user_type_post` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_user_type_post`(IN ip_user_type VARCHAR(50))
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
    END */$$
DELIMITER ;

/* Procedure structure for procedure `c_user_type_put` */

/*!50003 DROP PROCEDURE IF EXISTS  `c_user_type_put` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_user_type_put`(IN ip_id INT(5),IN ip_user_type VARCHAR(50))
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertSession` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertSession` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSession`(IN ip_user_id int(11),IN ip_apikey text)
BEGIN
	insert into a_session(userid,apikey) values(ip_user_id,ip_apikey);
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
   SELECT id as 'userid',username,pass,status,createdat,lastlogin,lastlogout FROM a_login WHERE a_login.username=username 
   AND a_login.pass = pass;
 END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
