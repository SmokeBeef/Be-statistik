-- CreateTable
CREATE TABLE `player` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `numberJersey` VARCHAR(191) NOT NULL,
    `position` VARCHAR(191) NOT NULL,
    `team_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `team` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `match` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `homeTeam` INTEGER NOT NULL,
    `awayTeam` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `offset` (
    `offset_id` INTEGER NOT NULL AUTO_INCREMENT,
    `match_id` INTEGER NOT NULL,
    `offset_team_id` INTEGER NOT NULL,
    `offset_time` INTEGER NOT NULL,

    PRIMARY KEY (`offset_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `goal` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `match_id` INTEGER NOT NULL,
    `player_id` INTEGER NOT NULL,
    `goal_time` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `foul` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `match_id` INTEGER NOT NULL,
    `team_id` INTEGER NOT NULL,
    `player_id` INTEGER NOT NULL,
    `type` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `injury` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `match_id` INTEGER NOT NULL,
    `player_id` INTEGER NOT NULL,
    `injury_type` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ballPossession` (
    `possession_id` INTEGER NOT NULL AUTO_INCREMENT,
    `match_id` INTEGER NOT NULL,
    `team_id` INTEGER NOT NULL,
    `possession_time` INTEGER NOT NULL,

    PRIMARY KEY (`possession_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `card` (
    `card_id` INTEGER NOT NULL AUTO_INCREMENT,
    `match_id` INTEGER NOT NULL,
    `player_id` INTEGER NOT NULL,
    `card_type` VARCHAR(191) NOT NULL,
    `card_time` INTEGER NOT NULL,

    PRIMARY KEY (`card_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `switchPlayer` (
    `switch_id` INTEGER NOT NULL AUTO_INCREMENT,
    `match_id` INTEGER NOT NULL,
    `player_out_id` INTEGER NOT NULL,
    `player_in_id` INTEGER NOT NULL,
    `switch_time` INTEGER NOT NULL,

    PRIMARY KEY (`switch_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `player` ADD CONSTRAINT `player_team_id_fkey` FOREIGN KEY (`team_id`) REFERENCES `team`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `match` ADD CONSTRAINT `match_homeTeam_fkey` FOREIGN KEY (`homeTeam`) REFERENCES `team`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `match` ADD CONSTRAINT `match_awayTeam_fkey` FOREIGN KEY (`awayTeam`) REFERENCES `team`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `offset` ADD CONSTRAINT `offset_match_id_fkey` FOREIGN KEY (`match_id`) REFERENCES `match`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `offset` ADD CONSTRAINT `offset_offset_team_id_fkey` FOREIGN KEY (`offset_team_id`) REFERENCES `team`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `goal` ADD CONSTRAINT `goal_player_id_fkey` FOREIGN KEY (`player_id`) REFERENCES `player`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `goal` ADD CONSTRAINT `goal_match_id_fkey` FOREIGN KEY (`match_id`) REFERENCES `match`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `foul` ADD CONSTRAINT `foul_player_id_fkey` FOREIGN KEY (`player_id`) REFERENCES `player`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `foul` ADD CONSTRAINT `foul_match_id_fkey` FOREIGN KEY (`match_id`) REFERENCES `match`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `injury` ADD CONSTRAINT `injury_player_id_fkey` FOREIGN KEY (`player_id`) REFERENCES `player`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `injury` ADD CONSTRAINT `injury_match_id_fkey` FOREIGN KEY (`match_id`) REFERENCES `match`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ballPossession` ADD CONSTRAINT `ballPossession_match_id_fkey` FOREIGN KEY (`match_id`) REFERENCES `match`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ballPossession` ADD CONSTRAINT `ballPossession_team_id_fkey` FOREIGN KEY (`team_id`) REFERENCES `team`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `card` ADD CONSTRAINT `card_match_id_fkey` FOREIGN KEY (`match_id`) REFERENCES `match`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `card` ADD CONSTRAINT `card_player_id_fkey` FOREIGN KEY (`player_id`) REFERENCES `player`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `switchPlayer` ADD CONSTRAINT `switchPlayer_match_id_fkey` FOREIGN KEY (`match_id`) REFERENCES `match`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `switchPlayer` ADD CONSTRAINT `switchPlayer_player_out_id_fkey` FOREIGN KEY (`player_out_id`) REFERENCES `player`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `switchPlayer` ADD CONSTRAINT `switchPlayer_player_in_id_fkey` FOREIGN KEY (`player_in_id`) REFERENCES `player`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
