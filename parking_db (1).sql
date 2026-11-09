-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2026 at 09:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parking_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `parking_entry`
--

CREATE TABLE `parking_entry` (
  `entry_id` int(11) NOT NULL,
  `vehicle_no` varchar(20) DEFAULT NULL,
  `slot_id` varchar(10) DEFAULT NULL,
  `entry_time` datetime DEFAULT NULL,
  `exit_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parking_entry`
--

INSERT INTO `parking_entry` (`entry_id`, `vehicle_no`, `slot_id`, `entry_time`, `exit_time`) VALUES
(1, 'KL-01-XY-9999', 'S-101', '2026-11-01 11:30:00', '2026-11-01 13:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `parking_slot`
--

CREATE TABLE `parking_slot` (
  `slot_id` varchar(10) NOT NULL,
  `zone` varchar(50) DEFAULT NULL,
  `slot_type` varchar(50) DEFAULT NULL,
  `rate_per_hour` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parking_slot`
--

INSERT INTO `parking_slot` (`slot_id`, `zone`, `slot_type`, `rate_per_hour`) VALUES
('B-201', 'East Wing', 'Two-Wheeler', 20.00),
('B-202', 'East Wing', 'Two-Wheeler', 20.00),
('S-101', 'North Zone', 'Car', 40.00),
('S-102', 'North Zone', 'Car', 40.00);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `vehicle_no` varchar(20) NOT NULL,
  `owner_name` varchar(100) NOT NULL,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`vehicle_no`, `owner_name`, `vehicle_type`, `phone`) VALUES
('KL-01-XY-9999', 'Rahul Sharma', 'Car', '9988776655'),
('KL-07-AB-1234', 'Alan Walker', 'Car', '9876543210'),
('KL-07-CD-5678', 'Sarah Jenkins', 'Two-Wheeler', '9123456780');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `parking_entry`
--
ALTER TABLE `parking_entry`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `vehicle_no` (`vehicle_no`),
  ADD KEY `slot_id` (`slot_id`);

--
-- Indexes for table `parking_slot`
--
ALTER TABLE `parking_slot`
  ADD PRIMARY KEY (`slot_id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`vehicle_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `parking_entry`
--
ALTER TABLE `parking_entry`
  MODIFY `entry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `parking_entry`
--
ALTER TABLE `parking_entry`
  ADD CONSTRAINT `parking_entry_ibfk_1` FOREIGN KEY (`vehicle_no`) REFERENCES `vehicle` (`vehicle_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `parking_entry_ibfk_2` FOREIGN KEY (`slot_id`) REFERENCES `parking_slot` (`slot_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
