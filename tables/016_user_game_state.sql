CREATE TABLE `user_game_state` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `active_feature` int(11) NOT NULL DEFAULT '1',
  `game_temperature_id` int(11) NOT NULL DEFAULT '1',
  `game_fire_state_id` int(11) NOT NULL DEFAULT '1',
  `builder_level` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `fk_feature_id_feature_idx` (`active_feature`),
  KEY `fk_1_idx` (`user_id`,`active_feature`),
  KEY `fk_game_temperature_user_game_state_temperature_type_idx` (`game_temperature_id`),
  KEY `fk_game_fire_state_id_user_game_state_fire_type_idx` (`game_fire_state_id`),
  CONSTRAINT `fk_feature_id_feature_type_user_state` FOREIGN KEY (`active_feature`) REFERENCES `feature_type` (`feature_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_fire_state_id_user_game_state_fire_type` FOREIGN KEY (`game_fire_state_id`) REFERENCES `fire_type` (`fire_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_temperature_id_user_game_state_temperature_type` FOREIGN KEY (`game_temperature_id`) REFERENCES `temperature_type` (`temperature_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
