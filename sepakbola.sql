-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 03, 2023 at 08:44 PM
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
  `match_id` int NOT NULL,
  `team_id` int NOT NULL,
  `possession_time` double NOT NULL,
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ballpossession`
--

INSERT INTO `ballpossession` (`match_id`, `team_id`, `possession_time`, `id`) VALUES
(19, 4, 5.222222222222222, 1),
(19, 3, 1.537037037037037, 2),
(20, 5, 40.80701754385964, 3),
(20, 4, 59.01754385964912, 4),
(22, 4, 59.18518518518518, 5),
(22, 3, 41.55555555555556, 6);

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `match_id` int NOT NULL,
  `player_id` int NOT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_time` int NOT NULL,
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`match_id`, `player_id`, `card_type`, `card_time`, `id`) VALUES
(18, 11, 'yellow', 88, 23),
(20, 11, 'yellow', 65, 24),
(20, 6, 'red', 67, 25),
(20, 6, 'yellow', 70, 26),
(20, 6, 'yellow', 72, 27),
(21, 7, 'red', 36, 28),
(21, 12, 'yellow', 38, 29),
(21, 12, 'yellow', 40, 30),
(22, 4, 'yellow', 6, 31),
(22, 6, 'yellow', 7, 32),
(22, 2, 'yellow', 55, 33),
(23, 6, 'yellow', 5, 34),
(24, 5, 'yellow', 5, 35),
(25, 4, 'yellow', 7, 36),
(25, 5, 'yellow', 8, 37),
(25, 13, 'red', 9, 38),
(25, 17, 'red', 17, 39);

-- --------------------------------------------------------

--
-- Table structure for table `foul`
--

