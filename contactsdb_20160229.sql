-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 29, 2016 at 11:35 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `contactsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_3`
--

CREATE TABLE `address_3` (
  `ADDRESS_ID` varchar(8) NOT NULL,
  `LINK_ID` int(11) NOT NULL,
  `ADDRESS1` varchar(50) NOT NULL,
  `ADDRESS2` varchar(50) NOT NULL,
  `CITY` varchar(50) NOT NULL,
  `PROVINCE_OR_STATE` varchar(50) NOT NULL,
  `COUNTRY` varchar(50) NOT NULL,
  `ADDRESSTYPE` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 - UNKNOWN\n1 - HOME\n2 - WORK\n3 - COTTAGE/VACATION HOME\n4 - OTHERS'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `board_member_2`
--

CREATE TABLE `board_member_2` (
  `B_M_ID` varchar(8) NOT NULL,
  `LINK_ID` int(11) NOT NULL,
  `LASTNAME` varchar(50) NOT NULL,
  `FIRSTNAME` varchar(50) NOT NULL,
  `D_O_BIRTH` datetime DEFAULT NULL,
  `OCCUPATION` varchar(50) DEFAULT NULL,
  `START_DATE` datetime(6) NOT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `COMMENTS` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_2`
--

CREATE TABLE `client_2` (
  `CLIENT_ID` varchar(8) NOT NULL,
  `LINK_ID` int(11) NOT NULL,
  `FIRSTNAME` varchar(50) NOT NULL,
  `LASTNAME` varchar(50) NOT NULL,
  `CLIENT_ORG_NAME` varchar(100) DEFAULT NULL,
  `REFERRAL` varchar(50) DEFAULT NULL,
  `AGE_RANGE` varchar(20) DEFAULT NULL,
  `STATUS_IN_COUNTRY` varchar(30) DEFAULT NULL,
  `COUNTRY_OF_BIRTH` varchar(50) DEFAULT NULL,
  `LANGUAGE_SPOKEN` varchar(100) DEFAULT NULL,
  `SOURCE_OF_INCOME` varchar(150) DEFAULT NULL,
  `COMMENTS` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `communication_3`
--

CREATE TABLE `communication_3` (
  `COMMUNICATION_ID` varchar(8) NOT NULL,
  `LINK_ID` int(11) NOT NULL,
  `PHONENUMBER` varchar(15) DEFAULT NULL,
  `PHONETYPE` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 - UNKNOWN\n1 - HOME\n2 - WORK\n3 - MOBILE\n4 - OTHERS',
  `EMAILID` varchar(40) DEFAULT NULL,
  `EMAILTYPE` tinyint(3) UNSIGNED DEFAULT '0' COMMENT '0 - UNKNOWN\n1 - PERSONAL\n2 - WORK\n3 - GROUP\n4 - OTHERS',
  `FAXNUMBER` varchar(40) DEFAULT NULL,
  `SKYPE_ID` varchar(45) DEFAULT NULL,
  `EMERGENCYCONTACTPERSON` varchar(50) DEFAULT NULL,
  `EMERGENCYCONTACTRELATIONSHIP` varchar(50) DEFAULT NULL,
  `EMERGENCYCONTACTNUMBER` varchar(15) DEFAULT NULL,
  `EMERGENCYCONTACTEMAIL` varchar(40) DEFAULT NULL,
  `PHOTO_FILE_LINK` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact_master_1`
--

CREATE TABLE `contact_master_1` (
  `LINK_ID` int(11) NOT NULL,
  `CONTACT_TYPE_ID` int(3) NOT NULL,
  `CONTACT_PRIVACY` tinyint(1) NOT NULL,
  `CONTACT_DELETED` tinyint(1) NOT NULL DEFAULT '0',
  `CONTACT_DELETED_DT_TM` datetime(6) DEFAULT NULL,
  `CONTACT_CREATED_DT_TM` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_master_1`
--

INSERT INTO `contact_master_1` (`LINK_ID`, `CONTACT_TYPE_ID`, `CONTACT_PRIVACY`, `CONTACT_DELETED`, `CONTACT_DELETED_DT_TM`, `CONTACT_CREATED_DT_TM`) VALUES
(1, 3, 1, 0, NULL, '2016-02-29 13:05:23');

-- --------------------------------------------------------

--
-- Table structure for table `contact_type_1p`
--

CREATE TABLE `contact_type_1p` (
  `CONTACT_TYPE_ID` int(3) NOT NULL,
  `CONTACT_TYPE_DETAIL` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_type_1p`
--

INSERT INTO `contact_type_1p` (`CONTACT_TYPE_ID`, `CONTACT_TYPE_DETAIL`) VALUES
(1, 'Board Member'),
(2, 'Client'),
(3, 'Employee'),
(4, 'Funder'),
(5, 'Member'),
(6, 'Non-Categorized'),
(7, 'Organization'),
(8, 'Partner'),
(9, 'Personal'),
(10, 'Supplier'),
(11, 'Visitor'),
(12, 'Volunteer');

-- --------------------------------------------------------

--
-- Table structure for table `employee_2`
--

CREATE TABLE `employee_2` (
  `EMP_ID` varchar(8) NOT NULL,
  `LINK_ID` int(11) NOT NULL,
  `LASTNAME` varchar(50) NOT NULL,
  `FIRSTNAME` varchar(50) NOT NULL,
  `D_O_BIRTH` datetime(6) DEFAULT NULL,
  `JOBTITLE_ID` varchar(8) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `COMMENTS` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_2`
--

INSERT INTO `employee_2` (`EMP_ID`, `LINK_ID`, `LASTNAME`, `FIRSTNAME`, `D_O_BIRTH`, `JOBTITLE_ID`, `START_DATE`, `END_DATE`, `COMMENTS`) VALUES
('1', 1, 'Tomy', 'Gilson', '1992-04-14 00:00:00.000000', '1', '2014-12-10', '0000-00-00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_training_3`
--

CREATE TABLE `employee_training_3` (
  `EMP_TRG_ID` varchar(8) NOT NULL,
  `EMP_ID` varchar(8) NOT NULL,
  `EMPTRNG_STARTDATE` datetime(6) DEFAULT NULL,
  `EMPTRNG_ENDDATE` datetime(6) DEFAULT NULL,
  `EMPTRNG_BUDGET` decimal(18,2) DEFAULT NULL,
  `EMPEVALUATIONDATE` datetime(6) DEFAULT NULL,
  `EMPEVALUATIONRESULT` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `funder_2`
--

CREATE TABLE `funder_2` (
  `FUND_ID` varchar(8) NOT NULL,
  `LINK_ID` int(11) NOT NULL,
  `ORGANIZATION_NAME` varchar(50) DEFAULT NULL,
  `CONTACT_PERSON` varchar(50) NOT NULL,
  `COMMENTS` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `funder_3`
--

CREATE TABLE `funder_3` (
  `FUND_3_ID` varchar(8) NOT NULL,
  `FUND_ID` varchar(8) NOT NULL,
  `FISCAL_YEAR` varchar(15) DEFAULT NULL,
  `BUDGET_ALLOCATED` decimal(19,4) DEFAULT NULL,
  `FUNDS_DEPOSIT` decimal(19,4) DEFAULT NULL,
  `PERIOD_USE` varchar(50) DEFAULT NULL,
  `TIMING_OF_REPORTS` varchar(50) DEFAULT NULL,
  `CLOSING_DATE` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_1p`
--

CREATE TABLE `job_1p` (
  `JOB_ID` varchar(8) NOT NULL,
  `JOB_TITLE` varchar(50) NOT NULL,
  `NUMBER_OF_POSITIONS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `member_2`
--

CREATE TABLE `member_2` (
  `MEM_ID` varchar(8) NOT NULL,
  `LINK_ID` int(11) NOT NULL,
  `FIRSTNAME` varchar(50) NOT NULL,
  `LASTNAME` varchar(50) NOT NULL,
  `DATE_OF_REGISTRATION` datetime NOT NULL,
  `ANNUAL_FEE` decimal(19,4) DEFAULT NULL,
  `HOW_TO_CONTACT` varchar(70) DEFAULT NULL,
  `DATE_OF_CLOSURE` datetime(6) DEFAULT NULL,
  `COMMENTS` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `noncategorized_2`
--

CREATE TABLE `noncategorized_2` (
  `NC_ID` varchar(8) CHARACTER SET latin1 NOT NULL,
  `LINK_ID` int(11) NOT NULL,
  `LASTNAME` varchar(50) CHARACTER SET latin1 NOT NULL,
  `FIRSTNAME` varchar(50) CHARACTER SET latin1 NOT NULL,
  `D_O_BIRTH` datetime(6) DEFAULT NULL,
  `COMMENTS` varchar(300) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `organization_2`
--

CREATE TABLE `organization_2` (
  `ORG_ID` varchar(8) NOT NULL,
  `LINK_ID` int(11) NOT NULL,
  `ORG_NAME` char(10) NOT NULL,
  `EMP_NAME` varchar(50) DEFAULT NULL,
  `TITLE_OR_POSITION` varchar(50) DEFAULT NULL,
  `COMMENTS` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `partner_2`
--

CREATE TABLE `partner_2` (
  `P_ID` varchar(8) NOT NULL,
  `LINK_ID` int(11) NOT NULL,
  `ORGANIZATION_NAME` varchar(50) NOT NULL,
  `NAME_OF_CONTACT` varchar(40) NOT NULL,
  `LANGUAGE` varchar(12) DEFAULT NULL,
  `FUNCTION_DET` varchar(20) DEFAULT NULL,
  `WEBSITE` varchar(30) DEFAULT NULL,
  `COMMENTS` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permissions_2p`
--

CREATE TABLE `permissions_2p` (
  `PERMISSION_ID` int(11) NOT NULL,
  `CATEGORY_ID` char(2) NOT NULL,
  `CONTACT_TYPE_ID` int(3) NOT NULL,
  `PERMISSIONS` set('ADD','UPDATE','VIEW','DELETE','AC-LOCK','ADMIN') NOT NULL DEFAULT 'VIEW'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `personal_2`
--

CREATE TABLE `personal_2` (
  `PERS_ID` varchar(8) CHARACTER SET latin1 NOT NULL,
  `LINK_ID` int(11) NOT NULL,
  `LASTNAME` varchar(50) CHARACTER SET latin1 NOT NULL,
  `FIRSTNAME` varchar(50) CHARACTER SET latin1 NOT NULL,
  `D_O_BIRTH` datetime(6) DEFAULT NULL,
  `COMMENTS` varchar(300) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `program_1p`
--

CREATE TABLE `program_1p` (
  `PROGRAM_ID` varchar(8) NOT NULL,
  `PROGRAM_NAME` varchar(50) NOT NULL,
  `START_DT` datetime DEFAULT NULL,
  `END_DT` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `province_country_1p`
--

CREATE TABLE `province_country_1p` (
  `P_C_ID` int(11) UNSIGNED NOT NULL,
  `PROVINCE_OR_STATE` varchar(50) NOT NULL,
  `COUNTRY` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `province_country_1p`
--

INSERT INTO `province_country_1p` (`P_C_ID`, `PROVINCE_OR_STATE`, `COUNTRY`) VALUES
(1, 'PE', 'CANADA'),
(2, 'ON', 'CANADA'),
(3, 'NS', 'CANADA'),
(4, 'NB', 'CANADA');

-- --------------------------------------------------------

--
-- Table structure for table `question_master_1p`
--

CREATE TABLE `question_master_1p` (
  `Q_ID` tinyint(3) UNSIGNED NOT NULL,
  `QUESTION_TEXT` varchar(50) NOT NULL,
  `QUESTION_STATUS` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_2`
--

CREATE TABLE `supplier_2` (
  `SUP_ID` varchar(8) NOT NULL,
  `LINK_ID` int(11) NOT NULL,
  `SUPPLIER_NAME` varchar(50) NOT NULL,
  `SERVICES_PROVIDED` varchar(1000) NOT NULL,
  `CONTACT_PERSON` varchar(50) NOT NULL,
  `TERM_OF_PAYMENT` varchar(1000) DEFAULT NULL,
  `COMMENTS` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tasks_1p`
--

CREATE TABLE `tasks_1p` (
  `TASK_ID` varchar(8) NOT NULL,
  `TASK_NAME` varchar(50) NOT NULL,
  `EMPLOYEES_AFFECTED` varchar(8) DEFAULT NULL,
  `INDIRECT_TASKS` varchar(50) DEFAULT NULL,
  `DIRECT_TASKS` varchar(50) DEFAULT NULL,
  `START_DT` date DEFAULT NULL,
  `END_DT` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_account_3`
--

CREATE TABLE `user_account_3` (
  `EMP_ID` varchar(8) NOT NULL,
  `USERNAME` varchar(16) NOT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  `USER_CATEGORY` char(2) DEFAULT NULL,
  `Q_ID1` tinyint(3) UNSIGNED NOT NULL,
  `SEC_ANS_1` varchar(200) NOT NULL,
  `Q_ID2` tinyint(3) UNSIGNED NOT NULL,
  `SEC_ANS_2` varchar(200) NOT NULL,
  `Q_ID3` tinyint(3) UNSIGNED NOT NULL,
  `SEC_ANS_3` varchar(200) NOT NULL,
  `PWD_FAILED_ATTEMPTS` tinyint(3) UNSIGNED NOT NULL,
  `ACCOUNT_LOCKED` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_account_3`
--

INSERT INTO `user_account_3` (`EMP_ID`, `USERNAME`, `PASSWORD`, `USER_CATEGORY`, `Q_ID1`, `SEC_ANS_1`, `Q_ID2`, `SEC_ANS_2`, `Q_ID3`, `SEC_ANS_3`, `PWD_FAILED_ATTEMPTS`, `ACCOUNT_LOCKED`) VALUES
('1', 'gilson', '6de4d287d91db4409ae887ad0f464d8fa3a4231aad2f5e028358041c433734b0', '3', 1, 'gilson', 2, 'tomy', 3, 'software engineer', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_audit_4`
--

CREATE TABLE `user_audit_4` (
  `AUDIT_ID` char(10) NOT NULL,
  `USERNAME` varchar(16) NOT NULL,
  `LINK_ID_CHANGED` int(11) NOT NULL,
  `CHANGE_DT_TM` datetime(6) NOT NULL,
  `CHANGE_DETAILS` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_log_4`
--

CREATE TABLE `user_log_4` (
  `USER_LOG_ID` varchar(10) NOT NULL,
  `USERNAME` varchar(16) NOT NULL,
  `LOGIN_TIME` datetime NOT NULL,
  `LOGOUT_TIME` datetime DEFAULT NULL,
  `IP_ADDR` varchar(50) NOT NULL,
  `BROWSER` varchar(50) DEFAULT NULL,
  `SYSTEM_DETAILS` varchar(50) DEFAULT NULL,
  `DETAILS_UNAME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_3`
--

CREATE TABLE `visitor_3` (
  `VISITOR_ID` varchar(8) NOT NULL,
  `VISITOR_CONTACT_ID` int(11) NOT NULL,
  `VISITOR_NAME` varchar(100) NOT NULL,
  `PHONENUMBER` varchar(15) NOT NULL,
  `EMAILID` varchar(40) NOT NULL,
  `USERNAME` varchar(16) NOT NULL,
  `RECORD_IP` varchar(50) NOT NULL,
  `WHOM_TO_MEET_ID` varchar(8) NOT NULL,
  `WHOM_TO_MEET` varchar(100) NOT NULL,
  `VISITOR_ARR_TIME` datetime NOT NULL,
  `VISITOR_DEP_TIME` datetime(6) DEFAULT NULL,
  `PURPOSE_OF_VISIT` varchar(50) NOT NULL,
  `COMMENTS` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `volunteer_2`
--

CREATE TABLE `volunteer_2` (
  `VOLUNTEER_ID` varchar(8) NOT NULL,
  `LINK_ID` int(11) NOT NULL,
  `FIRSTNAME` varchar(50) NOT NULL,
  `LASTNAME` varchar(50) NOT NULL,
  `AGE` int(11) DEFAULT NULL,
  `LEVEL_OF_STUDY` varchar(50) DEFAULT NULL,
  `SKILLS` varchar(400) DEFAULT NULL,
  `VOLUNTEER_EXP` varchar(300) DEFAULT NULL,
  `TRAINING_DETAILS` varchar(200) DEFAULT NULL,
  `AVAILABILITY_COMMENTS` varchar(100) DEFAULT NULL,
  `VOLUNTEER_DURATION` varchar(100) DEFAULT NULL,
  `COMMENTS` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_3`
--
ALTER TABLE `address_3`
  ADD PRIMARY KEY (`ADDRESS_ID`),
  ADD KEY `FK_ADDRESS_3_CONTACT_MASTER_1` (`LINK_ID`),
  ADD KEY `FK_ADDRESS_3_PROVINCE_COUNTRY_1P` (`PROVINCE_OR_STATE`);

--
-- Indexes for table `board_member_2`
--
ALTER TABLE `board_member_2`
  ADD PRIMARY KEY (`B_M_ID`),
  ADD KEY `FK_BOARD_MEMBER_2_CONTACT_MASTER_1` (`LINK_ID`);

--
-- Indexes for table `client_2`
--
ALTER TABLE `client_2`
  ADD PRIMARY KEY (`CLIENT_ID`),
  ADD KEY `FK_CLIENT_2_CONTACT_MASTER_1` (`LINK_ID`);

--
-- Indexes for table `communication_3`
--
ALTER TABLE `communication_3`
  ADD PRIMARY KEY (`COMMUNICATION_ID`),
  ADD KEY `FK_CONTACT_3_CONTACT_MASTER_1` (`LINK_ID`);

--
-- Indexes for table `contact_master_1`
--
ALTER TABLE `contact_master_1`
  ADD PRIMARY KEY (`LINK_ID`),
  ADD KEY `FK_CONTACT_TYPE_ID_idx` (`CONTACT_TYPE_ID`);

--
-- Indexes for table `contact_type_1p`
--
ALTER TABLE `contact_type_1p`
  ADD PRIMARY KEY (`CONTACT_TYPE_ID`);

--
-- Indexes for table `employee_2`
--
ALTER TABLE `employee_2`
  ADD PRIMARY KEY (`EMP_ID`),
  ADD KEY `FK_EMPLOYEE_2_CONTACT_MASTER_1` (`LINK_ID`);

--
-- Indexes for table `employee_training_3`
--
ALTER TABLE `employee_training_3`
  ADD PRIMARY KEY (`EMP_TRG_ID`),
  ADD KEY `FK_EMPLOYEE_TRAINING_3_EMPLOYEE_2` (`EMP_ID`);

--
-- Indexes for table `funder_2`
--
ALTER TABLE `funder_2`
  ADD PRIMARY KEY (`FUND_ID`),
  ADD KEY `FK_FUNDER_2_CONTACT_MASTER_1` (`LINK_ID`);

--
-- Indexes for table `funder_3`
--
ALTER TABLE `funder_3`
  ADD PRIMARY KEY (`FUND_3_ID`),
  ADD KEY `FK_FUNDER_3_FUNDER_2` (`FUND_ID`);

--
-- Indexes for table `job_1p`
--
ALTER TABLE `job_1p`
  ADD PRIMARY KEY (`JOB_ID`);

--
-- Indexes for table `member_2`
--
ALTER TABLE `member_2`
  ADD PRIMARY KEY (`MEM_ID`),
  ADD KEY `FK_MEMBER_2_CONTACT_MASTER_1` (`LINK_ID`);

--
-- Indexes for table `noncategorized_2`
--
ALTER TABLE `noncategorized_2`
  ADD PRIMARY KEY (`NC_ID`),
  ADD KEY `FK_CONTACT_MASTER_LINK_ID_idx` (`LINK_ID`);

--
-- Indexes for table `organization_2`
--
ALTER TABLE `organization_2`
  ADD PRIMARY KEY (`ORG_ID`),
  ADD KEY `FK_ORGANIZATION_2_CONTACT_MASTER_1` (`LINK_ID`);

--
-- Indexes for table `partner_2`
--
ALTER TABLE `partner_2`
  ADD PRIMARY KEY (`P_ID`),
  ADD KEY `FK_PARTNER_2_CONTACT_MASTER_1` (`LINK_ID`);

--
-- Indexes for table `permissions_2p`
--
ALTER TABLE `permissions_2p`
  ADD PRIMARY KEY (`PERMISSION_ID`),
  ADD KEY `FK_CONTACT_TPE_ID_PERM_idx` (`CONTACT_TYPE_ID`);

--
-- Indexes for table `personal_2`
--
ALTER TABLE `personal_2`
  ADD PRIMARY KEY (`PERS_ID`),
  ADD KEY `FK_CONTACT_MASTER_LINK_ID_idx` (`LINK_ID`);

--
-- Indexes for table `program_1p`
--
ALTER TABLE `program_1p`
  ADD PRIMARY KEY (`PROGRAM_ID`);

--
-- Indexes for table `province_country_1p`
--
ALTER TABLE `province_country_1p`
  ADD PRIMARY KEY (`P_C_ID`);

--
-- Indexes for table `question_master_1p`
--
ALTER TABLE `question_master_1p`
  ADD PRIMARY KEY (`Q_ID`);

--
-- Indexes for table `supplier_2`
--
ALTER TABLE `supplier_2`
  ADD PRIMARY KEY (`SUP_ID`),
  ADD KEY `FK_LINK_ID_SUPP_idx` (`LINK_ID`);

--
-- Indexes for table `tasks_1p`
--
ALTER TABLE `tasks_1p`
  ADD PRIMARY KEY (`TASK_ID`);

--
-- Indexes for table `user_account_3`
--
ALTER TABLE `user_account_3`
  ADD PRIMARY KEY (`USERNAME`),
  ADD KEY `FK_USER_ACCOUNT_3_USER_ACCOUNT_3` (`EMP_ID`);

--
-- Indexes for table `user_audit_4`
--
ALTER TABLE `user_audit_4`
  ADD PRIMARY KEY (`AUDIT_ID`),
  ADD KEY `FK_USER_AUDIT_4_CONTACT_MASTER_1` (`LINK_ID_CHANGED`),
  ADD KEY `FK_USER_AUDIT_4_USER_ACCOUNT_3` (`USERNAME`);

--
-- Indexes for table `user_log_4`
--
ALTER TABLE `user_log_4`
  ADD PRIMARY KEY (`USER_LOG_ID`),
  ADD KEY `FK_USER_LOG_4_USER_ACCOUNT_3` (`USERNAME`);

--
-- Indexes for table `visitor_3`
--
ALTER TABLE `visitor_3`
  ADD PRIMARY KEY (`VISITOR_ID`),
  ADD KEY `FK_LINK_ID_VISIT_idx` (`VISITOR_CONTACT_ID`);

--
-- Indexes for table `volunteer_2`
--
ALTER TABLE `volunteer_2`
  ADD PRIMARY KEY (`VOLUNTEER_ID`),
  ADD KEY `FK_VOLUNTEER_2_CONTACT_MASTER_1` (`LINK_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact_type_1p`
--
ALTER TABLE `contact_type_1p`
  MODIFY `CONTACT_TYPE_ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `address_3`
--
ALTER TABLE `address_3`
  ADD CONSTRAINT `FK_ADDRESS_3_CONTACT_MASTER_1` FOREIGN KEY (`LINK_ID`) REFERENCES `contact_master_1` (`LINK_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `board_member_2`
--
ALTER TABLE `board_member_2`
  ADD CONSTRAINT `FK_BOARD_MEMBER_2_CONTACT_MASTER_1` FOREIGN KEY (`LINK_ID`) REFERENCES `contact_master_1` (`LINK_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_2`
--
ALTER TABLE `client_2`
  ADD CONSTRAINT `FK_CLIENT_2_CONTACT_MASTER_1` FOREIGN KEY (`LINK_ID`) REFERENCES `contact_master_1` (`LINK_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `communication_3`
--
ALTER TABLE `communication_3`
  ADD CONSTRAINT `FK_CONTACT_3_CONTACT_MASTER_1` FOREIGN KEY (`LINK_ID`) REFERENCES `contact_master_1` (`LINK_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contact_master_1`
--
ALTER TABLE `contact_master_1`
  ADD CONSTRAINT `FK_CONTACT_TYPE_ID` FOREIGN KEY (`CONTACT_TYPE_ID`) REFERENCES `contact_type_1p` (`CONTACT_TYPE_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_2`
--
ALTER TABLE `employee_2`
  ADD CONSTRAINT `FK_EMPLOYEE_2_CONTACT_MASTER_1` FOREIGN KEY (`LINK_ID`) REFERENCES `contact_master_1` (`LINK_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_training_3`
--
ALTER TABLE `employee_training_3`
  ADD CONSTRAINT `FK_EMPLOYEE_TRAINING_3_EMPLOYEE_2` FOREIGN KEY (`EMP_ID`) REFERENCES `employee_2` (`EMP_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `funder_2`
--
ALTER TABLE `funder_2`
  ADD CONSTRAINT `FK_FUNDER_2_CONTACT_MASTER_1` FOREIGN KEY (`LINK_ID`) REFERENCES `contact_master_1` (`LINK_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `funder_3`
--
ALTER TABLE `funder_3`
  ADD CONSTRAINT `FK_FUNDER_3_FUNDER_2` FOREIGN KEY (`FUND_ID`) REFERENCES `funder_2` (`FUND_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `member_2`
--
ALTER TABLE `member_2`
  ADD CONSTRAINT `FK_MEMBER_2_CONTACT_MASTER_1` FOREIGN KEY (`LINK_ID`) REFERENCES `contact_master_1` (`LINK_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `noncategorized_2`
--
ALTER TABLE `noncategorized_2`
  ADD CONSTRAINT `FK_CONTACT_MASTER_LINK_ID` FOREIGN KEY (`LINK_ID`) REFERENCES `contact_master_1` (`LINK_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `organization_2`
--
ALTER TABLE `organization_2`
  ADD CONSTRAINT `FK_ORGANIZATION_2_CONTACT_MASTER_1` FOREIGN KEY (`LINK_ID`) REFERENCES `contact_master_1` (`LINK_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `partner_2`
--
ALTER TABLE `partner_2`
  ADD CONSTRAINT `FK_PARTNER_2_CONTACT_MASTER_1` FOREIGN KEY (`LINK_ID`) REFERENCES `contact_master_1` (`LINK_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permissions_2p`
--
ALTER TABLE `permissions_2p`
  ADD CONSTRAINT `FK_CONTACT_TYPE_ID_PERM` FOREIGN KEY (`CONTACT_TYPE_ID`) REFERENCES `contact_type_1p` (`CONTACT_TYPE_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `personal_2`
--
ALTER TABLE `personal_2`
  ADD CONSTRAINT `FK_LINK_ID_PERS` FOREIGN KEY (`LINK_ID`) REFERENCES `contact_master_1` (`LINK_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier_2`
--
ALTER TABLE `supplier_2`
  ADD CONSTRAINT `FK_LINK_ID_SUPP` FOREIGN KEY (`LINK_ID`) REFERENCES `contact_master_1` (`LINK_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_account_3`
--
ALTER TABLE `user_account_3`
  ADD CONSTRAINT `FK_USER_ACCOUNT_3_USER_ACCOUNT_3` FOREIGN KEY (`EMP_ID`) REFERENCES `employee_2` (`EMP_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_audit_4`
--
ALTER TABLE `user_audit_4`
  ADD CONSTRAINT `FK_USER_AUDIT_4_CONTACT_MASTER_1` FOREIGN KEY (`LINK_ID_CHANGED`) REFERENCES `contact_master_1` (`LINK_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_USER_AUDIT_4_USER_ACCOUNT_3` FOREIGN KEY (`USERNAME`) REFERENCES `user_account_3` (`USERNAME`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_log_4`
--
ALTER TABLE `user_log_4`
  ADD CONSTRAINT `FK_USER_LOG_4_USER_ACCOUNT_3` FOREIGN KEY (`USERNAME`) REFERENCES `user_account_3` (`USERNAME`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `visitor_3`
--
ALTER TABLE `visitor_3`
  ADD CONSTRAINT `FK_LINK_ID_VISIT` FOREIGN KEY (`VISITOR_CONTACT_ID`) REFERENCES `contact_master_1` (`LINK_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `volunteer_2`
--
ALTER TABLE `volunteer_2`
  ADD CONSTRAINT `FK_VOLUNTEER_2_CONTACT_MASTER_1` FOREIGN KEY (`LINK_ID`) REFERENCES `contact_master_1` (`LINK_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
