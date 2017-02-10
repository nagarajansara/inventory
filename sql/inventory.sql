/*
SQLyog Ultimate v8.55 
MySQL - 5.5.5-10.1.9-MariaDB : Database - inventory_erp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`inventory_erp` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `inventory_erp`;

/*Table structure for table `c_login` */

DROP TABLE IF EXISTS `c_login`;

CREATE TABLE `c_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `pass` text,
  `status` enum('active','deactive') DEFAULT 'active',
  `createdat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastlogin` datetime DEFAULT NULL,
  `lastlogout` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `c_login` */

insert  into `c_login`(`id`,`username`,`pass`,`status`,`createdat`,`lastlogin`,`lastlogout`) values (1,'Nagarajan','pass','active','2017-01-05 09:04:33',NULL,NULL),(2,'Naga','pass','active','2017-01-18 23:45:51',NULL,NULL);

/*Table structure for table `c_menu` */

DROP TABLE IF EXISTS `c_menu`;

CREATE TABLE `c_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(100) NOT NULL DEFAULT '',
  `menu_level` int(11) NOT NULL DEFAULT '1',
  `slno` int(11) NOT NULL DEFAULT '1',
  `is_parent` enum('yes','no') NOT NULL DEFAULT 'no',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `menu_url` varchar(200) NOT NULL DEFAULT '',
  `menu_icon` varchar(100) NOT NULL DEFAULT '',
  `is_projectmanager_menu` enum('yes','no') NOT NULL DEFAULT 'no',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `c_menu` */

/*Table structure for table `c_session` */

DROP TABLE IF EXISTS `c_session`;

