CREATE TABLE `feature` (
  `user_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  UNIQUE KEY `unique_tuples` (`user_id`,`feature_id`),
  KEY `fk_feature_id_idx` (`feature_id`),
  KEY `fk_user_id_idx` (`user_id`),
  CONSTRAINT `fk_feature_id` FOREIGN KEY (`feature_id`) REFERENCES `feature_type` (`feature_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
