CREATE TABLE IF NOT EXISTS `event_type` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `active_feature_id` int(11) NOT NULL,
  `feature_state_id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_title` varchar(255) NOT NULL,
  `event_description` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `event_id_UNIQUE` (`event_id`),
  UNIQUE KEY `event_name_UNIQUE` (`event_name`),
  KEY `fk_feature_id_event_type_feature_type_idx` (`active_feature_id`),
  KEY `fk_feature_state_id_event_type_feature_state_idx` (`feature_state_id`),
  CONSTRAINT `fk_feature_id_event_type_feature_type` FOREIGN KEY (`active_feature_id`) REFERENCES `feature_type` (`feature_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_feature_state_id_event_type_feature_state` FOREIGN KEY (`active_feature_id`) REFERENCES `feature_state` (`feature_state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
