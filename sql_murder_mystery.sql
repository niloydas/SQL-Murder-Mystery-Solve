-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2026 at 08:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql_murder_mystery`
--

-- --------------------------------------------------------

--
-- Table structure for table `crime_scene_report`
--

CREATE TABLE `crime_scene_report` (
  `date` int(11) DEFAULT NULL,
  `type` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `city` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers_license`
--

CREATE TABLE `drivers_license` (
  `id` int(11) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `eye_color` text DEFAULT NULL,
  `hair_color` text DEFAULT NULL,
  `gender` text DEFAULT NULL,
  `plate_number` text DEFAULT NULL,
  `car_make` text DEFAULT NULL,
  `car_model` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facebook_event_checkin`
--

CREATE TABLE `facebook_event_checkin` (
  `person_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `event_name` text DEFAULT NULL,
  `date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `get_fit_now_check_in`
--

CREATE TABLE `get_fit_now_check_in` (
  `membership_id` varchar(20) DEFAULT NULL,
  `check_in_date` int(11) DEFAULT NULL,
  `check_in_time` int(11) DEFAULT NULL,
  `check_out_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `get_fit_now_member`
--

CREATE TABLE `get_fit_now_member` (
  `id` varchar(20) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `membership_start_date` int(11) DEFAULT NULL,
  `membership_status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `ssn` char(20) NOT NULL,
  `annual_income` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interview`
--

CREATE TABLE `interview` (
  `person_id` int(11) DEFAULT NULL,
  `transcript` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `license_id` int(11) DEFAULT NULL,
  `address_number` int(11) DEFAULT NULL,
  `address_street_name` text DEFAULT NULL,
  `ssn` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `solution`
--

CREATE TABLE `solution` (
  `user` int(11) DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drivers_license`
--
ALTER TABLE `drivers_license`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facebook_event_checkin`
--
ALTER TABLE `facebook_event_checkin`
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `get_fit_now_check_in`
--
ALTER TABLE `get_fit_now_check_in`
  ADD KEY `membership_id` (`membership_id`);

--
-- Indexes for table `get_fit_now_member`
--
ALTER TABLE `get_fit_now_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`ssn`);

--
-- Indexes for table `interview`
--
ALTER TABLE `interview`
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`),
  ADD KEY `license_id` (`license_id`),
  ADD KEY `ssn` (`ssn`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `facebook_event_checkin`
--
ALTER TABLE `facebook_event_checkin`
  ADD CONSTRAINT `facebook_event_checkin_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);

--
-- Constraints for table `get_fit_now_check_in`
--
ALTER TABLE `get_fit_now_check_in`
  ADD CONSTRAINT `get_fit_now_check_in_ibfk_1` FOREIGN KEY (`membership_id`) REFERENCES `get_fit_now_member` (`id`);

--
-- Constraints for table `get_fit_now_member`
--
ALTER TABLE `get_fit_now_member`
  ADD CONSTRAINT `get_fit_now_member_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);

--
-- Constraints for table `interview`
--
ALTER TABLE `interview`
  ADD CONSTRAINT `interview_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`license_id`) REFERENCES `drivers_license` (`id`),
  ADD CONSTRAINT `person_ibfk_2` FOREIGN KEY (`ssn`) REFERENCES `income` (`ssn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
