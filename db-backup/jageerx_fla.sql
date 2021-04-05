-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 05, 2021 at 04:54 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jageerx_fla`
--

-- --------------------------------------------------------

--
-- Table structure for table `ea_appointments`
--

CREATE TABLE `ea_appointments` (
  `id` int(11) NOT NULL,
  `book_datetime` datetime DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `location` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `hash` text DEFAULT NULL,
  `is_unavailable` tinyint(4) NOT NULL DEFAULT 0,
  `id_users_provider` int(11) DEFAULT NULL,
  `id_users_customer` int(11) DEFAULT NULL,
  `id_services` int(11) DEFAULT NULL,
  `id_google_calendar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_appointments`
--

INSERT INTO `ea_appointments` (`id`, `book_datetime`, `start_datetime`, `end_datetime`, `location`, `notes`, `hash`, `is_unavailable`, `id_users_provider`, `id_users_customer`, `id_services`, `id_google_calendar`) VALUES
(56, '2021-02-13 03:55:26', '2021-02-13 16:00:00', '2021-02-13 17:00:00', NULL, '', 'd7a593dc412c4db44e448bfa91f996ca', 0, 11, 15, 61, NULL),
(57, '2021-02-13 04:39:38', '2021-02-15 09:00:00', '2021-02-15 10:00:00', NULL, '', '516712a19a36426f9f4b05b3b2c8e04b', 0, 4, 16, 49, NULL),
(58, '2021-02-13 04:41:21', '2021-02-15 10:00:00', '2021-02-15 11:00:00', NULL, '', '541cd90dcabd8ccda106eefa04f583bf', 0, 4, 17, 49, NULL),
(59, '2021-02-13 04:49:02', '2021-02-15 11:00:00', '2021-02-15 12:00:00', NULL, '', 'cb95e67f85a3de3dfcca56adaf4cea17', 0, 4, 16, 49, NULL),
(60, '2021-02-14 13:50:52', '2021-02-15 12:00:00', '2021-02-15 13:00:00', NULL, '', 'cdd2b2c1d23a5a43acc6f04e920dba34', 0, 4, 16, 129, NULL),
(61, '2021-02-14 13:54:07', '2021-02-15 13:00:00', '2021-02-15 14:00:00', NULL, '', '1525bb0ae835f17d85e4d0908e9e51e7', 0, 4, 15, 129, NULL),
(62, '2021-02-14 14:02:50', '2021-02-15 14:00:00', '2021-02-15 15:00:00', NULL, '', '251f031a5b945051c5e1652459193863', 0, 4, 16, 161, NULL),
(63, '2021-02-14 14:04:36', '2021-02-15 15:00:00', '2021-02-15 16:00:00', NULL, '', '069c71eb7db1cff809479c4c19c8633f', 0, 4, 16, 90, NULL),
(64, '2021-02-14 14:06:30', '2021-02-15 16:00:00', '2021-02-15 17:00:00', NULL, '', '11e07cfb2102d4420a6d38f757dfc22e', 0, 4, 16, 49, NULL),
(65, '2021-02-17 09:19:58', '2021-02-18 09:00:00', '2021-02-18 10:00:00', NULL, '', '74680c0dfa0c10ba8cdd5f90954859f4', 0, 4, 16, 152, NULL),
(66, '2021-02-17 10:25:02', '2021-02-18 11:00:00', '2021-02-18 12:00:00', NULL, '', '2792d8d59b95a7f069bf3c95bbb082f0', 0, 4, 15, 129, NULL),
(67, '2021-02-17 10:31:17', '2021-02-18 10:00:00', '2021-02-18 11:00:00', NULL, '', '3b3fb80d16cab429b45a81faa49c42fb', 0, 4, 15, 47, NULL),
(68, '2021-02-17 10:43:02', '2021-02-18 12:00:00', '2021-02-18 13:00:00', NULL, '', 'ce1fb785ba7d24f2d4e46631e8d2a531', 0, 4, 17, 152, NULL),
(69, '2021-02-26 11:02:47', '2021-03-01 09:00:00', '2021-03-01 10:00:00', NULL, '', 'dc7a640b2e9563a800a3a631332496d2', 0, 4, 15, 90, NULL),
(70, '2021-03-12 13:40:47', '2021-03-15 09:00:00', '2021-03-15 10:00:00', NULL, '', '8b701288241976bc534c7a1d183e62b8', 0, 9, 16, 53, NULL),
(71, '2021-03-12 13:42:33', '2021-03-13 09:00:00', '2021-03-13 10:00:00', NULL, '', '11d6a1e6f4663f1925c5acee5dfc63b2', 0, 11, 16, 64, NULL),
(72, '2021-03-12 14:14:32', '2021-03-15 09:00:00', '2021-03-15 10:00:00', NULL, '', '7ffbc7e3910c31183e415a354d0f4fd7', 0, 4, 16, 155, NULL),
(73, '2021-03-12 14:22:38', '2021-03-15 10:00:00', '2021-03-15 11:00:00', NULL, '', 'c84b796a0d8d90b6539eb82f8b296558', 0, 9, 16, 53, NULL),
(74, '2021-03-12 18:36:24', '2021-03-15 10:00:00', '2021-03-15 11:00:00', NULL, '', '6c7703da0b2bb6a9e9ffe57546027776', 0, 4, 16, 152, NULL),
(75, '2021-03-12 20:56:12', '2021-03-15 11:00:00', '2021-03-15 12:00:00', NULL, '', 'bfba35bf5f1ca83afdb4c7993996e18a', 0, 4, 16, 155, NULL),
(76, '2021-03-13 09:59:56', '2021-03-15 12:00:00', '2021-03-15 13:00:00', NULL, '', '7a1c2d1272eb9ebc42b8275ee82c8b80', 0, 4, 16, 155, NULL),
(77, '2021-03-13 11:25:13', '2021-03-15 13:00:00', '2021-03-15 14:00:00', NULL, 'There is no need ', 'ea7165bdf17ba535c1dc45652fd88eee', 0, 4, 18, 155, NULL),
(78, '2021-03-13 11:27:45', '2021-03-15 14:00:00', '2021-03-15 15:00:00', NULL, '', 'bfe6d13708ac570e01299d019de246f2', 0, 4, 19, 155, NULL),
(79, '2021-03-13 11:30:16', '2021-03-15 15:00:00', '2021-03-15 16:00:00', NULL, '', '2c171b9ca2a39ba33ba0e661d6d6b2bf', 0, 4, 16, 155, NULL),
(88, '2021-04-05 09:38:27', '2021-04-02 15:15:00', '2021-04-02 16:15:00', NULL, '', NULL, 1, 20, NULL, NULL, NULL),
(89, '2021-04-05 09:42:00', '2021-04-05 13:45:00', '2021-04-05 15:45:00', NULL, '', NULL, 1, 20, NULL, NULL, NULL),
(90, '2021-04-05 10:32:56', '2021-04-06 13:45:00', '2021-04-06 14:45:00', NULL, '', NULL, 1, 20, NULL, NULL, NULL),
(92, '2021-04-05 14:18:16', '2021-04-08 17:30:00', '2021-04-08 18:30:00', NULL, '', NULL, 1, 20, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_consents`
--

