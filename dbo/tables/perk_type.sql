CREATE TABLE `perk_type` (
  `perk_id` int(11) NOT NULL AUTO_INCREMENT,
  `perk_name` varchar(255) NOT NULL,
  `perk_description` varchar(2048) DEFAULT NULL,
  `perk_notify` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`perk_id`),
  UNIQUE KEY `perk_name_UNIQUE` (`perk_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
