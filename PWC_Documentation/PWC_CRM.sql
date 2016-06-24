# --------------------------------------------------------
# Host:                         link.powerwellnessnet.com
# Server version:               5.1.73
# Server OS:                    redhat-linux-gnu
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2015-04-22 13:28:51
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for pwc_crm
DROP DATABASE IF EXISTS `pwc_crm`;
CREATE DATABASE IF NOT EXISTS `pwc_crm` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pwc_crm`;


# Dumping structure for view pwc_crm.HL7_view
DROP VIEW IF EXISTS `HL7_view`;
# Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `HL7_view` (
	`PatientMasterId` INT(11) NOT NULL DEFAULT '0',
	`PatientId` VARCHAR(12) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`DataExchangeId` VARCHAR(45) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`SSN` VARCHAR(12) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`FirstName` VARCHAR(20) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`MiddleName` VARCHAR(20) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`LastName` VARCHAR(20) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`Sex` VARCHAR(1) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`DoB` DATE NOT NULL DEFAULT '',
	`Phone` VARCHAR(14) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`WorkPhone` VARCHAR(14) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`CreateDate` DATETIME NULL DEFAULT NULL,
	`height` VARCHAR(17) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`patient` INT(11) NULL DEFAULT NULL,
	`timestamp` DATETIME NULL DEFAULT NULL,
	`SBP` VARCHAR(5) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`DBP` VARCHAR(5) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`RHR` VARCHAR(5) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`Weight` VARCHAR(18) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`waist` VARCHAR(17) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`TotalBloodChol` SMALLINT(6) NULL DEFAULT NULL,
	`Hdl` SMALLINT(6) NULL DEFAULT NULL,
	`Ldl` SMALLINT(6) NULL DEFAULT NULL,
	`Triglycerides` SMALLINT(6) NULL DEFAULT NULL,
	`SNR` VARCHAR(17) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`BodyFat` VARCHAR(8) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`VO2` VARCHAR(8) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`LeftGrip` VARCHAR(5) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`RightGrip` VARCHAR(5) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`Pushup` VARCHAR(5) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


# Dumping structure for table pwc_crm.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `JobID` int(10) NOT NULL,
  `FromEmailID` varchar(50) NOT NULL,
  `JobName` varchar(50) NOT NULL,
  `JobDescription` varchar(500) DEFAULT NULL,
  `JobSuccessEmailID` varchar(150) DEFAULT NULL,
  `JobFailureEmailID` varchar(150) DEFAULT NULL,
  `CreatedDate` date DEFAULT NULL,
  `UpdatedDate` date DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT NULL,
  `JobSuccess_CC_EmailID` varchar(150) DEFAULT NULL,
  `JobFailure_CC_EmailID` varchar(150) DEFAULT NULL,
  `AlertEmailID` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.runlog
DROP TABLE IF EXISTS `runlog`;
CREATE TABLE IF NOT EXISTS `runlog` (
  `LogID` int(10) NOT NULL AUTO_INCREMENT,
  `JobID` int(10) NOT NULL DEFAULT '0',
  `JobExecutionStartDateTime` datetime DEFAULT NULL,
  `JobExecutionEndDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`LogID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.StatsTable
DROP TABLE IF EXISTS `StatsTable`;
CREATE TABLE IF NOT EXISTS `StatsTable` (
  `moment` datetime DEFAULT NULL,
  `pid` varchar(20) DEFAULT NULL,
  `father_pid` varchar(20) DEFAULT NULL,
  `root_pid` varchar(20) DEFAULT NULL,
  `system_pid` bigint(8) DEFAULT NULL,
  `project` varchar(50) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `job_repository_id` varchar(255) DEFAULT NULL,
  `job_version` varchar(255) DEFAULT NULL,
  `context` varchar(50) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `duration` bigint(8) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblErrorLogs
DROP TABLE IF EXISTS `TblErrorLogs`;
CREATE TABLE IF NOT EXISTS `TblErrorLogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `errno` int(2) NOT NULL,
  `errtype` varchar(32) NOT NULL,
  `errstr` text NOT NULL,
  `errfile` varchar(255) NOT NULL,
  `errline` int(4) NOT NULL,
  `time` datetime NOT NULL,
  `ErrorTime` datetime NOT NULL,
  `UserId` int(11) NOT NULL,
  `ErrorSeverity` int(11) NOT NULL,
  `ErrorPageName` varchar(50) NOT NULL,
  `ErrorProcedureName` varchar(50) NOT NULL,
  `ErrorMessage` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblEtlJobMaster
