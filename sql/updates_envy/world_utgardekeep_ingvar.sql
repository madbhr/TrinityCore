-- Set InhabitType for Annhylde the Caller
UPDATE `creature_template` SET `InhabitType` = `InhabitType` |4 WHERE `entry` IN (24068, 31655);

DELETE FROM `creature_text` WHERE `entry`=24068;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(24068,0,0, "Ingvar! Your pathetic failure will serve as a warning to all... you are damned! Arise and carry out the master''s will!",14,0,100,0,0,13754, "Annhylde the Caller - YELL_RESSURECT");