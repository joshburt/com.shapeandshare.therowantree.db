START TRANSACTION;

SET @store_name = 'fur';
SET @rollUnder = 0.5;
SET @message = 'scraps of fur';
INSERT INTO trapdrop (store_id, roll_under, message) VALUES
(
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(SELECT @rollUnder),
	(SELECT @message)
);


SET @store_name = 'meat';
SET @rollUnder = 0.75;
SET @message = 'bits of meat';
INSERT INTO trapdrop (store_id, roll_under, message) VALUES
(
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(SELECT @rollUnder),
	(SELECT @message)
);


SET @store_name = 'seed';
SET @rollUnder = 0.75;
SET @message = 'seed';
INSERT INTO trapdrop (store_id, roll_under, message) VALUES
(
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(SELECT @rollUnder),
	(SELECT @message)
);


SET @store_name = 'scales';
SET @rollUnder = 0.85;
SET @message = 'strange scales';
INSERT INTO trapdrop (store_id, roll_under, message) VALUES
(
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(SELECT @rollUnder),
	(SELECT @message)
);


SET @store_name = 'teeth';
SET @rollUnder = 0.93;
SET @message = 'scattered teeth';
INSERT INTO trapdrop (store_id, roll_under, message) VALUES
(
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(SELECT @rollUnder),
	(SELECT @message)
);


SET @store_name = 'cloth';
SET @rollUnder = 0.995;
SET @message = 'tattered cloth';
INSERT INTO trapdrop (store_id, roll_under, message) VALUES
(
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(SELECT @rollUnder),
	(SELECT @message)
);


SET @store_name = 'charm';
SET @rollUnder = 1.0;
SET @message = 'a crudely made charm';
INSERT INTO trapdrop (store_id, roll_under, message) VALUES
(
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(SELECT @rollUnder),
	(SELECT @message)
);

COMMIT;

-------------------------------------------------------------------------------
-- REPORT --
-------------------------------------------------------------------------------
SELECT td1.roll_under, st1.store_name, td1.message
	FROM trapdrop td1
JOIN store_type st1
	ON st1.store_id = td1.store_id;

