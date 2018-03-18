CREATE TABLE `user_feature_state` (
  `user_id` int(11) NOT NULL,
  `feature_id` int(11) DEFAULT NULL,
  `feature_index` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `unique_user_feature_combos` (`user_id`,`feature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
