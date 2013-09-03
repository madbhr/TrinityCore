SET @id = 989;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+10;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'npcbot'),
(@id+1, 'npcbot info'),
(@id+2, 'npcbot add'),
(@id+3, 'npcbot revive'),
(@id+4, 'npcbot remove'),
(@id+5, 'npcbot reset'),
(@id+6, 'npcbot command'),
(@id+7, 'npcbot distance'),
(@id+8, 'npcbot helper'),
(@id+9, 'maintank'),
(@id+10, 'mt');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+10;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(1, @id+0),
(1, @id+1),
(1, @id+2),
(1, @id+3),
(1, @id+4),
(3, @id+5),
(1, @id+6),
(1, @id+7),
(1, @id+8),
(1, @id+9),
(1, @id+10);