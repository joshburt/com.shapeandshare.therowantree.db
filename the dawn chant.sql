-- SHOW EVENTS;
SET GLOBAL event_scheduler = ON;


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

-- 
-- 
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@scales, @fur, 150);
-- 
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@coins, @fur, 2);
-- 
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@gems, @coins, 1000);
-- 
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@teeth, @fur, 300);
-- 
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@seed, @coins, 1);
-- 
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@stone, @fur, 1);
-- 
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@iron, @coins, 150);
-- 
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@coal, @fur, 200);
-- 
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@steel, @fur, 300);
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@steel, @coins, 50);
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@steel, @gems, 1);
-- 
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@medicine, @coins, 250);
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@medicine, @gems, 3);
-- 
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@bullets, @coins, 10);
-- 
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@energy_cell, @coins, 10);
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@energy_cell, @gems, 10);
-- 
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@bolas, @coins, 10);
-- 
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@grenade, @coins, 200);
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@grenade, @gems, 5);
-- 
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@bayonet, @coins, 500);
-- 
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@alien_alloy, @coins, 2000);
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@alien_alloy, @gems, 30);
-- 
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@compass, @fur, 400);
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@compass, @coins, 20);
-- INSERT INTO merchant_transforms (to_store_id, from_store_id, amount) VALUES (@compass, @gems, 1);


-- SELECT st1_to.store_name, st2_from.store_name, mt1.amount
-- 	FROM merchant_transforms mt1
-- JOIN store_type st1_to
-- 	ON st1_to.store_id = mt1.to_store_id
-- JOIN store_type st2_from
-- 	ON st2_from.store_id = mt1.from_store_id
-- ORDER BY st1_to.store_name;


-- merchant transform (into to id)


-- CALL therowantree.createUser('joshburt', 'joshburt@shapeandshare.com', 'a cool password');

-- SET @username = 'joshburt';

-- SET @user_id = (
-- 	SELECT ui1.user_id
-- 		FROM user_info ui1
-- 	WHERE ui1.username = @username
-- );


-- SET @guid = '7db363d2-1a7b-11e8-b445-60f29d3d5700';
-- SET @user_id = (SELECT user_id FROM user WHERE guid = @guid );

-- CALL therowantree.deleteTransientUsers();

-- DELETE ugs1
-- 	FROM user_game_state ugs1
-- WHERE ugs1.user_id is not null;
-- 
-- DELETE f1
-- 	FROM feature f1
-- 	WHERE f1.user_id is not null;
-- 	
-- DELETE p1 
-- 	FROM perk p1
-- 	WHERE p1.user_id is not null;
-- 
-- DELETE s1 
-- 	FROM store s1
-- WHERE s1.user_id is not null;
-- 
-- DELETE ui1 
-- 	FROM user_income ui1
-- WHERE ui1.user_id is not null;
-- 
-- DELETE ui2
-- 	FROM user_info ui2
-- WHERE ui2.user_id is not null;
-- 
-- DELETE u1
-- 	FROM user u1 
-- WHERE u1.user_id is not null;


-- INSERT INTO feature (user_id, feature_id) VALUES
-- 	(@user_id, 2);

-- INSERT INTO user_income (user_id, income_source_id, amount) VALUES
-- 	(@user_id, 1, 10);

-- CALL processUserIncome(@user_id);



-- CALL therowantree.setUserActiveByGUID(@user_id);
-- CALL therowantree.setUserInactiveByGUID(@guid);

-- SELECT *
--  	FROM user
--  WHERE user_id = @user_id;
 
 
-- SET @guid = (SELECT UUID());
-- CALL therowantree.createUserByGUID(@guid);
-- CALL therowantree.deleteUserByGUID(@guid);
-- CALL therowantree.deleteUserByGUID('71b2b730-1a54-11e8-b445-60f29d3d5700');
-- CALL therowantree.createUser();
-- CALL therowantree.deleteUserByGUID('251f980a-1a56-11e8-b445-60f29d3d5700');

-- DELETE FROM user_income
-- 	WHERE user_id = @user_id;
-- DELETE FROM store
-- 	WHERE user_id = @user_id;
-- DELETE FROM user_game_state
-- 	WHERE user_id = @user_id;
-- DELETE FROM user_info
-- 	WHERE user_id = @user_id;
-- DELETE FROM user
-- 	WHERE user_id = '19';



-- DELETE	FROM store
-- WHERE user_id = @user_id;

-- INSERT INTO user_income (user_id, income_source_id, amount) VALUES (
-- 	@user_id,
--     15,
 --    1
-- );
-- UPDATE user_income
-- 	SET amount = 60
-- WHERE user_id = @user_id
-- 	AND income_source_id = 2;