CREATE TABLE `foul` (
  `id` int NOT NULL,
  `match_id` int NOT NULL,
  `team_id` int NOT NULL,
  `player_id` int NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
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

--
-- Dumping data for table `goal`
--

INSERT INTO `goal` (`id`, `match_id`, `player_id`, `goal_time`) VALUES
(37, 17, 4, 84),
(38, 17, 1, 86),
(39, 18, 1, 87),
(40, 20, 4, 60),
(41, 20, 5, 62),
(42, 20, 11, 64),
(43, 21, 7, 27),
(44, 21, 10, 30),
(45, 21, 10, 32),
(46, 22, 4, 2),
(47, 22, 1, 3),
(48, 22, 6, 31),
(49, 22, 2, 48),
(50, 22, 9, 50),
(51, 22, 7, 52),
(52, 22, 8, 53),
(53, 22, 9, 64),
(54, 22, 4, 65),
(55, 22, 4, 68),
(56, 23, 1, 0),
(57, 23, 4, 1),
(58, 23, 5, 1),
(59, 23, 1, 2),
(60, 24, 4, 1),
(61, 24, 4, 2),
(62, 24, 4, 3),
(63, 24, 4, 3),
(64, 24, 13, 8),
(65, 24, 5, 11),
(66, 24, 5, 13),
(67, 25, 1, 1),
(68, 25, 1, 2),
(69, 25, 1, 3),
(70, 25, 1, 4),
(71, 25, 1, 5),
(72, 25, 5, 9),
(73, 25, 14, 13),
(74, 25, 14, 14),
(75, 25, 17, 16),
(76, 25, 9, 19);

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

--
-- Dumping data for table `match`
--

INSERT INTO `match` (`id`, `homeTeam`, `awayTeam`) VALUES
(17, 4, 3),
(18, 3, 5),
(19, 4, 3),
(20, 5, 4),
(21, 4, 5),
(22, 4, 3),
(23, 3, 4),
(24, 4, 4),
(25, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `offset`
--

CREATE TABLE `offset` (
  `match_id` int NOT NULL,
  `offset_team_id` int NOT NULL,
  `offset_time` int NOT NULL,
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offset`
--

INSERT INTO `offset` (`match_id`, `offset_team_id`, `offset_time`, `id`) VALUES
(20, 5, 5702, 1),
(21, 4, 348, 2),
(21, 4, 621, 3),
(21, 4, 813, 4),
(21, 5, 1120, 5),
(21, 5, 1395, 6),
(22, 3, 8, 7),
(22, 4, 19, 8),
(23, 4, 4, 9),
(23, 4, 5, 10),
(24, 4, 6, 11),
(24, 4, 7, 12);

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numberJersey` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` int NOT NULL,
  `status` enum('main','cadangan') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `name`, `numberJersey`, `position`, `team_id`, `status`) VALUES
(1, 'arima', '7', 'CB', 3, 'main'),
(2, 'mina', '6', 'ST', 3, 'main'),
(3, 'minay', '10', 'STT', 3, 'cadangan'),
(4, 'Wakana', '2', 'GK', 4, 'main'),
(5, 'Guji', '5', 'CB', 4, 'main'),
(6, 'Pamiksu', '7', 'ST', 4, 'main'),
(7, 'Bombi', '10', 'CS', 4, 'cadangan'),
(8, 'Kamini', '20', 'SW', 4, 'cadangan'),
(9, 'Kasumi', '45', 'GK', 3, 'cadangan'),
(10, 'kma', '1', 'CB', 5, 'main'),
(11, 'kema', '3', 'GK', 5, 'main'),
(12, 'wqe', '7', 'SW', 5, 'cadangan'),
(13, 'Naufal', '4', 'CB', 4, 'main'),
(14, 'Gilang', '1', 'ST', 4, 'cadangan'),
(15, 'dede', '4', 'SW', 3, 'main'),
(16, 'wati', '23', 'STU', 3, 'main'),
(17, 'Erdi', '90', 'CB', 3, 'main');

-- --------------------------------------------------------

--
-- Table structure for table `switchplayer`
--

CREATE TABLE `switchplayer` (
  `match_id` int NOT NULL,
  `player_out_id` int NOT NULL,
  `player_in_id` int NOT NULL,
  `switch_time` int NOT NULL,
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `switchplayer`
--

INSERT INTO `switchplayer` (`match_id`, `player_out_id`, `player_in_id`, `switch_time`, `id`) VALUES
(21, 7, 4, 40, 1),
(22, 4, 7, 15, 2),
(22, 1, 9, 17, 3),
(22, 6, 8, 43, 4),
(22, 8, 4, 61, 5),
(23, 13, 7, 8, 6),
(23, 17, 3, 10, 7),
(23, 15, 17, 11, 8),
(25, 13, 14, 11, 9),
(25, 17, 9, 19, 10);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `name`, `logo`) VALUES
(3, 'persib', 'logo-team-1685597639346-Persib_Bandung_crest_with_stars.svg.png'),
(4, 'Arema', 'logo-team-1685626375886-arema.png'),
(5, 'Sura', 'logo-team-1685685461532-arema.png'),
(6, 'Persija', 'logo-team-1685821441466-Persib_Bandung_crest_with_stars.svg.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ballpossession`
--
ALTER TABLE `ballpossession`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ballPossession_match_id_fkey` (`match_id`),
  ADD KEY `ballPossession_team_id_fkey` (`team_id`);

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`id`),
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
  ADD PRIMARY KEY (`id`),
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `switchPlayer_match_id_fkey` (`match_id`),
  ADD KEY `switchPlayer_player_out_id_fkey` (`player_out_id`),
  ADD KEY `switchPlayer_player_in_id_fkey` (`player_in_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ballpossession`
--
ALTER TABLE `ballpossession`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `foul`
--
ALTER TABLE `foul`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goal`
--
ALTER TABLE `goal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `injury`
--
ALTER TABLE `injury`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `match`
--
ALTER TABLE `match`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `offset`
--
ALTER TABLE `offset`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `switchplayer`
--
ALTER TABLE `switchplayer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
