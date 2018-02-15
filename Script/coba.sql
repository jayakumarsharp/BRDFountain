-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.56 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for coba
CREATE DATABASE IF NOT EXISTS `coba` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `coba`;

-- Dumping structure for procedure coba.Get_Mapped_Mail_Task
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Mapped_Mail_Task`(
	IN `i_tasktype` VARCHAR(5)


)
BEGIN

select ot.Id, ot.UniqueEmailId, ot.EmailId, ot.ClientNumber, ot.EmailSubject, ot.EmailContent, ot.EmailAttachment, ot.IsMappedToTask, 
ot.IsActive, ot.IsProcessed, ot.TaskId,t.Name, ot.TaskAttachement, ot.TaskComments, ot.CreatedDate, ot.CreatedBy, ot.TaskAssignedBy,
 ot.TaskAssignedDate, ot.LastModifiedDate, ot.LastModifiedBy  from tbl_onboarding_task ot left join tbl_task t on ot.TaskId=t.Id 
where ot.IsMappedToTask =i_tasktype;

END//
DELIMITER ;

-- Dumping structure for procedure coba.Get_Tasks
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Tasks`()
BEGIN
Select Id,Name,Description,IsSignOff,SignOffDate,SignoffBy,IsActive from tbl_task;
END//
DELIMITER ;

-- Dumping structure for procedure coba.Get_TasksById
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_TasksById`(
	IN `TaskId` INT
)
BEGIN
Select Id,Name,Description,IsSignOff,SignOffDate,SignoffBy,IsActive from tbl_task where Id=TaskId; 
END//
DELIMITER ;

-- Dumping structure for procedure coba.SP_GetClients
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetClients`()
BEGIN
SELECT Id, ClientNumber, InvDevLoan, ObligorName, StrChartAttchd, OriginalLender, LCompanyName, LRegAddressL1, LRegAddressL2, LRegAddressL3, LRegAddressEmail, LRegAddressTelNum, LRegAddressCity, LRegAddressState, LRegAddressCountry, LRegAddressPostCode, LPriAddressL1, LPriAddressL2, LPriAddressL3, LPriAddressEmail, LPriAddressTelNum, LPriAddressCity, LPriAddressState, LPriAddressCountry, LPriAddressPostCode, LKC1L1, LKC1L2, LKC1L3, LKC1Email, LKC1TelNum, LKC1City, LKC1State, LKC1Country, LKC1PostCode, LKC2L1, LKC2L2, LKC2L3, LKC2Email, LKC2TelNum, LKC2City, LKC2State, LKC2Country, LKC2PostCode, LKC3L1, LKC3L2, LKC3L3, LKC3Email, LKC3TelNum, LKC3City, LKC3State, LKC3Country, LKC3PostCode, LKC4L1, LKC4L2, LKC4L3, LKC4Email, LKC4TelNum, LKC4City, LKC4State, LKC4Country, LKC4PostCode, LKC5L1, LKC5L2, LKC5L3, LKC5Email, LKC5TelNum, LKC5City, LKC5State, LKC5Country, LKC5PostCode, BCompanyName, BRegAddressL1, BRegAddressL2, BRegAddressL3, BRegAddressEmail, BRegAddressTelNum, BRegAddressCity, BRegAddressState, BRegAddressCountry, BRegAddressPostCode, BPriAddressL1, BPriAddressL2, BPriAddressL3, BPriAddressEmail, BPriAddressTelNum, BPriAddressCity, BPriAddressState, BPriAddressCountry, BPriAddressPostCode, BKC1L1, BKC1L2, BKC1L3, BKC1Email, BKC1TelNum, BKC1City, BKC1State, BKC1Country, BKC1PostCode, BKC2L1, BKC2L2, BKC2L3, BKC2Email, BKC2TelNum, BKC2City, BKC2State, BKC2Country, BKC2PostCode, BKC3L1, BKC3L2, BKC3L3, BKC3Email, BKC3TelNum, BKC3City, BKC3State, BKC3Country, BKC3PostCode, BKC4L1, BKC4L2, BKC4L3, BKC4Email, BKC4TelNum, BKC4City, BKC4State, BKC4Country, BKC4PostCode, BKC5L1, BKC5L2, BKC5L3, BKC5Email, BKC5TelNum, BKC5City, BKC5State, BKC5Country, BKC5PostCode, ProposedDealCommencementDate, PropAddress1L1, PropAddress1L2, PropAddress1L3, PropAddress1Email, PropAddress1TelNum, PropAddress1City, PropAddress1State, PropAddress1Country, PropAddress1PostCode, PropAddress2L1, PropAddress2L2, PropAddress2L3, PropAddress2Email, PropAddress2TelNum, PropAddress2City, PropAddress2State, PropAddress2Country, PropAddress2PostCode, PropAddress3L1, PropAddress3L2, PropAddress3L3, PropAddress3Email, PropAddress3TelNum, PropAddress3City, PropAddress3State, PropAddress3Country, PropAddress3PostCode, PropAddress4L1, PropAddress4L2, PropAddress4L3, PropAddress4Email, PropAddress4TelNum, PropAddress4City, PropAddress4State, PropAddress4Country, PropAddress4PostCode, PropAddress5L1, PropAddress5L2, PropAddress5L3, PropAddress5Email, PropAddress5TelNum, PropAddress5City, PropAddress5State, PropAddress5Country, PropAddress5PostCode, LoanDateAggrmnt, FirstUtilisationDate, AmountAdvancedonFUD, OriginalCommitmentAmount, FirstInterestPaymentDate, PaymentFrequency, IsSignOff, SignOffDate, SignoffBy, IsActive, CreatedDate, CreatedBy, LastModifiedDate, LastModifiedBy FROM TBL_CLIENT;
END//
DELIMITER ;

-- Dumping structure for procedure coba.SP_GetClientsById
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetClientsById`(
	IN `i_ClientNumber` VARCHAR(250)
)
BEGIN
SELECT Id, ClientNumber, InvDevLoan, ObligorName, StrChartAttchd, OriginalLender, LCompanyName, LRegAddressL1, LRegAddressL2, LRegAddressL3, LRegAddressEmail, LRegAddressTelNum, LRegAddressCity, LRegAddressState, LRegAddressCountry, LRegAddressPostCode, LPriAddressL1, LPriAddressL2, LPriAddressL3, LPriAddressEmail, LPriAddressTelNum, LPriAddressCity, LPriAddressState, LPriAddressCountry, LPriAddressPostCode, LKC1L1, LKC1L2, LKC1L3, LKC1Email, LKC1TelNum, LKC1City, LKC1State, LKC1Country, LKC1PostCode, LKC2L1, LKC2L2, LKC2L3, LKC2Email, LKC2TelNum, LKC2City, LKC2State, LKC2Country, LKC2PostCode, LKC3L1, LKC3L2, LKC3L3, LKC3Email, LKC3TelNum, LKC3City, LKC3State, LKC3Country, LKC3PostCode, LKC4L1, LKC4L2, LKC4L3, LKC4Email, LKC4TelNum, LKC4City, LKC4State, LKC4Country, LKC4PostCode, LKC5L1, LKC5L2, LKC5L3, LKC5Email, LKC5TelNum, LKC5City, LKC5State, LKC5Country, LKC5PostCode, BCompanyName, BRegAddressL1, BRegAddressL2, BRegAddressL3, BRegAddressEmail, BRegAddressTelNum, BRegAddressCity, BRegAddressState, BRegAddressCountry, BRegAddressPostCode, BPriAddressL1, BPriAddressL2, BPriAddressL3, BPriAddressEmail, BPriAddressTelNum, BPriAddressCity, BPriAddressState, BPriAddressCountry, BPriAddressPostCode, BKC1L1, BKC1L2, BKC1L3, BKC1Email, BKC1TelNum, BKC1City, BKC1State, BKC1Country, BKC1PostCode, BKC2L1, BKC2L2, BKC2L3, BKC2Email, BKC2TelNum, BKC2City, BKC2State, BKC2Country, BKC2PostCode, BKC3L1, BKC3L2, BKC3L3, BKC3Email, BKC3TelNum, BKC3City, BKC3State, BKC3Country, BKC3PostCode, BKC4L1, BKC4L2, BKC4L3, BKC4Email, BKC4TelNum, BKC4City, BKC4State, BKC4Country, BKC4PostCode, BKC5L1, BKC5L2, BKC5L3, BKC5Email, BKC5TelNum, BKC5City, BKC5State, BKC5Country, BKC5PostCode, ProposedDealCommencementDate, PropAddress1L1, PropAddress1L2, PropAddress1L3, PropAddress1Email, PropAddress1TelNum, PropAddress1City, PropAddress1State, PropAddress1Country, PropAddress1PostCode, PropAddress2L1, PropAddress2L2, PropAddress2L3, PropAddress2Email, PropAddress2TelNum, PropAddress2City, PropAddress2State, PropAddress2Country, PropAddress2PostCode, PropAddress3L1, PropAddress3L2, PropAddress3L3, PropAddress3Email, PropAddress3TelNum, PropAddress3City, PropAddress3State, PropAddress3Country, PropAddress3PostCode, PropAddress4L1, PropAddress4L2, PropAddress4L3, PropAddress4Email, PropAddress4TelNum, PropAddress4City, PropAddress4State, PropAddress4Country, PropAddress4PostCode, PropAddress5L1, PropAddress5L2, PropAddress5L3, PropAddress5Email, PropAddress5TelNum, PropAddress5City, PropAddress5State, PropAddress5Country, PropAddress5PostCode, LoanDateAggrmnt, FirstUtilisationDate, AmountAdvancedonFUD, OriginalCommitmentAmount, FirstInterestPaymentDate, PaymentFrequency, IsSignOff, SignOffDate, SignoffBy, IsActive, CreatedDate, CreatedBy, LastModifiedDate, LastModifiedBy FROM TBL_CLIENT WHERE ClientNumber=i_ClientNumber;
END//
DELIMITER ;

-- Dumping structure for procedure coba.SP_GetMapTask
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetMapTask`()
BEGIN
select ot.Id, ot.UniqueEmailId, ot.EmailId, ot.ClientNumber, ot.EmailSubject, ot.EmailContent, ot.EmailAttachment, ot.IsMappedToTask, 
ot.IsActive, ot.IsProcessed, ot.TaskId,t.Name, ot.TaskAttachement, ot.TaskComments, ot.CreatedDate, ot.CreatedBy, ot.TaskAssignedBy,
 ot.TaskAssignedDate, ot.LastModifiedDate, ot.LastModifiedBy  from tbl_onboarding_task ot left join tbl_task t on ot.TaskId=t.Id ;


