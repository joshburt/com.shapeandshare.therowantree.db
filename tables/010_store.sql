CREATE TABLE IF NOT EXISTS `store` (
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `amount` float NOT NULL DEFAULT '0',
  KEY `fk_user_id_idx` (`user_id`),
  KEY `fk_store_type_stores_user_idx` (`store_id`),
  CONSTRAINT `fk_store_type_stores_user` FOREIGN KEY (`store_id`) REFERENCES `store_type` (`store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id_stores_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
