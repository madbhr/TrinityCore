-- Elder Nadox eggs
UPDATE `creature_template` SET `unit_flags` = `unit_flags` |2|256|33554432, `ScriptName` = "npc_nadox_eggs" WHERE `entry` IN (30172, 31446, 30173, 31445);