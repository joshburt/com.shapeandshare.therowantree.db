START TRANSACTION;

SET @source_name = 'gatherer';
SET @store_name = 'wood';
SET @amount = 1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);
SET @store_name = 'stone';
SET @amount = 1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);



SET @source_name = 'hunter';
SET @store_name = 'fur';
SET @amount = 0.5;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);

SET @store_name = 'meat';
SET @amount = 0.5;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);




SET @source_name = 'trapper';
SET @store_name = 'meat';
SET @amount = -1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);

SET @store_name = 'bait';
SET @amount = 1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);





SET @source_name = 'farmer';
SET @store_name = 'meat';
SET @amount = -1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);

SET @store_name = 'fur';
SET @amount = -1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);

SET @store_name = 'seed';
SET @amount = -1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);

SET @store_name = 'crops';
SET @amount = 3;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);






SET @source_name = 'tanner';
SET @store_name = 'fur';
SET @amount = -5;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);

SET @store_name = 'leather';
SET @amount = 1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);






SET @source_name = 'charcutier';
SET @store_name = 'meat';
SET @amount = -5;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);

SET @store_name = 'wood';
SET @amount = -5;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);

SET @store_name = 'cured meat';
SET @amount = 1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);




SET @source_name = 'iron miner';
SET @store_name = 'cured meat';
SET @amount = -1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);

SET @store_name = 'iron';
SET @amount = 1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
 	(@amount)
);




SET @source_name = 'coal miner';
SET @store_name = 'cured meat';
SET @amount = -1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);

SET @store_name = 'coal';
SET @amount = 1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);






SET @source_name = 'sulphur miner';
SET @store_name = 'cured meat';
SET @amount = -1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);

SET @store_name = 'sulphur';
SET @amount = 1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);






SET @source_name = 'steelworker';
SET @store_name = 'iron';
SET @amount = -1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);

SET @store_name = 'coal';
SET @amount = -1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);

SET @store_name = 'steel';
SET @amount = 1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);





SET @source_name = 'armourer';
SET @store_name = 'steel';
SET @amount = -1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);

SET @store_name = 'sulphur';
SET @amount = -1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);

SET @store_name = 'bullets';
SET @amount = 1;
INSERT INTO income_source (income_source_id, store_id, amount) VALUES
(
	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
	(@amount)
);

COMMIT;


-- ----------------------------------------------------------------------------
-- Report
-- ----------------------------------------------------------------------------
SELECT ist1.income_source_name, st1.store_name,  is1.amount
	FROM income_source_type ist1
JOIN income_source is1
	ON ist1.income_source_id = is1.income_source_id
JOIN store_type st1
	ON st1.store_id = is1.store_id;