END//
DELIMITER ;

-- Dumping structure for procedure coba.SP_GetMapTaskbyId
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetMapTaskbyId`(
	IN `i_Id` INT

)
BEGIN
	select ot.Id, ot.UniqueEmailId, ot.EmailId, ot.ClientNumber, ot.EmailSubject, ot.EmailContent, ot.EmailAttachment, ot.IsMappedToTask, 
ot.IsActive, ot.IsProcessed, ot.TaskId,t.Name, ot.TaskAttachement, ot.TaskComments, ot.CreatedDate, ot.CreatedBy, ot.TaskAssignedBy,
 ot.TaskAssignedDate, ot.LastModifiedDate, ot.LastModifiedBy  from tbl_onboarding_task ot left join tbl_task t on ot.TaskId=t.Id 
where ot.Id=i_id;

END//
DELIMITER ;

-- Dumping structure for procedure coba.SP_GetOnboardingTask
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetOnboardingTask`()
BEGIN
select ot.Id, ot.UniqueEmailId, ot.EmailId, ot.ClientNumber, ot.EmailSubject, ot.EmailContent, ot.EmailAttachment, ot.IsMappedToTask, 
ot.IsActive, ot.IsProcessed, ot.TaskId,t.Name, ot.TaskAttachement, ot.TaskComments, ot.CreatedDate, ot.CreatedBy, ot.TaskAssignedBy,
 ot.TaskAssignedDate, ot.LastModifiedDate, ot.LastModifiedBy  from tbl_onboarding_task ot left join tbl_task t on ot.TaskId=t.Id;

END//
DELIMITER ;

