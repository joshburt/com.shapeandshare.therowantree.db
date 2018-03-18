CREATE TABLE `feature_state` (
  `feature_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_id` int(11) NOT NULL,
  `state_index` int(11) NOT NULL,
  `state_name` varchar(255) DEFAULT NULL,
  `state_description` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`feature_state_id`),
  UNIQUE KEY `feature_state_id_UNIQUE` (`feature_state_id`),
  UNIQUE KEY `fk_unique_location_index_combos` (`feature_id`,`state_index`),
  UNIQUE KEY `state_name_UNIQUE` (`state_name`),
  KEY `fk_feature_id_feature_state_feature_type_idx` (`feature_id`),
  CONSTRAINT `fk_feature_id_feature_state_feature_type` FOREIGN KEY (`feature_id`) REFERENCES `feature_type` (`feature_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
