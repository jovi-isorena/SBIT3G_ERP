-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2021 at 08:50 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


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
  `ProductID` varchar(10) NOT NULL,
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
  `ReplyingRepId` varchar(10) NOT NULL,
  `Content` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` varchar(10) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) NOT NULL,
  `Suffix` varchar(10) DEFAULT NULL,
  `Birthdate` date NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Barangay` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `Zip` varchar(10) DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` varchar(10) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Suffix` varchar(10) NOT NULL,
  `Birthdate` date NOT NULL,
  `HomeAddress` varchar(255) NOT NULL,
  `AttendancePIN` varchar(20) NULL,
  `DepartmentID` int(11) DEFAULT NULL,
  `TeamID` int(11) DEFAULT NULL,
  `SalaryGrade` int(11) DEFAULT NULL,
  `Position` int(11) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employeeattendance`
--

CREATE TABLE `employeeattendance` (
  `AttendanceID` int(11) NOT NULL,
  `EmployeeID` varchar(10) NOT NULL,
  `DateTimeIn` datetime DEFAULT NULL,
  `DateTimeOut` datetime DEFAULT NULL,
  `Undertime` int(11) DEFAULT NULL,
  `Overtime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `ProductID` varchar(10) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paymentmethod`
--

CREATE TABLE `paymentmethod` (
  `PaymentMethodID` int(11) NOT NULL,
  `CustomerID` varchar(10) NOT NULL,
  `MethodType` varchar(10) NOT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` varchar(10) NOT NULL,
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
  `ProductID` varchar(10) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `BuyingPrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `RatingID` int(11) NOT NULL,
  `CustomerID` varchar(10) NOT NULL,
  `ProductID` varchar(10) NOT NULL,
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
  `ProductID` varchar(10) NOT NULL,
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
  `ProductID` varchar(10) NOT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `storestock`
--

CREATE TABLE `storestock` (
  `ProductID` varchar(10) NOT NULL,
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
  `isActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `TicketNo` varchar(10) NOT NULL,
  `CreatedDatetime` datetime NOT NULL DEFAULT current_timestamp(),
  `EnqueuedDatetime` datetime DEFAULT NULL,
  `AssignedDatetime` datetime DEFAULT NULL,
  `ClosedDatetime` datetime DEFAULT NULL,
  `PriorityLevel` int(11) NOT NULL,
  `TransferringTeam` varchar(255) DEFAULT NULL,
  `AssignedEmployee` varchar(10) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `Content` varchar(255) NOT NULL,
  `CreatedBy` varchar(10) NOT NULL,
  `TicketStatus` varchar(10) NOT NULL DEFAULT 'open',
  `CSAT1` int(11) DEFAULT NULL,
  `CSAT2` int(11) DEFAULT NULL,
  `NPS` int(11) DEFAULT NULL,
  `RatingDatetime` datetime DEFAULT NULL
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

-- --------------------------------------------------------

--
-- Table structure for table `warehousestock`
--

CREATE TABLE `warehousestock` (
  `ProductID` varchar(10) NOT NULL,
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
  ADD KEY `ProductID` (`ProductID`);

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
  ADD KEY `Position` (`Position`);

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
  ADD KEY `ProductID` (`ProductID`);

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
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`RatingID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `releaseorder`
--
ALTER TABLE `releaseorder`
  ADD PRIMARY KEY (`ReleaseOrderID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `CreatedBy` (`CreatedBy`);

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
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `salarygrade`
--
ALTER TABLE `salarygrade`
  ADD PRIMARY KEY (`SalaryGradeID`);

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
  ADD KEY `CreatedBy` (`CreatedBy`);

--
-- Indexes for table `ticketcategory`
--
ALTER TABLE `ticketcategory`
  ADD PRIMARY KEY (`CategoryID`),
  ADD KEY `AssignedTeam` (`AssignedTeam`);

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
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `TransactionNumber` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `DepartmentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employeeattendance`
--
ALTER TABLE `employeeattendance`
  MODIFY `AttendanceID` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `PositionID` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `SalaryGradeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `SupplierID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `TeamID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticketcategory`
--
ALTER TABLE `ticketcategory`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`Position`) REFERENCES `position` (`PositionID`);

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
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`AssignedEmployee`) REFERENCES `employee` (`EmployeeID`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `ticketcategory` (`CategoryID`),
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`CreatedBy`) REFERENCES `customer` (`CustomerID`);

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
