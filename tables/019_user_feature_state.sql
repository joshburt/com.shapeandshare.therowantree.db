CREATE TABLE IF NOT EXISTS `user_feature_state` (
  `user_feature_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL DEFAULT '1',
  `feature_index` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_feature_state_id`),
  UNIQUE KEY `user_feature_state_id_UNIQUE` (`user_feature_state_id`),
  UNIQUE KEY `unique_user_id_feature_id_combos` (`user_id`,`feature_id`),
  KEY `fk_feature_id_user_feature_state_feature_type_idx` (`feature_id`,`feature_index`),
  KEY `fk_user_id_user_feature_state_user_id_idx` (`user_id`),
  CONSTRAINT `fk_feature_id_and_feature_index_user_feature_state_feature_state` FOREIGN KEY (`feature_id`, `feature_index`) REFERENCES `feature_state` (`feature_id`, `state_index`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id_user_feature_state_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
