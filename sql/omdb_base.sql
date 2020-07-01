-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 01, 2020 at 03:49 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `omdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `personId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--


-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `id` int(11) NOT NULL,
  `personId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `genre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genre`
--


-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `id` int(11) NOT NULL,
  `keyword` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `keywords`
--

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `language` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `language`
--


-- --------------------------------------------------------

--
-- Table structure for table `moviecast`
--

CREATE TABLE `moviecast` (
  `movieId` int(11) NOT NULL,
  `actorId` int(11) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `moviecast`
--

-- --------------------------------------------------------

--
-- Table structure for table `moviecrew`
--

CREATE TABLE `moviecrew` (
  `movieId` int(11) NOT NULL,
  `directorId` int(11) NOT NULL,
  `producerId` int(11) NOT NULL,
  `writerId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `moviecrew`
--


-- --------------------------------------------------------

--
-- Table structure for table `moviegenre`
--

CREATE TABLE `moviegenre` (
  `movieId` int(11) NOT NULL,
  `genreId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `moviegenre`
--


-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `local_name` varchar(50) NOT NULL,
  `english_name` varchar(50) NOT NULL,
  `release_year` char(4) NOT NULL,
  `genreId` int(11) NOT NULL,
  `languageId` int(11) NOT NULL,
  `countryId` int(11) NOT NULL,
  `soundtrackId` int(11) NOT NULL,
  `keywordId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movies`
--

-- --------------------------------------------------------

--
-- Table structure for table `multimedia`
--

CREATE TABLE `multimedia` (
  `movieId` int(11) NOT NULL,
  `poster` blob NOT NULL,
  `imageId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `multimedia`
--

-- --------------------------------------------------------

--
-- Table structure for table `music`
--

CREATE TABLE `music` (
  `id` int(11) NOT NULL,
  `song_title` varchar(50) NOT NULL,
  `composer` varchar(50) NOT NULL,
  `music_producer` varchar(50) NOT NULL,
  `audio_link` varchar(100) NOT NULL,
  `video_link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `music`
--

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

-- --------------------------------------------------------

--
-- Table structure for table `producer`
--

CREATE TABLE `producer` (
  `id` int(11) NOT NULL,
  `personId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `soundtracks`
--

CREATE TABLE `soundtracks` (
  `id` int(11) NOT NULL,
  `musicId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `soundtracks`
--

-- --------------------------------------------------------

--
-- Table structure for table `writer`
--

CREATE TABLE `writer` (
  `id` int(11) NOT NULL,
  `personId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `writer`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personId` (`personId`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personId` (`personId`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moviecast`
--
ALTER TABLE `moviecast`
  ADD KEY `movieId` (`movieId`);

--
-- Indexes for table `moviecrew`
--
ALTER TABLE `moviecrew`
  ADD PRIMARY KEY (`movieId`);

--
-- Indexes for table `moviegenre`
--
ALTER TABLE `moviegenre`
  ADD KEY `movieId` (`movieId`),
  ADD KEY `genreId` (`genreId`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countryId` (`countryId`),
  ADD KEY `languageId` (`languageId`),
  ADD KEY `soundtrackId` (`soundtrackId`);

--
-- Indexes for table `multimedia`
--
ALTER TABLE `multimedia`
  ADD KEY `movieId` (`movieId`),
  ADD KEY `imageId` (`imageId`);

--
-- Indexes for table `music`
--
ALTER TABLE `music`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `producer`
--
ALTER TABLE `producer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soundtracks`
--
ALTER TABLE `soundtracks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `writer`
--
ALTER TABLE `writer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personId` (`personId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actor`
--
ALTER TABLE `actor`
  ADD CONSTRAINT `actor_ibfk_1` FOREIGN KEY (`personId`) REFERENCES `person` (`id`);

--
-- Constraints for table `director`
--
ALTER TABLE `director`
  ADD CONSTRAINT `director_ibfk_1` FOREIGN KEY (`personId`) REFERENCES `person` (`id`);

--
-- Constraints for table `moviecast`
--
ALTER TABLE `moviecast`
  ADD CONSTRAINT `moviecast_ibfk_1` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`);

--
-- Constraints for table `moviecrew`
--
ALTER TABLE `moviecrew`
  ADD CONSTRAINT `moviecrew_ibfk_1` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`);

--
-- Constraints for table `moviegenre`
--
ALTER TABLE `moviegenre`
  ADD CONSTRAINT `moviegenre_ibfk_1` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `moviegenre_ibfk_2` FOREIGN KEY (`genreId`) REFERENCES `genre` (`id`);

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`countryId`) REFERENCES `country` (`id`),
  ADD CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`languageId`) REFERENCES `language` (`id`),
  ADD CONSTRAINT `movies_ibfk_3` FOREIGN KEY (`soundtrackId`) REFERENCES `soundtracks` (`id`);

--
-- Constraints for table `multimedia`
--
ALTER TABLE `multimedia`
  ADD CONSTRAINT `multimedia_ibfk_1` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`);

--
-- Constraints for table `writer`
--
ALTER TABLE `writer`
  ADD CONSTRAINT `writer_ibfk_1` FOREIGN KEY (`personId`) REFERENCES `person` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
