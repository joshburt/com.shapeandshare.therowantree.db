


SET @scales = (SELECT store_id FROM store_type WHERE store_name = 'scales');
SET @coins = (SELECT store_id FROM store_type WHERE store_name = 'coins');
SET @fur = (SELECT store_id FROM store_type WHERE store_name = 'fur');
SET @gems = (SELECT store_id FROM store_type WHERE store_name = 'gems');
SET @teeth = (SELECT store_id FROM store_type WHERE store_name = 'teeth');
SET @seed = (SELECT store_id FROM store_type WHERE store_name = 'seed');
SET @stone = (SELECT store_id FROM store_type WHERE store_name = 'stone');
SET @iron = (SELECT store_id FROM store_type WHERE store_name = 'iron');
SET @coal = (SELECT store_id FROM store_type WHERE store_name = 'coal');
SET @steel = (SELECT store_id FROM store_type WHERE store_name = 'steel');
SET @medicine = (SELECT store_id FROM store_type WHERE store_name = 'medicine');
SET @bullets = (SELECT store_id FROM store_type WHERE store_name = 'bullets');
SET @energy_cell = (SELECT store_id FROM store_type WHERE store_name = 'energy cell');
SET @bolas = (SELECT store_id FROM store_type WHERE store_name = 'bolas');
SET @grenade = (SELECT store_id FROM store_type WHERE store_name = 'grenade');
SET @bayonet = (SELECT store_id FROM store_type WHERE store_name = 'bayonet');
SET @alien_alloy = (SELECT store_id FROM store_type WHERE store_name = 'alien alloy');
SET @compass = (SELECT store_id FROM store_type WHERE store_name = 'compass');



INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@scales, @fur, 150);

INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@coins, @fur, 2);

INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@gems, @coins, 1000);

INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@teeth, @fur, 300);

INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@seed, @coins, 1);

INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@stone, @fur, 1);

INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@iron, @coins, 150);

INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@coal, @fur, 200);

INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@steel, @fur, 300);
INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@steel, @coins, 50);
INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@steel, @gems, 1);

INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@medicine, @coins, 250);
INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@medicine, @gems, 3);

INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@bullets, @coins, 10);

INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@energy_cell, @coins, 10);
INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@energy_cell, @gems, 10);

INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@bolas, @coins, 10);

INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@grenade, @coins, 200);
INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@grenade, @gems, 5);

INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@bayonet, @coins, 500);

INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@alien_alloy, @coins, 2000);
INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@alien_alloy, @gems, 30);

INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@compass, @fur, 400);
INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@compass, @coins, 20);
INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@compass, @gems, 1);


-------------------------------------------------------
---- Report ----
-------------------------------------------------------
SELECT st1_to.store_name, st2_from.store_name, mt1.amount
	FROM merchant_transforms mt1
JOIN store_type st1_to
	ON st1_to.store_id = mt1.to_store_id
JOIN store_type st2_from
	ON st2_from.store_id = mt1.from_store_id
ORDER BY st1_to.store_name;


