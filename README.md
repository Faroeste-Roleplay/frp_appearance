### To use script do you wanna request access from link above
[Request Script Access](https://nxtstudio.tebex.io/package/6263251)

![Captura de tela 2024-05-11 120953](https://github.com/Faroeste-Roleplay/frp_appearance/assets/29707143/c286c64b-08f5-4b61-bc83-1f3921e11b1f)

[Video preview](https://streamable.com/n49ivr)

## Why is it escrowed?
> I spent a long time developing and refining this character creation/clothing store.
> 
> I organized all the components so that the clothing items are separated by color.
> 
> After a long period of work, I reached this result in the character creation process.
> It will be released for free (escrowed) for everyone using the FRP Framework, but to also compensate for all my effort and work in this character creation, I decided to release it as open-source for those who wish to purchase and adapt it to their framework or server.
> 
> The open-source version will be paid, and it cannot be distributed in any way on the internet, as this would violate the script licenses and my work; I want to prevent people from taking this code and publicly integrating it into their frameworks, which would completely undermine my work.
> 
> Below are photos and a demonstration video of how it works.
> 
> Its data-saving structure in the DB is completely different from the conventional methods used by frameworks today;
> I will leave the structure of the SQL file below.


```sql
-- Copiando estrutura para tabela faroeste.character_appearance
CREATE TABLE IF NOT EXISTS `character_appearance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charId` int(11) DEFAULT NULL,
  `isMale` tinyint(1) DEFAULT 1,
  `expressions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `bodyApparatusId` int(11) DEFAULT 0,
  `bodyApparatusStyleId` int(11) DEFAULT 0,
  `headApparatusId` int(11) DEFAULT 0,
  `teethApparatusStyleId` int(11) DEFAULT 0,
  `eyesApparatusId` int(11) DEFAULT 0,
  `eyesApparatusStyleId` int(11) DEFAULT 0,
  `whistleShape` float DEFAULT 0,
  `whistlePitch` float DEFAULT 0,
  `whistleClarity` float DEFAULT 0,
  `height` tinyint(3) unsigned DEFAULT 180,
  `bodyWeightOufitType` tinyint(3) unsigned DEFAULT 10,
  `bodyKindType` tinyint(3) unsigned DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `charId` (`charId`) USING BTREE,
  CONSTRAINT `FK_character_appearance_character` FOREIGN KEY (`charId`) REFERENCES `character` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expressions` CHECK (json_valid(`expressions`))
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando estrutura para tabela faroeste.character_appearance_customizable
CREATE TABLE IF NOT EXISTS `character_appearance_customizable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charId` int(11) DEFAULT NULL,
  `overridePedModel` varchar(255) DEFAULT NULL,
  `overridePedIsMale` tinyint(1) DEFAULT NULL,
  `equippedOutfitId` int(11) DEFAULT NULL,
  `hairApparatusId` int(11) DEFAULT 0,
  `hairApparatusStyleId` int(11) DEFAULT 0,
  `mustacheApparatusId` int(11) DEFAULT 0,
  `mustacheApparatusStyleId` int(11) DEFAULT 0,
  `weightPercentage` float DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `charId` (`charId`) USING BTREE,
  CONSTRAINT `FK_character_appearance_customizable_character` FOREIGN KEY (`charId`) REFERENCES `character` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando estrutura para tabela faroeste.character_appearance_overlays
CREATE TABLE IF NOT EXISTS `character_appearance_overlays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charId` int(11) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `charId` (`charId`) USING BTREE,
  CONSTRAINT `FK_character_appearance_overlays_character` FOREIGN KEY (`charId`) REFERENCES `character` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `data` CHECK (json_valid(`data`))
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando estrutura para tabela faroeste.character_appearance_overlays_customizable
CREATE TABLE IF NOT EXISTS `character_appearance_overlays_customizable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charId` int(11) DEFAULT NULL,
  `hasFacialHair` tinyint(1) DEFAULT 0,
  `headHairStyle` int(11) DEFAULT NULL,
  `headHairOpacity` int(11) DEFAULT NULL,
  `foundationColor` int(11) DEFAULT NULL,
  `foundationOpacity` int(11) DEFAULT NULL,
  `lipstickColor` int(11) DEFAULT NULL,
  `lipstickOpacity` int(11) DEFAULT NULL,
  `facePaintColor` int(11) DEFAULT NULL,
  `facePaintOpacity` int(11) DEFAULT NULL,
  `eyeshadowColor` int(11) DEFAULT NULL,
  `eyeshadowOpacity` int(11) DEFAULT NULL,
  `eyelinerColor` int(11) DEFAULT NULL,
  `eyelinerOpacity` int(11) DEFAULT NULL,
  `eyebrowsStyle` int(11) DEFAULT NULL,
  `eyebrowsColor` int(11) DEFAULT NULL,
  `eyebrowsOpacity` int(11) DEFAULT NULL,
  `blusherStyle` int(11) DEFAULT NULL,
  `blusherColor` int(11) DEFAULT NULL,
  `blusherOpacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `charId` (`charId`) USING BTREE,
  CONSTRAINT `FK_character_appearance_overlays_customizable_character` FOREIGN KEY (`charId`) REFERENCES `character` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- Copiando dados para a tabela faroeste.character_appearance_overlays_customizable: ~0 rows (aproximadamente)

CREATE TABLE `character_outfit` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`charId` INT(11) NOT NULL,
	`name` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`apparels` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `charId` (`charId`) USING BTREE,
	CONSTRAINT `FK_character_outfit_character` FOREIGN KEY (`charId`) REFERENCES `character` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `apparels` CHECK (json_valid(`apparels`))
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1;
```
