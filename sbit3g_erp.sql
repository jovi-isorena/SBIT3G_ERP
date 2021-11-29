-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2021 at 05:32 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+08:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sbit3g_erp`
--
CREATE DATABASE IF NOT EXISTS `sbit3g_erp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sbit3g_erp`;

-- --------------------------------------------------------

--
-- Table structure for table `cartitem`
--

CREATE TABLE `cartitem` (
  `CartID` int(11) NOT NULL,
  `CustomerID` varchar(10) NOT NULL,
  `ProductID` int(10) NOT NULL,
  `CartQuantity` int(11) NOT NULL DEFAULT 1,
  `CartPrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `CommentID` int(11) NOT NULL,
  `TicketNo` varchar(10) NOT NULL,
  `CreatedDatetime` datetime NOT NULL DEFAULT current_timestamp(),
  `FromRep` tinyint(1) NOT NULL,
  `ReplyingRepId` varchar(10) DEFAULT NULL,
  `Content` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` varchar(10) NOT NULL,
  `ID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) NOT NULL,
  `Birthdate` date NOT NULL,
  `Mobile` varchar(20) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `LastLoginAttempt` datetime DEFAULT NULL,
  `LoginAttemptCount` int(11) DEFAULT NULL,
  `LockedUntil` datetime DEFAULT NULL,
  `Image` longblob DEFAULT NULL,
  `CustomerStatus` varchar(255) DEFAULT NULL,
  `JoinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customeraddress`
--

