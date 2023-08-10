-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 10, 2023 at 06:18 AM
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
-- Table structure for table `airline`
--

CREATE TABLE `airline` (
  `AirLineID` int NOT NULL,
  `AirLineName` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airline`
--

INSERT INTO `airline` (`AirLineID`, `AirLineName`) VALUES
(1, 'AKBAR TRAVEL'),
(2, 'AIR BLUE'),
(3, 'AL DIYAFA');

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE `attachment` (
  `AttachmentID` int NOT NULL,
  `InvoiceNo` varchar(25) DEFAULT NULL,
  `FileName` varchar(75) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `challan_detail`
--

CREATE TABLE `challan_detail` (
  `ChallanDetailID` int NOT NULL,
  `ChallanMasterID` int NOT NULL,
  `ChallanNo` varchar(10) DEFAULT NULL,
  `ChallanDate` date DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `Rate` double(8,2) DEFAULT NULL,
  `TaxAmount` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `challan_master`
--

CREATE TABLE `challan_master` (
  `ChallanMasterID` int NOT NULL,
  `ChallanNo` varchar(10) DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `WalkinCustomerName` varchar(75) DEFAULT NULL,
  `PlaceOfSupply` varchar(25) DEFAULT NULL,
  `ReferenceNo` varchar(25) DEFAULT NULL,
  `ChallanDate` date DEFAULT NULL,
  `ChallanType` varchar(25) DEFAULT NULL,
  `CustomerNotes` varchar(255) DEFAULT NULL,
  `DescriptionNotes` varchar(255) DEFAULT NULL,
  `TermAndCondition` varchar(255) DEFAULT NULL,
  `File` varchar(75) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `SubTotal` double(8,2) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL,
  `DiscountPer` double(8,2) DEFAULT NULL,
  `DiscountAmount` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Shipping` double(8,2) DEFAULT NULL,
  `GrandTotal` double(8,2) DEFAULT NULL,
  `Paid` double(8,2) DEFAULT NULL,
  `Balance` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `challan_type`
--

CREATE TABLE `challan_type` (
  `ChallanTypeID` int NOT NULL,
  `ChallanTypeName` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `challan_type`
--

INSERT INTO `challan_type` (`ChallanTypeID`, `ChallanTypeName`) VALUES
(2, 'Supply of Goods'),
(3, 'Job Work'),
(4, 'Supply on Approval'),
(5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `chartofaccount`
--

CREATE TABLE `chartofaccount` (
  `ChartOfAccountID` int NOT NULL,
  `CODE` varchar(15) DEFAULT NULL,
  `ChartOfAccountName` varchar(75) DEFAULT NULL,
  `OpenDebit` int DEFAULT NULL,
  `OpenCredit` int DEFAULT NULL,
  `L1` int DEFAULT NULL,
  `L2` int DEFAULT NULL,
  `L3` int DEFAULT NULL,
  `Category` varchar(55) DEFAULT NULL,
  `Level` int DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chartofaccount`
--

INSERT INTO `chartofaccount` (`ChartOfAccountID`, `CODE`, `ChartOfAccountName`, `OpenDebit`, `OpenCredit`, `L1`, `L2`, `L3`, `Category`, `Level`, `Status`) VALUES
(100000, 'A', 'ASSETS', NULL, NULL, 100000, 100000, 100000, NULL, 1, 'LOCK'),
(110000, 'A', 'CURRENT ASSETS', NULL, NULL, 100000, 110000, 110000, NULL, 2, NULL),
(110200, 'A', 'BANK DEPOSITS', NULL, NULL, 100000, 110000, 110200, NULL, 3, NULL),
(110201, 'A', 'ADCB BANK', NULL, NULL, 100000, 110000, 110200, 'BANK', 3, 'LOCK'),
(110400, 'A', 'Accounts Receivable', NULL, NULL, 100000, 110000, 110400, '0', 3, 'LOCK'),
(110401, 'A', 'PARTY A/C.', NULL, NULL, 100000, 110000, 110400, NULL, 3, NULL),
(110402, 'A', 'OTHER RECEIVABLES', NULL, NULL, 100000, 110000, 110400, NULL, 3, NULL),
(110490, 'A', 'BAD DEBTS', NULL, NULL, 100000, 110000, 110400, NULL, 3, NULL),
(110600, 'A', 'MISC. ADJUSTMENTS', NULL, NULL, 100000, 110000, 110600, NULL, 3, NULL),
(110700, 'A', 'STOCK INVENTORY', NULL, NULL, 100000, 110000, 110000, NULL, 3, NULL),
(110900, 'A', 'curent - asset-child', NULL, NULL, 100000, 110000, 110000, NULL, 3, NULL),
(111000, 'A', 'Cash in Bank - Mashreq', NULL, NULL, 100000, 110000, 110000, 'BANK', 3, 'LOCK'),
(111100, 'A', 'Cash in Bank - ADCB 12387035920001', NULL, NULL, 100000, 110000, 110000, 'BANK', 3, 'LOCK'),
(111200, 'A', 'Refundable Deposit', NULL, NULL, 100000, 110000, 110000, '0', 3, NULL),
(111300, 'A', 'PETTY CASH', NULL, NULL, 100000, 110000, 110000, '0', 3, NULL),
(111400, 'A', 'Security Deposit', NULL, NULL, 100000, 110000, 110000, '0', 3, NULL),
(111500, 'A', 'Credit Card Account', NULL, NULL, 100000, 110000, 110000, 'CARD', 3, NULL),
(111600, 'A', 'Computer & Accessories', NULL, NULL, 100000, 110000, 110000, '0', 3, NULL),
(111700, 'A', 'Accum. Dep- Furniture & Equipment', NULL, NULL, 100000, 110000, 110000, '0', 3, NULL),
(111800, 'A', 'Accounts Receivables', NULL, NULL, 100000, 110000, 110000, '0', 3, NULL),
(111900, 'A', 'Accum. Dep- Computer Equip & Acces', NULL, NULL, 100000, 110000, 110000, '0', 3, NULL),
(112000, 'A', 'Accum. Dep- Office Equipment', NULL, NULL, 100000, 110000, 110000, '0', 3, NULL),
(112100, 'A', 'Petty Cash- Anne', NULL, NULL, 100000, 110000, 110000, '0', 3, NULL),
(112200, 'A', 'Staff Advance', NULL, NULL, 100000, 110000, 110000, '0', 3, NULL),
(112300, 'A', 'Prepaid Rent Expense', NULL, NULL, 100000, 110000, 110000, '0', 3, NULL),
(120000, 'A', 'FIXED ASSETS', NULL, NULL, 100000, 120000, 120000, NULL, 2, NULL),
(120101, 'A', 'ACCUMULATED DEPRECIATION', NULL, NULL, 100000, 120000, 120000, '0', 3, NULL),
(120125, 'A', 'VEHICLES', NULL, NULL, 100000, 120000, 120100, NULL, 3, NULL),
(120227, 'A', 'FURNITURE AND EQUIPMENT', NULL, NULL, 100000, 120000, 120000, '0', 3, NULL),
(120327, 'A', 'Office Equipment', NULL, NULL, 100000, 120000, 120000, '0', 3, NULL),
(130000, 'A', 'OTHER ASSETS', NULL, NULL, 100000, 130000, 130000, NULL, 2, NULL),
(130300, 'A', 'PREPAID LICENSE FEE', NULL, NULL, 100000, 130000, 130000, '0', 3, NULL),
(130400, 'A', 'PREPAID EXPENSES', NULL, NULL, 100000, 130000, 130000, '0', 3, NULL),
(140100, 'A', 'DEFERRED ASSETS', NULL, NULL, 100000, 140000, 140100, NULL, 3, NULL),
(140200, 'A', 'DEPOSITS', NULL, NULL, 100000, 140000, 140200, NULL, 3, NULL),
(140300, 'A', 'LEASEHOLD IMPROV.NET', NULL, NULL, 100000, 140000, 140300, NULL, 3, NULL),
(140400, 'A', 'Prepaid Medical Insurance', NULL, NULL, 100000, 130000, 140400, '0', 3, NULL),
(150200, 'A', 'Prepaid Visa Expense', NULL, NULL, 100000, 130000, 150200, '0', 3, NULL),
(160000, 'A', 'asst-test', NULL, NULL, 100000, 160000, 160000, NULL, 2, NULL),
(160100, 'A', 'asset-test-child', NULL, NULL, 100000, 160000, 160000, NULL, 3, NULL),
(200000, 'L', 'LIABILITIES', NULL, NULL, 200000, 200000, 200000, NULL, 1, NULL),
(200001, 'L', 'Payable to Mr. Babar', NULL, NULL, 200000, 200000, 200001, '0', 3, NULL),
(200002, 'L', 'PAYABLE TO MR. ASIM', NULL, NULL, 200000, 200000, 200002, '0', 3, NULL),
(200100, 'L', 'PAYABLE TO MR. KALEEM', NULL, NULL, 200000, 210000, 210000, '0', 3, 'LOCK'),
(200200, 'L', 'Friends Commodity Brokerage LLC', NULL, NULL, 200000, 210000, 210000, '0', 3, 'LOCK'),
(200300, 'L', 'SALARY PAYABLE', NULL, NULL, 200000, 210000, 210000, NULL, 3, 'LOCK'),
(200500, 'L', 'PDC Payable', NULL, NULL, 200000, 210000, 210000, '0', 3, NULL),
(200600, 'L', 'Staff Gratuity Payable', NULL, NULL, 200000, 210000, 210000, '0', 3, NULL),
(200700, 'L', 'Telephone & Internet Payable', NULL, NULL, 200000, 210000, 210000, '0', 3, NULL),
(200800, 'L', 'UTILITIES PAYABLE', NULL, NULL, 200000, 210000, 200801, NULL, 3, NULL),
(200801, 'L', 'Payable to Anne (PRO)', NULL, NULL, 200000, 210000, 200801, '0', 3, NULL),
(210000, 'L', 'SHORT TERM LIABILITY', NULL, NULL, 200000, 210000, 210000, NULL, 2, NULL),
(210100, 'L', 'A/C PAYABLE', NULL, NULL, 200000, 210000, 210100, 'A/P', 3, 'LOCK'),
(210102, 'L', 'OTHER PAYABLES', NULL, NULL, 200000, 210000, 210100, NULL, 3, NULL),
(210302, 'L', 'MARKETING COMMISSION PAYABLE.', NULL, NULL, 200000, 210000, 210300, NULL, 3, NULL),
(210303, 'L', 'TAKAFAL PAYABLE.', NULL, NULL, 200000, 210000, 210300, NULL, 3, NULL),
(210403, 'L', 'PAYABLE TO MR. ASIM', NULL, NULL, 200000, 210000, 210000, '0', 3, NULL),
(210404, 'L', 'Grand Alliance Commercial Brokerage LLC', NULL, NULL, 200000, 210000, 210404, '0', 3, NULL),
(220000, 'L', 'SECURITIES', NULL, NULL, 200000, 220000, 220000, NULL, 2, NULL),
(220100, 'L', 'Cooling Charges Payable', NULL, NULL, 200000, 220000, 220000, '0', 3, NULL),
(230000, 'L', 'STAFF PAYABLE', NULL, NULL, 200000, 230000, 230000, NULL, 2, NULL),
(230100, 'L', 'VAT-OUTPUT TAX', NULL, NULL, 200000, 230000, 230000, NULL, 3, NULL),
(230200, 'L', 'VAT-INPUT TAX', NULL, NULL, 200000, 230000, 230000, NULL, 3, NULL),
(230300, 'L', 'STAFF ANNUAL LEAVE PAYABLE', NULL, NULL, 200000, 230000, 230000, '0', 3, NULL),
(230400, 'L', 'STAFF END OF SERVICE PAYABLE', NULL, NULL, 200000, 230000, 230000, '0', 3, NULL),
(230401, 'L', 'Staff Air Ticket Payable', NULL, NULL, 200000, 230000, 230401, '0', 3, NULL),
(230402, 'L', 'Uncollected Salary', NULL, NULL, 200000, 230000, 230402, '0', 3, NULL),
(240000, 'L', 'Rent Payable', NULL, NULL, 200000, 240000, 240000, NULL, 2, NULL),
(250000, 'L', 'STAFF PAYABLE', NULL, NULL, 200000, 250000, 250000, NULL, 2, NULL),
(300000, 'C', 'STOCKHOLDERS EQUITY', NULL, NULL, 300000, 300000, 300000, NULL, 1, 'LOCK'),
(300100, 'C', 'Share Capital Investment - Mr. Babar', NULL, NULL, 300000, 310000, 300100, '0', 3, NULL),
(310000, 'C', 'CAPITAL INVESTMENT', NULL, NULL, 300000, 310000, 310000, NULL, 2, NULL),
(310100, 'C', 'CAPITAL STOCK.', NULL, NULL, 300000, 310000, 310100, NULL, 3, NULL),
(310102, 'C', 'PROFIT AND LOSS A/C.', NULL, NULL, 300000, 310000, 310100, NULL, 3, NULL),
(310103, 'C', 'CURRENT PERIOD PROF/LOSS.', NULL, NULL, 300000, 310000, 310100, NULL, 3, NULL),
(310104, 'C', 'MUHAMMAD ASIM JAN', NULL, NULL, 300000, 310000, 310100, NULL, 3, NULL),
(310105, 'C', 'MUHAMMAD FAISAL', NULL, NULL, 300000, 310000, 310100, NULL, 3, NULL),
(310205, 'C', 'Partner Current Account - Mr. Babar', NULL, NULL, 300000, 310000, 310000, '0', 3, NULL),
(320000, 'C', 'CAPITAL WITHDRAWALS', NULL, NULL, 300000, 320000, 320000, NULL, 2, NULL),
(320100, 'C', 'CAPITAL WITHDRAWALS', NULL, NULL, 300000, 320000, 320100, NULL, 3, NULL),
(400000, 'R', 'REVENUES', NULL, NULL, 400000, 400000, 400000, NULL, 1, 'LOCK'),
(410000, 'R', 'SALES:-', NULL, NULL, 400000, 410000, 410000, NULL, 2, 'LOCK'),
(410100, 'R', 'SALES:-', NULL, NULL, 400000, 410000, 410100, NULL, 3, 'LOCK'),
(410101, 'R', 'COMMISSION.', NULL, NULL, 400000, 410000, 410100, NULL, 3, NULL),
(410150, 'R', 'SALE OF TICKET', NULL, NULL, 400000, 410000, 410100, NULL, 3, NULL),
(410151, 'R', 'INCOME FROM REPAIR', NULL, NULL, 400000, 410000, 410100, NULL, 3, NULL),
(410152, 'R', 'DISCOUNT RECEIVED', NULL, NULL, 400000, 410000, 410100, NULL, 3, NULL),
(410155, 'R', 'SALES DISCOUNTS', NULL, NULL, 400000, 410000, 410100, NULL, 3, NULL),
(410172, 'R', 'FREIGHT CHARGES', NULL, NULL, 400000, 410000, 410100, NULL, 3, NULL),
(410173, 'R', 'INCOME SALE COMMISSION.', NULL, NULL, 400000, 410000, 410100, NULL, 3, NULL),
(410175, 'R', 'SALE RETURNS.', NULL, NULL, 400000, 410000, 410100, NULL, 3, NULL),
(410180, 'R', 'SALE RETURN DISCOUNT.', NULL, NULL, 400000, 410000, 410100, NULL, 3, NULL),
(410185, 'R', 'SALE RETURN FREIGHT', NULL, NULL, 400000, 410000, 410100, NULL, 3, NULL),
(410200, 'R', 'OTHER INCOME', NULL, NULL, 400000, 410000, 410200, NULL, 3, NULL),
(410201, 'R', 'MISC. INCOME', NULL, NULL, 400000, 410000, 410200, NULL, 3, NULL),
(410205, 'R', 'OTHER SALES.', NULL, NULL, 400000, 410000, 410200, NULL, 3, NULL),
(420000, 'R', 'OTHER REVENUES', NULL, NULL, 400000, 420000, 420000, NULL, 2, NULL),
(420100, 'R', 'OTHER INCOME', NULL, NULL, 400000, 420000, 420100, NULL, 3, NULL),
(420101, 'R', 'OTHER INCOME 2', NULL, NULL, 400000, 420000, 420100, NULL, 3, NULL),
(420104, 'R', 'PENDING/TARGET INCOME', NULL, NULL, 400000, 420000, 420100, NULL, 3, NULL),
(420105, 'R', 'SERVICE CHARGES', NULL, NULL, 400000, 420000, 420100, NULL, 3, NULL),
(420200, 'R', 'OTHER INCOME', NULL, NULL, 400000, 420000, 420200, NULL, 3, NULL),
(500000, 'E', 'TOTAL EXPENSES', NULL, NULL, 500000, 500000, 500000, NULL, 1, 'LOCK'),
(500100, 'E', 'Shipping Expenses', NULL, NULL, 500000, 500000, 500000, NULL, 2, NULL),
(500200, 'E', 'COST OF SALES', NULL, NULL, 500000, 500000, 500000, NULL, 2, NULL),
(500300, 'E', 'Car Repair & Maintenance Expense', NULL, NULL, 500000, 500000, 500000, '0', 2, NULL),
(500400, 'E', 'Water & Electricity Expense', NULL, NULL, 500000, 520000, 510000, '0', 2, NULL),
(500500, 'E', 'Bonus/ Commission Expense', NULL, NULL, 500000, 520000, 510000, '0', 2, NULL),
(500600, 'E', 'Meals & Entertainment Expense', NULL, NULL, 500000, 520000, 510000, '0', 2, NULL),
(500700, 'E', 'Medical Insurance Expense', NULL, NULL, 500000, 520000, 510000, '0', 2, NULL),
(510000, 'E', 'COST OF GOODS SOLD.', NULL, NULL, 500000, 510000, 510000, NULL, 2, NULL),
(510101, 'E', 'OPENING STOCK.', NULL, NULL, 500000, 510000, 510100, NULL, 3, NULL),
(510102, 'E', 'PURCHASES', NULL, NULL, 500000, 510000, 510100, NULL, 3, NULL),
(510103, 'E', 'PURCHASE OF TICKET', NULL, NULL, 500000, 510000, 510100, NULL, 3, NULL),
(510104, 'E', 'DISCOUNT ALLOWED', NULL, NULL, 500000, 510000, 510100, NULL, 3, NULL),
(510105, 'E', 'PURCHASE DISCOUNTS', NULL, NULL, 500000, 510000, 510100, NULL, 3, NULL),
(510107, 'E', 'PURCHASE LOADING', NULL, NULL, 500000, 510000, 510100, NULL, 3, NULL),
(510109, 'E', 'PURCHASE UNLOADING', NULL, NULL, 500000, 510000, 510100, NULL, 3, NULL),
(510110, 'E', 'PURCHASE RETURN.', NULL, NULL, 500000, 510000, 510100, NULL, 3, NULL),
(510117, 'E', 'ZAKAT ACCOUNT.', NULL, NULL, 500000, 510000, 510100, NULL, 3, NULL),
(510120, 'E', 'PURCHASES MISC. ADJ.', NULL, NULL, 500000, 510000, 510100, NULL, 3, NULL),
(510122, 'E', 'PURCHASE BENDING', NULL, NULL, 500000, 510000, 510100, NULL, 3, NULL),
(510145, 'E', 'STOCK EXPENSES', NULL, NULL, 500000, 510000, 510100, NULL, 3, NULL),
(510200, 'E', 'PACKING MATERIAL EXPENS.', NULL, NULL, 500000, 510000, 510200, NULL, 3, NULL),
(510400, 'E', 'MARKETING EXPENSES', NULL, NULL, 500000, 510000, 510400, NULL, 3, NULL),
(510441, 'E', 'MARKETING SALARIES', NULL, NULL, 500000, 520000, 510400, NULL, 3, NULL),
(510451, 'E', 'MARKETING PHONE/MOB EXP.', NULL, NULL, 500000, 510000, 510400, NULL, 3, NULL),
(510461, 'E', 'ENTERTAINMENT', NULL, NULL, 500000, 510000, 510400, NULL, 3, NULL),
(510661, 'E', 'Salaries & Wages Expense', NULL, NULL, 500000, 510000, 510000, '0', 3, NULL),
(510761, 'E', 'Staff & Welfare Expense', NULL, NULL, 500000, 520000, 510000, '0', 3, NULL),
(520000, 'E', 'GEN & ADMIN EXPENSES', NULL, NULL, 500000, 520000, 520000, NULL, 2, NULL),
(520100, 'E', 'Depreciation..', NULL, NULL, 500000, 520000, 520000, '0', 3, NULL),
(520101, 'E', 'Staff Air Ticket Expense', NULL, NULL, 500000, 520000, 520101, '0', 3, NULL),
(530000, 'E', 'STAFF EXPENSES', NULL, NULL, 500000, 530000, 530000, NULL, 2, NULL),
(530100, 'E', 'PAYROLL EXPENSES', NULL, NULL, 500000, 530000, 530100, NULL, 3, NULL),
(530107, 'E', 'GM PAY:-', NULL, NULL, 500000, 530000, 530100, NULL, 3, NULL),
(530108, 'E', 'YASEEN SALARY', NULL, NULL, 500000, 530000, 530100, NULL, 3, NULL),
(530109, 'E', 'BABAR SALARY', NULL, NULL, 500000, 530000, 530100, NULL, 3, NULL),
(530110, 'E', 'Annual Leave Salary Expense..', NULL, NULL, 500000, 530000, 530110, '0', 3, NULL),
(530111, 'E', 'Staff Gratuity Expense..', NULL, NULL, 500000, 530000, 530111, '0', 3, NULL),
(530200, 'E', 'ASSETS INSURANCE', NULL, NULL, 500000, 530000, 530200, NULL, 3, NULL),
(540000, 'E', 'REPAIR & MAINTENANCE', NULL, NULL, 500000, 540000, 540000, NULL, 2, NULL),
(540100, 'E', 'REPAIR & MAINTENANCE', NULL, NULL, 500000, 540000, 540100, NULL, 3, NULL),
(540110, 'E', 'R/M VEHICLE.', NULL, NULL, 500000, 540000, 540100, NULL, 3, NULL),
(540111, 'E', 'R/M FURNITURE & FIXTURE', NULL, NULL, 500000, 540000, 540100, NULL, 3, NULL),
(540112, 'E', 'R/M EQUIPMENT / COMPUTER', NULL, NULL, 500000, 540000, 540100, NULL, 3, NULL),
(540130, 'E', 'GIFT ACCOUNT.', NULL, NULL, 500000, 540000, 540100, NULL, 3, NULL),
(550000, 'E', 'OFFICE EXPENSES', NULL, NULL, 500000, 550000, 550000, NULL, 2, NULL),
(550115, 'E', 'LICENCE EXPENSE.', NULL, NULL, 500000, 550000, 550100, NULL, 3, NULL),
(550120, 'E', 'WATER BILLS', NULL, NULL, 500000, 550000, 550100, NULL, 3, NULL),
(550123, 'E', 'Office Expense..', NULL, NULL, 500000, 550000, 550100, '0', 3, NULL),
(550126, 'E', 'TEA & FOOD EXPENSES', NULL, NULL, 500000, 550000, 550100, NULL, 3, NULL),
(550134, 'E', 'MISC. EXPENSES', NULL, NULL, 500000, 550000, 550100, NULL, 3, NULL),
(550136, 'E', 'CHARITY & DONATIONS', NULL, NULL, 500000, 550000, 550100, NULL, 3, NULL),
(550138, 'E', 'NEWS PAPERS', NULL, NULL, 500000, 550000, 550100, NULL, 3, NULL),
(550140, 'E', 'MEMBERSHIP FEE', NULL, NULL, 500000, 550000, 550100, NULL, 3, NULL),
(550240, 'E', 'Rent Expense', NULL, NULL, 500000, 550000, 550000, '0', 3, NULL),
(550340, 'E', 'Office Supplies', NULL, NULL, 500000, 550000, 550000, '0', 3, NULL),
(550440, 'E', 'BONUS EXPENSE', NULL, NULL, 500000, 550000, 550000, '0', 3, NULL),
(550540, 'E', 'COOLING CHARGES', NULL, NULL, 500000, 550000, 550000, '0', 3, NULL),
(550740, 'E', 'Telephone & Internet Expense', NULL, NULL, 500000, 550000, 550000, '0', 3, NULL),
(550840, 'E', 'Repair & Maintenance Expense', NULL, NULL, 500000, 550000, 550000, '0', 3, NULL),
(550940, 'E', 'Legal & Statutory Expense', NULL, NULL, 500000, 550000, 550000, '0', 3, NULL),
(551040, 'E', 'Transportation Expense', NULL, NULL, 500000, 550000, 550000, '0', 3, NULL),
(551140, 'E', 'Cooling Expense', NULL, NULL, 500000, 550000, 550000, '0', 3, NULL),
(560000, 'E', 'FINANCIAL EXPENSES', NULL, NULL, 500000, 560000, 560000, NULL, 2, NULL),
(560100, 'E', 'FINANCIAL EXPENSES', NULL, NULL, 500000, 560000, 560100, NULL, 3, NULL),
(560110, 'E', 'BANK CHARGES', NULL, NULL, 500000, 560000, 560100, NULL, 3, NULL),
(560111, 'E', 'FEE CHARGED', NULL, NULL, 500000, 560000, 560100, NULL, 3, NULL),
(560211, 'E', 'Visit Visa Expense', NULL, NULL, 500000, 520000, 560000, '0', 3, NULL),
(560212, 'E', 'Staff Visa Expense', NULL, NULL, 500000, 520000, 560212, '0', 3, NULL),
(560213, 'E', 'Leads Expense', NULL, NULL, 500000, 520000, 560213, '0', 3, NULL),
(570000, 'E', 'DEPRECIATION', NULL, NULL, 500000, 570000, 570000, NULL, 2, NULL),
(570100, 'E', 'DEPRECIATION', NULL, NULL, 500000, 570000, 570100, NULL, 3, NULL),
(580000, 'E', 'TAXES:-', NULL, NULL, 500000, 580000, 580000, NULL, 2, NULL),
(580100, 'E', 'TAXES:-', NULL, NULL, 500000, 580000, 580100, NULL, 3, NULL),
(580120, 'E', 'TAX PAYABLE', NULL, NULL, 500000, 580000, 580120, NULL, 3, NULL),
(580130, 'E', 'SALES TAX.', NULL, NULL, 500000, 580000, 580100, NULL, 3, NULL),
(580135, 'E', 'INCOME TAX.', NULL, NULL, 500000, 580000, 580100, NULL, 3, NULL),
(580140, 'E', 'PROFESSIONAL TAX (EXCISE)', NULL, NULL, 500000, 580000, 580100, NULL, 3, NULL),
(580145, 'E', 'TOLL TAX.', NULL, NULL, 500000, 580000, 580100, NULL, 3, NULL),
(580245, 'E', 'test in tax', NULL, NULL, 500000, 580000, 580000, NULL, 3, NULL),
(590100, 'E', 'OTHER EXPENSES', NULL, NULL, 500000, 590000, 590100, NULL, 3, NULL),
(590101, 'E', 'OTHER EXPENSES', NULL, NULL, 500000, 590000, 590100, NULL, 3, NULL),
(590104, 'E', 'OFFICE EXPENCE.', NULL, NULL, 500000, 590000, 590100, NULL, 3, NULL),
(590106, 'E', 'COMPUTER EXPENSES', NULL, NULL, 500000, 590000, 590100, NULL, 3, NULL),
(590107, 'E', 'BAD DEBTS ', NULL, NULL, 500000, 590000, 590100, NULL, 3, NULL),
(590108, 'E', 'CASH SHORT /EXCESS', NULL, NULL, 500000, 590000, 590100, NULL, 3, NULL),
(590109, 'E', 'PREVIOUS PERIOD P&L.', NULL, NULL, 500000, 590000, 590100, NULL, 3, NULL),
(590209, 'E', 'Office Rent Expense', NULL, NULL, 500000, 590000, 590000, '0', 3, NULL),
(600000, 'S', 'SUSPENSE', NULL, NULL, 600000, 600000, 600000, NULL, 1, 'LOCK'),
(610000, 'S', 'SUSPENSE', NULL, NULL, 600000, 610000, 610000, NULL, 2, NULL),
(610100, 'S', 'SUSPENSE', NULL, NULL, 600000, 610000, 610100, NULL, 3, NULL),
(610101, 'S', 'SUSPENSE', NULL, NULL, 600000, 610000, 610100, NULL, 3, NULL),
(610102, 'S', 'CLEARING ACCOUNT.', NULL, NULL, 600000, 610000, 610100, NULL, 3, NULL),
(610103, 'S', 'CHEQUE ACCOUNT.', NULL, NULL, 600000, 610000, 610100, NULL, 3, NULL),
(610104, 'S', 'EXCESS & SHORT ACCOUNT.', NULL, NULL, 600000, 610000, 610100, NULL, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `CompanyID` int NOT NULL,
  `Name` varchar(150) DEFAULT NULL,
  `Name2` varchar(255) DEFAULT NULL,
  `TRN` varchar(150) DEFAULT NULL COMMENT 'tax registration no',
  `Currency` varchar(3) DEFAULT NULL,
  `Mobile` varchar(75) DEFAULT NULL,
  `Contact` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Website` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Logo` varchar(255) DEFAULT NULL,
  `BackgroundLogo` varchar(255) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Signature` varchar(255) DEFAULT NULL,
  `DigitalSignature` varchar(255) DEFAULT NULL,
  `EstimateInvoiceTitle` varchar(150) DEFAULT NULL,
  `SaleInvoiceTitle` varchar(150) DEFAULT NULL,
  `DeliveryChallanTitle` varchar(150) DEFAULT NULL,
  `CreditNoteTitle` varchar(150) DEFAULT NULL,
  `PurchaseInvoiceTitle` varchar(150) DEFAULT NULL,
  `DebitNoteTitle` varchar(150) DEFAULT NULL,
  `ScopeofWork` text,
  `Exclusion` text,
  `TermsConditions` text,
  `BankDetails1` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `BankDetails2` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`CompanyID`, `Name`, `Name2`, `TRN`, `Currency`, `Mobile`, `Contact`, `Email`, `Website`, `Address`, `Logo`, `BackgroundLogo`, `CreatedDate`, `UpdatedDate`, `Signature`, `DigitalSignature`, `EstimateInvoiceTitle`, `SaleInvoiceTitle`, `DeliveryChallanTitle`, `CreditNoteTitle`, `PurchaseInvoiceTitle`, `DebitNoteTitle`, `ScopeofWork`, `Exclusion`, `TermsConditions`, `BankDetails1`, `BankDetails2`) VALUES
(1, 'EXTENSIVE IT SERVICES', NULL, '1111', 'AED', NULL, '+971 4 584 8310, 058 591 9050', 'sales@eits.ae', 'www.eits.ae', 'Office 1807, Clover Bay Tower, Business Bay, Dubai, U. A, E.', '1691389419.png', '1665053385.jpg', '2023-08-08 12:20:07', '2023-08-08 12:20:07', 'fayyaz sahb.png', '<h2><strong>Finance Director,</strong></h2>\r\n\r\n<p><strong>Kashif</strong></p>', 'Quotation', 'Invoice', 'Delivery Note', 'Credit Note', 'Purchase Bill', 'Debit Note', '<ol>\r\n	<li>Cable Pulling, Termination and Configuration.</li>\r\n	<li>Supply, Installation and Configuration of Time attendance System.</li>\r\n</ol>', '<ol>\r\n	<li>Any approval or NOC from any Local Authorities or Government.</li>\r\n	<li>Any extra items not mentioned in contract.</li>\r\n</ol>', '<ol>\r\n	<li>Amount in AED,\r\n	<ul style=\"list-style-type:circle\">\r\n		<li>50% Advance (Non-Refundable)</li>\r\n		<li>50% After completion</li>\r\n	</ul>\r\n	</li>\r\n	<li>Quotation valid for 20 days from date of submission.</li>\r\n	<li>One-year warranty for the devices provided by EIS. Liquid and Physical Damage is not covered.</li>\r\n	<li>Any Additional work will be charged as variation.</li>\r\n	<li>Each additional access card will be charged 70 AED which includes Printing, delivery and Configuration of card in the machine.</li>\r\n</ol>', '<p>EXTENSIVE IT SERVICES<br />\r\nBank Name: Mashreq Bank<br />\r\nAccount No: 019100879199<br />\r\nIBAN: AE280330000019100879199</p>', '<p>EXTENSIVE IT SERVICES<br />\r\nBank Name: ADCB<br />\r\nAccount No: 12323776920001<br />\r\nIBAN: AE260030012323776920001</p>');

-- --------------------------------------------------------

--
-- Table structure for table `estimate_detail`
--

CREATE TABLE `estimate_detail` (
  `EstimateDetailID` int NOT NULL,
  `EstimateMasterID` int NOT NULL,
  `EstimateNo` varchar(10) DEFAULT NULL,
  `EstimateDate` date DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
  `ItemCategoryID` int DEFAULT NULL,
  `Description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `Qty` int DEFAULT NULL,
  `Rate` double(8,2) DEFAULT NULL,
  `Discount` double(12,2) DEFAULT NULL,
  `DiscountType` double(12,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL,
  `Gross` double(12,2) DEFAULT NULL,
  `DiscountAmountItem` double(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `estimate_detail`
--

INSERT INTO `estimate_detail` (`EstimateDetailID`, `EstimateMasterID`, `EstimateNo`, `EstimateDate`, `ItemID`, `ItemCategoryID`, `Description`, `Qty`, `Rate`, `Discount`, `DiscountType`, `TaxPer`, `Tax`, `Total`, `Gross`, `DiscountAmountItem`) VALUES
(13, 8, 'QUO-00002', '2023-08-08', 25, NULL, 'tesast', 1, 23.00, 0.00, 1.00, 0.00, 0.00, 23.00, 23.00, 0.00),
(15, 9, 'QUO-00001', NULL, 25, NULL, 'asdfasdf', 1, 678.00, 0.00, 1.00, 5.00, 33.90, 644.10, 678.00, 0.00),
(17, 11, 'QUO-00002', '2023-08-08', 22, NULL, NULL, 1, 100.00, 0.00, 1.00, 5.00, 5.00, 100.00, 100.00, 0.00),
(39, 10, 'QUO-00001', NULL, 25, 1, 'ZKT Fingerprint & Password Time Attendance Device with Standalone Software', 1, 678.00, 0.00, 1.00, 5.00, 33.90, 678.00, 678.00, 0.00),
(40, 10, 'QUO-00001', NULL, 25, 3, 'ZKT Slave Fingerprint Reader (Door Exit)', 1, 365.00, 0.00, 1.00, 5.00, 18.25, 365.00, 365.00, 0.00),
(41, 10, 'QUO-00001', NULL, 25, 1, 'test', 1, 22.00, 0.00, 1.00, 5.00, 1.10, 22.00, 22.00, 0.00),
(42, 10, 'QUO-00001', NULL, 22, 1, NULL, 10, 100.00, 0.00, 1.00, 5.00, 50.00, 950.00, 1000.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `estimate_master`
--

CREATE TABLE `estimate_master` (
  `EstimateMasterID` int NOT NULL,
  `EstimateNo` varchar(10) DEFAULT NULL,
  `EstimateType` varchar(255) DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `WalkinCustomerName` varchar(55) DEFAULT NULL,
  `PlaceOfSupply` varchar(25) DEFAULT NULL,
  `ReferenceNo` varchar(25) DEFAULT NULL,
  `TaxType` varchar(155) DEFAULT NULL,
  `EstimateDate` date DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `SubTotal` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL,
  `DiscountPer` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `Shipping` double(8,2) DEFAULT NULL,
  `GrandTotal` double(8,2) DEFAULT NULL,
  `CustomerNotes` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `DescriptionNotes` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `TermAndCondition` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `File` varchar(75) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estimate_master`
--

INSERT INTO `estimate_master` (`EstimateMasterID`, `EstimateNo`, `EstimateType`, `PartyID`, `WalkinCustomerName`, `PlaceOfSupply`, `ReferenceNo`, `TaxType`, `EstimateDate`, `Date`, `ExpiryDate`, `SubTotal`, `TaxPer`, `Tax`, `Total`, `DiscountPer`, `Discount`, `Shipping`, `GrandTotal`, `CustomerNotes`, `DescriptionNotes`, `TermAndCondition`, `File`, `UserID`, `Subject`, `CreatedAt`) VALUES
(10, 'QUO-00001', 'IT', 2216, NULL, NULL, 'QUO-R0-23-00001', 'TaxExclusive', '2023-08-08', '2023-08-08', '2023-08-08', 2065.00, NULL, 103.25, 2065.00, 0.00, 0.00, 0.00, 2168.25, '<ol>\r\n	<li>Cable Pulling, Termination and Configuration.</li>\r\n	<li>Supply, Installation and Configuration of Time attendance System.</li>\r\n</ol>', '<ol>\r\n	<li>Any approval or NOC from any Local Authorities or Government.</li>\r\n	<li>Any extra items not mentioned in contract.</li>\r\n</ol>', '<ol>\r\n	<li>Amount in AED,</li>\r\n</ol>\r\n\r\n<ul style=\"list-style-type:circle\">\r\n	<li>50% Advance (Non-Refundable)</li>\r\n	<li>50% After completion</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Quotation valid for 20 days from date of submission.</li>\r\n	<li>One-year warranty for the devices provided by EIS. Liquid and Physical Damage is not covered.</li>\r\n	<li>Any Additional work will be charged as variation.</li>\r\n	<li>Each additional access card will be charged 70 AED which includes Printing, delivery and Configuration of card in the machine.</li>\r\n</ol>', NULL, 1, 'TIME ATTENDANCE SYSTEM', '2023-08-08 11:20:21');

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
(1, 'IT'),
(2, 'Software');

-- --------------------------------------------------------

--
-- Table structure for table `expense_detail`
--

CREATE TABLE `expense_detail` (
  `ExpenseDetailID` int NOT NULL,
  `ExpenseMasterID` int DEFAULT NULL,
  `ChartOfAccountID` int DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Amount` double(8,2) DEFAULT NULL,
  `Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expense_master`
--

CREATE TABLE `expense_master` (
  `ExpenseMasterID` int NOT NULL,
  `ExpenseNo` varchar(55) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `ChartOfAccountID` int DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `ReferenceNo` varchar(55) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `GrantTotal` double(8,2) DEFAULT NULL,
  `Paid` double(8,2) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `expense_master`
--
DELIMITER $$
CREATE TRIGGER `detail journal delete expense` AFTER DELETE ON `expense_master` FOR EACH ROW begin

delete from expense_detail where ExpenseMasterID = old.ExpenseMasterID;
delete from journal where ExpenseMasterID = old.ExpenseMasterID;

end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_detail`
--

CREATE TABLE `invoice_detail` (
  `InvoiceDetailID` int NOT NULL,
  `InvoiceMasterID` int DEFAULT NULL,
  `InvoiceNo` varchar(10) DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `Rate` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `DiscountType` double(8,2) DEFAULT NULL,
  `DiscountAmountItem` double(8,2) DEFAULT NULL,
  `Gross` double(8,2) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_master`
--

CREATE TABLE `invoice_master` (
  `InvoiceMasterID` int NOT NULL,
  `InvoiceNo` varchar(10) DEFAULT NULL,
  `InvoiceType` varchar(30) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `WalkinCustomerName` varchar(155) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `ReferenceNo` varchar(255) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `PaymentMode` varchar(25) DEFAULT NULL,
  `PaymentDetails` varchar(255) DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `TaxType` varchar(55) DEFAULT NULL,
  `DescriptionNotes` varchar(255) DEFAULT NULL,
  `CustomerNotes` varchar(255) DEFAULT NULL,
  `SubTotal` double(8,2) DEFAULT NULL,
  `DiscountPer` double(8,2) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL,
  `DiscountAmount` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Shipping` double(8,2) DEFAULT NULL,
  `GrandTotal` double(8,2) DEFAULT NULL,
  `Paid` double(8,2) DEFAULT NULL,
  `Balance` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_type`
--

CREATE TABLE `invoice_type` (
  `InvoiceTypeID` int NOT NULL,
  `InvoiceType` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_type`
--

INSERT INTO `invoice_type` (`InvoiceTypeID`, `InvoiceType`) VALUES
(1, 'Tax Invoice'),
(2, 'Invoice'),
(3, 'Proforma Invoice');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `ItemID` int NOT NULL,
  `ItemType` varchar(55) DEFAULT NULL,
  `ItemCategoryID` int DEFAULT NULL,
  `ItemCode` varchar(5) DEFAULT NULL,
  `ItemName` varchar(55) DEFAULT NULL,
  `UnitName` varchar(10) DEFAULT NULL,
  `Taxable` varchar(10) DEFAULT NULL,
  `Percentage` double(8,2) DEFAULT NULL,
  `CostPrice` double(8,2) DEFAULT NULL,
  `CostChartofAccountID` int DEFAULT NULL,
  `CostDescription` varchar(255) DEFAULT NULL,
  `SellingPrice` double(8,2) DEFAULT NULL,
  `SellingChartofAccountID` int DEFAULT NULL,
  `SellingDescription` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ItemID`, `ItemType`, `ItemCategoryID`, `ItemCode`, `ItemName`, `UnitName`, `Taxable`, `Percentage`, `CostPrice`, `CostChartofAccountID`, `CostDescription`, `SellingPrice`, `SellingChartofAccountID`, `SellingDescription`) VALUES
(22, 'Goods', NULL, NULL, 'Pepsi 1 Ltr', NULL, 'Yes', 5.00, 80.00, NULL, NULL, 100.00, NULL, NULL),
(23, 'Goods', NULL, NULL, 'Malaysia Silver Pkg', NULL, 'No', NULL, 5000.00, NULL, NULL, 5500.00, NULL, NULL),
(24, 'Goods', NULL, NULL, 'Sales', NULL, 'No', NULL, 80.00, NULL, NULL, 80.00, NULL, NULL),
(25, 'Service', NULL, NULL, 'Service', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `ItemCategoryID` int NOT NULL,
  `ParentID` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `item_category`
--

INSERT INTO `item_category` (`ItemCategoryID`, `ParentID`, `title`, `image`, `type`, `IsActive`) VALUES
(1, NULL, 'IP CCTV System Installation', NULL, NULL, 1),
(3, NULL, 'Amplifier Installation', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `journal`
--

CREATE TABLE `journal` (
  `JournalID` int NOT NULL,
  `VHNO` varchar(15) DEFAULT NULL,
  `JournalType` varchar(10) DEFAULT NULL,
  `ChartOfAccountID` int DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `VoucherMstID` int DEFAULT NULL,
  `PettyMstID` int DEFAULT NULL,
  `InvoiceMasterID` int DEFAULT NULL,
  `ExpenseMasterID` int DEFAULT NULL,
  `PaymentMasterID` int DEFAULT NULL,
  `PurchasePaymentMasterID` int DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Dr` double(10,2) DEFAULT NULL,
  `Cr` double(10,2) DEFAULT NULL,
  `Trace` decimal(10,0) DEFAULT NULL,
  `BankReconcile` varchar(15) DEFAULT NULL,
  `ReconcileDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_10_10_143303_create_attendances_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `party`
--

CREATE TABLE `party` (
  `PartyID` int NOT NULL,
  `PartyName` varchar(150) DEFAULT NULL,
  `TRN` varchar(150) DEFAULT '',
  `Address` varchar(75) DEFAULT NULL,
  `City` varchar(155) DEFAULT NULL,
  `Mobile` varchar(150) DEFAULT NULL,
  `Phone` varchar(25) DEFAULT NULL,
  `Email` varchar(25) DEFAULT NULL,
  `Website` varchar(150) DEFAULT NULL,
  `Active` varchar(3) DEFAULT NULL,
  `InvoiceDueDays` int DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `party`
--

INSERT INTO `party` (`PartyID`, `PartyName`, `TRN`, `Address`, `City`, `Mobile`, `Phone`, `Email`, `Website`, `Active`, `InvoiceDueDays`, `eDate`) VALUES
(1, 'Walkin Customer', '00000', '000000', NULL, '0000', '00000', '00000', '0000', 'Yes', 0, '2022-07-08 04:12:14'),
(2215, 'Shnill Electronics', '11111', 'Sharjah, UAE', NULL, '+971 50 502 4148', NULL, NULL, NULL, 'Yes', NULL, '2023-08-04 12:41:42'),
(2216, 'Blue Water Shipping Middel East', NULL, '2804, Al Moosa Tower 2, Sheikh Zaid Road, Dubai U.A.E', NULL, '054 3970096', NULL, NULL, NULL, 'Yes', NULL, '2023-08-07 05:33:42');

-- --------------------------------------------------------

--
-- Table structure for table `payment_detail`
--

CREATE TABLE `payment_detail` (
  `PaymentDetailID` int NOT NULL,
  `PaymentMasterID` int DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `InvoiceMasterID` int DEFAULT NULL,
  `Payment` double(8,2) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_detail`
--

INSERT INTO `payment_detail` (`PaymentDetailID`, `PaymentMasterID`, `PaymentDate`, `InvoiceMasterID`, `Payment`, `eDate`) VALUES
(1, 1, '2023-08-08', 5, 100.00, '2023-08-08 13:44:06');

-- --------------------------------------------------------

--
-- Table structure for table `payment_master`
--

CREATE TABLE `payment_master` (
  `PaymentMasterID` int NOT NULL,
  `PartyID` int DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `PaymentAmount` double(8,2) DEFAULT NULL,
  `PaymentMode` varchar(25) DEFAULT NULL,
  `ChartOfAccountID` int DEFAULT NULL,
  `ReferenceNo` varchar(255) DEFAULT NULL,
  `File` varchar(35) DEFAULT NULL,
  `Notes` longtext,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_master`
--

INSERT INTO `payment_master` (`PaymentMasterID`, `PartyID`, `PaymentDate`, `PaymentAmount`, `PaymentMode`, `ChartOfAccountID`, `ReferenceNo`, `File`, `Notes`, `eDate`) VALUES
(1, 2216, '2023-08-08', 100.00, 'Cash', 110201, NULL, NULL, NULL, '2023-08-08 13:44:06');

-- --------------------------------------------------------

--
-- Table structure for table `payment_mode`
--

CREATE TABLE `payment_mode` (
  `ID` int NOT NULL,
  `PaymentMode` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_mode`
--

INSERT INTO `payment_mode` (`ID`, `PaymentMode`) VALUES
(1, 'Cash'),
(2, 'Bank Transfer'),
(3, 'Cheque'),
(4, 'Credit Card');

-- --------------------------------------------------------

--
-- Table structure for table `pettycash_detail`
--

CREATE TABLE `pettycash_detail` (
  `PettyDetID` int NOT NULL,
  `PettyMstID` int DEFAULT NULL,
  `PettyVoucher` varchar(12) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `ChOfAcc` int DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `Invoice` varchar(35) DEFAULT NULL,
  `RefNo` varchar(35) DEFAULT NULL,
  `Debit` double(10,2) DEFAULT NULL,
  `FromChOfAcc` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `pettycash_detail`
--
DELIMITER $$
CREATE TRIGGER `delete` AFTER DELETE ON `pettycash_detail` FOR EACH ROW begin
delete from journal where PettyMstID = old.PettyMstID;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `journal` AFTER INSERT ON `pettycash_detail` FOR EACH ROW begin
declare chart_name varchar(25);
select ChartOfAccountName into chart_name from chartofaccount where ChartOfAccountID=new.ChOfAcc;

INSERT INTO journal (VHNO,JournalType,ChartOfAccountID,PettyMstID,Narration,Date,Cr)
values (new.PettyVoucher,SUBSTRING(new.PettyVoucher,1,2),new.FromChOfAcc,new.PettyMstID,concat(new.Narration,' (', chart_name,') '),new.Date,new.Debit);


INSERT INTO journal (VHNO,JournalType,ChartOfAccountID,PettyMstID,Narration,Date,Dr)
values (new.PettyVoucher,SUBSTRING(new.PettyVoucher,1,2),new.ChOfAcc,new.PettyMstID,new.Narration,new.Date,new.Debit);


end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pettycash_master`
--

CREATE TABLE `pettycash_master` (
  `PettyMstID` int NOT NULL,
  `PettyVoucher` varchar(11) DEFAULT NULL,
  `ChOfAcc` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `Credit` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `price` varchar(55) DEFAULT NULL,
  `details` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `details`) VALUES
(1, 'Kashif', '55', '55'),
(2, 'Mu', '55', '66'),
(3, 'usma', NULL, NULL),
(4, 'khan', NULL, NULL),
(5, 'pakistna', NULL, NULL),
(6, 'india', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchasepayment_detail`
--

CREATE TABLE `purchasepayment_detail` (
  `PurchasePaymentDetailID` int NOT NULL,
  `PurchasePaymentMasterID` int DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `InvoiceMasterID` int DEFAULT NULL,
  `Payment` double(8,2) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchasepayment_master`
--

CREATE TABLE `purchasepayment_master` (
  `PurchasePaymentMasterID` int NOT NULL,
  `SupplierID` int DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `PaymentAmount` double(8,2) DEFAULT NULL,
  `PaymentMode` varchar(25) DEFAULT NULL,
  `ChartOfAccountID` int DEFAULT NULL,
  `ReferenceNo` varchar(35) DEFAULT NULL,
  `File` varchar(35) DEFAULT NULL,
  `Notes` longtext,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_detail`
--

CREATE TABLE `purchase_order_detail` (
  `PurchaseOrderDetailID` int NOT NULL,
  `PurchaseOrderMasterID` int NOT NULL,
  `Date` date DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Rate` double(8,2) DEFAULT NULL,
  `Qty` varchar(10) DEFAULT NULL,
  `Unit` varchar(10) DEFAULT NULL,
  `DiscountPer` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Amount` double(8,2) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_master`
--

CREATE TABLE `purchase_order_master` (
  `PurchaseOrderMasterID` int NOT NULL,
  `PON` varchar(10) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `ReferenceNo` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `PONotes` varchar(255) DEFAULT NULL,
  `DeliveryNotes` longtext,
  `UserID` int DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `DiscountPer` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `SubTotal` double(8,2) DEFAULT NULL,
  `GrandTotal` double(8,2) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `RoleID` int NOT NULL,
  `Table` varchar(55) DEFAULT NULL,
  `Action` varchar(55) DEFAULT NULL,
  `Allow` varchar(1) DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`RoleID`, `Table`, `Action`, `Allow`) VALUES
(1, 'Invoice', 'List', 'Y'),
(12, 'Invoice', 'Create', 'Y'),
(13, 'Invoice', 'Update', 'Y'),
(14, 'Invoice', 'Delete', 'Y'),
(15, 'Invoice', 'View', 'Y'),
(16, 'Invoice', 'PDF', 'Y'),
(63, 'Voucher', 'List', 'Y'),
(64, 'Voucher', 'Create', 'Y'),
(65, 'Voucher', 'Update', 'Y'),
(66, 'Voucher', 'Delete', 'Y'),
(67, 'Voucher', 'View', 'Y'),
(68, 'Petty Cash', 'List', 'Y'),
(69, 'Petty Cash', 'Create', 'Y'),
(70, 'Petty Cash', 'Update', 'Y'),
(71, 'Petty Cash', 'Delete', 'Y'),
(72, 'Petty Cash', 'View', 'Y'),
(73, 'Adjustment Balance', 'Create', 'Y'),
(74, 'Chart of Account', 'List / Create', 'Y'),
(75, 'Chart of Account', 'Update', 'Y'),
(76, 'Chart of Account', 'Delete', 'Y'),
(77, 'Item/Inventory', 'List / Create', 'Y'),
(78, 'Item/Inventory', 'Update', 'Y'),
(79, 'Item/Inventory', 'Delete', 'Y'),
(80, 'Party / Customers', 'List / Create', 'Y'),
(81, 'Party / Customers', 'Update', 'Y'),
(82, 'Party / Customers', 'Delete', 'Y'),
(83, 'Supplier', 'List / Create', 'Y'),
(84, 'Supplier', 'Update', 'Y'),
(85, 'Supplier', 'Delete', 'Y'),
(86, 'User', 'List / Create', 'Y'),
(87, 'User', 'Update', 'Y'),
(88, 'User', 'Delete', 'Y'),
(89, 'User Rights', 'Assign', 'Y'),
(90, 'Party Ledger', 'View', 'Y'),
(91, 'Party Ledger', 'PDF', 'Y'),
(92, 'Party Balance', 'View', 'Y'),
(93, 'Party Balance', 'PDF', 'Y'),
(94, 'Yearly Report', 'View', 'Y'),
(95, 'Yearly Report', 'PDF', 'Y'),
(96, 'Ageing Report', 'View', 'Y'),
(97, 'Ageing Report', 'PDF', 'Y'),
(98, 'Party Analysis', 'View', 'Y'),
(99, 'Party Analysis', 'PDF', 'Y'),
(100, 'Party List', 'View', 'Y'),
(101, 'Party List', 'PDF', 'Y'),
(102, 'Outstanding Invoices', 'View', 'Y'),
(103, 'Outstanding Invoices', 'PDF', 'Y'),
(104, 'Supplier Ledger', 'View', 'Y'),
(105, 'Supplier Ledger', 'PDF', 'Y'),
(106, 'Supplier Balance', 'View', 'Y'),
(107, 'Supplier Balance', 'PDF', 'Y'),
(108, 'Sale Invoice', 'View', 'Y'),
(109, 'Sale Invoice', 'PDF', 'Y'),
(110, 'Ticket Register', 'View', 'Y'),
(111, 'Ticket Register', 'PDF', 'Y'),
(112, 'Airline Summary', 'View', 'Y'),
(113, 'Airline Summary', 'PDF', 'Y'),
(114, 'Sale Man Report', 'View', 'Y'),
(115, 'Sale Man Report', 'PDF', 'Y'),
(116, 'Tax Report', 'View', 'Y'),
(117, 'Tax Report', 'PDF', 'Y'),
(118, 'Sales Report', 'View', 'Y'),
(119, 'Sales Report', 'PDF', 'Y'),
(120, 'Voucher Report', 'View', 'Y'),
(121, 'Voucher Report', 'PDF', 'Y'),
(122, 'Cash Book', 'View', 'Y'),
(123, 'Cash Book', 'PDF', 'Y'),
(124, 'Day Book', 'View', 'Y'),
(125, 'Day Book', 'PDF', 'Y'),
(126, 'General Ledger', 'View', 'Y'),
(127, 'General Ledger', 'PDF', 'Y'),
(128, 'Trial Balance', 'View', 'Y'),
(129, 'Trial Balance', 'PDF', 'Y'),
(130, 'Trial with Activity', 'View', 'Y'),
(131, 'Trial with Activity', 'PDF', 'Y'),
(132, 'Yearly Summary', 'View', 'Y'),
(133, 'Yearly Summary', 'PDF', 'Y'),
(134, 'Profit & Loss ', 'View', 'Y'),
(135, 'Profit & Loss ', 'PDF', 'Y'),
(136, 'Balance Sheet', 'View', 'Y'),
(137, 'Balance Sheet', 'PDF', 'Y'),
(138, 'Invoice Summary', 'View', 'Y'),
(139, 'Invoice Summary', 'PDF', 'Y'),
(140, 'Party Wise Sale', 'View', 'Y'),
(141, 'Party Wise Sale', 'PDF', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `runtotaltestdata`
--

CREATE TABLE `runtotaltestdata` (
  `id` int NOT NULL,
  `value` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SupplierID` int NOT NULL,
  `SupplierName` varchar(150) DEFAULT NULL,
  `TRN` varchar(75) DEFAULT NULL COMMENT 'tax regsitration no',
  `Address` varchar(75) DEFAULT NULL,
  `Mobile` varchar(150) DEFAULT NULL,
  `Phone` varchar(150) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Website` varchar(150) DEFAULT NULL,
  `Active` varchar(3) DEFAULT NULL,
  `InvoiceDueDays` int DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SupplierID`, `SupplierName`, `TRN`, `Address`, `Mobile`, `Phone`, `Email`, `Website`, `Active`, `InvoiceDueDays`, `eDate`) VALUES
(1, 'Walkin Supplier', NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', NULL, '2022-07-20 18:35:02');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_category`
--

CREATE TABLE `supplier_category` (
  `SupplierCatID` int NOT NULL,
  `SupplierCode` varchar(10) DEFAULT NULL,
  `SupplierCategory` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_category`
--

INSERT INTO `supplier_category` (`SupplierCatID`, `SupplierCode`, `SupplierCategory`) VALUES
(1, 'C', 'Customer'),
(2, 'VC', 'Airline Customer'),
(3, 'EC', 'Employee'),
(4, 'X', 'Discontinued'),
(5, 'XC', 'Bad Debds'),
(6, 'VS', 'Supplier'),
(7, 'BC', 'Old Bad Debts');

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `TaxID` int NOT NULL,
  `TaxPer` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Section` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`TaxID`, `TaxPer`, `Description`, `Section`) VALUES
(1, '0', '[0%] Tax ', 'Invoice'),
(2, '5', '[4.76%] Tax', 'Invoice'),
(3, '0', '[0%] Tax ', 'Estimate'),
(4, '5', '[5%] Tax', 'Estimate');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `UnitID` int NOT NULL,
  `UnitName` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`UnitID`, `UnitName`) VALUES
(1, 'box'),
(2, 'cm'),
(3, 'dz'),
(4, 'ft'),
(5, 'g'),
(6, 'in'),
(7, 'kg'),
(8, 'km'),
(9, 'lb'),
(10, 'mg'),
(11, 'm'),
(12, 'pcs');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int NOT NULL,
  `FullName` varchar(55) DEFAULT NULL,
  `Email` varchar(55) DEFAULT NULL,
  `Password` varchar(75) DEFAULT NULL,
  `UserType` varchar(25) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Active` varchar(5) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `FullName`, `Email`, `Password`, `UserType`, `eDate`, `Active`) VALUES
(1, 'Ext Boosk', 'demo@extbooks.com', '123456', 'Admin', '2022-10-06 10:36:24', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `RoleId` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `Table` varchar(55) DEFAULT NULL,
  `Action` varchar(55) DEFAULT NULL,
  `Allow` varchar(10) DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`RoleId`, `UserID`, `Table`, `Action`, `Allow`) VALUES
(4301, 1, 'Invoice', 'List', 'Y'),
(4302, 1, 'Invoice', 'Create', 'Y'),
(4303, 1, 'Invoice', 'Update', 'Y'),
(4304, 1, 'Invoice', 'Delete', 'Y'),
(4305, 1, 'Invoice', 'View', 'Y'),
(4306, 1, 'Invoice', 'PDF', 'Y'),
(4307, 1, 'Voucher', 'List', 'Y'),
(4308, 1, 'Voucher', 'Create', 'Y'),
(4309, 1, 'Voucher', 'Update', 'Y'),
(4310, 1, 'Voucher', 'Delete', 'Y'),
(4311, 1, 'Voucher', 'View', 'Y'),
(4312, 1, 'Petty Cash', 'List', 'Y'),
(4313, 1, 'Petty Cash', 'Create', 'Y'),
(4314, 1, 'Petty Cash', 'Update', 'Y'),
(4315, 1, 'Petty Cash', 'Delete', 'Y'),
(4316, 1, 'Petty Cash', 'View', 'Y'),
(4317, 1, 'Adjustment Balance', 'Create', 'Y'),
(4318, 1, 'Chart of Account', 'List / Create', 'Y'),
(4319, 1, 'Chart of Account', 'Update', 'Y'),
(4320, 1, 'Chart of Account', 'Delete', 'Y'),
(4321, 1, 'Item/Inventory', 'List / Create', 'Y'),
(4322, 1, 'Item/Inventory', 'Update', 'Y'),
(4323, 1, 'Item/Inventory', 'Delete', 'Y'),
(4324, 1, 'Party / Customers', 'List / Create', 'Y'),
(4325, 1, 'Party / Customers', 'Update', 'Y'),
(4326, 1, 'Party / Customers', 'Delete', 'Y'),
(4327, 1, 'Supplier', 'List / Create', 'Y'),
(4328, 1, 'Supplier', 'Update', 'Y'),
(4329, 1, 'Supplier', 'Delete', 'Y'),
(4330, 1, 'User', 'List / Create', 'Y'),
(4331, 1, 'User', 'Update', 'Y'),
(4332, 1, 'User', 'Delete', 'Y'),
(4333, 1, 'User Rights', 'Assign', 'Y'),
(4334, 1, 'Party Ledger', 'View', 'Y'),
(4335, 1, 'Party Ledger', 'PDF', 'Y'),
(4336, 1, 'Party Balance', 'View', 'Y'),
(4337, 1, 'Party Balance', 'PDF', 'Y'),
(4338, 1, 'Yearly Report', 'View', 'Y'),
(4339, 1, 'Yearly Report', 'PDF', 'Y'),
(4340, 1, 'Ageing Report', 'View', 'Y'),
(4341, 1, 'Ageing Report', 'PDF', 'Y'),
(4342, 1, 'Party Analysis', 'View', 'Y'),
(4343, 1, 'Party Analysis', 'PDF', 'Y'),
(4344, 1, 'Party List', 'View', 'Y'),
(4345, 1, 'Party List', 'PDF', 'Y'),
(4346, 1, 'Outstanding Invoices', 'View', 'Y'),
(4347, 1, 'Outstanding Invoices', 'PDF', 'Y'),
(4348, 1, 'Supplier Ledger', 'View', 'Y'),
(4349, 1, 'Supplier Ledger', 'PDF', 'Y'),
(4350, 1, 'Supplier Balance', 'View', 'Y'),
(4351, 1, 'Supplier Balance', 'PDF', 'Y'),
(4352, 1, 'Sale Invoice', 'View', 'Y'),
(4353, 1, 'Sale Invoice', 'PDF', 'Y'),
(4354, 1, 'Ticket Register', 'View', 'Y'),
(4355, 1, 'Ticket Register', 'PDF', 'Y'),
(4356, 1, 'Airline Summary', 'View', 'Y'),
(4357, 1, 'Airline Summary', 'PDF', 'Y'),
(4358, 1, 'Sale Man Report', 'View', 'Y'),
(4359, 1, 'Sale Man Report', 'PDF', 'Y'),
(4360, 1, 'Tax Report', 'View', 'Y'),
(4361, 1, 'Tax Report', 'PDF', 'Y'),
(4362, 1, 'Sales Report', 'View', 'Y'),
(4363, 1, 'Sales Report', 'PDF', 'Y'),
(4364, 1, 'Voucher Report', 'View', 'Y'),
(4365, 1, 'Voucher Report', 'PDF', 'Y'),
(4366, 1, 'Cash Book', 'View', 'Y'),
(4367, 1, 'Cash Book', 'PDF', 'Y'),
(4368, 1, 'Day Book', 'View', 'Y'),
(4369, 1, 'Day Book', 'PDF', 'Y'),
(4370, 1, 'General Ledger', 'View', 'Y'),
(4371, 1, 'General Ledger', 'PDF', 'Y'),
(4372, 1, 'Trial Balance', 'View', 'Y'),
(4373, 1, 'Trial Balance', 'PDF', 'Y'),
(4374, 1, 'Trial with Activity', 'View', 'Y'),
(4375, 1, 'Trial with Activity', 'PDF', 'Y'),
(4376, 1, 'Yearly Summary', 'View', 'Y'),
(4377, 1, 'Yearly Summary', 'PDF', 'Y'),
(4378, 1, 'Profit & Loss', 'View', 'Y'),
(4379, 1, 'Profit & Loss', 'PDF', 'Y'),
(4380, 1, 'Balance Sheet', 'View', 'Y'),
(4381, 1, 'Balance Sheet', 'PDF', 'Y'),
(4382, 1, 'Invoice Summary', 'View', 'Y'),
(4383, 1, 'Invoice Summary', 'PDF', 'Y'),
(4384, 1, 'Party Wise Sale', 'View', 'Y'),
(4385, 1, 'Party Wise Sale', 'PDF', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_detail`
--

CREATE TABLE `voucher_detail` (
  `VoucherDetID` int NOT NULL,
  `VoucherMstID` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Voucher` varchar(15) DEFAULT NULL,
  `ChOfAcc` int DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `InvoiceNo` varchar(75) DEFAULT NULL,
  `RefNo` varchar(75) DEFAULT NULL,
  `Debit` double(10,2) DEFAULT NULL,
  `Credit` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `voucher_detail`
--
DELIMITER $$
CREATE TRIGGER `beforeinsert` AFTER INSERT ON `voucher_detail` FOR EACH ROW begin
 
INSERT INTO journal (VHNO,JournalType,ChartOfAccountID,SupplierID,VoucherMstID,Narration,Date,Dr,Cr,PartyID) 
values (new.Voucher,SUBSTRING(new.Voucher,1,2),new.ChOfAcc,new.SupplierID,new.VoucherMstID,new.Narration,new.Date,new.Debit,new.Credit,new.PartyID);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_master`
--

CREATE TABLE `voucher_master` (
  `VoucherMstID` int NOT NULL,
  `VoucherCodeID` int DEFAULT NULL,
  `Voucher` varchar(15) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_master`
--

INSERT INTO `voucher_master` (`VoucherMstID`, `VoucherCodeID`, `Voucher`, `Date`, `Narration`) VALUES
(3, 7, 'JV22010001', '2022-01-23', 'Rent Security Deposit and Processing Fee'),
(4, 7, 'JV22010002', '2022-01-23', 'Rent payment for Feb - April 2022'),
(5, 7, 'JV22010003', '2022-01-31', 'monthly prepaid amortization'),
(6, 7, 'JV22010004', '2022-02-01', 'investment issued'),
(7, 7, 'JV22010005', '2022-02-07', 'payment to Al Manara Centre'),
(8, 7, 'JV22010006', '2022-02-08', 'license'),
(9, 7, 'JV22010007', '2022-02-08', 'supply services shifting table from 28th floor to 12th floor'),
(10, 7, 'JV22010008', '2022-02-10', 'dewa activation'),
(11, 7, 'JV22010009', '2022-02-10', 'credit card ENBD'),
(25, 7, 'JV22010010', '2022-02-11', 'supply and installation of chairs'),
(26, 7, 'JV22010011', '2022-02-16', 'payment of Mr. Kaleem to Mr. Asim'),
(27, 7, 'JV22010012', '2022-02-21', 'salary advance of Aashik'),
(28, 7, 'JV22010013', '2022-02-21', 'salary advance of Ramos'),
(29, 7, 'JV22010014', '2022-02-28', 'payroll for the month of February 2022'),
(30, 7, 'JV22010015', '2022-02-28', 'loan from FMM'),
(31, 7, 'JV22010016', '2022-02-28', 'monthly prepaid amortization'),
(32, 7, 'JV22100017', '2022-03-01', 'payable to FMM'),
(33, 7, 'JV22100018', '2022-03-01', '13 window including fix and delivery'),
(34, 7, 'JV22100019', '2022-03-04', 'credit card'),
(35, 7, 'JV22100020', '2022-03-14', 'payment for Feb. 2022 salary'),
(36, 7, 'JV22100021', '2022-03-31', 'salary of Kashif Mahmood for March 2022'),
(37, 7, 'JV22100022', '2022-03-31', 'loan from FMM for the month of March 2022'),
(38, 7, 'JV22100023', '2022-03-31', 'payroll adjustment'),
(39, 7, 'JV22100024', '2022-03-31', 'cooling charges'),
(40, 7, 'JV22100025', '2022-03-31', 'salaries adjustment'),
(41, 7, 'JV22100026', '2022-03-31', 'Du for the month'),
(42, 7, 'JV22100027', '2022-03-31', 'salary for the month of March 2022'),
(43, 7, 'JV22100028', '2022-03-31', 'depreciation for March 2022'),
(44, 7, 'JV22100029', '2022-03-31', 'monthly prepaid amortization'),
(45, 7, 'JV22100030', '2022-03-31', 'Adnan salary for March 21-26'),
(46, 7, 'JV22100031', '2022-03-31', 'Etisalat for the month'),
(47, 7, 'JV22100032', '2022-03-31', 'visa of Mr. Babar'),
(48, 7, 'JV22040033', '2022-04-10', 'staff cash bonus from Mr. Asim'),
(49, 7, 'JV22100034', '2022-04-11', 'expenses paid by FMM from PCF'),
(50, 7, 'JV22100035', '2022-04-11', 'payment for salary March 2022'),
(51, 7, 'JV22100036', '2022-04-11', 'shared fund of Mr. Kaleem to Mr. Asim'),
(52, 7, 'JV22100037', '2022-04-12', 'employment visa of Ismail paid by Mr. Asim'),
(53, 7, 'JV22100038', '2022-04-22', 'staff bonus'),
(54, 7, 'JV22100039', '2022-04-25', 'staff water'),
(55, 7, 'JV22100040', '2022-04-27', 'adjustment salary (March & April)'),
(56, 7, 'JV22100041', '2022-10-15', 'Iphone 13- payable to Asim Jan'),
(57, 7, 'JV22100042', '2022-04-29', 'Leads Expense- Payable to Asim Jan'),
(58, 7, 'JV22100043', '2022-04-29', '10 booklets PV'),
(59, 7, 'JV22100044', '2022-04-30', 'Payroll Adjustment'),
(60, 7, 'JV22100045', '2022-04-30', 'Expenses paid by Asim Jan'),
(61, 7, 'JV22100046', '2022-04-30', 'DU April Month'),
(62, 7, 'JV22100047', '2022-04-30', 'Depreciation- April'),
(63, 7, 'JV22100048', '2022-04-30', 'Monthly prepaid amortization'),
(64, 7, 'JV22100049', '2022-04-30', 'Monthly Prepaid Amortization'),
(65, 7, 'JV22100050', '2022-04-30', 'Cooling Expense'),
(66, 7, 'JV22100051', '2022-04-30', 'Salary- April 2022'),
(67, 7, 'JV22100052', '2022-04-30', 'Etisalat- April 2022'),
(68, 7, 'JV22100053', '2022-10-15', 'April Salary Adjustment'),
(69, 7, 'JV22100054', '2022-04-05', 'Jayson- salary advance'),
(70, 7, 'JV22100055', '2022-05-11', 'Furniture & Equipment'),
(71, 7, 'JV22100056', '2022-10-15', 'Office Expense- Payable to Asim Jan'),
(72, 7, 'JV22100057', '2022-05-13', 'Meal & Entertainment'),
(73, 7, 'JV22100058', '2022-05-14', 'Etisalat- May 2022'),
(74, 7, 'JV22100059', '2022-10-15', 'Prepaid Rent'),
(75, 7, 'JV22100060', '2022-05-20', 'PFC- loan of Allianz'),
(76, 7, 'JV22100061', '2022-05-24', 'Phiona Advance'),
(77, 7, 'JV22100062', '2022-05-26', 'Office Expense'),
(78, 7, 'JV22100063', '2022-05-31', 'Telephone Expense- April 2022'),
(79, 7, 'JV22100064', '2022-05-31', 'employment visa of Wynsther'),
(80, 7, 'JV22050065', '2022-05-31', 'employment visa of Binu'),
(81, 7, 'JV22100066', '2022-05-31', 'visa of Sangeen'),
(82, 7, 'JV22100067', '2022-05-31', 'visa of Jason'),
(83, 7, 'JV22100068', '2022-05-31', 'du for the month of May 2022 Account #6.210844'),
(84, 7, 'JV22100069', '2022-05-31', 'etisalat for the month of May 2022 04-4911300'),
(85, 7, 'JV22100070', '2022-05-31', 'leads for April 2022'),
(86, 7, 'JV22100071', '2022-05-31', 'Oladapo May 1-9'),
(87, 7, 'JV22100072', '2022-05-31', 'Tosan Daniel 11 days plus bonus'),
(88, 7, 'JV22100073', '2022-05-31', 'salary adjustment for May 2022'),
(89, 7, 'JV22100074', '2022-05-31', 'payroll for the month of May 2022'),
(90, 7, 'JV22100075', '2022-05-31', 'prepaid amortization for the month'),
(91, 7, 'JV22100076', '2022-05-31', 'depreciation for the month'),
(92, 7, 'JV22100077', '2022-05-31', 'cooling charges for May 2022'),
(93, 7, 'JV22100078', '2022-06-02', 'indeed'),
(94, 7, 'JV22100079', '2022-06-03', 'salary advance'),
(95, 7, 'JV22100080', '2022-06-06', '300k leads'),
(96, 7, 'JV22100081', '2022-06-09', 'salary advance of D\'Arcy Barnett'),
(97, 7, 'JV22100082', '2022-05-13', 'salary for May 2022'),
(98, 7, 'JV22100083', '2022-06-13', 'salary advance of Jason'),
(99, 7, 'JV22100084', '2022-06-14', 'payment of Mr. Kaleem to Mr. Asim'),
(100, 7, 'JV22100085', '2022-06-14', 'Oladapo May 1-9'),
(101, 7, 'JV22100086', '2022-06-14', 'salary adjustment for May 2022'),
(102, 7, 'JV22100087', '2022-06-14', 'salary of Tosan Daniel'),
(103, 7, 'JV22100088', '2022-06-15', 'salary advance of Darcy Barnett'),
(104, 7, 'JV22100089', '2022-06-25', 'license, visa and labor processing fees'),
(105, 7, 'JV22100090', '2022-06-25', 'salary advance of D\'arcy Barrett'),
(106, 7, 'JV22100091', '2022-06-27', 'employment visa of Isaac'),
(107, 7, 'JV22100092', '2022-06-27', 'Rohan Laxman employment visa'),
(108, 7, 'JV22100093', '2022-06-27', 'Ronfer Arwin employment visa'),
(109, 7, 'JV22100094', '2022-06-27', 'Ismail employment visa'),
(110, 7, 'JV22100095', '2022-10-17', 'petty cash from Mr. Asim for 1k salary of Maileen Orinada and 3,540.60 for the insurance of 6 staff'),
(111, 7, 'JV22100096', '2022-06-27', 'visa processing'),
(112, 7, 'JV22100097', '2022-06-28', 'salary of Maileen Orfinada May 1 - 10, 2022'),
(113, 7, 'JV22100098', '2022-06-30', 'cooling charges for the month of June 2022'),
(114, 7, 'JV22100099', '2022-06-30', 'adjustment bonus for Abhishek and Nauman'),
(115, 7, 'JV22100100', '2022-06-30', 'payroll for the month of June 2022'),
(116, 7, 'JV22100101', '2022-06-30', 'staff benefit for the month'),
(117, 7, 'JV22100102', '2022-06-30', 'monthly prepaid amortization'),
(118, 7, 'JV22100103', '2022-06-30', 'depreciation for the month'),
(119, 7, 'JV22100104', '2022-06-30', 'accrual expense for the month'),
(120, 7, 'JV22100105', '2022-07-06', 'payable to FMM'),
(121, 7, 'JV22100106', '2022-07-06', 'payment for DEWA'),
(122, 7, 'JV22100107', '2022-07-13', 'fund transfer'),
(123, 7, 'JV22100108', '2022-07-13', 'staff insurance'),
(124, 7, 'JV22100109', '2022-07-14', 'LOAN FROM SIR ASIM FOR JUNE 2022 PAYROLL'),
(125, 7, 'JV22100110', '2022-07-14', 'salary for June 2022'),
(126, 7, 'JV22100111', '2022-07-18', 'salary of Darcy Johnattan Barrett for July 1 - 15, 2022'),
(127, 7, 'JV22100112', '2022-07-19', 'salary of Jason and Wynsther'),
(128, 7, 'JV22100113', '2022-07-19', 'visa of Abishek and Nauman'),
(129, 7, 'JV22100114', '2022-07-20', 'to record the uncollected salary of the staff'),
(130, 7, 'JV22100115', '2022-07-25', 'payment for Etisalat'),
(131, 7, 'JV22100116', '2022-07-26', 'smartstart account monthly service fee'),
(132, 7, 'JV22070117', '2022-07-31', 'payroll for the month of July 2022'),
(133, 7, 'JV22070118', '2022-07-31', 'leads expense for July 2022'),
(134, 7, 'JV22070119', '2022-07-31', 'expense accrual for the month of July 2022'),
(135, 7, 'JV22070120', '2022-07-31', 'expenses paid through PCF of FMM'),
(136, 7, 'JV22070121', '2022-07-31', 'prepaid amortization for the month'),
(137, 7, 'JV22070122', '2022-07-31', 'depreciation for the month'),
(138, 7, 'JV22070123', '2022-07-31', 'staff benefit provision for the month'),
(139, 7, 'JV22070124', '2022-07-31', 'cooling charges for the month'),
(140, 7, 'JV22100125', '2022-08-02', 'VAT output reversal'),
(141, 7, 'JV22100126', '2022-08-04', 'payment for DEWA month of July'),
(142, 7, 'JV22100127', '2022-08-05', 'staff water'),
(143, 7, 'JV22100128', '2022-08-12', 'fund transfer for payroll July 2022'),
(144, 7, 'JV22100129', '2022-08-12', 'salary for the month of July 2022'),
(145, 7, 'JV22100130', '2022-08-12', 'due to FMM'),
(146, 7, 'JV22100131', '2022-08-13', 'payroll for the month of July 2022'),
(147, 7, 'JV22100132', '2022-08-15', 'payment for Du'),
(148, 7, 'JV22100133', '2022-08-15', 'shared salary for July 2022 (office boy)'),
(149, 7, 'JV22100134', '2022-08-15', 'Rent for the period of August to October'),
(150, 7, 'JV22100135', '2022-08-16', 'payment for cooling charges month of July 2022'),
(151, 7, 'JV22100136', '2022-08-19', 'extensive books accounting software (Aug. to Oct )'),
(152, 7, 'JV22100137', '2022-08-23', 'lead for August 2022'),
(153, 7, 'JV22100138', '2022-08-26', 'final settlement of Abhishek Jaiswal'),
(154, 7, 'JV22100139', '2022-08-31', 'cooling charges for Aug 2022'),
(155, 7, 'JV22100140', '2022-08-31', 'salary for August 2022'),
(156, 7, 'JV22100141', '2022-08-31', 'Etisalat for the month'),
(157, 7, 'JV22100142', '2022-08-31', 'salary of Sadeed Abrar'),
(158, 7, 'JV22100143', '2022-08-31', 'license and visa processing'),
(159, 7, 'JV22100144', '2022-08-31', 'Salary of Abishek and Varun for the month of August 2022'),
(160, 7, 'JV22100145', '2022-08-31', 'uncollected salary of Jayson and Wynsther to cover their 30 days notice period'),
(161, 7, 'JV22100146', '2022-08-31', 'Etisalat payment'),
(162, 7, 'JV22100147', '2022-08-31', 'prepaid amortization for the month'),
(163, 7, 'JV22100148', '2022-08-31', 'depreciation for the month'),
(164, 7, 'JV22100149', '2022-08-31', 'staff provision for the month'),
(165, 7, 'JV22100150', '2022-08-31', 'Ronson Pinto and Sadeed Abrar'),
(166, 7, 'JV22100151', '2022-09-08', 'uncollected salary for July/notice period'),
(167, 7, 'JV22100152', '2022-09-09', 'payment to Mr. Babar'),
(168, 7, 'JV22100153', '2022-09-14', 'payroll for August 2022'),
(169, 7, 'JV22100154', '2022-09-14', 'fund transfer'),
(170, 7, 'JV22100155', '2022-09-14', 'fund for payroll from Mr. Asim'),
(171, 7, 'JV22100156', '2022-09-20', 'fund transfer from PCF to ADCB account for cooling charges'),
(172, 7, 'JV22100157', '2022-09-20', 'payment for August 2022 Etisalat'),
(173, 7, 'JV22100158', '2022-09-22', 'final settlement of Sadeed Abrar'),
(174, 7, 'JV23030159', '2022-09-14', 'fund transfer'),
(175, 7, 'JV23030160', '2023-03-22', 'dewa for September 2022 INV100247632665'),
(176, 7, 'JV23030161', '2022-09-30', 'salary adjustment of Mohd Fardin Sofi'),
(177, 7, 'JV23030162', '2022-10-14', 'adjustment from Sept. salary of Mohd Fardin Sofi'),
(178, 7, 'JV23030163', '2022-09-12', 'fund transfer for September payroll'),
(179, 7, 'JV23030164', '2022-09-20', 'visit visa of Faisal Ijaz'),
(180, 7, 'JV23030165', '2022-09-22', 'fund from Mr. Babar'),
(181, 7, 'JV23030166', '2022-09-23', 'final settlement of Ronson Pinto'),
(182, 7, 'JV23030167', '2022-09-26', 'payment to PRO'),
(183, 7, 'JV23030168', '2022-09-26', 'SmartStart Account Monthly Service Fee'),
(184, 7, 'JV23030169', '2022-09-30', 'salary of Rakesh Yadan'),
(185, 7, 'JV23030170', '2022-09-30', 'payment from Binu for her visa should not be recorded as other income'),
(186, 7, 'JV23030171', '2022-09-30', 'Abishek and Varun notice period'),
(187, 7, 'JV23030172', '2022-09-30', 'payroll for September 2022'),
(188, 7, 'JV23030173', '2022-09-30', 'bank charges for the month (Mashreq)'),
(189, 7, 'JV23030174', '2022-09-30', 'prepaid amortization for the month'),
(190, 7, 'JV23030175', '2022-09-30', 'depreciation for the month'),
(191, 7, 'JV23030176', '2022-09-30', 'staff provision for the month'),
(192, 7, 'JV23030177', '2022-09-30', 'Etisalat for the month'),
(193, 7, 'JV23030178', '2022-09-30', 'cooling charges for the month'),
(194, 7, 'JV23030179', '2022-09-30', '3 days salary adjustment of Shahrukh Amin'),
(195, 7, 'JV23030180', '2022-09-30', 'extensive books accounting software September 2022'),
(196, 7, 'JV23030181', '2022-09-30', 'Sept 2022'),
(197, 7, 'JV23030182', '2022-10-03', 'Sept 2022'),
(198, 7, 'JV23030183', '2022-10-03', 'Sept 2022'),
(199, 7, 'JV23030184', '2022-10-12', 'salary of Mr. Babar'),
(200, 7, 'JV23030185', '2022-10-13', 'shared salary Ismail (August & September)'),
(201, 7, 'JV23030186', '2022-10-13', 'salary September 2022'),
(202, 7, 'JV23030187', '2022-10-14', 'FINAL SETTLEMENT OF RAKESH YADAN'),
(203, 7, 'JV23030188', '2022-10-20', 'RECEIVED FUND FROM MR. ASIM'),
(204, 7, 'JV23030189', '2022-10-20', 'VISIT VISA OF OJEE AHMED'),
(205, 7, 'JV23030190', '2022-10-20', '3 DAYS SALARY'),
(206, 7, 'JV23030191', '2022-10-31', 'ACCRUAL OF DEWA AND COOLING CHARGES'),
(207, 7, 'JV23030192', '2022-10-31', 'payroll for the month of October 2022'),
(208, 7, 'JV23030193', '2022-10-31', 'staff provision for the month'),
(209, 7, 'JV23030194', '2022-10-31', 'prepaid amortization for the month'),
(210, 7, 'JV23030195', '2022-10-31', 'depreciation for the month'),
(211, 7, 'JV23030196', '2022-10-31', 'extensive books accounting software October 2022'),
(212, 7, 'JV23050197', '2022-10-31', 'Etisalat for the month'),
(213, 7, 'JV23050198', '2022-10-31', 'SmartStart Account Monthly Service Fee'),
(214, 7, 'JV23050199', '2022-10-31', 'bank charges for the month (Mashreq)'),
(215, 7, 'JV23050200', '2022-11-03', 'salary advance of Mohd Fardin'),
(216, 7, 'JV23050201', '2022-11-04', 'Sangeen cash advance'),
(217, 7, 'JV23050202', '2022-11-07', 'fund from freelance for wps'),
(218, 7, 'JV23050203', '2022-11-07', 'wps of freelance'),
(219, 7, 'JV23050204', '2022-11-09', 'uncollected salary for the month of September 2022'),
(220, 7, 'JV23050205', '2022-11-12', 'downpayment for the yachts party'),
(221, 7, 'JV23050206', '2022-11-15', 'October 2022 salary for WPS'),
(222, 7, 'JV23050207', '2022-11-15', 'FUND TRANSFER FOR PAYROLL'),
(223, 7, 'JV23050208', '2022-11-15', 'CASH PAYROLL FOR OCT. 2022'),
(224, 7, 'JV23050209', '2022-11-15', 'quarterly rent Nov. 15, 2022 - Feb. 15, 2023'),
(225, 7, 'JV23050210', '2022-11-17', 'petty cash reimbursement'),
(226, 7, 'JV23050211', '2022-11-17', 'payment for October salary of Zain'),
(227, 7, 'JV23050212', '2022-11-17', 'fund transfer for expenses'),
(228, 7, 'JV23050213', '2022-11-17', 'fund transfer from Mashreq to ADCB for cooling charges'),
(229, 7, 'JV23050214', '2022-11-22', 'final settlement of Muhammad Shahrukh'),
(230, 7, 'JV23050215', '2022-11-22', 'fund from Mr. Babar for final settlement of Muhammad Shahrukh'),
(231, 7, 'JV23050216', '2022-11-22', 'final payment for the staff yacht party'),
(232, 7, 'JV23050217', '2022-11-23', 'letter head'),
(233, 7, 'JV23050218', '2022-11-26', 'smartstart monthly service fee'),
(234, 7, 'JV23050219', '2022-11-29', 'payment for Etisalat'),
(235, 7, 'JV23050220', '2022-11-30', 'dewa for the month of November'),
(236, 7, 'JV23050221', '2022-11-30', 'November 2022 payroll'),
(237, 7, 'JV23050222', '2022-11-30', 'salary adjustment of Furaha Khanali for November 2022'),
(238, 7, 'JV23050223', '2022-11-30', 'bank fee and charges for the month'),
(239, 7, 'JV23050224', '2022-11-30', 'prepaid amortization for the month'),
(240, 7, 'JV23050225', '2022-11-30', 'depreciation for the month'),
(241, 7, 'JV23050226', '2022-11-30', 'staff provision for the month'),
(242, 7, 'JV23050227', '2022-11-30', 'accrual of utilities for the month'),
(243, 7, 'JV23050228', '2022-11-30', 'Leads'),
(244, 7, 'JV23050229', '2022-12-01', 'November 2022 cooling charges adjustment because of VAT'),
(245, 7, 'JV23050230', '2022-12-01', 'visa of Mohd Fardin and Umair'),
(246, 7, 'JV23050231', '2022-12-05', 'fee salam'),
(247, 7, 'JV23050232', '2022-12-07', 'payment for November 2022 DEWA'),
(248, 7, 'JV23050233', '2022-12-15', 'fund from Mr. Asim for the salary'),
(249, 7, 'JV23050234', '2022-12-15', 'Mr. Babar\'s salary'),
(250, 7, 'JV23050235', '2022-12-16', 'fund received from Mr. Babar for basic salary of November 2022'),
(251, 7, 'JV23050236', '2022-12-17', 'fund transfer for the salary'),
(252, 7, 'JV23050237', '2022-12-22', 'fund from Mr. Asim for November cash bonus'),
(253, 7, 'JV23050238', '2022-12-22', 'Basic & Bonus Nov. 2022'),
(254, 7, 'JV22120239', '2022-12-25', 'monthly service fee'),
(255, 7, 'JV23050240', '2022-12-28', 'Leads'),
(256, 7, 'JV23050241', '2022-12-31', 'dewa for December 2022'),
(257, 7, 'JV22120242', '2022-12-31', 'December 2022 payroll'),
(258, 7, 'JV23050243', '2022-12-31', 'accrual of cooling charges for the month'),
(259, 7, 'JV23050244', '2022-12-31', 'salary adjustment for November'),
(260, 7, 'JV23050245', '2022-12-31', 'accrual of utilities for the month'),
(261, 7, 'JV23050246', '2022-12-31', 'uncollected salary for the year'),
(262, 7, 'JV23050247', '2022-12-31', 'prepaid amortization for the month'),
(263, 7, 'JV23050248', '2022-12-31', 'depreciation for the month'),
(264, 7, 'JV23050249', '2022-12-31', 'staff provision adjustment for the year'),
(265, 7, 'JV23050250', '2022-12-31', 'final pay of Furaha Chessoni'),
(266, 7, 'JV23050251', '2022-12-31', 'to adjust the payable to FCB and GACB and charge to Mr. Asim'),
(267, 7, 'JV23050252', '2023-01-03', 'fund from freelance'),
(268, 7, 'JV23050253', '2023-01-04', 'freelance wps'),
(269, 7, 'JV23050254', '2023-01-14', 'donut for the staff'),
(270, 7, 'JV23050255', '2023-01-18', 'payroll for the month of December 2022'),
(271, 7, 'JV23050256', '2022-01-19', 'PETTY CASH REIMBURSEMENT FOR FURAHA FINAL PAY'),
(272, 7, 'JV23050257', '2022-01-24', 'FINAL DU PAYMENT'),
(273, 7, 'JV23050258', '2023-01-24', 'FUND TRANSFER FOR SALARY OF SIR BABAR'),
(274, 7, 'JV23050259', '2023-01-25', 'FUND TRANSFER FOR OFFICE EXPENSES'),
(275, 7, 'JV23050260', '2023-01-25', 'LOAN PAYMENT TO SIR ASIM (DECEMBER 2022 PAYROLL)'),
(276, 7, 'JV23050261', '2023-01-26', 'Sangeen salary'),
(277, 7, 'JV23050262', '2023-01-26', 'petty cash reimbursement'),
(278, 7, 'JV23050263', '2023-01-26', 'Abhijith employment visa'),
(279, 7, 'JV23050264', '2023-01-26', 'smartstart account monthly service fee'),
(280, 7, 'JV23050265', '2023-01-26', 'fund transfer from Mashreq to ADCB'),
(281, 7, 'JV23050266', '2023-01-28', 'salary advance of Primrose'),
(282, 7, 'JV23050267', '2023-01-30', 'Lucy visa renewal'),
(283, 7, 'JV23050268', '2023-01-31', 'salary advance of Ahmed Baker'),
(284, 7, 'JV23050269', '2023-01-31', 'petty cash reimbursement'),
(285, 7, 'JV23050270', '2023-01-31', 'accrual of cooling charges for the month'),
(286, 7, 'JV23050271', '2023-01-31', 'dewa for January 2022'),
(287, 7, 'JV23050272', '2023-01-31', 'January 2023 payroll'),
(288, 7, 'JV23050273', '2023-01-31', 'prepaid amortization for the month'),
(289, 7, 'JV23050274', '2023-01-31', 'depreciation for the month'),
(290, 7, 'JV23050275', '2023-01-31', 'staff provision for the month'),
(291, 7, 'JV23050276', '2023-01-31', 'accrual of utilities for the month'),
(292, 7, 'JV23050277', '2023-01-31', 'payment adjustment for Sir Asim & Sir Babar'),
(293, 7, 'JV23050278', '2023-02-01', 'office rent February to April 2023'),
(294, 7, 'JV23050279', '2023-02-01', 'visit visa of Abhijith paid to Falak Travel'),
(295, 7, 'JV23050280', '2023-02-02', 'Michael Nbugua salary'),
(296, 7, 'JV23050281', '2023-02-02', 'Du payment'),
(297, 7, 'JV23050282', '2023-02-02', 'frund from freelance (Binu Sharma)'),
(298, 7, 'JV23050283', '2023-02-03', 'freelance WPS'),
(299, 7, 'JV23050284', '2023-02-03', 'double payment of dewa for January 2023'),
(300, 7, 'JV23050285', '2023-02-06', 'fee salaam adv. sme remittance/rever'),
(301, 7, 'JV23050286', '2023-02-14', 'petty cash reimbursement'),
(302, 7, 'JV23050287', '2023-02-14', 'for payroll funds'),
(303, 7, 'JV23050288', '2023-02-14', 'PHUB2114022384/PHUB214023083'),
(304, 7, 'JV23050289', '2023-02-14', 'Babar salary'),
(305, 7, 'JV23050290', '2023-02-14', 'Jan 2023'),
(306, 7, 'JV23050291', '2023-02-16', 'fund for license renewal 2023'),
(307, 7, 'JV23050292', '2023-02-18', 'EOS'),
(308, 7, 'JV23050293', '2023-02-23', 'PHUB215501292'),
(309, 7, 'JV23050294', '2023-02-24', 'MASHREQ'),
(310, 7, 'JV23050295', '2023-02-28', 'Feb 2023'),
(311, 7, 'JV23050296', '2023-02-28', 'accrual of utilities for the month'),
(312, 7, 'JV23050297', '2023-02-28', 'staff provision for the month'),
(313, 7, 'JV23050298', '2023-02-28', 'prepaid amortization for the month'),
(314, 7, 'JV23050299', '2023-02-28', 'depreciation for the month'),
(315, 7, 'JV23050300', '2023-02-28', 'smartstart account monthly service fee'),
(316, 7, 'JV23050301', '2023-02-28', 'to adjust the amount of dewa'),
(317, 7, 'JV23050302', '2023-02-28', 'February 2023'),
(318, 7, 'JV23050303', '2023-03-01', 'petty cash'),
(319, 7, 'JV23050304', '2023-03-02', 'Payable to PRO for visa processing'),
(320, 7, 'JV23050305', '2023-03-10', NULL),
(321, 7, 'JV23050306', '2023-03-13', 'funds'),
(322, 7, 'JV23050307', '2023-03-13', 'GACB, FMM SHARED SALARY (OFFICE BOY)'),
(323, 7, 'JV23050308', '2023-03-13', 'PAYROLL FOR FEBRUARY 2023'),
(324, 7, 'JV23050309', '2023-03-14', 'Funds'),
(325, 7, 'JV23050310', '2023-03-16', 'PHUB220198987'),
(326, 7, 'JV23050311', '2023-03-17', 'FEB. 2023'),
(327, 7, 'JV23050312', '2023-03-20', 'Etisalat expense'),
(328, 7, 'JV23050313', '2023-05-01', 'office rent for the period of May to July 2023'),
(329, 7, 'JV23050314', '2023-08-01', 'rent expense for the period of Aug to Oct 2023'),
(330, 7, 'JV23050315', '2023-11-01', 'rent expense for the period of Nov. 2022 to Jan 2023'),
(331, 7, 'JV23050316', '2023-03-04', 'vat reversal'),
(332, 7, 'JV23050317', '2023-03-17', 'For January 2023'),
(333, 7, 'JV23050318', '2023-03-31', 'Wali Vohra March 23-31, 2023'),
(334, 7, 'JV23050319', '2023-03-31', 'March 2023'),
(335, 7, 'JV23050320', '2023-03-31', 'WAVE FINE OF CHINASA RACHAEL'),
(336, 7, 'JV23050321', '2023-03-31', 'PAYROLL FOR THE MONTH OF MARCH 2023'),
(337, 7, 'JV23050322', '2023-03-31', 'DEPRECIATION FOR THE MONTH'),
(338, 7, 'JV23050323', '2023-03-31', 'PREPAID AMORTIZATION FOR THE MONTH'),
(339, 7, 'JV23050324', '2023-03-31', 'STAFF PROVISION FOR THE MONTH'),
(340, 7, 'JV23050325', '2023-04-04', 'February 2023'),
(341, 7, 'JV23050326', '2023-04-04', 'petty cash April 1 - 11, 2023'),
(342, 7, 'JV23050327', '2023-04-11', 'fund from freelance'),
(343, 7, 'JV23050328', '2023-04-11', 'April 2023'),
(344, 7, 'JV23050329', '2023-04-12', 'freelance WPS'),
(345, 7, 'JV23050330', '2023-04-13', 'BONUS ADJUSTMENT'),
(346, 7, 'JV23050331', '2023-04-13', 'PAYMENT FOR THE SALARY OF MARCH 2023'),
(347, 7, 'JV23050332', '2023-04-13', 'APRIL 2023'),
(348, 7, 'JV23050333', '2023-04-14', 'ADCB'),
(349, 7, 'JV23050334', '2023-04-14', 'PHUB226259560'),
(350, 7, 'JV23050335', '2023-04-15', 'WALI VOHRA'),
(351, 7, 'JV23050336', '2023-04-15', 'PAYMENT FOR THE CREDIT CARD'),
(352, 7, 'JV23050337', '2023-04-15', 'PETTY CASH REIMBURSEMENT'),
(353, 7, 'JV23050338', '2023-04-15', 'SLSU943558'),
(354, 7, 'JV23050339', '2023-04-16', 'PAYMENT TO CREDIT CARD'),
(355, 7, 'JV23050340', '2023-04-27', '3CX 64SC pro edition 12 months renewal annual license'),
(356, 7, 'JV23050341', '2023-04-29', 'loan from Mr. Asim'),
(357, 7, 'JV23040342', '2023-04-30', 'April 2023'),
(358, 7, 'JV23060343', '2023-06-12', 'Payable to Asim Jan'),
(359, 7, 'JV23060344', '2023-03-05', 'Cooling Expense- May 2023- PV 0145'),
(360, 7, 'JV23060345', '2023-06-15', 'payroll for the month of May 2023'),
(361, 7, 'JV23060346', '2023-06-15', 'PV 0153 police clearance of Daisy Ivy paid to the PRO'),
(362, 7, 'JV23060347', '2023-06-14', 'PV 0146 - 0150 EXTRA BONUS'),
(363, 7, 'JV23060348', '2023-06-15', 'PV 0154 PAYMENT TO MR. BABAR'),
(364, 7, 'JV23060349', '2023-06-10', 'PV 0144 AHMED BAKER CASH ADVANCE'),
(365, 7, 'JV23060350', '2023-06-15', 'clear plastic thermostat guard'),
(366, 7, 'JV23060351', '2023-06-13', 'Office DEWA- June 2023 PV 0156'),
(367, 7, 'JV23060352', '2023-05-31', 'DEWA FOR THE MONTH OF MAY 2023'),
(368, 7, 'JV23060353', '2023-05-04', 'Output Reversal\r\nVAT REVERSAL'),
(369, 7, 'JV23060354', '2023-05-31', 'salary for the month of May 2023'),
(370, 7, 'JV23060355', '2023-05-31', 'Etisalat for the month'),
(371, 7, 'JV23060356', '2023-05-31', 'cooling charges for the month'),
(372, 7, 'JV23060357', '2023-05-05', 'rent payment for the period of May to July 2023'),
(373, 7, 'JV23060358', '2023-04-30', 'Staff Salary month of April 2023'),
(374, 7, 'JV23060359', '2023-04-30', 'Prepaid Amortization Month of April 2023'),
(375, 7, 'JV23060360', '2023-04-30', 'Depreciation month of April 2023'),
(376, 7, 'JV23060361', '2023-04-30', 'Staff Provision Month of April 2023'),
(377, 7, 'JV23060362', '2023-05-11', 'payment received from April 2023 sales SRN:2023051100227464'),
(378, 7, 'JV23060363', '2023-05-12', 'fund transfer from Mashreq to ADCB'),
(379, 7, 'JV23060364', '2023-05-06', 'fund from freelance'),
(380, 7, 'JV23060365', '2023-05-08', 'wps of freelance'),
(381, 7, 'JV23060366', '2023-05-08', 'fund from FMM staff'),
(382, 7, 'JV23060367', '2023-05-09', 'wps of FMM staff'),
(383, 7, 'JV23060368', '2023-05-11', 'April 2023 shared salary AMM'),
(384, 7, 'JV23060369', '2023-05-11', 'April shared salary'),
(385, 7, 'JV23060370', '2023-05-16', 'Sangeen bonus adjustment'),
(386, 7, 'JV23060371', '2023-05-12', 'April 2023'),
(387, 7, 'JV23060372', '2023-05-16', 'GM Salary- April 2023'),
(388, 7, 'JV23060373', '2023-05-27', 'salary advance of Nauman'),
(389, 7, 'JV23040374', '2023-04-30', 'Sangeen bonus adjustment'),
(390, 7, 'JV23060375', '2023-05-19', 'fund from Golden Pearl staff'),
(391, 7, 'JV23060376', '2023-05-19', 'wps of Golden Pearl staff'),
(392, 7, 'JV23060377', '2023-05-26', 'smartstart account monthly service fee'),
(393, 7, 'JV23060378', '2023-05-31', 'prepaid amortization for the month'),
(394, 7, 'JV23060379', '2023-05-31', 'depreciation for the month'),
(395, 7, 'JV23060380', '2023-05-31', 'staff benefits for the month'),
(396, 7, 'JV23060381', '2023-06-22', 'Nauman CA- PV 0159'),
(397, 7, 'JV23060382', '2023-06-22', 'PCF PV 0161'),
(398, 7, 'JV23060383', '2023-05-05', 'Cooling Expense month of April 2023'),
(399, 7, 'JV23060384', '2023-05-05', 'Prepaid Rent for Mar, Apr, May 2023'),
(400, 7, 'JV23060385', '2023-05-06', 'Binu Salary- April 2023'),
(401, 7, 'JV23060386', '2023-05-08', 'Binu Salary- April 2023'),
(402, 7, 'JV23060387', '2023-05-08', 'Junaid salary- April 2023'),
(403, 7, 'JV23060388', '2023-05-08', 'GACB Shared Salary- April 2023'),
(404, 7, 'JV23060389', '2023-05-11', 'Office Boy Shared Salary- April 2023'),
(405, 7, 'JV23060390', '2023-05-12', 'To transfer funds to ADCB from Mashreq'),
(406, 7, 'JV23060391', '2023-05-12', 'Salary- Lucy & Abijith, April 2023'),
(407, 7, 'JV23060392', '2023-05-12', 'Staff Salary- April 2023'),
(408, 7, 'JV23060393', '2023-05-15', 'Junaid Salary- April 2023'),
(409, 7, 'JV23060394', '2023-05-16', 'GM Salary- April 2023'),
(410, 7, 'JV23060395', '2023-05-19', 'CC 0002- Payable to Asim + PTC'),
(411, 7, 'JV23060396', '2023-05-27', 'Nauman Salary Advance'),
(412, 7, 'JV23070397', '2023-07-12', 'PV 0162 salary for June 2023'),
(414, 7, 'JV23070398', '2023-07-17', 'PV 0167 PAYMENT FOR THE CREDIT CARD'),
(415, 7, 'JV23070399', '2023-07-17', 'PV 0166 PENDING BONUS FOR JUNE 2023'),
(416, 7, 'JV23070400', '2023-06-30', 'June 2023 salary'),
(417, 7, 'JV23070401', '2023-06-05', '53600605236971 freelance fund for WPS'),
(418, 7, 'JV23070402', '2023-06-05', 'SLSU976930 freelance WPS'),
(419, 7, 'JV23070403', '2023-06-08', 'PHUB238425946 fund from FMM for Junaid salary'),
(420, 7, 'JV23070404', '2023-06-08', 'uncollected salary for the month of February and March'),
(421, 7, 'JV23070405', '2023-06-09', 'SLSU979878'),
(422, 7, 'JV23070406', '2023-06-12', '53760612231860 fund from Syed Mehmood from GP'),
(423, 7, 'JV23070407', '2023-06-13', 'fund transfer from Mashreq to ADCB'),
(424, 7, 'JV23070408', '2023-06-13', 'PHUB239362320 Mehmood GP fund for his WPS'),
(425, 7, 'JV23070409', '2023-06-13', 'fund for Usman WPS'),
(426, 7, 'JV23070410', '2023-06-13', 'SLSU982837 Usman WPS'),
(427, 7, 'JV23070411', '2023-06-14', '000007 cheque withdrawal fee'),
(428, 7, 'JV23070412', '2023-06-16', 'ISMAIL SHARED SALARY'),
(429, 7, 'JV23070413', '2023-06-21', 'PHUB240863245 / PHUB240884327 Usman and Junaid Insurance'),
(430, 7, 'JV23070414', '2023-06-26', '2306260025209309 SMARTSTART ACCOUNT MONTHLY SERVICE FEE'),
(431, 7, 'JV23070415', '2023-06-30', 'prepaid amortization for the month'),
(432, 7, 'JV23070416', '2023-06-30', 'depreciation for the month'),
(433, 7, 'JV23070417', '2023-06-30', 'staff benefit for the month June 2023'),
(434, 7, 'JV23070418', '2023-06-30', 'cooling charges for the month of June 2023'),
(435, 7, 'JV23070419', '2023-07-13', 'DEWA INV100103185605 JULY23'),
(436, 7, 'JV23070420', '2023-06-30', 'PV 0163  SALARY OF SHIHAB EZZELDIN MOHAMED FOR JUNE 21 - 30 (10 DAYS)'),
(437, 7, 'JV23070421', '2023-06-30', 'SALARY OF SHIHAB EZZELDIN MOHAMED JUNE 21 - 30'),
(438, 7, 'JV23070422', '2023-07-14', 'PV 0165 SALARY ADVANCE OF SHIHAB EZZELDIN KHIDIR MOHAMED'),
(439, 7, 'JV23070423', '2023-06-30', 'salary of Abdullah Firoz Idrisi June 22 - 30'),
(440, 7, 'JV23070424', '2023-07-14', 'PV 0164 salary of Abdullah Firoz Idrisi June 22 - July 10'),
(441, 7, 'JV23070425', '2023-07-13', 'Tradeview loan'),
(442, 7, 'JV23070426', '2023-07-20', 'payment from Tradeview'),
(443, 7, 'JV23080427', '2023-07-31', 'dewa for the month of July 2023');

--
-- Triggers `voucher_master`
--
DELIMITER $$
CREATE TRIGGER `after delete voucher` AFTER DELETE ON `voucher_master` FOR EACH ROW begin

delete from voucher_detail where VoucherMstID = old.VoucherMstID;
delete from journal where VoucherMstID = old.VoucherMstID;

end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_type`
--

CREATE TABLE `voucher_type` (
  `VoucherTypeID` int NOT NULL,
  `VoucherCode` varchar(35) DEFAULT NULL,
  `VoucherTypeName` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_type`
--

INSERT INTO `voucher_type` (`VoucherTypeID`, `VoucherCode`, `VoucherTypeName`) VALUES
(1, 'BP', 'BANK PAYMENT'),
(2, 'BR', 'BANK RECEIPT'),
(3, 'CN', 'CREDIT NOTE'),
(4, 'CP', 'CASH PAYMENT'),
(5, 'CR', 'CASH RECEIPT'),
(6, 'DN', 'DEBIT NOTES'),
(7, 'JV', 'JOURNAL VOUCHER'),
(8, 'CC', 'CREDIT CARD');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_bill_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_bill_balance` (
`INVOICE` double(19,2)
,`InvoiceMasterID` int
,`Payment` double(19,2)
,`Remaining` double(22,2)
,`SupplierID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_cashflow`
-- (See below for the actual view)
--
CREATE TABLE `v_cashflow` (
`Balance` double(22,2)
,`Cr` double(19,2)
,`Dr` double(19,2)
,`MonthName` varchar(37)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_challan_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_challan_detail` (
`ChallanDate` date
,`ChallanDetailID` int
,`ChallanMasterID` int
,`ChallanNo` varchar(10)
,`Description` varchar(255)
,`Discount` double(8,2)
,`ItemCode` varchar(5)
,`ItemID` int
,`ItemName` varchar(55)
,`ItemType` varchar(55)
,`Qty` int
,`Rate` double(8,2)
,`TaxAmount` double(8,2)
,`TaxPer` double(8,2)
,`Total` double(8,2)
,`UnitName` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_challan_master`
-- (See below for the actual view)
--
CREATE TABLE `v_challan_master` (
`Active` varchar(3)
,`Address` varchar(75)
,`ChallanDate` varchar(10)
,`ChallanMasterID` int
,`ChallanNo` varchar(10)
,`ChallanType` varchar(25)
,`CustomerNotes` varchar(255)
,`DescriptionNotes` varchar(255)
,`DiscountAmount` double(8,2)
,`DiscountPer` double(8,2)
,`eDate` timestamp
,`Email` varchar(25)
,`File` varchar(75)
,`GrandTotal` double(8,2)
,`InvoiceDueDays` int
,`Mobile` varchar(150)
,`PartyID` int
,`PartyName` varchar(150)
,`Phone` varchar(25)
,`PlaceOfSupply` varchar(25)
,`ReferenceNo` varchar(25)
,`Shipping` double(8,2)
,`Subject` varchar(255)
,`SubTotal` double(8,2)
,`Tax` double(8,2)
,`TaxPer` double(8,2)
,`TermAndCondition` varchar(255)
,`Total` double(8,2)
,`TRN` varchar(150)
,`WalkinCustomerName` varchar(75)
,`Website` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_chartofaccount`
-- (See below for the actual view)
--
CREATE TABLE `v_chartofaccount` (
`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`CODE` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_chartofaccount_mini`
-- (See below for the actual view)
--
CREATE TABLE `v_chartofaccount_mini` (
`Category` varchar(55)
,`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`CODE` varchar(15)
,`L1` int
,`L2` int
,`L3` int
,`OpenCredit` int
,`OpenDebit` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_delivery_challan`
-- (See below for the actual view)
--
CREATE TABLE `v_delivery_challan` (
`Active` varchar(3)
,`Address` varchar(75)
,`Balance` double(8,2)
,`ChallanDate` date
,`ChallanMasterID` int
,`ChallanNo` varchar(10)
,`ChallanType` varchar(25)
,`CustomerNotes` varchar(255)
,`DescriptionNotes` varchar(255)
,`DiscountAmount` double(8,2)
,`DiscountPer` double(8,2)
,`eDate` timestamp
,`Email` varchar(25)
,`File` varchar(75)
,`GrandTotal` double(8,2)
,`InvoiceDueDays` int
,`Mobile` varchar(150)
,`Paid` double(8,2)
,`PartyID` int
,`PartyName` varchar(150)
,`Phone` varchar(25)
,`PlaceOfSupply` varchar(25)
,`ReferenceNo` varchar(25)
,`Shipping` double(8,2)
,`Subject` varchar(255)
,`SubTotal` double(8,2)
,`Tax` double(8,2)
,`TaxPer` double(8,2)
,`TermAndCondition` varchar(255)
,`Total` double(8,2)
,`TRN` varchar(150)
,`UserID` int
,`WalkinCustomerName` varchar(75)
,`Website` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_estimate_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_estimate_detail` (
`Description` text
,`EstimateDate` date
,`EstimateDetailID` int
,`EstimateMasterID` int
,`EstimateNo` varchar(10)
,`ItemCategoryID` int
,`ItemID` int
,`ItemName` varchar(55)
,`Qty` int
,`Rate` double(8,2)
,`Tax` double(8,2)
,`TaxPer` double(8,2)
,`title` varchar(255)
,`Total` double(8,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_estimate_master`
-- (See below for the actual view)
--
CREATE TABLE `v_estimate_master` (
`Active` varchar(3)
,`Address` varchar(75)
,`CustomerNotes` text
,`Date` date
,`DescriptionNotes` text
,`Discount` double(8,2)
,`DiscountPer` double(8,2)
,`eDate` timestamp
,`Email` varchar(25)
,`EstimateDate` date
,`EstimateMasterID` int
,`EstimateNo` varchar(10)
,`ExpiryDate` date
,`File` varchar(75)
,`GrandTotal` double(8,2)
,`InvoiceDueDays` int
,`Mobile` varchar(150)
,`PartyID` int
,`PartyName` varchar(150)
,`Phone` varchar(25)
,`PlaceOfSupply` varchar(25)
,`ReferenceNo` varchar(25)
,`Shipping` double(8,2)
,`Subject` varchar(255)
,`SubTotal` double(8,2)
,`Tax` double(8,2)
,`TaxPer` double(8,2)
,`TermAndCondition` text
,`Total` double(8,2)
,`TRN` varchar(150)
,`UserID` int
,`WalkinCustomerName` varchar(55)
,`Website` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_expense`
-- (See below for the actual view)
--
CREATE TABLE `v_expense` (
`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`Date` date
,`Date1` varchar(10)
,`ExpenseMasterID` int
,`ExpenseNo` varchar(55)
,`GrantTotal` double(8,2)
,`ReferenceNo` varchar(55)
,`SupplierID` int
,`SupplierName` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_expense_chart`
-- (See below for the actual view)
--
CREATE TABLE `v_expense_chart` (
`Balance` double(22,2)
,`ChartOfAccountName` varchar(75)
,`MonthName` varchar(69)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_expense_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_expense_detail` (
`Amount` double(8,2)
,`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`Date` date
,`ExpenseDetailID` int
,`ExpenseMasterID` int
,`ExpenseNo` varchar(55)
,`Notes` varchar(255)
,`SupplierName` varchar(150)
,`Tax` double(8,2)
,`TaxPer` double(8,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_expense_master`
-- (See below for the actual view)
--
CREATE TABLE `v_expense_master` (
`ChartOfAccountName` varchar(75)
,`Date` date
,`ExpenseNo` varchar(55)
,`GrantTotal` double(8,2)
,`ReferenceNo` varchar(55)
,`SupplierName` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_income_exp_chart`
-- (See below for the actual view)
--
CREATE TABLE `v_income_exp_chart` (
`Balance` double(22,2)
,`Cr` double(19,2)
,`Dr` double(19,2)
,`MonthName` varchar(37)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_bal`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_bal` (
`due` double(22,2)
,`INVOICE` double(19,2)
,`InvoiceMasterID` int
,`PAID` double(19,2)
,`PartyID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_balance` (
`BALANCE` double(19,2)
,`Date` date
,`DueDate` date
,`GrandTotal` double(8,2)
,`INVOICE` double(19,2)
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`PAID` double(19,2)
,`PartyID` int
,`PartyName` varchar(150)
,`ReferenceNo` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_both`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_both` (
`Active` varchar(3)
,`Address` varchar(75)
,`Balance` double(22,2)
,`CustomerNotes` varchar(255)
,`Date` date
,`DescriptionNotes` varchar(255)
,`DiscountAmount` double(8,2)
,`DiscountPer` double(8,2)
,`DueDate` date
,`eDate` timestamp
,`Email` varchar(25)
,`FullName` varchar(55)
,`GrandTotal` double(8,2)
,`InvoiceDueDays` int
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`InvoiceType` varchar(30)
,`Mobile` varchar(150)
,`Paid` double(8,2)
,`PartyID` int
,`PartyName` varchar(150)
,`PaymentDetails` varchar(255)
,`PaymentMode` varchar(25)
,`Phone` varchar(25)
,`ReferenceNo` varchar(255)
,`Shipping` double(8,2)
,`Subject` varchar(255)
,`SubTotal` double(8,2)
,`SupplierID` int
,`SupplierName` varchar(150)
,`Tax` double(8,2)
,`TaxPer` double(8,2)
,`Total` double(8,2)
,`TRN` varchar(150)
,`UserID` int
,`WalkinCustomerName` varchar(155)
,`Website` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_detail` (
`Date` date
,`Description` varchar(255)
,`InvoiceDetailID` int
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`InvoiceType` varchar(30)
,`ItemCode` varchar(5)
,`ItemID` int
,`ItemName` varchar(55)
,`PartyID` int
,`Qty` int
,`Rate` double(8,2)
,`SupplierID` int
,`Tax` double(8,2)
,`TaxPer` double(8,2)
,`Total` double(8,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_master`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_master` (
`Active` varchar(3)
,`Address` varchar(75)
,`Balance` double(22,2)
,`CustomerNotes` varchar(255)
,`Date` date
,`DescriptionNotes` varchar(255)
,`DiscountAmount` double(8,2)
,`DiscountPer` double(8,2)
,`DueDate` date
,`eDate` timestamp
,`Email` varchar(25)
,`FullName` varchar(55)
,`GrandTotal` double(8,2)
,`InvoiceDueDays` int
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`InvoiceType` varchar(30)
,`Mobile` varchar(150)
,`Paid` double(8,2)
,`PartyID` int
,`PartyName` varchar(150)
,`PaymentDetails` varchar(255)
,`PaymentMode` varchar(25)
,`Phone` varchar(25)
,`ReferenceNo` varchar(255)
,`Shipping` double(8,2)
,`Subject` varchar(255)
,`SubTotal` double(8,2)
,`SupplierID` int
,`Tax` double(8,2)
,`TaxPer` double(8,2)
,`TaxType` varchar(55)
,`Total` double(8,2)
,`TRN` varchar(150)
,`UserID` int
,`WalkinCustomerName` varchar(155)
,`Website` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_master_supplier`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_master_supplier` (
`Active` varchar(3)
,`Address` varchar(75)
,`Balance` double(19,2)
,`CustomerNotes` varchar(255)
,`Date` date
,`DescriptionNotes` varchar(255)
,`DiscountAmount` double(8,2)
,`DiscountPer` double(8,2)
,`DueDate` date
,`Email` varchar(150)
,`GrandTotal` double(8,2)
,`InvoiceDueDays` int
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`Paid` double(19,2)
,`PartyID` int
,`Payment` double(19,2)
,`PaymentDetails` varchar(255)
,`PaymentMode` varchar(25)
,`Phone` varchar(150)
,`ReferenceNo` varchar(255)
,`Remaining` double(19,2)
,`Shipping` double(8,2)
,`Subject` varchar(255)
,`SubTotal` double(8,2)
,`SupplierID` int
,`SupplierName` varchar(150)
,`Tax` double(8,2)
,`TaxPer` double(8,2)
,`Total` double(8,2)
,`TRN` varchar(75)
,`UserID` int
,`WalkinCustomerName` varchar(155)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_party_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_party_balance` (
`BALANCE` double(19,2)
,`PartyID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_inv_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_inv_balance` (
`Balance` double(19,2)
,`InvoiceMasterID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_journal`
-- (See below for the actual view)
--
CREATE TABLE `v_journal` (
`BankReconcile` varchar(15)
,`Category` varchar(55)
,`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`CODE` varchar(15)
,`Cr` double(10,2)
,`Date` date
,`Dr` double(10,2)
,`ExpenseMasterID` int
,`InvoiceMasterID` int
,`JournalID` int
,`JournalType` varchar(10)
,`L1` int
,`L2` int
,`L3` int
,`Narration` varchar(255)
,`PartyID` int
,`PaymentMasterID` int
,`PettyMstID` int
,`PurchasePaymentMasterID` int
,`ReconcileDate` timestamp
,`SupplierID` int
,`Trace` decimal(10,0)
,`VHNO` varchar(15)
,`VoucherMstID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_journal_report`
-- (See below for the actual view)
--
CREATE TABLE `v_journal_report` (
`Date` date
,`INVOICE` varchar(7)
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_partywise_sale`
-- (See below for the actual view)
--
CREATE TABLE `v_partywise_sale` (
`Balance` double(8,2)
,`CustomerNotes` varchar(255)
,`Date` date
,`DescriptionNotes` varchar(255)
,`DiscountAmount` double(8,2)
,`DiscountPer` double(8,2)
,`DueDate` date
,`GrandTotal` double(8,2)
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`InvoiceType` varchar(30)
,`Paid` double(8,2)
,`PartyID` int
,`PartyName` varchar(150)
,`PaymentDetails` varchar(255)
,`PaymentMode` varchar(25)
,`ReferenceNo` varchar(255)
,`Shipping` double(8,2)
,`Subject` varchar(255)
,`SubTotal` double(8,2)
,`SupplierID` int
,`Tax` double(8,2)
,`TaxPer` double(8,2)
,`Total` double(8,2)
,`UserID` int
,`WalkinCustomerName` varchar(155)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_party_aging`
-- (See below for the actual view)
--
CREATE TABLE `v_party_aging` (
`age15Days` double(19,2)
,`age30Days` double(19,2)
,`age60Days` double(19,2)
,`age7Days` double(19,2)
,`age90Days` double(19,2)
,`age90plusDays` double(19,2)
,`PartyID` int
,`PartyName` varchar(150)
,`Total` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_party_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_party_balance` (
`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`Cr` double(10,2)
,`Date` date
,`Dr` double(10,2)
,`InvoiceMasterID` int
,`JournalType` varchar(10)
,`Narration` varchar(255)
,`PartyID` int
,`PartyName` varchar(150)
,`PettyMstID` int
,`SupplierID` int
,`VHNO` varchar(15)
,`VoucherMstID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_party_montly_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_party_montly_balance` (
`Balance` double(22,2)
,`Cr` double(19,2)
,`Date` varchar(37)
,`Dr` double(19,2)
,`PartyID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_payment`
-- (See below for the actual view)
--
CREATE TABLE `v_payment` (
`Active` varchar(3)
,`Address` varchar(75)
,`ChartOfAccountID` int
,`eDate` timestamp
,`Email` varchar(25)
,`File` varchar(35)
,`InvoiceDueDays` int
,`Mobile` varchar(150)
,`Notes` longtext
,`PartyID` int
,`PartyName` varchar(150)
,`PaymentAmount` double(8,2)
,`PaymentDate` date
,`PaymentMasterID` int
,`PaymentMode` varchar(25)
,`Phone` varchar(25)
,`ReferenceNo` varchar(255)
,`TRN` varchar(150)
,`Website` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_payment_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_payment_detail` (
`eDate` timestamp
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`Payment` double(8,2)
,`PaymentDate` date
,`PaymentDetailID` int
,`PaymentMasterID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_payment_summary`
-- (See below for the actual view)
--
CREATE TABLE `v_payment_summary` (
`InvoiceMasterID` int
,`Paid` double(19,2)
,`PaymentMasterID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pettycash_master`
-- (See below for the actual view)
--
CREATE TABLE `v_pettycash_master` (
`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`CODE` varchar(15)
,`Credit` double(10,2)
,`Date` date
,`Narration` varchar(255)
,`PettyMstID` int
,`PettyVoucher` varchar(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_purchase_order_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_purchase_order_detail` (
`Amount` double(8,2)
,`Date` date
,`Description` varchar(255)
,`Discount` double(8,2)
,`DiscountPer` double(8,2)
,`ItemID` int
,`ItemName` varchar(55)
,`PurchaseOrderDetailID` int
,`PurchaseOrderMasterID` int
,`Qty` varchar(10)
,`Rate` double(8,2)
,`Remarks` varchar(255)
,`Tax` double(8,2)
,`TaxPer` double(8,2)
,`Unit` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_purchase_order_master`
-- (See below for the actual view)
--
CREATE TABLE `v_purchase_order_master` (
`Active` varchar(3)
,`Address` varchar(75)
,`Date` date
,`DeliveryDate` date
,`DeliveryNotes` longtext
,`Discount` double(8,2)
,`DiscountPer` double(8,2)
,`eDate` timestamp
,`Email` varchar(150)
,`GrandTotal` double(8,2)
,`InvoiceDueDays` int
,`Mobile` varchar(150)
,`Phone` varchar(150)
,`PON` varchar(10)
,`PONotes` varchar(255)
,`PurchaseOrderMasterID` int
,`ReferenceNo` varchar(255)
,`Subject` varchar(255)
,`SubTotal` double(8,2)
,`SupplierID` int
,`SupplierName` varchar(150)
,`Tax` double(8,2)
,`TRN` varchar(75)
,`UserID` int
,`Website` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_purchase_payment`
-- (See below for the actual view)
--
CREATE TABLE `v_purchase_payment` (
`ChartOfAccountID` int
,`eDate` timestamp
,`File` varchar(35)
,`Notes` longtext
,`PaymentAmount` double(8,2)
,`PaymentDate` date
,`PaymentMode` varchar(25)
,`PurchasePaymentMasterID` int
,`ReferenceNo` varchar(35)
,`SupplierID` int
,`SupplierName` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_purchase_payment_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_purchase_payment_detail` (
`eDate` timestamp
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`Payment` double(8,2)
,`PaymentDate` date
,`PurchasePaymentDetailID` int
,`PurchasePaymentMasterID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_purchase_payment_master`
-- (See below for the actual view)
--
CREATE TABLE `v_purchase_payment_master` (
`Active` varchar(3)
,`Address` varchar(75)
,`ChartOfAccountID` int
,`eDate` timestamp
,`Email` varchar(150)
,`File` varchar(35)
,`Notes` longtext
,`PaymentAmount` double(8,2)
,`PaymentDate` date
,`PaymentMode` varchar(25)
,`Phone` varchar(150)
,`PurchasePaymentMasterID` int
,`ReferenceNo` varchar(35)
,`SupplierID` int
,`SupplierName` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_receivabledetail`
-- (See below for the actual view)
--
CREATE TABLE `v_receivabledetail` (
`Address` varchar(75)
,`Balance` double(8,2)
,`Date` date
,`InvoiceDetailID` int
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`ItemID` int
,`Paid` double(8,2)
,`PartyID` int
,`PartyName` varchar(150)
,`Qty` int
,`ReferenceNo` varchar(255)
,`SubTotal` double(8,2)
,`Total` double(8,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rev_exp`
-- (See below for the actual view)
--
CREATE TABLE `v_rev_exp` (
`date_format(``v_journal``.``Date``,'%m-%Y')` varchar(7)
,`DATE_FORMAT(date,'%M-%Y')` varchar(69)
,`Exp` double(19,2)
,`Rev` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rev_exp_chart`
-- (See below for the actual view)
--
CREATE TABLE `v_rev_exp_chart` (
`Exp` double
,`MonthName` varchar(69)
,`Rev` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_supplier`
-- (See below for the actual view)
--
CREATE TABLE `v_supplier` (
`Active` varchar(3)
,`Address` varchar(75)
,`eDate` timestamp
,`Email` varchar(150)
,`InvoiceDueDays` int
,`Mobile` varchar(150)
,`Phone` varchar(150)
,`SupplierID` int
,`SupplierName` varchar(150)
,`TRN` varchar(75)
,`Website` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_supplier_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_supplier_balance` (
`Balance` double(19,2)
,`Cr` double(19,2)
,`Date` varchar(37)
,`Dr` double(19,2)
,`SupplierID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_supplier_outstanding`
-- (See below for the actual view)
--
CREATE TABLE `v_supplier_outstanding` (
`BALANCE` double(22,2)
,`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`Date` date
,`DueDate` date
,`GrandTotal` double(8,2)
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`PAID` double(19,2)
,`PartyID` int
,`SupplierID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_supplier_over_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_supplier_over_balance` (
`BALANCE` double(19,2)
,`SupplierID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_trial`
-- (See below for the actual view)
--
CREATE TABLE `v_trial` (
`Balance` double(22,2)
,`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`Cr` double(19,2)
,`Dr` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_trialreport`
-- (See below for the actual view)
--
CREATE TABLE `v_trialreport` (
`Balance` double(22,2)
,`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`Cr` double(19,2)
,`Dr` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_trial_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_trial_balance` (
`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`Cr` double(22,2)
,`Dr` double(22,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_voucher`
-- (See below for the actual view)
--
CREATE TABLE `v_voucher` (
`Amount` double(19,2)
,`Date` date
,`Narration` varchar(255)
,`Voucher` varchar(15)
,`VoucherCode` varchar(35)
,`VoucherMstID` int
,`VoucherTypeName` varchar(35)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_voucher_amount`
-- (See below for the actual view)
--
CREATE TABLE `v_voucher_amount` (
`Amount` double(22,2)
,`Voucher` varchar(15)
,`VoucherMstID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_voucher_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_voucher_detail` (
`ChartOfAccountName` varchar(75)
,`ChOfAcc` int
,`Credit` double(10,2)
,`Date` date
,`Debit` double(10,2)
,`InvoiceNo` varchar(75)
,`Narration` varchar(255)
,`NarrationMaster` varchar(255)
,`PartyID` int
,`PartyName` varchar(150)
,`RefNo` varchar(75)
,`SupplierID` int
,`SupplierName` varchar(150)
,`Voucher` varchar(15)
,`VoucherCodeID` int
,`VoucherMstID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_voucher_master`
-- (See below for the actual view)
--
CREATE TABLE `v_voucher_master` (
`Credit` double(10,2)
,`Date` date
,`Debit` double(10,2)
,`Narration` varchar(255)
,`PartyID` int
,`PartyName` varchar(150)
,`SupplierID` int
,`SupplierName` varchar(150)
,`Voucher` varchar(15)
,`VoucherCode` varchar(35)
,`VoucherCodeID` int
,`VoucherMstID` int
,`VoucherTypeID` int
,`VoucherTypeName` varchar(35)
);

-- --------------------------------------------------------

--
-- Structure for view `v_bill_balance`
--
DROP TABLE IF EXISTS `v_bill_balance`;

CREATE OR REPLACE VIEW `v_bill_balance`  AS SELECT `journal`.`InvoiceMasterID` AS `InvoiceMasterID`, sum(ifnull(`journal`.`Cr`,0)) AS `INVOICE`, sum(ifnull(`journal`.`Dr`,0)) AS `Payment`, (sum(ifnull(`journal`.`Cr`,0)) - sum(ifnull(`journal`.`Dr`,0))) AS `Remaining`, `journal`.`SupplierID` AS `SupplierID` FROM `journal` WHERE (`journal`.`ChartOfAccountID` = 210100) GROUP BY `journal`.`SupplierID`, `journal`.`InvoiceMasterID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_cashflow`
--
DROP TABLE IF EXISTS `v_cashflow`;

CREATE OR REPLACE VIEW `v_cashflow`  AS SELECT sum(ifnull(`journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`journal`.`Dr`,0)) - sum(ifnull(`journal`.`Cr`,0))) AS `Balance`, date_format(`journal`.`Date`,'%b-%Y') AS `MonthName` FROM `journal` WHERE (`journal`.`ChartOfAccountID` in (110201,110250,110101,110200)) GROUP BY date_format(`journal`.`Date`,'%b-%Y') ORDER BY date_format(`journal`.`Date`,'%b-%Y') ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_challan_detail`
--
DROP TABLE IF EXISTS `v_challan_detail`;

CREATE OR REPLACE VIEW `v_challan_detail`  AS SELECT `challan_detail`.`ChallanDetailID` AS `ChallanDetailID`, `challan_detail`.`ChallanMasterID` AS `ChallanMasterID`, `challan_detail`.`ChallanNo` AS `ChallanNo`, `challan_detail`.`ChallanDate` AS `ChallanDate`, `challan_detail`.`ItemID` AS `ItemID`, `challan_detail`.`Qty` AS `Qty`, `challan_detail`.`Rate` AS `Rate`, `challan_detail`.`TaxAmount` AS `TaxAmount`, `challan_detail`.`TaxPer` AS `TaxPer`, `challan_detail`.`Discount` AS `Discount`, `challan_detail`.`Total` AS `Total`, `item`.`ItemType` AS `ItemType`, `item`.`ItemCode` AS `ItemCode`, `item`.`ItemName` AS `ItemName`, `item`.`UnitName` AS `UnitName`, `challan_detail`.`Description` AS `Description` FROM (`challan_detail` join `item` on((`challan_detail`.`ItemID` = `item`.`ItemID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_challan_master`
--
DROP TABLE IF EXISTS `v_challan_master`;

CREATE OR REPLACE VIEW `v_challan_master`  AS SELECT `challan_master`.`ChallanMasterID` AS `ChallanMasterID`, `challan_master`.`ChallanNo` AS `ChallanNo`, `challan_master`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `challan_master`.`PlaceOfSupply` AS `PlaceOfSupply`, `challan_master`.`ReferenceNo` AS `ReferenceNo`, date_format(`challan_master`.`ChallanDate`,'%d/%m/%Y') AS `ChallanDate`, `challan_master`.`ChallanType` AS `ChallanType`, `challan_master`.`Total` AS `Total`, `challan_master`.`CustomerNotes` AS `CustomerNotes`, `challan_master`.`TermAndCondition` AS `TermAndCondition`, `challan_master`.`File` AS `File`, `party`.`TRN` AS `TRN`, `party`.`Address` AS `Address`, `party`.`Mobile` AS `Mobile`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`eDate` AS `eDate`, `challan_master`.`Subject` AS `Subject`, `challan_master`.`DescriptionNotes` AS `DescriptionNotes`, `challan_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `challan_master`.`DiscountPer` AS `DiscountPer`, `challan_master`.`SubTotal` AS `SubTotal`, `challan_master`.`DiscountAmount` AS `DiscountAmount`, `challan_master`.`TaxPer` AS `TaxPer`, `challan_master`.`Tax` AS `Tax`, `challan_master`.`Shipping` AS `Shipping`, `challan_master`.`GrandTotal` AS `GrandTotal` FROM (`challan_master` join `party` on((`challan_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_chartofaccount`
--
DROP TABLE IF EXISTS `v_chartofaccount`;

CREATE OR REPLACE VIEW `v_chartofaccount`  AS SELECT `chartofaccount`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `chartofaccount`.`CODE` AS `CODE` FROM `chartofaccount` WHERE ((right(`chartofaccount`.`ChartOfAccountID`,5) = 0) AND (`chartofaccount`.`ChartOfAccountName` is not null))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_chartofaccount_mini`
--
DROP TABLE IF EXISTS `v_chartofaccount_mini`;

CREATE OR REPLACE VIEW `v_chartofaccount_mini`  AS SELECT `chartofaccount`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`CODE` AS `CODE`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `chartofaccount`.`OpenDebit` AS `OpenDebit`, `chartofaccount`.`OpenCredit` AS `OpenCredit`, `chartofaccount`.`L1` AS `L1`, `chartofaccount`.`L2` AS `L2`, `chartofaccount`.`L3` AS `L3`, `chartofaccount`.`Category` AS `Category` FROM `chartofaccount` WHERE (`chartofaccount`.`Category` in ('CASH','CARD','BANK','AR'))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_delivery_challan`
--
DROP TABLE IF EXISTS `v_delivery_challan`;

CREATE OR REPLACE VIEW `v_delivery_challan`  AS SELECT `challan_master`.`ChallanMasterID` AS `ChallanMasterID`, `challan_master`.`ChallanNo` AS `ChallanNo`, `challan_master`.`PartyID` AS `PartyID`, `challan_master`.`PlaceOfSupply` AS `PlaceOfSupply`, `challan_master`.`ReferenceNo` AS `ReferenceNo`, `challan_master`.`ChallanDate` AS `ChallanDate`, `challan_master`.`ChallanType` AS `ChallanType`, `challan_master`.`Total` AS `Total`, `challan_master`.`CustomerNotes` AS `CustomerNotes`, `challan_master`.`TermAndCondition` AS `TermAndCondition`, `challan_master`.`File` AS `File`, `challan_master`.`UserID` AS `UserID`, `party`.`PartyName` AS `PartyName`, `party`.`Address` AS `Address`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`TRN` AS `TRN`, `party`.`Mobile` AS `Mobile`, `party`.`Website` AS `Website`, `party`.`eDate` AS `eDate`, `challan_master`.`Subject` AS `Subject`, `challan_master`.`DescriptionNotes` AS `DescriptionNotes`, `challan_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `challan_master`.`SubTotal` AS `SubTotal`, `challan_master`.`DiscountPer` AS `DiscountPer`, `challan_master`.`DiscountAmount` AS `DiscountAmount`, `challan_master`.`TaxPer` AS `TaxPer`, `challan_master`.`Tax` AS `Tax`, `challan_master`.`Shipping` AS `Shipping`, `challan_master`.`GrandTotal` AS `GrandTotal`, `challan_master`.`Paid` AS `Paid`, `challan_master`.`Balance` AS `Balance` FROM (`challan_master` join `party` on((`challan_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_estimate_detail`
--
DROP TABLE IF EXISTS `v_estimate_detail`;

CREATE OR REPLACE VIEW `v_estimate_detail`  AS SELECT `estimate_detail`.`EstimateDetailID` AS `EstimateDetailID`, `estimate_detail`.`EstimateMasterID` AS `EstimateMasterID`, `estimate_detail`.`EstimateNo` AS `EstimateNo`, `estimate_detail`.`EstimateDate` AS `EstimateDate`, `estimate_detail`.`ItemID` AS `ItemID`, `item`.`ItemName` AS `ItemName`, `estimate_detail`.`Qty` AS `Qty`, `estimate_detail`.`Rate` AS `Rate`, `estimate_detail`.`Total` AS `Total`, `estimate_detail`.`Description` AS `Description`, `estimate_detail`.`TaxPer` AS `TaxPer`, `estimate_detail`.`Tax` AS `Tax`, `estimate_detail`.`ItemCategoryID` AS `ItemCategoryID`, `item_category`.`title` AS `title` FROM ((`estimate_detail` join `item` on((`estimate_detail`.`ItemID` = `item`.`ItemID`))) join `item_category` on((`estimate_detail`.`ItemCategoryID` = `item_category`.`ItemCategoryID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_estimate_master`
--
DROP TABLE IF EXISTS `v_estimate_master`;

CREATE OR REPLACE VIEW `v_estimate_master`  AS SELECT `estimate_master`.`EstimateMasterID` AS `EstimateMasterID`, `estimate_master`.`EstimateNo` AS `EstimateNo`, `estimate_master`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `estimate_master`.`PlaceOfSupply` AS `PlaceOfSupply`, `estimate_master`.`ReferenceNo` AS `ReferenceNo`, `estimate_master`.`EstimateDate` AS `EstimateDate`, `estimate_master`.`Total` AS `Total`, `estimate_master`.`CustomerNotes` AS `CustomerNotes`, `estimate_master`.`TermAndCondition` AS `TermAndCondition`, `estimate_master`.`File` AS `File`, `estimate_master`.`UserID` AS `UserID`, `estimate_master`.`Subject` AS `Subject`, `party`.`Address` AS `Address`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `estimate_master`.`Date` AS `Date`, `estimate_master`.`SubTotal` AS `SubTotal`, `estimate_master`.`TaxPer` AS `TaxPer`, `estimate_master`.`Tax` AS `Tax`, `estimate_master`.`DiscountPer` AS `DiscountPer`, `estimate_master`.`Discount` AS `Discount`, `estimate_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `estimate_master`.`Shipping` AS `Shipping`, `estimate_master`.`DescriptionNotes` AS `DescriptionNotes`, `estimate_master`.`ExpiryDate` AS `ExpiryDate`, `estimate_master`.`GrandTotal` AS `GrandTotal`, `party`.`TRN` AS `TRN`, `party`.`Mobile` AS `Mobile`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`eDate` AS `eDate` FROM (`estimate_master` join `party` on((`estimate_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_expense`
--
DROP TABLE IF EXISTS `v_expense`;

CREATE OR REPLACE VIEW `v_expense`  AS SELECT `expense_master`.`ExpenseMasterID` AS `ExpenseMasterID`, `expense_master`.`Date` AS `Date`, date_format(`expense_master`.`Date`,'%d-%m-%Y') AS `Date1`, `expense_master`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `expense_master`.`SupplierID` AS `SupplierID`, `supplier`.`SupplierName` AS `SupplierName`, `expense_master`.`ReferenceNo` AS `ReferenceNo`, `expense_master`.`ExpenseNo` AS `ExpenseNo`, `expense_master`.`GrantTotal` AS `GrantTotal` FROM ((`expense_master` join `chartofaccount` on((`expense_master`.`ChartOfAccountID` = `chartofaccount`.`ChartOfAccountID`))) join `supplier` on((`expense_master`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_expense_chart`
--
DROP TABLE IF EXISTS `v_expense_chart`;

CREATE OR REPLACE VIEW `v_expense_chart`  AS SELECT date_format(`v_journal`.`Date`,'%M-%Y') AS `MonthName`, (sum(if((`v_journal`.`Dr` is null),0,`v_journal`.`Dr`)) - sum(if((`v_journal`.`Cr` is null),0,`v_journal`.`Cr`))) AS `Balance`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName` FROM `v_journal` WHERE (`v_journal`.`CODE` = 'E') GROUP BY date_format(`v_journal`.`Date`,'%M-%Y'), `v_journal`.`ChartOfAccountName`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_expense_detail`
--
DROP TABLE IF EXISTS `v_expense_detail`;

CREATE OR REPLACE VIEW `v_expense_detail`  AS SELECT `expense_master`.`ExpenseNo` AS `ExpenseNo`, `expense_master`.`Date` AS `Date`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `expense_detail`.`ExpenseDetailID` AS `ExpenseDetailID`, `expense_detail`.`ExpenseMasterID` AS `ExpenseMasterID`, `expense_detail`.`ChartOfAccountID` AS `ChartOfAccountID`, `expense_detail`.`Notes` AS `Notes`, `expense_detail`.`TaxPer` AS `TaxPer`, `expense_detail`.`Tax` AS `Tax`, `expense_detail`.`Amount` AS `Amount`, `supplier`.`SupplierName` AS `SupplierName` FROM (((`expense_detail` join `expense_master` on((`expense_master`.`ExpenseMasterID` = `expense_detail`.`ExpenseMasterID`))) join `chartofaccount` on((`expense_detail`.`ChartOfAccountID` = `chartofaccount`.`ChartOfAccountID`))) join `supplier` on((`expense_master`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_expense_master`
--
DROP TABLE IF EXISTS `v_expense_master`;

CREATE OR REPLACE VIEW `v_expense_master`  AS SELECT `expense_master`.`Date` AS `Date`, `expense_master`.`ExpenseNo` AS `ExpenseNo`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `expense_master`.`ReferenceNo` AS `ReferenceNo`, `supplier`.`SupplierName` AS `SupplierName`, `expense_master`.`GrantTotal` AS `GrantTotal` FROM ((`expense_master` join `chartofaccount` on((`expense_master`.`ChartOfAccountID` = `chartofaccount`.`ChartOfAccountID`))) join `supplier` on((`expense_master`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_income_exp_chart`
--
DROP TABLE IF EXISTS `v_income_exp_chart`;

CREATE OR REPLACE VIEW `v_income_exp_chart`  AS SELECT sum(ifnull(`journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`journal`.`Dr`,0)) - sum(ifnull(`journal`.`Cr`,0))) AS `Balance`, date_format(`journal`.`Date`,'%b-%Y') AS `MonthName` FROM `journal` WHERE (`journal`.`ChartOfAccountID` in (110201,110250,110101,110200)) GROUP BY date_format(`journal`.`Date`,'%b-%Y')  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_bal`
--
DROP TABLE IF EXISTS `v_invoice_bal`;

CREATE OR REPLACE VIEW `v_invoice_bal`  AS SELECT `journal`.`PartyID` AS `PartyID`, `journal`.`InvoiceMasterID` AS `InvoiceMasterID`, sum(ifnull(`journal`.`Dr`,0)) AS `INVOICE`, sum(ifnull(`journal`.`Cr`,0)) AS `PAID`, (sum(ifnull(`journal`.`Dr`,0)) - sum(ifnull(`journal`.`Cr`,0))) AS `due` FROM `journal` WHERE (`journal`.`ChartOfAccountID` = 110400) GROUP BY `journal`.`PartyID`, `journal`.`InvoiceMasterID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_balance`
--
DROP TABLE IF EXISTS `v_invoice_balance`;

CREATE OR REPLACE VIEW `v_invoice_balance`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `v_invoice_bal`.`PartyID` AS `PartyID`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `v_invoice_bal`.`INVOICE` AS `INVOICE`, `v_invoice_bal`.`PAID` AS `PAID`, `v_invoice_bal`.`due` AS `BALANCE`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`DueDate` AS `DueDate`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `party`.`PartyName` AS `PartyName`, `invoice_master`.`GrandTotal` AS `GrandTotal` FROM ((`invoice_master` join `v_invoice_bal` on((`invoice_master`.`InvoiceMasterID` = `v_invoice_bal`.`InvoiceMasterID`))) join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_both`
--
DROP TABLE IF EXISTS `v_invoice_both`;

CREATE OR REPLACE VIEW `v_invoice_both`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`UserID` AS `UserID`, `invoice_master`.`PaymentMode` AS `PaymentMode`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`Paid` AS `Paid`, (`invoice_master`.`GrandTotal` - `invoice_master`.`Paid`) AS `Balance`, `invoice_master`.`DueDate` AS `DueDate`, `party`.`PartyName` AS `PartyName`, `party`.`Address` AS `Address`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`CustomerNotes` AS `CustomerNotes`, `invoice_master`.`Subject` AS `Subject`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_master`.`SupplierID` AS `SupplierID`, `invoice_master`.`PartyID` AS `PartyID`, `invoice_master`.`SubTotal` AS `SubTotal`, `invoice_master`.`DiscountPer` AS `DiscountPer`, `invoice_master`.`DiscountAmount` AS `DiscountAmount`, `invoice_master`.`InvoiceType` AS `InvoiceType`, `invoice_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `invoice_master`.`DescriptionNotes` AS `DescriptionNotes`, `invoice_master`.`TaxPer` AS `TaxPer`, `invoice_master`.`Tax` AS `Tax`, `invoice_master`.`Shipping` AS `Shipping`, `invoice_master`.`GrandTotal` AS `GrandTotal`, `party`.`Mobile` AS `Mobile`, `party`.`TRN` AS `TRN`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`eDate` AS `eDate`, `invoice_master`.`PaymentDetails` AS `PaymentDetails`, `user`.`FullName` AS `FullName`, `supplier`.`SupplierName` AS `SupplierName` FROM (((`invoice_master` left join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`))) left join `user` on((`invoice_master`.`UserID` = `user`.`UserID`))) left join `supplier` on((`invoice_master`.`SupplierID` = `supplier`.`SupplierID`))) ORDER BY `invoice_master`.`InvoiceMasterID` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_detail`
--
DROP TABLE IF EXISTS `v_invoice_detail`;

CREATE OR REPLACE VIEW `v_invoice_detail`  AS SELECT `invoice_detail`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`Date` AS `Date`, `invoice_detail`.`InvoiceDetailID` AS `InvoiceDetailID`, `invoice_detail`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_detail`.`ItemID` AS `ItemID`, `invoice_detail`.`SupplierID` AS `SupplierID`, `invoice_detail`.`PartyID` AS `PartyID`, `invoice_detail`.`Qty` AS `Qty`, `invoice_detail`.`Rate` AS `Rate`, `invoice_detail`.`Total` AS `Total`, `item`.`ItemCode` AS `ItemCode`, `item`.`ItemName` AS `ItemName`, `invoice_detail`.`Description` AS `Description`, `invoice_detail`.`TaxPer` AS `TaxPer`, `invoice_detail`.`Tax` AS `Tax`, `invoice_master`.`InvoiceType` AS `InvoiceType` FROM ((`invoice_detail` join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `invoice_detail`.`InvoiceMasterID`))) join `item` on((`invoice_detail`.`ItemID` = `item`.`ItemID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_master`
--
DROP TABLE IF EXISTS `v_invoice_master`;

CREATE OR REPLACE VIEW `v_invoice_master`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`UserID` AS `UserID`, `invoice_master`.`PaymentMode` AS `PaymentMode`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`Paid` AS `Paid`, (`invoice_master`.`GrandTotal` - `invoice_master`.`Paid`) AS `Balance`, `invoice_master`.`DueDate` AS `DueDate`, `party`.`PartyName` AS `PartyName`, `party`.`Address` AS `Address`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`CustomerNotes` AS `CustomerNotes`, `invoice_master`.`Subject` AS `Subject`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_master`.`SupplierID` AS `SupplierID`, `invoice_master`.`PartyID` AS `PartyID`, `invoice_master`.`SubTotal` AS `SubTotal`, `invoice_master`.`DiscountPer` AS `DiscountPer`, `invoice_master`.`DiscountAmount` AS `DiscountAmount`, `invoice_master`.`InvoiceType` AS `InvoiceType`, `invoice_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `invoice_master`.`DescriptionNotes` AS `DescriptionNotes`, `invoice_master`.`TaxPer` AS `TaxPer`, `invoice_master`.`Tax` AS `Tax`, `invoice_master`.`Shipping` AS `Shipping`, `invoice_master`.`GrandTotal` AS `GrandTotal`, `party`.`Mobile` AS `Mobile`, `party`.`TRN` AS `TRN`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`eDate` AS `eDate`, `invoice_master`.`PaymentDetails` AS `PaymentDetails`, `user`.`FullName` AS `FullName`, `invoice_master`.`TaxType` AS `TaxType` FROM ((`invoice_master` join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`))) left join `user` on((`invoice_master`.`UserID` = `user`.`UserID`))) ORDER BY `invoice_master`.`InvoiceMasterID` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_master_supplier`
--
DROP TABLE IF EXISTS `v_invoice_master_supplier`;

CREATE OR REPLACE VIEW `v_invoice_master_supplier`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`UserID` AS `UserID`, `invoice_master`.`PaymentMode` AS `PaymentMode`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`DueDate` AS `DueDate`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`CustomerNotes` AS `CustomerNotes`, `invoice_master`.`Subject` AS `Subject`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_master`.`SupplierID` AS `SupplierID`, `invoice_master`.`PartyID` AS `PartyID`, `invoice_master`.`SubTotal` AS `SubTotal`, `invoice_master`.`DiscountPer` AS `DiscountPer`, `invoice_master`.`DiscountAmount` AS `DiscountAmount`, `supplier`.`SupplierName` AS `SupplierName`, `supplier`.`Address` AS `Address`, `supplier`.`Phone` AS `Phone`, `supplier`.`Email` AS `Email`, `supplier`.`Active` AS `Active`, `supplier`.`InvoiceDueDays` AS `InvoiceDueDays`, `invoice_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `invoice_master`.`PaymentDetails` AS `PaymentDetails`, `invoice_master`.`DescriptionNotes` AS `DescriptionNotes`, `invoice_master`.`GrandTotal` AS `GrandTotal`, `invoice_master`.`Shipping` AS `Shipping`, `invoice_master`.`Tax` AS `Tax`, `invoice_master`.`TaxPer` AS `TaxPer`, `supplier`.`TRN` AS `TRN`, `v_bill_balance`.`Remaining` AS `Remaining`, `v_bill_balance`.`Payment` AS `Payment`, `v_bill_balance`.`Remaining` AS `Paid`, `v_bill_balance`.`Payment` AS `Balance` FROM ((`invoice_master` join `supplier` on((`invoice_master`.`SupplierID` = `supplier`.`SupplierID`))) left join `v_bill_balance` on((`invoice_master`.`InvoiceMasterID` = `v_bill_balance`.`InvoiceMasterID`))) ORDER BY `invoice_master`.`InvoiceMasterID` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_party_balance`
--
DROP TABLE IF EXISTS `v_invoice_party_balance`;

CREATE OR REPLACE VIEW `v_invoice_party_balance`  AS SELECT `v_invoice_balance`.`PartyID` AS `PartyID`, sum(`v_invoice_balance`.`BALANCE`) AS `BALANCE` FROM `v_invoice_balance` GROUP BY `v_invoice_balance`.`PartyID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_inv_balance`
--
DROP TABLE IF EXISTS `v_inv_balance`;

CREATE OR REPLACE VIEW `v_inv_balance`  AS SELECT `journal`.`InvoiceMasterID` AS `InvoiceMasterID`, sum(`journal`.`Dr`) AS `Balance` FROM `journal` WHERE (left(`journal`.`VHNO`,3) = 'PAY') GROUP BY `journal`.`InvoiceMasterID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_journal`
--
DROP TABLE IF EXISTS `v_journal`;

CREATE OR REPLACE VIEW `v_journal`  AS SELECT `journal`.`VHNO` AS `VHNO`, `journal`.`JournalType` AS `JournalType`, `journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `journal`.`SupplierID` AS `SupplierID`, `journal`.`VoucherMstID` AS `VoucherMstID`, `journal`.`PettyMstID` AS `PettyMstID`, `journal`.`InvoiceMasterID` AS `InvoiceMasterID`, `journal`.`Date` AS `Date`, `journal`.`Dr` AS `Dr`, `journal`.`Cr` AS `Cr`, `journal`.`PartyID` AS `PartyID`, `journal`.`Narration` AS `Narration`, `chartofaccount`.`L1` AS `L1`, `chartofaccount`.`L2` AS `L2`, `chartofaccount`.`L3` AS `L3`, `chartofaccount`.`CODE` AS `CODE`, `journal`.`Trace` AS `Trace`, `journal`.`BankReconcile` AS `BankReconcile`, `journal`.`ReconcileDate` AS `ReconcileDate`, `journal`.`JournalID` AS `JournalID`, `chartofaccount`.`Category` AS `Category`, `journal`.`ExpenseMasterID` AS `ExpenseMasterID`, `journal`.`PaymentMasterID` AS `PaymentMasterID`, `journal`.`PurchasePaymentMasterID` AS `PurchasePaymentMasterID` FROM (`chartofaccount` join `journal` on((`chartofaccount`.`ChartOfAccountID` = `journal`.`ChartOfAccountID`))) ORDER BY `journal`.`JournalID` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_journal_report`
--
DROP TABLE IF EXISTS `v_journal_report`;

CREATE OR REPLACE VIEW `v_journal_report`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`Date` AS `Date`, 'INVOICE' AS `INVOICE` FROM `invoice_master`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_partywise_sale`
--
DROP TABLE IF EXISTS `v_partywise_sale`;

CREATE OR REPLACE VIEW `v_partywise_sale`  AS SELECT `invoice_master`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`InvoiceType` AS `InvoiceType`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`DueDate` AS `DueDate`, `invoice_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `invoice_master`.`SupplierID` AS `SupplierID`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_master`.`UserID` AS `UserID`, `invoice_master`.`PaymentMode` AS `PaymentMode`, `invoice_master`.`PaymentDetails` AS `PaymentDetails`, `invoice_master`.`Subject` AS `Subject`, `invoice_master`.`DescriptionNotes` AS `DescriptionNotes`, `invoice_master`.`CustomerNotes` AS `CustomerNotes`, `invoice_master`.`SubTotal` AS `SubTotal`, `invoice_master`.`DiscountPer` AS `DiscountPer`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`DiscountAmount` AS `DiscountAmount`, `invoice_master`.`TaxPer` AS `TaxPer`, `invoice_master`.`Tax` AS `Tax`, `invoice_master`.`Shipping` AS `Shipping`, `invoice_master`.`GrandTotal` AS `GrandTotal`, `invoice_master`.`Paid` AS `Paid`, `invoice_master`.`Balance` AS `Balance` FROM (`invoice_master` join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_party_aging`
--
DROP TABLE IF EXISTS `v_party_aging`;

CREATE OR REPLACE VIEW `v_party_aging`  AS SELECT `invoice_master`.`PartyID` AS `PartyID`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 1 and 7),`invoice_master`.`GrandTotal`,0)) AS `age7Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 8 and 16),`invoice_master`.`GrandTotal`,0)) AS `age15Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 17 and 30),`invoice_master`.`GrandTotal`,0)) AS `age30Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 31 and 60),`invoice_master`.`GrandTotal`,0)) AS `age60Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 61 and 90),`invoice_master`.`GrandTotal`,0)) AS `age90Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) > 90),`invoice_master`.`GrandTotal`,0)) AS `age90plusDays`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) > 0),`invoice_master`.`GrandTotal`,0)) AS `Total`, `party`.`PartyName` AS `PartyName` FROM (`invoice_master` join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`))) WHERE (`invoice_master`.`Paid` = 0) GROUP BY `invoice_master`.`PartyID`, `party`.`PartyName`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_party_balance`
--
DROP TABLE IF EXISTS `v_party_balance`;

CREATE OR REPLACE VIEW `v_party_balance`  AS SELECT `v_journal`.`VHNO` AS `VHNO`, `v_journal`.`JournalType` AS `JournalType`, `v_journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName`, `v_journal`.`SupplierID` AS `SupplierID`, `v_journal`.`VoucherMstID` AS `VoucherMstID`, `v_journal`.`PettyMstID` AS `PettyMstID`, `v_journal`.`InvoiceMasterID` AS `InvoiceMasterID`, `v_journal`.`Date` AS `Date`, `v_journal`.`Dr` AS `Dr`, `v_journal`.`Cr` AS `Cr`, `v_journal`.`PartyID` AS `PartyID`, `v_journal`.`Narration` AS `Narration`, `party`.`PartyName` AS `PartyName` FROM (`v_journal` join `party` on((`v_journal`.`PartyID` = `party`.`PartyID`))) WHERE (`v_journal`.`ChartOfAccountID` = 110400)  ;

-- --------------------------------------------------------

--
-- Structure for view `v_party_montly_balance`
--
DROP TABLE IF EXISTS `v_party_montly_balance`;

CREATE OR REPLACE VIEW `v_party_montly_balance`  AS SELECT date_format(`journal`.`Date`,'%b-%Y') AS `Date`, sum(ifnull(`journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`journal`.`Dr`,0)) - sum(ifnull(`journal`.`Cr`,0))) AS `Balance`, `journal`.`PartyID` AS `PartyID` FROM `journal` WHERE ((`journal`.`ChartOfAccountID` = 110400) AND (`journal`.`PartyID` is not null)) GROUP BY `journal`.`PartyID`, date_format(`journal`.`Date`,'%b-%Y')  ;

-- --------------------------------------------------------

--
-- Structure for view `v_payment`
--
DROP TABLE IF EXISTS `v_payment`;

CREATE OR REPLACE VIEW `v_payment`  AS SELECT `payment_master`.`PaymentMasterID` AS `PaymentMasterID`, `payment_master`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `payment_master`.`PaymentDate` AS `PaymentDate`, `payment_master`.`PaymentAmount` AS `PaymentAmount`, `payment_master`.`PaymentMode` AS `PaymentMode`, `payment_master`.`ChartOfAccountID` AS `ChartOfAccountID`, `payment_master`.`ReferenceNo` AS `ReferenceNo`, `payment_master`.`File` AS `File`, `payment_master`.`Notes` AS `Notes`, `payment_master`.`eDate` AS `eDate`, `party`.`TRN` AS `TRN`, `party`.`Address` AS `Address`, `party`.`Mobile` AS `Mobile`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays` FROM (`payment_master` join `party` on((`payment_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_payment_detail`
--
DROP TABLE IF EXISTS `v_payment_detail`;

CREATE OR REPLACE VIEW `v_payment_detail`  AS SELECT `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `payment_detail`.`PaymentDetailID` AS `PaymentDetailID`, `payment_detail`.`PaymentMasterID` AS `PaymentMasterID`, `payment_detail`.`PaymentDate` AS `PaymentDate`, `payment_detail`.`InvoiceMasterID` AS `InvoiceMasterID`, `payment_detail`.`Payment` AS `Payment`, `payment_detail`.`eDate` AS `eDate` FROM (`payment_detail` join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `payment_detail`.`InvoiceMasterID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_payment_summary`
--
DROP TABLE IF EXISTS `v_payment_summary`;

CREATE OR REPLACE VIEW `v_payment_summary`  AS SELECT `payment_detail`.`InvoiceMasterID` AS `InvoiceMasterID`, sum(`payment_detail`.`Payment`) AS `Paid`, `payment_detail`.`PaymentMasterID` AS `PaymentMasterID` FROM `payment_detail` GROUP BY `payment_detail`.`InvoiceMasterID`, `payment_detail`.`PaymentMasterID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_pettycash_master`
--
DROP TABLE IF EXISTS `v_pettycash_master`;

CREATE OR REPLACE VIEW `v_pettycash_master`  AS SELECT `pettycash_master`.`PettyMstID` AS `PettyMstID`, `pettycash_master`.`PettyVoucher` AS `PettyVoucher`, `chartofaccount`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`CODE` AS `CODE`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `pettycash_master`.`Date` AS `Date`, `pettycash_master`.`Narration` AS `Narration`, `pettycash_master`.`Credit` AS `Credit` FROM (`chartofaccount` join `pettycash_master` on((`chartofaccount`.`ChartOfAccountID` = `pettycash_master`.`ChOfAcc`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_purchase_order_detail`
--
DROP TABLE IF EXISTS `v_purchase_order_detail`;

CREATE OR REPLACE VIEW `v_purchase_order_detail`  AS SELECT `purchase_order_detail`.`PurchaseOrderDetailID` AS `PurchaseOrderDetailID`, `purchase_order_detail`.`PurchaseOrderMasterID` AS `PurchaseOrderMasterID`, `purchase_order_detail`.`Date` AS `Date`, `purchase_order_detail`.`ItemID` AS `ItemID`, `purchase_order_detail`.`Description` AS `Description`, `purchase_order_detail`.`Rate` AS `Rate`, `purchase_order_detail`.`Qty` AS `Qty`, `purchase_order_detail`.`Unit` AS `Unit`, `purchase_order_detail`.`DiscountPer` AS `DiscountPer`, `purchase_order_detail`.`Discount` AS `Discount`, `purchase_order_detail`.`Tax` AS `Tax`, `purchase_order_detail`.`TaxPer` AS `TaxPer`, `purchase_order_detail`.`Amount` AS `Amount`, `purchase_order_detail`.`Remarks` AS `Remarks`, `item`.`ItemName` AS `ItemName` FROM (`purchase_order_detail` join `item` on((`purchase_order_detail`.`ItemID` = `item`.`ItemID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_purchase_order_master`
--
DROP TABLE IF EXISTS `v_purchase_order_master`;

CREATE OR REPLACE VIEW `v_purchase_order_master`  AS SELECT `purchase_order_master`.`PurchaseOrderMasterID` AS `PurchaseOrderMasterID`, `purchase_order_master`.`PON` AS `PON`, `purchase_order_master`.`SupplierID` AS `SupplierID`, `purchase_order_master`.`Date` AS `Date`, `purchase_order_master`.`PONotes` AS `PONotes`, `purchase_order_master`.`UserID` AS `UserID`, `purchase_order_master`.`Subject` AS `Subject`, `supplier`.`SupplierName` AS `SupplierName`, `supplier`.`TRN` AS `TRN`, `supplier`.`Address` AS `Address`, `supplier`.`Mobile` AS `Mobile`, `supplier`.`Phone` AS `Phone`, `supplier`.`Email` AS `Email`, `supplier`.`Website` AS `Website`, `supplier`.`Active` AS `Active`, `supplier`.`InvoiceDueDays` AS `InvoiceDueDays`, `purchase_order_master`.`ReferenceNo` AS `ReferenceNo`, `purchase_order_master`.`Tax` AS `Tax`, `purchase_order_master`.`GrandTotal` AS `GrandTotal`, `purchase_order_master`.`eDate` AS `eDate`, `purchase_order_master`.`DeliveryDate` AS `DeliveryDate`, `purchase_order_master`.`DeliveryNotes` AS `DeliveryNotes`, `purchase_order_master`.`SubTotal` AS `SubTotal`, `purchase_order_master`.`Discount` AS `Discount`, `purchase_order_master`.`DiscountPer` AS `DiscountPer` FROM (`purchase_order_master` join `supplier` on((`purchase_order_master`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_purchase_payment`
--
DROP TABLE IF EXISTS `v_purchase_payment`;

CREATE OR REPLACE VIEW `v_purchase_payment`  AS SELECT `purchasepayment_master`.`PurchasePaymentMasterID` AS `PurchasePaymentMasterID`, `purchasepayment_master`.`SupplierID` AS `SupplierID`, `purchasepayment_master`.`PaymentDate` AS `PaymentDate`, `purchasepayment_master`.`PaymentAmount` AS `PaymentAmount`, `purchasepayment_master`.`PaymentMode` AS `PaymentMode`, `purchasepayment_master`.`ChartOfAccountID` AS `ChartOfAccountID`, `purchasepayment_master`.`ReferenceNo` AS `ReferenceNo`, `purchasepayment_master`.`File` AS `File`, `purchasepayment_master`.`Notes` AS `Notes`, `purchasepayment_master`.`eDate` AS `eDate`, `supplier`.`SupplierName` AS `SupplierName` FROM (`purchasepayment_master` join `supplier` on((`purchasepayment_master`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_purchase_payment_detail`
--
DROP TABLE IF EXISTS `v_purchase_payment_detail`;

CREATE OR REPLACE VIEW `v_purchase_payment_detail`  AS SELECT `purchasepayment_detail`.`PurchasePaymentDetailID` AS `PurchasePaymentDetailID`, `purchasepayment_detail`.`PurchasePaymentMasterID` AS `PurchasePaymentMasterID`, `purchasepayment_detail`.`PaymentDate` AS `PaymentDate`, `purchasepayment_detail`.`InvoiceMasterID` AS `InvoiceMasterID`, `purchasepayment_detail`.`Payment` AS `Payment`, `purchasepayment_detail`.`eDate` AS `eDate`, `invoice_master`.`InvoiceNo` AS `InvoiceNo` FROM (`purchasepayment_detail` join `invoice_master` on((`purchasepayment_detail`.`InvoiceMasterID` = `invoice_master`.`InvoiceMasterID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_purchase_payment_master`
--
DROP TABLE IF EXISTS `v_purchase_payment_master`;

CREATE OR REPLACE VIEW `v_purchase_payment_master`  AS SELECT `purchasepayment_master`.`PurchasePaymentMasterID` AS `PurchasePaymentMasterID`, `purchasepayment_master`.`SupplierID` AS `SupplierID`, `purchasepayment_master`.`PaymentDate` AS `PaymentDate`, `purchasepayment_master`.`PaymentAmount` AS `PaymentAmount`, `purchasepayment_master`.`PaymentMode` AS `PaymentMode`, `purchasepayment_master`.`ChartOfAccountID` AS `ChartOfAccountID`, `purchasepayment_master`.`ReferenceNo` AS `ReferenceNo`, `purchasepayment_master`.`File` AS `File`, `purchasepayment_master`.`Notes` AS `Notes`, `purchasepayment_master`.`eDate` AS `eDate`, `supplier`.`SupplierName` AS `SupplierName`, `supplier`.`Address` AS `Address`, `supplier`.`Phone` AS `Phone`, `supplier`.`Email` AS `Email`, `supplier`.`Active` AS `Active` FROM (`purchasepayment_master` join `supplier` on((`purchasepayment_master`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_receivabledetail`
--
DROP TABLE IF EXISTS `v_receivabledetail`;

CREATE OR REPLACE VIEW `v_receivabledetail`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_detail`.`InvoiceDetailID` AS `InvoiceDetailID`, `invoice_detail`.`ItemID` AS `ItemID`, `invoice_detail`.`Qty` AS `Qty`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`Paid` AS `Paid`, `invoice_master`.`Balance` AS `Balance`, `party`.`PartyName` AS `PartyName`, `party`.`Address` AS `Address`, `party`.`PartyID` AS `PartyID`, `invoice_master`.`SubTotal` AS `SubTotal` FROM ((`invoice_master` join `invoice_detail` on((`invoice_master`.`InvoiceMasterID` = `invoice_detail`.`InvoiceMasterID`))) join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_rev_exp`
--
DROP TABLE IF EXISTS `v_rev_exp`;

CREATE OR REPLACE VIEW `v_rev_exp`  AS SELECT (sum(if((`v_journal`.`Cr` is null),0,`v_journal`.`Cr`)) - sum(if((`v_journal`.`Dr` is null),0,`v_journal`.`Dr`))) AS `Rev`, 0 AS `Exp`, date_format(`v_journal`.`Date`,'%M-%Y') AS `DATE_FORMAT(date,'%M-%Y')`, date_format(`v_journal`.`Date`,'%m-%Y') AS `date_format(``v_journal``.``Date``,'%m-%Y')` FROM `v_journal` WHERE (`v_journal`.`CODE` = 'r') GROUP BY date_format(`v_journal`.`Date`,'%M-%Y'), date_format(`v_journal`.`Date`,'%m-%Y'), `v_journal`.`CODE` union select 0 AS `Rev`,(sum(if((`v_journal`.`Dr` is null),0,`v_journal`.`Dr`)) - sum(if((`v_journal`.`Cr` is null),0,`v_journal`.`Cr`))) AS `Exp`,date_format(`v_journal`.`Date`,'%M-%Y') AS `DATE_FORMAT(date,'%M-%Y')`,date_format(`v_journal`.`Date`,'%m-%Y') AS `date_format(``v_journal``.``Date``,'%m-%Y')` from `v_journal` where (`v_journal`.`CODE` = 'E') group by date_format(`v_journal`.`Date`,'%M-%Y'),date_format(`v_journal`.`Date`,'%m-%Y'),`v_journal`.`CODE`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_rev_exp_chart`
--
DROP TABLE IF EXISTS `v_rev_exp_chart`;

CREATE OR REPLACE VIEW `v_rev_exp_chart`  AS SELECT abs(round(sum(`v_rev_exp`.`Rev`),0)) AS `Rev`, abs(round(sum(`v_rev_exp`.`Exp`),0)) AS `Exp`, `v_rev_exp`.`DATE_FORMAT(date,'%M-%Y')` AS `MonthName` FROM `v_rev_exp` GROUP BY `v_rev_exp`.`DATE_FORMAT(date,'%M-%Y')` ORDER BY `v_rev_exp`.`DATE_FORMAT(date,'%M-%Y')` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_supplier`
--
DROP TABLE IF EXISTS `v_supplier`;

CREATE OR REPLACE VIEW `v_supplier`  AS SELECT `supplier`.`SupplierID` AS `SupplierID`, `supplier`.`SupplierName` AS `SupplierName`, `supplier`.`TRN` AS `TRN`, `supplier`.`Address` AS `Address`, `supplier`.`Mobile` AS `Mobile`, `supplier`.`Phone` AS `Phone`, `supplier`.`Email` AS `Email`, `supplier`.`Website` AS `Website`, `supplier`.`Active` AS `Active`, `supplier`.`InvoiceDueDays` AS `InvoiceDueDays`, `supplier`.`eDate` AS `eDate` FROM `supplier`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_supplier_balance`
--
DROP TABLE IF EXISTS `v_supplier_balance`;

CREATE OR REPLACE VIEW `v_supplier_balance`  AS SELECT `journal`.`SupplierID` AS `SupplierID`, date_format(`journal`.`Date`,'%b-%Y') AS `Date`, sum(if((`journal`.`Dr` is null),0,`journal`.`Dr`)) AS `Dr`, sum(if((`journal`.`Cr` is null),0,`journal`.`Cr`)) AS `Cr`, sum((if((`journal`.`Dr` is null),0,`journal`.`Dr`) - if((`journal`.`Cr` is null),0,`journal`.`Cr`))) AS `Balance` FROM `journal` WHERE (`journal`.`ChartOfAccountID` = 210100) GROUP BY `journal`.`SupplierID`, date_format(`journal`.`Date`,'%b-%Y')  ;

-- --------------------------------------------------------

--
-- Structure for view `v_supplier_outstanding`
--
DROP TABLE IF EXISTS `v_supplier_outstanding`;

CREATE OR REPLACE VIEW `v_supplier_outstanding`  AS SELECT `v_journal`.`InvoiceMasterID` AS `InvoiceMasterID`, `v_journal`.`PartyID` AS `PartyID`, `v_journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`DueDate` AS `DueDate`, sum(ifnull(`v_journal`.`Dr`,0)) AS `PAID`, abs((sum(ifnull(`v_journal`.`Dr`,0)) - sum(ifnull(`v_journal`.`Cr`,0)))) AS `BALANCE`, `v_journal`.`SupplierID` AS `SupplierID`, `invoice_master`.`GrandTotal` AS `GrandTotal` FROM (`v_journal` join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `v_journal`.`InvoiceMasterID`))) WHERE (((`v_journal`.`VHNO` like 'BILL%') OR (`v_journal`.`VHNO` like 'BILLPAY%')) AND (`v_journal`.`ChartOfAccountID` = 210100)) GROUP BY `v_journal`.`InvoiceMasterID`, `v_journal`.`PartyID`, `v_journal`.`ChartOfAccountID`, `v_journal`.`ChartOfAccountName`, `invoice_master`.`InvoiceNo`, `invoice_master`.`Date`, `invoice_master`.`DueDate`, `invoice_master`.`GrandTotal`, `v_journal`.`SupplierID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_supplier_over_balance`
--
DROP TABLE IF EXISTS `v_supplier_over_balance`;

CREATE OR REPLACE VIEW `v_supplier_over_balance`  AS SELECT `v_supplier_outstanding`.`SupplierID` AS `SupplierID`, sum(`v_supplier_outstanding`.`BALANCE`) AS `BALANCE` FROM `v_supplier_outstanding` GROUP BY `v_supplier_outstanding`.`SupplierID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_trial`
--
DROP TABLE IF EXISTS `v_trial`;

CREATE OR REPLACE VIEW `v_trial`  AS SELECT `v_journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName`, sum(ifnull(`v_journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`v_journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`v_journal`.`Dr`,0)) - sum(ifnull(`v_journal`.`Cr`,0))) AS `Balance` FROM `v_journal` GROUP BY `v_journal`.`ChartOfAccountID`, `v_journal`.`ChartOfAccountName` ORDER BY `v_journal`.`ChartOfAccountName` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_trialreport`
--
DROP TABLE IF EXISTS `v_trialreport`;

CREATE OR REPLACE VIEW `v_trialreport`  AS SELECT `v_journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName`, sum(ifnull(`v_journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`v_journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`v_journal`.`Dr`,0)) - sum(ifnull(`v_journal`.`Cr`,0))) AS `Balance` FROM `v_journal` GROUP BY `v_journal`.`ChartOfAccountID`, `v_journal`.`ChartOfAccountName` ORDER BY `v_journal`.`ChartOfAccountName` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_trial_balance`
--
DROP TABLE IF EXISTS `v_trial_balance`;

CREATE OR REPLACE VIEW `v_trial_balance`  AS SELECT `v_trial`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_trial`.`ChartOfAccountName` AS `ChartOfAccountName`, if((`v_trial`.`Balance` >= 0),`v_trial`.`Balance`,0) AS `Dr`, if((`v_trial`.`Balance` < 0),abs(`v_trial`.`Balance`),0) AS `Cr` FROM `v_trial`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_voucher`
--
DROP TABLE IF EXISTS `v_voucher`;

CREATE OR REPLACE VIEW `v_voucher`  AS SELECT `voucher_master`.`VoucherMstID` AS `VoucherMstID`, `voucher_type`.`VoucherCode` AS `VoucherCode`, `voucher_type`.`VoucherTypeName` AS `VoucherTypeName`, `voucher_master`.`Voucher` AS `Voucher`, `voucher_master`.`Date` AS `Date`, `voucher_master`.`Narration` AS `Narration`, `v_voucher_amount`.`Amount` AS `Amount` FROM ((`voucher_master` join `voucher_type` on((`voucher_master`.`VoucherCodeID` = `voucher_type`.`VoucherTypeID`))) join `v_voucher_amount` on((`voucher_master`.`VoucherMstID` = `v_voucher_amount`.`VoucherMstID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_voucher_amount`
--
DROP TABLE IF EXISTS `v_voucher_amount`;

CREATE OR REPLACE VIEW `v_voucher_amount`  AS SELECT (case when (left(`voucher_detail`.`Voucher`,2) = 'BR') then sum(`voucher_detail`.`Debit`) when (left(`voucher_detail`.`Voucher`,2) = 'CR') then sum(`voucher_detail`.`Debit`) when (left(`voucher_detail`.`Voucher`,2) = 'BP') then sum(`voucher_detail`.`Credit`) when (left(`voucher_detail`.`Voucher`,2) = 'CP') then sum(`voucher_detail`.`Credit`) else sum(`voucher_detail`.`Debit`) end) AS `Amount`, `voucher_detail`.`VoucherMstID` AS `VoucherMstID`, `voucher_detail`.`Voucher` AS `Voucher` FROM `voucher_detail` GROUP BY `voucher_detail`.`VoucherMstID`, `voucher_detail`.`Voucher`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_voucher_detail`
--
DROP TABLE IF EXISTS `v_voucher_detail`;

CREATE OR REPLACE VIEW `v_voucher_detail`  AS SELECT `voucher_master`.`VoucherMstID` AS `VoucherMstID`, `voucher_master`.`VoucherCodeID` AS `VoucherCodeID`, `voucher_master`.`Voucher` AS `Voucher`, `voucher_master`.`Narration` AS `NarrationMaster`, `voucher_detail`.`Date` AS `Date`, `voucher_detail`.`ChOfAcc` AS `ChOfAcc`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `voucher_detail`.`Debit` AS `Debit`, `voucher_detail`.`Credit` AS `Credit`, `voucher_detail`.`InvoiceNo` AS `InvoiceNo`, `voucher_detail`.`Narration` AS `Narration`, `voucher_detail`.`SupplierID` AS `SupplierID`, `voucher_detail`.`PartyID` AS `PartyID`, `voucher_detail`.`RefNo` AS `RefNo`, `party`.`PartyName` AS `PartyName`, `supplier`.`SupplierName` AS `SupplierName` FROM ((((`voucher_detail` join `voucher_master` on((`voucher_master`.`VoucherMstID` = `voucher_detail`.`VoucherMstID`))) join `chartofaccount` on((`chartofaccount`.`ChartOfAccountID` = `voucher_detail`.`ChOfAcc`))) left join `party` on((`voucher_detail`.`PartyID` = `party`.`PartyID`))) left join `supplier` on((`voucher_detail`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_voucher_master`
--
DROP TABLE IF EXISTS `v_voucher_master`;

CREATE OR REPLACE VIEW `v_voucher_master`  AS SELECT `voucher_master`.`VoucherMstID` AS `VoucherMstID`, `voucher_master`.`VoucherCodeID` AS `VoucherCodeID`, `voucher_master`.`Voucher` AS `Voucher`, `voucher_master`.`Date` AS `Date`, `voucher_master`.`Narration` AS `Narration`, `voucher_type`.`VoucherTypeID` AS `VoucherTypeID`, `voucher_type`.`VoucherCode` AS `VoucherCode`, `voucher_type`.`VoucherTypeName` AS `VoucherTypeName`, `voucher_detail`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `voucher_detail`.`Debit` AS `Debit`, `voucher_detail`.`Credit` AS `Credit`, `voucher_detail`.`SupplierID` AS `SupplierID`, `supplier`.`SupplierName` AS `SupplierName` FROM ((((`voucher_master` join `voucher_type` on((`voucher_master`.`VoucherCodeID` = `voucher_type`.`VoucherTypeID`))) join `voucher_detail` on((`voucher_master`.`VoucherMstID` = `voucher_detail`.`VoucherMstID`))) left join `party` on((`voucher_detail`.`PartyID` = `party`.`PartyID`))) left join `supplier` on((`voucher_detail`.`SupplierID` = `supplier`.`SupplierID`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airline`
--
ALTER TABLE `airline`
  ADD PRIMARY KEY (`AirLineID`);

--
-- Indexes for table `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`AttachmentID`);

--
-- Indexes for table `challan_detail`
--
ALTER TABLE `challan_detail`
  ADD PRIMARY KEY (`ChallanDetailID`);

--
-- Indexes for table `challan_master`
--
ALTER TABLE `challan_master`
  ADD PRIMARY KEY (`ChallanMasterID`);

--
-- Indexes for table `challan_type`
--
ALTER TABLE `challan_type`
  ADD PRIMARY KEY (`ChallanTypeID`);

--
-- Indexes for table `chartofaccount`
--
ALTER TABLE `chartofaccount`
  ADD PRIMARY KEY (`ChartOfAccountID`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`CompanyID`);

--
-- Indexes for table `estimate_detail`
--
ALTER TABLE `estimate_detail`
  ADD PRIMARY KEY (`EstimateDetailID`);

--
-- Indexes for table `estimate_master`
--
ALTER TABLE `estimate_master`
  ADD PRIMARY KEY (`EstimateMasterID`);

--
-- Indexes for table `estimate_type`
--
ALTER TABLE `estimate_type`
  ADD PRIMARY KEY (`EstimateTypeID`);

--
-- Indexes for table `expense_detail`
--
ALTER TABLE `expense_detail`
  ADD PRIMARY KEY (`ExpenseDetailID`);

--
-- Indexes for table `expense_master`
--
ALTER TABLE `expense_master`
  ADD PRIMARY KEY (`ExpenseMasterID`);

--
-- Indexes for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`InvoiceDetailID`);

--
-- Indexes for table `invoice_master`
--
ALTER TABLE `invoice_master`
  ADD PRIMARY KEY (`InvoiceMasterID`),
  ADD KEY `InvoiceTypeID` (`InvoiceNo`),
  ADD KEY `invoice_master_ibfk_2` (`PartyID`);

--
-- Indexes for table `invoice_type`
--
ALTER TABLE `invoice_type`
  ADD PRIMARY KEY (`InvoiceTypeID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ItemID`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`ItemCategoryID`);

--
-- Indexes for table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`JournalID`),
  ADD KEY `VoucherMstID` (`VoucherMstID`),
  ADD KEY `PettyMstID` (`PettyMstID`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `party`
--
ALTER TABLE `party`
  ADD PRIMARY KEY (`PartyID`);

--
-- Indexes for table `payment_detail`
--
ALTER TABLE `payment_detail`
  ADD PRIMARY KEY (`PaymentDetailID`);

--
-- Indexes for table `payment_master`
--
ALTER TABLE `payment_master`
  ADD PRIMARY KEY (`PaymentMasterID`);

--
-- Indexes for table `payment_mode`
--
ALTER TABLE `payment_mode`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pettycash_detail`
--
ALTER TABLE `pettycash_detail`
  ADD PRIMARY KEY (`PettyDetID`),
  ADD KEY `PettyMstID` (`PettyMstID`);

--
-- Indexes for table `pettycash_master`
--
ALTER TABLE `pettycash_master`
  ADD PRIMARY KEY (`PettyMstID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchasepayment_detail`
--
ALTER TABLE `purchasepayment_detail`
  ADD PRIMARY KEY (`PurchasePaymentDetailID`);

--
-- Indexes for table `purchasepayment_master`
--
ALTER TABLE `purchasepayment_master`
  ADD PRIMARY KEY (`PurchasePaymentMasterID`);

--
-- Indexes for table `purchase_order_detail`
--
ALTER TABLE `purchase_order_detail`
  ADD PRIMARY KEY (`PurchaseOrderDetailID`);

--
-- Indexes for table `purchase_order_master`
--
ALTER TABLE `purchase_order_master`
  ADD PRIMARY KEY (`PurchaseOrderMasterID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RoleID`);

--
-- Indexes for table `runtotaltestdata`
--
ALTER TABLE `runtotaltestdata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`);

--
-- Indexes for table `supplier_category`
--
ALTER TABLE `supplier_category`
  ADD PRIMARY KEY (`SupplierCatID`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`TaxID`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`UnitID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`RoleId`);

--
-- Indexes for table `voucher_detail`
--
ALTER TABLE `voucher_detail`
  ADD PRIMARY KEY (`VoucherDetID`),
  ADD KEY `VoucherMstID` (`VoucherMstID`);

--
-- Indexes for table `voucher_master`
--
ALTER TABLE `voucher_master`
  ADD PRIMARY KEY (`VoucherMstID`);

--
-- Indexes for table `voucher_type`
--
ALTER TABLE `voucher_type`
  ADD PRIMARY KEY (`VoucherTypeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airline`
--
ALTER TABLE `airline`
  MODIFY `AirLineID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attachment`
--
ALTER TABLE `attachment`
  MODIFY `AttachmentID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `challan_detail`
--
ALTER TABLE `challan_detail`
  MODIFY `ChallanDetailID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `challan_master`
--
ALTER TABLE `challan_master`
  MODIFY `ChallanMasterID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `challan_type`
--
ALTER TABLE `challan_type`
  MODIFY `ChallanTypeID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `CompanyID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `estimate_detail`
--
ALTER TABLE `estimate_detail`
  MODIFY `EstimateDetailID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `estimate_master`
--
ALTER TABLE `estimate_master`
  MODIFY `EstimateMasterID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `estimate_type`
--
ALTER TABLE `estimate_type`
  MODIFY `EstimateTypeID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expense_detail`
--
ALTER TABLE `expense_detail`
  MODIFY `ExpenseDetailID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_master`
--
ALTER TABLE `expense_master`
  MODIFY `ExpenseMasterID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  MODIFY `InvoiceDetailID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `invoice_master`
--
ALTER TABLE `invoice_master`
  MODIFY `InvoiceMasterID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `invoice_type`
--
ALTER TABLE `invoice_type`
  MODIFY `InvoiceTypeID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `ItemID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `ItemCategoryID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `journal`
--
ALTER TABLE `journal`
  MODIFY `JournalID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `party`
--
ALTER TABLE `party`
  MODIFY `PartyID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2217;

--
-- AUTO_INCREMENT for table `payment_detail`
--
ALTER TABLE `payment_detail`
  MODIFY `PaymentDetailID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_master`
--
ALTER TABLE `payment_master`
  MODIFY `PaymentMasterID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_mode`
--
ALTER TABLE `payment_mode`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pettycash_detail`
--
ALTER TABLE `pettycash_detail`
  MODIFY `PettyDetID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pettycash_master`
--
ALTER TABLE `pettycash_master`
  MODIFY `PettyMstID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `purchasepayment_detail`
--
ALTER TABLE `purchasepayment_detail`
  MODIFY `PurchasePaymentDetailID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchasepayment_master`
--
ALTER TABLE `purchasepayment_master`
  MODIFY `PurchasePaymentMasterID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_detail`
--
ALTER TABLE `purchase_order_detail`
  MODIFY `PurchaseOrderDetailID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_master`
--
ALTER TABLE `purchase_order_master`
  MODIFY `PurchaseOrderMasterID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `RoleID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `runtotaltestdata`
--
ALTER TABLE `runtotaltestdata`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `SupplierID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2220;

--
-- AUTO_INCREMENT for table `supplier_category`
--
ALTER TABLE `supplier_category`
  MODIFY `SupplierCatID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `TaxID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `UnitID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `RoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4386;

--
-- AUTO_INCREMENT for table `voucher_detail`
--
ALTER TABLE `voucher_detail`
  MODIFY `VoucherDetID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voucher_master`
--
ALTER TABLE `voucher_master`
  MODIFY `VoucherMstID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=444;

--
-- AUTO_INCREMENT for table `voucher_type`
--
ALTER TABLE `voucher_type`
  MODIFY `VoucherTypeID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `journal`
--
ALTER TABLE `journal`
  ADD CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`VoucherMstID`) REFERENCES `voucher_master` (`VoucherMstID`) ON DELETE CASCADE,
  ADD CONSTRAINT `journal_ibfk_11` FOREIGN KEY (`VoucherMstID`) REFERENCES `voucher_master` (`VoucherMstID`) ON DELETE CASCADE,
  ADD CONSTRAINT `journal_ibfk_2` FOREIGN KEY (`PettyMstID`) REFERENCES `pettycash_master` (`PettyMstID`) ON DELETE CASCADE,
  ADD CONSTRAINT `journal_ibfk_21` FOREIGN KEY (`PettyMstID`) REFERENCES `pettycash_master` (`PettyMstID`) ON DELETE CASCADE;

--
-- Constraints for table `pettycash_detail`
--
ALTER TABLE `pettycash_detail`
  ADD CONSTRAINT `pettycash_detail_ibfk_1` FOREIGN KEY (`PettyMstID`) REFERENCES `pettycash_master` (`PettyMstID`) ON DELETE CASCADE,
  ADD CONSTRAINT `pettycash_detail_ibfk_11` FOREIGN KEY (`PettyMstID`) REFERENCES `pettycash_master` (`PettyMstID`) ON DELETE CASCADE;

--
-- Constraints for table `voucher_detail`
--
ALTER TABLE `voucher_detail`
  ADD CONSTRAINT `voucher_detail_ibfk_1` FOREIGN KEY (`VoucherMstID`) REFERENCES `voucher_master` (`VoucherMstID`) ON DELETE CASCADE,
  ADD CONSTRAINT `voucher_detail_ibfk_11` FOREIGN KEY (`VoucherMstID`) REFERENCES `voucher_master` (`VoucherMstID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