DROP TABLE IF EXISTS `TblEtlJobMaster`;
CREATE TABLE IF NOT EXISTS `TblEtlJobMaster` (
  `JobId` int(11) NOT NULL AUTO_INCREMENT,
  `JobName` varchar(45) DEFAULT NULL,
  `JobDesc` varchar(45) DEFAULT NULL,
  `JobFrequency` varchar(45) DEFAULT NULL,
  `JobScheduleTime` datetime DEFAULT NULL,
  `JobLastRunDate` datetime DEFAULT NULL,
  `JobLastSuccessfulUpdate` datetime DEFAULT NULL,
  `IsJobActive` varchar(1) DEFAULT NULL,
  `JobCreatedDate` datetime DEFAULT NULL,
  `JobUpdatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `JobStatusEmails` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`JobId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblLkpCaller
DROP TABLE IF EXISTS `TblLkpCaller`;
CREATE TABLE IF NOT EXISTS `TblLkpCaller` (
  `CallerId` int(11) NOT NULL,
  `CallerName` varchar(45) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `LastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CallerId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblLkpCenter
DROP TABLE IF EXISTS `TblLkpCenter`;
CREATE TABLE IF NOT EXISTS `TblLkpCenter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compete_club_id` int(11) DEFAULT NULL,
  `compete_company_id` int(11) DEFAULT NULL,
  `company_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` int(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `last_api_refresh_members` datetime DEFAULT NULL,
  `frequency_api_refresh_members_hours` double(10,2) NOT NULL DEFAULT '4.00',
  `created` datetime DEFAULT NULL,
  `creator_id` varchar(36) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modifier_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compete_club_id` (`compete_club_id`),
  KEY `compete_company_id` (`compete_company_id`),
  KEY `creator_id` (`creator_id`),
  KEY `modifier_id` (`modifier_id`),
  KEY `company_id` (`company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblLkpOrderClass
DROP TABLE IF EXISTS `TblLkpOrderClass`;
CREATE TABLE IF NOT EXISTS `TblLkpOrderClass` (
  `OrderClassId` int(11) NOT NULL,
  `OrderClass` varchar(15) NOT NULL,
  PRIMARY KEY (`OrderClassId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblLkpOrderDepartment
DROP TABLE IF EXISTS `TblLkpOrderDepartment`;
CREATE TABLE IF NOT EXISTS `TblLkpOrderDepartment` (
  `OrderDepartmentId` int(11) NOT NULL,
  `OrderDepartment` varchar(15) NOT NULL,
  `OrderDeptCreateDate` datetime NOT NULL,
  `OrderDeptUpdateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`OrderDepartmentId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblLkpOrderDeptSpeciality
DROP TABLE IF EXISTS `TblLkpOrderDeptSpeciality`;
CREATE TABLE IF NOT EXISTS `TblLkpOrderDeptSpeciality` (
  `OrderDeptSpecialityId` int(3) NOT NULL,
  `OrderDeptId` int(3) DEFAULT NULL,
  `OrderDeptSpeciality` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`OrderDeptSpecialityId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblLkpOrderPriority
DROP TABLE IF EXISTS `TblLkpOrderPriority`;
CREATE TABLE IF NOT EXISTS `TblLkpOrderPriority` (
  `OrderPriorityId` int(3) NOT NULL,
  `OrderPriority` varchar(10) NOT NULL,
  PRIMARY KEY (`OrderPriorityId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblLkpOrderStatus
DROP TABLE IF EXISTS `TblLkpOrderStatus`;
CREATE TABLE IF NOT EXISTS `TblLkpOrderStatus` (
  `OrderStatusId` int(11) NOT NULL,
  `OrderStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`OrderStatusId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblLkpPrescription
DROP TABLE IF EXISTS `TblLkpPrescription`;
CREATE TABLE IF NOT EXISTS `TblLkpPrescription` (
  `PrescriptionSrcId` int(11) NOT NULL,
  `PrescriptionSrc` varchar(45) NOT NULL,
  PRIMARY KEY (`PrescriptionSrcId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblLkpStates
DROP TABLE IF EXISTS `TblLkpStates`;
CREATE TABLE IF NOT EXISTS `TblLkpStates` (
  `dst_id` int(11) NOT NULL AUTO_INCREMENT,
  `dst_dc_id` int(11) NOT NULL,
  `dst_iso_code` varchar(6) DEFAULT NULL,
  `dst_iso` varchar(100) DEFAULT NULL,
  `dst_name` varchar(255) DEFAULT NULL,
  `dst_printable_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dst_id`),
  KEY `dst_dc_id` (`dst_dc_id`),
  KEY `dst_iso_code` (`dst_iso_code`),
  KEY `dst_iso` (`dst_iso`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblMaintenance
DROP TABLE IF EXISTS `TblMaintenance`;
CREATE TABLE IF NOT EXISTS `TblMaintenance` (
  `MaintainId` int(11) NOT NULL AUTO_INCREMENT,
  `MaintainFlag` tinyint(1) DEFAULT NULL,
  `MaintainTime` datetime DEFAULT NULL,
  `MaintainLastUpdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`MaintainId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblMatchDataIssues
DROP TABLE IF EXISTS `TblMatchDataIssues`;
CREATE TABLE IF NOT EXISTS `TblMatchDataIssues` (
  `IssueId` int(10) NOT NULL AUTO_INCREMENT,
  `ID` int(10) NOT NULL,
  `PatientID` int(10) NOT NULL,
  `Fname` varchar(255) NOT NULL DEFAULT '0',
  `Lname` varchar(255) DEFAULT '0',
  `DOB` date DEFAULT '0000-00-00',
  `Phone` varchar(47) DEFAULT '0',
  `Center` int(10) DEFAULT '0',
  `Criteria` varchar(20) DEFAULT '0',
  `Status` varchar(10) DEFAULT 'UNRESOLVED',
  PRIMARY KEY (`IssueId`),
  UNIQUE KEY `UniqIssue` (`ID`,`PatientID`,`Fname`,`Lname`,`DOB`,`Phone`,`Center`,`Criteria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblOrder
DROP TABLE IF EXISTS `TblOrder`;
CREATE TABLE IF NOT EXISTS `TblOrder` (
  `OrderId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderPatientMasterId` int(3) DEFAULT NULL,
  `OrderPatientId` varchar(20) DEFAULT NULL,
  `OrderPhysicianId` varchar(15) DEFAULT NULL,
  `EpicID` varchar(15) DEFAULT NULL,
  `EpicOrder` varchar(450) DEFAULT NULL,
  `OrderCreateDate` date DEFAULT NULL,
  `OrderExpiryDate` date DEFAULT NULL,
  `OrderStatusId` varchar(200) DEFAULT NULL,
  `OrderPriorityId` varchar(200) DEFAULT NULL,
  `OrderClassId` varchar(200) DEFAULT NULL,
  `PrescriptionSrcId` int(3) DEFAULT NULL,
  `NumOfVisits` int(11) DEFAULT NULL,
  `OrderComments` text,
  `OrderDeptId` varchar(200) DEFAULT NULL,
  `OrderDeptSpecialityId` varchar(200) DEFAULT NULL,
  `OrderAuthorizedProvider` varchar(200) DEFAULT NULL,
  `OrderDiagnosis` varchar(2000) DEFAULT NULL,
  `OrderProcedure` varchar(200) DEFAULT NULL,
  `OrderProcedureCategory` varchar(200) DEFAULT NULL,
  `OrderOrderingUser` varchar(200) DEFAULT NULL,
  `OrderEncProvider` varchar(200) DEFAULT NULL,
  `OrderProviderSpeciality` varchar(200) DEFAULT NULL,
  `OrderScheduleInstructions` varchar(200) DEFAULT NULL,
  `OrderExtRefReason` varchar(200) DEFAULT NULL,
  `OrderLocation` varchar(200) DEFAULT NULL,
  `OrderFrom` varchar(200) DEFAULT NULL,
  `OrderTo` varchar(200) DEFAULT NULL,
  `OrderOverRideRestrictions` varchar(200) DEFAULT NULL,
  `OrderRefferalType` varchar(200) DEFAULT NULL,
  `OrderCenterId` int(10) DEFAULT NULL,
  `OrderCreatedBy` varchar(45) DEFAULT NULL,
  `OrderUpdatedBy` varchar(45) DEFAULT NULL,
  `OrderUpdatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `OrderContStatusId` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderId`),
  KEY `prescription_src_idx` (`PrescriptionSrcId`),
  KEY `status_src_idx` (`OrderStatusId`),
  KEY `PatientId_idx` (`OrderPatientId`),
  KEY `FK_PatientMasterId_idx` (`OrderPatientMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblOrderAudit
DROP TABLE IF EXISTS `TblOrderAudit`;
CREATE TABLE IF NOT EXISTS `TblOrderAudit` (
  `OrderId` int(11) NOT NULL,
  `OrderPatientMasterId` int(3) NOT NULL,
  `OrderPatientId` varchar(20) NOT NULL,
  `OrderPhysicianId` varchar(15) NOT NULL,
  `EpicID` varchar(15) NOT NULL,
  `EpicOrder` varchar(450) NOT NULL,
  `OrderCreateDate` date NOT NULL,
  `OrderExpiryDate` date NOT NULL,
  `OrderStatusId` varchar(200) NOT NULL,
  `OrderPriorityId` varchar(200) NOT NULL,
  `OrderClassId` varchar(200) NOT NULL,
  `PrescriptionSrcId` int(3) NOT NULL,
  `NumOfVisits` int(11) NOT NULL,
  `OrderComments` varchar(15) NOT NULL,
  `OrderDeptId` varchar(200) NOT NULL,
  `OrderDeptSpecialityId` varchar(200) NOT NULL,
  `OrderAuthorizedProvider` varchar(200) NOT NULL,
  `OrderDiagnosis` varchar(200) NOT NULL,
  `OrderProcedure` varchar(200) NOT NULL,
  `OrderProcedureCategory` varchar(200) NOT NULL,
  `OrderOrderingUser` varchar(200) NOT NULL,
  `OrderEncProvider` varchar(200) NOT NULL,
  `OrderProviderSpeciality` varchar(200) NOT NULL,
  `OrderScheduleInstructions` varchar(200) NOT NULL,
  `OrderExtRefReason` varchar(200) NOT NULL,
  `OrderLocation` varchar(200) NOT NULL,
  `OrderFrom` varchar(200) NOT NULL,
  `OrderTo` varchar(200) NOT NULL,
  `OrderOverRideRestrictions` varchar(200) NOT NULL,
  `OrderRefferalType` varchar(200) NOT NULL,
  `OrderCenterId` int(10) DEFAULT NULL,
  `OrderCreatedBy` varchar(45) DEFAULT NULL,
  `OrderUpdatedBy` varchar(45) DEFAULT NULL,
  `OrderUpdatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `OrderContStatusId` int(11) DEFAULT NULL,
  `UpdateDate` datetime NOT NULL,
  `ModifiedBy` varchar(45) NOT NULL,
  `Type` varchar(45) NOT NULL,
  KEY `prescription_src_idx` (`PrescriptionSrcId`),
  KEY `status_src_idx` (`OrderStatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblOrderContactStatusTbl
DROP TABLE IF EXISTS `TblOrderContactStatusTbl`;
CREATE TABLE IF NOT EXISTS `TblOrderContactStatusTbl` (
  `OrderContStatusId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderContStatus` varchar(45) DEFAULT NULL,
  `OrderContStatusCreateDate` datetime DEFAULT NULL,
  `OrderContStatusLastUpdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`OrderContStatusId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblOrderDiagnosis
DROP TABLE IF EXISTS `TblOrderDiagnosis`;
CREATE TABLE IF NOT EXISTS `TblOrderDiagnosis` (
  `OrderDiagnosisID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderDiagnosis_PatientMasterID` int(11) DEFAULT NULL,
  `OrderDiagnosis_OrderID` int(11) DEFAULT NULL,
  `OrderDiagnosis_Diagnosis` varchar(1000) DEFAULT NULL,
  `OrderDiagnosis_SetId` varchar(45) DEFAULT NULL,
  `OrderDiagnosis_CodingMethod` varchar(45) DEFAULT NULL,
  `OrderDiagnosis_Code` varchar(45) DEFAULT NULL,
  `OrderDiagnosis_Type` varchar(45) DEFAULT NULL,
  `OrderDiagnosis_CreateDate` datetime DEFAULT NULL,
  `OrderDiagnosis_CreatedBy` int(11) DEFAULT NULL,
  `OrderDiagnosis_UpdateDate` timestamp NULL DEFAULT NULL,
  `OrderDiagnosis_UpdatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderDiagnosisID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblOrderFiles
DROP TABLE IF EXISTS `TblOrderFiles`;
CREATE TABLE IF NOT EXISTS `TblOrderFiles` (
  `FileId` int(11) NOT NULL AUTO_INCREMENT,
  `FileOrderId` int(11) DEFAULT NULL,
  `FileName` varchar(45) DEFAULT NULL,
  `FilePath` varchar(200) DEFAULT NULL,
  `FileNotes` varchar(45) DEFAULT NULL,
  `FileCreateDate` datetime DEFAULT NULL,
  `FileCreatedBy` varchar(45) DEFAULT NULL,
  `FileIsVisible` tinyint(4) DEFAULT NULL,
  `FileUpdatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FileUpdatedBy` varchar(45) DEFAULT NULL,
  `FilePatientMasterId` int(11) DEFAULT NULL,
  PRIMARY KEY (`FileId`),
  KEY `Fk_FileOrderId_idx` (`FileOrderId`),
  CONSTRAINT `FK_OrderId` FOREIGN KEY (`FileOrderId`) REFERENCES `TblOrder` (`OrderId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblOutboundTracker
DROP TABLE IF EXISTS `TblOutboundTracker`;
CREATE TABLE IF NOT EXISTS `TblOutboundTracker` (
  `PatientId` varchar(50) DEFAULT NULL,
  `OrderId` int(10) DEFAULT NULL,
  `EpicId` varchar(50) DEFAULT NULL,
  `ProviderId` varchar(50) DEFAULT NULL,
  `NumberofOutputs` int(10) DEFAULT NULL,
  `FollowupSentDate` date DEFAULT NULL,
  `InitialSentDate` date DEFAULT NULL,
  `InitialHeight` varchar(17) DEFAULT NULL,
  `OutboundSent` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblPatientHL
DROP TABLE IF EXISTS `TblPatientHL`;
CREATE TABLE IF NOT EXISTS `TblPatientHL` (
  `PatientMasterId` int(10) NOT NULL,
  `PatientId` varchar(12) NOT NULL,
  `BarCodeId` varchar(45) DEFAULT NULL,
  `DataExchangeId` varchar(45) DEFAULT NULL,
  `SSN` varchar(12) DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `MiddleName` varchar(5) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `Age` int(10) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `Address2` varchar(100) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `StateId` int(10) DEFAULT NULL,
  `Zip` int(10) DEFAULT NULL,
  `Phone` varchar(12) DEFAULT NULL,
  `WorkPhone` varchar(12) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Notes` text,
  `CreateDate` datetime DEFAULT NULL,
  `LastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LastUpdateToProvider` datetime DEFAULT NULL,
  PRIMARY KEY (`PatientMasterId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblPatientMaster
DROP TABLE IF EXISTS `TblPatientMaster`;
CREATE TABLE IF NOT EXISTS `TblPatientMaster` (
  `PatientMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `PatientId` varchar(12) NOT NULL,
  `BarCodeId` varchar(45) DEFAULT NULL,
  `DataExchangeId` varchar(45) DEFAULT NULL,
  `SSN` varchar(12) DEFAULT NULL,
  `FirstName` varchar(20) NOT NULL,
  `MiddleName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) NOT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `DoB` date NOT NULL,
  `Age` int(3) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `Address2` varchar(100) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `StateId` int(4) DEFAULT NULL,
  `Zip` int(5) DEFAULT NULL,
  `Phone` varchar(14) DEFAULT NULL,
  `WorkPhone` varchar(14) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Notes` text,
  `CreateDate` datetime DEFAULT NULL,
  `LastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastUpdateToProvider` datetime DEFAULT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PatientMasterId`),
  KEY `PatientId` (`PatientId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblPatientMasterAudit
DROP TABLE IF EXISTS `TblPatientMasterAudit`;
CREATE TABLE IF NOT EXISTS `TblPatientMasterAudit` (
  `PatientMasterId` int(11) NOT NULL,
  `PatientId` int(12) NOT NULL,
  `BarCodeId` varchar(45) DEFAULT NULL,
  `DataExchangeId` varchar(45) DEFAULT NULL,
  `SSN` varchar(12) DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `MiddleName` varchar(5) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `Age` int(3) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `Address2` varchar(100) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `StateId` int(4) DEFAULT NULL,
  `Zip` int(5) DEFAULT NULL,
  `Phone` varchar(12) DEFAULT NULL,
  `WorkPhone` varchar(12) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Notes` text,
  `CreateDate` datetime DEFAULT NULL,
  `LastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LastUpdateToProvider` datetime NOT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `UpdatedBy` varchar(45) DEFAULT NULL,
  `UpdatedDate` datetime NOT NULL,
  `ModifiedBy` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblPatientMasterTemp
DROP TABLE IF EXISTS `TblPatientMasterTemp`;
CREATE TABLE IF NOT EXISTS `TblPatientMasterTemp` (
  `PatientMasterId` int(11) DEFAULT NULL,
  `PatientId` varchar(12) DEFAULT NULL,
  `BarCodeId` varchar(45) DEFAULT NULL,
  `DataExchangeId` varchar(45) DEFAULT NULL,
  `SSN` varchar(12) DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `MiddleName` varchar(5) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `Age` int(3) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `Address2` varchar(100) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `StateId` int(4) DEFAULT NULL,
  `Zip` int(5) DEFAULT NULL,
  `Phone` varchar(14) DEFAULT NULL,
  `WorkPhone` varchar(14) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Notes` text,
  `CreateDate` datetime DEFAULT NULL,
  `LastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LastUpdateToProvider` datetime DEFAULT NULL,
  `OrderId` int(11) DEFAULT NULL,
  `OrderPatientMasterId` int(3) DEFAULT NULL,
  `OrderPatientId` varchar(20) DEFAULT NULL,
  `OrderPhysicianId` varchar(15) DEFAULT NULL,
  `EpicID` varchar(15) DEFAULT NULL,
  `EpicOrder` varchar(450) DEFAULT NULL,
  `OrderCreateDate` date DEFAULT NULL,
  `OrderExpiryDate` date DEFAULT NULL,
  `OrderStatusId` varchar(200) DEFAULT NULL,
  `OrderPriorityId` varchar(200) DEFAULT NULL,
  `OrderClassId` varchar(200) DEFAULT NULL,
  `PrescriptionSrcId` int(3) DEFAULT NULL,
  `NumOfVisits` int(11) DEFAULT NULL,
  `OrderComments` text,
  `OrderDeptId` varchar(200) DEFAULT NULL,
  `OrderDeptSpecialityId` varchar(200) DEFAULT NULL,
  `OrderAuthorizedProvider` varchar(200) DEFAULT NULL,
  `OrderDiagnosis` varchar(200) DEFAULT NULL,
  `OrderProcedure` varchar(200) DEFAULT NULL,
  `OrderProcedureCategory` varchar(200) DEFAULT NULL,
  `OrderOrderingUser` varchar(200) DEFAULT NULL,
  `OrderEncProvider` varchar(200) DEFAULT NULL,
  `OrderProviderSpeciality` varchar(200) DEFAULT NULL,
  `OrderScheduleInstructions` varchar(200) DEFAULT NULL,
  `OrderExtRefReason` varchar(200) DEFAULT NULL,
  `OrderLocation` varchar(200) DEFAULT NULL,
  `OrderFrom` varchar(200) DEFAULT NULL,
  `OrderTo` varchar(200) DEFAULT NULL,
  `OrderOverRideRestrictions` varchar(200) DEFAULT NULL,
  `OrderRefferalType` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblPatientTracking
DROP TABLE IF EXISTS `TblPatientTracking`;
CREATE TABLE IF NOT EXISTS `TblPatientTracking` (
  `PatientTrackingId` int(11) NOT NULL AUTO_INCREMENT,
  `PatientMasterId` varchar(20) NOT NULL,
  `OrderId` varchar(20) NOT NULL,
  `CallerId` int(11) NOT NULL,
  `CallTime` datetime NOT NULL,
  `CallNotes` text NOT NULL,
  `CallNotesUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PatientTrackingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblPatientTrackingAudit
DROP TABLE IF EXISTS `TblPatientTrackingAudit`;
CREATE TABLE IF NOT EXISTS `TblPatientTrackingAudit` (
  `PatientTrackingId` int(11) NOT NULL,
  `PatientMasterId` varchar(20) NOT NULL,
  `OrderId` varchar(20) NOT NULL,
  `CallerId` int(11) NOT NULL,
  `CallTime` datetime NOT NULL,
  `CallNotes` text NOT NULL,
  `CallNotesUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedDate` datetime NOT NULL,
  `ModifiedBy` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblSessions
DROP TABLE IF EXISTS `TblSessions`;
CREATE TABLE IF NOT EXISTS `TblSessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.TblUsers
DROP TABLE IF EXISTS `TblUsers`;
CREATE TABLE IF NOT EXISTS `TblUsers` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `UserFName` varchar(45) DEFAULT NULL,
  `UserLName` varchar(45) DEFAULT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `UserCreateDate` datetime DEFAULT NULL,
  `UserLastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserIsActive` tinyint(4) DEFAULT NULL,
  `UserCreatedBy` varchar(45) DEFAULT NULL,
  `UserUpdatedBy` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for table pwc_crm.vs_database_diagrams
DROP TABLE IF EXISTS `vs_database_diagrams`;
CREATE TABLE IF NOT EXISTS `vs_database_diagrams` (
  `name` char(80) DEFAULT NULL,
  `diadata` text,
  `comment` varchar(1022) DEFAULT NULL,
  `preview` text,
  `lockinfo` char(80) DEFAULT NULL,
  `locktime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` char(80) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

# Data exporting was unselected.


# Dumping structure for trigger pwc_crm.TblOrder_AINS
DROP TRIGGER IF EXISTS `TblOrder_AINS`;
SET SESSION SQL_MODE='';
DELIMITER //
CREATE TRIGGER `TblOrder_AINS` AFTER INSERT ON `TblOrder` FOR EACH ROW -- Edit trigger body code below this line. Do not edit lines above this one
  
BEGIN
      INSERT INTO TblOrderAudit SELECT *,NOW(),CURRENT_USER(),"Insert"  from TblOrder where OrderId = NEW.OrderId;
END//
DELIMITER ;
SET SESSION SQL_MODE=@OLD_SQL_MODE;


# Dumping structure for trigger pwc_crm.TblOrder_BDEL
DROP TRIGGER IF EXISTS `TblOrder_BDEL`;
SET SESSION SQL_MODE='';
DELIMITER //
CREATE TRIGGER `TblOrder_BDEL` BEFORE DELETE ON `TblOrder` FOR EACH ROW -- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
      INSERT INTO TblOrderAudit SELECT *,NOW(),CURRENT_USER(),"Delete"  from TblOrder where OrderId = OLD.OrderId;
END//
DELIMITER ;
SET SESSION SQL_MODE=@OLD_SQL_MODE;


# Dumping structure for trigger pwc_crm.TblOrder_BUPD
DROP TRIGGER IF EXISTS `TblOrder_BUPD`;
SET SESSION SQL_MODE='';
DELIMITER //
CREATE TRIGGER `TblOrder_BUPD` BEFORE UPDATE ON `TblOrder` FOR EACH ROW -- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
      INSERT INTO TblOrderAudit SELECT *,NOW(),CURRENT_USER(),"Edit"  from TblOrder where OrderId = OLD.OrderId;
END//
DELIMITER ;
SET SESSION SQL_MODE=@OLD_SQL_MODE;


# Dumping structure for trigger pwc_crm.TblPatientMaster_AINS
DROP TRIGGER IF EXISTS `TblPatientMaster_AINS`;
SET SESSION SQL_MODE='';
DELIMITER //
CREATE TRIGGER `TblPatientMaster_AINS` AFTER INSERT ON `TblPatientMaster` FOR EACH ROW -- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
      INSERT INTO TblPatientMasterAudit SELECT *,NOW(),CURRENT_USER(),"Insert"  from TblPatientMaster where PatientMasterId = NEW.PatientMasterId;
END//
DELIMITER ;
SET SESSION SQL_MODE=@OLD_SQL_MODE;


# Dumping structure for trigger pwc_crm.TblPatientMaster_AUPD
DROP TRIGGER IF EXISTS `TblPatientMaster_AUPD`;
SET SESSION SQL_MODE='';
DELIMITER //
CREATE TRIGGER `TblPatientMaster_AUPD` BEFORE UPDATE ON `TblPatientMaster` FOR EACH ROW -- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
      INSERT INTO TblPatientMasterAudit SELECT *,NOW(),CURRENT_USER(),"EDIT"  from TblPatientMaster where PatientMasterId = OLD.PatientMasterId;
END//
DELIMITER ;
SET SESSION SQL_MODE=@OLD_SQL_MODE;


# Dumping structure for trigger pwc_crm.TblPatientMaster_BDEL
DROP TRIGGER IF EXISTS `TblPatientMaster_BDEL`;
SET SESSION SQL_MODE='';
DELIMITER //
CREATE TRIGGER `TblPatientMaster_BDEL` BEFORE DELETE ON `TblPatientMaster` FOR EACH ROW -- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
      INSERT INTO TblPatientMasterAudit SELECT *,NOW(),CURRENT_USER(),"Delete"  from TblPatientMaster where PatientMasterId = OLD.PatientMasterId;
END//
DELIMITER ;
SET SESSION SQL_MODE=@OLD_SQL_MODE;


# Dumping structure for trigger pwc_crm.TblPatientTracking_AINS
DROP TRIGGER IF EXISTS `TblPatientTracking_AINS`;
SET SESSION SQL_MODE='';
DELIMITER //
CREATE TRIGGER `TblPatientTracking_AINS` AFTER INSERT ON `TblPatientTracking` FOR EACH ROW BEGIN
      INSERT INTO TblPatientTrackingAudit SELECT *,NOW(),CURRENT_USER(),"Insert"  from TblPatientTracking where PatientTrackingId = NEW.PatientTrackingId;
END//
DELIMITER ;
SET SESSION SQL_MODE=@OLD_SQL_MODE;


# Dumping structure for trigger pwc_crm.TblPatientTracking_BDEL
DROP TRIGGER IF EXISTS `TblPatientTracking_BDEL`;
SET SESSION SQL_MODE='';
DELIMITER //
CREATE TRIGGER `TblPatientTracking_BDEL` BEFORE DELETE ON `TblPatientTracking` FOR EACH ROW -- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
      INSERT INTO TblPatientTrackingAudit SELECT *,NOW(),CURRENT_USER(),"Delete"  from TblPatientTracking where PatientTrackingId = OLD.PatientTrackingId;
END//
DELIMITER ;
SET SESSION SQL_MODE=@OLD_SQL_MODE;


# Dumping structure for trigger pwc_crm.TblPatientTracking_BUPD
DROP TRIGGER IF EXISTS `TblPatientTracking_BUPD`;
SET SESSION SQL_MODE='';
DELIMITER //
CREATE TRIGGER `TblPatientTracking_BUPD` BEFORE UPDATE ON `TblPatientTracking` FOR EACH ROW -- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
      INSERT INTO TblPatientTrackingAudit SELECT *,NOW(),CURRENT_USER(),"Edit"  from TblPatientTracking where PatientTrackingId = OLD.PatientTrackingId;
END//
DELIMITER ;
SET SESSION SQL_MODE=@OLD_SQL_MODE;


# Dumping structure for view pwc_crm.HL7_view
DROP VIEW IF EXISTS `HL7_view`;
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `HL7_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`powerDBA`@`%` SQL SECURITY DEFINER VIEW `HL7_view` AS select `a`.`PatientMasterId` AS `PatientMasterId`,`a`.`PatientId` AS `PatientId`,`a`.`DataExchangeId` AS `DataExchangeId`,`a`.`SSN` AS `SSN`,`a`.`FirstName` AS `FirstName`,`a`.`MiddleName` AS `MiddleName`,`a`.`LastName` AS `LastName`,`a`.`Sex` AS `Sex`,`a`.`DoB` AS `DoB`,`a`.`Phone` AS `Phone`,`a`.`WorkPhone` AS `WorkPhone`,`a`.`CreateDate` AS `CreateDate`,`b`.`height` AS `height`,`b`.`patient` AS `patient`,`c`.`timestamp` AS `timestamp`,`c`.`bp1` AS `SBP`,`c`.`bp2` AS `DBP`,`c`.`hr1` AS `RHR`,`c`.`weight` AS `Weight`,`c`.`waist` AS `waist`,`c`.`cholesterol` AS `TotalBloodChol`,`c`.`hdl` AS `Hdl`,`c`.`ldl` AS `Ldl`,`c`.`triglycerides` AS `Triglycerides`,`c`.`sitreach` AS `SNR`,`e`.`bodyfat` AS `BodyFat`,`e`.`vo2max` AS `VO2`,`e`.`gr_left` AS `LeftGrip`,`e`.`gr_right` AS `RightGrip`,`e`.`pushups` AS `Pushup` from (((`pwc_crm`.`TblPatientMaster` `a` join `dbo`.`tbl_mfc_pat1` `b` on((`a`.`DataExchangeId` = `b`.`DataExchangeID`))) join `dbo`.`tbl_mfc_pat3` `c` on((`b`.`patient` = `c`.`patientid`))) join `dbo`.`tbl_mfc_hfa` `e` on((`b`.`patient` = `e`.`patientid`)));
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
