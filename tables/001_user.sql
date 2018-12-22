CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0',
  `population` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `guid_UNIQUE` (`guid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
