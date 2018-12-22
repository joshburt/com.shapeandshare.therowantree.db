CREATE TABLE IF NOT EXISTS `feature_type` (
  `feature_id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_name` varchar(255) NOT NULL,
  PRIMARY KEY (`feature_id`),
  UNIQUE KEY `feature_id_UNIQUE` (`feature_id`),
  UNIQUE KEY `feature_name_UNIQUE` (`feature_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
