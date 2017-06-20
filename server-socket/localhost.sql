	-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 19, 2017 at 07:27 PM
-- Server version: 5.7.17-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--
CREATE DATABASE IF NOT EXISTS `db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db`;

-- --------------------------------------------------------

--
-- Table structure for table `broadcast`
--

CREATE TABLE `broadcast` (
  `id` int(11) NOT NULL,
  `user_name` text NOT NULL,
  `number_of_likes` int(11) NOT NULL,
  `number_of_dislikes` int(11) NOT NULL,
  `number_of_shares` int(11) NOT NULL,
  `base_broadcast_id` int(11) NOT NULL,
  `data` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `broadcast`
--

INSERT INTO `broadcast` (`id`, `user_name`, `number_of_likes`, `number_of_dislikes`, `number_of_shares`, `base_broadcast_id`, `data`, `date`, `player_id`) VALUES
(2, 'mancy', 1, 1, 1, 1, 'hello_world', '2017-03-22 15:51:17', 0),
(15, '', 3, 3, 3, 0, '', '2017-03-22 23:48:03', 0),
(16, 'mancy', 0, 0, 0, 2, 'i\'m happy ', '2017-03-12 12:44:06', 1),
(17, 'mada', 1, -1, 1, 3, 'i\'m not  happy ', '2017-04-11 20:30:43', 2),
(18, 'fadia', 0, 0, 0, 4, 'i\'m very happy ', '2017-03-12 12:50:17', 3),
(19, 'alaa', 0, 0, 0, 5, 'i\'m just happy ', '2017-03-12 12:50:40', 4),
(20, 'mona', 0, 0, 0, 6, 'i\'m so so happy ', '2017-03-12 12:51:06', 5),
(21, 'mancy', 0, 0, 0, 1, 'i\'m so so happy', '2017-03-22 16:08:02', 5),
(22, 'mancy', 0, 0, 0, 1, 'i\'m so so happy', '2017-04-11 19:09:13', 5),
(23, 'mancy', 0, 0, 0, 1, 'i\'m so so happy', '2017-04-11 19:09:22', 5),
(24, 'mancy', 1, 1, 1, 1, 'hello_world', '2017-04-11 20:12:14', 0),
(25, 'mancy', 1, 1, 1, 1, 'hello_world', '2017-04-11 20:12:33', 0),
(26, 'mancy', 1, 1, 1, 1, 'hello_world', '2017-04-11 20:12:44', 0),
(27, 'mancy', 1, 1, 1, 1, 'hello_world', '2017-04-11 20:13:01', 0),
(28, 'mancy', 1, 1, 1, 1, 'hello_world', '2017-04-11 20:15:11', 0),
(29, 'mancy', 1, 1, 1, 1, 'hello_world', '2017-04-11 20:16:01', 0),
(30, '', 10, 10, 10, 0, '', '2017-04-11 20:26:06', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customized_objects`
--

CREATE TABLE `customized_objects` (
  `id` int(20) NOT NULL,
  `player_id` int(11) NOT NULL,
  `resources` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `land`
--

CREATE TABLE `land` (
  `id` int(20) NOT NULL,
  `land_owner_id` int(11) NOT NULL,
  `row_number` int(11) NOT NULL,
  `column_number` int(11) NOT NULL,
  `block_data_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `land`
--

INSERT INTO `land` (`id`, `land_owner_id`, `row_number`, `column_number`, `block_data_path`) VALUES
(1, 0, 66666, 3, ''),
(2, 0, 66666, 3, ''),
(3, 7, 66666, 3, ''),
(4, 2, 66666, 8, ''),
(5, 2, 66666, 9, ''),
(6, 2, 66666, 9, ''),
(7, 0, 66666, 333, ''),
(8, 7, 7, 9, ''),
(9, 0, 4, 7, '');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `number_of_followers` int(11) NOT NULL,
  `number_of_following` int(11) NOT NULL,
  `number_of_level` int(11) NOT NULL,
  `number_of_broadcast` int(11) NOT NULL,
  `notifications` int(11) NOT NULL,
  `offline_messages` int(11) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `inventory` text NOT NULL,
  `profile_picture` text NOT NULL,
  `current_land_id` int(11) NOT NULL,
  `log` text NOT NULL,
  `user_name` text NOT NULL,
  `id` int(11) NOT NULL,
  `password` text NOT NULL,
  `unique_string_identifier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`number_of_followers`, `number_of_following`, `number_of_level`, `number_of_broadcast`, `notifications`, `offline_messages`, `gender`, `inventory`, `profile_picture`, `current_land_id`, `log`, `user_name`, `id`, `password`, `unique_string_identifier`) VALUES
(0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 'mancy', 104, '22', 0),
(0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 'noehal', 105, '21', 0),
(0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 'ola', 106, '88', 0),
(0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 'ali', 107, '99', 0),
(0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 'medo', 108, '2', 0),
(0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 'cc', 109, '1', 0),
(0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 'said', 110, '898', 0),
(0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 'omar', 111, '898656', 0);

-- --------------------------------------------------------

--
-- Table structure for table `usergraph`
--

CREATE TABLE `usergraph` (
  `nodeFrom` int(11) NOT NULL,
  `nodeTo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usergraph`
--

INSERT INTO `usergraph` (`nodeFrom`, `nodeTo`) VALUES
(1, 5),
(3, 8),
(6, 8),
(6, 8),
(8, 8),
(10, 8),
(11, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `broadcast`
--
ALTER TABLE `broadcast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customized_objects`
--
ALTER TABLE `customized_objects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `land`
--
ALTER TABLE `land`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `broadcast`
--
ALTER TABLE `broadcast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `customized_objects`
--
ALTER TABLE `customized_objects`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `land`
--
ALTER TABLE `land`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
