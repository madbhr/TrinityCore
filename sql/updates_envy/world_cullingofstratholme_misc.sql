SET @CGUID := 210018;

-- Spawn the Infinite Corruptor
DELETE FROM `creature` WHERE `guid`=@CGUID AND `id`=32273;
INSERT INTO `creature`(`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`,`orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID, 32273, 595, 1,1, 2331.642, 1273.273, 132.9524, 3.717551, 7200, 0, 0);

-- Spawn the Guardian of time
DELETE FROM `creature` WHERE `guid` = @CGUID+1;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+1, 32281, 595, 2, 1, 2321.489, 1268.383, 132.8507, 0.418879, 120, 0, 0);

-- Add Corruption of Time aura to the Guardian
DELETE FROM `creature_addon` WHERE `guid` = @CGUID+1;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(@CGUID+1, 0, 0, 0, 0, 0, 60451);

-- Spawn Time-Rift
DELETE FROM `creature` WHERE `guid` = @CGUID+2 AND `id` = 28409;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@CGUID+2, 28409, 595, 2, 1, 0, 0, 2340.55, 1278.6, 133.312, 3.4767, 86400, 0, 0, 1, 0, 0, 0, 0, 0);

-- Guardian of Time's creature_text
DELETE FROM `creature_text` WHERE `entry` = 32281;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(32281, 0, 0, 'You have my thanks for saving my existence in this timeline. Now I must report back to my superiors. They must know immediately of what I just experienced.', 12, 0, 100, 0, 0, 0, 'Guardian of Time - SAY_SUCCESS');

-- Chromie's creature_text
DELETE FROM `creature_text` WHERE `entry` = '26527';
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(26527, 0, 0, 'Oh, no! Adventurers, something awful has happened! A colleague of mine has been captured by the Infinite Dragonflight, and they''re doing something horrible to him!$B$BKeeping Arthas is still your highest priority, but if you act fast you could help save a Guardian of Time!', 15, 0, 100, 0, 0, 0, 'Chromie'),
(26527, 1, 0, 'Adventurers, you must hurry! The Guardian of Time cannot last for much longer!', 15, 0, 100, 0, 0, 0, 'Chromie'),
(26527, 2, 0, 'I can barely sense the Guardian of Time! His timeline is fading quickly!', 15, 0, 100, 0, 0, 0, 'Chromie');

-- Corruption of Time implicit target conditions
DELETE FROM `conditions` WHERE`SourceEntry` = 60422 AND `SourceTypeOrReferenceId` = 13;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)VALUES
(13, 1, 60422, 0, 0, 31, 0, 3, 32281, 0, 0, 0, 0,'','Infinite Corruptor - Corruption of Time');

-- Remove The Culling of Time achievement criteria from disables
DELETE FROM `disables` WHERE `entry` = 7494 AND `sourceType` = 4;

-- Adds immunites to the Infinite Corruptor
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` |1|2|4|16|32|64|256|512|1024|2048|4096|8192|65536|131072|8388608|33554432|67108864 WHERE `entry` = 32273;


-- Chromie -- at start of CoS
-- fix by w1sht0l1v3 (https://gist.github.com/w1sht0l1v3/1952424)
SET @CHROMIE := 26527;
SET @QUEST := 13149; -- Dispelling Illusions
SET @MENUID1 := 9586;
SET @MENUID2 := 9594;
SET @MENUID3 := 9595;
SET @MENUID4 := 9596;
SET @MENUID5 := 11277;
SET @SPELL_TRIGGER := 53435; -- Teleport to CoT Stratholme Phase 4
SET @SPELL_EFFECT := 53436; -- Teleport to CoT Stratholme Phase 4

DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (@MENUID1,@MENUID2,@MENUID3,@MENUID5);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES

(@MENUID1,0,0,'Why have I been sent back to this particular place and time?',1,1,@MENUID2,0,0,0,''),
(@MENUID1,1,0,'Yes, please!',1,1,0,0,0,0,''),
(@MENUID1,2,0,'Chromie, you and I both know what''s going to happen in this time stream. We''ve seen this all before. Can you just skip us ahead to all the real action?',1,1,11277,0,0,0,''),
(@MENUID2,0,0,'What was this decision?',1,1,@MENUID3,0,0,0,''),
(@MENUID3,0,0,'So how does the Infinite Dragonflight plan to interfere?',1,1,@MENUID4,0,0,0,''),
(@MENUID5,0,0,'Yes, please!',1,1,0,0,0,0,'');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@MENUID1;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=14 AND `SourceGroup`=@MENUID1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15,@MENUID1,0,0,0,14,0,@QUEST,0,0,1,0,'','Show gossip if player has quest'),
(15,@MENUID1,1,0,0,14,0,@QUEST,0,0,0,0,'','Show gossip if player doesn''t have quest'),
(15,@MENUID1,2,0,0,14,0,@QUEST,0,0,1,0,'','Show gossip if player has quest'),
(14,@MENUID1,12939,0,0,14,0,@QUEST,0,0,1,0,'','Show text if player has quest'),
(14,@MENUID1,13470,0,0,14,0,@QUEST,0,0,0,0,'','Show text if player doesn''t have quest');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=@SPELL_TRIGGER;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(@SPELL_TRIGGER,@SPELL_EFFECT,1,'Teleport to CoT Stratholme Phase 4');

DELETE FROM `spell_target_position` WHERE `id`=@SPELL_EFFECT;
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(@SPELL_EFFECT,595,2071.55,1287.68,141.687,0);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@CHROMIE;

DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@CHROMIE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@CHROMIE,0,0,0,62,0,100,0,@MENUID1,1,0,0,11,@SPELL_TRIGGER,0,0,0,0,0,7,0,0,0,0,0,0,0,'Chromie - On gossip - Cast spell'),
(@CHROMIE,0,1,0,62,0,100,0,@MENUID5,0,0,0,11,@SPELL_TRIGGER,0,0,0,0,0,7,0,0,0,0,0,0,0,'Chromie - On gossip - Cast spell');