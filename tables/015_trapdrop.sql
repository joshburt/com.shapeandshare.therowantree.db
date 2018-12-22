CREATE TABLE IF NOT EXISTS `trapdrop` (
  `store_id` int(11) NOT NULL,
  `roll_under` double NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `store_id_UNIQUE` (`store_id`),
  CONSTRAINT `fk_store_id_store_type_trapdrop` FOREIGN KEY (`store_id`) REFERENCES `store_type` (`store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