-- Dumping structure for procedure coba.SP_GetOnboardingTaskbyId
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetOnboardingTaskbyId`(
	IN `i_Id` INT


)
BEGIN

select ot.Id, ot.UniqueEmailId, ot.EmailId, ot.ClientNumber, ot.EmailSubject, ot.EmailContent, ot.EmailAttachment, ot.IsMappedToTask, 
ot.IsActive, ot.IsProcessed, ot.TaskId,t.Name, ot.TaskAttachement, ot.TaskComments, ot.CreatedDate, ot.CreatedBy, ot.TaskAssignedBy,
 ot.TaskAssignedDate, ot.LastModifiedDate, ot.LastModifiedBy  from tbl_onboarding_task ot left join tbl_task t on ot.TaskId=t.Id 
Where ot.Id=i_Id;
END//
DELIMITER ;

-- Dumping structure for procedure coba.sp_insert_Client
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_Client`(
	IN `i_ClientNumber` VARCHAR(250),
	IN `i_InvDevLoan` VARCHAR(250),
	IN `i_ObligorName` VARCHAR(250),
	IN `i_StrChartAttchd` VARCHAR(250),
	IN `i_OriginalLender` VARCHAR(250),
	IN `i_LCompanyName` VARCHAR(250),
	IN `i_LRegAddressL1` VARCHAR(250),
	IN `i_LRegAddressL2` VARCHAR(250),
	IN `i_LRegAddressL3` VARCHAR(250),
	IN `i_LRegAddressEmail` VARCHAR(250),
	IN `i_LRegAddressTelNum` VARCHAR(250),
	IN `i_LRegAddressCity` VARCHAR(250),
	IN `i_LRegAddressState` VARCHAR(250),
	IN `i_LRegAddressCountry` VARCHAR(250),
	IN `i_LRegAddressPostCode` VARCHAR(250),
	IN `i_LPriAddressL1` VARCHAR(250),
	IN `i_LPriAddressL2` VARCHAR(250),
	IN `i_LPriAddressL3` VARCHAR(250),
	IN `i_LPriAddressEmail` VARCHAR(250),
	IN `i_LPriAddressTelNum` VARCHAR(250),
	IN `i_LPriAddressCity` VARCHAR(250),
	IN `i_LPriAddressState` VARCHAR(250),
	IN `i_LPriAddressCountry` VARCHAR(250),
	IN `i_LPriAddressPostCode` VARCHAR(250),
	IN `i_LKC1L1` VARCHAR(250),
	IN `i_LKC1L2` VARCHAR(250),
	IN `i_LKC1L3` VARCHAR(250),
	IN `i_LKC1Email` VARCHAR(250),
	IN `i_LKC1TelNum` VARCHAR(250),
	IN `i_LKC1City` VARCHAR(250),
	IN `i_LKC1State` VARCHAR(250),
	IN `i_LKC1Country` VARCHAR(250),
	IN `i_LKC1PostCode` VARCHAR(250),
	IN `i_LKC2L1` VARCHAR(250),
	IN `i_LKC2L2` VARCHAR(250),
	IN `i_LKC2L3` VARCHAR(250),
	IN `i_LKC2Email` VARCHAR(250),
	IN `i_LKC2TelNum` VARCHAR(250),
	IN `i_LKC2City` VARCHAR(250),
	IN `i_LKC2State` VARCHAR(250),
	IN `i_LKC2Country` VARCHAR(250),
	IN `i_LKC2PostCode` VARCHAR(250),
	IN `i_LKC3L1` VARCHAR(250),
	IN `i_LKC3L2` VARCHAR(250),
	IN `i_LKC3L3` VARCHAR(250),
	IN `i_LKC3Email` VARCHAR(250),
	IN `i_LKC3TelNum` VARCHAR(250),
	IN `i_LKC3City` VARCHAR(250),
	IN `i_LKC3State` VARCHAR(250),
	IN `i_LKC3Country` VARCHAR(250),
	IN `i_LKC3PostCode` VARCHAR(250),
	IN `i_LKC4L1` VARCHAR(250),
	IN `i_LKC4L2` VARCHAR(250),
	IN `i_LKC4L3` VARCHAR(250),
	IN `i_LKC4Email` VARCHAR(250),
	IN `i_LKC4TelNum` VARCHAR(250),
	IN `i_LKC4City` VARCHAR(250),
	IN `i_LKC4State` VARCHAR(250),
	IN `i_LKC4Country` VARCHAR(250),
	IN `i_LKC4PostCode` VARCHAR(250),
	IN `i_LKC5L1` VARCHAR(250),
	IN `i_LKC5L2` VARCHAR(250),
	IN `i_LKC5L3` VARCHAR(250),
	IN `i_LKC5Email` VARCHAR(250),
	IN `i_LKC5TelNum` VARCHAR(250),
	IN `i_LKC5City` VARCHAR(250),
	IN `i_LKC5State` VARCHAR(250),
	IN `i_LKC5Country` VARCHAR(250),
	IN `i_LKC5PostCode` VARCHAR(250),
	IN `i_BCompanyName` VARCHAR(250),
	IN `i_BRegAddressL1` VARCHAR(250),
	IN `i_BRegAddressL2` VARCHAR(250),
	IN `i_BRegAddressL3` VARCHAR(250),
	IN `i_BRegAddressEmail` VARCHAR(250),
	IN `i_BRegAddressTelNum` VARCHAR(250),
	IN `i_BRegAddressCity` VARCHAR(250),
	IN `i_BRegAddressState` VARCHAR(250),
	IN `i_BRegAddressCountry` VARCHAR(250),
	IN `i_BRegAddressPostCode` VARCHAR(250),
	IN `i_BPriAddressL1` VARCHAR(250),
	IN `i_BPriAddressL2` VARCHAR(250),
	IN `i_BPriAddressL3` VARCHAR(250),
	IN `i_BPriAddressEmail` VARCHAR(250),
	IN `i_BPriAddressTelNum` VARCHAR(250),
	IN `i_BPriAddressCity` VARCHAR(250),
	IN `i_BPriAddressState` VARCHAR(250),
	IN `i_BPriAddressCountry` VARCHAR(250),
	IN `i_BPriAddressPostCode` VARCHAR(250),
	IN `i_BKC1L1` VARCHAR(250),
	IN `i_BKC1L2` VARCHAR(250),
	IN `i_BKC1L3` VARCHAR(250),
	IN `i_BKC1Email` VARCHAR(250),
	IN `i_BKC1TelNum` VARCHAR(250),
	IN `i_BKC1City` VARCHAR(250),
	IN `i_BKC1State` VARCHAR(250),
	IN `i_BKC1Country` VARCHAR(250),
	IN `i_BKC1PostCode` VARCHAR(250),
	IN `i_BKC2L1` VARCHAR(250),
	IN `i_BKC2L2` VARCHAR(250),
	IN `i_BKC2L3` VARCHAR(250),
	IN `i_BKC2Email` VARCHAR(250),
	IN `i_BKC2TelNum` VARCHAR(250),
	IN `i_BKC2City` VARCHAR(250),
	IN `i_BKC2State` VARCHAR(250),
	IN `i_BKC2Country` VARCHAR(250),
	IN `i_BKC2PostCode` VARCHAR(250),
	IN `i_BKC3L1` VARCHAR(250),
	IN `i_BKC3L2` VARCHAR(250),
	IN `i_BKC3L3` VARCHAR(250),
	IN `i_BKC3Email` VARCHAR(250),
	IN `i_BKC3TelNum` VARCHAR(250),
	IN `i_BKC3City` VARCHAR(250),
	IN `i_BKC3State` VARCHAR(250),
		IN  `i_BKC3Country` VARCHAR(250),
	IN `i_BKC3PostCode` VARCHAR(250),
	IN `i_BKC4L1` VARCHAR(250),
	IN `i_BKC4L2` VARCHAR(250),
	IN `i_BKC4L3` VARCHAR(250),
	IN `i_BKC4Email` VARCHAR(250),
	IN `i_BKC4TelNum` VARCHAR(250),
	IN `i_BKC4City` VARCHAR(250),
	IN `i_BKC4State` VARCHAR(250),
	IN `i_BKC4Country` VARCHAR(250),
	IN `i_BKC4PostCode` VARCHAR(250),
	IN `i_BKC5L1` VARCHAR(250),
	IN `i_BKC5L2` VARCHAR(250),
	IN `i_BKC5L3` VARCHAR(250),
	IN `i_BKC5Email` VARCHAR(250),
	IN `i_BKC5TelNum` VARCHAR(250),
	IN `i_BKC5City` VARCHAR(250),
	IN `i_BKC5State` VARCHAR(250),
	IN `i_BKC5Country` VARCHAR(250),
	IN `i_BKC5PostCode` VARCHAR(250),
	IN `i_ProposedDealCommencementDate` Date,
	IN `i_PropAddress1L1` VARCHAR(250),
	IN `i_PropAddress1L2` VARCHAR(250),
	IN `i_PropAddress1L3` VARCHAR(250),
	IN `i_PropAddress1Email` VARCHAR(250),
	IN `i_PropAddress1TelNum` VARCHAR(250),
	IN `i_PropAddress1City` VARCHAR(250),
	IN `i_PropAddress1State` VARCHAR(250),
	IN `i_PropAddress1Country` VARCHAR(250),
	IN `i_PropAddress1PostCode` VARCHAR(250),
	IN  `i_PropAddress2L1`  VARCHAR(250),
	IN  `i_PropAddress2L2`  VARCHAR(250),
	IN  `i_PropAddress2L3`  VARCHAR(250),
	IN `i_PropAddress2Email` VARCHAR(250),
	IN `i_PropAddress2TelNum` VARCHAR(250),
	IN `i_PropAddress2City` VARCHAR(250),
	IN `i_PropAddress2State` VARCHAR(250),
	IN `i_PropAddress2Country` VARCHAR(250),
	IN `i_PropAddress2PostCode` VARCHAR(250),
	IN `i_PropAddress3L1` VARCHAR(250),
	IN `i_PropAddress3L2` VARCHAR(250),
	IN `i_PropAddress3L3` VARCHAR(250),
	IN `i_PropAddress3Email` VARCHAR(250),
	IN `i_PropAddress3TelNum` VARCHAR(250),
	IN `i_PropAddress3City` VARCHAR(250),
	IN `i_PropAddress3State` VARCHAR(250),
	IN `i_PropAddress3Country` VARCHAR(250),
	IN `i_PropAddress3PostCode` VARCHAR(250),
	IN `i_PropAddress4L1` VARCHAR(250),
	IN `i_PropAddress4L2` VARCHAR(250),
	IN `i_PropAddress4L3` VARCHAR(250),
	IN `i_PropAddress4Email` VARCHAR(250),
	IN `i_PropAddress4TelNum` VARCHAR(250),
	IN `i_PropAddress4City` VARCHAR(250),
	IN `i_PropAddress4State` VARCHAR(250),
	IN `i_PropAddress4Country` VARCHAR(250),
	IN `i_PropAddress4PostCode` VARCHAR(250),
	IN `i_PropAddress5L1` VARCHAR(250),
	IN `i_PropAddress5L2` VARCHAR(250),
	IN `i_PropAddress5L3` VARCHAR(250),
	IN `i_PropAddress5Email` VARCHAR(250),
	IN `i_PropAddress5TelNum` VARCHAR(250),
	IN `i_PropAddress5City` VARCHAR(250),
	IN `i_PropAddress5State` VARCHAR(250),
	IN `i_PropAddress5Country` VARCHAR(250),
	IN `i_PropAddress5PostCode` VARCHAR(250),
	IN `i_LoanDateAggrmnt` Date,
	IN `i_FirstUtilisationDate` Date,
	IN `i_AmountAdvancedonFUD` Double,
	IN `i_OriginalCommitmentAmount` Double,
	IN `i_FirstInterestPaymentDate` Date,
	IN `i_PaymentFrequency`int,
	IN `i_IsSignOff` varchar(100),
	IN `i_SignOffDate` Datetime,
	IN `i_SignoffBy` varchar(250),
	IN `i_IsActive` varchar(10)
)
BEGIN
insert into tbl_client (ClientNumber, InvDevLoan, ObligorName, StrChartAttchd, OriginalLender, LCompanyName, LRegAddressL1, LRegAddressL2, LRegAddressL3, LRegAddressEmail, LRegAddressTelNum, LRegAddressCity, LRegAddressState, LRegAddressCountry, LRegAddressPostCode, LPriAddressL1, LPriAddressL2, LPriAddressL3, LPriAddressEmail, LPriAddressTelNum, LPriAddressCity, LPriAddressState, LPriAddressCountry, LPriAddressPostCode, LKC1L1, LKC1L2, LKC1L3, LKC1Email, LKC1TelNum, LKC1City, LKC1State, LKC1Country, LKC1PostCode, LKC2L1, LKC2L2, LKC2L3, LKC2Email, LKC2TelNum, LKC2City, LKC2State, LKC2Country, LKC2PostCode, LKC3L1, LKC3L2, LKC3L3, LKC3Email, LKC3TelNum, LKC3City, LKC3State, LKC3Country, LKC3PostCode, LKC4L1, LKC4L2, LKC4L3, LKC4Email, LKC4TelNum, LKC4City, LKC4State, LKC4Country, LKC4PostCode, LKC5L1, LKC5L2, LKC5L3, LKC5Email, LKC5TelNum, LKC5City, LKC5State, LKC5Country, LKC5PostCode, BCompanyName, BRegAddressL1, BRegAddressL2, BRegAddressL3, BRegAddressEmail, BRegAddressTelNum, BRegAddressCity, BRegAddressState, BRegAddressCountry, BRegAddressPostCode, BPriAddressL1, BPriAddressL2, BPriAddressL3, BPriAddressEmail, BPriAddressTelNum, BPriAddressCity, BPriAddressState, BPriAddressCountry, BPriAddressPostCode, BKC1L1, BKC1L2, BKC1L3, BKC1Email, BKC1TelNum, BKC1City, BKC1State, BKC1Country, BKC1PostCode, BKC2L1, BKC2L2, BKC2L3, BKC2Email, BKC2TelNum, BKC2City, BKC2State, BKC2Country, BKC2PostCode, BKC3L1, BKC3L2, BKC3L3, BKC3Email, BKC3TelNum, BKC3City, BKC3State, BKC3Country, BKC3PostCode, BKC4L1, BKC4L2, BKC4L3, BKC4Email, BKC4TelNum, BKC4City, BKC4State, BKC4Country, BKC4PostCode, BKC5L1, BKC5L2, BKC5L3, BKC5Email, BKC5TelNum, BKC5City, BKC5State, BKC5Country, BKC5PostCode, ProposedDealCommencementDate, PropAddress1L1, PropAddress1L2, PropAddress1L3, PropAddress1Email, PropAddress1TelNum, PropAddress1City, PropAddress1State, PropAddress1Country, PropAddress1PostCode, PropAddress2L1, PropAddress2L2, PropAddress2L3, PropAddress2Email, PropAddress2TelNum, PropAddress2City, PropAddress2State, PropAddress2Country, PropAddress2PostCode, PropAddress3L1, PropAddress3L2, PropAddress3L3, PropAddress3Email, PropAddress3TelNum, PropAddress3City, PropAddress3State, PropAddress3Country, PropAddress3PostCode, PropAddress4L1, PropAddress4L2, PropAddress4L3, PropAddress4Email, PropAddress4TelNum, PropAddress4City, PropAddress4State, PropAddress4Country, PropAddress4PostCode, PropAddress5L1, PropAddress5L2, PropAddress5L3, PropAddress5Email, PropAddress5TelNum, PropAddress5City, PropAddress5State, PropAddress5Country, PropAddress5PostCode, LoanDateAggrmnt, FirstUtilisationDate, AmountAdvancedonFUD, OriginalCommitmentAmount, FirstInterestPaymentDate, PaymentFrequency, IsSignOff, SignOffDate, SignoffBy, IsActive) 
values(i_ClientNumber, i_InvDevLoan, i_ObligorName, i_StrChartAttchd, i_OriginalLender, i_LCompanyName, i_LRegAddressL1, i_LRegAddressL2, i_LRegAddressL3, i_LRegAddressEmail, i_LRegAddressTelNum, i_LRegAddressCity, i_LRegAddressState, i_LRegAddressCountry, i_LRegAddressPostCode, i_LPriAddressL1, i_LPriAddressL2, i_LPriAddressL3, i_LPriAddressEmail, i_LPriAddressTelNum, i_LPriAddressCity, i_LPriAddressState, i_LPriAddressCountry, i_LPriAddressPostCode, i_LKC1L1, i_LKC1L2, i_LKC1L3, i_LKC1Email, i_LKC1TelNum, i_LKC1City, i_LKC1State, i_LKC1Country, i_LKC1PostCode, i_LKC2L1, i_LKC2L2, i_LKC2L3, i_LKC2Email, i_LKC2TelNum, i_LKC2City, i_LKC2State, i_LKC2Country, i_LKC2PostCode, i_LKC3L1, i_LKC3L2, i_LKC3L3, i_LKC3Email, i_LKC3TelNum, i_LKC3City, i_LKC3State, i_LKC3Country, i_LKC3PostCode, i_LKC4L1, i_LKC4L2, i_LKC4L3, i_LKC4Email, i_LKC4TelNum, i_LKC4City, i_LKC4State, i_LKC4Country, i_LKC4PostCode, i_LKC5L1, i_LKC5L2, i_LKC5L3, i_LKC5Email, i_LKC5TelNum, i_LKC5City, i_LKC5State, i_LKC5Country, i_LKC5PostCode, i_BCompanyName, i_BRegAddressL1, i_BRegAddressL2, i_BRegAddressL3, i_BRegAddressEmail, i_BRegAddressTelNum, i_BRegAddressCity, i_BRegAddressState, i_BRegAddressCountry, i_BRegAddressPostCode, i_BPriAddressL1, i_BPriAddressL2, i_BPriAddressL3, i_BPriAddressEmail, i_BPriAddressTelNum, i_BPriAddressCity, i_BPriAddressState, i_BPriAddressCountry, i_BPriAddressPostCode, i_BKC1L1, i_BKC1L2, i_BKC1L3, i_BKC1Email, i_BKC1TelNum, i_BKC1City, i_BKC1State, i_BKC1Country, i_BKC1PostCode, i_BKC2L1, i_BKC2L2, i_BKC2L3, i_BKC2Email, i_BKC2TelNum, i_BKC2City, i_BKC2State, i_BKC2Country, i_BKC2PostCode, i_BKC3L1, i_BKC3L2, i_BKC3L3, i_BKC3Email, i_BKC3TelNum, i_BKC3City, i_BKC3State, i_BKC3Country, i_BKC3PostCode, i_BKC4L1, i_BKC4L2, i_BKC4L3, i_BKC4Email, i_BKC4TelNum , i_BKC4City, i_BKC4State, i_BKC4Country, i_BKC4PostCode, i_BKC5L1, i_BKC5L2, i_BKC5L3, i_BKC5Email, i_BKC5TelNum, i_BKC5City, i_BKC5State, i_BKC5Country, i_BKC5PostCode, i_ProposedDealCommencementDate, i_PropAddress1L1, i_PropAddress1L2, i_PropAddress1L3, i_PropAddress1Email, i_PropAddress1TelNum, i_PropAddress1City, i_PropAddress1State, i_PropAddress1Country, i_PropAddress1PostCode, i_PropAddress2L1, i_PropAddress2L2, i_PropAddress2L3, i_PropAddress2Email, i_PropAddress2TelNum, i_PropAddress2City, i_PropAddress2State, i_PropAddress2Country, i_PropAddress2PostCode, i_PropAddress3L1, i_PropAddress3L2, i_PropAddress3L3, i_PropAddress3Email, i_PropAddress3TelNum, i_PropAddress3City, i_PropAddress3State, i_PropAddress3Country, i_PropAddress3PostCode, i_PropAddress4L1, i_PropAddress4L2, i_PropAddress4L3, i_PropAddress4Email, i_PropAddress4TelNum, i_PropAddress4City, i_PropAddress4State, i_PropAddress4Country, i_PropAddress4PostCode, i_PropAddress5L1, i_PropAddress5L2, i_PropAddress5L3, i_PropAddress5Email, i_PropAddress5TelNum, i_PropAddress5City, i_PropAddress5State, i_PropAddress5Country, i_PropAddress5PostCode, i_LoanDateAggrmnt, i_FirstUtilisationDate, i_AmountAdvancedonFUD, i_OriginalCommitmentAmount, i_FirstInterestPaymentDate, i_PaymentFrequency, i_IsSignOff, i_SignOffDate, i_SignoffBy, i_IsActive);
END//
DELIMITER ;