CREATE TABLE `ea_consents` (
  `id` int(11) NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `first_name` varchar(256) DEFAULT NULL,
  `last_name` varchar(256) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `ip` varchar(256) DEFAULT NULL,
  `type` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_migrations`
--

CREATE TABLE `ea_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_migrations`
--

INSERT INTO `ea_migrations` (`version`) VALUES
(21);

-- --------------------------------------------------------

--
-- Table structure for table `ea_payments`
--

CREATE TABLE `ea_payments` (
  `payment_id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `time_slot` datetime DEFAULT NULL,
  `currency_code` varchar(100) DEFAULT NULL,
  `payment_status` varchar(100) DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ea_payments`
--

INSERT INTO `ea_payments` (`payment_id`, `provider_id`, `service_id`, `time_slot`, `currency_code`, `payment_status`, `total_amount`, `customer_id`, `transaction_id`) VALUES
(1, NULL, NULL, NULL, 'USD', 'Completed', 50, NULL, '8'),
(2, NULL, NULL, NULL, 'USD', 'Completed', 50, NULL, '0'),
(3, NULL, NULL, NULL, NULL, 'Completed', NULL, NULL, NULL),
(4, 4, 49, '2021-02-15 11:00:00', 'GBP', 'Completed', 100, NULL, '2'),
(5, 11, 64, '2021-03-13 09:00:00', 'USD', 'Completed', 50, NULL, '92W642998T765543A'),
(6, 9, 53, '2021-03-15 10:00:00', 'USD', 'Completed', 20, NULL, '6LE26833BA803853B'),
(7, 4, 152, '2021-03-15 10:00:00', 'USD', 'Completed', 120, NULL, '9M260727YP7772534'),
(8, 4, 155, '2021-03-15 11:00:00', 'USD', 'Completed', 50, NULL, '14V63120RL037594L'),
(9, 4, 155, '2021-03-15 12:00:00', 'USD', 'Completed', 50, NULL, '3CX00635KR0085639'),
(10, 4, 155, '2021-03-15 14:00:00', 'USD', 'Completed', 50, NULL, '0MA11985G00627918'),
(11, 4, 155, '2021-03-15 15:00:00', 'USD', 'Completed', 50, NULL, '51122474AA160801J'),
(12, 20, 47, '2021-03-30 09:00:00', 'USD', 'Completed', 60, NULL, '10T98639513491426');

-- --------------------------------------------------------

--
-- Table structure for table `ea_pending_changes`
--

CREATE TABLE `ea_pending_changes` (
  `id` int(11) NOT NULL,
  `book_datetime` datetime DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `location` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `hash` text DEFAULT NULL,
  `is_unavailable` tinyint(4) NOT NULL DEFAULT 0,
  `id_users_provider` int(11) DEFAULT NULL,
  `id_users_customer` int(11) DEFAULT NULL,
  `id_services` int(11) DEFAULT NULL,
  `id_google_calendar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_roles`
--

CREATE TABLE `ea_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `slug` varchar(256) DEFAULT NULL,
  `is_admin` tinyint(4) DEFAULT NULL,
  `appointments` int(11) DEFAULT NULL,
  `customers` int(11) DEFAULT NULL,
  `services` int(11) DEFAULT NULL,
  `users` int(11) DEFAULT NULL,
  `system_settings` int(11) DEFAULT NULL,
  `user_settings` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_roles`
--

INSERT INTO `ea_roles` (`id`, `name`, `slug`, `is_admin`, `appointments`, `customers`, `services`, `users`, `system_settings`, `user_settings`) VALUES
(1, 'Administrator', 'admin', 1, 15, 15, 15, 15, 15, 15),
(2, 'Provider', 'provider', 0, 15, 15, 0, 0, 0, 15),
(3, 'Customer', 'customer', 0, 0, 0, 0, 0, 0, 0),
(4, 'Secretary', 'secretary', 0, 15, 15, 0, 0, 0, 15);

-- --------------------------------------------------------

--
-- Table structure for table `ea_secretaries_providers`
--

CREATE TABLE `ea_secretaries_providers` (
  `id_users_secretary` int(11) NOT NULL,
  `id_users_provider` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_services`
--

CREATE TABLE `ea_services` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `currency` varchar(32) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `availabilities_type` varchar(32) DEFAULT 'flexible',
  `attendants_number` int(11) DEFAULT 1,
  `id_service_categories` int(11) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `board` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_services`
--

INSERT INTO `ea_services` (`id`, `name`, `duration`, `price`, `currency`, `description`, `location`, `availabilities_type`, `attendants_number`, `id_service_categories`, `level`, `board`) VALUES
(46, 'Accounting - 0452', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(47, 'Accounting (9-1) - 0985 ', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(48, 'Art & Design - 0400', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(49, 'Art & Design (9-1) 0989 ', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(50, 'Biology - 0610', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(51, 'Biology (9-1) - 0970 New', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(52, 'Business Studies - 0450', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(53, 'Business Studies (9-1) - 0986 ', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(54, 'Chemistry - 0620', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(55, 'Chemistry (9-1) - 0971 ', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(56, 'Computer Science - 0478', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(57, 'Computer Science (9-1) - 0984 ', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(58, 'Economics - 0455', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(59, 'Economics (9-1) - 0987 ', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(60, 'English - First Language - 0500', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(61, 'English - First Language (9-1) - 0990 ', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(62, 'English - First Language (US) - 0524', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(63, 'English – Literature (US) – 0427', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(64, 'English – Literature in English – 0475 New', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(65, 'English – Literature in English (9-1) – 0992 New', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(66, 'English as a Second Language (Count-in speaking) - 0511', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(67, 'English as a Second Language (Count-in Speaking) (9-1) - 0991 ', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(68, 'English as a Second Language (Speaking endorsement) - 0510', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(69, 'English Second Language (Speaking Endorsement) (9-1) - 0993 ', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(70, 'Islamiyat - 0493', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(71, 'Mathematics - 0580', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(72, 'Mathematics - Additional - 0606', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(73, 'Mathematics - Additional (US) - 0459', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(74, 'Mathematics - International - 0607', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(75, 'Mathematics (9-1) - 0980 ', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(76, 'Mathematics (US) - 0444', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(77, 'Physics - 0625', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(78, 'Physics (9-1) - 0972', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(79, 'Pakistan Studies - 0448', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(80, 'Science - Combined - 0653', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(81, 'Sciences - Co-ordinated (9-1) - 0973', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(82, 'Sciences - Co-ordinated (Double) - 0654', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(83, 'Urdu as a Second Language - 0539', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 1, 2),
(84, 'Accounting - 7707', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(85, 'Art & Design (BD, MV, MU, PK) - 6090', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(86, 'Biology - 5090', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(87, 'Business Studies - 7115', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(88, 'Chemistry - 5070', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(89, 'Computer Science - 2210', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(90, 'Economics - 2281', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(91, 'English Language - 1123', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(92, 'History - 2147', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(93, 'Islamic Studies – 2068', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(94, 'Islamiyat - 2058', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(95, 'Literature in English - 2010', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(96, 'Mathematics - Additional - 4037', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(97, 'Mathematics D - 4024', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(98, 'Pakistan Studies - 2059', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(99, 'Physics - 5054', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(100, 'Science - Combined - 5129', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(101, 'Urdu - First Language - 3247', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(102, 'Urdu - Second Language - 3248', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 2, 2),
(103, 'Accounting - 9706', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(104, 'Art & Design - 9479 ', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(105, 'Biology - 9700', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(106, 'Business (9609)', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(107, 'Chemistry - 9701', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(108, 'Computer Science - 9608', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(109, 'Computer Science - 9618 ', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(110, 'Economics - 9708', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(111, 'English - Language - 9093', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(112, 'English - Language and Literature (AS Level only) - 8695', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(113, 'English - Literature - 9695', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(114, 'English General Paper (AS Level only) - 8021 ', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(115, 'History - 9389', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(116, 'History - 9489 ', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(117, 'Islamic Studies - 9013', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(118, 'Islamic Studies - 9488 New', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(119, 'Islamic Studies (AS Level only) - 8053', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(120, 'Law - 9084', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(121, 'Mathematics - 9709', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(122, 'Mathematics - Further - 9231', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(123, 'Physics - 9702', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(124, 'Urdu - Language (AS Level only) - 8686', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(125, 'Urdu - Pakistan only (A Level only) - 9686', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(126, 'Urdu (A Level only) - 9676', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 3, 2),
(127, 'Accounting', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(128, 'Art and Design', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(129, 'Biology', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(130, 'Business', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(131, 'Chemistry', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(132, 'Computer Science', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(133, 'Economics', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(134, 'English (as 2nd language)', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(135, 'English Language A', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(136, 'English Language B', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(137, 'English Literature', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(138, 'Further Pure Mathematics', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(139, 'Geography', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(140, 'History', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(141, 'Information and Communication Technology', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(142, 'Islamic Studies', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(143, 'Mathematics A', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(144, 'Mathematics B', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(145, 'Pakistan Studies', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(146, 'Physics', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(147, 'Science (Double Award)', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(148, 'Science (Single Award)', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 4, 1),
(149, 'Art, Design and Media', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 5, 1),
(150, 'Business, Administration and Law', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 5, 1),
(151, 'Computer Science and ICT', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 5, 1),
(152, 'Design and Technology', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 5, 1),
(153, 'Economics', 60, '0.00', '', '', '', 'fixed', 1, NULL, 5, 1),
(154, 'English', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 5, 1),
(155, 'Finance and Accounting', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 5, 1),
(156, 'Geography', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 5, 1),
(157, 'History', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 5, 1),
(158, 'Maths and Statistics', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 5, 1),
(159, 'Science', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 5, 1),
(160, 'Social Sciences', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 5, 1),
(161, 'Accounting', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 6, 1),
(162, 'Biology', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 6, 1),
(163, 'Business', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 6, 1),
(164, 'Business Studies', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 6, 1),
(165, 'Chemistry', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 6, 1),
(166, 'Economics', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 6, 1),
(167, 'English Language', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 6, 1),
(168, 'English Literature', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 6, 1),
(169, 'French', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 6, 1),
(170, 'History', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 6, 1),
(171, 'Information Technology', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 6, 1),
(172, 'Law', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 6, 1),
(173, 'Mathematics', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 6, 1),
(174, 'Physics', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 6, 1),
(175, 'Psychology', 60, '0.00', '$', '', '', 'fixed', 1, NULL, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ea_services_providers`
--

CREATE TABLE `ea_services_providers` (
  `id_users` int(11) NOT NULL,
  `id_services` int(11) NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_services_providers`
--

INSERT INTO `ea_services_providers` (`id_users`, `id_services`, `amount`) VALUES
(4, 46, 545),
(4, 47, 60),
(4, 48, 50),
(4, 49, 100),
(4, 90, 850),
(4, 106, 200),
(4, 107, 500),
(4, 108, 800),
(4, 109, 60),
(4, 110, 80),
(4, 111, 0),
(4, 124, 620),
(4, 125, 250),
(4, 126, 60),
(4, 127, 0),
(4, 129, 700),
(4, 152, 120),
(4, 155, 50),
(4, 161, 50),
(4, 165, 500),
(4, 171, 45),
(4, 172, 60),
(4, 173, 850),
(4, 174, 580),
(4, 175, 250),
(9, 46, 920),
(9, 50, 600),
(9, 51, 20),
(9, 52, 500),
(9, 53, 20),
(11, 60, 10),
(11, 61, 200),
(11, 62, 500),
(11, 63, 60),
(11, 64, 50),
(20, 46, 50),
(20, 47, 60);

-- --------------------------------------------------------

--
-- Table structure for table `ea_service_boards`
--

CREATE TABLE `ea_service_boards` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ea_service_boards`
--

INSERT INTO `ea_service_boards` (`id`, `name`) VALUES
(1, 'Edexcel'),
(2, 'Cambridge ');

-- --------------------------------------------------------

--
-- Table structure for table `ea_service_categories`
--

CREATE TABLE `ea_service_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_service_levels`
--

CREATE TABLE `ea_service_levels` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `board` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ea_service_levels`
--

INSERT INTO `ea_service_levels` (`id`, `name`, `board`) VALUES
(1, 'IGCSE', 2),
(2, 'O Levels', 2),
(3, 'AS/ A Levels', 2),
(4, 'International GCSE', 1),
(5, 'Pearson Edexcel GCSEs', 1),
(6, 'International A Levels', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ea_settings`
--

CREATE TABLE `ea_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(512) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_settings`
--

INSERT INTO `ea_settings` (`id`, `name`, `value`) VALUES
(1, 'company_working_plan', '{\"sunday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]}}'),
(2, 'book_advance_timeout', '720'),
(3, 'google_analytics_code', ''),
(4, 'customer_notifications', '1'),
(5, 'date_format', 'DMY'),
(6, 'require_captcha', '0'),
(7, 'time_format', 'regular'),
(8, 'display_cookie_notice', '0'),
(9, 'cookie_notice_content', 'Cookie notice content.'),
(10, 'display_terms_and_conditions', '0'),
(11, 'terms_and_conditions_content', 'Terms and conditions content.'),
(12, 'display_privacy_policy', '0'),
(13, 'privacy_policy_content', 'Privacy policy content.'),
(14, 'first_weekday', 'sunday'),
(15, 'require_phone_number', '1'),
(16, 'api_token', ''),
(17, 'display_any_provider', '1'),
(18, 'company_name', 'Future Learn School Academy'),
(19, 'company_email', 'info@jageerx.com'),
(20, 'company_link', 'www.jageerx.com');

-- --------------------------------------------------------

--
-- Table structure for table `ea_users`
--

CREATE TABLE `ea_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(256) DEFAULT NULL,
  `last_name` varchar(512) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `mobile_number` varchar(128) DEFAULT NULL,
  `phone_number` varchar(128) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `zip_code` varchar(64) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `timezone` varchar(256) DEFAULT 'UTC',
  `language` varchar(256) DEFAULT 'english',
  `id_roles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_users`
--

INSERT INTO `ea_users` (`id`, `first_name`, `last_name`, `email`, `mobile_number`, `phone_number`, `address`, `city`, `state`, `zip_code`, `notes`, `timezone`, `language`, `id_roles`) VALUES
(1, 'Muhammad', 'Ishfaq', 'ishfaqkhattak9@gmail.com', NULL, '03439481131', NULL, NULL, NULL, NULL, NULL, 'UTC', 'english', 1),
(3, 'James', 'Doe', 'james@example.org', NULL, '+1 (000) 000-0000', NULL, NULL, NULL, NULL, NULL, 'UTC', 'english', 3),
(4, 'Zulfiqar', 'khattak', 'zulfi@gmail.com', '123565', '03439481131', 'Flat # 3G near 502 workshop new lalazar, Rawalpindi', 'Select City', 'Punjab', '46000', '', 'UTC', 'english', 2),
(6, 'Muhammad', 'zulfi', 'ishfaqkhattak9@gmail.comm', NULL, '03439481131', 'House no 247, street no 03, Askari 11 near Qasim Market, RWP', 'Rawalpindi', NULL, '46000', '', 'UTC', 'english', 3),
(7, 'Zulfiqar', 'Khattak', 'mzulfiktk312@gmail.com', NULL, '1234567890', 'House no 247, street no 03, Askari 11 near Qasim Market, RWP, House no 247, street no 03', 'Rawalpindi', NULL, '46000', NULL, 'Asia/Karachi', 'english', 3),
(8, 'Muhammad', 'waqar', 'waqar@cybrone.com', NULL, '03439481131', 'Flat # 3G near 502 workshop new lalazar, Rawalpindi', 'Select City', NULL, '46000', '', 'UTC', 'english', 3),
(9, 'Ali', 'Zaffar', 'ali@gmail.com', '', '1234567899876', '', '', '', '', '', 'UTC', 'english', 2),
(10, 'Fggh', 'Tyu', 'Ishfaqkhattak9@gmail.com', NULL, '03128665566', 'Ygg', 'Ggg', NULL, 'Fgg', NULL, 'Asia/Karachi', 'english', 3),
(11, 'Ahmed', 'Raza', 'ahmedraza@gmail.com', '', '03439481131', 'Flat # 3G near 502 workshop new lalazar, Rawalpindi', 'Select City', 'Punjab', '46000', '', 'UTC', 'english', 2),
(12, 'Muhammad', 'Ishfaq', 'info@jageerx.com', NULL, '0343948113', 'House no 247, street no 03, Askari 11 near Qasim Market, RWP, House no 247, street no 03', 'Rawalpindi', NULL, '46000', NULL, 'Asia/Karachi', 'english', 3),
(13, 'Ejaz', 'Chowdary', 'ejaz.chowdary@magnacartacollege.ac.uk', NULL, '07856448083', '10 Innovation House', 'Oxford', NULL, 'OX4 2JY', NULL, 'Europe/London', 'english', 3),
(14, 'aqib', 'abbas', 'aqibnwl@gmail.com', NULL, '5454545', 'fdsfsd', '', NULL, '', NULL, 'Asia/Karachi', 'english', 3),
(15, 'Muhammad', 'Mudassar', 'mudassarmd@yahoo.com', NULL, '03235203125', '1', 'Rawalpindi', NULL, '4444', '', 'Asia/Karachi', 'english', 3),
(16, 'Muhammad', 'Mudassar', 'mudassarmdmd@gmail.com', NULL, '+923235203125', 'Street 1, Double Road', 'Rawalpindi', NULL, '46000', NULL, 'Asia/Karachi', 'english', 3),
(17, 'huzi', 'Mudassar', 'huzi_@yahoo.com', NULL, '02345678989', 'Pindi', 'Rawalpindi', NULL, '4444', NULL, 'Asia/Karachi', 'english', 3),
(18, 'Just', 'New', 'someemail@gmail.com', NULL, '032523568960', 'Dhok Khabba', 'Rawalpindi', NULL, '4444', NULL, 'Asia/Karachi', 'english', 3),
(19, 'Hey ', 'You', 'email@gmail.com', NULL, '030020050062', 'Some', 'ABC', NULL, '022', NULL, 'Asia/Karachi', 'english', 3),
(20, 'Muhammad', 'Mudassar', 'mudassarmdmd@gmail.com', '1234', '03235203125', 'Double Road', 'Rawalpindi', 'Pakistan', '4446', 'Some Notes', 'UTC', 'english', 2),
(21, 'NewStudent', 'Mudassar', 'student@edu.com', NULL, '+923235203125', 'Street 1, Double Road', 'Rawalpindi', NULL, '46000', NULL, 'Asia/Karachi', 'english', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ea_user_settings`
--

CREATE TABLE `ea_user_settings` (
  `id_users` int(11) NOT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `salt` varchar(512) DEFAULT NULL,
  `working_plan` text DEFAULT NULL,
  `working_plan_exceptions` text DEFAULT NULL,
  `notifications` tinyint(4) DEFAULT NULL,
  `google_sync` tinyint(4) DEFAULT NULL,
  `google_token` text DEFAULT NULL,
  `google_calendar` varchar(128) DEFAULT NULL,
  `sync_past_days` int(11) DEFAULT 30,
  `sync_future_days` int(11) DEFAULT 90,
  `calendar_view` varchar(32) DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_user_settings`
--

INSERT INTO `ea_user_settings` (`id_users`, `username`, `password`, `salt`, `working_plan`, `working_plan_exceptions`, `notifications`, `google_sync`, `google_token`, `google_calendar`, `sync_past_days`, `sync_future_days`, `calendar_view`) VALUES
(1, 'ishfaq2425', '4c7d0b8fddff6e101787597dd9b2e1b755d8a3e5cd884e6ba2f08978886c85a2', 'a2d0eca0b800f90321b1c8b1139dd0a57170bb348943661f8b99c921ec19861c', NULL, NULL, 1, NULL, NULL, NULL, 30, 90, 'default'),
(4, 'zulfi', 'e183079e47b31b33b2c2deafb494c93a051500e1ab1f726aef57a0129c550fe6', '5dd063bda5455d1b17bf39a1ee20d33c256586a6ee1ad9c00ed0867ced688c9c', '{\"sunday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]}}', '[]', 0, NULL, NULL, NULL, 30, 90, 'default'),
(9, 'Alizaffar', '6caea065889d820ec79b30efce73d949d23347624b8a1ecb8543893fdcc4bd9b', '4871973144144d928b899fb58fb9de6b7015595b21d1b2f1845f1b7c709c1be1', '{\"sunday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]}}', '[]', 1, NULL, NULL, NULL, 30, 90, 'default'),
(11, 'ahmedraza', 'f4a8c833d98cc083b7ee257efb427a86e4be669b806d7b8cd379788ec568faaa', '7f932442686e208a82cc878788f234e9b8ef30db251308675e759c89f50d33c9', '{\"sunday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]}}', '[]', 1, NULL, NULL, NULL, 30, 90, 'default'),
(20, 'mudassarmd', '5e3f149cac43e337b2aedf0cb3cb32252ebd28fd097f3d5b16f8bdb0b582648a', 'c9a8d223c9c56a31a3d8ef9d133ff14f37dba41d98bd53c639f013270672431c', '{\"sunday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]}}', '[]', 1, NULL, NULL, NULL, 30, 90, 'default');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_users_provider` (`id_users_provider`),
  ADD KEY `id_users_customer` (`id_users_customer`),
  ADD KEY `id_services` (`id_services`);

--
-- Indexes for table `ea_consents`
--
ALTER TABLE `ea_consents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_payments`
--
ALTER TABLE `ea_payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `ea_pending_changes`
--
ALTER TABLE `ea_pending_changes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_users_provider` (`id_users_provider`),
  ADD KEY `id_users_customer` (`id_users_customer`),
  ADD KEY `id_services` (`id_services`);

--
-- Indexes for table `ea_roles`
--
ALTER TABLE `ea_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_secretaries_providers`
--
ALTER TABLE `ea_secretaries_providers`
  ADD PRIMARY KEY (`id_users_secretary`,`id_users_provider`),
  ADD KEY `secretaries_users_provider` (`id_users_provider`);

--
-- Indexes for table `ea_services`
--
ALTER TABLE `ea_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_service_categories` (`id_service_categories`);

--
-- Indexes for table `ea_services_providers`
--
ALTER TABLE `ea_services_providers`
  ADD PRIMARY KEY (`id_users`,`id_services`),
  ADD KEY `services_providers_services` (`id_services`);

--
-- Indexes for table `ea_service_boards`
--
ALTER TABLE `ea_service_boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_service_categories`
--
ALTER TABLE `ea_service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_service_levels`
--
ALTER TABLE `ea_service_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_settings`
--
ALTER TABLE `ea_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_users`
--
ALTER TABLE `ea_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_roles` (`id_roles`);

--
-- Indexes for table `ea_user_settings`
--
ALTER TABLE `ea_user_settings`
  ADD PRIMARY KEY (`id_users`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `ea_consents`
--
ALTER TABLE `ea_consents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ea_payments`
--
ALTER TABLE `ea_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ea_pending_changes`
--
ALTER TABLE `ea_pending_changes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `ea_roles`
--
ALTER TABLE `ea_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ea_services`
--
ALTER TABLE `ea_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `ea_service_boards`
--
ALTER TABLE `ea_service_boards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ea_service_categories`
--
ALTER TABLE `ea_service_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ea_service_levels`
--
ALTER TABLE `ea_service_levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ea_settings`
--
ALTER TABLE `ea_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ea_users`
--
ALTER TABLE `ea_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  ADD CONSTRAINT `appointments_services` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_customer` FOREIGN KEY (`id_users_customer`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_provider` FOREIGN KEY (`id_users_provider`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_secretaries_providers`
--
ALTER TABLE `ea_secretaries_providers`
  ADD CONSTRAINT `secretaries_users_provider` FOREIGN KEY (`id_users_provider`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `secretaries_users_secretary` FOREIGN KEY (`id_users_secretary`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_services`
--
ALTER TABLE `ea_services`
  ADD CONSTRAINT `services_service_categories` FOREIGN KEY (`id_service_categories`) REFERENCES `ea_service_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ea_services_providers`
--
ALTER TABLE `ea_services_providers`
  ADD CONSTRAINT `services_providers_services` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `services_providers_users_provider` FOREIGN KEY (`id_users`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_users`
--
ALTER TABLE `ea_users`
  ADD CONSTRAINT `users_roles` FOREIGN KEY (`id_roles`) REFERENCES `ea_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_user_settings`
--
ALTER TABLE `ea_user_settings`
  ADD CONSTRAINT `user_settings_users` FOREIGN KEY (`id_users`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
