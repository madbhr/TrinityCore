-- MIMIRON: Mimiron
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_mimiron' WHERE `entry` = 33350;

-- MIMIRON: Leviathan MKII
UPDATE `creature_template` SET `vehicleid` = 370, `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_leviathan_mk' WHERE `entry` = 33432;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34106;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_leviathan_mk_turret' WHERE `entry` = 34071;
UPDATE creature_template SET ScriptName = 'npc_proximity_mine' WHERE entry = 34362;
DELETE FROM vehicle_template_accessory WHERE entry = 33432;
INSERT INTO vehicle_template_accessory VALUE (33432, 34071, 3, 1, 'Leviathan Mk II turret', 8, 0);
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (33432,33651);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(33651, 46598, 1, 0),
(33432, 46598, 1, 0);
DELETE FROM `creature_text` WHERE `entry` = 33432;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(33432, 0, 0, 'Leviathan MK II begins to cast Plasma Blast!', 41, 0, 100, 0, 0, 0, 'Leviathan MK II EMOTE_PLASMA_BLAST');

-- MIMIRON: VX-001
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `vehicleid` = 371, `ScriptName` = 'boss_vx_001' WHERE `entry` = 33651;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34108;
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 34050;
UPDATE `creature_template` SET `unit_flags` = 33686020, `flags_extra` = 2 WHERE `entry` = 34211;
UPDATE `creature_template` SET `ScriptName` = 'npc_rocket_strike' WHERE `entry` = 34047;
DELETE FROM `spell_script_names` WHERE `spell_id` = 63382;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(63382, 'spell_rapid_burst');

-- MIMIRON: Aerial Command Unit
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'boss_aerial_unit', `vehicleid` = 372 WHERE `entry` = 33670;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34109;
UPDATE `creature_template` SET `ScriptName` = 'npc_magnetic_core' WHERE `entry` = 34068;
UPDATE `creature_template` SET `ScriptName` = 'npc_assault_bot' WHERE `entry` = 34057;
UPDATE `creature_template` SET `difficulty_entry_1` = 34148, `ScriptName` = 'npc_emergency_bot' WHERE `entry` = 34147;

-- MIMIRON: HardMode
UPDATE `gameobject_template` SET `flags` = 32, `ScriptName` = 'go_not_push_button' WHERE `entry` = 194739;
UPDATE `creature_template` SET `difficulty_entry_1` = 34361, `ScriptName` = 'npc_frost_bomb' WHERE `entry` = 34149;
UPDATE `creature_template` SET `speed_walk` = 0.15, `speed_run` = 0.15, `ScriptName` = 'npc_mimiron_flame_trigger' WHERE `entry` = 34363;
UPDATE `creature_template` SET `ScriptName` = 'npc_mimiron_flame_spread' WHERE `entry` = 34121;
UPDATE `creature_template` SET `ScriptName` = 'npc_mimiron_bomb_bot' WHERE `entry` = 33836;

-- MIMIRON: Conditions
DELETE FROM `conditions` WHERE SourceTypeOrReferenceId = 13 AND SourceEntry IN (63414,64619,65333,64570,64626,65192,63041,65040,65346);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
-- Rocket Strike
(13, 1, 63041, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', NULL),
(13, 1, 63041, 0, 0, 31, 0, 3, 34147, 0, 0, 0, 0, '', NULL),
(13, 1, 63041, 0, 0, 31, 0, 3, 34057, 0, 0, 0, 0, '', NULL),
(13, 1, 63041, 0, 0, 31, 0, 3, 33855, 0, 0, 0, 0, '', NULL),
(13, 1, 63041, 0, 0, 31, 0, 3, 34362, 0, 0, 0, 0, '', NULL),
(13, 1, 63041, 0, 0, 31, 0, 3, 33836, 0, 0, 0, 0, '', NULL),
-- Not So Friendly Fire only players
(13, 1, 65040, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', NULL),
(13, 1, 65346, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', NULL),
-- Spinning up
(13, 1, 63414, 0, 0, 31, 0, 3, 33651, 0, 0, 0, 0, '', NULL),
-- Addtional
(13, 1, 64570, 0, 0, 31, 0, 3, 34121, 0, 0, 0, 0, '', NULL),
(13, 1, 64570, 0, 0, 31, 0, 3, 34363, 0, 0, 0, 0, '', NULL),
(13, 1, 65192, 0, 0, 31, 0, 3, 34121, 0, 0, 0, 0, '', NULL),
(13, 1, 65192, 0, 0, 31, 0, 3, 34363, 0, 0, 0, 0, '', NULL),
(13, 1, 64626, 0, 0, 31, 0, 3, 34121, 0, 0, 0, 0, '', NULL),
(13, 1, 64626, 0, 0, 31, 0, 3, 34363, 0, 0, 0, 0, '', NULL),
(13, 1, 65333, 0, 0, 31, 0, 3, 34121, 0, 0, 0, 0, '', NULL),
(13, 1, 65333, 0, 0, 31, 0, 3, 34363, 0, 0, 0, 0, '', NULL),
(13, 1, 64619, 0, 0, 31, 0, 3, 34121, 0, 0, 0, 0, '', NULL),
(13, 1, 64619, 0, 0, 31, 0, 3, 34363, 0, 0, 0, 0, '', NULL);

-- MIMIRON: Achievement not-so-friendly fire
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10405,10406) AND `type`=18;

-- MIMIRON: Achievement firefighter
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10450,10463);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10450,10463) AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(10450,11,0,0, 'achievement_mimiron_firefighter'),
(10463,11,0,0, 'achievement_mimiron_firefighter');