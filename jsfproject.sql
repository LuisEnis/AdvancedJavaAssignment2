-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2022 at 07:11 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jsfproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `isoCode` varchar(10) NOT NULL,
  `Continent` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`isoCode`, `Continent`, `Country`) VALUES
('AFG', 'Asia', 'Afghanistan'),
('ALB', 'Europe', 'Albania'),
('BUL', 'Europe', 'Bulgaria'),
('CAN', 'North America', 'Canada'),
('DEU', 'Europe', 'Germany'),
('EGY', 'Africa', 'Egypt'),
('ESP', 'Europe', 'Spain'),
('FRA', 'Europe', 'France'),
('GRE', 'Europe', 'Greece'),
('ITA', 'Europe', 'Italy');

-- --------------------------------------------------------

--
-- Table structure for table `covid_data`
--

CREATE TABLE `covid_data` (
  `date` date NOT NULL,
  `totalCases` double NOT NULL,
  `newCases` double NOT NULL,
  `newCasesSmoothed` double NOT NULL,
  `totalDeaths` double NOT NULL,
  `newDeaths` double NOT NULL,
  `newDeathsSmoothed` double NOT NULL,
  `reproductionRate` double NOT NULL,
  `newTests` double NOT NULL,
  `totalTests` double NOT NULL,
  `stringencyIndex` double NOT NULL,
  `population` decimal(15,0) NOT NULL,
  `medianAge` double NOT NULL,
  `isoCode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `covid_data`
--

INSERT INTO `covid_data` (`date`, `totalCases`, `newCases`, `newCasesSmoothed`, `totalDeaths`, `newDeaths`, `newDeathsSmoothed`, `reproductionRate`, `newTests`, `totalTests`, `stringencyIndex`, `population`, `medianAge`, `isoCode`) VALUES
('2020-02-02', 444, 21, 29.857, 15, 0, 1.571, 1.48, 0, 0, 74.4, '39835428', 41.4, 'AFG'),
('2020-03-14', 38, 5, 5.429, 1, 0, 0.143, 0, 0, 0, 78.8, '2872934', 38, 'ALB'),
('2020-05-07', 67146, 1443, 1490, 5387, 147, 172.571, 0.91, 27953, 902008, 72.69, '38067913', 41.3, 'CAN'),
('2020-05-07', 221447, 1122, 1144.571, 26070, 213, 218.43, 0.67, 0, 1625211, 81.94, '56745211', 45.5, 'ESP');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `name`, `surname`, `password`) VALUES
('eltonballhysa@unyt.edu.al', 'Elton', 'Ballhysa', 'elton1999'),
('sejdini.enis@yahoo.com', 'Enis', 'Sejdini', 'luis1999');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`isoCode`);

--
-- Indexes for table `covid_data`
--
ALTER TABLE `covid_data`
  ADD PRIMARY KEY (`date`,`isoCode`),
  ADD KEY `foreign key` (`isoCode`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `covid_data`
--
ALTER TABLE `covid_data`
  ADD CONSTRAINT `covid_data_ibfk_1` FOREIGN KEY (`isoCode`) REFERENCES `country` (`isoCode`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