-- Dumping structure for procedure coba.SP_insert_OnboardingTask
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insert_OnboardingTask`(
	IN `i_UniqueEmailID` VARCHAR(400),
	IN `i_EmailID` VARCHAR(500),
	IN `i_ClientNumber` VARCHAR(500),
	IN `i_Subject` VARCHAR(4000),
	IN `i_IsMappedToTask` VARCHAR(5),
	IN `i_EmailAttachment` VARCHAR(4000),
	IN `i_CreatedDate` DATETIME

,
	IN `i_Emailcontent` VARCHAR(4000)
,
	IN `i_CreatedBy` VARCHAR(500),
	IN `i_TaskAssignedDate` DATETIME
)
BEGIN

Insert into tbl_onboarding_task (UniqueEmailID,EmailID,ClientNumber,EmailSubject,EmailContent,IsMappedToTask,EmailAttachment,CreatedDate,IsActive,IsProcessed,CreatedBy,TaskAssignedDate) 
values (i_UniqueEmailID,i_EmailID,i_ClientNumber,i_Subject,i_EmailContent,i_IsMappedToTask,i_EmailAttachment,i_CreatedDate,'Y','N',i_CreatedBy,i_TaskAssignedDate);

END//
DELIMITER ;

-- Dumping structure for procedure coba.sp_insert_task
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_task`(
	IN `i_Name` VARCHAR(50),
	IN `i_IsSignOff` VARCHAR(1)
,
	IN `i_Description` VARCHAR(250)
,
	IN `i_IsActive` VARCHAR(50)

)
BEGIN

insert into tbl_task (Name,Description,IsSignOff,IsActive,CreatedDate,CreatedBy,LastModifiedDate,LastModifiedBy) values (i_Name,i_Description,i_IsSignOff,i_IsActive,CURRENT_DATE,'',CURRENT_DATE,'');

END//
DELIMITER ;

-- Dumping structure for procedure coba.sp_update_map_task
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_map_task`(
	IN `i_id` INT,
	IN `i_taskid` VARCHAR(50),
	IN `i_IsMappedToTask` VARCHAR(50)
)
BEGIN
	
	update tbl_onboarding_task set TaskId=i_taskid,IsMappedToTask=i_IsMappedToTask where Id=i_id;
	
END//
DELIMITER ;

-- Dumping structure for procedure coba.SP_update_onboardingTask
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_update_onboardingTask`(
	IN `i_id` INT,
	IN `i_TaskAttachment` VARCHAR(500)
,
	IN `i_comments` VARCHAR(500)
)
BEGIN

update tbl_onboarding_task set TaskAttachement=i_TaskAttachment,comments=i_comments where Id=i_id;

END//
DELIMITER ;

