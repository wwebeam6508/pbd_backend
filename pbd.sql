-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2019 at 05:37 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pbd`
--

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(0, 'Unknown'),
(1, 'Active'),
(2, 'Inactive'),
(3, 'Deleted'),
(4, 'Waiting'),
(5, 'Queued'),
(6, 'Pending'),
(7, 'Processing'),
(8, 'Draft');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `password`, `remember_token`, `updated_at`, `created_at`, `status_id`) VALUES
(1, 'alfonzo40', 'Kim Grant', '$2y$10$BWZIEniKtlrDCOb94pAU4uUu/94HTxlncOlEeqdhTpmH5oibhmfw6', 't2SOUFgsmi', '2019-06-15 01:25:25', '2019-06-15 01:25:25', 1),
(2, 'kuphal.dimitri', 'Aletha Kuhic', '$2y$10$sjFcuOyRXc7bmcbPonjk.u/fJUlR4w2F.NAo1rA.Q6KhPOpc1lFAq', 'CUKl80b1PR', '2019-06-15 01:25:25', '2019-06-15 01:25:25', 1),
(3, 'flossie.jerde', 'Phoebe Greenfelder', '$2y$10$12O8.Mqkb/LyKGf2k6e/rO.wfZJJc.LJvoSB95RlAYNjJSGI/KK7i', '2UW42F37nn', '2019-06-15 01:25:25', '2019-06-15 01:25:25', 1),
(4, 'jarvis04', 'Delores Kohler', '$2y$10$ZVD39rhLUh7WI/ZSNWaXfOqqIR.eHmtGTq9Q8nTNWpk4b2JJ6Clsq', 'geFeufZELK', '2019-06-15 01:25:25', '2019-06-15 01:25:25', 1),
(5, 'rsatterfield', 'Erik Durgan', '$2y$10$PP/C6uFh8UHmQiu2Q2ODY.Mr/gJdwOaOvlaqy43hjxt0qWDdMVG2G', 'xJi7iu5K2L', '2019-06-15 01:25:25', '2019-06-15 01:25:25', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`,`status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
