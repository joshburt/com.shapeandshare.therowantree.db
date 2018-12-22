CREATE TABLE IF NOT EXISTS `temperature_type` (
  `temperature_id` int(11) NOT NULL AUTO_INCREMENT,
  `temperature_name` varchar(255) NOT NULL,
  `temperature_description` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`temperature_id`),
  UNIQUE KEY `temperature_id_UNIQUE` (`temperature_id`),
  UNIQUE KEY `temperature_name_UNIQUE` (`temperature_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
