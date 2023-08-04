-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 04, 2023 at 11:10 AM
-- Server version: 8.0.27
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `extbooks_eis_invoicing`
--

-- --------------------------------------------------------

--
-- Table structure for table `estimate_type`
--

CREATE TABLE `estimate_type` (
  `EstimateTypeID` int NOT NULL,
  `EstimateType` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estimate_type`
--

INSERT INTO `estimate_type` (`EstimateTypeID`, `EstimateType`) VALUES
(1, 'Quotation'),
(2, 'Software');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `estimate_type`
--
ALTER TABLE `estimate_type`
  ADD PRIMARY KEY (`EstimateTypeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `estimate_type`
--
ALTER TABLE `estimate_type`
  MODIFY `EstimateTypeID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
