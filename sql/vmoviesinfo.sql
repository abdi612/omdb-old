-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 01, 2020 at 03:41 PM
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
-- Structure for view `vmoviesinfo`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vmoviesinfo`  AS  (select `movies`.`id` AS `id`,`movies`.`local_name` AS `local_name`,`movies`.`english_name` AS `english_name`,`movies`.`release_year` AS `release_year`,`language`.`language` AS `language`,`country`.`country` AS `country`,`leadactor`.`LeadActor` AS `LeadActor`,`leadactress`.`LeadActress` AS `LeadActress`,`movcrew`.`Director` AS `Director`,`movcrew`.`Producer` AS `Producer`,`movcrew`.`Writer` AS `Writer` from (((((`movies` join `language` on(`movies`.`languageId` = `language`.`id`)) join `country` on(`movies`.`countryId` = `country`.`id`)) join (select `moviecast`.`movieId` AS `movieId`,concat(`person`.`first_name`,' ',`person`.`last_name`) AS `LeadActor` from (`moviecast` join `person` on(`moviecast`.`actorId` = `person`.`id`)) where `moviecast`.`actorId` = 1) `leadActor` on(`leadactor`.`movieId` = `movies`.`id`)) join (select `moviecast`.`movieId` AS `movieId`,concat(`person`.`first_name`,' ',`person`.`last_name`) AS `LeadActress` from (`moviecast` join `person` on(`moviecast`.`actorId` = `person`.`id`)) where `moviecast`.`actorId` = 2) `leadActress` on(`leadactor`.`movieId` = `movies`.`id`)) join (select `moviecrew`.`movieId` AS `id`,`dir`.`Director` AS `Director`,`pro`.`Producer` AS `Producer`,`wri`.`Writer` AS `Writer` from (((`moviecrew` join (select `director`.`id` AS `id`,concat(`person`.`first_name`,' ',`person`.`last_name`) AS `Director` from (`director` join `person` on(`director`.`personId` = `person`.`id`))) `dir` on(`moviecrew`.`directorId` = `dir`.`id`)) join (select `producer`.`id` AS `id`,concat(`person`.`first_name`,' ',`person`.`last_name`) AS `Producer` from (`producer` join `person` on(`producer`.`personId` = `person`.`id`))) `pro` on(`moviecrew`.`producerId` = `pro`.`id`)) join (select `writer`.`id` AS `id`,concat(`person`.`first_name`,' ',`person`.`last_name`) AS `Writer` from (`writer` join `person` on(`writer`.`personId` = `person`.`id`))) `wri` on(`moviecrew`.`writerId` = `wri`.`id`))) `movCrew` on(`movies`.`id` = `movcrew`.`id`))) ;

--
-- VIEW `vmoviesinfo`
-- Data: None
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
