-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2020 at 03:33 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `snaily-cad`
--

-- --------------------------------------------------------

--
-- Table structure for table `911calls`
--

CREATE TABLE `911calls` (
  `id` varchar(255) NOT NULL,
  `description` varchar(1800) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `assigned_unit` text NOT NULL,
  `hidden` varchar(255) NOT NULL,
  `pos` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `action_logs`
--

CREATE TABLE `action_logs` (
  `id` varchar(255) NOT NULL,
  `action_title` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `arrest_reports`
--

CREATE TABLE `arrest_reports` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `citizen_id` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `charges` text NOT NULL,
  `officer_name` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `postal` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bleets`
--

CREATE TABLE `bleets` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `uploaded_at` varchar(255) NOT NULL,
  `image_id` text NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bolos`
--

CREATE TABLE `bolos` (
  `id` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `plate` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `officer_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `businesses`
--

CREATE TABLE `businesses` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `citizen_id` varchar(255) NOT NULL,
  `whitelisted` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cad_info`
--

CREATE TABLE `cad_info` (
  `id` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `cad_name` varchar(255) NOT NULL,
  `AOP` varchar(255) NOT NULL,
  `tow_whitelisted` varchar(255) NOT NULL,
  `whitelisted` varchar(255) NOT NULL,
  `webhook_url` text NOT NULL,
  `signal_100` varchar(255) NOT NULL,
  `live_map_url` text NOT NULL,
  `features` text NOT NULL,
  `plate_length` int(255) NOT NULL,
  `registration_code` varchar(255) NOT NULL,
  `steam_api_key` varchar(255) NOT NULL,
  `show_aop` varchar(255) NOT NULL DEFAULT '1',
  `max_citizens` varchar(255) NOT NULL DEFAULT 'unlimited'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `seo_tags`
--

CREATE TABLE `seo_tags` (
    `title` varchar(255) DEFAULT 'SnailyCAD',
    `description` varchar(255) DEFAULT 'A free, fast, simple and secure open source CAD/MDT',
    `site_name` varchar(255) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `call_events`
--

CREATE TABLE `call_events` (
  `id` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `call_id` varchar(255) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `call_types`
--

CREATE TABLE `call_types` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `defaults` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `cad_licenses`
--

CREATE TABLE `cad_licenses` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `defaults` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `citizens`
--

CREATE TABLE `citizens` (
  `id` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `birth` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `ethnicity` varchar(255) NOT NULL,
  `hair_color` varchar(255) NOT NULL,
  `eye_color` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `height` varchar(255) NOT NULL,
  `weight` varchar(255) NOT NULL,
  `dmv` varchar(255) NOT NULL,
  `fire_license` varchar(255) NOT NULL,
  `pilot_license` varchar(255) NOT NULL,
  `ccw` varchar(255) NOT NULL,
  `business` varchar(255) NOT NULL,
  `business_id` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL,
  `vehicle_reg` varchar(255) NOT NULL,
  `posts` varchar(255) NOT NULL,
  `image_id` varchar(255) NOT NULL,
  `b_status` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `phone_nr` varchar(255) NOT NULL,
  `dead` varchar(255) NOT NULL,
  `dead_on` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `court_requests`
--

CREATE TABLE `court_requests` (
  `id` varchar(255) NOT NULL,
  `warrants` varchar(2500) NOT NULL,
  `arrest_reports` varchar(2500) NOT NULL,
  `tickets` varchar(2500) NOT NULL,
  `citizen_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `defaults` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ems-fd`
--

CREATE TABLE `ems-fd` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `status2` varchar(255) NOT NULL,
  `callsign` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ethnicities`
--

CREATE TABLE `ethnicities` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `defaults` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `defaults` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `legal_statuses`
--

CREATE TABLE `legal_statuses` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `defaults` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `leo_tickets`
--

CREATE TABLE `leo_tickets` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `citizen_id` varchar(255) NOT NULL,
  `violations` text NOT NULL,
  `officer_name` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `postal` varchar(255) NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `leo_incidents`
--

CREATE TABLE `leo_incidents` (
    `id` varchar(255) NOT NULL,
    `case_number` int(11) NOT NULL,
    `officer_dept` varchar(255) NOT NULL,
    `officer_name` varchar(255) NOT NULL,
    `full_date` text NOT NULL,
    `involved_officers` text NOT NULL,
    `location` varchar(255) NOT NULL,
    `officer_id` varchar(255) NOT NULL,
    `narrative` text NOT NULL,
    `injuries` varchar(255) NOT NULL,
    `arrests_made` varchar(255) NOT NULL,
    `firearms_involved` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medical_records`
--

CREATE TABLE `medical_records` (
  `id` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `short_info` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `citizen_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `mugshots`
--

CREATE TABLE `mugshots` (
    `id` varchar(255) NOT NULL,
    `citizen_id` varchar(255) NOT NULL,
    `data` text NOT NULL,
    `officer_name` varchar(255) NOT NULL,
    `full_date` text NOT NULL,
    `officer_id` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `href` text NOT NULL,
  `user_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `officers`
--

CREATE TABLE `officers` (
  `id` varchar(255) NOT NULL,
  `officer_name` varchar(255) NOT NULL,
  `officer_dept` varchar(255) NOT NULL,
  `callsign` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `status2` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `officer_logs` (
  `id` varchar(255) NOT NULL,
  `officer_id` varchar(255) NOT NULL,
  `started_at` varchar(255) NOT NULL,
  `ended_at` varchar(255) NOT NULL,
  `active` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` varchar(255) NOT NULL,
  `business_id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `citizen_id` varchar(255) NOT NULL,
  `uploaded_at` varchar(255) NOT NULL,
  `uploaded_by` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `registered_cars`
--

CREATE TABLE `registered_cars` (
  `id` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `citizen_id` varchar(255) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `vin_number` varchar(255) NOT NULL,
  `in_status` varchar(255) NOT NULL,
  `plate` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `business_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `registered_weapons`
--

CREATE TABLE `registered_weapons` (
  `id` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `citizen_id` varchar(255) NOT NULL,
  `weapon` varchar(255) NOT NULL,
  `serial_number` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tow_calls`
--

CREATE TABLE `tow_calls` (
  `id` varchar(255) NOT NULL,
  `description` varchar(1800) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `taxi_calls`
--

CREATE TABLE `taxi_calls` (
  `id` varchar(255) NOT NULL,
  `description` varchar(1800) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `truck_logs`
--

CREATE TABLE `truck_logs` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `co_driver` varchar(255) NOT NULL,
  `start_time` varchar(255) NOT NULL,
  `plate` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL,
  `edit_passwords` varchar(255) NOT NULL,
  `leo` varchar(255) NOT NULL,
  `supervisor` varchar(255) NOT NULL,
  `ems_fd` varchar(255) NOT NULL,
  `dispatch` varchar(255) NOT NULL,
  `tow` varchar(255) NOT NULL,
  `banned` varchar(255) NOT NULL,
  `ban_reason` varchar(255) NOT NULL,
  `whitelist_status` varchar(255) NOT NULL,
  `avatar_url` varchar(255) NOT NULL,
  `steam_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `defaults` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `name`, `defaults`) VALUES
(1, 'Albany Alpha', '1'),
(2, 'Albany Buccaneer', '1'),
(3, 'Albany Buccaneer Custom', '1'),
(4, 'Albany Cavalcade', '1'),
(5, 'Albany Cavalcade FXT', '1'),
(6, 'Albany Emperor', '1'),
(7, 'Albany Esperanto', '1'),
(8, 'Albany Franken Stange', '1'),
(9, 'Albany Hermes', '1'),
(10, 'Albany Lurcher', '1'),
(11, 'Albany Manana', '1'),
(12, 'Albany Police Roadcruiser', '1'),
(13, 'Albany Presidente', '1'),
(14, 'Albany Primo', '1'),
(15, 'Albany Primo Custom', '1'),
(16, 'Albany Taxi Cab', '1'),
(17, 'Albany Romero', '1'),
(18, 'Albany Roosevelt', '1'),
(19, 'Albany Roosevelt Valor', '1'),
(20, 'Albany Stretch', '1'),
(21, 'Albany Virgo', '1'),
(22, 'Albany Washington', '1'),
(23, 'Annis Elergy Retro Custom', '1'),
(24, 'Annis Elergy RH8', '1'),
(25, 'Annis RE7B', '1'),
(26, 'Annis Savestra', '1'),
(27, 'Benefactor Dubsta', '1'),
(28, 'Benefactor Dubsta 6X6', '1'),
(29, 'Benefactor Feltzer', '1'),
(30, 'Benefactor Glendale', '1'),
(31, 'Benefactor Panto', '1'),
(32, 'Benefactor Schafter', '1'),
(33, 'Benefactor Schafter LWB', '1'),
(34, 'Benefactor Schafter LWB Armored', '1'),
(35, 'Benefactor Schafter V12', '1'),
(36, 'Benefactor Schafter V12 Armored', '1'),
(37, 'Benefactor Schwartzer', '1'),
(38, 'Benefactor Serrano', '1'),
(39, 'Benefactor Stirling GT', '1'),
(40, 'Benefactor Streiter', '1'),
(41, 'Benefactor Surano', '1'),
(42, 'Benefactor Terrorbyte', '1'),
(43, 'Benefactor Turreted Limo', '1'),
(44, 'Benefactor XLS', '1'),
(45, 'Benefactor XLS Armored', '1'),
(46, 'BF Bifta', '1'),
(47, 'BF Dune Buggy', '1'),
(48, 'BF Dune FAV', '1'),
(49, 'BF Injection', '1'),
(50, 'BF Ramp Buggy', '1'),
(51, 'BF Raptor', '1'),
(52, 'BF Space Docker', '1'),
(53, 'BF Surfer', '1'),
(54, 'Bollokan Prairie', '1'),
(55, 'Bravado	Banshee', '1'),
(56, 'Bravado	Banshee Topless', '1'),
(57, 'Bravado	Banshee 900R', '1'),
(58, 'Bravado	Bison', '1'),
(59, 'Bravado	Buffalo', '1'),
(60, 'Bravado	Buffalo S', '1'),
(61, 'Bravado	Duneloader', '1'),
(62, 'Bravado	FIB Buffalo', '1'),
(63, 'Bravado	Gauntlet', '1'),
(64, 'Bravado	Gresley', '1'),
(65, 'Bravado	HalfTrack', '1'),
(66, 'Bravado	Paradise', '1'),
(67, 'Bravado	Police Cruiser Buffalo', '1'),
(68, 'Bravado	RatLoader', '1'),
(69, 'Bravado	RatTruck', '1'),
(70, 'Bravado	Redwood Gauntlet', '1'),
(71, 'Bravado	Rumpo', '1'),
(72, 'Bravado	Rumpo Custom', '1'),
(73, 'Bravado	Sprunk Buffalo', '1'),
(74, 'Bravado	Verlierer', '1'),
(75, 'Bravado	Youga', '1'),
(76, 'Bravado	Youga Classic', '1'),
(77, 'Brute Airport Bus', '1'),
(78, 'Brute Ambulance', '1'),
(79, 'Brute Boxville', '1'),
(80, 'Brute Boxville Armored', '1'),
(81, 'Brute Bus', '1'),
(82, 'Brute Camper', '1'),
(83, 'Brute Dashound', '1'),
(84, 'Brute Police Riot', '1'),
(85, 'Brute Pony', '1'),
(86, 'Brute Rental Shuttle Bus	', '1'),
(87, 'Brute Stockade', '1'),
(88, 'Brute Taco Van', '1'),
(89, 'Brute Tipper', '1'),
(90, 'Brute Tipper Classic', '1'),
(91, 'Brute Tour Bus', '1'),
(92, 'Brute Utility Truck', '1'),
(93, 'Brute Cherry Picker Utility Truck', '1'),
(94, 'Canis Bohdi', '1'),
(95, 'Canis Crusader', '1'),
(96, 'Canis Kalahari', '1'),
(97, 'Canis Kalahari Topless', '1'),
(98, 'Canis Kamacho', '1'),
(99, 'Canis Mesa', '1'),
(100, 'Canis Merryweather Mesa', '1'),
(101, 'Canis Seminole', '1'),
(102, 'Chariot Romero Hearse', '1'),
(103, 'Cheval Fugitive', '1'),
(104, 'Cheval Marshall', '1'),
(105, 'Cheval Picador', '1'),
(106, 'Cheval Surge', '1'),
(107, 'Cheval Taipan', '1'),
(108, 'Coil Brawler', '1'),
(109, 'Coil Cyclone', '1'),
(110, 'Coil Raiden', '1'),
(111, 'Coil Rocket Voltic', '1'),
(112, 'Coil Voltic', '1'),
(113, 'Coil Topless Voltic', '1'),
(114, 'Declasse Asea', '1'),
(115, 'Declasse Burger Shot Stallion', '1'),
(116, 'Declasse Burrito', '1'),
(117, 'Declasse Drift Tampa', '1'),
(118, 'Declasse FIB Granger', '1'),
(119, 'Declasse LMC Biker Burrito', '1'),
(120, 'Declasse Granger', '1'),
(121, 'Declasse Hotring Sabre', '1'),
(122, 'Declasse Lifegaurd Granger', '1'),
(123, 'Declasse Mamba', '1'),
(124, 'Declasse Moonbeam', '1'),
(125, 'Declasse Moonbeam Custom', '1'),
(126, 'Declasse Park Ranger Granger', '1'),
(127, 'Declasse Police Rancher', '1'),
(128, 'Declasse Police Transport Van', '1'),
(129, 'Declasse Premier', '1'),
(130, 'Declasse Rancher XL', '1'),
(131, 'Declasse Rhapsody', '1'),
(132, 'Declasse Sabre Turbo', '1'),
(133, 'Declasse Sabre Turbo Custom', '1'),
(134, 'Declasse Sheriff Granger', '1'),
(135, 'Declasse Stallion', '1'),
(136, 'Declasse Tampa', '1'),
(137, 'Declasse Tornado', '1'),
(138, 'Declasse Tornado Convertible', '1'),
(139, 'Declasse Tornado Custom', '1'),
(140, 'Declasse Tornado Rat Rod', '1'),
(141, 'Declasse Vigero', '1'),
(142, 'Declasse Voodoo', '1'),
(143, 'Declasse Voodoo Custom', '1'),
(144, 'Declasse Weaponized Tampa', '1'),
(145, 'Declasse Yosemite', '1'),
(146, 'Dewbauchee Exemplar', '1'),
(147, 'Dewbauchee JB 700', '1'),
(148, 'Dewbauchee Massacro', '1'),
(149, 'Dewbauchee Massacro RaceCar', '1'),
(150, 'Dewbauchee Rapid GT', '1'),
(151, 'Dewbauchee Rapid GT Classic', '1'),
(152, 'Dewbauchee Rapid GT Sports', '1'),
(153, 'Dewbauchee Seven - 70', '1'),
(154, 'Dewbauchee Specter', '1'),
(155, 'Dewbauchee Specter Custom', '1'),
(156, 'Dewbauchee Vagner', '1'),
(157, 'Dinka Akuma', '1'),
(158, 'Dinka Blista', '1'),
(159, 'Dinka Blista Compact', '1'),
(160, 'Dinka Double - T', '1'),
(161, 'Dinka Enduro', '1'),
(162, 'Dinka Go - Go Monkey Blista', '1'),
(163, 'Dinka Jester', '1'),
(164, 'Dinka Jester RaceCar', '1'),
(165, 'Dinka Jester Classic', '1'),
(166, 'Dinka Thrust', '1'),
(167, 'Dinka Vindicator', '1'),
(168, 'Dundreary Landstalker', '1'),
(169, 'Dundreary Regina', '1'),
(170, 'Dundreary Stretch', '1'),
(171, 'Dundreary Virgo Classic', '1'),
(172, 'Dundreary Virgo Classic Custom', '1'),
(173, 'Emperor	ETR1', '1'),
(174, 'Emperor	Habanero', '1'),
(175, 'Enus Cognoscenti', '1'),
(176, 'Enus Cognoscenti Armored', '1'),
(177, 'Enus Cognoscenti 55', '1'),
(178, 'Enus Cognoscenti 55 Armored', '1'),
(179, 'Enus Cognoscenti Cabrio', '1'),
(180, 'Enus Huntley S', '1'),
(181, 'Enus Stafford', '1'),
(182, 'Enus Super Diamond', '1'),
(183, 'Enus Windsor', '1'),
(184, 'Enus Windsor Drop', '1'),
(185, 'Fathom	FQ 2', '1'),
(186, 'Gallivanter Baller Classic', '1'),
(187, 'Gallivanter Baller', '1'),
(188, 'Gallivanter Baller LE', '1'),
(189, 'Gallivanter Baller LE Armored', '1'),
(190, 'Gallivanter Baller LE LWB', '1'),
(191, 'Gallivanter Baller LE LWB Armored', '1'),
(192, 'Grotti Bestia GTS', '1'),
(193, 'Grotti Brioso R / A', '1'),
(194, 'Grotti Carbonizzare', '1'),
(195, 'Grotti Cheetah', '1'),
(196, 'Grotti Cheetah Classic', '1'),
(197, 'Grotti GT500', '1'),
(198, 'Grotti Stinger', '1'),
(199, 'Grotti Topless Stinger', '1'),
(200, 'Grotti Stinger GT', '1'),
(201, 'Grotti Turismo Classic', '1'),
(202, 'Grotti Turismo R', '1'),
(203, 'Grotti Vigilante', '1'),
(204, 'Grotti Visione', '1'),
(205, 'Grotti X80 Proto', '1'),
(206, 'Hijak Khamelion', '1'),
(207, 'Hijak Ruston', '1'),
(208, 'HVY	Airtug', '1'),
(209, 'HVY	APC Tank', '1'),
(210, 'HVY	Barracks', '1'),
(211, 'HVY	Barracks Semi', '1'),
(212, 'HVY	Biff', '1'),
(213, 'HVY	Chernobog', '1'),
(214, 'HVY	Crane', '1'),
(215, 'HVY	Cutter', '1'),
(216, 'HVY	Dock Handler', '1'),
(217, 'HVY	Docktug', '1'),
(218, 'HVY	Dozer', '1'),
(219, 'HVY	Dump', '1'),
(220, 'HVY	Forklift', '1'),
(221, 'HVY	Insurgent', '1'),
(222, 'HVY	Insurgent Pick - Up', '1'),
(223, 'HVY	Insurgent Pick - up Custom', '1'),
(224, 'HVY	Mixer Classic', '1'),
(225, 'HVY	Mixer', '1'),
(226, 'HVY	Nightshark', '1'),
(227, 'HVY	Ripley', '1'),
(228, 'HVY	Skylift', '1'),
(229, 'Imponte	Deluxo', '1'),
(230, 'Imponte	Duke O Death', '1'),
(231, 'Imponte	Dukes', '1'),
(232, 'Imponte	Nightshade', '1'),
(233, 'Imponte	Phoenix', '1'),
(234, 'Imponte	Ruiner', '1'),
(235, 'Imponte	Ruiner 2000', '1'),
(236, 'Invetero Coquette', '1'),
(237, 'Invetero Coquette Topless', '1'),
(238, 'Invetero Coquette BlackFin', '1'),
(239, 'Invetero Coquette Classic', '1'),
(240, 'Invetero Coquette Classic Topless', '1'),
(241, 'Jacksheepe Lawn Mower', '1'),
(242, 'JoBuilt	Hauler', '1'),
(243, 'JoBuilt	Hauler Custom', '1'),
(244, 'JoBuilt	Phantom', '1'),
(245, 'JoBuilt	Phantom Custom', '1'),
(246, 'JoBuilt	Phantom Wedge', '1'),
(247, 'JoBuilt	Rubble', '1'),
(248, 'JoBuilt	Trashmaster', '1'),
(249, 'Karin 190z', '1'),
(250, 'Karin Asterope', '1'),
(251, 'Karin BeeJay XL', '1'),
(252, 'Karin Dilettante', '1'),
(253, 'Karin Dilettante Patrol Vehicle', '1'),
(254, 'Karin Futo', '1'),
(255, 'Karin Intruder', '1'),
(256, 'Karin Kuruma', '1'),
(257, 'Karin Kuruma Armored', '1'),
(258, 'Karin Rebel', '1'),
(259, 'Karin Sultan', '1'),
(260, 'Karin Sultan RS', '1'),
(261, 'Karin Technical', '1'),
(262, 'Karin Technical Aqua', '1'),
(263, 'Karin Technical Custom', '1'),
(264, 'Lampadati Casco', '1'),
(265, 'Lampadati Felon', '1'),
(266, 'Lampadati Felon GT', '1'),
(267, 'Lampadati Furore GT', '1'),
(268, 'Lampadati Michelli GT', '1'),
(269, 'Lampadati Pigalle', '1'),
(270, 'Lampadati Tropos Rallye', '1'),
(271, 'Lampadati Viseris', '1'),
(272, 'LCC	Avarus', '1'),
(273, 'LCC	Hexer', '1'),
(274, 'LCC	Innovation', '1'),
(275, 'LCC	Sanctus', '1'),
(276, 'Maibatsu Manchez', '1'),
(277, 'Maibatsu Mule', '1'),
(278, 'Maibatsu Mule Armored', '1'),
(279, 'Maibatsu Mule Custom', '1'),
(280, 'Maibatsu Penumbra', '1'),
(281, 'Maibatsu Sanchez', '1'),
(282, 'Maibatsu Sanchez w / Livery', '1'),
(283, 'Mammoth	Patriot', '1'),
(284, 'Mammoth	Patriot Stretch', '1'),
(285, 'Mammoth	Thruster Jetpack', '1'),
(286, 'MTL	Brickade', '1'),
(287, 'MTL	Dune', '1'),
(288, 'MTL	Fire Truck', '1'),
(289, 'MTL	Flatbed', '1'),
(290, 'MTL	Packer', '1'),
(291, 'MTL	Pounder', '1'),
(292, 'MTL	Pounder Custom', '1'),
(293, 'MTL	Wastelander', '1'),
(294, 'Nagasaki BF400', '1'),
(295, 'Nagasaki Blazer', '1'),
(296, 'Nagasaki Blazer Aqua', '1'),
(297, 'Nagasaki Blazer Lifeguard', '1'),
(298, 'Nagasaki Caddy', '1'),
(299, 'Nagasaki Bunker Caddy', '1'),
(300, 'Nagasaki Caddy Utility', '1'),
(301, 'Nagasaki Carbon RS', '1'),
(302, 'Nagasaki Chimera', '1'),
(303, 'Nagasaki Hot Rod Blazer', '1'),
(304, 'Nagasaki Shotaro', '1'),
(305, 'Nagasaki Street Blazer', '1'),
(306, 'Obey 9F', '1'),
(307, 'Obey 9F Cabrio', '1'),
(308, 'Obey Omnis', '1'),
(309, 'Obey Rocoto', '1'),
(310, 'Obey Tailgater', '1'),
(311, 'Ocelot Ardent', '1'),
(312, 'Ocelet F620', '1'),
(313, 'Ocelet Jackal', '1'),
(314, 'Ocelet Lynx', '1'),
(315, 'Ocelet Pariah', '1'),
(316, 'Ocelet Penetrator', '1'),
(317, 'Ocelet Stromberg', '1'),
(318, 'Ocelet Swinger', '1'),
(319, 'Ocelet XA - 21', '1'),
(320, 'Overflod Autarch', '1'),
(321, '  Overflod Entity XF', '1'),
(322, '  Overflod Entity XXR', '1'),
(323, '  Overflod Tyrant', '1'),
(324, '  Pegassi Bati 801', '1'),
(325, '  Pegassi Bati 801RR', '1'),
(326, '  Pegassi Esskey', '1'),
(327, '  Pegassi Faggio', '1'),
(328, '  Pegassi Faggio Mod', '1'),
(329, '  Pegassi FCR 1000', '1'),
(330, '  Pegassi FCR 1000 Custom', '1'),
(331, '  Pegassi Infernus', '1'),
(332, '  Pegassi Infernus Classic', '1'),
(333, '  Pegassi Monroe', '1'),
(334, '  Pegassi Oppressor', '1'),
(335, '  Pegassi Oppressor MK II', '1'),
(336, '  Pegassi Osiris', '1'),
(337, '  Pegassi Reaper', '1'),
(338, '  Pegassi Ruffian', '1'),
(339, '  Pegassi Tempesta', '1'),
(340, '  Pegassi Tezeract', '1'),
(341, '  Pegassi Torero', '1'),
(342, '  Pegassi Vacca', '1'),
(343, '  Pegassi Vortex', '1'),
(344, '  Pegassi Zentorno', '1'),
(345, '  Pfister 811', '1'),
(346, '  Pfister Comet', '1'),
(347, '  Pfister Comet Retro Custom', '1'),
(348, '  Pfister Comet Safari', '1'),
(349, '  Pfister Comet SR', '1'),
(350, '  Pfister Neon', '1'),
(351, '  Principe Diabolus', '1'),
(352, '  Principe Diabolus Custom', '1'),
(353, '  Principe Lectro', '1'),
(354, '  Principe Nemesis', '1'),
(355, '  Progen GP1', '1'),
(356, '  Progen Itali GTB', '1'),
(357, '  Progen Itali GTB Custom', '1'),
(358, '  Progen T20', '1'),
(359, '  Progen Tyrus', '1'),
(360, '  RUNE Cheburek', '1'),
(361, '  Schyster Fusilade', '1'),
(362, '  Shitzu Defiler', '1'),
(363, '  Shitzu Hakuchou', '1'),
(364, '  Shitzu Hakuchou Drag Bike', '1'),
(365, '  Shitzu PCJ 600', '1'),
(366, '  Shitzu Vader', '1'),
(367, '  Stanley	Fieldmaster', '1'),
(368, '  Stanley	Tractor', '1'),
(369, '  Truffade Adder', '1'),
(370, '  Truffade Nero', '1'),
(371, '  Truffade Nero Custom', '1'),
(372, '  Truffade Z - Type', '1'),
(373, '  Ubermacht Oracle', '1'),
(374, '  Ubermacht Oracle XS', '1'),
(375, '  Ubermacht Revolter', '1'),
(376, '  Ubermacht SC1', '1'),
(377, '  Ubermacht Sentinel', '1'),
(378, '  Ubermacht Sentinel Classic', '1'),
(379, '  Ubermacht Sentinel XS', '1'),
(380, '  Ubermacht Zion', '1'),
(381, '  Ubermacht Zion Cabrio', '1'),
(382, '  Vapid Benson', '1'),
(383, '  Vapid Blade', '1'),
(384, '  Vapid Bobcat XL', '1'),
(385, '  Vapid Bullet', '1'),
(386, '  Vapid Caracara', '1'),
(387, '  Vapid Chino', '1'),
(388, '  Vapid Chino Custom', '1'),
(389, '  Vapid Clown Van', '1'),
(390, '  Vapid Contender', '1'),
(391, '  Vapid Desert Raid', '1'),
(392, '  Vapid Dominator', '1'),
(393, '  Vapid Dominator GTX', '1'),
(394, '  Vapid Ellie', '1'),
(395, '  Vapid Flash GT', '1'),
(396, '  Vapid FMJ', '1'),
(397, '  Vapid GB200', '1'),
(398, '  Vapid Guardian', '1'),
(399, '  Vapid Hotknife', '1'),
(400, '  Vapid Hustler', '1'),
(401, '  Vapid Minivan', '1'),
(402, '  Vapid Minivan Custom', '1'),
(403, '  Vapid Peyote', '1'),
(404, '  Vapid Pibwasser', '1'),
(405, '  Vapid Police Cruiser', '1'),
(406, '  Vapid Police Interceptor', '1'),
(407, '  Vapid Police Prison Bus', '1'),
(408, '  Vapid Radius', '1'),
(409, '  Vapid Retinue', '1'),
(410, '  Vapid Riata', '1'),
(411, '  Vapid Sadler', '1'),
(412, '  Vapid Sandking SWB', '1'),
(413, '  Vapid Sandking XL', '1'),
(414, '  Vapid Scrap Truck', '1'),
(415, '  Vapid Sheriff Cruiser', '1'),
(416, '  Vapid Slamvan', '1'),
(417, '  Vapid Slamvan Custom', '1'),
(418, '  Vapid Speedo', '1'),
(419, '  Vapid Speedo Custom', '1'),
(420, '  Vapid Stanier', '1'),
(421, '  Vapid Taxi', '1'),
(422, '  Vapid Liberator', '1'),
(423, '  Vapid Tow Truck', '1'),
(424, '  Vapid Large Tow Truck', '1'),
(425, '  Vapid Trophy Truck', '1'),
(426, '  Vapid Unmarked Cruiser', '1'),
(427, '  Vapid Utility Truck', '1'),
(428, '  Vulcar Fagaloa', '1'),
(429, '  Vulcar Ingot', '1'),
(430, '  Vulcar Warrener', '1'),
(431, '  Weeny Issi', '1'),
(432, '  Weeny Issi Classic', '1'),
(433, '  Western Motorcycle Company	Bagger', '1'),
(434, '  Western Motorcycle Company	Cliffhanger', '1'),
(435, '  Western Motorcycle Company	Daemon', '1'),
(436, '  Western Motorcycle Company	Daemon Custom	', '1'),
(437, '  Western Motorcycle Company	Gargoyle', '1'),
(438, '  Western Motorcycle Company	Nightblade', '1'),
(439, '  Western Motorcycle Company	Police Bike', '1'),
(440, '  Western Motorcycle Company	Rat Bike', '1'),
(441, '  Western Motorcycle Company	Sovereign', '1'),
(442, '  Western Motorcycle Company	Wolfsbane', '1'),
(443, '  Western Motorcycle Company	Zombie Bobber	', '1'),
(444, '  Western Motorcycle Company	Zombie Chopper	', '1'),
(445, '  Willard	Faction', '1'),
(446, '  Willard	Faction Custom', '1'),
(447, '  Willard	Faction Custom Donk', '1'),
(448, '  Zirconium Journey', '1'),
(449, '  Zirconium Stratum', '1');

-- --------------------------------------------------------

--
-- Table structure for table `warrants`
--

CREATE TABLE `warrants` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `citizen_id` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `officer_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `weapons`
--

CREATE TABLE `weapons` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `defaults` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `written_warnings`
--

CREATE TABLE `written_warnings` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `citizen_id` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `infractions` text NOT NULL,
  `officer_name` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `postal` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `10_codes`
--

CREATE TABLE `10_codes` (
  `id` varchar(64) NOT NULL,
  `code` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `what_pages` text,
  `should_do` text,
  `position` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `10_codes`
--

INSERT INTO `10_codes` (`id`, `code`, `what_pages`, `color`, `should_do`) VALUES
('ab4f8a59-5485-4995-b800-0a96d6d28fb8', '10-42', '[{\"value\":\"leo\",\"label\":\"LEO\"},{\"value\":\"ems_fd\",\"label\":\"EMS-FD\"},{\"value\":\"dispatch\",\"label\":\"Dispatch\"}]', 'btn-danger', 'set_off_duty'),
('e431013d-cdff-4d6f-9968-b3963986fb99', '10-7', '[{\"value\":\"leo\",\"label\":\"LEO\"},{\"value\":\"ems_fd\",\"label\":\"EMS-FD\"},{\"value\":\"dispatch\",\"label\":\"Dispatch\"}]', 'btn-secondary', 'set_status'),
('1014d770-5e87-4438-9fcf-a037e82c7ff1', '10-15', '[{\"value\":\"leo\",\"label\":\"LEO\"},{\"value\":\"dispatch\",\"label\":\"Dispatch\"}]', 'btn-secondary', 'set_status'),
('17a0efa6-d635-4bd9-bafe-0efab8818849', '10-97', '[{\"value\":\"leo\",\"label\":\"LEO\"},{\"value\":\"dispatch\",\"label\":\"Dispatch\"},{\"value\":\"ems_fd\",\"label\":\"EMS-FD\"}]', 'btn-secondary', 'set_status'),
('6c7a2705-58bc-4131-8190-75383c9b6b97', '10-17', '[{\"value\":\"leo\",\"label\":\"LEO\"},{\"value\":\"dispatch\",\"label\":\"Dispatch\"}]', 'btn-secondary', 'set_status'),
('7c005300-c846-4d17-88fc-6f70840c3e0a', '10-11', '[{\"value\":\"leo\",\"label\":\"LEO\"},{\"value\":\"dispatch\",\"label\":\"Dispatch\"}]', 'btn-secondary', 'set_status'),
('8bde82d0-2e31-4380-89f7-4be532cf58d9', '10-23', '[{\"value\":\"leo\",\"label\":\"LEO\"},{\"value\":\"dispatch\",\"label\":\"Dispatch\"}]', 'btn-secondary', 'set_status'),
('9ae5afd5-8219-4108-9e76-26e54bfac1b8', '10-6', '[{\"value\":\"leo\",\"label\":\"LEO\"},{\"value\":\"dispatch\",\"label\":\"Dispatch\"},{\"value\":\"ems_fd\",\"label\":\"EMS-FD\"}]', 'btn-secondary', 'set_status'),
('9dd81d0a-1e1d-48ca-bd69-ce9d6b10855e', '10-5', '[{\"value\":\"leo\",\"label\":\"LEO\"},{\"value\":\"dispatch\",\"label\":\"Dispatch\"},{\"value\":\"ems_fd\",\"label\":\"EMS-FD\"}]', 'btn-secondary', 'set_status'),
('c04f9b07-4c73-46dc-b996-677a3154263a', '10-4', '[{\"value\":\"leo\",\"label\":\"LEO\"},{\"value\":\"dispatch\",\"label\":\"Dispatch\"},{\"value\":\"ems_fd\",\"label\":\"EMS-FD\"}]', 'btn-secondary', 'set_status'),
('7db84c66-76a5-46fd-bab0-b20e52389271', 'Code 6', '[{\"value\":\"leo\",\"label\":\"LEO\"},{\"value\":\"dispatch\",\"label\":\"Dispatch\"}]', 'btn-secondary', 'set_status'),
('cce2f6ec-da78-41fe-a722-ba3db4c6eed5', 'Code 5', '[{\"value\":\"leo\",\"label\":\"LEO\"},{\"value\":\"dispatch\",\"label\":\"Dispatch\"}]', 'btn-secondary', 'set_status');

--
-- Table structure for table `penal_codes`
--

CREATE TABLE `penal_codes` (
  `id` varchar(64) NOT NULL,
  `title` longtext,
  `des` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penal_codes`
--

INSERT INTO `penal_codes` (`id`, `title`, `des`, `jail_time`, `fine_amount`) VALUES
('01714fc0-8f67-422f-8374-e57fffdbda73', '(12)01. Equipment', 'All equipment and lights on a marine vessel must be in working order.\nAll people on a marine vessel must have and wear a life jacket, except for medium to large classed marine vessels, but must provide proof/ show they have life vests onboard\nAll marine vessels must be equipped with fire suppression equipment\nA sprinkler system or fire extinguisher meets this requirement.\n- Violations of Penal Code (12)01 are an infraction with a fine of $275.', '', '275'),
('0578b645-60ab-499d-b2fb-788ce90984c3', '(12)04. Accident/Collision Reporting', 'In case of accident to or collision with persons or property upon the waters of the state, the operator having knowledge of the accident or collision shall immediately stop the vessel at the scene of the accident or collision, to the extent that is safe and practical. The operator then must perform the actions below as applicable:\nRemain at the scene of the accident or collision\nGiven his or her name/address and ownership information of the vessel, along with registration, to any person(s) injured in the accident or collision\nGiven his or her name/address and ownership information to the operator, occupant, owner, or attendant of any vessel damaged in the accident or collision\nGiven his or her name/address and ownership information to any law enforcement officer at the scene.\nSecurely attach in writing the required information in this section to an unoccupied or unattended vessel involved in the accident or collision.\n- Violations of Penal Code (12)04 are a misdemeanor with a fine of $2,000.', '', '2000'),
('076abd13-a58a-437a-8fb0-74f76001140e', '(11)08. Limited Flight Areas', 'Aircraft should avoid any of the following areas:\n\nTall Buildings (DownTown Los Santos)\nVespucci Beach\nSchools / Nursery Homes\n- Violations of Penal Code (11)08 are an infraction with a fine of $2,000', '', '2000'),
('086f3616-f9de-43c0-a3ba-6df8914af1ba', '(4)14. Tampering With Evidence', 'A person who willfully and intentionally destroys or attempts to destroy, creates or attempts to create false evidence, conceal, or alter any evidence that can later potentially be used in a Criminal investigation or court proceeding is guilty under this code section.\n- Violations of Penal Code (4)14 is a misdemeanor with a fine of $1,000.', '', '1000'),
('08a481e2-f361-4007-b1b3-12843201bf7b', '(8)29. Evading A Peace Officer', 'A person who, while operating a vehicle on land, sea, or in air, or while operating a bicycle, willfully flees or otherwise attempts to elude or avoid a pursuing peace officer who communicates visually or audibly their request to pull over or stop is guilty under this code.\nThis charge does not include the attempt to flee and elude by foot, which is (4)8. Resisting a Peace Officer.\n- Violations of Penal Code (8)29 are a misdemeanor with 60 seconds imprisonment, a $1,000 fine, and impoundment of the vehicle used.\n\nNOTE: A passenger of a vehicle cannot directly commit this crime. However, such a person may be charged as an accessory under (13)05 if the requirements of that section are met.', '60', '1000'),
('0913cd3d-3d24-4e77-a9e1-6fda179fe18a', '(4)21. Criminal Harm of a Public Working Animal', 'Any person who Intentionally injures, or kills a marked or recognized public working animal Is guilty under this section.\nAny person who unintentionally injures, or kills a marked or recognized public working animal from criminal negligence is guilty under this section.\nAny person whose direct actions causes the injury or death of a marked or recognized public working animal during the performance of a crime is guilty under this section.\nNote: If It can be proven accidental, or said person was unaware, or the working animal in question was off duty, or not wearing any Identifiers to show it is a working animal, then they are not guilty under code. Veterinarians while performing their duties in a professional manner are exempt.\n\n-Violations of Penal Code (4)21 is a felony with 120 seconds imprisonment and a fine of $20,000.', '120', '20000'),
('1398fc87-da6e-4e20-b385-172995da7ce2', '(11)05. Restricted Flight Areas', 'Aircraft may not operate in any of the following areas without ATC approval:\nOr in such a manner to interfere with the flight patterns at any airport\nExcept for law enforcement and medical life-flight operations.\nOver Zancudo Military Base\nAirports\nOver Bolingbroke Penitentiary\nOver San Andreas Government Facilities\nOver Humane Labs\nUnder 500’ over, within, or among any building structure or person except when required for takeoff and landing\nIn such a manner to interfere with the flight pattern at any airport\nAircraft may not land on any location not intended for the operation of aircraft except in an emergency.\nLaw enforcement and life flight helicopters.\nHelicopters landing on private property with the permission of the owner\nExceptions:\n- Violations of Penal Code (11)05 are an infraction with a fine of $11,000 and suspension of his or her pilot’s license for 3 days.', '', '11000'),
('1510de46-a5a7-4fff-a9f7-d768d9ff4dc9', '(16)05. Hunting Hours', 'No person may hunt, capture, bait, lure, or attempt to hunt, capture, bait, or lure any animals between the hours of sunset and sunrise.\n- Violations of Penal Code (16)05 are a misdemeanor with a $870 fine.', '', '870'),
('154ba33a-39b7-4a79-aaf4-0e7a887a4be1', '(8)13. Maintaining Lanes', 'Any vehicle proceeding upon a road at a speed less than the normal speed of traffic moving in the same direction at such time shall be driven in the right-hand lane for traffic or as close as practicable to the right-hand edge or curb, except when overtaking and passing another vehicle proceeding in the same direction or when preparing for a left turn at an intersection or into a private road or driveway.\nOn a two-lane road where passing is unsafe because of traffic in the opposite direction or other conditions, any vehicle proceeding upon the highway at a speed less than the normal speed of traffic moving in the same direction at that time, behind which five or more vehicles are formed in line, shall turn off the roadway at the nearest place where sufficient area for a safe turnout exists, in order to permit the vehicles following it to proceed.\nWhenever any roadway has been divided into two or more clearly marked lanes for traffic in one direction, the following rules apply\nException: Driving a motorcycle that has two wheels in contact with the ground, between rows of stopped or slow moving vehicles in the same lane, including on both divided and undivided streets, roads, or highways is permitted.\nA vehicle shall be driven as nearly as practical entirely within a single lane and shall not be moved from the lane until such movement can be made with reasonable safety.\nOn a two-lane highway, no vehicle shall be driven to the left side of the center of the roadway in overtaking and passing another vehicle proceeding in the same direction unless the left side is clearly visible and free of oncoming traffic for a sufficient distance ahead to permit such overtaking and passing to be completely made without interfering with the safe operation of any vehicle approaching from the opposite direction.\n- Violations of Penal Code (8)13 are an infraction with a $234 fine.', '', '234'),
('160d37a2-cc01-4817-9be3-b50d99f84c41', '(6)05. Manufacture Of A Controlled Substance', 'A person who, except as otherwise provided by law, manufactures, compounds, converts, produces, or prepares, either directly or indirectly by chemical or natural extraction, any illegal substance is guilty under this code section.\nA person with a license to manufacture may produce such from any agricultural or industrial zoned area within the limits set on the license and is not subject to violations of this penal code for such manufacturer.\n-Violations of Penal Code (6)05 is a felony with 180 seconds imprisonment and a fine of $50,000.', '180', '50000'),
('16981c9e-1f6d-45df-9e9f-d07846883558', '(4)18 Impersonation of a Lawyer', 'A person who is not a certified lawyer who presents himself as a lawyer to another person in order to gain a benefit for himself or a liability for another person is guilty under this code section.\n-Violations of (4)18 are a felony with 90 seconds imprisonment and a fine of $10,000\n\nNote: The simple fact of making a claim to be a lawyer is not enough for a charge under this section. There must also be some act that creates a benefit or a liability.', '90', '10000'),
('17416f23-6749-4649-8654-d0b81b6c9c0e', '(15)02. Laundering Of Money Instruments', 'A person who possesses, hides, transfers, receives, or maintains the storage of funds earned through comprehensive criminal activities is guilty under this code.\nA person who intends to transfer, hide, cycle, or deceive funds collected through comprehensive criminal activities is guilty under this code.\nA person who maintains an establishment with a purpose to launder funds collected through comprehensive criminal activities is guilty under this code.\nA arrest warrant issued per (12)14. must be issued to arrest a person for this offense.\n- Violations of Penal Code (15)02 are a felony with 120 seconds imprisonment and a fine of $250,000 or twice the money laundered whichever is greater.', '', '250000'),
('1a10c2f3-8fbb-46e8-bd54-31f6c37dd161', '(8)06. Driving With A Suspended or Revoked License', 'No person shall operate a motor vehicle at any time when that person’s driving privilege is suspended or revoked.\n\n- First Violations of Penal Code (8)06 are a misdemeanor with 60 seconds imprisonment, a $1,000 fine, and 6 days added to the current license suspension. A vehicle that is being operated by someone with a suspended or revoked driver’s license shall be impounded until such time that the owner demonstrate he/she has a valid license and upon payment of impound fees (($150 per day)).\n\n- Second Violations of Penal Code (8)06 within 60 days of a previous violation are a misdemeanor with 90 seconds imprisonment, a $2,000 fine, and 12 days added to the current license suspension. A vehicle that is being operated by someone with a suspended or revoked driver’s license shall be impounded and shall be forfeited ((permanently seized with no return)) if the person violating this penal code is the registered owner. If the violator is not the registered owner the registered owner may pickup the vehicle upon demonstration of a valid license and upon payment of all fees (($150 per day)).', '75', '1500'),
('1b988a9f-cd73-4610-b8d2-c9cabf20d5df', '(13)05. Criminal Accomplice Clause', 'A person who acts as an accomplice, aid, adviser, or other supportive role to another person\'s attempted or successful criminal acts shall receive the FULL punishment allotted to the person who attempted or succeeded criminal acts.', '', ''),
('1ced505c-c44a-4de6-be95-42095713426e', '(2)05. Possession Of Burglary Tools', 'A person who has in their possession the appropriate combination of tools necessary to commit burglary, such as a tension bar along with a screwdriver, shimmy, or other appropriate items is guilty under this code section.\n- Violations of Penal Code (2)05 is a misdemeanor with 60 seconds imprisonment and a fine of $1,000.\n\nNOTE: It must be demonstrated that the person has a certain combination of these tools or in an appropriate context that would assume their usage or intent in burglary. Having a screwdriver is not punishable alone, but a screwdriver, along with a tension bar, is punishable.', '60', '1000'),
('1f53a5ca-746a-47f2-9db1-849201c6f337', '(6)04. Maintaining A Place For The Purpose Of Distribution', 'A person who opens or maintains any property for the purpose of unlawfully selling, giving away, storing, or using any controlled substance, firearm, or other illicit device, good, or service is guilty under this code section.\nA person with a license to sell cannabis may sell such from any commercially zoned establishment is not subject to this penal code for such sells.\n-Violations of Penal Code (6)04 is a felony with 90 seconds imprisonment and a fine of $10,000.', '90', '10000'),
('2058d993-68d3-4975-b87c-1738f60f4a58', '(12)07. Reckless or Unsafe Operation', 'A person who operates any marine vessel or similar device on the waters in this state carelessly or headlessly, or in disregard for the rights or safety of any person, vessel, property, without due caution, or at a rate of speed or manner so as to endanger any person, vessel, or property is guilty of reckless operation of a marine vessel.\nUnsafe vessel operation includes, without limitation any of the following:\nOperating at such a speed and proximity to another vessel or to a person so as to require the operator of either vessel to swerve or turn abruptly to avoid a collision.\nWeaving through congested water-borne traffic.\n- Violations of Penal Code (12)07 are a misdemeanor with a fine of $2,000.', '', '2000'),
('21eb7598-0fed-4e65-b905-0aa177a4f9dd', '(8)17. Turning', 'Both the approach for a right-hand turn and a right-hand turn shall be made as close as practicable to the right-hand curb or edge of the roadway unless roadway markings permit otherwise.\nThe approach for a left turn shall be made as close as practicable to the left-hand edge of the extreme left-hand lane or portion of the roadway lawfully available to traffic moving in the direction of travel of the vehicle and, when turning at an intersection, the left turn shall not be made before entering the intersection. After entering the intersection the left turn shall be made so as to leave the intersection in a lane lawfully available to traffic moving in that direction upon the roadway being entered.\nNo driver shall make a U-turn at any intersection not controlled by official traffic control devices. If official traffic control devices are present then only from the far left hand lane that is lawfully available to traffic moving in the direction of travel from which the turn is commenced.\n- Violations of Penal Code (8)17 are an infraction with a $234 fine.', '', '234'),
('2514d8b1-19b8-4b81-b000-eb1f2f9a39a7', '(15)01. Racketeering', 'The affiliation or association of an individual with a criminal organization, as prescribed by local or national law enforcement entities, with the evidence of the individual\'s attempt to commit extortion, bribery, murder, or other criminal activities while affiliated with said criminal organization is guilty under this penal code.\nA arrest warrant issued per (14)09. must be issued to arrest a person for this offense. (Unless charged as part of an ongoing CIU Investigation).\n- Violations of Penal Code (15)01 are a felony that is with 480 seconds imprisonment and a fine of $4,000,000.', '480', '4000000'),
('26f525df-acea-4ac1-b6e4-4bd5b2f86e2a', '(6)09. Detention of Mentally Disordered Persons', 'When a person, as a result of a mental health disorder, is a danger to others, or to himself or herself, or gravely disabled, a peace officer may, upon probable cause, take, or cause to be taken, the person into custody for a period of up to 60 seconds for assessment, evaluation, and crisis intervention, or placement for evaluation and treatment in a facility designated by the county for evaluation and treatment and approved by the State.\n- Penal Code (6)09 is not a criminal offense but rather a policy for the handling of mental health disorders.\n\nNOTE: Persons who are held under this code have not committed a crime and are being held for their own well being. Use of this code does not stack with any charge and cannot be used in lieu of a standard punishment for a crime. If a crime has been committed this section is not to be used. This is commonly referred to as a 5150 hold or a baker act hold. This section is most commonly used after an attempted suicide or a person threatening to commit suicide. ((Application of this section is done by use of the hospital script for 60 seconds.))', '', ''),
('2721a736-234f-4abf-abac-e3cbf795bbee', '(8)02. Driver License Point System', 'All drivers of motor vehicles who are convicted of certain violations under title (8) shall be assigned points in accordance with the following table:\n\nSections: (8)7-28\nPoints Assigned: 1\n\nPoints expire after 12 days.\nA person who receives 4 points shall have his/her license suspended for a period of 6 Days.\nA person can only earn 1 point per calendar day.\nWhen another section of this code requires a license suspension at the same time that this section requires the same the suspensions shall be added together.\nWhen a driver is issued a license suspension under this or any other section he/she shall be informed of the suspension and the date where the suspension is no longer in effect.', '', ''),
('2799ff6e-6f95-4f7b-8954-8d00385778f6', '(16)09. Use of Animals', 'No person shall at any time capture or destroy any deer and detach or remove from the carcass only the head, hide, antlers, or horns; nor shall any person at any time leave through carelessness or neglect any game mammal or game bird which is in his possession, or any portion of the flesh thereof usually eaten by humans, to go needlessly to waste.\n- Violations of Penal Code (16)09 are a misdemeanor with a $670 fine.', '', '670'),
('28ac64b3-821f-481c-9146-a2fa078092fa', '(13)04. Weapons Violation', 'A person who commits a felony while in possession of a firearm shall have their firearms permit revoked.\nA person who demonstrates illegal or irresponsible usage of their firearm shall be suspect to firearms permit suspension or revocation depending on the penal code entry of the firearms violation. If no description exists, it shall be up to officer discretion.\nIf a person receives two suspensions of their firearms permit they shall have their permit revoked immediately upon the second incident.\nThese violation policies also apply, where appropriate, to licenses and permits issued to facilities and organizations.\nThese policies also apply to any current and future firearms permits created for purposes determined by the agency responsible for firearms regulation.', '', ''),
('2b8f409d-337c-4430-a0a0-b2dc868f41ed', '(8)23. Motor Vehicle Contest', 'A person shall not engage in a motor vehicle speed contest on a highway. As used in this section, a motor vehicle speed contest includes a motor vehicle race against another vehicle, a clock, or other timing device\nA person shall not aid or abet in any motor vehicle speed contest on any highway.\nA person shall not, for the purpose of facilitating or aiding or as an incident to any motor vehicle speed contest or exhibition upon a highway, in any manner obstruct or place a barricade or obstruction or assist or participate in placing a barricade or obstruction upon any highway.\nViolations of Penal Code (8)23 are a misdemeanor with a $394 fine, impoundment of the vehicle, and license suspension for 1 day.', '', '394'),
('2dd4085f-7153-4622-9597-b41b9918cc60', '(16)04. Daily Limits and Possession Limits - Excessive violations.', 'Any person who illegally takes or possesses in the field more than three times the daily bag limit, or who illegally possesses more than three times the legal possession limit is guilty under this penal code.\n- Violations of Penal Code (16)04 are a misdemeanor with a $40,000 fine and 60 seconds imprisonment.', '60', '40000'),
('30080235-1f39-4ac7-9f64-af816a87bd8b', '(3)04. Pandering / Pimping', 'A person who knowingly receive financial support or maintenance from the earnings of someone engaged in prostitution  is guilty under this code section.\nA person who receives or tries to receive compensation for soliciting for a prostitute (that is, finding customers for him/her) is guilty under this code section .\nA person who procures, encourages, or encourages others to procure another person for the purpose of prostitution is guilty under this code section.\nA person who forces or encourages another person to remain engaged in prostitution  is guilty under this code section.\n- Violations of Penal Code (3)04 is a felony with 150 seconds imprisonment and a fine of $10,000.', '150', '10000'),
('315eaa16-3579-4bed-84ad-0c1eb4089971', '(8)04. Drivers Licenses', 'A person may not operate a motor vehicle or combination of motor vehicles that is not of a type for which the person is licensed.\nNo person shall have in his or her possession or otherwise under his or her control more than one driver’s license.\nThe licensee shall have the valid driver’s license issued to him or her in his or her immediate possession at all times when driving a motor vehicle upon a highway.\n- Violations of Penal Code (8)04 are an infraction with a fine of $234. A motor vehicle that is being driven by someone without a valid driver’s license may be impounded.', '', '234'),
('372ba8ca-5d0e-4525-b699-d47f4e485976', '(9)04. Drive-By Shooting', 'A person who drives a vehicle, whether on land, sea, or in air, and has a passenger who they knowingly and willingly let discharge a firearm from within the vehicle, and the passenger is not an on-duty peace officer is guilty under this code section.\nA person who discharges a weapon in a vehicle, whether on land, sea, or in air, and is not an on-duty peace officer with proper authorization is guilty under this code section.\n- Violations of Penal Code (9)04 is a felony with 90 seconds imprisonment and a $10,000 fine.\n\nNOTE: A person who discharges a weapon in a vehicle in an explicit case of self defense, where grievous bodily harm may occur and use of said firearm is necessary to prevent said harm are exempt from this charge', '90', '10000'),
('38c25617-05d5-41f8-b0c9-f08edd34d92c', '(4)04. Filing A False Police Report', 'A person who reports to any peace officer that a felony or misdemeanor has been committed knowing the report to be false is guilty under this code section.\n- Penal Code (4)04 is a misdemeanor with 60 seconds imprisonment.', '60', ''),
('42be6437-013e-4036-9cbf-2a44eeab46b2', '(2)15. Theft', 'A person who steals or takes the personal property of another worth between $200 and $950 or less is guilty under this code section.\nA person who fails to pay a contract or invoice within a reasonable amount of time for services totaling between $200 and $950 in value is guilty under this code section.\n- Violations of Penal Code (2)08 are a misdemeanor with 60 seconds imprisonment and a fine of $2000.', '60', '2000'),
('42c365fe-b666-45cf-86de-296d669b1729', '(16)06. Hunting Methods', 'No person may have a loaded weapon in a motor vehicle.\nNo person may fire a gun within 150 yards of a dwelling.\nNo person may fire a gun on or over a public road or way.\nNo person may fire a gun from a boat, motor vehicle, or airplane.\nNo person may hunt, attempt to hunt, or shoot any animal using a suppressor.\n- Violations of Penal Code (16)06 are a misdemeanor with a $870 fine.', '', '870'),
('42fd9bcc-e6d5-4168-97ef-856dc8939523', '(1)01.Criminal Threats', 'A person who communicates to another that they will physically harm or kill such other, placing such other in a reasonable state of fear for their own safety is guilty under this code section.\nA person who communicates that they will physically harm or kill another person’s close friends or relatives is guilty under this code section.\nSuch communication can be not just verbal, but also in writing or transmitted through other media is guilty under this code section.\n- Violations of Penal Code (1)01 are a misdemeanor with 60 seconds imprisonment.\n\nNOTE: Criminal Threats differs from assault in terms of the distance between the acts. Criminal Threats can occur across the street, while assault is up close, within reach of leading to battery', '60', ''),
('43ce8432-9b65-4fcf-8c5f-7dd97d38c3b7', '(6)07. Public Intoxication', 'A person who is found in any public place under the influence of intoxicating liquor, any drug, controlled substance, toluene, or any combination of any intoxicating liquor, drug, controlled substance, or toluene, in a condition that he or she is unable to exercise care for his or her own safety or the safety of others is guilty under this code section.\nA person by reason of his or her being under the influence of intoxicating liquor, any drug, controlled substance, toluene, or any combination of any intoxicating liquor, drug, or toluene, interferes with or obstructs or prevents the free use of any street, sidewalk, or other public way is guilty under this code section .\n-Violations of Penal Code (6)07 is a misdemeanor with a fine of $1,000.\n\nNOTE: Depending on the state of the person, law enforcement may decide to detain the person for an overnight stay at the jail.', '', '1000'),
('49c17695-91e7-40e2-ad46-d84e8f105fcd', '(1)13. Reckless Endangerment - Misdemeanor', 'A person who’s conduct creates a substantial serious risk of injury to another person is guilty under this code section.\n- Violations of Penal Code (1)13 are a misdemeanor with 60 seconds imprisonment and a fine of $1,000.', '60', '1000'),
('4a19e748-1aa8-4868-81db-d4b645b7735d', '(4)09. Escape From Custody', 'A person who has been physically or verbally detained or arrested by a peace officer and escapes or attempts to escape from said Peace Officer’s personal custody is guilty under this code section\n- Violations of Penal Code (4)09 is a misdemeanor with 60 seconds imprisonment in addition to any outstanding charges on an individual who commits an escape.\n\nNOTE: Escaping with physical violence can additionally result in assault and/or battery charges.', '60', ''),
('4bc65813-8f33-4539-9977-44fa8386f66e', '(4)17 Perjury', 'A person who willfully gives false information while testifying in court, during a deposition, or on a signed document presented to a court is guilty under this section.\n-Violations of Penal Code (4)17 are a felony with 120 second imprisonment and a fine of $10,000.\n\nNote: A person must be \"under oath\" or filing a legal document with a court (as opposed to a documents presented as evidence) to be charged under this section.', '120', '10000'),
('4c3e0b88-3a32-4d4c-bec1-3070fdd1b3ca', '(6)01. Possession Of A Controlled Substance', 'A person who possesses any controlled substance, except when the substance has been lawfully prescribed to them by a licensed practitioner of medicine or is legally available without a prescription is guilty under this code section.\nA person who possesses more than the following amounts of cannabis without a license to manufacture/sell is guilty under this code section:\n1 ounce of dry cannabis or\n8 grams of concentrated cannabis\nMore than 6 plants when such plants in located in a private residence.\n-Violations of Penal Code (6)01 is a misdemeanor with 60 seconds imprisonment and a fine of $1,000.\n\nNOTE: A controlled substance is either a prescription medication or any substance on the following list: https://www.deadiversion.usdoj.gov/schedules/orangebook/c_cs_alpha.pdf except cannabis (marajuana).', '60', '1000'),
('4d029673-4792-4059-ae74-f14d0961e90f', '(12)03. Speed', 'Marine vessels may not exceed 15 miles an hour within a harbor or marina.\n- Violations of Penal Code (12)03 are an infraction with a fine of $384.', '', '384'),
('4e8fe0ca-8f06-4eb6-b899-0afde74fa1a1', '(8)24. Throwing Objects', 'Any person who throws any substance at a vehicle or any occupant thereof is guilty under this code.\nViolations of Penal Code (8)24 are a misdemeanor with a $1,000 fine.\n\nNOTE: When there is intent to harm this charge can be stacked with assault with a deadly weapon.', '', '1000'),
('4e9281fe-7f1f-46bd-b685-6bfb4f983bbb', '(6)03. Possession Of Drug Paraphernalia', 'A person who willingly possesses a device or mechanism used exclusively for the processing, Distribution, or consumption of an illegal controlled substance is guilty under this code section.\n-Violations of Penal Code (6)03 is a misdemeanor with 60 seconds imprisonment and a fine of $1,000.', '60', '1000'),
('50022455-87fd-437c-8def-cf164db777e3', '(3)07. Stalking', 'A person who intentionally and maliciously follows or harasses another person who has made it known that they do not consent to such following or harassment is guilty under this code section.\nA person whose actions cause another person to reasonably fear for their safety, or the safety of any person is guilty under this code section.\nA person who violates an official restraining order issued by a court is guilty under this code section.\n- Violations of Penal Code (3)07 is a felony with 120 seconds imprisonment.', '120', ''),
('5053b923-aaa8-4715-ad20-af9da12047b2', '(8)19. Criminal Speeding', 'A driver who operates a vehicle at a speed greater than 100 mph is guilty under this code section.\n- Violations of Penal Code (8)19 are a infraction with a fine of $880, and license suspension for 1 day.\n\nNote: Excessive speeding which causes a “wanton disregard for safety” can be charged as reckless driving in addition to this section.\n\n((OOC Note: Speeds of over 130 mph are possible with new DLC content, but still likely violating the civilian SOP regarding vehicle modification based on various factors. These events should be referred to a supervisor or your Chain of Command for appropriate action.)', '', '1000'),
('50b50308-0c7c-4944-8bd2-2c98a49fd6ef', '(3)05. Sexual Battery', 'A person who commits unwanted touching or sexual contact  is guilty under this code section.\nA person who causes battery or similar aggressive physical contact for the purpose of sexual arousal, gratification, or abuse  is guilty under this code section.\nA person who directly or indirectly obtains, receives, distributes, or records explicit material of another against their will, without permission, or while they are under the influence is guilty under this section.\n- Violations of Penal Code (3)05 is a felony with 120 seconds imprisonment and a fine of $10,000.', '120', '10000'),
('569b9b36-22f7-424a-8c5e-82980ae6f027', '(12)05. Permission to conduct special water events.', 'No person or organization shall conduct any race, regatta, or other special event upon the waters in this state without first obtaining written permission (from Civ CoC).\n- Violations of Penal Code (12)05 are an infraction with a fine of $6,000.', '', '6000'),
('57963c6b-27dd-413c-a5e7-b0acb93c4a3d', '(16)00. Applicability', 'This section applies to the hunting, capturing, baiting, or luring of any or all animals except small rodents.\nOnly certified fish and game wardens may enforce codes under this title.', '', ''),
('587235f5-4128-4da4-923b-715f5abd48a0', '(4)06. Impersonation Of A Government Employee', 'A person who pretends or implies the role of a government worker, such as a peace officer, paramedic, tax collector, federal investigator, or other official is guilty under this code section.\nA person who wears an official or realistic government employee uniform with an official or realistic badge or identification tag except on an official, legally sanctioned movie or production set is guilty under this code section.\nA person who claims to be a government worker in order to deceive or take advantage of another individual or organization is guilty under this code section.\n- Violations of Penal Code (4)06 is a misdemeanor with 60 seconds imprisonment and a fine of $1,000.', '60', '1000'),
('588bc4a6-fa1e-450f-a1da-d397335e3642', '(12)00. Applicability', 'This section applies to the operation of any marine vessel, to include jet-skis.\nJet-skis must comply with all other Titles except those listed below:\n(8)01 through (8)06\n(8)09 through (8)20\n(8)23\n(8)31\nOnly certified marine vessel inspectors may enforce codes under this title.', '', ''),
('589b9777-eb03-4ef2-87dd-0982c8afdefd', '(12)10. Vessel Insurance', 'All operators and all owners of a marine vessel shall at all times be able to establish valid insurance for the vessel, and shall at all times carry in the vehicle evidence of vehicle insurance.\nWhenever an operator involved in an accident described in Section (12)14 fails to provide evidence of vessel insurance, as required by this section, at the time of the accident or incident, the state shall suspend the privilege of the operator or owner to operate a marine vessel.\n- Violations of Penal Code (12)10 are an infraction with an $800 fine. Violations of element 2 are additionally with license suspension until the operator provides proof of vessel insurance or 6 days have passed.', '', '800'),
('5914d845-1edd-4c49-a501-37268950fd05', '(8)20. Stop Signs', 'The driver of any vehicle approaching a stop sign or pavement marking of “STOP” at the entrance to, or within, an intersection shall stop at a limit line, if marked, otherwise before entering the crosswalk on the near side of the intersection. If there is no limit line or crosswalk, the driver shall stop at the entrance to the intersecting roadway.\nWhen two vehicles enter an intersection from different highways at the same time and the intersection is controlled from all directions by stop signs, the driver of the vehicle on the left shall yield the right-of-way to the vehicle on his or her immediate right.\nViolations of Penal Code (8)20 are an infraction with a $234 fine.', '', '234'),
('592eb703-4066-4d72-ac69-1d8ff1aafe8b', '(9)06. Illegal Sale of Firearms', 'A person or entity who knowingly sells or transfers a firearm to a prohibited person is guilty under this code section\nA person or entity who knowingly sells or transfers a firearm to a prohibited person and that prohibited person uses the firearm in a crime can be charged with the same crimes as an accomplice. \nA person or entity who knowingly sells, or transfers an illegal firearm that is deemed so by the state to anyone, or sells a restricted weapon to a person who does not have the appropriate licence to own it, is guilty under this code section.\n- Violations of Penal Code (9)06 are a felony with 60 seconds imprisonment, a fine of $1,000', '60', '1000'),
('594eb916-790a-48f7-b00e-ac62e2fb41f0', '(1)04. Battery', 'A person who uses intentional and unlawful force or violence to cause physical harm to another person is guilty under this code section.\n- Violations of Penal Code (1)04 are a misdemeanor with 60 seconds imprisonment and a fine of $2,000.', '60', '2000'),
('59e5a78f-356b-4155-a728-e361a27f19b0', '(4)13. Misuse Of A Government Hotline', 'A person who uses an emergency government hotline for any purpose other than an emergency situation which involves a life-or-death request for assistance or other purposes dictated by the hotline managers is guilty under this code section.\nA person who uses any non-emergency or public hotline for purposes irrelevant to that particular government office, department, or agency is guilty under this code section.\nA person who performs prank calls, fake calls, or tries to incite mayhem through public government lines is guilty under this code section.\n- Violations of Penal Code (4)13 is a misdemeanor with a fine of $1,000.', '', '1000'),
('60176457-04e0-4cf3-a8dd-c3e2ea97e891', '(8)12. Driving on the Right Side', 'Upon all highways, a vehicle shall be driven upon the right half of the roadway or to the right of double solid parallel yellow lines, except as follows:\nYellow markings do not prohibit a driver from crossing the marking if (1) turning to the left at an intersection or into or out of a driveway or private road, or (2) making a U-turn under the rules governing that turn\nWhen overtaking and passing another vehicle proceeding in the same direction when such action can be taken without crossing a solid yellow or solid white line\nUpon a roadway restricted to one-way traffic.\nWhen the vehicle is necessarily traveling so slowly as to impede the normal movement of traffic, that portion of the road adjacent to the right edge of the roadway may be utilized temporarily when in a condition permitting safe operation.\nWhenever a road has been divided into two or more roadways by means of intermittent barriers or by means of a dividing section of not less than two feet in width, either unpaved or delineated by curbs, double-parallel lines, or other markings on the roadway, it is unlawful to do either of the following:\nTo drive any vehicle over, upon, or across the dividing section.\nTo make any left, semicircular, or U-turn with the vehicle on the divided highway, except through an opening in the barrier designated and intended by public authorities for the use of vehicles or through a plainly marked opening in the dividing section.\n- Violations of Penal Code (8)12 are an infraction with a $234 fine.', '', '234'),
('60aacc8a-8d6e-4825-ad70-57ca24801abf', '(7)02. Sale Or Furnishing Of Alcohol To A Minor', 'A person who willfully and knowingly furnishes (that is, sell, provide or give) — or causing to be sold, furnished, or given away — any alcoholic beverage to a person under the age of 21.\nBeing an on-sale licensee and permitting a person who is under 21 to consume any alcoholic beverage on the premises, even if the licensee doesn’t have actual knowledge that the individual is under 21 years of age.\nNote that this section does not apply on private property with the person furnishing being the guardian of the minor, and is 21 years of age or older.\n- Violations of Penal Code (7)02 is a misdemeanor with a fine of $1,000.', '', '1000'),
('613f37c3-2c51-4ebd-b030-cf5fe6004575', '(8)18. Speed Limits | Stop/Unreasonably Slow', 'No driver may operate a vehicle at a speed greater than the posted speed limit.\nNo person shall drive a vehicle upon a highway at a speed greater than is reasonable or prudent having due regard for weather, visibility, the traffic on, and the surface and width of, the highway, and in no event at a speed which endangers the safety of persons or property.\nWhen no speed limit is posted the following speed limits apply:\n15 mph in any alley way\n45 mph on any road other than a state highway\n65 mph on any state highway, freeway, interstate, or US highway\nA driver who fails to show a use of fair judgment in their speed when driving in poor conditions, such as poor weather, or on unpaved, slick, or damaged roads.\nNo person shall drive upon a highway at such a slow speed as to impede or block the normal and reasonable movement of traffic unless the reduced speed is necessary for safe operation, because of a grade, or in compliance with law.\nNo person shall bring a vehicle to a complete stop upon a highway so as to impede or block the normal and reasonable movement of traffic unless the stop is necessary for safe operation or in compliance with law.\nNo person may drive any of the following vehicles on a highway at a speed in excess of 55 miles per hour:\nA motortruck or truck tractor having three or more axles or any motortruck or truck tractor drawing any other vehicle.\nA vehicle transporting explosives.', '', '234'),
('617606e3-b250-485b-ad18-a157986bb51d', '(2)10. Grand Theft Auto', 'A person who commits the theft of any motor vehicle, no matter the value is guilty under this code section.\nThis charge cannot stack with any form of Trespassing or Burglary.\n- Violations of Penal Code (2)10 is a felony with 90 seconds imprisonment.\n\nNOTE: Grand Theft Auto does not stack with theft, burglary, or trespassing of a vehicle.', '90', ''),
('61dcc932-2270-420c-8fd0-23020a41b22f', '(8)18. Speed Limits | 16-25 excess', 'No driver may operate a vehicle at a speed greater than the posted speed limit.\nNo person shall drive a vehicle upon a highway at a speed greater than is reasonable or prudent having due regard for weather, visibility, the traffic on, and the surface and width of, the highway, and in no event at a speed which endangers the safety of persons or property.\nWhen no speed limit is posted the following speed limits apply:\n15 mph in any alley way\n45 mph on any road other than a state highway\n65 mph on any state highway, freeway, interstate, or US highway\nA driver who fails to show a use of fair judgment in their speed when driving in poor conditions, such as poor weather, or on unpaved, slick, or damaged roads.\nNo person shall drive upon a highway at such a slow speed as to impede or block the normal and reasonable movement of traffic unless the reduced speed is necessary for safe operation, because of a grade, or in compliance with law.\nNo person shall bring a vehicle to a complete stop upon a highway so as to impede or block the normal and reasonable movement of traffic unless the stop is necessary for safe operation or in compliance with law.\nNo person may drive any of the following vehicles on a highway at a speed in excess of 55 miles per hour:\nA motortruck or truck tractor having three or more axles or any motortruck or truck tractor drawing any other vehicle.\nA vehicle transporting explosives.', '', '360'),
('61eed146-afa1-469e-a488-265e025820a1', '(1)10. False Imprisonment', 'A person who intentionally and unlawfully restrained, detained, or confined a person and made the person stay or go somewhere against his or her will is guilty under this code section.\n- Violations of Penal Code (1)10 are a misdemeanor with 60 seconds imprisonment and a fine of $1,000.', '60', '1000'),
('646b466a-32f8-4210-a584-5d07ed793008', '(8)09. Vehicle Insurance', 'All drivers and all owners of a motor vehicle shall at all times be able to establish valid insurance for the vehicle, and shall at all times carry in the vehicle evidence of vehicle insurance.\nWhenever a driver involved in an accident described in Section (8)06 fails to provide evidence of vehicle insurance, as required by this section, at the time of the accident, the state shall, suspend the privilege of the driver or owner to drive a motor vehicle, including the driving privilege of a nonresident in this state.\n- Violations of Penal Code (8)09 are an infraction with a $480 fine. Violations of element 2 are additionally with license suspension until the driver provides proof of vehicular insurance or 6 days have passed.', '', '480'),
('698a3aa6-8288-40fa-b3db-912b9c88948a', '(4)02. Dissuading A Victim', 'A person who prevents the distribution, completion, answering, or due process of an affidavit or other legal statement is guilty under this code section.\n- Violations of Penal Code (4)02 is a felony with 120 seconds imprisonment and a fine of $10,000.', '120', '10000'),
('6d75756a-9daa-4d7b-9daf-b4c484cf571f', '(3)03. Prostitution', 'A person who knowingly engages in or offers to engage in a sexual act in exchange for payment or other goods and services is guilty under this code section.\n- Violations of Penal Code (3)03 is a misdemeanor with 60 seconds imprisonment and a fine of $2,000.\n\nNOTE: Anyone who cannot be proven to commit prostitution may charged with Indecent Exposure or Lewd or Dissolute Conduct depending on the circumstances.', '60', '2000'),
('713de286-1131-4e5f-894b-c225e4281ccc', '(8)15. Right of Way', 'The driver of any vehicle approaching an intersection which has official traffic control signals that are inoperative, or none at all shall stop at the intersection, and may proceed with caution when it is safe to do so.\nThe driver of a vehicle intending to turn to the left or to complete a U-turn upon a highway, or to turn left into public or private property, or an alley, shall yield the right-of-way to all vehicles approaching from the opposite direction which are close enough to constitute a hazard at any time during the turning movement, and shall continue to yield the right-of-way to the approaching vehicles until the left turn or U-turn can be made with reasonable safety.\nThe driver of any vehicle about to enter or cross a highway from any public or private property, or from an alley, shall yield the right-of-way to all traffic, approaching on the highway close enough to constitute an immediate hazard, and shall continue to yield the right-of-way to that traffic until he or she can proceed with reasonable safety.\nA person driving a vehicle on a road approaching a stationary authorized emergency vehicle that is displaying emergency lights or a stationary tow truck that is displaying flashing amber warning lights, shall approach with due caution and, before passing in a lane immediately adjacent to the authorized emergency vehicle or tow truck, absent other direction by a peace officer, proceed to do one of the following\nMake a lane change into an available lane not immediately adjacent to the authorized emergency vehicle or tow truck, with due regard for safety and traffic conditions, if practicable and not prohibited by law.\nIf the maneuver described above would be unsafe or impracticable, slow to a reasonable and prudent speed that is safe for existing weather, road, and vehicular or pedestrian traffic conditions.\nThe driver of a vehicle shall yield the right-of-way to a pedestrian crossing the roadway within any marked crosswalk or within any unmarked crosswalk at an intersection.\nNo pedestrian may suddenly leave a curb or other place of safety and walk or run into the path of a vehicle that is so close as to constitute an immediate hazard. No pedestrian may unnecessarily stop or delay traffic while in a marked or unmarked crosswalk.\nEvery pedestrian upon a roadway at any point other than within a marked crosswalk or within an unmarked crosswalk at an intersection shall yield the right-of-way to all vehicles upon the roadway so near as to constitute an immediate hazard.\nBetween adjacent intersections controlled by traffic control signal devices or by police officers, pedestrians shall not cross the roadway at any place except in a crosswalk.\nPedestrians, bicycles, and other non motorized traffic are not authorized on the following roads:\nInterstate 1\nInterstate 2\nInterstate 4\nInterstate 5\nUS Route 1\nUS Route 13\nUS Route 15\nUS Route 20\nNo person may stop a vehicle unnecessarily in a manner that causes the vehicle to block a marked or unmarked crosswalk or sidewalk.\nThe above does not preclude the driver of a vehicle facing a steady circular red light from turning right or turning left from a one-way street onto a one-way street.\n- Violations of Penal Code (8)15 are an infraction with a $234 fine for vehicular violations and a $194 fine for pedestrian violations.', '', '234'),
('724f0eb0-bf5b-46ea-8c2b-0489028abc72', '(1)14. Reckless Endangerment - Felony', 'A person who under circumstances indicating a depraved indifference to human life recklessly engages in conduct which creates a grave risk of death to another person is guilty under this code section.\n- Violations of Penal Code (1)14 are a felony with 180 seconds imprisonment and a fine of $2000.', '180', '2000'),
('73314f28-db29-4f20-ba87-8eb3ac21f000', '(3)06. Rape', 'A person who forces another to engage in sexual intercourse is guilty under this code section.\nA person who performs non consensual sexual intercourse with another is guilty under this code section.\nA person who performs sexual intercourse with another who is incapacitated, disabled, or unable to give consent is guilty under this code section.\n- Violations of Penal Code (3)06 is a felony with 210 seconds imprisonment.', '210', ''),
('739fd0fd-b7a3-4b2b-81cf-8bba5ea776fb', '(8)18. Speed Limits | 26+ excess', 'No driver may operate a vehicle at a speed greater than the posted speed limit.\nNo person shall drive a vehicle upon a highway at a speed greater than is reasonable or prudent having due regard for weather, visibility, the traffic on, and the surface and width of, the highway, and in no event at a speed which endangers the safety of persons or property.\nWhen no speed limit is posted the following speed limits apply:\n15 mph in any alley way\n45 mph on any road other than a state highway\n65 mph on any state highway, freeway, interstate, or US highway\nA driver who fails to show a use of fair judgment in their speed when driving in poor conditions, such as poor weather, or on unpaved, slick, or damaged roads.\nNo person shall drive upon a highway at such a slow speed as to impede or block the normal and reasonable movement of traffic unless the reduced speed is necessary for safe operation, because of a grade, or in compliance with law.\nNo person shall bring a vehicle to a complete stop upon a highway so as to impede or block the normal and reasonable movement of traffic unless the stop is necessary for safe operation or in compliance with law.\nNo person may drive any of the following vehicles on a highway at a speed in excess of 55 miles per hour:\nA motortruck or truck tractor having three or more axles or any motortruck or truck tractor drawing any other vehicle.\nA vehicle transporting explosives.', '', '480');
INSERT INTO `penal_codes` (`id`, `title`, `des`, `jail_time`, `fine_amount`) VALUES
('7626e8e4-39f8-4f7f-92a9-0be1bd5fac10', '(15)04. Interference with a Transit System', 'For the purpose of this section  a transit system is any bus, train, subway, light rail, boat, helicopter, or plane operated for the purpose of transporting the general public along a predefined route.\nA person shall not do any of the following with respect to the property, facilities, or vehicles of a transit system:\nOperate, interfere with, enter into, or climb on or in, the property, facilities, or vehicles owned or operated by the transit system without the permission or approval of the transit system.\nInterfere with the operator or operation of a transit vehicle, or impede the safe boarding or alighting of passengers.\nExtend any portion of the body through a window opening of a transit vehicle in a manner that may cause harm or injury.\nThrow an object from a transit vehicle.\nCommit an act or engage in a behavior that may, with reasonable foreseeability, cause harm or injury to any person or property.\nViolate a notice, prohibition, instruction, or direction on a sign that is intended to provide for the safety and security of transit passengers, or the safe and secure operation of the transit system.\nKnowingly give false information to a system employee, or contracted security officer, engaged in the enforcement of a system ordinance or a state law, or otherwise obstruct the issuance of a citation for the violation of a system ordinance or a state law.\nViolate any of the conditions established by a transit system ordinance under which a passenger may board a transit vehicle with a bicycle and where that bicycle may be stowed on the transit vehicle.\n- Violations of Penal Code (15)04 are an infraction with a $250 fine.\n\nNOTE: This code may be “stacked” with other penal codes violations as appropriate.', '', '250'),
('77ec250e-01fe-435a-983f-df3e3b08bf19', '(10)03. Commercial Motor Vehicle Point System', 'A Commercial Motor Vehicle Driver shall earn points in accordance with the table below in addition to violations of (8).02.\n\nCodes: (10)01, 02, and 04\nPoints: 1\n\nThese points follow all of the same rules as (8).02.\nNOTE: A Commercial drivers license is not a separate license from a normal drivers license, as a result a suspension under this section suspends all driving privileges. The type of vehicle that the violation is received in does not matter for the purpose of this section. A person with a suspended license under this code and no other code may surrender his/her commercial drivers license and obtain a standard drivers license. In this case the person will have to meet all requirements (including retesting) after the end of the suspension period in order to re obtain the commercial drivers license.\n\n*Note if no CVE trained officers are on duty, these laws can be enforced by any uniformed officer.', '', ''),
('787805d0-f954-4136-9313-3185db589c22', '(6)02. Possession Of A Controlled Substance With Intent To Sell', 'A person in possession of a controlled substance, cannabis, or multiple controlled substances in a large quantity is guilty under this code section.\nA person in possession of a controlled substance or cannabis package individually in separate baggies or bindles is guilty under this code section.\nA person with a license to manufacture/sell cannabis cannot be charged under this penal code for violations involving cannabis.\nA person who possesses a substance that he/she claims is a controlled substance while committing a violation of penal code (6)06 is guilty under this code section in addition to (6)06.\n-Violations of Penal Code (6)02 is a felony with 120 seconds imprisonment and a $20,000 fine.', '120', '20000'),
('78fe701d-49ef-4d1e-9eae-f58c929e8c47', '(2)08. Petty Theft', 'A person who steals or takes the personal property of another worth $200 or less is guilty under this code section.\nA person who fails to pay a contract or invoice within a reasonable amount of time for services totaling less than $200 in value is guilty under this code section.\n- Violations of Penal Code (2)08 is a misdemeanor with a fine of $750.', '', '750'),
('79470624-618b-41a1-96d1-53a206ecbe0e', '(2)07. Armed Robbery', 'A person who takes property from the possession of another against their will, by means of force facilitated with a gun or any bladed weapon is guilty under this code section\n- Violations of Penal Code (2)07 is a felony with imprisonment for 390 seconds.\n\nNOTE: Armed Robbery stacks with any Title 1 crimes that are attempted during the robbery. It cannot stack with Robbery. A gun is considered any item that can inflict fear -- such as a taser, airsoft gun, or a fake gun.', '390', ''),
('7ab10975-18d0-411b-88a6-cefafd23b532', '(2)03. Trespassing within a Restricted Facility', 'A person who, without proper authorization, enters any government owned or managed facility that is secured with the intent of keeping ordinary citizens outside is guilty under this code section .\nSuch facilities include (but are not limited to) correctional institutions, airports, military encampments, and federally restricted spaces.\nThis does apply to local facilities, such as restricted areas within police stations, hospitals, and courthouses. The person(s) has to be asked only once to leave said restricted area and does not comply.\nThis charge cannot stack with (2)02. Trespassing\nThis charge cannot stack with any form of Burglary.\nNote: Part three only requires to be asked once, no additional requests or warnings are needed. The only part of said facilities that are restricted are parts that reasonably would be. (Ie. behind front desks, and areas behind closed doors. This does not apply for those who are given permission to go in these areas.)\n\n- Violations of Penal Code (2)03 are a felony with imprisonment for 80 seconds.', '80', ''),
('7bffc1d5-0167-4f33-a979-b13ff4f3df23', '(12)02. Restricted Boating Areas', 'Boats may not operate in any of the following areas:\nWithin 500’ of the Fort Zancudo military base or Los Santos International Airport\nAny area marked for swimming or marked not for entry by marine vessels.\n- Violations of Penal Code (12)02 are an infraction with a fine of $1,070.', '', '1070'),
('7ff68659-6d5a-4a48-ae5c-1ca57a3f632d', '(9)02. Brandishing A Firearm', 'A person who is pointing, holding in a harassing manner, openly carrying or brandishing a firearm, air or gas operated weapon, or object that appears like a firearm without proper toy and prop identification in an attempt to elicit fear or hysteria is guilty under this code.\nA person holding an object in a manner similar to a firearm who attempts to elicit the same fear or response as brandishing an actual firearm is guilty under this code.\n- Violations of Penal Code (9)02 is a misdemeanor with 60 seconds imprisonment and a fine of $1,000.\n\nNOTE: Brandishing explicitly notes that the purpose is to Intentionally elicit fear or hysteria. A Weapons Discharge violation is irrelevant of the intent to elicit hysteria so the two charges can be stacked if appropriate.', '60', '1000'),
('804def20-b702-4239-9684-d96a4037663f', '(12)06. Marine Vessel Registration', 'A person shall not operate any marine vessel unless it is registered and the appropriate fees have been paid under this code.\nAny marine vessel which is based in San Andreas or primarily used on the waters of San Andreas, shall be registered in San Andreas.\nException: A motor vehicle properly registered in any state and that has operated in San Andreas for under 90 days need not be registered in San Andreas.\nException: Any motor vehicle properly registered to the federal government.\nThe vessel registration document must be kept on the vessel at all times.\nException: Any marine vessel properly registered to the federal government.\nException: ((OOC Note: As marine vessels are not able to physically show a plate you will have to provide documentation to prove that the vessel is registered.))\nA person who sells a Marine Vessel must inform the Department of Marine Vessel within 24 hours of selling the marine vessel.\n((OOC Note: This is done by contacting a civilian supervisor or manager))\nProof of registration shall be carried in the marine vessel for which issued at all times while it is being operated in the State.\n-Violations of Penal Code (12)06 is an infraction with a fine of $500. A marine vessel that has not been registered may be impounded if operated on the waters of San Andreas.', '', '500'),
('82a5cfce-9048-451c-ab9a-8322a617504f', '(8)14. Following Distance', 'The driver of a vehicle shall not follow another vehicle more closely than is reasonable and prudent, having due regard for the speed of such vehicle and the traffic upon, and the condition of, the roadway.\nNo vehicle, except an authorized emergency vehicle, shall follow within 300 feet of any authorized emergency vehicle operating with lights or sirens\nThis section shall not apply to a police or traffic officer when serving as an escort\n- Violations of Penal Code (8)14 are an infraction with a $234 fine.', '', '234'),
('8408b77a-25dc-4a0d-8286-30d4c34217c4', '(13)02. Conspiracy', 'If two or more persons conspire to commit any crime, to falsely and maliciously to indict another for any crime, or to procure another to be charged or arrested for any crime, they shall be punished by the same punishment as if the offense was committed.', '', ''),
('865bd8c9-30c3-4579-a57c-613d5d4d7eae', '(11)02. Additional Certificate Requirements', 'A pilot that is operating an aircraft must have all of the following in his or her possession in addition to any documents required in any other section:\nA duty log book\nMedical Certificate\nAccurate Cargo Manifest (for cargo carrying vehicles only)\n- Violations of Penal Code (11)02 are an infraction with a fine of $11,000.', '', '11000'),
('87f09bc2-39b8-475d-afc4-710837294c53', '(16)03. Daily Limits and Possession Limits', 'No person may kill or attempt to kill an animal in excess of the limits listed below:\nBoar - No Limit\nCoyote - No Limit\nCrow - 24 per day, 48 total in possession\nDeer - 1 Per Permit/Tag issued\nFish - 5 per day, 5 total in possession\nMountain Lion - 1 Per Permit/Tag issued\nPigeon - 2 per day, 6 total in possession\nRabbit - 5 per day, 10 total in possession\n- Violations of Penal Code (16)03 are a misdemeanor with a $870 fine.', '', '870'),
('89a5df51-8697-4ef4-8ce6-e15b11d045d8', '(4)16. False Arrest', 'A peace officer, or person pretending to be a peace officer, who, under the pretense of any process or other legal authority, does any of the following, without a regular process or other lawful authority is guilty under this code section:\nArrests any person or detains that person against his or her will.\nSeizes or levies upon any property.\nDispossesses any one of any lands or tenements.\n- Violations of Penal Code (4)16 is a felony with 120 seconds imprisonment and a $10,000 fine.\n\nNOTE: Only a patrol supervisor can initiate proceedings against a peace officer who has violated this code. An officer who imprisons or fines a person without proper cause or procedure is subject to imprisonment under this law. ((The inclusion of this law does not indicate that it is acceptable for peace officers to ignore procedures. Ignoring procedures may result in OOC consequences. It is “acceptable” for civilians to violate this law if their “civ rank” allows such.))', '120', '10000'),
('89fb0eaf-a7d9-4e83-9655-f953818d7a11', '(2)02. Trespassing', 'A person who remains on a property after being told to leave by the property owner, an agent of the property owner, or a peace officer is guilty under this code section.\nThis cannot stack with (2)03. Trespassing within a Restricted Facility.\nThis crime cannot stack with any form of Burglary\n- Violations of Penal Code (2)02 are a misdemeanor with $1,000.\n\nNOTE: A person cannot trespass on their own property. A peace officer may not tell a person to leave his/her own property.', '', '1000'),
('8adf567b-6125-47b3-a911-973fe602624c', '(8)07. Accident Reporting Requirements - Property Damage', 'The driver of a motor vehicle who is in any manner involved in an accident originating from the operation of the motor vehicle that has resulted in damage to the property of any one person in excess of one thousand dollars ($1,000) shall report the accident to the local law enforcement office as soon as possible\nException: An accident that occurs on the drivers private property that only results in damage to the drivers property, and does not result in bodily injury or death need not be reported.\nEvery driver involved in the accident shall, unless rendered incapable, exchange with any other driver or property owner involved in the accident and present at the scene, all of the following information.\nDriver’s name and current residence address, driver’s license number, vehicle identification number, and current residence address of registered owner.\nEvidence of automobile insurance to include the name and address of the insurance company and the number of the insurance policy.\n- Violations of Penal Code (8)07 are a misdemeanor with a $1,000 fine.\n\nNOTES: This section is commonly referred to as Hit and Run.', '', '1000'),
('8b4d6243-a9d5-45a5-aace-d315b957ab96', '(11)07. Accident/Collision Reporting', 'In case of an accident or collision with persons or property upon the airspace of the state, the operator having knowledge of the accident or collision shall immediately Contact ATC about the nature of the accident or collision, to the extent that is safe and practical. The operator then must perform the actions below as applicable:\nIf the Accident/Collision is on the ground.\nIf the Accident/Collision is in the air they should declare Pan Pan Mayday or fully declared emergency call and land at the nearest airport/airfield or find the safest place to land while maintaining contact with ATC throughout the process.\nThe following should also be performed by the operator:\nShould contact ATC Immediately\nRemain at the scene of the accident or collision\nGiven his or her name/address and ownership information of the aircraft, along with registration, to any person(s) injured in the accident or collision\nGiven his or her name/address and ownership information to the operator, occupant, owner, or attendant of any aircraft or Vehicle damaged in the accident or collision\nGiven his or her name/address and ownership information to any law enforcement officer at the scene.\nSecurely attach in writing the required information in this section to an unoccupied or unattended Aircraft or Vehicle involved in the accident or collision.\n- Violations of Penal Code (11)07 are a misdemeanor with a fine of $2,000.', '', '2000'),
('8cf8105e-2354-4680-9df3-df1cefcc1162', '(4)11. Prisoner Breakout', 'A person who intentionally smuggles non-citizens into the state without proper visas and authorization is guilty under this code section.\nA person who intentionally restricts another’s liberty with intent for forced labor or sex trafficking, or other forced activities is guilty under this code section.\nThis charge does not stack with (1)10. Kidnapping\n- Violations of Penal Code (4)12 is a felony with 300 seconds imprisonment and a fine of $500,000.', '300', '500000'),
('8e96f4bd-faf4-4054-8d83-c7774ad52ec5', '(10)04. Duty Day Limits', 'A driver that is operating a commercial motor vehicle must comply with the following duty day requirements:\nA driver may drive for no more than 11 hours per 14 hour duty period\nA driver must take a 30 minute break every 8 hours\nA driver may be on duty no more than 14 hours per 24 hour period\nA driver must rest (be off duty) for 10 continuous hours per 24 hour period\nA driver shall maintain an E-Log which indicates the times at which the driver went on duty, off duty, was driving, and took his or her required breaks.\nDrives will keep records for 8 days including the current day.\n- Violations of Penal Code (10)04 are an infraction with a fine of $234. A commercial motor vehicle shall be put out of service for a violation of this section until such time that the violation is corrected, a legal driver takes possession of the vehicle, or a towing company moves the vehicle to private property that the vehicle is authorized to park on. A vehicle may not be put out of service for a violation that occurred prior to the last 10 hour rest period.\n\n*Note if no CVE trained officers are on duty, these laws can be enforced by any uniformed officer.', '', '234'),
('8eed2f13-7274-4b2b-93d7-bb3fadf3c8fe', '(7)01. Animal Abuse / Cruelty', 'A person who intentionally maims, mutilates, tortures, wounds, or kills a living animal is guilty under this code section.\nA person whose neglect maims, mutilates, tortures, wounds, or kills a living animal is guilty under this code section.\nA person who owns a pet or animal that is not reasonably considered domesticated, safe, or healthy for the animal or the owner, without a proper permit is guilty under this code section.\nA person who leaves an animal in an unattended vehicle under conditions that endanger the health of well-being of the animal is guilty under this code section. (Note: Added based on California Law)\n- Violations of Penal Code (7)01 is a felony with 90 seconds imprisonment and a fine of $20,000.\n\nNOTES: \"Domesticated\" refers to animals listed in this list of domesticated and semi-domesticated animals.', '90', '20000'),
('90bcedc9-78d4-4fda-9099-b598a623b1b1', '(1)11. Kidnapping', 'A person who forcibly, or by any other means of instilling fear, steals or takes, or holds, detains, or arrests any person is guilty under this code section.\nA person who commits false imprisonment for the purpose of protection of arrest is guilty under this code section.\n- Violations of Penal Code (1)11 are a felony with 210 seconds imprisonment.', '210', ''),
('92254f9a-c6fb-4072-893c-0de9016d4ce1', '(5)03. Incitement To Riot', 'A person who with the intent to cause a riot does an act or engages in conduct that urges a riot, or urges others to commit acts of force or violence, or the burning or destroying of property, and at a time and place and under circumstances that produce a clear and present and immediate danger of acts of force or violence or the burning or destroying of property is guilty under this code section.\n-Violations of Penal Code (5)03 is a misdemeanor with 80 seconds imprisonment and a $1,000 fine.', '80', '1000'),
('9271cec0-8052-49e7-89d1-8c9bdb01a04e', '(8)28. Alcohol Beverages in Motor Vehicles', 'No driver shall drink any alcoholic beverage while in a vehicle upon a roadway.\nNo passenger shall drink any alcoholic beverage while in a vehicle upon a roadway.\nNo person shall have in his or her possession on his or her person, while driving a vehicle upon a roadway any bottle, can, or other receptacle, containing any alcoholic beverage which has been opened, or a seal broken, or the contents of which have been partially removed.\nViolations of Penal Code (8)28 are an infraction with a $360 fine.\n\nNOTE: When the person committing the offense is under 21 years old this charge may be stacked with (7)04 Minor Alcohol Violation', '', '360'),
('969b56c6-7196-4e13-a258-9696b409c057', '(2)09. Grand Theft', 'A person who steals or takes the personal property of another worth more than $950 or a firearm of any value is guilty under this code section.\nA person who fails to pay a contract or invoice within a reasonable amount of time for services totaling more than $950 in value is guilty under this code section.\n- Violations of Penal Code (2)09 is a felony with 90 seconds imprisonment.', '90', ''),
('9ae8ab5b-5206-4776-92f5-8a6a7eff815f', '(8)21. Parking', 'No vehicle may park, with its driver outside the vehicle, in the following ways:\nIn a manner that obstructs a lane of traffic and prevents the flow of traffic.\nIn a manner that completely obstructs an alleyway.\nIn a manner that obstructs a parking lot entrance.\nWithin a marked crosswalk.\nIn a manner that obstructs more than two thirds of a sidewalk or pedestrian path.\nOn any median.\nFacing opposing traffic.\nWithin 15’ of a fire hydrant\nOn any bridges or tunnels.\nOn any state highway or freeway.\nOn railroad tracks or within range of being struck by a railroad car.\nIn the immediate ambulatory parking or bay area of a hospital or clinic.\nIn the immediate vicinity of Rodeo Bank\'s entrance, including the sidewalk adjacent to the metal barriers.\nIn front of or obstructing a private driveway or an entrance or exit to a private road or path.\nNo vehicle may park in a manner not permitted by the property owner. Private property may set its own parking rules, so long as they do not obstruct any public roads or sidewalks. Policies may also be set by a property manager authorized by the property owner. State agencies, such as the LSPD and others, may set parking rules for the facilities they maintain.\nA person who sitting in a vehicle, with the engine on or off, in any above location and refuses to move at the request of a peace officer or, if private property, by the property manager is guilty of an infraction under this section.\n- Violations of Penal Code (8)21 are a infraction with a fine of $234 and impoundment of the vehicle at the discretion of the peace officer.', '', '234'),
('9f32ba2c-ecc0-4633-a7af-9e1897f59f10', '(2)06. Robbery', 'A person who takes property from the possession of another against their will, by means of force or fear, such as through criminal threats, blunt weapons, assault or battery is guilty under this code section.\nThis charge cannot stack with (2)07. Armed Robbery.\n- Violations of Penal Code (2)06 is a felony with imprisonment for 150 seconds.\n\nNOTE : Robbery stacks with any Title 1 crimes that are attempted during the Robbery. It cannot stack with Armed Robbery, which is when the force, criminal threats , or fear involves a dangerous weapon. This applies with any weapon that isn’t bladed or a firearm.', '150', ''),
('9f408084-9c0c-4bc3-a6f9-de3368c8250e', '(15)03. Wiretapping Violation', 'A person who illegally conducts surveillance or wiretapping in violation of the one-party notification system without a warrant or authorization is guilty under this code.\nThere must be an expectation of privacy during the conversation in order to charge a person under this section.\n- Violations of Penal Code (15)03 are a felony with 90 seconds imprisonment and a $2,500 fine.\n\nNOTE: One-party notification means that at least one party being recorded visually or audibly is aware of that they are being recorded and consents to it.', '', '2500'),
('a1c9edd2-23d2-408b-8c04-56491678e6db', '(16)08. Poaching', 'A person who illegally takes, possesses, imports, exports, sells, purchases, barters, trades, or exchanges an animal, or part of any of those animals, for profit or personal gain, is guilty under this penal code.\n- Violations of Penal Code (16)08 are a misdemeanor with a $40,000 fine and 60 seconds imprisonment.', '60', '40000'),
('a2e44c66-a31d-4419-9047-a9930b369e98', '(13)00. Exception', 'Penal code entries, by default, may be modified by Sentencing Enhancements within Title 13. However, should a penal code entry be the exception to a Sentencing Enhancement or contain an exception within its description, then that exception shall be followed instead of the Sentencing Enhancement policy.\nFor example, (1)08. Murder cannot be charged for an attempt as an entire charge, (1)06. Attempted Murder , exists for that purpose.\nPenalties are, as stated, stack-able for each occurrence. Committing assault against someone multiple times is worthy of a charge for each time, as long as they are separate police incidents, occur at different time, occur to different people, or are charged for each prohibited object that is possessed. Charges can also be stacked for each person they are committed against. Unless an exception exists explicitly.\nEach stacked charge equals the additional punishment time for that charge. A person who commits two counts of assault will be charged twice the amount of time, so long as it does not violate maximum imprisonment policies.', '', ''),
('a2fe640b-62f4-40b6-a0c3-65b9d7711090', '(8)08. Accident Reporting Requirements - Injury or Death', 'The driver of a motor vehicle who is in any manner involved in an accident originating from the operation of a motor vehicle that has resulted in bodily injury, or in the death of any person shall report the accident to the local law enforcement office as soon as possible\nEvery driver involved in the accident shall, unless rendered incapable, exchange with any other driver or property owner involved in the accident and present at the scene, all of the following information:\nDriver’s name and current residence address, driver’s license number, vehicle identification number, and current residence address of registered owner.\nEvidence of automobile insurance to include the name and address of the insurance company and the number of the insurance policy.\nDrivers charged under this section may not be charged with violations of penal code (8)06 for events arising from the same accident.\n- Violations of Penal Code (8)08 is a felony with 120 seconds imprisonment and a fine of $10,000.\n\nNOTES: This section is commonly referred to as felony Hit and Run.', '120', '10000'),
('a3ca94ee-8f3f-4010-be9e-0ae636747413', '(4)10. Escape', 'Any person arrested, booked, charged, or convicted of any crime who thereafter escapes from a county or city jail, prison, community service, or custody of a Correctional or Parole Officer is guilty under this code section.\n- Violations of Penal Code (4)10 is a felony with 90 seconds imprisonment and a $10,000 fine in addition to any outstanding charges on an individual who commits an escape.', '90', '10000'),
('a42c9935-93ac-4d2e-bb37-e9cd66c45a4e', '(3)08. Pandering obscenity.', 'No person, with knowledge of the character of the material or performance involved, shall do any of the following:\n\nCreate, direct, produce, reproduce, or publish any obscene material, when the offender knows that the material will be publicly disseminated or displayed, or the subjects involved are under the influence and cannot give consent in any regard, or when the offender is reckless in that regard;\nPromote or advertise for sale, delivery, or dissemination; sell, deliver, publicly disseminate, publicly display, exhibit, present, rent, or provide; or offer or agree to sell, deliver, publicly disseminate, publicly display, exhibit, present, rent, or provide, any obscene material;\nAdvertise or promote an obscene performance for presentation, or present or participate in presenting an obscene performance, when the performance is presented publicly, or when admission is charged;\nBuy, procure, possess, or control any obscene material with purpose to violate.\n- Violations of Penal Code (3) 08 is a felony with 80 seconds imprisonment and a fine of $3,000.', '80', '3000'),
('a453c5c2-2f14-4dc2-87e5-f71a99b8b381', '(16)07. Hunting Under the Influence', 'No person may hunt, capture, bait, lure, or attempt to hunt, capture, bait, or lure any animals while intoxicated.\n- Violations of Penal Code (16)07 are a misdemeanor with a $1,470 fine.', '', '1470'),
('a61d9091-5b7f-4f91-b8e3-d35f4e3293a9', '(6)10. Littering', 'As used in this section, \"litter\" means garbage, trash, waste, ashes, cans, bottles, wire, paper, cartons, vessel parts, vehicle parts, furniture, glass, or anything else of an unsightly or unsanitary nature.\nNo person shall place any waste, refuse, litter or foreign substance in any area or receptacle except those provided for that purpose.\n-Violations of Penal Code (6)10 are an Infraction with a fine of $240.', '', '240'),
('a62cab6b-c10e-4ba0-902f-85fac7b46345', '(10)00. Applicability', 'This section applies to the operation of any vehicle that carries goods, property, or people for hire or any vehicle with a maximum gross weight of 26,000 lbs.\nSuch vehicles are referred to as commercial motor vehicles.\nAll commercial vehicles must comply with all section of Title 8 except where such code conflicts with a code in this Title in which case this Title is controlling\nExcept for (10)03 codes in this title may only be enforced by certified Commercial vehicle inspectors.\nCommercial vehicles may be stopped at any time by a certified commercial vehicle inspector in order to inspect said vehicle to ensure compliance with this title or title 8.\nIf no CVE trained officers are on duty, these laws can be enforced by any uniformed officer.', '', ''),
('a7f025fe-32f0-4b77-b73e-f1b92fb16f1b', '(1)08. Second Degree Murder', 'A person who unlawfully kills another with malice aforethought is guilty under this code section.\n- Violations of Penal Code (1)08 are a felony with 360 seconds imprisonment.', '360', ''),
('a8ac8ad9-c67d-4852-aac9-25125850152a', '(13)06. Accessory After the Fact', 'A person who knowingly and willingly helps another person who had successfully committed a criminal act shall receive HALF the punishment issued to the person who committed the criminal act.\nExamples include harboring a fugitive, helping destroy or distort evidence, withholding information relating to a crime or assisting the person elude or avoid police custody.', '', ''),
('a9411ce0-8d86-4231-bf54-590a3d811169', '(8)05. Driving Without a License', 'Any resident of San Andreas must have a driver\'s license issued by the State of Andreas.\nException: A person who has been a resident for under 10 days and has a valid driver\'s license in any state need not have a San Andreas Drivers Licenses.\nException: Any resident operating a motor vehicle properly registered to the federal government who is authorized by the federal government to operate that vehicle.\n- Violations of Penal Code (8)05 are a misdemeanor with a $1,000 fine. A vehicle that is being driven by someone without a valid driver’s license may be impounded.', '', '1000'),
('a9e6b611-8a85-4d52-ba4d-2f8018c7fdf6', '(9)07. Illegal Arms Trafficking', 'A person or entity who sells, transfers, or otherwise facilitates transfer of 5 or more firearms or other small arms in an unlawful manner or to a prohibited possessor/person or entity is guilty under this code section.\nA proven pattern of illegal arms sales must be proven prior to this charge being applied.\n- Violations of Penal Code (9)07 are a felony with 120 seconds imprisonment, a fine of $20,000\n\nNote: This charge can be stacked with (6)04 if the person or entity being charged is maintaining a property for the purpose of illegal arms trafficking.', '120', '20000'),
('ab6ea327-3dc5-487b-9a3c-182175eb64e9', '(5)02. Unlawful Assembly', 'Whenever two or more persons, assembled and acting together, make any attempt or advance toward the commission of an act which would be a riot if actually committed\nWhenever two or more persons assemble together to do an unlawful act, or do a lawful act in a violent, boisterous, or tumultuous manner is guilty under this code section.\nRemaining present at the place of any unlawful assembly, after the same has been lawfully warned to disperse, except public officers and persons assisting them in attempting to disperse the same is guilty under this code section.\n-Violations of Penal Code (5)02 is a misdemeanor with 60 seconds imprisonment and a fine of $1000.', '60', '1000'),
('ad107ebe-18ee-48db-ac96-ada4ce329099', '(8)22. Reckless Driving', 'A person who demonstrates a willful or wanton disregard for the safety of persons or property while operating a motor vehicle is guilty under this code section.\n- Violations of Penal Code (8)22 is a misdemeanor with a fine of $1,000', '', '1000'),
('b2454c10-72ff-4bff-b956-07ca32aecaee', '(5)01. Disturbing The Peace', 'Any person who unlawfully fights in a public place or challenges another person in a public place to fight is guilty under this code section.\nAny person who maliciously and willfully disturbs another person by loud and unreasonable noise is guilty under this code section.\nNOTE: If a person is warned or fined twice before within 24 hours of said warning or fine the equipment used to create loud and unreasonable noise may be seized.\nAny person who uses offensive words in a public place which are inherently likely to provoke an immediate violent reaction is guilty under this code section.\n-Violations of Penal Code (5)01 is a misdemeanor with a fine of $400.', '', '400'),
('b34cbe95-989f-480b-9738-b268a8812ce7', '(4)05. Failure To Identify To A Peace Officer', 'A person who, while being detained or under arrest by a peace officer, fails to provide a peace officer or other legal authority their name, date of birth, and/or DL number as it appears on an I.D. card or other identifiable information for MDC purposes is guilty under this code section.\n- Violations of Penal Code (4)05 is a misdemeanor with 60 seconds imprisonment and a fine of $1,000.\n\n((NOTE: Once a subject has been taken to jail for booking they shall provide their character information out of character if they elect to not identify in character.))', '60', '1000'),
('b6a88322-6aad-41e8-9ae0-5c17ec4a8007', '(4)20 Stolen Valor', 'A person is guilty under this code section if the person displays intent to obtain money, property, or other tangible benefit(s) while fraudulently holding himself or herself to be a recipient of the following military awards:\nMedal of Honor\nDistinguished Service Cross\nNavy Cross\nAir Force Cross\nSilver Star\nBronze Star\nPurple Heart\nCombat Action Ribbon\nCombat Infantryman\'s Badge\nCombat Action Badge\nCombat Medical Badge\nCombat Action Medal\nAny replacement or duplicate medal for such medal as authorized by law.  \nNote: The State of San Andreas has a searchable database which lists verified recipients of such medals above. Civilians must answer a Peace Officer\'s OOC verification questions genuinely or face receiving disciplinary action.\n\n-Violations of (4)20 are a felony with 300 seconds imprisonment and a fine of $10,000', '300', '10000'),
('b77a8f58-3db8-406c-a998-a9fecd67b37b', '(6)11. Criminal Loitering', '“Criminal loitering” refers to anyone who is lingering or hanging around in a public or private area, with the intent to commit criminal activity, or who is assisting and/or aiding another with a crime.\nActivities include but not limited to: Scoping, lookout, being a distraction, drawing out a plan, or layout, or a description of an area, building, or person.\nAny person who is in a public or private area, with the intent to help, plan and/or commit criminal activity, or who is assisting, planning, and/or aiding another with a crime with proof, is guilty under this code section.\n Violations of Penal Code (6)11 is a misdemeanor with 40 seconds imprisonment and a $2,000 fine.', '40', '2000'),
('b9e3d9c0-5fe4-4da2-a8c7-51ff9bd200c9', '(15)05. Tampering with records', 'No person, knowing the person has no privilege to do so, and with purpose to defraud or knowing that the person is facilitating a fraud, shall do any of the following:\nFalsify, destroy, remove, conceal, alter, deface, or mutilate any writing, computer software, data, or record.\nComplete and/or finish any writing or record, knowing it to have been tampered with as provided in division (1)(a) of this section.\n- Violations of Penal Code (15)05 are a felony with a $5000 fine and 120 seconds imprisonment.', '120', '5000'),
('ba2be959-5379-4104-9d04-6330f927d4b4', '(8)10. Traffic Signals - Responsibility at a Green Signal', 'A driver facing a circular green signal shall proceed straight through or turn right or left or make a U-turn unless a sign prohibits a U-turn. Any driver, including one turning, shall yield the right-of-way to other traffic and to pedestrians lawfully within the intersection or an adjacent crosswalk.\nA driver facing a green signal shown immediately in front of a lane marked for a left or right turn shall enter the intersection only to make the movement indicated by pavement markings or any other movement that is permitted by other indications shown at the same time. A driver is permitted to make a left turn may also make a U-turn unless prohibited by a sign. A driver shall yield the right-of-way to other traffic and to pedestrians lawfully within the intersection or an adjacent crosswalk.\nA pedestrian facing a circular green signal, unless prohibited by sign or otherwise directed by a pedestrian control signal, may proceed across the roadway within any marked or unmarked crosswalk, but shall yield the right-of-way to vehicles lawfully within the intersection at the time that signal is first shown.\n- Violations of Penal Code (8)10 are an infraction with a $234 fine for vehicular violations and a $194 fine for pedestrian violations.', '', '234'),
('bc690916-aacd-404f-ac91-85cb63ddb878', '(1)12. Torture', 'A person who intentionally causes extreme pain and suffering to someone is guilty under this code section.\nA person who causes pain and suffering for the purpose of revenge, extortion, persuasion, or for any sadistic purpose is guilty under this code section.\n- Violations of Penal Code (1)12 are a felony with 600 seconds imprisonment.', '600', ''),
('be4c3701-5ce0-47e5-b58c-36f25c49a5b6', '(4)07. Obstruction Of A Government Employee', 'A person who shows a clear and motivated attempt to prevent a government employee from conducting their duties is guilty under this code section.\nA person who fails to comply with an officer\'s lawful orders is guilty under this code section.\n- Violations of Penal Code (4)07 is a misdemeanor with 60 seconds imprisonment and a $1,000 fine.\n\nNOTE: A government employee would need to contact a peace officer to get the charge of Obstruction issued.', '60', '1000'),
('c01c314b-86fd-4ccb-83b2-b6b280a256a5', '(4)19 Contempt of Court', 'A person who is disrespectful of the court process, or ignores a court order is guilty under this code section.\nExample includes but are not limited to being excessively loud or belligerent, refusing to be sworn in as a witness, refusing to comply with a judges request, and willfully disobeying a court order.\nNote: This section must be charged by a judge. ((Because court proceeding are out of game this charge should be filed as a warrant so that the time will be served at the time of the next jailing))\n\n-Violations of (4)19 are a misdemeanor with 60 seconds imprisonment and a fine of $1000', '60', '1000'),
('c0fadd6d-cab0-4297-a069-5551c057c534', '(4)15. Introduction Of Contraband', 'A person who provides contraband to an inmate of a correctional facility, or attempts to enter a facility with contraband within his or her control is guilty under this code section.\n- Violations of Penal Code (4)15 is a felony with 120 seconds imprisonment.', '120', ''),
('c23220c6-5c69-4431-afe5-f5b5e66b1e91', '(11)06. Alcohol Rules', 'No person may operate an aircraft under the following conditions:\nHaving had alcohol within the last 8 hours\nWith a blood alcohol level over 0.04 percent\nUnder the influence of any drug contrary to safety\n- Violations of Penal Code (11)05 are an infraction with a fine of $11,000 and suspension of his or her pilot’s license for 3 days.\n\nNOTE: This charge is stackable with 8(26) or 8(27) as appropriate.', '', '11000'),
('c2a4bdec-3a18-4228-ab34-0a7a4f3b940a', '(8)31. Vehicle Equipment', 'All motor vehicles operated on a road shall be equipped with the following operational equipment:\nNote: Golf carts are considered motorcycles for the purposes of this section as long as they only operate on roads with speed limits of 25 mph or less. Golf carts may not operate on roads with speed limits over 25 mph.\n2 Headlights\nException: Motorcycles and golf carts may have only 1 headlight\nHeadlights must be operated during darkness and/or inclement weather\nHigh beams may not be used within 500’ of an oncoming vehicle traveling in the opposite direction or within 300’ behind a vehicle travelling in the same direction.\n2 Red Taillights\nTaillights must be operated during darkness and/or inclement weather\n2 Red Stop lights\nStop lights may be combined with taillights\nStop lights must operate with the brake pedal is pressed\n4 Turn signals\nNot required if hand signals are used except for commercial motor vehicles.\n1 White backup light\nBackup lights must operate when the vehicle is moving in reverse\nWindshield\nException: Motorcycles\n2 Rear view Mirrors, 1 of which must be on the left side of the car in view of the driver\nException: Motorcycles only require 1 rear view mirror\n((OOC Note: Some vehicles do not meet the proper requirements listed under this code section by default. Those vehicles do not apply to this section.))\nHorn\nHorns may only be used when reasonably necessary to insure safe operation. Any other use is a violation of this section\n%* Tires as appropriate\nTires must be rubber in nature and no metal may contact the road surface.\n* Fenders/body panels that are at least as wide as the tire thread\nException: Motorcycles\nRiders of a motorcycle must wear a helmet\nVisibility of the wearer must not be obstructed\nCan not contain any metal ornaments\nMust be approved by the state as a legal and safe helmet \nException: Golf carts\n* Front and rear bumper\nException: Motorcycle\n%* Brakes\n%* All cargo and passengers must be secure and located in a location designed for them.    \nAll vehicles may not be equipped with any of the following equipment:\nFlashing lights\nException: Emergency vehicles, construction vehicles, utility vehicles, turn signals, and tow trucks\nException: Volunteer firefighters responding to an emergency can display a flashing blue light.\n* Any blue lights or red light visible from the front or side of the vehicle.\nException: Emergency vehicles\nException: Volunteer firefighters responding to an emergency can display a flashing blue light.\nAny markings that match emergency vehicles\nException: Emergency vehicles\nSirens\nException: Emergency vehicles\nAftermarket Hydraulic Equipment that changes the height ride of any portion of the car either temporarily or permanently.\nA vehicle may be equipped with hydraulic equipment as described above, however use of that equipment on a road is a violation of this code.\nArmor\nExcept for an approved armored car.\n* No vehicle may expel any liquid (except water) or smoke onto the road surface.\n-Violations of Penal Code (8)31 are an infraction with a $194 fine.\n\nSpecial Enhancements: \n\nIf the equipment missing is indicated with a * the vehicle may be impounded at the discretion of the officer.\nIf the equipment missing is indicated with a % the vehicle may be put out of service if it is a commercial motor vehicle\nNOTE: Each piece of equipment missing or not authorized is a violation of this code. For example a car missing a headlight and a taillight would be charged with 2 counts of this offense.', '', '194'),
('c3a47870-4476-455a-83b1-bdec2ced4761', '(7)03. Minor Alcohol/Cannabis Violation', 'A person under the age of 21 who is in possession of products containing alcohol or cannabis, or who appears to be under the influence of alcohol or cannabis is guilty under this code section.\nA person who carried more cannabis then is allowed by a person in penal code (6)01 and is under the age of 21 shall be charged under penal code (6)01.\nNote that this section does not apply on private property with someone present who is 21 years of age or older.\n- Violations of Penal Code (7)03 is a misdemeanor with a fine of $500.', '', '500'),
('c4048016-beaf-4519-8192-5a3670a48bc9', '(1)15. Desecration of a Human Corpse', 'It is unlawful for any person to knowingly, and willfully desecrate a human corpse for any of the following purposes:\n\nTampering with the evidence of a crime\nCamouflaging the death of a human being\nDisposing of a dead body\nImpeding or prohibiting the detection, investigation, or prosecution of a crime\nAltering, inhibiting or concealing the identification of a dead body, a crime victim, or a criminal offender\nDisrupting, prohibiting, or interfering with any law enforcement agency or the office of the coroner in detecting, investigating, examining, determining, identifying or processing a dead body, cause of death, the scene where a dead body is found, or any forensic examination or investigation relating to the dead body or a crime.\n- Violations of Penal Code (1)15 are a felony with 300 seconds imprisonment and a fine of $8,000.\n\nNote: “Desecration of a human corpse” means any act committed after the death of a human being including, but not limited to, dismemberment, disfigurement, mutilation, burning, or any act committed to cause the dead body to be devoured, scattered or dissipated; except, those procedures performed by a state agency or licensed authority in due course of its duties and responsibilities.', '300', '8000'),
('c775f5bd-0da4-48e1-95c0-2f769ef75cd0', '(8)11. Traffic Signals - Responsibility at a Red Signal', 'A driver facing a steady circular red signal alone shall stop at a marked limit line, but if none, before entering the crosswalk on the near side of the intersection or, if none, then before entering the intersection, and shall remain stopped until an indication to proceed is shown, except as provided in element 2.\nExcept when a sign is in place prohibiting a turn, a driver, after stopping as required by element 1, facing a steady circular red signal, may turn right, or turn left from a one-way street onto a one-way street. A driver making that turn shall yield the right-of-way to pedestrians lawfully within an adjacent crosswalk and to any vehicle that has approached or is approaching so closely as to constitute an immediate hazard to the driver, and shall continue to yield the right-of-way to that vehicle until the driver can proceed with reasonable safety.\nA driver facing a steady red signal shown immediately in front of a lane marked for a left turn shall not enter the intersection to make the movement indicated by the pavement markings, and, unless entering the intersection to make a movement permitted by another signal, shall stop at a clearly marked limit line, but if none, before entering the crosswalk on the near side of the intersection, or if none, then before entering the intersection, and shall remain stopped until an indication permitting movement is shown.\nUnless otherwise directed by a pedestrian control signal a pedestrian facing a steady circular red or red arrow signal shall not enter the roadway.\n- Violations of Penal Code (8)11 are an infraction with a $480 fine for vehicular violations and a $194 fine for pedestrian violations.', '', '480'),
('c962de07-f8d7-4c61-b025-145eafeb7cc9', '(8)01. Applicability', 'This title applies to the operation of any vehicle or bicycle on any road within San Andreas.\nThis title also applies to pedestrians who are present on any road within San Andreas or any walkway/sidewalk immediately adjacent to a road.\nA “road” or “highway” is a way or place of whatever nature, publicly maintained and open to the use of the public for purposes of vehicular travel.\nA “vehicle” is a device by which any person or property may be propelled, moved, or drawn upon a highway, excepting a device used exclusively upon stationary rails or tracks. A bicycle is a type a vehicle.\nA “motor vehicle” is a vehicle that is not exclusively moved by human power.\nWhen a vehicle is impounded under this section it may be recovered after 1 day by the registered owner unless otherwise stated in this section. Said owner must demonstrate he/she has a valid drivers license, vehicle registration, insurance, and must pay the impound fee (($150 per day)). A vehicle may be recovered without registration and/or insurance if it is towed out of the impound lot. A vehicle not recovered after 30 days may be sold by the state.', '', ''),
('ca3b747b-a39c-4d98-82f8-910cfefa8fb9', '(2)01. Arson', 'A person who intentionally and maliciously sets fire to or burns any structure, forest land, or property without prior authorization is guilty under this code section.\nA person who intentionally aids, counsels, or helps facilitate the burning of any structure, forest land, or property without proper authorization is guilty under this code section.\nA person who, through criminal accident or negligence, causes a fire to burn any structure, forest land, or property is guilty under this code section.\n- Violations of Penal Code (2)01 are a felony with 210 seconds imprisonment.\n\nNOTE: Arson’s criminality is when someone intentionally creates or helps create a fire.', '210', ''),
('cc0b4f65-7b31-4f1c-a1f7-98552d2b88e0', '(2)16. Destruction Of Government Property', 'A person that defaces, damages, or destroys property which belongs to the government is guilty under this code section.\n- Violations of Penal Code (2)14 is a misdemeanor with 120 seconds imprisonment and a fine of $2,000.\n\nNOTE: This section only applies to vehicles and buildings (exterior / interior) that are being defaced, damaged, or destroyed.', '120', '2000');
INSERT INTO `penal_codes` (`id`, `title`, `des`, `jail_time`, `fine_amount`) VALUES
('cd525ebc-0132-4865-a77b-5db9a7bce8a6', '(16)02. Hunting Permits', 'No person may hunt, capture, bait, lure, or attempt to hunt, capture, bait, or lure any of the following animals without a permit from the fish and game service:\nBoar\nCoyote\nCrow\nDeer\nFish\nMountain Lion\nPigeon\nRabbit\nThe fish and game service may impose limits and requirements that must be met in order to issue a permit.\nThe fish and game service may issue a permit for one type of animal or multiple types of animals.\nA person who hunts, captures, baits, lures, or attempts to hunt, capture, bait, or lure any of the listed animals is guilty under this penal code.\nA person must display her or his permit to a fish and game warden upon request.\nA person who violates any penal code in this title may have his or her permits revoked at the discretion of the fish and game service.\n- Violations of Penal Code (16)02 are a misdemeanor with a $870 fine.', '', '870'),
('cf0ecd5f-6f78-44ae-909f-0aa84992f493', '(3)09. Harassment', 'A person who makes communication, whether in person or by means of internet, phone, or other devices (may also apply to circumventing a “block” on a phone number) with the repeated intent to cause annoyance. \nA person who repeatedly communicates by some medium with another person who made it known, and clear they do not consent or want such communication.\nAny person who is found in violation with proof, is guilty under this code section.\n\n\n-Violations of Penal Code (3).09 is a misdemeanor with a fine of $1,000 and 60 seconds imprisonment.', '60', '1000'),
('d182bf4a-784b-40a8-b62e-62a8efdf0df4', '(12)09. Vessel Logs', 'All marine vessels except jet-ski are to provide the vessel logs upon being boarded by port authority officers\nLogs must show the following:\nVessel registration\nVessel certificate of safety (outlines all of the safety equipment as standard and as extra)\nListed equipment of safety (especially fire extinguishers expiry date is still within a 3 month period) \nPorts of call/berth\nName of skipper\nViolations of Penal Code (12)09 is an infraction of $3,000 and vessel will be seized/ impounded with a $150 impound fee (per day)', '', '3000'),
('d28fb986-5ef8-41d5-bce5-96f8ee238395', '(11)03. Duty Day Limits', 'A driver that is operating an aircraft carrying persons or property for hire must comply with the following duty day requirements:\nA pilot may drive for no more than 8 hours per 16 hour duty period\nA pilot may be on duty no more than 16 hours per 24 hour period\nA pilot must rest (be off duty) for 8 continuous hours per 24 hour period\nA pilot shall maintain a logbook which indicates the times at which the driver went on duty, off duty, was driving, and took his or her required breaks.\nPilots will keep records for 7 days including the current day.\n- Violations of Penal Code (11)03 are an infraction with a fine of $11,000 and suspension of his or her pilot’s license for 3 days. An airplane shall be put out of service for a violation of this section until such time that the violation is corrected. An airplane may not be put out of service for a violation that occurred prior to the last 10 hour rest period.', '', '11000'),
('d34f4eac-e457-4614-a50a-0407139c0b90', '(4)03. False Information To A Government Employee', 'A person who provides false information or details to a peace officer during the course of a criminal investigation or lawful detainment is guilty under this code section.\nA person who provides knowingly inaccurate data to a government employee investigating in some official capacity is guilty under this code section.\n- Violations of Penal Code (4)03 is a misdemeanor with 60 seconds imprisonment and a fine of $1,000.', '60', '1000'),
('d3bd8c8b-aefe-4a57-b227-d3a5fa1e1d22', '(8)30. Felony Evading A Peace Officer', 'A person who violates penal code (8)29 and (8)22 is guilty of an additional offense under this code.\nThis charge cannot be stacked with (8)29.\n- Violations of Penal Code (8)30 are a felony with 100 seconds imprisonment, a fine of $10,000, and impoundment of the vehicle used.\n\nNOTE: When an injury occurs this charge can be stacked with assault with a deadly weapon. When a death occurs this charge can be stacked with manslaughter.', '100', '10000'),
('d52e0a06-2ae4-4546-a5db-76808b4d0099', '(1)02. Assault', 'A person who intentionally puts another in the reasonable belief of imminent physical harm or offensive contact is guilty under this code section.\n- Violations of Penal Code (1)02 are a misdemeanor with 60 seconds imprisonment and a fine of $1,000.\n\nNOTE: Assault is defined by distance the threats occur. Someone a few feet away threatening to harm or kill you at any moment is assault. Criminal Threats is less severe as there’s a distance that someone can escape through, or that the perpetrator has more time to reconsider the threat. Any unwanted physical contact is considered to be battery, however grabbing someone during a threat may be either assault or battery, depending on intention and interpretation.', '60', '1000'),
('d56703ed-b55d-4fd5-9f2b-eba04d800182', '(11)04. Equipment', 'All equipment and lights on an aircraft must be in working order.\n- Violations of Penal Code (11)04 are an infraction with a fine of $11,000 and suspension of his or her pilot’s license for 3 days. An airplane shall be put out of service for a violation of this section until such time that the violation is corrected.', '', '11000'),
('d605840f-a171-4242-a0de-d25bffccbc70', '(8)33. Implied Consent', 'Any resident of the State of San Andreas that has applied for a driver\'s license – whether it is currently valid, expired, or suspended – gives consent to submit to standardized field sobriety testing in order to determine impairment, of which testing is either:\nBreath testing\nChemical/blood testing\nShould a driver refuse testing and a sworn law enforcement officer has reasonable suspicion to charge 8.26 Driving Under the Influence or 8.27 Enhanced Driving Under the Influence then the driver will also be subject to the following penalties under this provision:\nAn additional misdemeanor jail sentence of 60 seconds.\nAn additional fine of $1,000.\nAn additional 7 days of license suspension.\nDrivers who do not give reasonable suspicion for 8.26 or 8.27 cannot be charged with this provision.', '', ''),
('d6de507a-38da-482b-95e0-7f7d5aff7d42', '(1)09. First Degree Murder', 'A person who commits murder while engaging in a felony offense that has been proven to be a premeditated act is guilty under this code section.\nA person who commits murder which is done in a way that is willful, deliberate and premeditated is guilty under this code section.\n*Note* Any death that is from negligence, from outside of the person who committed the act control, then they cannot be charged under this section. Example: If a person who is injured, who has a person who has the ability to call for help or has emergency services on scene who through either negligence, or lack of action and that person dies, they can’t be charged under this section. It would fall under Second Degree.\n\n- Violations of Penal Code (1)09 are a felony with life-sentence imprisonment. ((This means that the character will be deleted and may not be used again by any civilian within the community)).', '0123456789', ''),
('d6f67fae-ec83-44cf-a3d3-c5de3c5d5549', '(2)04. Burglary', 'A person who enters a structure without the permission of the owner or agent of the owner is guilty under this code section.\nThis crime cannot stack with any form of Trespassing.\n- Violations of Penal Code (2)04 are a misdemeanor with 70 seconds imprisonment and a fine of $5000.\n\nNOTE : Burglary can include homes, apartments, offices, vehicles or any locked space with restricted access. Burglary is also committed irrelevant if any theft or other crime takes place. A less severe act of burglary is trespassing, which would account for instances where there is no intent to commit a crime, no locked door or other physical restriction. The occupancy state of the structure is not relevant to this penal code. This charge can stack with robbery and or theft as appropriate.', '70', '5000'),
('d7982d3f-7d5f-443d-a666-3672b02a837f', '(9)05. Duty to Inform', 'A person who fails to immediately inform a peace officer of a firearm or deadly weapon that is concealed on the person or within his or her control or Within the first part of contact. is guilty under this code section. Informing a peace officer must occur within the first part of contact with a peace officer, or exceed the expiration of the initial contact, whichever is shorter.\nA person who fails to allow a peace officer to secure the deadly weapon, or fails to secure the weapon at the discretion of the peace officer during the duration of the contact is guilty under this code section.\n- First offenses of penal Code (9)05 is an Infraction and a fine of $1000\n\n- Second offenses of penal Code (9)05 is misdemeanor with 60 seconds imprisonment, a fine of $2000, and license revocation\n\n- Third offence of penal Code (9)05 is a felony with 100 seconds of imprisonment, a fine of $5000', '', ''),
('d80e5b39-b905-4ab4-a1af-90ff12c330b1', '(16)01. Prohibition on Hunting', 'No person may hunt, capture, bait, lure, or attempt to hunt, capture, bait, or lure any of the following animals:\nCat\nDog\nChicken\nHawk\nCormorants\nCow\nDolphin\nHen\nMonkey\nSeagull\nShark\nStingray\nWhale\nNo person shall hunt any domesticated animals, or tame and partially domesticated animals that can be proven owned by another person or entity. \n\nReference:https://en.wikipedia.org/wiki/List_of_domesticated_animals\nA person who kills or injures an animal listed above for the purpose of self defense or under the direction of a fish and game warden may not be charged under this section.\n- Violations of Penal Code (16)01 are a misdemeanor with a $2,070 fine.', '', '2070'),
('d8ad1587-406e-4245-b305-153d093eefec', '(10)01. Drivers Licenses', 'No person may operate a commercial motor vehicle on any road without a commercial drivers license for the type of vehicle being driven.\n\nNo person shall have in his or her possession or otherwise under his or her control more than one driver’s license.\nThe licensee shall have the valid driver’s license issued to him or her in his or her immediate possession at all times when driving a motor vehicle upon a highway.\n- Violations of Penal Code (10)01 are an infraction with a fine of $234. A vehicle that is being driven by someone without a valid driver’s license may be impounded and shall be put out of service until such time that the violation is corrected or a towing company moves the vehicle to private property that the vehicle is authorized to park on.\n\n*Note if no CVE trained officers are on duty, these laws can be enforced by any uniformed officer.', '', '234'),
('d8aeeee3-08aa-45ae-a6df-fb1d83c03611', '(1)06. Attempted Murder', 'A person who takes a direct step towards killing another person and intended to kill that person is guilty under this code section .\nA person who is hired to murder, slay, or execute another person for material or financial gain, even if a direct step towards the killing is not taken, is guilty under this code section.\n- Violations of Penal Code (1)06 are a felony with 240 seconds imprisonment and a fine of $10,000.', '240', '10000'),
('d90d4536-7940-4bd9-8298-48df31ff53f9', '(11)00. Applicability', 'This section applies to the operation of any aircraft to include airplanes or helicopters.\nAircraft must comply with all other Titles except those listed below:\n(8)01 through (8)06\n(8)09 through (8)20\n(8)23\n(8)31', '', ''),
('dcb196a5-b46d-4c44-84fb-e4936316cade', '(13)01. Attempt', 'A person who attempts to commit any crime, but fails or is prevented or intercepted in its perpetration, shall be given the same punishment as if the offense was committed.', '', ''),
('e147cd84-95aa-4681-af34-cdf4a55a1df7', '(9)01. Possession Of An Illegal Weapon', 'No person may sell, create, or possess any weapon listed below with the intent of criminal activity:\nA blade or improvised blade over three inches in length that can be used as a cutting, slashing or stabbing weapon, whether or not concealed.\nA bullet containing any explosive agent\nA concealed explosive substance\nMetal knuckles\nGrenades\nAny firearm that is not registered\nAny fully automatic firearm or parts without proper licenses\nAny firearm in a manner that is against any firearms license restrictions that have been issued\nNo person under the age of 18 may possess a weapon.\nException: A peace officer may possess or use such a weapon when required to do so under the performance of his/her peace officer duties.\n- Violations of Penal Code (9)01 is a misdemeanor with 60 seconds imprisonment and a $1,000 fine. ', '60', '1000'),
('e1494329-87fe-48d5-9c39-5c0b45d90049', '(15)06. Unauthorized use of computer, cable, or telecommunication property', 'No person, in any manner and by any means, including, but not limited to, computer hacking, shall knowingly gain access to, attempt to gain access to, or cause access to be gained to any ...\nComputer\nComputer system\nComputer network\nCable service\nCable system\nTelecommunications device\nTelecommunications service\nInformation service \n... without the consent of, or beyond the scope of the express or implied consent of, the owner of said device, network or service or other person authorized to give consent.\nNo person shall knowingly gain access to, attempt to gain access to, cause access to be granted to, or disseminate information gained from access to the law enforcement automated database system without the consent of, or beyond the scope of the express or implied consent of, the law enforcement heads of department.\n- Violations of Penal Code (15)06 are a felony with a $1000 fine and 120 seconds imprisonment.', '120', '1000'),
('e20e4319-657c-4c66-bedc-bf02f0bc43d9', '(12)08. Boating Without a License', 'A person who operates a marine vessel without a valid license is guilty of a crime under this section.\nAny resident of San Andreas must have a boating license issued by the State of Andreas.\nException: A person who has been a resident for under 10 days and has a valid boating license in any state need not have a San Andreas boating Licenses.\nException: Any resident operating a marine vessel properly registered to the federal government who is authorized by the federal government to operate that vessel\n- Violations of Penal Code (12)08 are a misdemeanor with a $1,000 fine. A vessel that is being operated by someone without a valid boating license may be impounded.', '', '1000'),
('e227c84c-30b2-4874-9dd6-edd51000ae2b', '(13)03. Soliciting', 'A person who solicits for the commission or perpetration of any crime shall be punished by the same punishment as if the offense was committed.', '', ''),
('e3c89341-ceee-4165-be7a-789e6c168273', '(3)01. Lewd Or Dissolute Conduct In Public', 'A person who solicits anyone to engage in inappropriate sexual or sexually suggestive conduct in any public place or in any place open to the public or exposed to public view is guilty under this code section.\nA person who touches his or her private parts in any place open to the public or exposed to public view is guilty under this code section.\nA person who solicits or engages in sexual activity in a public place or any place open to public view  is guilty under this code section.\n- Violations of Penal Code (3)01 is a misdemeanor with a fine of $1,000.', '', '1000'),
('e4642605-df7f-4c57-ac21-2c25fa347fd4', '(8)03. Vehicle Registration', 'A person shall not drive, move, or leave standing upon a highway, or in an off street public parking facility, any motor vehicle, trailer, semitrailer, pole or pipe dolly, or logging dolly, unless it is registered and the appropriate fees have been paid under this code.\nAny motor vehicle which is based in San Andreas or primarily used on San Andreas highways, shall be registered in San Andreas\nException: A motor vehicle properly registered in any state and that has operated in San Andreas for under 90 days need not be registered in San Andreas.\nException: Any motor vehicle properly registered to the federal government.\nLicense plates shall at all times be securely fastened to the rear of the motor vehicle for which they are issued, fastened so as to prevent the plates from swinging, shall be mounted in a position so as to be clearly visible, and so that the characters are upright and display from left to  right, and shall be maintained in a condition so as to be clearly legible.\nException: Any motor vehicle properly registered to the federal government.\nException: Motor Cycles may mount plates vertically\nException: Vehicles and trailers being towed by another vehicle do not require displayed license plates as long as the towing vehicle displays a license plate.\n((OOC Note: Some vehicles do not allow the proper display of plates under this section. In this case as long as the Civilian provides a valid registration that can be ran (a plate) this section is considered complied with. Do note that dirt bikes are not road legal.))\nA person who sells a motor vehicle must inform the Department of Motor Vehicles within 24 hours of selling the motor vehicle.\nProof of registration shall be carried in the motor vehicle for which issued at all times while it is being operated in the State\n- Violations of Penal Code (8)03 are an infraction with a fine of $194. A motor vehicle that has not been registered may be impounded if driven on a road.', '', '194'),
('e5bade2f-a624-4493-b614-b7d27a44ecc9', '(1)05. Aggravated Battery', 'A person who commits battery and serious bodily injury is inflicted on the person is guilty under this code section.\n- Violations of Penal Code (1)05 are a felony with 120 seconds imprisonment.', '120', ''),
('e5f3b167-3c0d-412a-8104-1761f829c18f', '(6)06. Sale Or Transportation Of A Controlled Substance', 'A person who sells, offers to sell, transports with the intent to sell, or gives away a controlled substance to another person, regardless of whether or not they possess that controlled substance is guilty under this code section.\nA person who has a license to sell cannabis and is doing so from a commercially zoned establishment is not subject to this penal code for such sells.\n-Violations of Penal Code (6)06 is a felony with 240 seconds imprisonment and a fine of $20,000.\n\nNOTE: Since it’s irrelevant of possession, this charge can indeed stack with whatever the present possession of a drug is on someone if they are in fact also in illegal possession of a controlled substance. This means anyone caught selling a controlled substance is also charged with whatever possessions they currently have too.', '240', '20000'),
('e67f4f97-9fc0-4480-acc0-5c0a5cf295d1', '(1)03. Assault With A Deadly Weapon', 'A person who attempts to cause or threaten immediate harm to another while using a weapon, tool, or other dangerous item to communicate that threat is guilty under this code section.\n- Violations of Penal Code (1)03 are a felony with 120 seconds imprisonment and a fine of $10,000.', '120', '10000'),
('e7c353d8-c467-4782-ab0b-4386e1c8bc6a', '(6)08. Under The Influence Of A Controlled Substance', 'A person who uses or is under the influence of a controlled substance or dangerous substance without the proper permits or prescription to use such a substance is guilty under this code section.\n-Violations of Penal Code (6)08 is a misdemeanor with 60 seconds imprisonment.', '60', ''),
('ea069bd1-49fa-43e1-ae9d-a0045fa909ab', '(4)08. Resisting A Peace Officer', 'A person who avoids apprehension from an officer by non-vehicular means or resists apprehension by any physical means is guilty under this code section is guilty under this code section.\nThis charge does not include the attempt to flee and elude by vehicular means, which is (8)29. Evading a Peace Officer.\n- Violations of Penal Code (4)08 is a misdemeanor with 60 seconds imprisonment and a $1,000 fine.\n\nNOTE: Resisting with physical violence can additionally result in assault and/or battery charges. This section does not apply to citizen\'s arrest. Resisting a citizen’s arrest may be considered battery when unreasonable force is used.', '60', '1000'),
('eaa8fa24-5f89-4f34-b21a-e4c1aa7b1f09', '(3)02. Indecent Exposure', 'A person who intentionally exposes their naked body or genitalia on public property, in the view of the public, or in the public area of a privately owned business is guilty under this code section.\nA person who intentionally exposes their naked body or genitals to another person without that person\'s consent is guilty under this code section.\nA person who intentionally exposes their naked body or genitalia on private property without permission of the property owner is guilty under this code section.\nA person who engages in sex or other sexual activity in view of a minor, or in the view of the public, is guilty under this code section.\n- Violations of Penal Code(3)02 is a felony with 60 seconds imprisonment and a fine of $1,000.\n\nNOTE: Private parties / reservations in public areas are considered public events that can be restricted with restricted view, and therefore permit naked bodies. It is when it is in a public area or exposed to children that it is indecent exposure.', '60', '1000'),
('ebcf971c-170c-4fa4-9a84-0a82b21dba1b', '(10)02. Additional Certificate Requirements', 'A driver that is operating a commercial motor vehicle must have all of the following in his or her possession in addition to any documents required in any other section:\nExcept for trips that remain with 1 county.\nA duty log book\nMedical Certificate\nAccurate Cargo Manifest (for cargo carrying vehicles only)\nComplete drivers vehicle inspection record\n- Violations of Penal Code (10)02 are an infraction with a fine of $234. A commercial motor vehicle shall be put out of service for a violation of this section until such time that the violation is corrected or a towing company moves the vehicle to private property that the vehicle is authorized to park on.\n\n*Note if no CVE trained officers are on duty, these laws can be enforced by any uniformed officer.', '', '234'),
('ec4c498b-b7cc-4d26-99bf-8c6cfa0e8e6d', '(2)11. Receiving Stolen Property', 'A person who knowingly buys or receives any property that has been stolen or that has been obtained in any manner constituting theft or extortion is guilty under this code section.\n- Violations of Penal Code (2)11 is a felony with 90 seconds imprisonment and a fine of $10,000.\n\nNOTE: If an officer can prove that the individual should have known the item was stolen based on outside factors, such as the price or quality, or any sort of common knowledge, then the person can be charged.', '90', '10000'),
('ec788634-50b1-40aa-ba77-a54f045d62a8', '(8)16. Right of Way - Emergency Vehicles', 'Upon the immediate approach of an authorized emergency vehicle which is sounding a siren and which has at least one lighted lamp exhibiting red or blue light, the surrounding traffic shall do the following:\nthe driver of every other vehicle shall yield the right-of-way and shall immediately drive to the right-hand edge or curb of the highway, clear of any intersection, and thereupon shall stop and remain stopped until the authorized emergency vehicle has passed.\nAll pedestrians upon authorized routes, roads, highway shall proceed to the nearest curb or place of safety and remain there until the authorized emergency vehicle has passed.\n- Violations of Penal Code (8)16 are an infraction with a $480 fine.', '', '480'),
('ed562e8b-0cc3-4e40-bbfa-9b6db13b156d', '(8)26. Driving Under The Influence (DUI)', 'A person who drives a motor vehicle, operates heavy machinery while under the influence of alcohol at or above the legal limit of 0.08 percent BAC\nA person who drives a vehicle or operates heavy machinery requiring a commercial driver\'s license while under the influence of alcohol at or above the legal limit of 0.04 percent BAC\nA person who is under the age of 21 and drives a motor vehicle or operates heavy machinery while under the influence of alcohol at or above the legal limit of 0.02 percent BAC\nA person who drives a vehicle, operates heavy machinery or operates a marine vessel under the influence of awareness-altering drugs, regardless of whether those drugs are being used under a prescription.\n- First offenses of penal Code (8)26 are a misdemeanor with 60 seconds imprisonment, a fine of $1000, and all license suspension for 10 days.\n\n- Second offenses of penal Code (8)26 within 120 days of a first offense is a misdemeanor with 60 seconds imprisonment, a fine of $1000, and all license suspension for 24 days.\n\n- Third offenses of penal Code (8)26 within 120 days of a first and second offense are a misdemeanor with 60 seconds imprisonment, a fine of $1000, and all license suspension for 36 days.', '', ''),
('ee884e53-5d0b-4a47-b8da-c8de8fc91259', '(2)13. Forgery/Fraud', 'A person who knowingly alters, creates, or uses a written document with the intent to defraud or deceive another is guilty under this code section.\nA person who knowingly signs a document or agreement, electronic or otherwise, without the consent or authority of whom they are signing for is guilty under this code section.\nA person who intentionally misrepresents a matter of fact - whether by words or by conduct, by false or misleading allegations, or by concealment of what should have been disclosed - that deceives and is intended to deceive another so that such other will act upon it to their disadvantage is guilty under this code section.\n- Violations of Penal Code (2)13 is a felony with 90 seconds imprisonment.', '90', ''),
('ee9176e7-512b-44cb-b974-ed6b20099dec', '(11)01. Pilot Licenses', 'No person may operate an aircraft without a pilot’s license for the type of aircraft being operated.\nNo person shall have in his or her possession or otherwise under his or her control more than one pilot’s license.\nThe licensee shall have the valid pilot’s license issued to him or her in his or her immediate possession at all times when operating an aircraft.\n- Violations of Penal Code (11)01 are an infraction with a fine of $11,000.', '', '11000'),
('eeb341ff-8ebd-42a7-8a4a-c51acffbf2c0', '(9)03. Weapons Discharge Violation', 'A person who willfully fires a firearm in a grossly negligent manner which could result in injury or death is guilty under this code.\nA person who fires at an building, car, aircraft, or camper is guilty under this code.\nA person committing this offense from a vehicle, whether land, sea, or in air, shall instead be charged with (9)04. Drive-By Shooting.\n-  Violations of Penal Code (9)03 are a felony with 90 seconds imprisonment.\n\nNOTE: This charge can stack with brandishing a firearm, so you can in fact be charged both. A discharge however is different from brandishing, which requires the perpetrator to be using the brandishing as a way to elicit fear or hysteria. A person who discharges a weapon in an explicit case of self defense, where grievous bodily harm may occur and use of said firearm is necessary to prevent said harm are exempt from this charge', '90', ''),
('f0de1691-a311-4cde-8c37-a55698e09b7a', '(8)18. Speed Limits | 1-15 excess', 'No driver may operate a vehicle at a speed greater than the posted speed limit.\nNo person shall drive a vehicle upon a highway at a speed greater than is reasonable or prudent having due regard for weather, visibility, the traffic on, and the surface and width of, the highway, and in no event at a speed which endangers the safety of persons or property.\nWhen no speed limit is posted the following speed limits apply:\n15 mph in any alley way\n45 mph on any road other than a state highway\n65 mph on any state highway, freeway, interstate, or US highway\nA driver who fails to show a use of fair judgment in their speed when driving in poor conditions, such as poor weather, or on unpaved, slick, or damaged roads.\nNo person shall drive upon a highway at such a slow speed as to impede or block the normal and reasonable movement of traffic unless the reduced speed is necessary for safe operation, because of a grade, or in compliance with law.\nNo person shall bring a vehicle to a complete stop upon a highway so as to impede or block the normal and reasonable movement of traffic unless the stop is necessary for safe operation or in compliance with law.\nNo person may drive any of the following vehicles on a highway at a speed in excess of 55 miles per hour:\nA motortruck or truck tractor having three or more axles or any motortruck or truck tractor drawing any other vehicle.\nA vehicle transporting explosives.', '', '234'),
('f405e98c-f4cc-4e53-ac86-bc22bab30c12', '(1)07. Manslaughter', 'A person who unintentionally kills another, with or without a quarrel or heat of passion is guilty under this code section.\nA person who, through a criminal accident or negligence, causes someone\'s death is guilty under this code section.\n- Violations of Penal Code (1)07 are a felony with 270 seconds imprisonment.\n\nNOTE: Manslaughter is homicide that is not premeditated or proven to have intent or an opportunity to pause and reflect on killing that person. An opportunity to reflect (and therefore possibly change your mind) demonstrates premeditation and is murder. Manslaughter is only charged in the penal code when some sort of criminal negligence or action can be proven.', '270', ''),
('f47ef38e-b693-4799-85fc-304815ab5381', '(2)12. Extortion', 'A person who intimidates or influences another to provide or hand over properties or services is guilty under this code section.\nA person who utilizes or threatens their power or authority with demonstrated malice aforethought in order to compel action by another is guilty under this code section.\nA person who utilizes privileged information to intimidate another for certain property or services is guilty under this code section.\n- Violations of Penal Code (2)12 is a felony with 120 seconds imprisonment and a fine of $10,000.\n\nNOTES: Extortion depends on a person or organization using its authority, power, or influence to intimidate and threaten someone in return for property or services. Property may be demanding money to keep quiet or demanding a certain personal payment to prevent a strike. Extortion may serve in lieu of corruption depending on the circumstances, or if it involves a private organization. A union threatening a strike or collective worker action is NOT extortion unless a specific leader or member is being paid to influence union operations.', '120', '10000'),
('f6b134e9-53e7-412a-9d26-1f7625737977', '(2)14. Vandalism', 'A person that defaces, damages, or destroys property which belongs to another is guilty under this code section.\n- Violations of Penal Code (2)14 is a misdemeanor with 90 seconds imprisonment and a fine of $1,000.', '90', '1000'),
('fb80c2a8-81df-4f2b-9f63-1abf6b3440d0', '(4)01. Bribery', 'A person who offers or gives a monetary gift, gratuity, valuable goods, or other reward to a public official, a government employee, or peace officer in an attempt to influence their duties or actions is guilty under this code section.\nA person who gives services or nonmaterial, but valuable actions to a public official, a government employee, or peace officer in an attempt to influence their duties or actions is guilty under this code section.\n- Violations of Penal Code (4)01 is a felony with 120 seconds imprisonment and a fine of $10,000 or double the amount of the bribe whichever is greater.', '120', '10000'),
('fba809c3-39e3-4e9e-aa75-aa9b55baf029', '(8)27. Enhanced Driving Under The Influence (DUI)', 'A person who violates penal code (8)26 and performs one of the acts is guilty under this code:\nA person who drives a vehicle or operates heavy machinery while under the influence of alcohol at or above a limit of 0.15 percent BAV.\nA person who exceeds the speed limit by 20 mph and violates penal code (8)20.\nA person who injures or kills another person due to an accident caused while in violation of penal code (8)26.\nA person who violates penal code (8)26 on four or more separate occasions within 120 days is guilty under this code section.\nIn this case a violation of (8)26 is not charged.\nA person who has previously been convicted under this section and commits a violation of penal code (8)26 within 120 days of the first violation of this section is guilty under this code section.\nIn this case a violation of (8)26 is not charged.\n- Violations of Penal Code (8)27 are a felony with 120 seconds imprisonment, a fine of $5000, and license suspension for 60 days .\n\nNOTE: When a death occurs this charge can be stacked with manslaughter.', '120', '5000'),
('fde5baf8-755d-4fa2-87c9-b413d4d6248b', '(9)08. Criminal Possession Of An Illegal Weapon', 'No person may sell, create, or possess any weapon listed below with the intent of criminal activity or using it for criminal activity:\n\nAn Unregistered Machine Gun\nAn Unregistered Silencer or Suppressor\nAn Unregistered Short Barreled Shotgun(SBS) (Shotgun barrel length less than 18”) or Unregistered Short Barreled Rifle(SBR) (Rifle barrel length less than 16”)\nAn Unregistered Destructive Device or Firearm with a bore/caliber over .50\nAny explosive device not logged for the purpose of lawful business practices\nA blade or improvised blade over three inches in length that can be used as a cutting, slashing or stabbing weapon, whether or not concealed.\n((Any wieldable script-wise knife or katana in your inventory is considered long enough to kill someone and qualify as an illegal blade.))\nPossession of controlled weapon(s) with intent to sell.\nException: A peace officer may possess or use such a weapon when required to do so under the performance of his/her peace officer duties.\n\nNote: Any blade that is over three inches that is or can be proven that it is a collectable antique, family Heirloom or tool, or not being used for or intended to be used for criminal activity is not illegal. However, if the above is not true then it classifies as an Illegal weapon under Penal Code (9)02\n\n- Violations of Penal Code (9)08 is a Felony with 120 seconds imprisonment and a $10,000 fine.', '120', '10000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `911calls`
--
ALTER TABLE `911calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `action_logs`
--
ALTER TABLE `action_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arrest_reports`
--
ALTER TABLE `arrest_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bleets`
--
ALTER TABLE `bleets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bolos`
--
ALTER TABLE `bolos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `businesses`
--
ALTER TABLE `businesses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cad_info`
--
ALTER TABLE `cad_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `citizens`
--
ALTER TABLE `citizens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `court_requests`
--
ALTER TABLE `court_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ems-fd`
--
ALTER TABLE `ems-fd`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ethnicities`
--
ALTER TABLE `ethnicities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `legal_statuses`
--
ALTER TABLE `legal_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leo_tickets`
--
ALTER TABLE `leo_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `officers`
--
ALTER TABLE `officers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `officer_logs`
--
ALTER TABLE `officer_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registered_cars`
--
ALTER TABLE `registered_cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registered_weapons`
--
ALTER TABLE `registered_weapons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tow_calls`
--
ALTER TABLE `tow_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxi_calls`
--
ALTER TABLE `taxi_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `truck_logs`
--
ALTER TABLE `truck_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warrants`
--
ALTER TABLE `warrants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weapons`
--
ALTER TABLE `weapons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `written_warnings`
--
ALTER TABLE `written_warnings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cad_info`
--
ALTER TABLE `cad_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
