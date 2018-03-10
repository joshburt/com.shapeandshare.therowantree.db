CREATE TABLE `store_type` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(255) NOT NULL,
  `store_description` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `store_name_UNIQUE` (`store_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
