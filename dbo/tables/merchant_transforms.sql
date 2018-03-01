CREATE TABLE `merchant_transforms` (
  `to_store_id` int(11) NOT NULL,
  `from_store_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  UNIQUE KEY `fk_unique_combos` (`to_store_id`,`from_store_id`),
  KEY `fk_to_store_id_merchant_transforms_store_type_idx` (`to_store_id`),
  KEY `fk_from_store_id_merchant_transforms_store_type` (`from_store_id`),
  CONSTRAINT `fk_from_store_id_merchant_transforms_store_type` FOREIGN KEY (`from_store_id`) REFERENCES `store_type` (`store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_to_store_id_merchant_transforms_store_type` FOREIGN KEY (`to_store_id`) REFERENCES `store_type` (`store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