-- SELECT amount INTO currentAmount
-- 	FROM store
-- WHERE user_id = target_user_id
-- 	AND store_id = target_store_id;

-- CALL processUserIncome(@user_id);

-- SELECT income_source_id, amount FROM user_income where user_id = @user_id;
-- CALL deltaUserIncomeBySource(@user_id , 1);
-- SELECT store_id, amount FROM income_source WHERE income_source_id = 1;


-- CALL deltaUserIncomeBySource(@user_id, 0);
-- CALL deltaUserStore(@user_id, 2, 100);

-- SELECT ui1.*, is1.*, ist1.*, st1.*
-- SELECT ist1.income_source_name, ist1.income_source_description, st1.store_name, st1.store_description, is1.amount
-- 	FROM user_income ui1
-- JOIN income_source is1
-- 	ON  is1.income_source_id = ui1.income_source_id
-- JOIN income_source_type ist1
-- 	ON ist1.income_source_id = is1.income_source_id
-- JOIN store_type st1
-- 	ON st1.store_id = is1.store_id
-- WHERE ui1.user_id=@user_id;

-- CALL therowantree.applyTimeQuantum;

--  SELECT ui1.amount, ist1.income_source_name, ist1.income_source_description
-- 	FROM user_income ui1
-- JOIN income_source_type ist1
-- 	ON ist1.income_source_id = ui1.income_source_id
-- JOIN user u1
-- 	ON u1.user_id = ui1.user_id
-- WHERE u1.guid = 'd7ea6c9e-14de-11e8-b845-b3b77b42da81';   

-- CALL therowantree.processUserIncome(@user_id);

-- SET GLOBAL event_scheduler = ON;

-- DROP EVENT WheelOfTime;
-- CREATE EVENT WheelOfTime
-- 	ON SCHEDULE EVERY 1 SECOND
-- 	DO CALL therowantree.applyTimeQuantum;

-- DROP EVENT CleanUpTemporaryUsers;
-- CREATE EVENT CleanUpTemporaryUsers
-- 	ON SCHEDULE EVERY 1 DAY
 --    DO CALL therowantree.CleanUpTemporaryUsers;


-- CALL applyTimeQuantum();

-- SET @user_guid = (
-- 	SELECT guid FROM user WHERE user_id=@user_id
-- );


-- CALL getUserActivityStateByGUID(@user_guid);

-- SET @active = false;
-- CALL getUserActivityStateByGUID('d7ea6c9e-14de-11e8-b845-b3b77b42da81', @active);
-- SELECT @active;


-- CALL therowantree.process_user_income(@user_id);
-- CALL therowantree.processUserIncome(@user_id);

-- CALL setUserActive(@user_id);
-- CALL applyTimeQuantum();
	-- CALL setUserInActive(@user_id);

	-------------------------------------------------------------------------------------------------------------------
-- populate the feature names
-- INSERT INTO feature_type (feature_name) VALUES ('room'), ('outside'), ('world'), ('spaceship');

-------------------------------------------------------------------------------------------------------------------
-- INSERT INTO store_type (store_name) VALUES
-- ('grenade')
-- ('bayonet')
-- ('sulphur');
-- ('wood'),
-- ('stone'),
-- ('fur'),
-- ('bait'),
-- ('teeth'),
-- ('meat'),
-- ('scales'),
-- ('cloth'),
-- ('charm'),
-- ('gems'),
-- ('coins'),
-- ('seed'),
-- ('crops'),
-- ('leather'),
-- ('cured meat'),
-- ('compass'),
-- ('medicine'),
-- ('torch'),
-- ('meatpie'),
-- ('bone spear'),
-- ('waterskin'),
-- ('rucksack'),
-- ('leather armour'),
-- ('iron'),
-- ('cask'),
-- ('iron sword'),
-- ('wagon'),
-- ('iron armour'),
-- ('steel'),
-- ('coal'),
-- ('water tank'),
-- ('convoy'),
-- ('steel armour'),
-- ('steel sword'),
-- ('rifle'),
-- ('bullets'),
-- ('alien alloy'),
-- ('bolas'),
-- ('energy cell'),
-- ('laser rifle');
-- INSERT INTO feature_type (feature_name) VALUES ('encounters');
-- INSERT INTO feature_type (feature_name) VALUES ('global');
-- INSERT INTO feature_type (feature_name) VALUES ('setpieces');


