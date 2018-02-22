CREATE TABLE `income_source_type` (
  `income_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `income_source_name` varchar(255) NOT NULL,
  `income_source_description` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`income_source_id`),
  UNIQUE KEY `income_source_id_UNIQUE` (`income_source_id`),
  UNIQUE KEY `income_source_name_UNIQUE` (`income_source_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
