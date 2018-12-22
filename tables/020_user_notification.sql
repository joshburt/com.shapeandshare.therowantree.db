CREATE TABLE IF NOT EXISTS `user_notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `delivered` varchar(45) NOT NULL DEFAULT '0',
  `message` varchar(2048) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_id`),
  KEY `fk_user_id_user_notification_user_idx` (`user_id`),
  CONSTRAINT `fk_user_id_user_notification_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
