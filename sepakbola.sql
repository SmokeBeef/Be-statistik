-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 28, 2023 at 04:39 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sepakbola`
--

-- --------------------------------------------------------

--
-- Table structure for table `ballpossession`
--

CREATE TABLE `ballpossession` (
  `possession_id` int NOT NULL,
  `match_id` int NOT NULL,
  `team_id` int NOT NULL,
  `possession_time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `card_id` int NOT NULL,
  `match_id` int NOT NULL,
  `player_id` int NOT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `foul`
--

CREATE TABLE `foul` (
  `id` int NOT NULL,
  `match_id` int NOT NULL,
  `team_id` int NOT NULL,
  `player_id` int NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goal`
--

CREATE TABLE `goal` (
  `id` int NOT NULL,
  `match_id` int NOT NULL,
  `player_id` int NOT NULL,
  `goal_time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `injury`
--

CREATE TABLE `injury` (
  `id` int NOT NULL,
  `match_id` int NOT NULL,
  `player_id` int NOT NULL,
  `injury_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `match`
--

CREATE TABLE `match` (
  `id` int NOT NULL,
  `homeTeam` int NOT NULL,
  `awayTeam` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offset`
--

CREATE TABLE `offset` (
  `offset_id` int NOT NULL,
  `match_id` int NOT NULL,
  `offset_team_id` int NOT NULL,
  `offset_time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numberJersey` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `name`, `numberJersey`, `position`, `team_id`) VALUES
(14, 'Y2', '9', 'CB', 3),
(21, 'Dito', '10', 'SW', 3),
(26, 'Inul', '1', 'CB', 14),
(27, 'Mukidi', '7', 'ST', 14),
(28, 'Mustafa', '12', 'GK', 3),
(29, 'Almi', '24', 'GK', 14);

-- --------------------------------------------------------

--
-- Table structure for table `switchplayer`
--

CREATE TABLE `switchplayer` (
  `switch_id` int NOT NULL,
  `match_id` int NOT NULL,
  `player_out_id` int NOT NULL,
  `player_in_id` int NOT NULL,
  `switch_time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `name`) VALUES
(3, 'Arema'),
(14, 'Timnas Indo');

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('246834b2-0e5d-4cac-9ded-1ec373fcc976', 'a050d325f21c8950597687be7185481b6a9c9f3ed44c7168880302249883e73b', '2023-05-25 15:57:31.804', '20230525155731_1', NULL, NULL, '2023-05-25 15:57:31.106', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ballpossession`
--
ALTER TABLE `ballpossession`
  ADD PRIMARY KEY (`possession_id`),
  ADD KEY `ballPossession_match_id_fkey` (`match_id`),
  ADD KEY `ballPossession_team_id_fkey` (`team_id`);

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`card_id`),
  ADD KEY `card_match_id_fkey` (`match_id`),
  ADD KEY `card_player_id_fkey` (`player_id`);

--
-- Indexes for table `foul`
--
ALTER TABLE `foul`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foul_player_id_fkey` (`player_id`),
  ADD KEY `foul_match_id_fkey` (`match_id`);

--
-- Indexes for table `goal`
--
ALTER TABLE `goal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goal_player_id_fkey` (`player_id`),
  ADD KEY `goal_match_id_fkey` (`match_id`);

--
-- Indexes for table `injury`
--
ALTER TABLE `injury`
  ADD PRIMARY KEY (`id`),
  ADD KEY `injury_player_id_fkey` (`player_id`),
  ADD KEY `injury_match_id_fkey` (`match_id`);

--
-- Indexes for table `match`
--
ALTER TABLE `match`
  ADD PRIMARY KEY (`id`),
  ADD KEY `match_homeTeam_fkey` (`homeTeam`),
  ADD KEY `match_awayTeam_fkey` (`awayTeam`);

--
-- Indexes for table `offset`
--
ALTER TABLE `offset`
  ADD PRIMARY KEY (`offset_id`),
  ADD KEY `offset_match_id_fkey` (`match_id`),
  ADD KEY `offset_offset_team_id_fkey` (`offset_team_id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_team_id_fkey` (`team_id`);

--
-- Indexes for table `switchplayer`
--
ALTER TABLE `switchplayer`
  ADD PRIMARY KEY (`switch_id`),
  ADD KEY `switchPlayer_match_id_fkey` (`match_id`),
  ADD KEY `switchPlayer_player_out_id_fkey` (`player_out_id`),
  ADD KEY `switchPlayer_player_in_id_fkey` (`player_in_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ballpossession`
--
ALTER TABLE `ballpossession`
  MODIFY `possession_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `card_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `foul`
--
ALTER TABLE `foul`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goal`
--
ALTER TABLE `goal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `injury`
--
ALTER TABLE `injury`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `match`
--
ALTER TABLE `match`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offset`
--
ALTER TABLE `offset`
  MODIFY `offset_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `switchplayer`
--
ALTER TABLE `switchplayer`
  MODIFY `switch_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ballpossession`
--
ALTER TABLE `ballpossession`
  ADD CONSTRAINT `ballPossession_match_id_fkey` FOREIGN KEY (`match_id`) REFERENCES `match` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ballPossession_team_id_fkey` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `card_match_id_fkey` FOREIGN KEY (`match_id`) REFERENCES `match` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `card_player_id_fkey` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `foul`
--
ALTER TABLE `foul`
  ADD CONSTRAINT `foul_match_id_fkey` FOREIGN KEY (`match_id`) REFERENCES `match` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `foul_player_id_fkey` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `goal`
--
ALTER TABLE `goal`
  ADD CONSTRAINT `goal_match_id_fkey` FOREIGN KEY (`match_id`) REFERENCES `match` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `goal_player_id_fkey` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `injury`
--
ALTER TABLE `injury`
  ADD CONSTRAINT `injury_match_id_fkey` FOREIGN KEY (`match_id`) REFERENCES `match` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `injury_player_id_fkey` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `match`
--
ALTER TABLE `match`
  ADD CONSTRAINT `match_awayTeam_fkey` FOREIGN KEY (`awayTeam`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `match_homeTeam_fkey` FOREIGN KEY (`homeTeam`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offset`
--
ALTER TABLE `offset`
  ADD CONSTRAINT `offset_match_id_fkey` FOREIGN KEY (`match_id`) REFERENCES `match` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offset_offset_team_id_fkey` FOREIGN KEY (`offset_team_id`) REFERENCES `team` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_team_id_fkey` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `switchplayer`
--
ALTER TABLE `switchplayer`
  ADD CONSTRAINT `switchPlayer_match_id_fkey` FOREIGN KEY (`match_id`) REFERENCES `match` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `switchPlayer_player_in_id_fkey` FOREIGN KEY (`player_in_id`) REFERENCES `player` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `switchPlayer_player_out_id_fkey` FOREIGN KEY (`player_out_id`) REFERENCES `player` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
