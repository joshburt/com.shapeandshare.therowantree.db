CREATE TABLE `user_game_state` (
  `user_id` int(11) NOT NULL,
  `active_feature` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  KEY `fk_feature_id_feature_idx` (`active_feature`),
  CONSTRAINT `fk_feature_id_feature_type_user_state` FOREIGN KEY (`active_feature`) REFERENCES `feature_type` (`feature_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id_user_user_state` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
