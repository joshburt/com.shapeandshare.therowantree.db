CREATE TABLE IF NOT EXISTS `perk` (
  `user_perk_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `perk_id` int(11) NOT NULL,
  PRIMARY KEY (`user_perk_id`),
  UNIQUE KEY `user_perk_id_UNIQUE` (`user_perk_id`),
  UNIQUE KEY `idx_user_id_perk_id` (`user_id`,`perk_id`),
  KEY `fk_user_id_perk_user_idx` (`user_id`),
  KEY `fk_perk_id_perk_perk_type_idx` (`perk_id`),
  CONSTRAINT `fk_perk_id_perk_perk_type` FOREIGN KEY (`perk_id`) REFERENCES `perk_type` (`perk_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id_perk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