-------------------------------------------------------------------------------------------------------------------
-- INSERT INTO perk_type (perk_name, perk_description, perk_notify) VALUES
-- ('boxer', 'punches do more damage', 'learned to throw punches with purpose'),
-- ('martial artist', 'punches do even more damage.', 'learned to fight quite effectively without weapons'),
-- ('unarmed master', 'punch twice as fast, and with even more force', 'learned to strike faster without weapons'),
-- ('barbarian', 'melee weapons deal more damage', 'learned to swing weapons with force'),
-- ('slow metabolism', 'go twice as far without eating', 'learned how to ignore the hunger'),
-- ('desert rat', 'go twice as far without drinking', 'learned to love the dry air'),
-- ('evasive', 'dodge attacks more effectively', 'learned to be where they are not'),
-- ('precise', 'land blows more often', 'learned to predict their movement'),
-- ('scout', 'see farther', 'learned to look ahead'),
-- ('stealthy', 'better avoid conflict in the wild', 'learned how not to be seen');


-------------------------------------------------------------------------------------------------------------------
-- INSERT INTO income_source_type (income_source_name) VALUES
-- ('gatherer'),
-- ('hunter'),
-- ('trapper'),
-- ('farmer'),
-- ('tanner'),
-- ('charcutier'),
-- ('iron miner'),
-- ('coal miner'),
-- ('sulphur miner'),
-- ('steelworker'),
-- ('armourer');




-------------------------------------------------------------------------------------------------------------------
-- 
-- SET @source_name = 'gatherer';
-- SET @store_name = 'wood';
-- SET @amount = 1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- SET @store_name = 'stone';
-- SET @amount = 1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- 
-- 
-- SET @source_name = 'hunter';
-- SET @store_name = 'fur';
-- SET @amount = 0.5;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- SET @store_name = 'meat';
-- SET @amount = 0.5;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- 
-- 
-- 
-- SET @source_name = 'trapper';
-- SET @store_name = 'meat';
-- SET @amount = -1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- SET @store_name = 'bait';
-- SET @amount = 1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- 
-- 
-- 
-- 
-- SET @source_name = 'farmer';
-- SET @store_name = 'meat';
-- SET @amount = -1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- SET @store_name = 'fur';
-- SET @amount = -1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- SET @store_name = 'seed';
-- SET @amount = -1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- SET @store_name = 'crops';
-- SET @amount = 3;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- 
-- 
-- 
-- 
-- 
-- SET @source_name = 'tanner';
-- SET @store_name = 'fur';
-- SET @amount = -5;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- SET @store_name = 'leather';
-- SET @amount = 1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- 
-- 
-- 
-- 
-- 
-- SET @source_name = 'charcutier';
-- SET @store_name = 'meat';
-- SET @amount = -5;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- SET @store_name = 'wood';
-- SET @amount = -5;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- SET @store_name = 'cured meat';
-- SET @amount = 1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- 
-- 
-- 
-- SET @source_name = 'iron miner';
-- SET @store_name = 'cured meat';
-- SET @amount = -1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- SET @store_name = 'iron';
-- SET @amount = 1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
 -- 	(@amount)
-- );
-- 
-- 
-- 
-- 
-- SET @source_name = 'coal miner';
-- SET @store_name = 'cured meat';
-- SET @amount = -1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- SET @store_name = 'coal';
-- SET @amount = 1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- 
-- 
-- 
-- 
-- 
-- SET @source_name = 'sulphur miner';
-- SET @store_name = 'cured meat';
-- SET @amount = -1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- SET @store_name = 'sulphur';
-- SET @amount = 1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- 
-- 
-- 
-- 
-- 
-- SET @source_name = 'steelworker';
-- SET @store_name = 'iron';
-- SET @amount = -1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- SET @store_name = 'coal';
-- SET @amount = -1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- SET @store_name = 'steel';
-- SET @amount = 1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- 
-- 
-- 
-- 
-- SET @source_name = 'armourer';
-- SET @store_name = 'steel';
-- SET @amount = -1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- SET @store_name = 'sulphur';
-- SET @amount = -1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- SET @store_name = 'bullets';
-- SET @amount = 1;
-- INSERT INTO income_source (income_source_id, store_id, amount) VALUES
-- (
-- 	(SELECT ist1.income_source_id FROM income_source_type ist1 WHERE ist1.income_source_name = @source_name),
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(@amount)
-- );
-- 
-- 
-- 
-------------------------------------------------------------------------------------------------------------------
-- Report
-- SELECT ist1.income_source_name, st1.store_name,  is1.amount
-- 	FROM income_source_type ist1
-- JOIN income_source is1
-- 	ON ist1.income_source_id = is1.income_source_id
-- JOIN store_type st1
-- 	ON st1.store_id = is1.store_id
-------------------------------------------------------------------------------------------------------------------







