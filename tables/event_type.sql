CREATE TABLE `event_type` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_title` varchar(255) NOT NULL,
  `event_description` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `event_id_UNIQUE` (`event_id`),
  UNIQUE KEY `event_name_UNIQUE` (`event_name`),
  KEY `fk_feature_id_event_type_feature_type_idx` (`feature_id`),
  CONSTRAINT `fk_feature_id_event_type_feature_type` FOREIGN KEY (`feature_id`) REFERENCES `feature_type` (`feature_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
