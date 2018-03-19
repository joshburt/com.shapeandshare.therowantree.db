CREATE TABLE `fire_type` (
  `fire_id` int(11) NOT NULL AUTO_INCREMENT,
  `fire_name` varchar(255) NOT NULL,
  `fire_description` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`fire_id`),
  UNIQUE KEY `fire_id_UNIQUE` (`fire_id`),
  UNIQUE KEY `fire_name_UNIQUE` (`fire_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
