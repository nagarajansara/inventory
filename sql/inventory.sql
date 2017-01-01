
CREATE TABLE `a_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `pass` text,
  `status` enum('active','deactive') DEFAULT 'active',
  `createdat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastlogin` datetime DEFAULT NULL,
  `lastlogout` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE `a_session` (
  `userid` int(11) NOT NULL,
  `apikey` text,
  `status` enum('active','deactive') DEFAULT 'active',
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1



DELIMITER $$
CREATE PROCEDURE loginValidation
(
  IN username VARCHAR(100),
   pass TEXT
) 
BEGIN
   SELECT * FROM a_login WHERE a_login.username=username 
   AND a_login.pass = pass;
 END$$