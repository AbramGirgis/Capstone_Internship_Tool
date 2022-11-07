-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 03, 2022 at 04:09 PM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `internship_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cohort`
--

CREATE TABLE `cohort` (
  `cohortID` int(11) NOT NULL,
  `programTitle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cohort`
--

INSERT INTO `cohort` (`cohortID`, `programTitle`) VALUES
(1, 'Software Engineering'),
(2, 'Computer Sc'),
(3, 'Mechanical Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `companyID` int(11) NOT NULL,
  `companyName` varchar(50) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `phoneNumberExtension` int(5) DEFAULT NULL,
  `streetNumber` int(11) NOT NULL,
  `streetName` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `provence` varchar(50) NOT NULL,
  `postalCode` varchar(15) NOT NULL,
  `staffID` varchar(10) NOT NULL,
  `isActive` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`companyID`, `companyName`, `phoneNumber`, `phoneNumberExtension`, `streetNumber`, `streetName`, `city`, `provence`, `postalCode`, `staffID`, `isActive`) VALUES
(2, 'A comapny', '514514514514', 233, 322384, 'sdjksdkljnsjl', 'sdkjskdsj', 'ksdjfks', 'h4a7g6', '1234567', 1),
(3, 'CompanyA', '5343238998', NULL, 34, 'someStreet', 'someCity', 'QC', 'J2LM3V', '1234567', 1);

-- --------------------------------------------------------

--
-- Table structure for table `companyrepresentative`
--

CREATE TABLE `companyrepresentative` (
  `representativeID` int(11) NOT NULL,
  `firsName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `repTitle` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `phoneNumberExtension` int(11) DEFAULT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `companyID` int(11) NOT NULL,
  `isActive` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `companyrepresentative`
--

INSERT INTO `companyrepresentative` (`representativeID`, `firsName`, `lastName`, `repTitle`, `email`, `password`, `phoneNumber`, `phoneNumberExtension`, `createDate`, `lastUpdate`, `companyID`, `isActive`) VALUES
(1, 'Mr X', 'MrY', 'A Rep', 'rep@rep.com', '123', '514514514514', 2343, '2022-08-15 02:16:23', '2022-08-15 02:16:23', 2, 1),
(2, 'Peter', 'Nash', 'some title', 'aa@bb.c', '123', '3215436688', NULL, '2022-11-02 14:49:32', '2022-11-02 14:49:32', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `depID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`depID`, `name`) VALUES
(1, 'Computer Science'),
(2, 'Medicine'),
(3, 'Software Engineering'),
(4, 'Finance');

-- --------------------------------------------------------

--
-- Table structure for table `filesuser`
--

CREATE TABLE `filesuser` (
  `fileId` int(11) NOT NULL,
  `userID` varchar(10) NOT NULL,
  `type` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `description` text,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `extension` varchar(5) NOT NULL,
  `fileName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `filesuser`
--

INSERT INTO `filesuser` (`fileId`, `userID`, `type`, `status`, `description`, `lastUpdate`, `extension`, `fileName`) VALUES
(8, '2203102', 'image', 1, '', '2022-10-24 03:02:55', 'png', 'Profile Picture'),
(9, '2203102', 'cv', 1, 'some file description', '2022-10-24 03:03:35', 'pdf', 'My CV'),
(11, '2195413', 'image', 1, '', '2022-11-02 15:59:53', 'png', 'Profile Picture'),
(13, '2195413', 'cv', 1, 'This is my resume', '2022-11-02 20:44:14', 'pdf', 'sample2195413.pdf'),
(14, '2195413', 'project', 1, 'project details', '2022-11-02 20:44:56', 'pdf', 'project2195413.pdf'),
(15, '2195413', 'datacheat', 1, 'java', '2022-11-03 14:35:06', 'pdf', 'javacheatsheet2195413.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `internshipoffer`
--

CREATE TABLE `internshipoffer` (
  `internshipID` int(11) NOT NULL,
  `internshipTitle` varchar(50) NOT NULL,
  `field` varchar(50) NOT NULL,
  `longDescription` text NOT NULL,
  `shortDescription` text NOT NULL,
  `internshipTasks` text NOT NULL,
  `skillsRequired` text NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `representativeID` int(11) NOT NULL,
  `isActive` int(1) NOT NULL DEFAULT '1',
  `depID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `internshipoffer`
--

INSERT INTO `internshipoffer` (`internshipID`, `internshipTitle`, `field`, `longDescription`, `shortDescription`, `internshipTasks`, `skillsRequired`, `startDate`, `endDate`, `lastUpdate`, `representativeID`, `isActive`, `depID`) VALUES
(1, 'Analyst Programmer ', 'Software Engineering', 'We are looking for a dynamic, energetic intern who is eager to learn about our company by assisting various departments. You will be working closely with our team to conduct research, capture data, and attend meetings where you will be asked to take minutes.\r\n\r\nTo be successful as an Intern, you should be willing to help with any tasks assigned by a supervisor. You will be involved in upcoming projects as well as assisting with current campaigns.', 'We are looking for a dynamic, energetic intern who is eager to learn about our company by assisting various departments. You will be working closely with our team to conduct research, capture data, and attend meetings where you will be asked to take minutes.\r\n\r\nTo be successful as an Intern, you should be willing to help with any tasks assigned by a supervisor. You will be involved in upcoming projects as well as assisting with current campaigns.', 'We are looking for a dynamic, energetic intern who is eager to learn about our company by assisting various departments. You will be working closely with our team to conduct research, capture data, and attend meetings where you will be asked to take minutes.\r\n\r\nTo be successful as an Intern, you should be willing to help with any tasks assigned by a supervisor. You will be involved in upcoming projects as well as assisting with current campaigns.', 'We are looking for a dynamic, energetic intern who is eager to learn about our company by assisting various departments. You will be working closely with our team to conduct research, capture data, and attend meetings where you will be asked to take minutes.\r\n\r\nTo be successful as an Intern, you should be willing to help with any tasks assigned by a supervisor. You will be involved in upcoming projects as well as assisting with current campaigns.', '2023-01-16', '2023-04-28', '2022-11-02 14:59:06', 1, 1, 3),
(2, 'Web developper', 'Computer Science', 'ERP Buddies Inc. is comprised of dynamic business and specialized technical experts in the ERP industry. ERP Buddies applies best practices in the consultation, implementation, integration, and customization of cloud-based products. We provide a 360 approach to our clients to ensure they are receiving the best possible solutions.\r\n\r\nAt ERP Buddies, we focus on our core values and work as a team to get the job done. We are more than just co-workers; we are like family. With our dynamic and unique work environment, our employees have the opportunity to take ownership of projects and learn and grow within the company. We know that when you surround yourself with the best, you achieve success—and in turn, achieve success for our clients. To learn more about ERP Buddies Inc., please visit www.erpbuddies.com.\r\n*This position starts as a 4 month internship, where the candidate must be in the last semester of their post secondary. *', 'We are looking for amazing talent who can contribute to our efforts and deliver results! ERP Buddies is seeking an intern who will immediately contribute to the organization and the Application Development team efforts. If you love technology, are interested in a developer career, are well organized, and are keen to join an industry leader — we would love to hear from you!', 'Write high-quality source code to program complete applications within deadlines.\r\nConduct functional and non-functional testing.\r\nTroubleshoot and debug applications.\r\nEvaluate existing applications to reprogram, update and add new features.\r\nUnderstand client requirements and how they translate in application feature.\r\nQualifications\r\n', 'Completing a Bachelor\'s Degree in computer science or a relevant field.\r\nWorking knowledge of programming languages such as JavaScript, Java and HTML\r\nPrevious experience as a developer would be a great asset.\r\nPlease let us know if you require reasonable accommodation due to a disability during any aspect of the recruitment process and we will work with you to address your needs.', '2022-12-05', '2023-03-31', '2022-11-02 15:00:23', 2, 1, 1),
(3, 'Full Stack developper', 'Computer Science', 'Provide experienced technical expertise to develop process methodology for department to meet internal and external clients’ needs. Plan and coordinate the development of integrated programming solutions serving the full spectrum of statistical programming needs. Provide technical expertise and leadership to the department. Provide internal consulting services, including specifications and user needs analysis for complex project or client requirements.', 'Provide experienced technical expertise to develop process methodology for department to meet internal and external clients’ needs. ', 'Perform, plan and co-ordinate the following for complex studies: (i) the programming, testing, and documentation of statistical programs for use in creating statistical tables, figures, and listing summaries and (ii) the programming of analysis databases (derived datasets) and transfers of data for internal and external clients. May perform and plan the programming of database quality control checks.', 'Perform, plan and co-ordinate the following for complex studies: (i) the programming, testing, and documentation of statistical programs for use in creating statistical tables, figures, and listing summaries and (ii) the programming of analysis databases (derived datasets) and transfers of data for internal and external clients. May perform and plan the programming of database quality control checks.', '2022-08-31', '2022-10-31', '2022-10-23 01:19:55', 1, 1, 1),
(5, 'Front End Developer', 'Computer Science', 'We are on the search for a web manager who will, among other things, be responsible for the technical front-end development and daily maintenance of our already established website. Our responsibilities and requirements are listed below. If you believe this position is for you, please reach out to us. We’d love to hear from you and expand our team of hard-working and dedicated individuals passionate and driven by innovation. Be part of our team and let\'s make history together!', 'Our mission here at TokClix, a North American Digital Marketing agency with distributed offices in both Toronto and Montreal. Our goal is to provide our clients with the highest-quality ad networks in the world. Our service has ensured massive scaleability and a consistent stream of high-level lead quality since our inception.', 'Perform, plan and co-ordinate the following for complex studies: (i) the programming, testing, and documentation of statistical programs for use in creating statistical tables, figures, and listing summaries and (ii) the programming of analysis databases (derived datasets) and transfers of data for internal and external clients. May perform and plan the programming of database quality control checks.Perform, plan and co-ordinate the following for complex studies: (i) the programming, testing, and documentation of statistical programs for use in creating statistical tables, figures, and listing summaries and (ii) the programming of analysis databases (derived datasets) and transfers of data for internal and external clients. May perform and plan the programming of database quality control checks.', 'Perform, plan and co-ordinate the following for complex studies: (i) the programming, testing, and documentation of statistical programs for use in creating statistical tables, figures, and listing summaries and (ii) the programming of analysis databases (derived datasets) and transfers of data for internal and external clients. May perform and plan the programming of database quality control checks.', '2023-01-23', '2023-05-05', '2022-11-02 15:03:11', 1, 1, 1),
(6, 'Software developer', 'Computer Science', 'We are looking for someone with a university background in software/computer engineering or other relevant discipline, or equivalent combination of education and experience with significant experience in test software development (3+ years). You know how to work with an existing code base and have knowledge of multi-threaded processing, data sharing and APIs. Proficiency in Python is required, and knowledge of C++ are necessary to carry out this project . You have experience working with complex software requirements specifications and agile software development.', 'We are looking for an embedded development engineer for one of our clients, an internationally renowned actor in the space field.\r\nThe main mission of the software developer will be to develop software in Windows, using Python, for the testing of various satellite payloads.', 'Duties will include:\r\nCreate and modify software applications for an EGSE targeting satellite payloads;\r\nRead and understand detailed requirements documents;\r\nPlan work, provide effort estimates, and complete your work;\r\nDesign, code, test, debug, and document high quality software development applications;', 'The following skills will also be appreciated :\r\nExposure to DO-178 standards;\r\nExperience in instrument testing, functional testing of automated systems;\r\nKnowledge of CCSDS, MIL-STD-1553;\r\nKnowledge of protocols such as CAN bus and SpaceWire;', '2022-11-28', '2023-03-24', '2022-11-02 14:58:12', 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `portfoliofiles`
--

CREATE TABLE `portfoliofiles` (
  `fileID` int(11) NOT NULL,
  `fileName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `size` float NOT NULL,
  `studentID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `skillID` int(11) NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` varchar(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `staffTitle` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `phoneExtension` int(5) DEFAULT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `department` varchar(50) NOT NULL,
  `supervisorID` varchar(10) DEFAULT NULL,
  `subordinateID` varchar(10) DEFAULT NULL,
  `isActive` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `firstName`, `lastName`, `staffTitle`, `email`, `password`, `phoneNumber`, `phoneExtension`, `createDate`, `lastUpdate`, `department`, `supervisorID`, `subordinateID`, `isActive`) VALUES
('1234567', 'staffname', 'staff lastName', 'TITLE', 'SDJKFS@KDSJK.CO.DSJF', '123', '32874823', 23, '2022-08-15 02:11:27', '2022-08-15 02:11:27', 'Conted', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff_cohort`
--

CREATE TABLE `staff_cohort` (
  `StaffID` varchar(10) NOT NULL,
  `cohortID` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentID` varchar(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `RScore` float NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `phoneExtension` int(5) DEFAULT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cohortID` int(11) NOT NULL,
  `isActive` int(1) NOT NULL DEFAULT '1',
  `depID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentID`, `firstName`, `lastName`, `dateOfBirth`, `email`, `password`, `RScore`, `phoneNumber`, `phoneExtension`, `createDate`, `lastUpdate`, `cohortID`, `isActive`, `depID`) VALUES
('111111', 'Akef', 'Ben', '2012-05-04', 'akef.benettaouil@gmail.com', '12345', 32, '514', NULL, '2022-08-16 06:58:38', '2022-08-16 06:58:38', 2, 1, 1),
('122', 'meme', 'okko', '2003-10-12', 'd@kkk.c', '123Hhh123', 24, '999_664_7777', NULL, '2022-10-23 23:32:11', '2022-10-23 23:32:11', 6, 1, 2),
('202', 'Mm', 'Nn', '2010-02-17', 'd@ee.c', '555Ao2111', 27, '553_664_7777', NULL, '2022-11-02 16:01:58', '2022-11-02 16:01:58', 2, 1, 3),
('2195413', 'Abram', 'GIRGIS', '2012-08-13', 'abram@gml.com', '1234', 30, '3425550022', NULL, '2022-11-02 15:57:23', '2022-11-03 14:43:48', 1, 1, 1),
('2203102', 'Hazar', 'SNOUSSI', '2022-02-10', 'hazar.snoussi@gmail.com', '12345', 26, '2343434', NULL, '2022-08-16 03:33:41', '2022-08-16 07:17:00', 1, 1, 1),
('2222222', 'Akeff', 'Ben', '2012-05-04', 'akef.benettaouil@gmail.com', '12345', 32, '514', NULL, '2022-08-16 06:05:46', '2022-08-16 07:06:30', 1, 1, 3),
('343', 'aaa', 'bbb', '2002-10-23', 'f@t.c', '767', 30, '4343231111', NULL, '2022-10-22 23:45:07', '2022-10-22 23:45:07', 3413, 0, 2),
('55', 'www', 'eee', '2000-10-05', 'r@f.c', '555Ao2022', 23, '333_444_8888', NULL, '2022-10-23 00:34:40', '2022-10-23 00:34:40', 5, 1, 3),
('67', 'rr', 'eee', '1999-10-18', 'd@ee.c', '555Ao2111', 25, '553_664_8888', NULL, '2022-10-23 02:06:13', '2022-10-23 02:06:13', 8, 1, 2),
('939', 'youu', 'me', '2002-10-20', 'sd@m.c', '123Qq123', 27, '553_664_7777', NULL, '2022-10-23 23:24:15', '2022-10-23 23:24:15', 2, 1, 4),
('989', 'plouu', 'pokko', '2014-06-10', 'sd@mre.cmc', '121Qq002', 26, '999_664_7007', NULL, '2022-11-02 17:57:51', '2022-11-02 17:58:54', 9, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `student_internship`
--

CREATE TABLE `student_internship` (
  `studentID` varchar(10) NOT NULL,
  `internshipID` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) NOT NULL DEFAULT 'applied'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_internship`
--

INSERT INTO `student_internship` (`studentID`, `internshipID`, `date`, `status`) VALUES
('2203102', 1, '2022-08-16 04:00:00', 'applied'),
('2203102', 3, '2022-11-02 15:18:23', 'applied'),
('2195413', 6, '2022-11-02 15:58:33', 'applied'),
('2195413', 2, '2022-11-02 15:58:44', 'applied'),
('202', 1, '2022-11-02 18:20:21', 'applied'),
('2195413', 3, '2022-11-03 14:33:45', 'applied');

-- --------------------------------------------------------

--
-- Table structure for table `student_skills`
--

CREATE TABLE `student_skills` (
  `studentID` varchar(10) NOT NULL,
  `skillID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cohort`
--
ALTER TABLE `cohort`
  ADD PRIMARY KEY (`cohortID`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`companyID`),
  ADD KEY `FK5` (`staffID`);

--
-- Indexes for table `companyrepresentative`
--
ALTER TABLE `companyrepresentative`
  ADD PRIMARY KEY (`representativeID`),
  ADD KEY `FK6` (`companyID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`depID`);

--
-- Indexes for table `filesuser`
--
ALTER TABLE `filesuser`
  ADD PRIMARY KEY (`fileId`),
  ADD KEY `FK15` (`userID`);

--
-- Indexes for table `internshipoffer`
--
ALTER TABLE `internshipoffer`
  ADD PRIMARY KEY (`internshipID`),
  ADD KEY `FK7` (`representativeID`),
  ADD KEY `FK17` (`depID`);

--
-- Indexes for table `portfoliofiles`
--
ALTER TABLE `portfoliofiles`
  ADD PRIMARY KEY (`fileID`),
  ADD KEY `FK14` (`studentID`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skillID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`),
  ADD KEY `FK1` (`subordinateID`),
  ADD KEY `FK2` (`supervisorID`);

--
-- Indexes for table `staff_cohort`
--
ALTER TABLE `staff_cohort`
  ADD PRIMARY KEY (`StaffID`,`cohortID`),
  ADD KEY `FK11` (`cohortID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`),
  ADD KEY `FK4` (`cohortID`),
  ADD KEY `FK16` (`depID`);

--
-- Indexes for table `student_skills`
--
ALTER TABLE `student_skills`
  ADD PRIMARY KEY (`studentID`,`skillID`),
  ADD KEY `FK12` (`skillID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cohort`
--
ALTER TABLE `cohort`
  MODIFY `cohortID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `companyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `companyrepresentative`
--
ALTER TABLE `companyrepresentative`
  MODIFY `representativeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `depID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `filesuser`
--
ALTER TABLE `filesuser`
  MODIFY `fileId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `internshipoffer`
--
ALTER TABLE `internshipoffer`
  MODIFY `internshipID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `portfoliofiles`
--
ALTER TABLE `portfoliofiles`
  MODIFY `fileID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `skillID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `FK5` FOREIGN KEY (`staffID`) REFERENCES `staff` (`StaffID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `companyrepresentative`
--
ALTER TABLE `companyrepresentative`
  ADD CONSTRAINT `FK6` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `filesuser`
--
ALTER TABLE `filesuser`
  ADD CONSTRAINT `FK15` FOREIGN KEY (`userID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `internshipoffer`
--
ALTER TABLE `internshipoffer`
  ADD CONSTRAINT `FK17` FOREIGN KEY (`depID`) REFERENCES `department` (`depID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK7` FOREIGN KEY (`representativeID`) REFERENCES `companyrepresentative` (`representativeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `portfoliofiles`
--
ALTER TABLE `portfoliofiles`
  ADD CONSTRAINT `FK14` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `FK16` FOREIGN KEY (`depID`) REFERENCES `department` (`depID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