CREATE TABLE `customeraddress` (
  `ID` int(11) NOT NULL,
  `CustomerID` varchar(10) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Barangay` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Zip` varchar(255) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deduction`
--

CREATE TABLE `deduction` (
  `id` int(11) NOT NULL,
  `deductionName` varchar(50) NOT NULL,
  `deductionCost` double(11,2) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deduction`
--

INSERT INTO `deduction` (`id`, `deductionName`, `deductionCost`, `isActive`) VALUES
(1, 'Pag-ibig', 200.00, 1),
(2, 'Philhealth', 400.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `TransactionNumber` int(11) NOT NULL,
  `ReceivedBy` varchar(10) NOT NULL,
  `DeliveredDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DepartmentID` int(11) NOT NULL,
  `DepartmentName` varchar(255) NOT NULL,
  `DepartmentHeadName` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepartmentID`, `DepartmentName`, `DepartmentHeadName`, `isActive`) VALUES
(1, 'Human Resource', 'Joshua Dungo', 1),
(2, 'Purchasing', 'Christina Josol', 1),
(3, 'Order Processing', 'Julianne Samantha Echin', 1),
(4, 'Customer Relationship', 'Waren De Guzman', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` varchar(10) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) NOT NULL,
  `Suffix` varchar(10) DEFAULT NULL,
  `Birthdate` date NOT NULL,
  `HomeAddress` varchar(255) NOT NULL,
  `ContactNo` varchar(20) DEFAULT NULL,
  `AttendancePIN` varchar(255) DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL,
  `TeamID` int(11) DEFAULT NULL,
  `SalaryGrade` int(11) DEFAULT NULL,
  `Position` int(11) DEFAULT NULL,
  `ScheduleID` int(11) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmployeeID`, `FirstName`, `MiddleName`, `LastName`, `Suffix`, `Birthdate`, `HomeAddress`, `ContactNo`, `AttendancePIN`, `DepartmentID`, `TeamID`, `SalaryGrade`, `Position`, `ScheduleID`, `isActive`) VALUES
('0001', 'Melquezidek', 'Suazo', 'Vitor', '', '2000-01-01', 'Quezon City', NULL, '$2y$10$qKtllAivbs/xpaRFtf0jf.JqgT.Ims3VSdpHmDt7BUluDXUum4wje', 1, NULL, 1, 1, 107, 1),
('0002', 'Eugene', 'Laganzo', 'Tamidles', '', '2000-01-01', 'Quezon City', NULL, '$2y$10$q/3Wa3780K.K/bZkhx8pXuNniBZPTLQH5zWPMtx6TmoJIqENfvncS', 2, NULL, 1, 1, 107, 1),
('0003', 'Alexander', 'Oh', 'Abaya', '', '2000-01-01', 'Quezon City', NULL, '$2y$10$S.SSqeVWUrl5fVQBpTidt.wN1yst9CjE4qdmIxWeiktYENOtGJme.', 3, NULL, 1, 1, 107, 1),
('0004', 'Jovito', 'Briones', 'Isorena', 'Jr', '2000-01-01', 'Quezon City', NULL, '$2y$10$gMJc/hfHkTTBjXox7VB1AOTwluoTMNZJts7sIskfNbJIylIJwp0JG', 4, NULL, 1, 1, 107, 1),
('0005', 'Nikko', 'Ocampo', 'Bayan', NULL, '2000-01-01', 'Quezon City', NULL, '$2y$10$uE8saX6QwK9Jh.echwOdf./UyuSk22cuo8rOtqC0m/13jiDt68tQ6', 2, NULL, 1, 2, 107, 1),
('0006', 'Jericko', 'Jamora', 'Librada', NULL, '2000-01-01', 'Quezon City', NULL, '$2y$10$bQVcUvZiVjmD/vUUQCOkUuJFAX8d/K/0ljT9nAq9.M8CwCRib5ieG', 2, NULL, 1, 3, 107, 1),
('0007', 'Andrea', 'Llamador', 'Alivio', NULL, '2000-01-01', 'Quezon City', NULL, '$2y$10$PRhfwyfIAr2iyfOjoInJWOuTUYDj9d5.tY60MuarViOkSoLEZMVV6', 3, NULL, 1, 4, 107, 1),
('0008', 'Jeanne', 'Laquio', 'Flores', NULL, '2000-01-01', 'Quezon City', NULL, '$2y$10$pUe9K2kCHk3a9J8HSGSkveON3hjV1nNHhtjPJCxNcxIDahivzX9a2', 3, NULL, 1, 5, 107, 1),
('0009', 'Joselito', 'Sancha', 'Sy', 'Jr', '2000-01-01', 'Quezon City', NULL, '$2y$10$T52OHkuHg4WmFDr3BwgJ8ujkAMoKkXkycc3IiI/Jfbso3yf8oWbUG', 3, NULL, 1, 6, 107, 1),
('0010', 'Arianne Ruth', 'Rodil', 'Parreño', NULL, '2000-01-01', 'Quezon City', NULL, '$2y$10$N.JsZ4gAyxDdW5UEc638recljl5O6XEiVSOdtbvUh0aNocD8zStza', 4, 1, 1, 7, 107, 1),
('0011', 'Arvin', 'Samson', 'Suyom', NULL, '2000-01-01', 'Quezon City', NULL, '$2y$10$BRG63DoL0IIRGGMbG0okROKHv3wvz1MaOesdbC08ZWhr7gD6uOV8C', 4, 2, 1, 7, 107, 1),
('0012', 'Keila', 'Roson', 'Marcelino', NULL, '2000-01-01', 'Quezon City', NULL, '$2y$10$He4.R7sf3x0G2r7h6fW/N..ocNgvJo96iNTstisUAPSvCvZVzIEA.', 4, 1, 1, 8, 107, 1),
('0013', 'Harvey', NULL, 'Bulingit', NULL, '2000-01-01', 'Quezon City', NULL, '$2y$10$R8LVfXnLq04hvx1Q/XG/4.YrR5rmWiCr5EhdsX2RFBHgptsm4dy6a', 4, 2, 1, 8, 107, 1),
('0014', 'Marylle Clarice', 'De Jesus', 'Esteves', NULL, '2000-01-01', 'Quezon City', NULL, '$2y$10$U3XvsC6YoEzWA9dJLS9CwOwYnEOQVYM8F/MH0eBbp9jom2GGF.dYC', 4, NULL, 1, 9, 107, 1),
('0015', 'John Victor', 'Julian', 'Cajuguiran', NULL, '2000-01-01', 'Quezon City', NULL, '$2y$10$TDD4.wtiz8tPxPmFcf6OPOTMghvY5yMe1a1oFrtloHZwL8bDKvJia', 1, NULL, 1, 1, 107, 1),
('0016', 'Dominic Joaquin', 'Dasmariñas', 'Galiza', NULL, '2000-01-01', 'Quezon City', NULL, '$2y$10$seRotJypxiwQAz0n7M49LOPrEkBl17SnBhyWD14vrciVgQ6L7R8Oi', 1, NULL, 1, 1, 107, 1),
('0017', 'Cai', NULL, 'Gigante', NULL, '2000-01-01', 'Quezon City', NULL, '1111', 4, 1, 1, 7, NULL, 1),
('0018', 'Jerico', NULL, 'Angala', NULL, '2000-01-01', 'Quezon City', NULL, '1111', 4, 1, 1, 7, NULL, 1),
('0019', 'Kerstein May', NULL, 'Paano', NULL, '2000-01-01', 'Quezon City', NULL, '1111', 4, 2, 1, 7, NULL, 1),
('0020', 'Rhol', NULL, 'Lamberte', NULL, '2000-01-01', 'Quezon City', NULL, '1111', 4, 2, 1, 7, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employeeattendance`
--

CREATE TABLE `employeeattendance` (
  `AttendanceID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `TimeIn` time NOT NULL,
  `TimeOut` time NOT NULL,
  `Num_hrs` decimal(10,2) DEFAULT NULL,
  `EmployeeID` varchar(10) NOT NULL,
  `Undertime` int(11) DEFAULT NULL,
  `Overtime` int(11) DEFAULT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employeeattendance`
--

INSERT INTO `employeeattendance` (`AttendanceID`, `Date`, `TimeIn`, `TimeOut`, `Num_hrs`, `EmployeeID`, `Undertime`, `Overtime`, `Status`) VALUES
(108, '2021-11-20', '08:41:54', '17:00:00', '8.00', '0001', 0, 0, 1),
(109, '2021-11-20', '08:42:05', '17:00:00', '8.00', '0002', 0, 0, 1),
(110, '2021-11-20', '08:42:13', '17:00:00', '8.00', '0003', 0, 0, 1),
(111, '2021-11-20', '08:42:22', '17:00:00', '8.00', '0004', 0, 0, 1),
(112, '2021-11-20', '08:42:29', '17:00:00', '8.00', '0005', 0, 0, 1),
(113, '2021-11-20', '08:42:40', '17:00:00', '8.00', '0006', 0, 0, 1),
(114, '2021-11-20', '08:42:50', '17:00:00', '8.00', '0007', 0, 0, 1),
(115, '2021-11-20', '08:43:06', '17:00:00', '8.00', '0008', 0, 0, 1),
(116, '2021-11-20', '08:43:15', '17:00:00', '8.00', '0009', 0, 0, 1),
(117, '2021-11-20', '08:43:27', '17:00:00', '8.00', '0010', 0, 0, 1),
(118, '2021-11-20', '08:43:37', '17:00:00', '8.00', '0011', 0, 0, 1),
(119, '2021-11-20', '08:43:46', '17:00:00', '8.00', '0012', 0, 0, 1),
(120, '2021-11-20', '08:43:55', '17:00:00', '8.00', '0013', 0, 0, 1),
(121, '2021-11-20', '08:44:15', '17:00:00', '8.00', '0014', 0, 0, 1),
(122, '2021-11-20', '08:44:23', '17:00:00', '8.00', '0015', 0, 0, 1),
(123, '2021-11-20', '08:44:45', '17:00:00', '8.00', '0016', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderID` varchar(10) NOT NULL,
  `CustomerID` varchar(10) NOT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  `ShippingAddress` varchar(255) NOT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `OrderedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ReceivedDate` datetime DEFAULT NULL,
  `OrderStatus` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ordereditem`
--

CREATE TABLE `ordereditem` (
  `OrderedItemID` int(11) NOT NULL,
  `OrderID` varchar(10) NOT NULL,
  `ProductID` int(10) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paymentmethod`
--

CREATE TABLE `paymentmethod` (
  `PaymentMethodID` int(11) NOT NULL,
  `CustomerID` varchar(10) NOT NULL,
  `MethodType` varchar(20) NOT NULL,
  `AccountNumber` varchar(255) NOT NULL,
  `AccountName` varchar(255) NOT NULL,
  `PinCode` varchar(10) DEFAULT NULL,
  `ValidMonth` varchar(10) DEFAULT NULL,
  `ValidYear` varchar(10) DEFAULT NULL,
  `Saved` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `PayrollID` int(11) NOT NULL,
  `EmployeeID` varchar(10) NOT NULL,
  `SalaryGradeID` int(11) DEFAULT NULL,
  `TotalDeduction` decimal(10,2) NOT NULL,
  `NetPay` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `PositionID` int(11) NOT NULL,
  `PositionName` varchar(255) NOT NULL,
  `InitialSalary` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`PositionID`, `PositionName`, `InitialSalary`, `isActive`) VALUES
(1, 'Admin', 1, 1),
(2, 'Store Manager', 1, 1),
(3, 'Delivery Manager', 1, 1),
(4, 'Stockman', 1, 1),
(5, 'Account Manager', 1, 1),
(6, 'Order Manager', 1, 1),
(7, 'Customer Relationship Representative', 1, 1),
(8, 'Customer Relationship Lead', 1, 1),
(9, 'Operations Manager', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(10) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Brand` varchar(255) NOT NULL,
  `Category` varchar(255) NOT NULL,
  `Specification` varchar(255) NOT NULL,
  `SellingPrice` decimal(10,2) NOT NULL,
  `OnSale` tinyint(1) NOT NULL DEFAULT 0,
  `Image` longblob DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorder`
--

CREATE TABLE `purchaseorder` (
  `TransactionNumber` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  `CreatedBy` varchar(10) NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `OrderedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `EstimatedDeliveryDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorderitem`
--

CREATE TABLE `purchaseorderitem` (
  `PurchaseItemID` int(11) NOT NULL,
  `TransactionNumber` int(11) NOT NULL,
  `ProductID` int(10) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `BuyingPrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `ID` int(11) NOT NULL,
  `EmployeeID` varchar(10) NOT NULL,
  `TeamID` int(11) NOT NULL,
  `EnqueueTime` datetime NOT NULL DEFAULT current_timestamp(),
  `ActiveTickets` int(11) NOT NULL,
  `OnlineStatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `RatingID` int(11) NOT NULL,
  `CustomerID` varchar(10) NOT NULL,
  `ProductID` int(10) NOT NULL,
  `RateStar` int(11) NOT NULL,
  `RateReview` varchar(255) DEFAULT NULL,
  `RateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `RateStatus` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `releaseorder`
--

CREATE TABLE `releaseorder` (
  `ReleaseOrderID` int(11) NOT NULL,
  `ProductID` int(10) NOT NULL,
  `CreatedBy` varchar(10) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `Status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `representativehandledticket`
--

CREATE TABLE `representativehandledticket` (
  `ID` int(11) NOT NULL,
  `TicketNo` varchar(10) NOT NULL,
  `AssignedDatetime` datetime NOT NULL DEFAULT current_timestamp(),
  `EmployeeID` varchar(10) NOT NULL,
  `ActionTaken` varchar(255) NOT NULL,
  `HandlingTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `returneditem`
--

CREATE TABLE `returneditem` (
  `ReturnID` int(11) NOT NULL,
  `CustomerID` varchar(10) NOT NULL,
  `OrderID` varchar(10) NOT NULL,
  `ProductID` int(10) NOT NULL,
  `ReturnQuantity` int(11) NOT NULL,
  `ReturnDescription` varchar(255) NOT NULL,
  `ReturnEvidence` longblob DEFAULT NULL,
  `ReturnStatus` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salarygrade`
--

CREATE TABLE `salarygrade` (
  `SalaryGradeID` int(11) NOT NULL,
  `Grade` varchar(10) NOT NULL,
  `Step` varchar(10) NOT NULL,
  `Rate` decimal(10,2) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salarygrade`
--

INSERT INTO `salarygrade` (`SalaryGradeID`, `Grade`, `Step`, `Rate`, `isActive`) VALUES
(1, '1', '1', '300.00', 1),
(2, '1', '2', '305.00', 1),
(3, '1', '3', '310.00', 1),
(4, '1', '4', '315.00', 1),
(5, '1', '5', '320.00', 1),
(6, '1', '6', '325.00', 1),
(7, '1', '7', '330.00', 1),
(8, '1', '8', '335.00', 1),
(9, '1', '9', '340.00', 1),
(10, '1', '10', '345.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `TimeIn` time DEFAULT NULL,
  `TimeOut` time DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `TimeIn`, `TimeOut`, `isActive`) VALUES
(107, '09:00:00', '17:00:00', 1),
(108, '21:00:00', '06:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `socialsecuritynumber`
--

CREATE TABLE `socialsecuritynumber` (
  `EmployeeID` varchar(10) NOT NULL,
  `Philhealth` varchar(255) DEFAULT NULL,
  `SSSNumber` varchar(255) DEFAULT NULL,
  `TIN` varchar(255) DEFAULT NULL,
  `PagibigNumber` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socialsecuritynumber`
--

INSERT INTO `socialsecuritynumber` (`EmployeeID`, `Philhealth`, `SSSNumber`, `TIN`, `PagibigNumber`) VALUES
('0001', '12345678', '02-3232332', '321-327-544', '1239832'),
('0002', '23456789', '02-3237643', '567-344-543', '1434332'),
('0003', '34567891', '02-3239642', '112-268-322', '1239764'),
('0004', '45678912', '02-9371931', '940-443-003', '3312832');

-- --------------------------------------------------------

--
-- Table structure for table `storestock`
--

CREATE TABLE `storestock` (
  `ProductID` int(10) NOT NULL,
  `AvailableStock` int(11) NOT NULL DEFAULT 0,
  `MinimumStockLimit` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SupplierID` int(11) NOT NULL,
  `CompanyName` varchar(255) NOT NULL,
  `ContactNumber` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `systemaccount`
--

CREATE TABLE `systemaccount` (
  `EmployeeID` varchar(10) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `LastLoginAttempt` datetime DEFAULT NULL,
  `LoginAttemptCount` int(11) DEFAULT NULL,
  `LockedUntil` datetime DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `systemaccount`
--

INSERT INTO `systemaccount` (`EmployeeID`, `Username`, `Password`, `LastLoginAttempt`, `LoginAttemptCount`, `LockedUntil`, `isActive`, `FirstName`, `LastName`) VALUES
('0001', 'vitor1', '$2y$10$LVllbI3qmI5hb54f6qYNNeTSlKevPlbPZ8LWJ3TX2K/6ViQ3ROCYm', NULL, NULL, NULL, 1, 'Melquezidek', 'Vitor'),
('0002', 'tamidles1', '$2y$10$4M6cMHuLCu0Uagn6HQnlieteDw44RuzvKANpYseacssbKy8jBaoQO', NULL, NULL, NULL, 1, 'Eugene', 'Tamidles'),
('0003', 'abaya1', '$2y$10$5LxbYLv8hq93KIr3svybLOdvSKF1jBfYSAbfGxrRiivICXcf8ZI2y', NULL, NULL, NULL, 1, 'Alexander', 'Abaya'),
('0004', 'isorena1', '$2y$10$Gn2U3BrCVH82fpCphqzZeu.YjxELiACm10kS1fWD2xxipLGvuud0G', NULL, NULL, NULL, 1, 'Jovito', 'Isorena'),
('0005', 'bayan1', '$2y$10$DbLfvgJFBGEzO1Mzvt/z7.7ELBnTcxPBNGqc0TBHOSPRqXKgp5pAK', NULL, NULL, NULL, 1, 'Nikko', 'Bayan'),
('0006', 'librada1', '$2y$10$iA2Iph3oE3D1UXU.tYzRcuVTEHmC1SqXRKn9cjTa1wIhpDzPHks8W', NULL, NULL, NULL, 1, 'Jericko', 'Librada'),
('0007', 'alivio1', '$2y$10$tOOPZeRBEiOKZ45vt38EL.yKHHwEdfQmdLcLLm4.sBclQF2rq3I/K', NULL, NULL, NULL, 1, 'Andrea', 'Alivio'),
('0008', 'flores1', '$2y$10$xdzk585yw5jv3t27u0.IUuz06DWFpv1uFPrAcW9vtflWTg1DMpzi.', NULL, NULL, NULL, 1, 'Jeanne', 'Flores'),
('0009', 'sy1', '$2y$10$mVwUXZ8EUJdftZruhxxM5u.TWipoG8bOrCXTbBWStJZo7Y2PCKPO.', NULL, NULL, NULL, 1, 'Joselito', 'Sy'),
('0010', 'parreno1', '$2y$10$au4rX6Pjn15C.oTt/kHRiucwofqhpMi/d.oWMFYShhtshOGOjxE1S', NULL, NULL, NULL, 1, 'Arianne Ruth', 'Parreño'),
('0011', 'suyom1', '$2y$10$VwXAozs6/M0PgLAnOKOZO.dCgLIkQq/fO77Gwma0vZmIccSLoLKbG', NULL, NULL, NULL, 1, 'Arvin', 'Suyom'),
('0012', 'marcelino1', '$2y$10$Zy7bqefElhn6mWjNyi32bedyLG8jbEv1BONT03CGGUmm.vqy1f.F.', NULL, NULL, NULL, 1, 'Keila', 'Marcelino'),
('0013', 'bulingit1', '$2y$10$JCsThCrajRtoHCHDg90heevjLoYqu15tVHGJHnWSenvsc2mVXMkSe', NULL, NULL, NULL, 1, 'Harvey', 'Bulingit'),
('0014', 'esteves1', '$2y$10$64bGI7PfQQK5BylF9j0r6.RAdNjf7/TKg/uGGwUlhWW1b.kwbSc26', NULL, NULL, NULL, 1, 'Marylle Clarice', 'Esteves'),
('0015', 'cajuguiran1', '$2y$10$7QAGhER28UUA9XDSBebf8ernCx0Q3igU4uqQmkC789gdZvwaZDLqC', NULL, NULL, NULL, 1, 'John Victor', 'Cajuguiran'),
('0016', 'galiza1', '$2y$10$lFKzHRZihnj0ZMMeLrQ4DOamseZDHiWR/7pfIvP2EgtyJVgWFHxjS', NULL, NULL, NULL, 1, 'Dominic Joaquin', 'Galiza'),
('0017', 'gigante1', '$2y$10$gFElh3V0m8ntwBddIUsQl.UzGQow1hS49K5TqyHKcgRrcEau1.3C.', NULL, NULL, NULL, 1, 'Cai', 'Gigante'),
('0018', 'angala1', '$2y$10$WTr2MlWDQqwIAUwZLdXFPecd1Krtd0JB76EYymtJhxbnU295CWsOy', NULL, NULL, NULL, 1, 'Jerico', 'Angala'),
('0019', 'paano1', '$2y$10$zcoRsPBdTNMdKeegpYdIYOppRtoZeRtvdoTSAtz96rkV1SndQsmX.', NULL, NULL, NULL, 1, 'Kerstein May', 'Paano'),
('0020', 'lamberte1', '$2y$10$RLN402DtGVTSEa/hbweHM.O/kL92Op2rWwzRA2tEsHe8BMp.ejGjy', NULL, NULL, NULL, 1, 'Rhol', 'Lamberte');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `TeamID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `TeamLeader` varchar(10) DEFAULT NULL,
  `TeamName` varchar(255) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`TeamID`, `DepartmentID`, `TeamLeader`, `TeamName`, `isActive`) VALUES
(1, 4, NULL, 'Sales Support', 1),
(2, 4, NULL, 'Tech Support', 1),
(22, 1, '0001', 'Recruitment', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `TicketNo` varchar(10) NOT NULL,
  `CreatedDatetime` datetime NOT NULL DEFAULT current_timestamp(),
  `EnqueuedDatetime` datetime DEFAULT current_timestamp(),
  `AssignedDatetime` datetime DEFAULT NULL,
  `ClosedDatetime` datetime DEFAULT NULL,
  `PriorityLevel` int(11) NOT NULL,
  `TransferringTeam` varchar(255) DEFAULT NULL,
  `AssignedEmployee` varchar(10) DEFAULT NULL,
  `CategoryID` int(11) NOT NULL,
  `AssignedTeam` int(11) NOT NULL,
  `Content` varchar(1000) NOT NULL,
  `CreatedBy` varchar(10) NOT NULL,
  `TicketStatus` varchar(10) NOT NULL DEFAULT 'open',
  `CSAT1` int(11) DEFAULT NULL,
  `CSAT2` int(11) DEFAULT NULL,
  `NPS` int(11) DEFAULT NULL,
  `Feedback` varchar(1000) DEFAULT NULL,
  `RatingDatetime` datetime DEFAULT NULL,
  `Unread` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ticketattachment`
--

CREATE TABLE `ticketattachment` (
  `ID` int(11) NOT NULL,
  `TicketNo` varchar(10) NOT NULL,
  `Attachment` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ticketcategory`
--

CREATE TABLE `ticketcategory` (
  `CategoryID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `AssignedTeam` int(11) DEFAULT NULL,
  `DefaultPriority` int(11) NOT NULL DEFAULT 1,
  `isActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ticketingsla`
--

CREATE TABLE `ticketingsla` (
  `SlaId` int(11) NOT NULL,
  `TicketConcurrency` int(11) DEFAULT NULL,
  `L1MaxWaitingTime` int(11) DEFAULT NULL,
  `L2MaxWaitingTime` int(11) DEFAULT NULL,
  `L3MaxWaitingTime` int(11) DEFAULT NULL,
  `L1MaxHandlingTime` int(11) DEFAULT NULL,
  `L2MaxHandlingTime` int(11) DEFAULT NULL,
  `L3MaxHandlingTime` int(11) DEFAULT NULL,
  `MaxRepAwayTime` int(11) DEFAULT NULL,
  `MaxTotalRepAwayTime` int(11) DEFAULT NULL,
  `MaxRepBreakTime` int(11) DEFAULT NULL,
  `MaxRepLunchTime` int(11) DEFAULT NULL,
  `MaxTicketIdleTime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticketingsla`
--

INSERT INTO `ticketingsla` (`SlaId`, `TicketConcurrency`, `L1MaxWaitingTime`, `L2MaxWaitingTime`, `L3MaxWaitingTime`, `L1MaxHandlingTime`, `L2MaxHandlingTime`, `L3MaxHandlingTime`, `MaxRepAwayTime`, `MaxTotalRepAwayTime`, `MaxRepBreakTime`, `MaxRepLunchTime`, `MaxTicketIdleTime`) VALUES
(1, 2, 31, 21, 11, 21, 16, 11, 11, 21, 17, 61, 16);

-- --------------------------------------------------------

--
-- Table structure for table `warehousestock`
--

CREATE TABLE `warehousestock` (
  `ProductID` int(10) NOT NULL,
  `AvailableStock` int(11) NOT NULL DEFAULT 0,
  `MinimumStockLimit` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD PRIMARY KEY (`CartID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `ProductID` (`ProductID`) USING BTREE;

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`CommentID`),
  ADD KEY `TicketNo` (`TicketNo`),
  ADD KEY `ReplyingRepId` (`ReplyingRepId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `customeraddress`
--
ALTER TABLE `customeraddress`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `deduction`
--
ALTER TABLE `deduction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`TransactionNumber`),
  ADD KEY `ReceivedBy` (`ReceivedBy`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD KEY `DepartmentID` (`DepartmentID`),
  ADD KEY `TeamID` (`TeamID`),
  ADD KEY `SalaryGrade` (`SalaryGrade`),
  ADD KEY `Position` (`Position`),
  ADD KEY `ScheduleID` (`ScheduleID`);

--
-- Indexes for table `employeeattendance`
--
ALTER TABLE `employeeattendance`
  ADD PRIMARY KEY (`AttendanceID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `ordereditem`
--
ALTER TABLE `ordereditem`
  ADD PRIMARY KEY (`OrderedItemID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ordereditem_ibfk_2` (`ProductID`);

--
-- Indexes for table `paymentmethod`
--
ALTER TABLE `paymentmethod`
  ADD PRIMARY KEY (`PaymentMethodID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`PayrollID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `SalaryGradeID` (`SalaryGradeID`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`PositionID`),
  ADD KEY `InitialSalary` (`InitialSalary`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  ADD PRIMARY KEY (`TransactionNumber`),
  ADD KEY `SupplierID` (`SupplierID`),
  ADD KEY `CreatedBy` (`CreatedBy`);

--
-- Indexes for table `purchaseorderitem`
--
ALTER TABLE `purchaseorderitem`
  ADD PRIMARY KEY (`PurchaseItemID`),
  ADD KEY `TransactionNumber` (`TransactionNumber`),
  ADD KEY `purchaseorderitem_ibfk_2` (`ProductID`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `fk_team_id` (`TeamID`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`RatingID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `rating_ibfk_2` (`ProductID`);

--
-- Indexes for table `releaseorder`
--
ALTER TABLE `releaseorder`
  ADD PRIMARY KEY (`ReleaseOrderID`),
  ADD KEY `CreatedBy` (`CreatedBy`),
  ADD KEY `releaseorder_ibfk_1` (`ProductID`);

--
-- Indexes for table `representativehandledticket`
--
ALTER TABLE `representativehandledticket`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TicketNo` (`TicketNo`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `returneditem`
--
ALTER TABLE `returneditem`
  ADD PRIMARY KEY (`ReturnID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `returneditem_ibfk_2` (`ProductID`);

--
-- Indexes for table `salarygrade`
--
ALTER TABLE `salarygrade`
  ADD PRIMARY KEY (`SalaryGradeID`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialsecuritynumber`
--
ALTER TABLE `socialsecuritynumber`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `storestock`
--
ALTER TABLE `storestock`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`);

--
-- Indexes for table `systemaccount`
--
ALTER TABLE `systemaccount`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`TeamID`),
  ADD KEY `DepartmentID` (`DepartmentID`),
  ADD KEY `fk_teamleader` (`TeamLeader`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`TicketNo`),
  ADD KEY `AssignedEmployee` (`AssignedEmployee`),
  ADD KEY `CategoryID` (`CategoryID`),
  ADD KEY `CreatedBy` (`CreatedBy`),
  ADD KEY `fk_assigned_team_id` (`AssignedTeam`);

--
-- Indexes for table `ticketattachment`
--
ALTER TABLE `ticketattachment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TicketNo` (`TicketNo`);

--
-- Indexes for table `ticketcategory`
--
ALTER TABLE `ticketcategory`
  ADD PRIMARY KEY (`CategoryID`),
  ADD KEY `AssignedTeam` (`AssignedTeam`);

--
-- Indexes for table `ticketingsla`
--
ALTER TABLE `ticketingsla`
  ADD PRIMARY KEY (`SlaId`);

--
-- Indexes for table `warehousestock`
--
ALTER TABLE `warehousestock`
  ADD PRIMARY KEY (`ProductID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cartitem`
--
ALTER TABLE `cartitem`
  MODIFY `CartID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `CommentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customeraddress`
--
ALTER TABLE `customeraddress`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deduction`
--
ALTER TABLE `deduction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `TransactionNumber` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `DepartmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employeeattendance`
--
ALTER TABLE `employeeattendance`
  MODIFY `AttendanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `ordereditem`
--
ALTER TABLE `ordereditem`
  MODIFY `OrderedItemID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paymentmethod`
--
ALTER TABLE `paymentmethod`
  MODIFY `PaymentMethodID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `PayrollID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `PositionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  MODIFY `TransactionNumber` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseorderitem`
--
ALTER TABLE `purchaseorderitem`
  MODIFY `PurchaseItemID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `RatingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `releaseorder`
--
ALTER TABLE `releaseorder`
  MODIFY `ReleaseOrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `representativehandledticket`
--
ALTER TABLE `representativehandledticket`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returneditem`
--
ALTER TABLE `returneditem`
  MODIFY `ReturnID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salarygrade`
--
ALTER TABLE `salarygrade`
  MODIFY `SalaryGradeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `SupplierID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `TeamID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `ticketattachment`
--
ALTER TABLE `ticketattachment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticketcategory`
--
ALTER TABLE `ticketcategory`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticketingsla`
--
ALTER TABLE `ticketingsla`
  MODIFY `SlaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD CONSTRAINT `cartitem_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `cartitem_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`TicketNo`) REFERENCES `ticket` (`TicketNo`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`ReplyingRepId`) REFERENCES `employee` (`EmployeeID`);

--
-- Constraints for table `customeraddress`
--
ALTER TABLE `customeraddress`
  ADD CONSTRAINT `customeraddress_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`TransactionNumber`) REFERENCES `purchaseorder` (`TransactionNumber`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`ReceivedBy`) REFERENCES `employee` (`EmployeeID`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`TeamID`) REFERENCES `team` (`TeamID`),
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`SalaryGrade`) REFERENCES `salarygrade` (`SalaryGradeID`),
  ADD CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`Position`) REFERENCES `position` (`PositionID`),
  ADD CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`ScheduleID`) REFERENCES `schedule` (`id`);

--
-- Constraints for table `employeeattendance`
--
ALTER TABLE `employeeattendance`
  ADD CONSTRAINT `employeeattendance_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `ordereditem`
--
ALTER TABLE `ordereditem`
  ADD CONSTRAINT `ordereditem_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  ADD CONSTRAINT `ordereditem_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `paymentmethod`
--
ALTER TABLE `paymentmethod`
  ADD CONSTRAINT `paymentmethod_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `payroll`
--
ALTER TABLE `payroll`
  ADD CONSTRAINT `payroll_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`),
  ADD CONSTRAINT `payroll_ibfk_2` FOREIGN KEY (`SalaryGradeID`) REFERENCES `salarygrade` (`SalaryGradeID`);

--
-- Constraints for table `position`
--
ALTER TABLE `position`
  ADD CONSTRAINT `position_ibfk_1` FOREIGN KEY (`InitialSalary`) REFERENCES `salarygrade` (`SalaryGradeID`);

--
-- Constraints for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  ADD CONSTRAINT `purchaseorder_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`),
  ADD CONSTRAINT `purchaseorder_ibfk_2` FOREIGN KEY (`CreatedBy`) REFERENCES `employee` (`EmployeeID`);

--
-- Constraints for table `purchaseorderitem`
--
ALTER TABLE `purchaseorderitem`
  ADD CONSTRAINT `purchaseorderitem_ibfk_1` FOREIGN KEY (`TransactionNumber`) REFERENCES `purchaseorder` (`TransactionNumber`),
  ADD CONSTRAINT `purchaseorderitem_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `queue`
--
ALTER TABLE `queue`
  ADD CONSTRAINT `fk_team_id` FOREIGN KEY (`TeamID`) REFERENCES `team` (`TeamID`),
  ADD CONSTRAINT `queue_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `releaseorder`
--
ALTER TABLE `releaseorder`
  ADD CONSTRAINT `releaseorder_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  ADD CONSTRAINT `releaseorder_ibfk_2` FOREIGN KEY (`CreatedBy`) REFERENCES `employee` (`EmployeeID`);

--
-- Constraints for table `representativehandledticket`
--
ALTER TABLE `representativehandledticket`
  ADD CONSTRAINT `representativehandledticket_ibfk_1` FOREIGN KEY (`TicketNo`) REFERENCES `ticket` (`TicketNo`),
  ADD CONSTRAINT `representativehandledticket_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`);

--
-- Constraints for table `returneditem`
--
ALTER TABLE `returneditem`
  ADD CONSTRAINT `returneditem_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  ADD CONSTRAINT `returneditem_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  ADD CONSTRAINT `returneditem_ibfk_3` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `socialsecuritynumber`
--
ALTER TABLE `socialsecuritynumber`
  ADD CONSTRAINT `socialsecuritynumber_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`);

--
-- Constraints for table `storestock`
--
ALTER TABLE `storestock`
  ADD CONSTRAINT `storestock_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `systemaccount`
--
ALTER TABLE `systemaccount`
  ADD CONSTRAINT `systemaccount_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`);

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `fk_teamleader` FOREIGN KEY (`TeamLeader`) REFERENCES `employee` (`EmployeeID`),
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_assigned_team_id` FOREIGN KEY (`AssignedTeam`) REFERENCES `team` (`TeamID`),
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`AssignedEmployee`) REFERENCES `employee` (`EmployeeID`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `ticketcategory` (`CategoryID`),
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`CreatedBy`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `ticketattachment`
--
ALTER TABLE `ticketattachment`
  ADD CONSTRAINT `ticketattachment_ibfk_1` FOREIGN KEY (`TicketNo`) REFERENCES `ticket` (`TicketNo`);

--
-- Constraints for table `ticketcategory`
--
ALTER TABLE `ticketcategory`
  ADD CONSTRAINT `ticketcategory_ibfk_1` FOREIGN KEY (`AssignedTeam`) REFERENCES `team` (`TeamID`);

--
-- Constraints for table `warehousestock`
--
ALTER TABLE `warehousestock`
  ADD CONSTRAINT `warehousestock_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
