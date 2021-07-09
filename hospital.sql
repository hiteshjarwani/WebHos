-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2020 at 07:38 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `admit`
--

CREATE TABLE `admit` (
  `aid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `disease` varchar(200) NOT NULL,
  `adate` varchar(100) NOT NULL,
  `ldate` varchar(100) NOT NULL,
  `active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admit`
--

INSERT INTO `admit` (`aid`, `pid`, `disease`, `adate`, `ldate`, `active`) VALUES
(1, 3, 'ill', '12/2/2020', '12/2/2020', 'yes'),
(15, 4, 'rasoi', '12/12/2020', '14/12/2020', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `checkup`
--

CREATE TABLE `checkup` (
  `cid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `did` int(11) NOT NULL,
  `active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `checkup`
--

INSERT INTO `checkup` (`cid`, `aid`, `did`, `active`) VALUES
(1, 1, 1, 'yes'),
(7, 15, 2, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `did` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `expert` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`did`, `name`, `gender`, `email`, `contact`, `address`, `expert`, `status`, `active`) VALUES
(1, 'PM', 'female', 'Pm@gmail.com', '9987', 'j', 'heart ', 'Available', 'no'),
(2, 'jai', 'male', 'jai@gmail.com', '9876547', 'ol,gdpas', 'eye', 'Available', 'no'),
(3, 'kinaki', 'male', 'kinaki@gmail.com', '93423587', '12,hasjdu', 'lol', 'Available', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `pid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`pid`, `name`, `gender`, `age`, `email`, `contact`, `address`) VALUES
(1, 'kika', 'male', 23, 'kika@i.com', '98978123', '12,raka nagar'),
(2, 'lela', 'female', 44, 'moni@m.com', '2811286712', '00,jigalala'),
(3, 'moni', 'male', 44, 'moni@m.com', '28112', '00,jigalala'),
(4, 'gopi', 'female', 44, 'gopi@gmail.com', '187623123', 'koki nab');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `rid` int(11) NOT NULL,
  `rtype` varchar(100) NOT NULL,
  `active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`rid`, `rtype`, `active`) VALUES
(1, 'ICU', 'yes'),
(2, 'IICU', 'yes'),
(3, 'IICC', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `roomas`
--

CREATE TABLE `roomas` (
  `arid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `did` int(11) NOT NULL,
  `active` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roomas`
--

INSERT INTO `roomas` (`arid`, `rid`, `aid`, `did`, `active`) VALUES
(1, 1, 1, 1, 'yes'),
(2, 2, 1, 1, 'no'),
(3, 3, 1, 1, 'no');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admit`
--
ALTER TABLE `admit`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `checkup`
--
ALTER TABLE `checkup`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `roomas`
--
ALTER TABLE `roomas`
  ADD PRIMARY KEY (`arid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admit`
--
ALTER TABLE `admit`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `checkup`
--
ALTER TABLE `checkup`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roomas`
--
ALTER TABLE `roomas`
  MODIFY `arid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
