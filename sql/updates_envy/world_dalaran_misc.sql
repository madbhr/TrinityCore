-- Dalaran
-- Images fix
DELETE FROM `creature` WHERE `id` IN (31584, 31622, 31631, 31634);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(104503, 31584, 571, 1, 1, 0, 0, 5701.41, 585.792, 652.632, 4.01827, 300, 0, 0, 168512, 0, 0, 0, 0, 0),
(108043, 31622, 571, 1, 1, 0, 0, 5704.07, 583.587, 652.632, 4.03398, 300, 0, 0, 337025, 0, 0, 0, 0, 0),
(109066, 31631, 571, 1, 1, 0, 0, 5769.25, 530.56, 652.633, 3.99314, 300, 0, 0, 48700, 0, 0, 0, 0, 0),
(109724, 31634, 571, 1, 1, 0, 0, 5772.38, 528.269, 652.632, 4.02134, 300, 0, 0, 50400, 0, 0, 0, 0, 0);

-- Dedication of Honor
UPDATE `gameobject_template` SET `data2`=0, `data7`=0, `data19`=11431 WHERE `entry`=202443;
DELETE FROM `conditions` WHERE `SourceEntry` =202443;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(22,1,202443,1,0,17,0,4530,0,0,0,0, '', 'Memorial - Need The Frozen Throne achievement to play movie');