CREATE TABLE `c_session` (
  `userid` int(11) NOT NULL,
  `apikey` text,
  `status` enum('active','deactive') DEFAULT 'active',
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `c_session` */

insert  into `c_session`(`userid`,`apikey`,`status`,`createddate`) values (1,'4bd05796-c694-4409-9ffa-488315ef3d54','active','2017-01-07 13:32:12'),(1,'1de82094-9f2d-4e00-82c2-ab8f695d89cd','active','2017-01-07 13:35:19'),(1,'b9314ff9-1d58-4c04-9236-c605f8b111f3','active','2017-01-07 13:55:37'),(1,'55c7fe2a-8bae-4adf-b7fd-df0afe8a6f9e','active','2017-01-07 17:20:55'),(1,'c7e6536c-75bc-460b-9ae7-c69fa27a8460','active','2017-01-07 17:21:08'),(1,'3b429592-f590-4866-95fb-4d2c96bf4643','active','2017-01-07 17:41:12'),(1,'54527e1a-9c0c-4d44-81af-edb8ba1e9220','active','2017-01-07 17:41:35'),(1,'dd57e7ad-c421-4fae-951f-7bdbc65fc60b','active','2017-01-07 17:45:53'),(1,'2b98d258-a1c0-4e85-a46f-0a0393af8ea3','active','2017-01-07 18:08:49'),(1,'f2209ad4-2a40-4328-8966-55000f89200b','active','2017-01-07 18:10:17'),(1,'5d339bbb-9256-4d2d-94ed-94386f0a6b12','active','2017-01-07 18:15:58'),(1,'119c5f47-309a-42d2-8785-4d4e5cdde148','active','2017-01-07 19:42:10'),(1,'cee823aa-3e17-418d-b220-627925ecd862','active','2017-01-07 19:45:18'),(1,'20ee8084-ef2e-42e8-8cd4-16fd4299bbab','active','2017-01-07 21:29:59'),(1,'b4a212d1-16bb-4a44-938d-42abeaa89e39','active','2017-01-07 23:26:10'),(1,'b7153c5d-9300-44b4-9ca3-273d5f676134','active','2017-01-08 10:32:23'),(1,'01eb8f45-cae0-499a-b64b-20960367bb3a','active','2017-01-10 13:23:55'),(1,'bbb483fb-f1f5-4857-90ee-793850f5e2d5','active','2017-01-11 07:15:58'),(1,'c908cbbc-83ff-4618-b770-3b41206aac68','active','2017-01-11 07:16:25'),(1,'d4081d9d-1906-4ab4-978c-c51c9586e9ae','active','2017-01-11 07:17:28'),(1,'89f32bac-ec34-4de6-8970-8ba4fb59a7ec','active','2017-01-11 07:21:05'),(1,'6aa171fe-177f-4861-b799-043d4cf42cca','active','2017-01-11 07:23:54'),(1,'02ca098a-daea-4b95-9bc8-b508b9379564','active','2017-01-11 07:52:54'),(1,'3b2f58aa-8718-4174-ab3f-468db0aea7f3','active','2017-01-11 08:16:09'),(1,'67c3fb49-d66d-470b-ae21-e23b705cd164','active','2017-01-11 08:29:32'),(1,'c52d4c73-2901-4e32-8cbf-a3d20b341451','active','2017-01-14 11:59:12'),(1,'343352ab-ac4b-49eb-8117-4d23d521e1db','active','2017-01-14 13:17:37'),(1,'c1126bf5-5e3b-4c18-b68b-42a40e9b677c','active','2017-01-14 19:03:32'),(1,'53363e02-ab96-482b-b4df-b27238d01f5d','active','2017-01-14 20:24:07'),(1,'b9d9eaa4-510b-4686-9a60-3eec88f9790b','active','2017-01-14 20:32:55'),(1,'fc2caec9-42d1-4237-9ea6-ca12bc951576','active','2017-01-14 20:52:32'),(1,'2f56fb3b-a89f-4e9e-80b1-c1abf726eb75','active','2017-01-14 21:19:01'),(1,'763cb434-e988-4faa-9488-e6e6e2e6f763','active','2017-01-14 22:14:47'),(1,'f67157e0-586a-4b2e-9600-288ab5f5bf71','active','2017-01-14 23:03:44'),(1,'dce6f8f1-390c-40b4-ba27-3695266eb72b','active','2017-01-14 23:34:53'),(1,'7f03386a-bff5-48a6-aa6a-27870ed49e9e','active','2017-01-14 23:37:38'),(1,'dd5668ff-7f63-4976-ab7a-bc78e08cd9ee','active','2017-01-14 23:40:06'),(1,'9cc32f73-c74b-4297-8c23-0891496320ae','active','2017-01-14 23:44:43'),(1,'2ff3739b-6b81-4772-8ada-18210aaf6569','active','2017-01-14 23:45:23'),(1,'180c3ec7-2092-4187-b45f-2d2d96d85e67','active','2017-01-14 23:49:50'),(1,'0512e880-1858-49e3-92cd-eb69684b21f2','active','2017-01-14 23:54:05'),(1,'e03b3808-22c4-41b3-a1ed-ec6a8b54ab1a','active','2017-01-14 23:56:09'),(1,'53b1a550-7b1f-4cc5-8c39-2004399c88be','active','2017-01-15 10:37:59'),(1,'c5f4bbcc-08c7-4542-a1f3-1d68179a6c93','active','2017-01-15 10:38:35'),(1,'8792ca06-aa44-4501-9472-eac4de6b39ad','active','2017-01-15 11:35:10'),(1,'074100c6-70c7-410d-9a0f-12860b3754c4','active','2017-01-15 19:19:19'),(1,'0ca58e5c-e9ae-433d-b247-62b528579e78','active','2017-01-15 19:52:30'),(1,'b4c35f6a-8ace-4c5f-873c-c5840def1e83','active','2017-01-15 20:08:15'),(1,'85cc9ecb-faa0-46a2-89b8-030c0191f8bc','active','2017-01-15 20:22:34'),(1,'2de6b095-a5e0-4091-9d76-4f67da3135d2','active','2017-01-15 21:45:14'),(1,'eb94950b-1896-4927-9b59-f15cb0791619','active','2017-01-15 21:54:50'),(1,'3b27004c-cd90-4e9c-9195-6404cc217433','active','2017-01-15 22:24:08'),(1,'d6fe2959-6464-4d4a-88c6-2b407cb7e828','active','2017-01-16 21:44:24'),(1,'7328eb6c-b172-49df-b8f4-21ce2ca1909f','active','2017-01-17 22:01:59'),(1,'f8445eea-c705-4864-a501-79d10cd4f0c0','active','2017-01-17 23:05:24'),(1,'eaf50137-bc48-4820-9957-d7390e18705b','active','2017-01-18 07:53:51'),(1,'3bee1203-23cd-4e2e-9a04-4ed54901eddc','active','2017-01-18 08:25:01'),(1,'c8685914-970f-4f90-a2e8-69b3d577a075','active','2017-01-18 09:21:37'),(1,'47cffbf8-585d-40ad-906c-56380c295fb0','active','2017-01-18 22:40:48'),(2,'6d69b770-4b50-4cd9-a440-288f39bfc740','active','2017-01-18 23:46:56');

/*Table structure for table `c_user_type` */

DROP TABLE IF EXISTS `c_user_type`;

CREATE TABLE `c_user_type` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '2017-01-07 21:31:52',
  `created_by` int(5) NOT NULL,
  `modified_by` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `c_user_type` */

insert  into `c_user_type`(`id`,`user_type`,`created_date`,`modified_date`,`created_by`,`modified_by`) values (27,'Admin','2017-01-15 20:21:58','2017-01-07 21:31:52',0,NULL),(28,'ProjectManager','2017-01-15 21:59:44','2017-01-07 21:31:52',0,NULL),(30,'Super','2017-01-18 22:50:39','2017-01-07 21:31:52',0,NULL),(32,'AdminManager','2017-01-18 23:47:52','2017-01-07 21:31:52',2,NULL);

/* Procedure structure for procedure `c_login_get` */

/*!50003 DROP PROCEDURE IF EXISTS  `c_login_get` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_login_get`(
  IN username VARCHAR(100),
  in pass TEXT
)
BEGIN
   SELECT id AS userid, username, pass, STATUS, createdat FROM c_login WHERE c_login.username=username 
   AND c_login.pass = pass;
 END */$$
DELIMITER ;

/* Procedure structure for procedure `c_session_post` */

/*!50003 DROP PROCEDURE IF EXISTS  `c_session_post` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_session_post`(IN userid INT(11),IN apikey TEXT)
BEGIN
    INSERT INTO c_session (userid,apikey) VALUES (userid ,apikey);
 END */$$
DELIMITER ;

/* Procedure structure for procedure `c_users_get` */

/*!50003 DROP PROCEDURE IF EXISTS  `c_users_get` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_users_get`(IN ip_type VARCHAR(10),IN ip_input VARCHAR(50),IN ip_limit_start INT(3),IN ip_limit_end INT(3))
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
IF(ip_type = 'id') THEN
	SELECT 
		'1' AS total_record,id,NAME,username,PASSWORD,phone,email
	FROM 
		c_users 
	WHERE 
		id = ip_input AND 
		STATUS = 'active' 
	ORDER BY created_date DESC;
ELSEIF(ip_type='all') THEN
	SELECT 
		(SELECT COUNT(*) FROM c_users) AS total_record,id,NAME,username,PASSWORD,phone,email 
	FROM 
		c_users 
	WHERE 
		STATUS = 'active' 
	ORDER BY created_date DESC 
	LIMIT ip_limit_start,ip_limit_end;
ELSEIF(ip_type = 'like') THEN
	SELECT 
		(SELECT COUNT(*) FROM c_users WHERE 
		STATUS = 'active' AND 
		NAME LIKE CONCAT(ip_input,'%') OR 
		username LIKE CONCAT(ip_input,'%') OR 
		phone LIKE CONCAT(ip_input,'%') OR 
		email LIKE CONCAT(ip_input,'%')) AS total_record,
		id,NAME,username,PASSWORD,phone,email 
	FROM 
		c_users 
	WHERE 
		STATUS = 'active' AND 
		NAME LIKE CONCAT(ip_input,'%') OR 
		username LIKE CONCAT(ip_input,'%') OR 
		phone LIKE CONCAT(ip_input,'%') OR 
		email LIKE CONCAT(ip_input,'%')
	ORDER BY created_date DESC 
	LIMIT 
		ip_limit_start,ip_limit_end;
	
END IF;
/*end >get user details*/
COMMIT;
/*end >transaction*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `c_user_type_delete` */

/*!50003 DROP PROCEDURE IF EXISTS  `c_user_type_delete` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_user_type_delete`(IN ip_id int(5))
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_user_type_get`(IN ip_type VARCHAR(10),IN ip_input VARCHAR(50),IN ip_limit_start INT(3),IN ip_limit_end INT(3))
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
/*start >add user*/
	IF(ip_type = 'id') THEN
	SELECT 
		'1' AS total_record,id,user_type, '' AS editBtn
	FROM 
		c_user_type 
	WHERE 
		id = ip_input  
		
	ORDER BY created_date DESC;
ELSEIF(ip_type='all') THEN
	SELECT 
		(SELECT COUNT(*) FROM c_user_type) AS total_record,id, user_type, REPLACE('<button pk_id="userid" title="Edit" class="btn btn-success btn-xs btn-perspective hfmsEditBtn"><i class="fa fa-pencil-square"></i>
					</button> &nbsp; <button pk_id="userid" title="Delete" class="btn btn-danger btn-xs btn-perspective hfmsDelBtn">
					<i class="fa fa-trash-o"></i> </button> &nbsp;', 'userid', id) AS editBtn
	FROM 
		c_user_type 
	ORDER BY created_date DESC 
	LIMIT ip_limit_start,ip_limit_end;
ELSEIF(ip_type = 'like') THEN
	SELECT 
		(SELECT COUNT(*) FROM c_user_type WHERE 
		user_type LIKE CONCAT(ip_input,'%')) AS total_record,
		id, user_type, REPLACE('<button pk_id="userid" title="Edit" class="btn btn-success btn-xs btn-perspective hfmsEditBtn"><i class="fa fa-pencil-square"></i>
					</button> &nbsp; <button pk_id="userid" title="Delete" class="btn btn-danger btn-xs btn-perspective hfmsDelBtn">
					<i class="fa fa-trash-o"></i> </button> &nbsp;', 'userid', id) AS editBtn 
	FROM 
		c_user_type 
	WHERE 
		
		user_type LIKE CONCAT(ip_input,'%')
		
	ORDER BY created_date DESC 
	LIMIT 
		ip_limit_start,ip_limit_end;
	
	end if;
	
					
/*end >add user*/
COMMIT;
/*end >transaction*/
    END */$$
DELIMITER ;

/* Procedure structure for procedure `c_user_type_numentries` */

/*!50003 DROP PROCEDURE IF EXISTS  `c_user_type_numentries` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_user_type_numentries`()
BEGIN
/*start >transaction*/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
	SHOW ERRORS LIMIT 1;
END;
START TRANSACTION;
/*start >add user*/
	SELECT count(*) as total FROM c_user_type;
/*end >add user*/
COMMIT;
/*end >transaction*/
    END */$$
DELIMITER ;

/* Procedure structure for procedure `c_user_type_post` */

/*!50003 DROP PROCEDURE IF EXISTS  `c_user_type_post` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_user_type_post`(IN ip_user_type varchar(50), in ip_created_by int(5))
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
		user_type,created_date, created_by) 
	VALUES (
		ip_user_type,NOW(), ip_created_by);
SELECT 'SUCCESS' AS status;
/*end >add user*/
COMMIT;
/*end >transaction*/
    END */$$
DELIMITER ;

/* Procedure structure for procedure `c_user_type_put` */

/*!50003 DROP PROCEDURE IF EXISTS  `c_user_type_put` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `c_user_type_put`(IN ip_id int(5),IN ip_user_type varchar(50), in ip_modified_by int(5))
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
	`user_type`=`ip_user_type`,
	`modified_by`=`ip_modified_by`
WHERE 
	`id`=`ip_id`;
/*end >update user details*/
COMMIT;
SELECT 'SUCCESS';
/*end >transaction*/
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
