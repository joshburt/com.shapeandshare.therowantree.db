START TRANSACTION;

SET @room_feature_id =  (SELECT feature_id FROM feature_type WHERE feature_name = 'room');
SET @outside_feature_id =  (SELECT feature_id FROM feature_type WHERE feature_name = 'outside');

INSERT INTO feature_state (feature_id, state_index, state_name, state_description) VALUES
	(@room_feature_id, 1, 'A Shadowy Grove', NULL),
	(@room_feature_id, 2, 'A Rowan Tree Lit By Firelight', NULL),
    (@outside_feature_id, 1, 'A Silent Forest', NULL),
    (@outside_feature_id, 2, 'A Lonely Hut', NULL),
    (@outside_feature_id, 3, 'A Cozy Hamlet', NULL),
    (@outside_feature_id, 4, 'A Quaint Village', NULL),
    (@outside_feature_id, 5, 'A Bustling Town', NULL),
    (@outside_feature_id, 6, 'A Swarming City', NULL);


COMMIT;
