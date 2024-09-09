-- phpMyAdmin SQL Dump
-- version 5.2.1-1.el9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 09, 2024 at 01:32 AM
-- Server version: 8.0.36
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ffz3qb`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `CustomerID` int NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`CustomerID`, `FirstName`, `LastName`, `Email`) VALUES
(1, 'David', 'Nu Nu', 'ffz3qb@virginia.edu'),
(2, 'Jason', 'Williamson', 'jpw4ma@virginia.edu'),
(3, 'Max', 'Grant', 'maxgrant@gmail.com'),
(4, 'Ryan', 'Dunn', 'RyanDunnNuggets@virginia.edu'),
(5, 'Lebron', 'James', 'BronnysDad@Lakers.org');

-- --------------------------------------------------------

--
-- Table structure for table `Games`
--

CREATE TABLE `Games` (
  `GameID` int NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  `Price` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Games`
--

INSERT INTO `Games` (`GameID`, `Title`, `Genre`, `Price`) VALUES
(1, 'Black Myth: Wukong', 'Action RPG', 59.99),
(2, 'The Last of Us Part II', 'Action Adventure', 39.99),
(3, 'Cyberpunk 2077', 'RPG', 49.99),
(4, 'Red Dead Redemption 2', 'Action Adventure', 44.99),
(5, 'Elden Ring', 'Action RPG', 59.99);

-- --------------------------------------------------------

--
-- Table structure for table `Sales`
--

CREATE TABLE `Sales` (
  `SaleID` int NOT NULL,
  `CustomerID` int DEFAULT NULL,
  `GameID` int DEFAULT NULL,
  `SaleDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Sales`
--

INSERT INTO `Sales` (`SaleID`, `CustomerID`, `GameID`, `SaleDate`) VALUES
(1, 1, 1, '2023-09-01'),
(2, 2, 3, '2023-09-02'),
(3, 3, 4, '2023-09-03'),
(4, 4, 2, '2023-09-04'),
(5, 5, 5, '2023-09-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `Games`
--
ALTER TABLE `Games`
  ADD PRIMARY KEY (`GameID`);

--
-- Indexes for table `Sales`
--
ALTER TABLE `Sales`
  ADD PRIMARY KEY (`SaleID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `GameID` (`GameID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Sales`
--
ALTER TABLE `Sales`
  ADD CONSTRAINT `Sales_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`),
  ADD CONSTRAINT `Sales_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `Games` (`GameID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
