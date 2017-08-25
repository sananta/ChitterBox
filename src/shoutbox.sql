-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: July 06, 2017 at 09:00 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shoutbox`
--
CREATE DATABASE IF NOT EXISTS `shoutbox` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `shoutbox`;

-- --------------------------------------------------------

--
-- Table structure for table `shouts`
--

CREATE TABLE IF NOT EXISTS `shouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL,
  `date_posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `message` varchar(255) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `shouts`
--

INSERT INTO `shouts` (`id`, `user_id`, `date_posted`, `message`, `name`) VALUES
(1, 0, '2014-02-17 23:55:52', 'I am guest', 'Varshini'),
(2, 1, '2014-02-18 00:12:00', 'I am here', 'Hemadri'),
(9, 1, '2014-03-06 07:05:00', 'mani', ''),
(10, 1, '2014-03-06 07:05:49', 'mani', ''),
(11, 1, '2014-03-06 07:06:28', 'mani', ''),
(12, 0, '2014-03-06 07:08:29', 'Its me', 'Mouse'),
(13, 0, '2014-03-06 07:09:06', 'Its me', 'Suja'),
(14, 1, '2014-03-06 07:09:16', 'Hello Suja', ''),
(15, 1, '2014-03-06 07:10:06', 'U there?', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`) VALUES
(0, 'guest_'),
(1, 'A User'),
(3, 'Someone');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