-- SET @store_name = 'fur';
-- SET @rollUnder = 0.5;
-- SET @message = 'scraps of fur';
-- INSERT INTO trapdrop (store_id, roll_under, message) VALUES
-- (
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(SELECT @rollUnder),
-- 	(SELECT @message)
-- );
-- 
-- 
-- SET @store_name = 'meat';
-- SET @rollUnder = 0.75;
-- SET @message = 'bits of meat';
-- INSERT INTO trapdrop (store_id, roll_under, message) VALUES
-- (
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(SELECT @rollUnder),
-- 	(SELECT @message)
-- );
-- 
-- 
-- SET @store_name = 'seed';
-- SET @rollUnder = 0.75;
-- SET @message = 'seed';
-- INSERT INTO trapdrop (store_id, roll_under, message) VALUES
-- (
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(SELECT @rollUnder),
-- 	(SELECT @message)
-- );
-- 
-- 
-- SET @store_name = 'scales';
-- SET @rollUnder = 0.85;
-- SET @message = 'strange scales';
-- INSERT INTO trapdrop (store_id, roll_under, message) VALUES
-- (
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(SELECT @rollUnder),
-- 	(SELECT @message)
-- );
-- 
-- 
-- SET @store_name = 'teeth';
-- SET @rollUnder = 0.93;
-- SET @message = 'scattered teeth';
-- INSERT INTO trapdrop (store_id, roll_under, message) VALUES
-- (
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(SELECT @rollUnder),
-- 	(SELECT @message)
-- );
-- 
-- 
-- SET @store_name = 'cloth';
-- SET @rollUnder = 0.995;
-- SET @message = 'tattered cloth';
-- INSERT INTO trapdrop (store_id, roll_under, message) VALUES
-- (
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(SELECT @rollUnder),
-- 	(SELECT @message)
-- );
-- 
-- 
-- SET @store_name = 'charm';
-- SET @rollUnder = 1.0;
-- SET @message = 'a crudely made charm';
-- INSERT INTO trapdrop (store_id, roll_under, message) VALUES
-- (
-- 	(SELECT st1.store_id FROM store_type st1 WHERE st1.store_name = @store_name),
-- 	(SELECT @rollUnder),
-- 	(SELECT @message)
-- );


-- REPORT --
-- SELECT td1.roll_under, st1.store_name, td1.message
-- 	FROM trapdrop td1
-- JOIN store_type st1
-- 	ON st1.store_id = td1.store_id;
-- 



SET @my_guid = '870a7d28-1cef-11e8-b445-60f29d3d5700';
-- SET @my_guid = '89010174-1f01-11e8-a100-467facde5613';
SET @me = (SELECT user_id FROM user WHERE guid = @my_guid);
-- CALL therowantree.increaseUserPopulationByGUID(@my_guid);
-- CALL therowantree.getUserPopulationByGUID(@me);
-- CALL therowantree.deltaUserIncomeByGUID(@my_guid, 3,-1);
-- CALL getUserIncomeByGUID(@my_guid);

-- CALL getUserMerchantTransformsByGUID(@my_guid);

-- SELECT DISTINCT st1.store_name
-- 	FROM user u1
-- JOIN store s1
-- 	ON u1.user_id = s1.user_id
-- JOIN merchant_transforms mt1
-- 	ON s1.store_id = mt1.to_store_id
-- JOIN store_type st1
-- 	ON st1.store_id = s1.store_id
-- WHERE u1.guid = @my_guid
-- 	AND u1.active > 0


-- SET @to_store_name='stone';
-- CALL peformMerchantTransformByGUID(@my_guid, 'stone');

-- SELECT st2_from.store_id, mt1.amount
-- 	FROM merchant_transforms mt1
-- JOIN store_type st1_to
-- 	ON st1_to.store_id = mt1.to_store_id
-- JOIN store_type st2_from
-- 	ON st2_from.store_id = mt1.from_store_id
-- WHERE st1_to.store_name = @to_store_name
-- 	ORDER BY st1_to.store_name;


-- INSERT INTO user_income (user_id, income_source_id, amount) VALUES
-- (@me, 4, 0);


-- INSERT INTO user_income (user_id, income_source_id, amount) VALUES
--  (
--  	@me,
--      1,
--      0
--  );

-- UPDATE user_income
-- 	SET amount = 0
-- WHERE user_id = @me
-- 	AND income_source_id=1;



-- CALL peformMerchantTransformByGUID(@my_guid, @fur);

-- CALL applyTimeQuantum();