-- Dumping structure for procedure coba.sp_update_task
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_task`(
	IN `i_Id` INT,
	IN `i_IsSignOff` VARCHAR(50),
	IN `i_IsActive` VARCHAR(50),
	IN `i_Description` VARCHAR(500),
	IN `i_Name` VARCHAR(500)
)
BEGIN

update tbl_task  set Name=i_Name,Description=i_Description,IsSignOff=i_IsSignOff,IsActive=i_IsActive,LastModifiedDate=CURRENT_DATE where Id=i_Id;

END//
DELIMITER ;

-- Dumping structure for table coba.tbl_client
CREATE TABLE IF NOT EXISTS `tbl_client` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ClientNumber` varchar(30) NOT NULL,
  `InvDevLoan` varchar(30) NOT NULL,
  `ObligorName` varchar(500) NOT NULL,
  `StrChartAttchd` varchar(1) NOT NULL,
  `OriginalLender` varchar(500) NOT NULL,
  `LCompanyName` varchar(250) NOT NULL,
  `LRegAddressL1` text NOT NULL,
  `LRegAddressL2` text,
  `LRegAddressL3` text,
  `LRegAddressEmail` varchar(250) NOT NULL,
  `LRegAddressTelNum` varchar(50) NOT NULL,
  `LRegAddressCity` varchar(250) NOT NULL,
  `LRegAddressState` varchar(250) NOT NULL,
  `LRegAddressCountry` varchar(250) NOT NULL,
  `LRegAddressPostCode` varchar(30) NOT NULL,
  `LPriAddressL1` text NOT NULL,
  `LPriAddressL2` text,
  `LPriAddressL3` text,
  `LPriAddressEmail` varchar(250) NOT NULL,
  `LPriAddressTelNum` varchar(50) NOT NULL,
  `LPriAddressCity` varchar(250) NOT NULL,
  `LPriAddressState` varchar(250) NOT NULL,
  `LPriAddressCountry` varchar(250) NOT NULL,
  `LPriAddressPostCode` varchar(30) NOT NULL,
  `LKC1L1` text,
  `LKC1L2` text,
  `LKC1L3` text,
  `LKC1Email` varchar(250) DEFAULT NULL,
  `LKC1TelNum` varchar(50) DEFAULT NULL,
  `LKC1City` varchar(250) DEFAULT NULL,
  `LKC1State` varchar(250) DEFAULT NULL,
  `LKC1Country` varchar(250) DEFAULT NULL,
  `LKC1PostCode` varchar(30) DEFAULT NULL,
  `LKC2L1` text,
  `LKC2L2` text,
  `LKC2L3` text,
  `LKC2Email` varchar(250) DEFAULT NULL,
  `LKC2TelNum` varchar(50) DEFAULT NULL,
  `LKC2City` varchar(250) DEFAULT NULL,
  `LKC2State` varchar(250) DEFAULT NULL,
  `LKC2Country` varchar(250) DEFAULT NULL,
  `LKC2PostCode` varchar(30) DEFAULT NULL,
  `LKC3L1` text,
  `LKC3L2` text,
  `LKC3L3` text,
  `LKC3Email` varchar(250) DEFAULT NULL,
  `LKC3TelNum` varchar(50) DEFAULT NULL,
  `LKC3City` varchar(250) DEFAULT NULL,
  `LKC3State` varchar(250) DEFAULT NULL,
  `LKC3Country` varchar(250) DEFAULT NULL,
  `LKC3PostCode` varchar(30) DEFAULT NULL,
  `LKC4L1` text,
  `LKC4L2` text,
  `LKC4L3` text,
  `LKC4Email` varchar(250) DEFAULT NULL,
  `LKC4TelNum` varchar(50) DEFAULT NULL,
  `LKC4City` varchar(250) DEFAULT NULL,
  `LKC4State` varchar(250) DEFAULT NULL,
  `LKC4Country` varchar(250) DEFAULT NULL,
  `LKC4PostCode` varchar(30) DEFAULT NULL,
  `LKC5L1` text,
  `LKC5L2` text,
  `LKC5L3` text,
  `LKC5Email` varchar(250) DEFAULT NULL,
  `LKC5TelNum` varchar(50) DEFAULT NULL,
  `LKC5City` varchar(250) DEFAULT NULL,
  `LKC5State` varchar(250) DEFAULT NULL,
  `LKC5Country` varchar(250) DEFAULT NULL,
  `LKC5PostCode` varchar(30) DEFAULT NULL,
  `BCompanyName` varchar(250) NOT NULL,
  `BRegAddressL1` text NOT NULL,
  `BRegAddressL2` text,
  `BRegAddressL3` text,
  `BRegAddressEmail` varchar(250) NOT NULL,
  `BRegAddressTelNum` varchar(50) NOT NULL,
  `BRegAddressCity` varchar(250) NOT NULL,
  `BRegAddressState` varchar(250) NOT NULL,
  `BRegAddressCountry` varchar(250) NOT NULL,
  `BRegAddressPostCode` varchar(30) NOT NULL,
  `BPriAddressL1` text NOT NULL,
  `BPriAddressL2` text,
  `BPriAddressL3` text,
  `BPriAddressEmail` varchar(250) NOT NULL,
  `BPriAddressTelNum` varchar(50) NOT NULL,
  `BPriAddressCity` varchar(250) NOT NULL,
  `BPriAddressState` varchar(250) NOT NULL,
  `BPriAddressCountry` varchar(250) NOT NULL,
  `BPriAddressPostCode` varchar(30) NOT NULL,
  `BKC1L1` text,
  `BKC1L2` text,
  `BKC1L3` text,
  `BKC1Email` varchar(250) DEFAULT NULL,
  `BKC1TelNum` varchar(50) DEFAULT NULL,
  `BKC1City` varchar(250) DEFAULT NULL,
  `BKC1State` varchar(250) DEFAULT NULL,
  `BKC1Country` varchar(250) DEFAULT NULL,
  `BKC1PostCode` varchar(30) DEFAULT NULL,
  `BKC2L1` text,
  `BKC2L2` text,
  `BKC2L3` text,
  `BKC2Email` varchar(250) DEFAULT NULL,
  `BKC2TelNum` varchar(50) DEFAULT NULL,
  `BKC2City` varchar(250) DEFAULT NULL,
  `BKC2State` varchar(250) DEFAULT NULL,
  `BKC2Country` varchar(250) DEFAULT NULL,
  `BKC2PostCode` varchar(30) DEFAULT NULL,
  `BKC3L1` text,
  `BKC3L2` text,
  `BKC3L3` text,
  `BKC3Email` varchar(250) DEFAULT NULL,
  `BKC3TelNum` varchar(50) DEFAULT NULL,
  `BKC3City` varchar(250) DEFAULT NULL,
  `BKC3State` varchar(250) DEFAULT NULL,
  `BKC3Country` varchar(250) DEFAULT NULL,
  `BKC3PostCode` varchar(30) DEFAULT NULL,
  `BKC4L1` text,
  `BKC4L2` text,
  `BKC4L3` text,
  `BKC4Email` varchar(250) DEFAULT NULL,
  `BKC4TelNum` varchar(50) DEFAULT NULL,
  `BKC4City` varchar(250) DEFAULT NULL,
  `BKC4State` varchar(250) DEFAULT NULL,
  `BKC4Country` varchar(250) DEFAULT NULL,
  `BKC4PostCode` varchar(30) DEFAULT NULL,
  `BKC5L1` text,
  `BKC5L2` text,
  `BKC5L3` text,
  `BKC5Email` varchar(250) DEFAULT NULL,
  `BKC5TelNum` varchar(50) DEFAULT NULL,
  `BKC5City` varchar(250) DEFAULT NULL,
  `BKC5State` varchar(250) DEFAULT NULL,
  `BKC5Country` varchar(250) DEFAULT NULL,
  `BKC5PostCode` varchar(30) DEFAULT NULL,
  `ProposedDealCommencementDate` date DEFAULT NULL,
  `PropAddress1L1` text,
  `PropAddress1L2` text,
  `PropAddress1L3` text,
  `PropAddress1Email` varchar(250) DEFAULT NULL,
  `PropAddress1TelNum` varchar(50) DEFAULT NULL,
  `PropAddress1City` varchar(250) DEFAULT NULL,
  `PropAddress1State` varchar(250) DEFAULT NULL,
  `PropAddress1Country` varchar(250) DEFAULT NULL,
  `PropAddress1PostCode` varchar(30) DEFAULT NULL,
  `PropAddress2L1` text,
  `PropAddress2L2` text,
  `PropAddress2L3` text,
  `PropAddress2Email` varchar(250) DEFAULT NULL,
  `PropAddress2TelNum` varchar(50) DEFAULT NULL,
  `PropAddress2City` varchar(250) DEFAULT NULL,
  `PropAddress2State` varchar(250) DEFAULT NULL,
  `PropAddress2Country` varchar(250) DEFAULT NULL,
  `PropAddress2PostCode` varchar(30) DEFAULT NULL,
  `PropAddress3L1` text,
  `PropAddress3L2` text,
  `PropAddress3L3` text,
  `PropAddress3Email` varchar(250) DEFAULT NULL,
  `PropAddress3TelNum` varchar(50) DEFAULT NULL,
  `PropAddress3City` varchar(250) DEFAULT NULL,
  `PropAddress3State` varchar(250) DEFAULT NULL,
  `PropAddress3Country` varchar(250) DEFAULT NULL,
  `PropAddress3PostCode` varchar(30) DEFAULT NULL,
  `PropAddress4L1` text,
  `PropAddress4L2` text,
  `PropAddress4L3` text,
  `PropAddress4Email` varchar(250) DEFAULT NULL,
  `PropAddress4TelNum` varchar(50) DEFAULT NULL,
  `PropAddress4City` varchar(250) DEFAULT NULL,
  `PropAddress4State` varchar(250) DEFAULT NULL,
  `PropAddress4Country` varchar(250) DEFAULT NULL,
  `PropAddress4PostCode` varchar(30) DEFAULT NULL,
  `PropAddress5L1` text,
  `PropAddress5L2` text,
  `PropAddress5L3` text,
  `PropAddress5Email` varchar(250) DEFAULT NULL,
  `PropAddress5TelNum` varchar(50) DEFAULT NULL,
  `PropAddress5City` varchar(250) DEFAULT NULL,
  `PropAddress5State` varchar(250) DEFAULT NULL,
  `PropAddress5Country` varchar(250) DEFAULT NULL,
  `PropAddress5PostCode` varchar(30) DEFAULT NULL,
  `LoanDateAggrmnt` date NOT NULL,
  `FirstUtilisationDate` date NOT NULL,
  `AmountAdvancedonFUD` double(16,2) NOT NULL,
  `OriginalCommitmentAmount` double(16,2) NOT NULL,
  `FirstInterestPaymentDate` date DEFAULT NULL,
  `PaymentFrequency` int(11) NOT NULL,
  `IsSignOff` varchar(1) DEFAULT NULL,
  `SignOffDate` datetime DEFAULT NULL,
  `SignoffBy` varchar(100) DEFAULT NULL,
  `IsActive` varchar(1) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` varchar(100) DEFAULT NULL,
  `LastModifiedDate` datetime DEFAULT NULL,
  `LastModifiedBy` varchar(100) DEFAULT NULL,
  `Res1` varchar(250) DEFAULT NULL,
  `Res2` varchar(250) DEFAULT NULL,
  `Res3` varchar(250) DEFAULT NULL,
  `Res4` varchar(250) DEFAULT NULL,
  `Res5` varchar(250) DEFAULT NULL,
  `Res6` varchar(250) DEFAULT NULL,
  `Res7` varchar(250) DEFAULT NULL,
  `Res8` varchar(250) DEFAULT NULL,
  `Res9` varchar(250) DEFAULT NULL,
  `Res10` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IDX_ClientNumber` (`ClientNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table coba.tbl_client: ~3 rows (approximately)
DELETE FROM `tbl_client`;
/*!40000 ALTER TABLE `tbl_client` DISABLE KEYS */;
INSERT INTO `tbl_client` (`Id`, `ClientNumber`, `InvDevLoan`, `ObligorName`, `StrChartAttchd`, `OriginalLender`, `LCompanyName`, `LRegAddressL1`, `LRegAddressL2`, `LRegAddressL3`, `LRegAddressEmail`, `LRegAddressTelNum`, `LRegAddressCity`, `LRegAddressState`, `LRegAddressCountry`, `LRegAddressPostCode`, `LPriAddressL1`, `LPriAddressL2`, `LPriAddressL3`, `LPriAddressEmail`, `LPriAddressTelNum`, `LPriAddressCity`, `LPriAddressState`, `LPriAddressCountry`, `LPriAddressPostCode`, `LKC1L1`, `LKC1L2`, `LKC1L3`, `LKC1Email`, `LKC1TelNum`, `LKC1City`, `LKC1State`, `LKC1Country`, `LKC1PostCode`, `LKC2L1`, `LKC2L2`, `LKC2L3`, `LKC2Email`, `LKC2TelNum`, `LKC2City`, `LKC2State`, `LKC2Country`, `LKC2PostCode`, `LKC3L1`, `LKC3L2`, `LKC3L3`, `LKC3Email`, `LKC3TelNum`, `LKC3City`, `LKC3State`, `LKC3Country`, `LKC3PostCode`, `LKC4L1`, `LKC4L2`, `LKC4L3`, `LKC4Email`, `LKC4TelNum`, `LKC4City`, `LKC4State`, `LKC4Country`, `LKC4PostCode`, `LKC5L1`, `LKC5L2`, `LKC5L3`, `LKC5Email`, `LKC5TelNum`, `LKC5City`, `LKC5State`, `LKC5Country`, `LKC5PostCode`, `BCompanyName`, `BRegAddressL1`, `BRegAddressL2`, `BRegAddressL3`, `BRegAddressEmail`, `BRegAddressTelNum`, `BRegAddressCity`, `BRegAddressState`, `BRegAddressCountry`, `BRegAddressPostCode`, `BPriAddressL1`, `BPriAddressL2`, `BPriAddressL3`, `BPriAddressEmail`, `BPriAddressTelNum`, `BPriAddressCity`, `BPriAddressState`, `BPriAddressCountry`, `BPriAddressPostCode`, `BKC1L1`, `BKC1L2`, `BKC1L3`, `BKC1Email`, `BKC1TelNum`, `BKC1City`, `BKC1State`, `BKC1Country`, `BKC1PostCode`, `BKC2L1`, `BKC2L2`, `BKC2L3`, `BKC2Email`, `BKC2TelNum`, `BKC2City`, `BKC2State`, `BKC2Country`, `BKC2PostCode`, `BKC3L1`, `BKC3L2`, `BKC3L3`, `BKC3Email`, `BKC3TelNum`, `BKC3City`, `BKC3State`, `BKC3Country`, `BKC3PostCode`, `BKC4L1`, `BKC4L2`, `BKC4L3`, `BKC4Email`, `BKC4TelNum`, `BKC4City`, `BKC4State`, `BKC4Country`, `BKC4PostCode`, `BKC5L1`, `BKC5L2`, `BKC5L3`, `BKC5Email`, `BKC5TelNum`, `BKC5City`, `BKC5State`, `BKC5Country`, `BKC5PostCode`, `ProposedDealCommencementDate`, `PropAddress1L1`, `PropAddress1L2`, `PropAddress1L3`, `PropAddress1Email`, `PropAddress1TelNum`, `PropAddress1City`, `PropAddress1State`, `PropAddress1Country`, `PropAddress1PostCode`, `PropAddress2L1`, `PropAddress2L2`, `PropAddress2L3`, `PropAddress2Email`, `PropAddress2TelNum`, `PropAddress2City`, `PropAddress2State`, `PropAddress2Country`, `PropAddress2PostCode`, `PropAddress3L1`, `PropAddress3L2`, `PropAddress3L3`, `PropAddress3Email`, `PropAddress3TelNum`, `PropAddress3City`, `PropAddress3State`, `PropAddress3Country`, `PropAddress3PostCode`, `PropAddress4L1`, `PropAddress4L2`, `PropAddress4L3`, `PropAddress4Email`, `PropAddress4TelNum`, `PropAddress4City`, `PropAddress4State`, `PropAddress4Country`, `PropAddress4PostCode`, `PropAddress5L1`, `PropAddress5L2`, `PropAddress5L3`, `PropAddress5Email`, `PropAddress5TelNum`, `PropAddress5City`, `PropAddress5State`, `PropAddress5Country`, `PropAddress5PostCode`, `LoanDateAggrmnt`, `FirstUtilisationDate`, `AmountAdvancedonFUD`, `OriginalCommitmentAmount`, `FirstInterestPaymentDate`, `PaymentFrequency`, `IsSignOff`, `SignOffDate`, `SignoffBy`, `IsActive`, `CreatedDate`, `CreatedBy`, `LastModifiedDate`, `LastModifiedBy`, `Res1`, `Res2`, `Res3`, `Res4`, `Res5`, `Res6`, `Res7`, `Res8`, `Res9`, `Res10`) VALUES
	(1, '1234354', '123', 'Name1', 'y', 'Lender1', 'company 1', 'l1', 'l2', 'l3', 'ema', 'stel', 'cit', 'st', 'cou', 'post', 'l1', 'l2', 'l3', 'em', 'TEL', 'cit', 'sta', 'count', 'pos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'bor', 'l', 'llj', 'lljj', 'em', 'te', 'lj', 's', 'co', 'po', 'l1', 'l2', 'l3', 'em', 'te', 'ct', 'st', 'cou', 'po', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-29', '2017-07-29', 123.00, 123.00, '2017-07-29', 1, 'Y', '0001-01-01 00:00:00', NULL, 'Y', '2017-07-29 21:34:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, '987723', '123', 'Name2', 'N', 'Lender2', 'Company name', '1', '2', '3', '8', '9', '4', '5', '6', '7', 'p1', 'p2', 'p3', 'p8', 'p8', 'p4', 'p5', 'p6', 'p7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'b name', 'l1', 'l2', 'l3', 'l8l', 'l9', 'l4', 'l5l', 'l56l', 'l7', 'l1', 'l2', 'l45', 'l34', 'kj3', 'l23', 'l2l', '23l', 'l45k', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-04', '2017-07-30', 21.00, 3221.00, '2017-07-30', 12, 'N', '0001-01-01 00:00:00', NULL, 'N', '2017-07-30 11:19:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'client 3', 'IL', 'siva', 'Y', 'test', 'ABC', 'L1', 'L2', 'L3', 'tse@emai', '1233', 'c', 'Satre', 'country', '643', 'l1', 'l2', 'pl3', 'emai', '123', 'pri c', 'pric', 'count', 'post', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Borrow c', 'L1', 'b L2', 'b l3', 'mail', '234', 't', 'state', 'countr', '6523', 'l1', 'l2', 'l3', 'mail', '12', 'tow', 'cout', 'cot', 'post', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-05', '2017-08-16', 100.00, 199.00, '2017-08-05', 1, 'N', '0001-01-01 00:00:00', NULL, 'Y', '2017-08-05 22:27:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `tbl_client` ENABLE KEYS */;

-- Dumping structure for table coba.tbl_onboarding_task
CREATE TABLE IF NOT EXISTS `tbl_onboarding_task` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UniqueEmailId` varchar(100) NOT NULL,
  `EmailId` varchar(200) NOT NULL,
  `ClientNumber` varchar(30) NOT NULL,
  `EmailSubject` varchar(1000) NOT NULL,
  `EmailContent` text,
  `EmailAttachment` text,
  `IsMappedToTask` varchar(1) NOT NULL,
  `IsActive` varchar(1) NOT NULL,
  `IsProcessed` varchar(1) NOT NULL,
  `TaskId` varchar(30) DEFAULT NULL,
  `TaskAttachement` text,
  `TaskComments` text,
  `CreatedDate` datetime NOT NULL,
  `CreatedBy` varchar(100) NOT NULL,
  `TaskAssignedBy` varchar(100) DEFAULT NULL,
  `TaskAssignedDate` datetime NOT NULL,
  `LastModifiedDate` datetime DEFAULT NULL,
  `LastModifiedBy` varchar(100) DEFAULT NULL,
  `Res1` varchar(250) DEFAULT NULL,
  `Res2` varchar(250) DEFAULT NULL,
  `Res3` varchar(250) DEFAULT NULL,
  `Res4` varchar(250) DEFAULT NULL,
  `Res5` varchar(250) DEFAULT NULL,
  `Res6` varchar(250) DEFAULT NULL,
  `Res7` varchar(250) DEFAULT NULL,
  `Res8` varchar(250) DEFAULT NULL,
  `Res9` varchar(250) DEFAULT NULL,
  `Res10` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IDX_UniqueEmailId` (`UniqueEmailId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- Dumping data for table coba.tbl_onboarding_task: ~10 rows (approximately)
DELETE FROM `tbl_onboarding_task`;
/*!40000 ALTER TABLE `tbl_onboarding_task` DISABLE KEYS */;
INSERT INTO `tbl_onboarding_task` (`Id`, `UniqueEmailId`, `EmailId`, `ClientNumber`, `EmailSubject`, `EmailContent`, `EmailAttachment`, `IsMappedToTask`, `IsActive`, `IsProcessed`, `TaskId`, `TaskAttachement`, `TaskComments`, `CreatedDate`, `CreatedBy`, `TaskAssignedBy`, `TaskAssignedDate`, `LastModifiedDate`, `LastModifiedBy`, `Res1`, `Res2`, `Res3`, `Res4`, `Res5`, `Res6`, `Res7`, `Res8`, `Res9`, `Res10`) VALUES
	(23, '<PN1PR01MB01754671E3073D11DDE971C1C48B0@PN1PR01MB0175.INDPRD01.PROD.OUTLOOK.COM>', '<PN1PR01MB01754671E3073D11DDE971C1C48B0@PN1PR01MB0175.INDPRD01.PROD.OUTLOOK.COM>', '12453', 'Fw: Test 12453 (Trial Version)', '<html><head>\r\n<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\r\n<style type="text/css" style="display:none;"><!-- P {margin-top:0;margin-bottom:0;} --></style>\r\n</head>\r\n<body dir="ltr">\r\n<div id="divtagdefaultwrapper" style="font-size:12pt;color:#000000;font-family:Calibri,Helvetica,sans-serif;" dir="ltr">\r\n<p><br>\r\n</p>\r\n<br>\r\n<br>\r\n<div style="color: rgb(0, 0, 0);">\r\n<hr tabindex="-1" style="display:inline-block; width:98%">\r\n<div id="divRplyFwdMsg" dir="ltr"><font face="Calibri, sans-serif" color="#000000" style="font-size:11pt"><b>From:</b> jayakumar T &lt;savvyjayakumar@outlook.com&gt;<br>\r\n<b>Sent:</b> Sunday, August 6, 2017 3:27 PM<br>\r\n<b>To:</b> jayakumar T<br>\r\n<b>Subject:</b> Test </font>\r\n<div></div>\r\n</div>\r\n<div>\r\n<div id="divtagdefaultwrapper" dir="ltr" style="font-size:12pt; color:#000000; font-family:Calibri,Helvetica,sans-serif">\r\n<p>testing subjecce</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</body>\r\n</html>\r\n\r\n', 'new doc 2017-06-06 17.34.40_20170606173456.pdf,', 'Y', 'Y', 'N', '8', 'test desjk.txt', NULL, '2017-08-09 00:00:00', 'savvyjayakumar@outlook.com', NULL, '2017-08-10 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(24, '<PN1PR01MB017552B43CF87F60003D9972C4890@PN1PR01MB0175.INDPRD01.PROD.OUTLOOK.COM>', 'savvyjayakumar@outlook.com', '34121', 'Fw: Test 34121 (Trial Version)', '<html><head>\r\n<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\r\n<style type="text/css" style="display:none;"><!-- P {margin-top:0;margin-bottom:0;} --></style>\r\n</head>\r\n<body dir="ltr">\r\n<div id="divtagdefaultwrapper" style="font-size:12pt;color:#000000;font-family:Calibri,Helvetica,sans-serif;" dir="ltr">\r\n<p>testing</p>\r\n</div>\r\n</body>\r\n</html>\r\n\r\n', 'new doc 2017-06-06 17.34.40_20170606173456.pdf,', 'Y', 'Y', 'N', '2', NULL, NULL, '2017-08-11 00:00:00', 'savvyjayakumar@outlook.com', NULL, '2017-08-11 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(26, '<PN1PR01MB01759455E412C6E3B29C926EC4890@PN1PR01MB0175.INDPRD01.PROD.OUTLOOK.COM>', 'savvyjayakumar@outlook.com', '1234567', '1234567 (Trial Version)', '<html><head>\r\n<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\r\n<style type="text/css" style="display:none;"><!-- P {margin-top:0;margin-bottom:0;} --></style>\r\n</head>\r\n<body dir="ltr">\r\n<div id="divtagdefaultwrapper" style="font-size:12pt;color:#000000;font-family:Calibri,Helvetica,sans-serif;" dir="ltr">\r\n<p>jay test</p>\r\n</div>\r\n</body>\r\n</html>\r\n\r\n', 'Custom Report Pending point Status till 8 Aug_Customer care Inbound.xlsx,', 'N', 'Y', 'N', NULL, NULL, NULL, '2017-08-11 00:00:00', 'savvyjayakumar@outlook.com', NULL, '2017-08-11 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, '<PN1PR01MB017575A87BFFDEC39D2A5F71C4890@PN1PR01MB0175.INDPRD01.PROD.OUTLOOK.COM>', 'savvyjayakumar@outlook.com', '1234567', 'Fw: 1234567 (Trial Version)', '<html><head>\r\n<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\r\n<style type="text/css" style="display:none;"><!-- P {margin-top:0;margin-bottom:0;} --></style>\r\n</head>\r\n<body dir="ltr">\r\n<div id="divtagdefaultwrapper" style="font-size:12pt;color:#000000;font-family:Calibri,Helvetica,sans-serif;" dir="ltr">\r\n<p><br>\r\n</p>\r\n<br>\r\n<br>\r\n<div style="color: rgb(0, 0, 0);">\r\n<hr tabindex="-1" style="display:inline-block; width:98%">\r\n<div id="divRplyFwdMsg" dir="ltr"><font face="Calibri, sans-serif" color="#000000" style="font-size:11pt"><b>From:</b> jayakumar T &lt;savvyjayakumar@outlook.com&gt;<br>\r\n<b>Sent:</b> Friday, August 11, 2017 8:24 PM<br>\r\n<b>To:</b> jayakumar T<br>\r\n<b>Subject:</b> 1234567</font>\r\n<div></div>\r\n</div>\r\n<div>\r\n<div id="divtagdefaultwrapper" dir="ltr" style="font-size:12pt; color:#000000; font-family:Calibri,Helvetica,sans-serif">\r\n<p>jay test</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</body>\r\n</html>\r\n\r\n', 'cobasclientschema.sql,', 'Y', 'Y', 'N', '3', NULL, NULL, '2017-08-11 00:00:00', 'savvyjayakumar@outlook.com', NULL, '2017-08-11 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(28, '<PN1PR01MB017551FBE17EF2BAF90E8B46C4890@PN1PR01MB0175.INDPRD01.PROD.OUTLOOK.COM>', 'savvyjayakumar@outlook.com', '12345678', 'Fw: 12345678 (Trial Version)', '<html><head>\r\n<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\r\n<style type="text/css" style="display:none;"><!-- P {margin-top:0;margin-bottom:0;} --></style>\r\n</head>\r\n<body dir="ltr">\r\n<div id="divtagdefaultwrapper" style="font-size:12pt;color:#000000;font-family:Calibri,Helvetica,sans-serif;" dir="ltr">\r\n<p><br>\r\n</p>\r\n<br>\r\n<br>\r\n<div style="color: rgb(0, 0, 0);">\r\n<hr tabindex="-1" style="display:inline-block; width:98%">\r\n<div id="divRplyFwdMsg" dir="ltr"><font face="Calibri, sans-serif" color="#000000" style="font-size:11pt"><b>From:</b> jayakumar T &lt;savvyjayakumar@outlook.com&gt;<br>\r\n<b>Sent:</b> Friday, August 11, 2017 8:28 PM<br>\r\n<b>To:</b> jayakumar T<br>\r\n<b>Subject:</b> Fw: 1234567</font>\r\n<div></div>\r\n</div>\r\n<div>\r\n<div id="divtagdefaultwrapper" dir="ltr" style="font-size:12pt; color:#000000; font-family:Calibri,Helvetica,sans-serif">\r\n<p><br>\r\n</p>\r\n<br>\r\n<br>\r\n<div style="color:rgb(0,0,0)">\r\n<hr tabindex="-1" style="display:inline-block; width:98%">\r\n<div id="divRplyFwdMsg" dir="ltr"><font face="Calibri, sans-serif" color="#000000" style="font-size:11pt"><b>From:</b> jayakumar T &lt;savvyjayakumar@outlook.com&gt;<br>\r\n<b>Sent:</b> Friday, August 11, 2017 8:24 PM<br>\r\n<b>To:</b> jayakumar T<br>\r\n<b>Subject:</b> 1234567</font>\r\n<div></div>\r\n</div>\r\n<div>\r\n<div id="divtagdefaultwrapper" dir="ltr" style="font-size:12pt; color:#000000; font-family:Calibri,Helvetica,sans-serif">\r\n<p>jay test</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</body>\r\n</html>\r\n\r\n', 'cobasclientschema.sql,', 'N', 'Y', 'N', NULL, NULL, NULL, '2017-08-11 00:00:00', 'savvyjayakumar@outlook.com', NULL, '2017-08-11 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(29, '<PN1PR01MB0175C619E763F9EBC54815C7C4890@PN1PR01MB0175.INDPRD01.PROD.OUTLOOK.COM>', 'savvyjayakumar@outlook.com', '123456789', 'Fw: 123456789 (Trial Version)', '<html><head>\r\n<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\r\n<style type="text/css" style="display:none;"><!-- P {margin-top:0;margin-bottom:0;} --></style>\r\n</head>\r\n<body dir="ltr">\r\n<div id="divtagdefaultwrapper" style="font-size:12pt;color:#000000;font-family:Calibri,Helvetica,sans-serif;" dir="ltr">\r\n<p><br>\r\n</p>\r\n<br>\r\n<br>\r\n<div style="color: rgb(0, 0, 0);">\r\n<hr tabindex="-1" style="display:inline-block; width:98%">\r\n<div id="divRplyFwdMsg" dir="ltr"><font face="Calibri, sans-serif" color="#000000" style="font-size:11pt"><b>From:</b> jayakumar T &lt;savvyjayakumar@outlook.com&gt;<br>\r\n<b>Sent:</b> Friday, August 11, 2017 8:36 PM<br>\r\n<b>To:</b> jayakumar T<br>\r\n<b>Subject:</b> Fw: 12345678</font>\r\n<div></div>\r\n</div>\r\n<div>\r\n<div id="divtagdefaultwrapper" dir="ltr" style="font-size:12pt; color:#000000; font-family:Calibri,Helvetica,sans-serif">\r\n<p><br>\r\n</p>\r\n<br>\r\n<br>\r\n<div style="color:rgb(0,0,0)">\r\n<hr tabindex="-1" style="display:inline-block; width:98%">\r\n<div id="divRplyFwdMsg" dir="ltr"><font face="Calibri, sans-serif" color="#000000" style="font-size:11pt"><b>From:</b> jayakumar T &lt;savvyjayakumar@outlook.com&gt;<br>\r\n<b>Sent:</b> Friday, August 11, 2017 8:28 PM<br>\r\n<b>To:</b> jayakumar T<br>\r\n<b>Subject:</b> Fw: 1234567</font>\r\n<div></div>\r\n</div>\r\n<div>\r\n<div id="divtagdefaultwrapper" dir="ltr" style="font-size:12pt; color:#000000; font-family:Calibri,Helvetica,sans-serif">\r\n<p><br>\r\n</p>\r\n<br>\r\n<br>\r\n<div style="color:rgb(0,0,0)">\r\n<hr tabindex="-1" style="display:inline-block; width:98%">\r\n<div id="divRplyFwdMsg" dir="ltr"><font face="Calibri, sans-serif" color="#000000" style="font-size:11pt"><b>From:</b> jayakumar T &lt;savvyjayakumar@outlook.com&gt;<br>\r\n<b>Sent:</b> Friday, August 11, 2017 8:24 PM<br>\r\n<b>To:</b> jayakumar T<br>\r\n<b>Subject:</b> 1234567</font>\r\n<div></div>\r\n</div>\r\n<div>\r\n<div id="divtagdefaultwrapper" dir="ltr" style="font-size:12pt; color:#000000; font-family:Calibri,Helvetica,sans-serif">\r\n<p>jay test</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</body>\r\n</html>\r\n\r\n', 'cobasclientschema.sql,', 'N', 'Y', 'N', NULL, NULL, NULL, '2017-08-11 00:00:00', 'savvyjayakumar@outlook.com', NULL, '2017-08-11 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(30, '<CAKzhRk1=T=3ds-A8KLm3xfF814VfqVUHD_qq0auBp9j7cVyKQg@mail.gmail.com>', 'sthirupathikumar@gmail.com', '12131415', '12131415 (Trial Version)', '<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><div dir="ltr">This is test mail<br clear="all"><div><br></div>-- <br><div class="gmail_signature" data-smartmail="gmail_signature">Regards,<br>Thirupathi<br></div>\r\n</div>\r\n\r\n', 'wr1.doc,', 'N', 'Y', 'N', NULL, NULL, NULL, '2017-08-15 00:00:00', 'sthirupathikumar@gmail.com', NULL, '2017-08-15 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(31, '<CAE_CuUj7w2h7PNxzOo7xYrqs=6UiZFk1y4vkUONvBJpJABCA6Q@mail.gmail.com>', 'honikeyan@gmail.com', '11111123444', 'Fwd: CLient ID : 11111123444 (Trial Version)', '<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><div dir="ltr"><br><div class="gmail_quote">---------- Forwarded message ----------<br>From: <b class="gmail_sendername">Kar A</b> <span dir="ltr">&lt;<a href="mailto:honikeyan@gmail.com">honikeyan@gmail.com</a>&gt;</span><br>Date: Tue, Aug 15, 2017 at 10:46 PM<br>Subject: CLient ID : 11111123444<br>To: <a href="mailto:savvjayakumar@outlook.com">savvjayakumar@outlook.com</a><br><br><br><div dir="ltr"><br></div>\r\n</div><br></div>\r\n\r\n', 'Test mail.pptx,', 'N', 'Y', 'N', NULL, NULL, NULL, '2017-08-15 00:00:00', 'honikeyan@gmail.com', NULL, '2017-08-15 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(32, '<CAE_CuUiD53MgG40dqChegQgcU-ue56irYQUR_bwFcErCTEwKOw@mail.gmail.com>', 'honikeyan@gmail.com', '11111123444', 'Fwd: CLient ID : 11111123444 (Trial Version)', '<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><div dir="ltr"><br><div class="gmail_quote">---------- Forwarded message ----------<br>From: <b class="gmail_sendername">Kar A</b> <span dir="ltr">&lt;<a href="mailto:honikeyan@gmail.com">honikeyan@gmail.com</a>&gt;</span><br>Date: Tue, Aug 15, 2017 at 10:58 PM<br>Subject: CLient ID : 11111123444<br>To: <a href="mailto:savvjayakumar@outlook.com">savvjayakumar@outlook.com</a><br><br><br><div dir="ltr"><br></div>\r\n</div><br></div>\r\n\r\n', 'Test mail_new.pptx,', 'Y', 'Y', 'N', '12', NULL, NULL, '2017-08-15 00:00:00', 'honikeyan@gmail.com', NULL, '2017-08-15 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(33, '<CAE_CuUi6iNDkHPbd-p4ctE7EYNfvu115b7MYNQeXMgxaxXQDEQ@mail.gmail.com>', 'honikeyan@gmail.com', '11111123444', 'Fwd: CLient ID : 11111123444 (Trial Version)', '<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><div dir="ltr"><br><div class="gmail_quote">---------- Forwarded message ----------<br>From: <b class="gmail_sendername">Kar A</b> <span dir="ltr">&lt;<a href="mailto:honikeyan@gmail.com">honikeyan@gmail.com</a>&gt;</span><br>Date: Tue, Aug 15, 2017 at 10:46 PM<br>Subject: CLient ID : 11111123444<br>To: <a href="mailto:savvjayakumar@outlook.com">savvjayakumar@outlook.com</a><br><br><br><div dir="ltr"><br></div>\r\n</div><br></div>\r\n\r\n', 'Test mail.pptx,', 'Y', 'Y', 'N', '5', NULL, NULL, '2017-08-15 00:00:00', 'honikeyan@gmail.com', NULL, '2017-08-15 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `tbl_onboarding_task` ENABLE KEYS */;

-- Dumping structure for table coba.tbl_right_master
CREATE TABLE IF NOT EXISTS `tbl_right_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RightID` int(11) DEFAULT NULL,
  `RightName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Path` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Icon` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ShowMenu` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table coba.tbl_right_master: ~0 rows (approximately)
DELETE FROM `tbl_right_master`;
/*!40000 ALTER TABLE `tbl_right_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_right_master` ENABLE KEYS */;

-- Dumping structure for table coba.tbl_roleright_mapping
CREATE TABLE IF NOT EXISTS `tbl_roleright_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` int(11) DEFAULT NULL,
  `RightID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table coba.tbl_roleright_mapping: ~0 rows (approximately)
DELETE FROM `tbl_roleright_mapping`;
/*!40000 ALTER TABLE `tbl_roleright_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_roleright_mapping` ENABLE KEYS */;

-- Dumping structure for table coba.tbl_role_master
CREATE TABLE IF NOT EXISTS `tbl_role_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table coba.tbl_role_master: ~0 rows (approximately)
DELETE FROM `tbl_role_master`;
/*!40000 ALTER TABLE `tbl_role_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_role_master` ENABLE KEYS */;

-- Dumping structure for table coba.tbl_task
CREATE TABLE IF NOT EXISTS `tbl_task` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) NOT NULL,
  `Description` varchar(3000) DEFAULT NULL,
  `IsSignOff` varchar(1) NOT NULL,
  `SignOffDate` datetime DEFAULT NULL,
  `SignoffBy` varchar(100) DEFAULT NULL,
  `IsActive` varchar(1) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `CreatedBy` varchar(100) NOT NULL,
  `LastModifiedDate` datetime NOT NULL,
  `LastModifiedBy` varchar(100) NOT NULL,
  `Res1` varchar(250) DEFAULT NULL,
  `Res2` varchar(250) DEFAULT NULL,
  `Res3` varchar(250) DEFAULT NULL,
  `Res4` varchar(250) DEFAULT NULL,
  `Res5` varchar(250) DEFAULT NULL,
  `Res6` varchar(250) DEFAULT NULL,
  `Res7` varchar(250) DEFAULT NULL,
  `Res8` varchar(250) DEFAULT NULL,
  `Res9` varchar(250) DEFAULT NULL,
  `Res10` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IDX_Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- Dumping data for table coba.tbl_task: ~26 rows (approximately)
DELETE FROM `tbl_task`;
/*!40000 ALTER TABLE `tbl_task` DISABLE KEYS */;
INSERT INTO `tbl_task` (`Id`, `Name`, `Description`, `IsSignOff`, `SignOffDate`, `SignoffBy`, `IsActive`, `CreatedDate`, `CreatedBy`, `LastModifiedDate`, `LastModifiedBy`, `Res1`, `Res2`, `Res3`, `Res4`, `Res5`, `Res6`, `Res7`, `Res8`, `Res9`, `Res10`) VALUES
	(1, 'Credit/Facility Agreement-executed version/conformed copy', 'Credit/Facility Agreement-executed version/conformed copy', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:24', 'THIRUPATHI', '2017-07-02 13:53:24', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'Bible of Docs (if unavailable, pls provide a list of all documentation held)', 'Bible of Docs (if unavailable, pls provide a list of all documentation held)', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:24', 'THIRUPATHI', '2017-07-02 13:53:24', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'Conditions Subsequent Satisfaction Letter (incl. all documentation) as applicable', 'Conditions Subsequent Satisfaction Letter (incl. all documentation) as applicable', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:24', 'THIRUPATHI', '2017-07-02 13:53:24', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'Documentation pertaining to the Security Package(i.e. Deed of Charge, Share Pledge(s), etc.)', 'Documentation pertaining to the Security Package(i.e. Deed of Charge, Share Pledge(s), etc.)', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:24', 'THIRUPATHI', '2017-07-02 13:53:24', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'Duty of Care re Property Management', 'Duty of Care re Property Management', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:24', 'THIRUPATHI', '2017-07-02 13:53:24', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 'Report on Title/Certificate on Title/Legal Due Diligence Package', 'Report on Title/Certificate on Title/Legal Due Diligence Package', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:24', 'THIRUPATHI', '2017-07-02 13:53:24', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 'All Legal Letters/Notices for the life of the Loan(i.e. Consents/Waivers/Reservation o', 'All Legal Letters/Notices for the life of the Loan(i.e. Consents/Waivers/Reservation o', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:24', 'THIRUPATHI', '2017-07-02 13:53:24', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 'All Release Documentation (i.e. Mortgage/Legal Charge/Security)', 'All Release Documentation (i.e. Mortgage/Legal Charge/Security)', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:24', 'THIRUPATHI', '2017-07-02 13:53:24', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 'Whole-loan/Unsecuritised Hedging Documentation - as applicable', 'Whole-loan/Unsecuritised Hedging Documentation - as applicable', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:24', 'THIRUPATHI', '2017-07-02 13:53:24', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 'Control Account Bank Mandates & Signature List', 'Control Account Bank Mandates & Signature List', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:24', 'THIRUPATHI', '2017-07-02 13:53:24', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 'Other (pls list and provide details in "comments" field)', 'Other (pls list and provide details in "comments" field)', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:24', 'THIRUPATHI', '2017-07-02 13:53:24', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 'Offering Cricular/Prospectus/Syndication Document', 'Offering Cricular/Prospectus/Syndication Document', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:24', 'THIRUPATHI', '2017-07-02 13:53:24', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, 'All Servicing Agreements (Direct/Indirect/Loan-specific)', 'All Servicing Agreements (Direct/Indirect/Loan-specific)', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:24', 'THIRUPATHI', '2017-07-02 13:53:24', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, 'All relevant Intercreditor Deeds - as applicable', 'All relevant Intercreditor Deeds - as applicable', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:24', 'THIRUPATHI', '2017-07-02 13:53:24', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, 'Deed of Charge', 'Deed of Charge', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:24', 'THIRUPATHI', '2017-07-02 13:53:24', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, 'Cash Management Agreement-as applicable', 'Cash Management Agreement-as applicable', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:24', 'THIRUPATHI', '2017-07-02 13:53:24', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(17, 'Master Definitions Schedule ("MDS")', 'Master Definitions Schedule ("MDS")', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:24', 'THIRUPATHI', '2017-07-02 13:53:24', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(18, 'All Powers of Attorney in favour of the Special Servicer', 'All Powers of Attorney in favour of the Special Servicer', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:25', 'THIRUPATHI', '2017-07-02 13:53:25', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(19, 'Securitised Loan Hedging Documentation', 'Securitised Loan Hedging Documentation', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:25', 'THIRUPATHI', '2017-07-02 13:53:25', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(20, 'Liquidity Facility Agreement', 'Liquidity Facility Agreement', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:25', 'THIRUPATHI', '2017-07-02 13:53:25', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(21, 'Written Confirmation identifying any Operating Adviser', 'Written Confirmation identifying any Operating Adviser', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:25', 'THIRUPATHI', '2017-07-02 13:53:25', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(22, 'Details of Appraisal Reductions/Control Valuation Events', 'Details of Appraisal Reductions/Control Valuation Events', 'Y', '2017-07-02 00:00:00', 'THIRUPATHI', 'Y', '2017-07-02 13:53:25', 'THIRUPATHI', '2017-07-02 13:53:25', 'THIRUPATHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, 'asd', 'SAD', 'Y', NULL, NULL, 'Y', '2017-08-10 00:00:00', '', '2017-08-10 00:00:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(24, 'testing1', '2131', 'N', NULL, NULL, 'N', '2017-08-12 00:00:00', '', '2017-08-17 00:00:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(25, 'Teest si', '123', 'N', NULL, NULL, 'Y', '2017-08-15 00:00:00', '', '2017-08-17 00:00:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(26, 'asdfa', 'sfgsdf', 'Y', NULL, NULL, 'Y', '2017-08-17 00:00:00', '', '2017-08-17 00:00:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `tbl_task` ENABLE KEYS */;

-- Dumping structure for table coba.tbl_user_master
CREATE TABLE IF NOT EXISTS `tbl_user_master` (
  `Userid` varchar(255) CHARACTER SET utf8 NOT NULL,
  `UserName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `TypeId` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `RoleId` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `UserImage` longblob,
  `Password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EmailId` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MobileNumber` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CustomData` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Status` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `UserExpiryDate` datetime DEFAULT NULL,
  `PasswordExpiryDate` datetime DEFAULT NULL,
  `UserBlockDate` datetime DEFAULT NULL,
  `AttemptTries` int(11) DEFAULT NULL,
  `LastAuthenticatedDate` datetime DEFAULT NULL,
  `LastUsedDate` datetime DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ApprovedDate` datetime DEFAULT NULL,
  `Approvedby` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MakerComment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CheckerComment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `IsADUser` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `BillingId` int(11) DEFAULT NULL,
  `BaseSkillId` int(11) DEFAULT NULL,
  `FirstWorkingDate` datetime DEFAULT NULL,
  `LastWorkingDate` datetime DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table coba.tbl_user_master: ~0 rows (approximately)
DELETE FROM `tbl_user_master`;
/*!40000 ALTER TABLE `tbl_user_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_user_master` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
