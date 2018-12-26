CREATE TABLE IF NOT EXISTS `income_source` (
  `income_source_store_id` int(11) NOT NULL AUTO_INCREMENT,
  `income_source_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`income_source_store_id`),
  UNIQUE KEY `income_source_store_id_UNIQUE` (`income_source_store_id`),
  UNIQUE KEY `indx_unique_combos` (`income_source_id`,`store_id`),
  KEY `fk_income_source_id_income_source_type_income_idx` (`income_source_id`),
  KEY `fk_store_id_store_type_income_idx` (`store_id`),
  CONSTRAINT `fk_income_source_id_income_source_type_income` FOREIGN KEY (`income_source_id`) REFERENCES `income_source_type` (`income_source_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_store_id_store_type_income` FOREIGN KEY (`store_id`) REFERENCES `store_type` (`store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
