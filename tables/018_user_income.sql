CREATE TABLE IF NOT EXISTS `user_income` (
  `user_id` int(11) NOT NULL,
  `income_source_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `fk_unique_combos` (`user_id`,`income_source_id`),
  KEY `fk_user_id_user_user_income_idx` (`user_id`),
  KEY `fk_income_source_id_income_source_type_user_income_idx` (`income_source_id`),
  CONSTRAINT `fk_income_source_id_income_source_type_user_income` FOREIGN KEY (`income_source_id`) REFERENCES `income_source_type` (`income_source_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id_user_user_income` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
