SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema employee_performance
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `employee_performance` DEFAULT CHARACTER SET utf8 ;
USE `employee_performance` ;

-- -----------------------------------------------------
-- Table `employee_performance`.`TblAccessLkp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblAccessLkp` (
  `AccessId` INT(11) NOT NULL AUTO_INCREMENT,
  `AccessType` VARCHAR(45) NULL DEFAULT NULL,
  `EmployeeAccessDesc` VARCHAR(45) NULL DEFAULT NULL,
  `CreateDate` DATETIME NULL DEFAULT NULL,
  `LastUpdate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`AccessId`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblSectionsLkp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblSectionsLkp` (
  `SectionId` INT(11) NOT NULL AUTO_INCREMENT,
  `SectionName` VARCHAR(45) NULL DEFAULT NULL,
  `SectionDesc` LONGTEXT NULL DEFAULT NULL,
  `SectionForManagementOnly` TINYINT(1) NULL DEFAULT NULL,
  `SectionCreateDate` DATETIME NULL DEFAULT NULL,
  `SectionLastUpdate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`SectionId`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblCategoriesLkp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblCategoriesLkp` (
  `CategoryId` INT(11) NOT NULL AUTO_INCREMENT,
  `CategorySectionId` INT(11) NULL DEFAULT NULL,
  `CategoryName` VARCHAR(45) NULL DEFAULT NULL,
  `CategoryDesc` LONGTEXT NULL DEFAULT NULL,
  `CategoryForManagement` TINYINT(1) NULL DEFAULT '0',
  `CategoryCreateDate` DATETIME NULL DEFAULT NULL,
  `CategoryLastUpdate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CategoryId`),
  INDEX `fk_category_section_id_idx` (`CategorySectionId` ASC),
  CONSTRAINT `fk_category_section_id`
    FOREIGN KEY (`CategorySectionId`)
    REFERENCES `employee_performance`.`TblSectionsLkp` (`SectionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblEmployees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblEmployees` (
  `EmpId` INT(11) NOT NULL AUTO_INCREMENT,
  `EmpFname` VARCHAR(45) NOT NULL,
  `EmpLname` VARCHAR(45) NOT NULL,
  `EmpMInitial` VARCHAR(45) NOT NULL,
  `EmpDoB` VARCHAR(14) NOT NULL,
  `EmpUserName` VARCHAR(45) NOT NULL,
  `EmpJobTitle` VARCHAR(45) NOT NULL,
  `EmpJoiningDate` DATETIME NOT NULL,
  `EmpLocation` VARCHAR(45) NOT NULL,
  `EmpType` INT(11) NOT NULL,
  `EmpSupervisor` INT(11) NOT NULL,
  `EmpDurationInCurrentPosition` FLOAT NOT NULL,
  `EmpReviewType` TINYINT(1) NOT NULL,
  `EmpEmail` VARCHAR(45) NOT NULL,
  `EmpPhoneNumber` VARCHAR(14) NOT NULL,
  `EmpLastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EmpIsDeleted` TINYINT(4) NOT NULL DEFAULT '0',
  `EmpUpdatedBy` INT(11) NOT NULL,
  `EmpCreatedBy` INT(11) NOT NULL,
  `EmpCreateDate` DATETIME NOT NULL,
  `EmpAddress` VARCHAR(100) NULL DEFAULT NULL,
  `EmpAddress-2` VARCHAR(100) NULL DEFAULT NULL,
  `EmpState` INT(11) NULL DEFAULT NULL,
  `EmpCity` VARCHAR(45) NULL DEFAULT NULL,
  `EmpZipCode` VARCHAR(8) NULL DEFAULT NULL,
  `EmpCountry` INT(11) NULL DEFAULT '226',
  `EmpDepartment` VARCHAR(45) NULL DEFAULT NULL,
  `EmpPersonalEmail` VARCHAR(45) NULL DEFAULT NULL,
  `EmpEmergencyContact` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`EmpId`),
  UNIQUE INDEX `EmpUserName_UNIQUE` (`EmpUserName` ASC),
  INDEX `fk_emptypeid_idx` (`EmpType` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 56
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblEvaluationStatusLkp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblEvaluationStatusLkp` (
  `EvalStatusId` INT(10) NOT NULL AUTO_INCREMENT,
  `EvalStatusTitle` VARCHAR(50) NOT NULL,
  `EvalStatusCreateDate` DATETIME NOT NULL,
  `EvalStatusLatUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`EvalStatusId`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblEvalTypeLkp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblEvalTypeLkp` (
  `EvalTypeId` INT(11) NOT NULL AUTO_INCREMENT,
  `EvalType` VARCHAR(45) NULL DEFAULT NULL,
  `CreateDate` DATETIME NULL DEFAULT NULL,
  `LastUpdate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EvalTypeId`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblEvaluationMaster`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblEvaluationMaster` (
  `EvalMasterId` INT(10) NOT NULL AUTO_INCREMENT,
  `EvalInitiatedBy` INT(10) NULL DEFAULT NULL,
  `EvalFor` INT(10) NULL DEFAULT NULL,
  `EvalStatus` INT(10) NULL DEFAULT NULL,
  `EvalPeriod` VARCHAR(45) NULL DEFAULT NULL,
  `EvalType` INT(11) NULL DEFAULT NULL,
  `EvalCreatedBy` INT(10) NULL DEFAULT NULL,
  `EvalCreatedDate` DATETIME NULL DEFAULT NULL,
  `EvalUpdatedBy` INT(10) NULL DEFAULT NULL,
  `EvalUpdatedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EvalIsMetSupervisor` TINYINT(4) NULL DEFAULT NULL,
  `EvalFinalMeetingDate` DATE NULL DEFAULT NULL,
  `EvalCloseComments` MEDIUMTEXT NULL DEFAULT NULL,
  `EvalReopenReason` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`EvalMasterId`),
  INDEX `fk_empid_idx` (`EvalFor` ASC),
  INDEX `fk_evalstaus_idx` (`EvalStatus` ASC),
  INDEX `fk_evaltype_idx` (`EvalType` ASC),
  CONSTRAINT `fk_evalforid`
    FOREIGN KEY (`EvalFor`)
    REFERENCES `employee_performance`.`TblEmployees` (`EmpId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evalstaus`
    FOREIGN KEY (`EvalStatus`)
    REFERENCES `employee_performance`.`TblEvaluationStatusLkp` (`EvalStatusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evaltype`
    FOREIGN KEY (`EvalType`)
    REFERENCES `employee_performance`.`TblEvalTypeLkp` (`EvalTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 83
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblQuestionTypeLkp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblQuestionTypeLkp` (
  `QuestionTypeId` INT(11) NOT NULL AUTO_INCREMENT,
  `QuestionTypeDesc` TEXT NULL DEFAULT NULL,
  `CreateDate` DATETIME NULL DEFAULT NULL,
  `LastUpdate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`QuestionTypeId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblQuestionsLkp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblQuestionsLkp` (
  `QuestionId` INT(11) NOT NULL AUTO_INCREMENT,
  `QuestionCategoryId` INT(11) NULL DEFAULT NULL,
  `QuestionTypeId` INT(11) NULL DEFAULT NULL,
  `Question` TEXT NULL DEFAULT NULL,
  `QuestionIsVisible` TINYINT(1) NULL DEFAULT NULL,
  `QuestionCreateDate` DATETIME NULL DEFAULT NULL,
  `QuestionLastUpdate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`QuestionId`),
  INDEX `fk_question_category_idx` (`QuestionCategoryId` ASC),
  INDEX `fk_questiontype_question_idx` (`QuestionTypeId` ASC),
  CONSTRAINT `fk_questiontype_question`
    FOREIGN KEY (`QuestionTypeId`)
    REFERENCES `employee_performance`.`TblQuestionTypeLkp` (`QuestionTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_category`
    FOREIGN KEY (`QuestionCategoryId`)
    REFERENCES `employee_performance`.`TblCategoriesLkp` (`CategoryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_type_id`
    FOREIGN KEY (`QuestionTypeId`)
    REFERENCES `employee_performance`.`TblQuestionTypeLkp` (`QuestionTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 65
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblAnswers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblAnswers` (
  `AnswerId` INT(10) NOT NULL AUTO_INCREMENT,
  `QuestionId` INT(10) NULL DEFAULT NULL,
  `EmpId` INT(10) NULL DEFAULT NULL,
  `EvalMasterId` INT(10) NULL DEFAULT NULL,
  `AnswerCategoryId` INT(10) NULL DEFAULT NULL,
  `Answer` TEXT NULL DEFAULT NULL,
  `AnswerCreateDate` DATETIME NOT NULL,
  PRIMARY KEY (`AnswerId`),
  INDEX `fk_questionid_idx` (`QuestionId` ASC),
  INDEX `fk_categoryid_idx` (`AnswerCategoryId` ASC),
  INDEX `fk_evalmasterid_idx` (`EvalMasterId` ASC),
  INDEX `fk_emp_idx` (`EmpId` ASC),
  CONSTRAINT `fk_categoryid`
    FOREIGN KEY (`AnswerCategoryId`)
    REFERENCES `employee_performance`.`TblCategoriesLkp` (`CategoryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emp`
    FOREIGN KEY (`EmpId`)
    REFERENCES `employee_performance`.`TblEmployees` (`EmpId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evalmaster`
    FOREIGN KEY (`EvalMasterId`)
    REFERENCES `employee_performance`.`TblEvaluationMaster` (`EvalMasterId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_questionid`
    FOREIGN KEY (`QuestionId`)
    REFERENCES `employee_performance`.`TblQuestionsLkp` (`QuestionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 23772
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblCountryLkp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblCountryLkp` (
  `CountryId` INT(11) NOT NULL AUTO_INCREMENT,
  `Country` VARCHAR(45) NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `UpdatedDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CountryId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblDepartmentLkp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblDepartmentLkp` (
  `DepartmentId` INT(11) NOT NULL AUTO_INCREMENT,
  `Department` VARCHAR(45) NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `UpdatedDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DepartmentId`))
ENGINE = MyISAM
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblEmpDepartment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblEmpDepartment` (
  `EmpDepartmentId` INT(11) NOT NULL AUTO_INCREMENT,
  `EmpId` INT(11) NULL DEFAULT NULL,
  `DepartmentId` INT(11) NULL DEFAULT NULL,
  `CreateDate` DATETIME NULL DEFAULT NULL,
  `UpdateDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EmpDepartmentId`))
ENGINE = MyISAM
AUTO_INCREMENT = 41
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblEmpLocation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblEmpLocation` (
  `EmpLocationId` INT(11) NOT NULL AUTO_INCREMENT,
  `LocationId` INT(11) NULL DEFAULT NULL,
  `EmpId` INT(11) NULL DEFAULT NULL,
  `CreateDate` DATETIME NULL DEFAULT NULL,
  `UpdateDate` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`EmpLocationId`))
ENGINE = MyISAM
AUTO_INCREMENT = 42
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblPwcApplicationsLkp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblPwcApplicationsLkp` (
  `ApplicationId` INT(11) NOT NULL AUTO_INCREMENT,
  `ApplicationName` VARCHAR(45) NULL DEFAULT NULL,
  `ApplicationDesc` VARCHAR(45) NULL DEFAULT NULL,
  `CreateDate` DATETIME NULL DEFAULT NULL,
  `LastUpdate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ApplicationId`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblEmployeeAccess`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblEmployeeAccess` (
  `EmployeeAccessId` INT(11) NOT NULL AUTO_INCREMENT,
  `EmpId` INT(11) NULL DEFAULT NULL,
  `AccessId` INT(11) NULL DEFAULT NULL,
  `ApplicationId` INT(11) NULL DEFAULT NULL,
  `CreateDate` DATETIME NULL DEFAULT NULL,
  `LastUpdate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` INT(11) NULL DEFAULT NULL,
  `UpdatedBy` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeAccessId`),
  INDEX `fk_empid_idx` (`EmpId` ASC),
  INDEX `fk_accessid_idx` (`AccessId` ASC),
  INDEX `fk_applicationid_idx` (`ApplicationId` ASC),
  CONSTRAINT `fk_accessid`
    FOREIGN KEY (`AccessId`)
    REFERENCES `employee_performance`.`TblAccessLkp` (`AccessId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_applicationid`
    FOREIGN KEY (`ApplicationId`)
    REFERENCES `employee_performance`.`TblPwcApplicationsLkp` (`ApplicationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empid`
    FOREIGN KEY (`EmpId`)
    REFERENCES `employee_performance`.`TblEmployees` (`EmpId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblEmployeeTypeLkp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblEmployeeTypeLkp` (
  `EmployeeTypeId` INT(11) NOT NULL AUTO_INCREMENT,
  `EmployeeType` VARCHAR(45) NULL DEFAULT NULL,
  `EmployeeTypeDesc` VARCHAR(45) NULL DEFAULT NULL,
  `CreateDate` DATETIME NULL DEFAULT NULL,
  `LastUpdate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EmployeeTypeId`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblErrorLogs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblErrorLogs` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `errno` INT(2) NOT NULL,
  `errtype` VARCHAR(32) NOT NULL,
  `errstr` TEXT NOT NULL,
  `errfile` VARCHAR(255) NOT NULL,
  `errline` INT(4) NOT NULL,
  `time` DATETIME NOT NULL,
  `ErrorTime` DATETIME NOT NULL,
  `UserId` INT(11) NOT NULL,
  `ErrorSeverity` INT(11) NOT NULL,
  `ErrorPageName` VARCHAR(50) NOT NULL,
  `ErrorProcedureName` VARCHAR(50) NOT NULL,
  `ErrorMessage` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 236390
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblEvaluation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblEvaluation` (
  `EvalId` INT(10) NOT NULL AUTO_INCREMENT,
  `EvaluatorId` INT(10) NULL DEFAULT NULL,
  `EvalMasterId` INT(10) NULL DEFAULT NULL,
  `EvalStatus` INT(10) NULL DEFAULT NULL,
  `EvalCreatedBy` INT(10) NULL DEFAULT NULL,
  `EvalCreateDate` DATETIME NULL DEFAULT NULL,
  `EvalUpdatedBy` INT(10) NULL DEFAULT NULL,
  `EvalUpdatedDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EvalOverAllPerfRating` INT(11) NULL DEFAULT NULL,
  `EvalContributionLevel` INT(11) NULL DEFAULT NULL,
  `EvaluatorComments` TEXT NOT NULL,
  `EvalGoalsAndObj` TEXT NOT NULL,
  `EvalGoalsObjResults` TEXT NOT NULL,
  `EvalPerformanceDevelopPlans` TEXT NOT NULL,
  `EvalNextPeriodObj` TEXT NOT NULL,
  `EvalNextPeriodResults` TEXT NOT NULL,
  `EvalTrainingClasses` TEXT NOT NULL,
  `EvalAppropriateAttendance` TEXT NOT NULL,
  PRIMARY KEY (`EvalId`),
  INDEX `fk_evaluatorid_idx` (`EvaluatorId` ASC),
  INDEX `fk_statusid_idx` (`EvalStatus` ASC),
  INDEX `fk_evalmasterid_idx` (`EvalMasterId` ASC),
  CONSTRAINT `fk_evalmasterid`
    FOREIGN KEY (`EvalMasterId`)
    REFERENCES `employee_performance`.`TblEvaluationMaster` (`EvalMasterId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evalstatus`
    FOREIGN KEY (`EvalStatus`)
    REFERENCES `employee_performance`.`TblEvaluationStatusLkp` (`EvalStatusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evalutorid`
    FOREIGN KEY (`EvaluatorId`)
    REFERENCES `employee_performance`.`TblEmployees` (`EmpId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 207
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblExcerciseLkp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblExcerciseLkp` (
  `ExcerciseId` INT(11) NOT NULL AUTO_INCREMENT,
  `ExcerciseCategoryId` INT(11) NULL DEFAULT NULL,
  `ExcerciseName` VARCHAR(45) NULL DEFAULT NULL,
  `CreateDate` DATETIME NULL DEFAULT NULL,
  `LastUpdate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ExcerciseId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblJobTitleLkp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblJobTitleLkp` (
  `JobTitleId` INT(11) NOT NULL AUTO_INCREMENT,
  `JobTitle` VARCHAR(45) NOT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `UpdatedDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`JobTitleId`))
ENGINE = MyISAM
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblLkpStates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblLkpStates` (
  `dst_id` INT(11) NOT NULL AUTO_INCREMENT,
  `dst_dc_id` INT(11) NOT NULL,
  `dst_iso_code` VARCHAR(6) NULL DEFAULT NULL,
  `dst_iso` VARCHAR(100) NULL DEFAULT NULL,
  `dst_name` VARCHAR(255) NULL DEFAULT NULL,
  `dst_printable_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`dst_id`),
  INDEX `dst_dc_id` (`dst_dc_id` ASC),
  INDEX `dst_iso_code` (`dst_iso_code` ASC),
  INDEX `dst_iso` (`dst_iso` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 4058
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblLocationLkp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblLocationLkp` (
  `LocationId` INT(11) NOT NULL AUTO_INCREMENT,
  `Location` VARCHAR(45) NULL DEFAULT NULL,
  `CreateDate` DATETIME NULL DEFAULT NULL,
  `UpdateDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LocationId`))
ENGINE = MyISAM
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblMaintenance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblMaintenance` (
  `MaintainId` INT(11) NOT NULL AUTO_INCREMENT,
  `MaintainFlag` TINYINT(1) NULL DEFAULT NULL,
  `MaintainTime` DATETIME NULL DEFAULT NULL,
  `MaintainLastUpdate` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`MaintainId`))
ENGINE = MyISAM
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblPerformance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblPerformance` (
  `PerformanceId` INT(11) NOT NULL AUTO_INCREMENT,
  `EmpId` INT(11) NULL DEFAULT NULL,
  `EmployeeSignature` VARCHAR(45) NULL DEFAULT NULL,
  `EmployeeSignDate` DATETIME NULL DEFAULT NULL,
  `SupervisorSignature` VARCHAR(45) NULL DEFAULT NULL,
  `SupervisorSignDate` DATETIME NULL DEFAULT NULL,
  `DepatmentHeadSignature` VARCHAR(45) NULL DEFAULT NULL,
  `DepartmentHeadSignDate` DATETIME NULL DEFAULT NULL,
  `PerformanceReqCreateDate` DATETIME NULL DEFAULT NULL,
  `PerformaceReqUpdateDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PerformanceId`),
  INDEX `fk_empid_idx` (`EmpId` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblSessions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblSessions` (
  `session_id` VARCHAR(40) NOT NULL,
  `ip_address` VARCHAR(45) NOT NULL,
  `user_agent` VARCHAR(120) NOT NULL,
  `last_activity` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` TEXT NOT NULL,
  PRIMARY KEY (`session_id`),
  INDEX `last_activity_idx` (`last_activity` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblStatesLkp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblStatesLkp` (
  `StateId` INT(11) NOT NULL AUTO_INCREMENT,
  `CountryId` INT(11) NULL DEFAULT NULL,
  `State` VARCHAR(45) NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `UpdatedDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`StateId`),
  INDEX `fk_countryid_idx` (`CountryId` ASC),
  CONSTRAINT `fk_countryid`
    FOREIGN KEY (`CountryId`)
    REFERENCES `employee_performance`.`TblCountryLkp` (`CountryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_performance`.`TblUserActivityLog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_performance`.`TblUserActivityLog` (
  `UserActivityId` INT(10) NOT NULL AUTO_INCREMENT,
  `UserId` INT(10) NOT NULL DEFAULT '0',
  `UserLoginTime` DATETIME NOT NULL,
  `IPAddress` VARCHAR(50) NOT NULL,
  `SessionId` VARCHAR(50) NOT NULL,
  `BrowserDetails` VARCHAR(50) NOT NULL,
  `UserLogOutTime` DATETIME NOT NULL,
  PRIMARY KEY (`UserActivityId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
