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


-- Dumping database structure for achi
CREATE DATABASE IF NOT EXISTS `achi` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `achi`;

-- Dumping structure for procedure achi.Get_Mapped_Mail_Task
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Mapped_Mail_Task`(
	IN `i_tasktype` VARCHAR(5)




)
BEGIN

select ot.Id,t.RefNumber, ot.UniqueEmailId, ot.EmailId, ot.ClientNumber, ot.EmailSubject, ot.EmailContent, ot.EmailAttachment, ot.IsMappedToTask, 
ot.IsActive, ot.IsProcessed, ot.RefNumber,t.Version, ot.TaskAttachement, ot.TaskComments, ot.CreatedDate, ot.CreatedBy, ot.TaskAssignedBy,
 ot.TaskAssignedDate, ot.LastModifiedDate, ot.LastModifiedBy  from tbl_onboarding_task ot left join tbl_strategy t on ot.RefNumber=t.RefNumber and ot.Version=t.Version 
where ot.IsMappedToTask =i_tasktype;

END//
DELIMITER ;

-- Dumping structure for procedure achi.Get_StrategyApprovalById
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_StrategyApprovalById`(
	IN `i_RefNumber` VARCHAR(50),
	IN `i_Version` INT
)
BEGIN
Select * from tbl_strategyApproval where RefNumber=i_RefNumber and Version=i_Version;
END//
DELIMITER ;

-- Dumping structure for procedure achi.Get_StrategyApprovalByUser
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_StrategyApprovalByUser`(
	IN `i_user` VARCHAR(50)
)
BEGIN
Select * from tbl_strategyapproval where approver=i_user;

END//
DELIMITER ;

-- Dumping structure for procedure achi.Get_StrategyLatestversionById
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_StrategyLatestversionById`(
	IN `i_RefNumber` VARCHAR(50)


)
BEGIN
Select Version from tbl_strategy where RefNumber=i_RefNumber  order by Version Desc LIMIT 1;
END//
DELIMITER ;

-- Dumping structure for procedure achi.Get_Tasks
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Tasks`()
BEGIN
Select Id,Name,Description,IsSignOff,SignOffDate,SignoffBy,IsActive from tbl_task;
END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_delete_strategy_Approval
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_strategy_Approval`(
	IN `i_RefNumber` VARCHAR(50),
	IN `i_Version` VARCHAR(50),
	IN `i_Approver` VARCHAR(50)

)
BEGIN

delete from tbl_StrategyApproval where RefNumber=i_RefNumber and Version=i_Version  and Approver=i_Approver;
END//
DELIMITER ;

-- Dumping structure for procedure achi.SP_GetMapTask
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetMapTask`()
BEGIN
select ot.Id,t.RefNumber, ot.UniqueEmailId, ot.EmailId, ot.ClientNumber, ot.EmailSubject, ot.EmailContent, ot.EmailAttachment, ot.IsMappedToTask, 
ot.IsActive, ot.IsProcessed, ot.RefNumber,t.Version, ot.TaskAttachement, ot.TaskComments, ot.CreatedDate, ot.CreatedBy, ot.TaskAssignedBy,
 ot.TaskAssignedDate, ot.LastModifiedDate, ot.LastModifiedBy  from tbl_onboarding_task ot left join tbl_strategy t on ot.RefNumber=t.RefNumber and ot.Version =t.Version ;


END//
DELIMITER ;

-- Dumping structure for procedure achi.SP_GetMapTaskbyId
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetMapTaskbyId`(
	IN `i_Id` INT




)
BEGIN
select ot.Id,t.RefNumber, ot.UniqueEmailId, ot.EmailId, ot.ClientNumber, ot.EmailSubject, ot.EmailContent, ot.EmailAttachment, ot.IsMappedToTask, 
ot.IsActive, ot.IsProcessed, ot.RefNumber,t.Version, ot.TaskAttachement, ot.TaskComments, ot.CreatedDate, ot.CreatedBy, ot.TaskAssignedBy,
 ot.TaskAssignedDate, ot.LastModifiedDate, ot.LastModifiedBy  from tbl_onboarding_task ot left join tbl_strategy t on ot.RefNumber=t.RefNumber and ot.Version =t.Version
where ot.Id=i_id;

END//
DELIMITER ;

-- Dumping structure for procedure achi.SP_GetOnboardingTask
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetOnboardingTask`()
BEGIN
select ot.Id,t.RefNumber, ot.UniqueEmailId, ot.EmailId, ot.ClientNumber, ot.EmailSubject, ot.EmailContent, ot.EmailAttachment, ot.IsMappedToTask, 
ot.IsActive, ot.IsProcessed,t.Version, ot.TaskAttachement, ot.TaskComments, ot.CreatedDate, ot.CreatedBy, ot.TaskAssignedBy,
 ot.TaskAssignedDate, ot.LastModifiedDate, ot.LastModifiedBy  from tbl_onboarding_task ot left join tbl_strategy t on ot.RefNumber=t.RefNumber;

END//
DELIMITER ;

-- Dumping structure for procedure achi.SP_GetOnboardingTaskbyId
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetOnboardingTaskbyId`(
	IN `i_Id` INT




)
BEGIN

select ot.Id,t.RefNumber, ot.UniqueEmailId, ot.EmailId, ot.ClientNumber, ot.EmailSubject, ot.EmailContent, ot.EmailAttachment, ot.IsMappedToTask, 
ot.IsActive, ot.IsProcessed, ot.TaskId,t.Name, ot.TaskAttachement, ot.TaskComments, ot.CreatedDate, ot.CreatedBy, ot.TaskAssignedBy,
 ot.TaskAssignedDate, ot.LastModifiedDate, ot.LastModifiedBy  from tbl_onboarding_task ot left join tbl_strategy t on ot.TaskId=t.Id 
Where ot.Id=i_Id;
END//
DELIMITER ;

-- Dumping structure for procedure achi.SP_GetStrategy
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetStrategy`()
BEGIN

SELECT Id, RefNumber, Name, Type, ApplicationName, ApplicationId, BusinessSector, Country, Region, ProductType, Ranking, Objective, Description, RiskRating, BusinessImpact, ExchangeDetails, DetailsOfChanges, ChangesBusinessImpact, SupportingDocument, DateChangeInitiated, DateChangeImplemented, ChangesCompletionStatus, AdditionalParam1, AdditionalParam2, AdditionalParam3, AdditionalParam4, AdditionalParam5, AdditionalParam6, AdditionalParam7, AdditionalParam8, AdditionalParam9, AdditionalParam10, AdditionalParam11, AdditionalParam12, AdditionalParam13, Attribute1, Attribute2, Attribute3, Attribute4, NoOfApprover, Version,FinalSignOff, SignOffDate, SignoffBy, IsActive, CreatedDate, CreatedBy, LastModifiedDate, LastModifiedBy FROM (SELECT * FROM tbl_strategy ORDER BY Version DESC) AS t GROUP BY RefNumber;

END//
DELIMITER ;

-- Dumping structure for procedure achi.SP_GetStrategyById
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetStrategyById`(
	IN `i_RefNumber` VARCHAR(250)



)
BEGIN
select Id, RefNumber, Name, Type, ApplicationName, ApplicationId, BusinessSector, Country, Region, ProductType, Ranking, Objective, Description, RiskRating, BusinessImpact, ExchangeDetails, DetailsOfChanges, ChangesBusinessImpact, SupportingDocument, DateChangeInitiated, DateChangeImplemented, ChangesCompletionStatus, AdditionalParam1, AdditionalParam2, AdditionalParam3, AdditionalParam4, AdditionalParam5, AdditionalParam6, AdditionalParam7, AdditionalParam8, AdditionalParam9, AdditionalParam10, AdditionalParam11, AdditionalParam12, AdditionalParam13, Attribute1, Attribute2, Attribute3, Attribute4, NoOfApprover, Version,FinalSignOff, SignOffDate, SignoffBy, IsActive, CreatedDate, CreatedBy, LastModifiedDate, LastModifiedBy
from tbl_strategy WHERE RefNumber=i_RefNumber;
END//
DELIMITER ;

-- Dumping structure for procedure achi.SP_GetStrategyByRefnumber
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetStrategyByRefnumber`(
	IN `i_RefNumber` VARCHAR(50)

)
BEGIN
select Id, RefNumber, Name, Type, ApplicationName, ApplicationId, BusinessSector, Country, Region, ProductType, Ranking, Objective, Description, RiskRating, BusinessImpact, ExchangeDetails, DetailsOfChanges, ChangesBusinessImpact, SupportingDocument, DateChangeInitiated, DateChangeImplemented, ChangesCompletionStatus, AdditionalParam1, AdditionalParam2, AdditionalParam3, AdditionalParam4, AdditionalParam5, AdditionalParam6, AdditionalParam7, AdditionalParam8, AdditionalParam9, AdditionalParam10, AdditionalParam11, AdditionalParam12, AdditionalParam13, Attribute1, Attribute2, Attribute3, Attribute4, NoOfApprover, Version,FinalSignOff, SignOffDate, SignoffBy, IsActive, CreatedDate, CreatedBy, LastModifiedDate, LastModifiedBy
from tbl_strategy WHERE RefNumber=i_RefNumber;
END//
DELIMITER ;

-- Dumping structure for procedure achi.SP_insert_OnboardingTask
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

-- Dumping structure for procedure achi.sp_insert_Strategy
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_Strategy`(
	IN `i_RefNumber` VARCHAR(50),
	IN `i_Name` VARCHAR(50),
	IN `i_Type` INT,
	IN `i_ApplicationName` VARCHAR(50),
	IN `i_ApplicationId` VARCHAR(50),
	IN `i_BusinessSector` VARCHAR(50),
	IN `i_Country` VARCHAR(50),
	IN `i_Region` VARCHAR(50),
	IN `i_ProductType` VARCHAR(50),
	IN `i_Ranking` VARCHAR(50),
	IN `i_Objective` VARCHAR(50),
	IN `i_Description` VARCHAR(50),
	IN `i_RiskRating` VARCHAR(50),
	IN `i_BusinessImpact` VARCHAR(50),
	IN `i_ExchangeDetails` VARCHAR(50),
	IN `i_AdditionalParam1` VARCHAR(50),
	IN `i_AdditionalParam2` VARCHAR(50),
	IN `i_AdditionalParam3` VARCHAR(50),
	IN `i_AdditionalParam4` VARCHAR(50),
	IN `i_AdditionalParam5` VARCHAR(50),
	IN `i_AdditionalParam6` VARCHAR(50),
	IN `i_AdditionalParam7` VARCHAR(50),
	IN `i_AdditionalParam8` VARCHAR(50),
	IN `i_AdditionalParam9` VARCHAR(50),
	IN `i_AdditionalParam10` VARCHAR(50),
	IN `i_AdditionalParam11` VARCHAR(50),
	IN `i_AdditionalParam12` VARCHAR(50),
	IN `i_AdditionalParam13` VARCHAR(50)
,
	IN `i_Attribute1` VARCHAR(50)
,
	IN `i_Attribute2` VARCHAR(50)
,
	IN `i_Attribute3` VARCHAR(50)
,
	IN `i_Attribute4` VARCHAR(50)

)
BEGIN
insert into tbl_strategy	 (RefNumber, Name, Type, ApplicationName, ApplicationId, BusinessSector, Country, Region, ProductType, Ranking, Objective, Description, RiskRating, BusinessImpact, ExchangeDetails,AdditionalParam1, AdditionalParam2, AdditionalParam3, AdditionalParam4, AdditionalParam5, AdditionalParam6, AdditionalParam7, AdditionalParam8, AdditionalParam9, AdditionalParam10, AdditionalParam11, AdditionalParam12, AdditionalParam13,IsActive,Version) 
values(i_RefNumber, i_Name, i_Type, i_ApplicationName, i_ApplicationId,i_BusinessSector, i_Country, i_Region, i_ProductType, i_Ranking, i_Objective, i_Description, i_RiskRating, i_BusinessImpact, i_ExchangeDetails, i_AdditionalParam1, i_AdditionalParam2, i_AdditionalParam3, i_AdditionalParam4, i_AdditionalParam5, i_AdditionalParam6, i_AdditionalParam7, i_AdditionalParam8, i_AdditionalParam9, i_AdditionalParam10, i_AdditionalParam11, i_AdditionalParam12, i_AdditionalParam13, 'Y',1);
END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_insert_strategy_Approval
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_strategy_Approval`(
	IN `i_RefNumber` VARCHAR(50),
	IN `i_Version` VARCHAR(50),
	IN `i_Approver` VARCHAR(50)


)
BEGIN
 IF (SELECT count(*) FROM tbl_StrategyApproval  WHERE RefNumber=i_RefNumber and  Version=i_Version and Approver=i_Approver)<=0 THEN
BEGIN
INSERT INTO tbl_StrategyApproval (RefNumber, Version,Approver) VALUES (i_RefNumber, i_Version,i_Approver);
END;
END IF;



END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_insert_Strategy_Version
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_Strategy_Version`(
	IN `i_RefNumber` VARCHAR(50),
	IN `i_Name` VARCHAR(50),
	IN `i_Type` INT,
	IN `i_ApplicationName` VARCHAR(50),
	IN `i_ApplicationId` VARCHAR(50),
	IN `i_BusinessSector` VARCHAR(50),
	IN `i_Country` VARCHAR(50),
	IN `i_Region` VARCHAR(50),
	IN `i_ProductType` VARCHAR(50),
	IN `i_Ranking` VARCHAR(50),
	IN `i_Objective` VARCHAR(50),
	IN `i_Description` VARCHAR(50),
	IN `i_RiskRating` VARCHAR(50),
	IN `i_BusinessImpact` VARCHAR(50),
	IN `i_ExchangeDetails` VARCHAR(50),
	IN `i_AdditionalParam1` VARCHAR(50),
	IN `i_AdditionalParam2` VARCHAR(50),
	IN `i_AdditionalParam3` VARCHAR(50),
	IN `i_AdditionalParam4` VARCHAR(50),
	IN `i_AdditionalParam5` VARCHAR(50),
	IN `i_AdditionalParam6` VARCHAR(50),
	IN `i_AdditionalParam7` VARCHAR(50),
	IN `i_AdditionalParam8` VARCHAR(50),
	IN `i_AdditionalParam9` VARCHAR(50),
	IN `i_AdditionalParam10` VARCHAR(50),
	IN `i_AdditionalParam11` VARCHAR(50),
	IN `i_AdditionalParam12` VARCHAR(50),
	IN `i_AdditionalParam13` VARCHAR(50)
,
	IN `i_Attribute1` VARCHAR(50)
,
	IN `i_Attribute2` VARCHAR(50)
,
	IN `i_Attribute3` VARCHAR(50)
,
	IN `i_Attribute4` VARCHAR(50)

,
	IN `i_Version` INT
)
BEGIN
insert into tbl_strategy(RefNumber, Name, Type, ApplicationName, ApplicationId, BusinessSector, Country, Region, ProductType, Ranking, Objective, Description, RiskRating, BusinessImpact, ExchangeDetails,AdditionalParam1, AdditionalParam2, AdditionalParam3, AdditionalParam4, AdditionalParam5, AdditionalParam6, AdditionalParam7, AdditionalParam8, AdditionalParam9, AdditionalParam10, AdditionalParam11, AdditionalParam12, AdditionalParam13,Attribute1,Attribute2,Attribute3,Attribute4,IsActive,Version) 
values(i_RefNumber, i_Name, i_Type, i_ApplicationName, i_ApplicationId,i_BusinessSector, i_Country, i_Region, i_ProductType, i_Ranking, i_Objective, i_Description, i_RiskRating, i_BusinessImpact, i_ExchangeDetails, i_AdditionalParam1, i_AdditionalParam2, i_AdditionalParam3, i_AdditionalParam4, i_AdditionalParam5, i_AdditionalParam6, i_AdditionalParam7, i_AdditionalParam8, i_AdditionalParam9, i_AdditionalParam10, i_AdditionalParam11, i_AdditionalParam12, i_AdditionalParam13,i_Attribute1,i_Attribute2,i_Attribute3,i_Attribute4, 'Y',i_Version);
END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_insert_task
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

-- Dumping structure for procedure achi.sp_update_map_task
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_map_task`(
	IN `i_id` INT,
	IN `i_RefNumber` VARCHAR(50),
	IN `i_Version` INT,
	IN `i_IsMappedToTask` VARCHAR(50)


)
BEGIN
	
	update tbl_onboarding_task set RefNumber=i_RefNumber,Version =i_Version,IsMappedToTask=i_IsMappedToTask where Id=i_id;
	
END//
DELIMITER ;

-- Dumping structure for procedure achi.SP_update_onboardingTask
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

-- Dumping structure for procedure achi.sp_update_Strategy
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_Strategy`(
	IN `i_RefNumber` VARCHAR(50),
	IN `i_Name` VARCHAR(50),
	IN `i_Type` INT,
	IN `i_ApplicationName` VARCHAR(50),
	IN `i_ApplicationId` VARCHAR(50),
	IN `i_BusinessSector` VARCHAR(50),
	IN `i_Country` VARCHAR(50),
	IN `i_Region` VARCHAR(50),
	IN `i_ProductType` VARCHAR(50),
	IN `i_Ranking` VARCHAR(50),
	IN `i_Objective` VARCHAR(50),
	IN `i_Description` VARCHAR(50),
	IN `i_RiskRating` VARCHAR(50),
	IN `i_BusinessImpact` VARCHAR(50),
	IN `i_ExchangeDetails` VARCHAR(50),
	IN `i_AdditionalParam1` VARCHAR(50),
	IN `i_AdditionalParam2` VARCHAR(50),
	IN `i_AdditionalParam3` VARCHAR(50),
	IN `i_AdditionalParam4` VARCHAR(50),
	IN `i_AdditionalParam5` VARCHAR(50),
	IN `i_AdditionalParam6` VARCHAR(50),
	IN `i_AdditionalParam7` VARCHAR(50),
	IN `i_AdditionalParam8` VARCHAR(50),
	IN `i_AdditionalParam9` VARCHAR(50),
	IN `i_AdditionalParam10` VARCHAR(50),
	IN `i_AdditionalParam11` VARCHAR(50),
	IN `i_AdditionalParam12` VARCHAR(50),
	IN `i_AdditionalParam13` VARCHAR(50)
,
	IN `i_Id` INT
,
	IN `i_Page` VARCHAR(50)
,
	IN `i_Attribute1` VARCHAR(50)
,
	IN `i_Attribute2` VARCHAR(50)
,
	IN `i_Attribute3` VARCHAR(50)
,
	IN `i_Attribute4` VARCHAR(50)
,
	IN `i_DetailsOfChanges` VARCHAR(50)
)
BEGIN
if i_Page = 'C' THEN
update tbl_strategy set RefNumber=i_RefNumber, Name =i_Name,  Type=i_Type, ApplicationName = i_ApplicationName, ApplicationId= i_ApplicationId,BusinessSector=i_BusinessSector, Country=   i_Country, Region=i_Region,  ProductType=i_ProductType,  Ranking=i_Ranking, Objective= i_Objective,Description=i_Description, RiskRating=   i_RiskRating, BusinessImpact=   i_BusinessImpact,ExchangeDetails=i_ExchangeDetails,AdditionalParam1= i_AdditionalParam1,AdditionalParam2=i_AdditionalParam2, AdditionalParam3=    i_AdditionalParam3, AdditionalParam4=i_AdditionalParam4, AdditionalParam5=  i_AdditionalParam5,AdditionalParam6=i_AdditionalParam6, AdditionalParam7=i_AdditionalParam7,  AdditionalParam8=i_AdditionalParam8,  AdditionalParam9=i_AdditionalParam9, AdditionalParam10=i_AdditionalParam10,  AdditionalParam11=i_AdditionalParam11,   AdditionalParam12=i_AdditionalParam12, AdditionalParam13= i_AdditionalParam13,Attribute1=i_Attribute1,Attribute2=i_Attribute2,Attribute3=i_Attribute3,Attribute4=i_Attribute4,DetailsOfChanges=i_DetailsOfChanges where Id=i_id; 
else
update tbl_strategy set RefNumber=i_RefNumber, Name =i_Name,  Type=i_Type, ApplicationName = i_ApplicationName, ApplicationId= i_ApplicationId,BusinessSector=i_BusinessSector, Country=   i_Country, Region=i_Region,  ProductType=i_ProductType,  Ranking=i_Ranking, Objective= i_Objective,Description=i_Description, RiskRating=   i_RiskRating, BusinessImpact=   i_BusinessImpact,ExchangeDetails=i_ExchangeDetails,AdditionalParam1= i_AdditionalParam1,AdditionalParam2=i_AdditionalParam2, AdditionalParam3=    i_AdditionalParam3, AdditionalParam4=i_AdditionalParam4, AdditionalParam5=  i_AdditionalParam5,AdditionalParam6=i_AdditionalParam6, AdditionalParam7=i_AdditionalParam7,  AdditionalParam8=i_AdditionalParam8,  AdditionalParam9=i_AdditionalParam9, AdditionalParam10=i_AdditionalParam10,  AdditionalParam11=i_AdditionalParam11,   AdditionalParam12=i_AdditionalParam12, AdditionalParam13= i_AdditionalParam13 where Id=i_id; 
END IF;


END//
DELIMITER ;

-- Dumping structure for procedure achi.Sp_update_strategy_approval
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_update_strategy_approval`(
	IN `i_Comments` VARCHAR(50),
	IN `i_Status` VARCHAR(50),
	IN `i_RefNumber` VARCHAR(50),
	IN `i_Version` VARCHAR(50),
	IN `i_Approver` VARCHAR(50)

)
BEGIN

update tbl_StrategyApproval set Comments =i_Comments,Status=i_Status where RefNumber=i_RefNumber and Version=i_Version  and Approver=i_Approver;

END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_update_task
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

-- Dumping structure for table achi.tbl_client
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_client: ~0 rows (approximately)
DELETE FROM `tbl_client`;
/*!40000 ALTER TABLE `tbl_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_client` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_coutry_master
CREATE TABLE IF NOT EXISTS `tbl_coutry_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_coutry_master: ~0 rows (approximately)
DELETE FROM `tbl_coutry_master`;
/*!40000 ALTER TABLE `tbl_coutry_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_coutry_master` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_onboarding_task
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
  `RefNumber` varchar(30) DEFAULT NULL,
  `Version` varchar(50) DEFAULT NULL,
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

-- Dumping data for table achi.tbl_onboarding_task: ~10 rows (approximately)
DELETE FROM `tbl_onboarding_task`;
/*!40000 ALTER TABLE `tbl_onboarding_task` DISABLE KEYS */;
INSERT INTO `tbl_onboarding_task` (`Id`, `UniqueEmailId`, `EmailId`, `ClientNumber`, `EmailSubject`, `EmailContent`, `EmailAttachment`, `IsMappedToTask`, `IsActive`, `IsProcessed`, `RefNumber`, `Version`, `TaskAttachement`, `TaskComments`, `CreatedDate`, `CreatedBy`, `TaskAssignedBy`, `TaskAssignedDate`, `LastModifiedDate`, `LastModifiedBy`, `Res1`, `Res2`, `Res3`, `Res4`, `Res5`, `Res6`, `Res7`, `Res8`, `Res9`, `Res10`) VALUES
	(23, '<PN1PR01MB01754671E3073D11DDE971C1C48B0@PN1PR01MB0175.INDPRD01.PROD.OUTLOOK.COM>', '<PN1PR01MB01754671E3073D11DDE971C1C48B0@PN1PR01MB0175.INDPRD01.PROD.OUTLOOK.COM>', '12453', 'Fw: Test 12453 (Trial Version)', '<html><head>\r\n<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\r\n<style type="text/css" style="display:none;"><!-- P {margin-top:0;margin-bottom:0;} --></style>\r\n</head>\r\n<body dir="ltr">\r\n<div id="divtagdefaultwrapper" style="font-size:12pt;color:#000000;font-family:Calibri,Helvetica,sans-serif;" dir="ltr">\r\n<p><br>\r\n</p>\r\n<br>\r\n<br>\r\n<div style="color: rgb(0, 0, 0);">\r\n<hr tabindex="-1" style="display:inline-block; width:98%">\r\n<div id="divRplyFwdMsg" dir="ltr"><font face="Calibri, sans-serif" color="#000000" style="font-size:11pt"><b>From:</b> jayakumar T &lt;savvyjayakumar@outlook.com&gt;<br>\r\n<b>Sent:</b> Sunday, August 6, 2017 3:27 PM<br>\r\n<b>To:</b> jayakumar T<br>\r\n<b>Subject:</b> Test </font>\r\n<div></div>\r\n</div>\r\n<div>\r\n<div id="divtagdefaultwrapper" dir="ltr" style="font-size:12pt; color:#000000; font-family:Calibri,Helvetica,sans-serif">\r\n<p>testing subjecce</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</body>\r\n</html>\r\n\r\n', 'new doc 2017-06-06 17.34.40_20170606173456.pdf,', 'Y', 'Y', 'N', '1', '1', 'test desjk.txt', NULL, '2017-08-09 00:00:00', 'savvyjayakumar@outlook.com', NULL, '2017-08-10 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(24, '<PN1PR01MB017552B43CF87F60003D9972C4890@PN1PR01MB0175.INDPRD01.PROD.OUTLOOK.COM>', 'savvyjayakumar@outlook.com', '34121', 'Fw: Test 34121 (Trial Version)', '<html><head>\r\n<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\r\n<style type="text/css" style="display:none;"><!-- P {margin-top:0;margin-bottom:0;} --></style>\r\n</head>\r\n<body dir="ltr">\r\n<div id="divtagdefaultwrapper" style="font-size:12pt;color:#000000;font-family:Calibri,Helvetica,sans-serif;" dir="ltr">\r\n<p>testing</p>\r\n</div>\r\n</body>\r\n</html>\r\n\r\n', 'new doc 2017-06-06 17.34.40_20170606173456.pdf,', 'Y', 'Y', 'N', '1', '2', NULL, NULL, '2017-08-11 00:00:00', 'savvyjayakumar@outlook.com', NULL, '2017-08-11 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(26, '<PN1PR01MB01759455E412C6E3B29C926EC4890@PN1PR01MB0175.INDPRD01.PROD.OUTLOOK.COM>', 'savvyjayakumar@outlook.com', '1234567', '1234567 (Trial Version)', '<html><head>\r\n<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\r\n<style type="text/css" style="display:none;"><!-- P {margin-top:0;margin-bottom:0;} --></style>\r\n</head>\r\n<body dir="ltr">\r\n<div id="divtagdefaultwrapper" style="font-size:12pt;color:#000000;font-family:Calibri,Helvetica,sans-serif;" dir="ltr">\r\n<p>jay test</p>\r\n</div>\r\n</body>\r\n</html>\r\n\r\n', 'Custom Report Pending point Status till 8 Aug_Customer care Inbound.xlsx,', 'Y', 'Y', 'N', '1', '1', NULL, NULL, '2017-08-11 00:00:00', 'savvyjayakumar@outlook.com', NULL, '2017-08-11 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, '<PN1PR01MB017575A87BFFDEC39D2A5F71C4890@PN1PR01MB0175.INDPRD01.PROD.OUTLOOK.COM>', 'savvyjayakumar@outlook.com', '1234567', 'Fw: 1234567 (Trial Version)', '<html><head>\r\n<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\r\n<style type="text/css" style="display:none;"><!-- P {margin-top:0;margin-bottom:0;} --></style>\r\n</head>\r\n<body dir="ltr">\r\n<div id="divtagdefaultwrapper" style="font-size:12pt;color:#000000;font-family:Calibri,Helvetica,sans-serif;" dir="ltr">\r\n<p><br>\r\n</p>\r\n<br>\r\n<br>\r\n<div style="color: rgb(0, 0, 0);">\r\n<hr tabindex="-1" style="display:inline-block; width:98%">\r\n<div id="divRplyFwdMsg" dir="ltr"><font face="Calibri, sans-serif" color="#000000" style="font-size:11pt"><b>From:</b> jayakumar T &lt;savvyjayakumar@outlook.com&gt;<br>\r\n<b>Sent:</b> Friday, August 11, 2017 8:24 PM<br>\r\n<b>To:</b> jayakumar T<br>\r\n<b>Subject:</b> 1234567</font>\r\n<div></div>\r\n</div>\r\n<div>\r\n<div id="divtagdefaultwrapper" dir="ltr" style="font-size:12pt; color:#000000; font-family:Calibri,Helvetica,sans-serif">\r\n<p>jay test</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</body>\r\n</html>\r\n\r\n', 'cobasclientschema.sql,', 'Y', 'Y', 'N', '1', '2', NULL, NULL, '2017-08-11 00:00:00', 'savvyjayakumar@outlook.com', NULL, '2017-08-11 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(28, '<PN1PR01MB017551FBE17EF2BAF90E8B46C4890@PN1PR01MB0175.INDPRD01.PROD.OUTLOOK.COM>', 'savvyjayakumar@outlook.com', '12345678', 'Fw: 12345678 (Trial Version)', '<html><head>\r\n<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\r\n<style type="text/css" style="display:none;"><!-- P {margin-top:0;margin-bottom:0;} --></style>\r\n</head>\r\n<body dir="ltr">\r\n<div id="divtagdefaultwrapper" style="font-size:12pt;color:#000000;font-family:Calibri,Helvetica,sans-serif;" dir="ltr">\r\n<p><br>\r\n</p>\r\n<br>\r\n<br>\r\n<div style="color: rgb(0, 0, 0);">\r\n<hr tabindex="-1" style="display:inline-block; width:98%">\r\n<div id="divRplyFwdMsg" dir="ltr"><font face="Calibri, sans-serif" color="#000000" style="font-size:11pt"><b>From:</b> jayakumar T &lt;savvyjayakumar@outlook.com&gt;<br>\r\n<b>Sent:</b> Friday, August 11, 2017 8:28 PM<br>\r\n<b>To:</b> jayakumar T<br>\r\n<b>Subject:</b> Fw: 1234567</font>\r\n<div></div>\r\n</div>\r\n<div>\r\n<div id="divtagdefaultwrapper" dir="ltr" style="font-size:12pt; color:#000000; font-family:Calibri,Helvetica,sans-serif">\r\n<p><br>\r\n</p>\r\n<br>\r\n<br>\r\n<div style="color:rgb(0,0,0)">\r\n<hr tabindex="-1" style="display:inline-block; width:98%">\r\n<div id="divRplyFwdMsg" dir="ltr"><font face="Calibri, sans-serif" color="#000000" style="font-size:11pt"><b>From:</b> jayakumar T &lt;savvyjayakumar@outlook.com&gt;<br>\r\n<b>Sent:</b> Friday, August 11, 2017 8:24 PM<br>\r\n<b>To:</b> jayakumar T<br>\r\n<b>Subject:</b> 1234567</font>\r\n<div></div>\r\n</div>\r\n<div>\r\n<div id="divtagdefaultwrapper" dir="ltr" style="font-size:12pt; color:#000000; font-family:Calibri,Helvetica,sans-serif">\r\n<p>jay test</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</body>\r\n</html>\r\n\r\n', 'cobasclientschema.sql,', 'Y', 'Y', 'N', '1', '1', NULL, NULL, '2017-08-11 00:00:00', 'savvyjayakumar@outlook.com', NULL, '2017-08-11 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(29, '<PN1PR01MB0175C619E763F9EBC54815C7C4890@PN1PR01MB0175.INDPRD01.PROD.OUTLOOK.COM>', 'savvyjayakumar@outlook.com', '123456789', 'Fw: 123456789 (Trial Version)', '<html><head>\r\n<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\r\n<style type="text/css" style="display:none;"><!-- P {margin-top:0;margin-bottom:0;} --></style>\r\n</head>\r\n<body dir="ltr">\r\n<div id="divtagdefaultwrapper" style="font-size:12pt;color:#000000;font-family:Calibri,Helvetica,sans-serif;" dir="ltr">\r\n<p><br>\r\n</p>\r\n<br>\r\n<br>\r\n<div style="color: rgb(0, 0, 0);">\r\n<hr tabindex="-1" style="display:inline-block; width:98%">\r\n<div id="divRplyFwdMsg" dir="ltr"><font face="Calibri, sans-serif" color="#000000" style="font-size:11pt"><b>From:</b> jayakumar T &lt;savvyjayakumar@outlook.com&gt;<br>\r\n<b>Sent:</b> Friday, August 11, 2017 8:36 PM<br>\r\n<b>To:</b> jayakumar T<br>\r\n<b>Subject:</b> Fw: 12345678</font>\r\n<div></div>\r\n</div>\r\n<div>\r\n<div id="divtagdefaultwrapper" dir="ltr" style="font-size:12pt; color:#000000; font-family:Calibri,Helvetica,sans-serif">\r\n<p><br>\r\n</p>\r\n<br>\r\n<br>\r\n<div style="color:rgb(0,0,0)">\r\n<hr tabindex="-1" style="display:inline-block; width:98%">\r\n<div id="divRplyFwdMsg" dir="ltr"><font face="Calibri, sans-serif" color="#000000" style="font-size:11pt"><b>From:</b> jayakumar T &lt;savvyjayakumar@outlook.com&gt;<br>\r\n<b>Sent:</b> Friday, August 11, 2017 8:28 PM<br>\r\n<b>To:</b> jayakumar T<br>\r\n<b>Subject:</b> Fw: 1234567</font>\r\n<div></div>\r\n</div>\r\n<div>\r\n<div id="divtagdefaultwrapper" dir="ltr" style="font-size:12pt; color:#000000; font-family:Calibri,Helvetica,sans-serif">\r\n<p><br>\r\n</p>\r\n<br>\r\n<br>\r\n<div style="color:rgb(0,0,0)">\r\n<hr tabindex="-1" style="display:inline-block; width:98%">\r\n<div id="divRplyFwdMsg" dir="ltr"><font face="Calibri, sans-serif" color="#000000" style="font-size:11pt"><b>From:</b> jayakumar T &lt;savvyjayakumar@outlook.com&gt;<br>\r\n<b>Sent:</b> Friday, August 11, 2017 8:24 PM<br>\r\n<b>To:</b> jayakumar T<br>\r\n<b>Subject:</b> 1234567</font>\r\n<div></div>\r\n</div>\r\n<div>\r\n<div id="divtagdefaultwrapper" dir="ltr" style="font-size:12pt; color:#000000; font-family:Calibri,Helvetica,sans-serif">\r\n<p>jay test</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</body>\r\n</html>\r\n\r\n', 'cobasclientschema.sql,', 'N', 'Y', 'N', NULL, NULL, NULL, NULL, '2017-08-11 00:00:00', 'savvyjayakumar@outlook.com', NULL, '2017-08-11 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(30, '<CAKzhRk1=T=3ds-A8KLm3xfF814VfqVUHD_qq0auBp9j7cVyKQg@mail.gmail.com>', 'sthirupathikumar@gmail.com', '12131415', '12131415 (Trial Version)', '<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><div dir="ltr">This is test mail<br clear="all"><div><br></div>-- <br><div class="gmail_signature" data-smartmail="gmail_signature">Regards,<br>Thirupathi<br></div>\r\n</div>\r\n\r\n', 'wr1.doc,', 'N', 'Y', 'N', NULL, NULL, NULL, NULL, '2017-08-15 00:00:00', 'sthirupathikumar@gmail.com', NULL, '2017-08-15 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(31, '<CAE_CuUj7w2h7PNxzOo7xYrqs=6UiZFk1y4vkUONvBJpJABCA6Q@mail.gmail.com>', 'honikeyan@gmail.com', '11111123444', 'Fwd: CLient ID : 11111123444 (Trial Version)', '<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><div dir="ltr"><br><div class="gmail_quote">---------- Forwarded message ----------<br>From: <b class="gmail_sendername">Kar A</b> <span dir="ltr">&lt;<a href="mailto:honikeyan@gmail.com">honikeyan@gmail.com</a>&gt;</span><br>Date: Tue, Aug 15, 2017 at 10:46 PM<br>Subject: CLient ID : 11111123444<br>To: <a href="mailto:savvjayakumar@outlook.com">savvjayakumar@outlook.com</a><br><br><br><div dir="ltr"><br></div>\r\n</div><br></div>\r\n\r\n', 'Test mail.pptx,', 'N', 'Y', 'N', NULL, NULL, NULL, NULL, '2017-08-15 00:00:00', 'honikeyan@gmail.com', NULL, '2017-08-15 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(32, '<CAE_CuUiD53MgG40dqChegQgcU-ue56irYQUR_bwFcErCTEwKOw@mail.gmail.com>', 'honikeyan@gmail.com', '11111123444', 'Fwd: CLient ID : 11111123444 (Trial Version)', '<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><div dir="ltr"><br><div class="gmail_quote">---------- Forwarded message ----------<br>From: <b class="gmail_sendername">Kar A</b> <span dir="ltr">&lt;<a href="mailto:honikeyan@gmail.com">honikeyan@gmail.com</a>&gt;</span><br>Date: Tue, Aug 15, 2017 at 10:58 PM<br>Subject: CLient ID : 11111123444<br>To: <a href="mailto:savvjayakumar@outlook.com">savvjayakumar@outlook.com</a><br><br><br><div dir="ltr"><br></div>\r\n</div><br></div>\r\n\r\n', 'Test mail_new.pptx,', 'Y', 'Y', 'N', '12', NULL, NULL, NULL, '2017-08-15 00:00:00', 'honikeyan@gmail.com', NULL, '2017-08-15 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(33, '<CAE_CuUi6iNDkHPbd-p4ctE7EYNfvu115b7MYNQeXMgxaxXQDEQ@mail.gmail.com>', 'honikeyan@gmail.com', '11111123444', 'Fwd: CLient ID : 11111123444 (Trial Version)', '<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><div dir="ltr"><br><div class="gmail_quote">---------- Forwarded message ----------<br>From: <b class="gmail_sendername">Kar A</b> <span dir="ltr">&lt;<a href="mailto:honikeyan@gmail.com">honikeyan@gmail.com</a>&gt;</span><br>Date: Tue, Aug 15, 2017 at 10:46 PM<br>Subject: CLient ID : 11111123444<br>To: <a href="mailto:savvjayakumar@outlook.com">savvjayakumar@outlook.com</a><br><br><br><div dir="ltr"><br></div>\r\n</div><br></div>\r\n\r\n', 'Test mail.pptx,', 'Y', 'Y', 'N', '5', NULL, NULL, NULL, '2017-08-15 00:00:00', 'honikeyan@gmail.com', NULL, '2017-08-15 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `tbl_onboarding_task` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_region_master
CREATE TABLE IF NOT EXISTS `tbl_region_master` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CountryId` int(11) NOT NULL,
  `RegionName` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_region_master: ~0 rows (approximately)
DELETE FROM `tbl_region_master`;
/*!40000 ALTER TABLE `tbl_region_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_region_master` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_right_master
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

-- Dumping data for table achi.tbl_right_master: ~0 rows (approximately)
DELETE FROM `tbl_right_master`;
/*!40000 ALTER TABLE `tbl_right_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_right_master` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_roleright_mapping
CREATE TABLE IF NOT EXISTS `tbl_roleright_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` int(11) DEFAULT NULL,
  `RightID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_roleright_mapping: ~0 rows (approximately)
DELETE FROM `tbl_roleright_mapping`;
/*!40000 ALTER TABLE `tbl_roleright_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_roleright_mapping` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_role_master
CREATE TABLE IF NOT EXISTS `tbl_role_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_role_master: ~0 rows (approximately)
DELETE FROM `tbl_role_master`;
/*!40000 ALTER TABLE `tbl_role_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_role_master` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_strategy
CREATE TABLE IF NOT EXISTS `tbl_strategy` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RefNumber` varchar(30) NOT NULL,
  `Name` varchar(300) DEFAULT NULL,
  `Type` int(3) NOT NULL,
  `ApplicationName` varchar(250) NOT NULL,
  `ApplicationId` varchar(30) NOT NULL,
  `BusinessSector` varchar(250) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `Region` varchar(50) NOT NULL,
  `ProductType` varchar(50) NOT NULL,
  `Ranking` varchar(50) NOT NULL,
  `Objective` text NOT NULL,
  `Description` text NOT NULL,
  `RiskRating` varchar(250) NOT NULL,
  `BusinessImpact` varchar(250) NOT NULL,
  `ExchangeDetails` varchar(250) NOT NULL,
  `DetailsOfChanges` text,
  `ChangesBusinessImpact` varchar(250) DEFAULT NULL,
  `SupportingDocument` varchar(750) DEFAULT NULL,
  `DateChangeInitiated` datetime DEFAULT NULL,
  `DateChangeImplemented` datetime DEFAULT NULL,
  `ChangesCompletionStatus` int(3) DEFAULT NULL,
  `AdditionalParam1` varchar(100) NOT NULL,
  `AdditionalParam2` varchar(100) NOT NULL,
  `AdditionalParam3` varchar(100) NOT NULL,
  `AdditionalParam4` varchar(100) NOT NULL,
  `AdditionalParam5` varchar(100) NOT NULL,
  `AdditionalParam6` varchar(100) NOT NULL,
  `AdditionalParam7` varchar(100) NOT NULL,
  `AdditionalParam8` varchar(100) NOT NULL,
  `AdditionalParam9` varchar(100) NOT NULL,
  `AdditionalParam10` varchar(100) NOT NULL,
  `AdditionalParam11` varchar(100) NOT NULL,
  `AdditionalParam12` varchar(100) NOT NULL,
  `AdditionalParam13` varchar(100) NOT NULL,
  `Attribute1` varchar(100) DEFAULT NULL,
  `Attribute2` varchar(100) DEFAULT NULL,
  `Attribute3` varchar(100) DEFAULT NULL,
  `Attribute4` varchar(100) DEFAULT NULL,
  `NoOfApprover` int(3) DEFAULT NULL,
  `Version` int(3) NOT NULL,
  `FinalSignOff` varchar(1) DEFAULT NULL,
  `SignOffDate` datetime DEFAULT NULL,
  `SignoffBy` varchar(100) DEFAULT NULL,
  `IsActive` varchar(1) NOT NULL,
  `CreatedDate` datetime DEFAULT NULL,
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
  PRIMARY KEY (`Id`,`RefNumber`,`Version`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_strategy: ~2 rows (approximately)
DELETE FROM `tbl_strategy`;
/*!40000 ALTER TABLE `tbl_strategy` DISABLE KEYS */;
INSERT INTO `tbl_strategy` (`Id`, `RefNumber`, `Name`, `Type`, `ApplicationName`, `ApplicationId`, `BusinessSector`, `Country`, `Region`, `ProductType`, `Ranking`, `Objective`, `Description`, `RiskRating`, `BusinessImpact`, `ExchangeDetails`, `DetailsOfChanges`, `ChangesBusinessImpact`, `SupportingDocument`, `DateChangeInitiated`, `DateChangeImplemented`, `ChangesCompletionStatus`, `AdditionalParam1`, `AdditionalParam2`, `AdditionalParam3`, `AdditionalParam4`, `AdditionalParam5`, `AdditionalParam6`, `AdditionalParam7`, `AdditionalParam8`, `AdditionalParam9`, `AdditionalParam10`, `AdditionalParam11`, `AdditionalParam12`, `AdditionalParam13`, `Attribute1`, `Attribute2`, `Attribute3`, `Attribute4`, `NoOfApprover`, `Version`, `FinalSignOff`, `SignOffDate`, `SignoffBy`, `IsActive`, `CreatedDate`, `CreatedBy`, `LastModifiedDate`, `LastModifiedBy`, `Res1`, `Res2`, `Res3`, `Res4`, `Res5`, `Res6`, `Res7`, `Res8`, `Res9`, `Res10`) VALUES
	(10, '1', 'name', 1, 'app', 'Appid', 'bs', 'country', 'region', 'product', 'sr', 'obj', 'des', 'rr', '11', 'ed', 'detail', NULL, NULL, NULL, NULL, NULL, '1', 'ap1', '1', '1', '1', '1', '11', '11', '1', '11', '1', '1', '1', '1', '3', '2', '4', NULL, 1, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, '1', 'name', 1, 'app', 'Appid', 'bs', 'country', 'region', 'product', 'sr', 'obj', 'des', 'rr', '11', 'ed', NULL, NULL, NULL, NULL, NULL, NULL, '1', 'ap1', '1', '1', '1', '1', '11', '11', '1', '11', '1', '1', '1', '1', '3', '2', '4', NULL, 2, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `tbl_strategy` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_strategyapproval
CREATE TABLE IF NOT EXISTS `tbl_strategyapproval` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `RefNumber` varchar(50) DEFAULT '0',
  `Version` varchar(50) DEFAULT '0',
  `Approver` varchar(50) DEFAULT '0',
  `Comments` varchar(50) DEFAULT '0',
  `ApprovedDate` varchar(50) DEFAULT '0',
  `Status` varchar(50) DEFAULT '0',
  `Reserve1` varchar(50) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_strategyapproval: ~5 rows (approximately)
DELETE FROM `tbl_strategyapproval`;
/*!40000 ALTER TABLE `tbl_strategyapproval` DISABLE KEYS */;
INSERT INTO `tbl_strategyapproval` (`Id`, `RefNumber`, `Version`, `Approver`, `Comments`, `ApprovedDate`, `Status`, `Reserve1`) VALUES
	(49, '1', '1', 'George', 'Test', '0', 'Y', '0'),
	(50, '1', '1', 'John', 'Testing', '0', 'N', '0'),
	(51, '1', '1', 'Sivakumar', 'siva testing', '0', 'Y', '0'),
	(52, '1', '1', 'Oliver', '0', '0', '0', '0'),
	(59, '1', '1', 'Daniel', '0', '0', '0', '0');
/*!40000 ALTER TABLE `tbl_strategyapproval` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_task
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_task: ~0 rows (approximately)
DELETE FROM `tbl_task`;
/*!40000 ALTER TABLE `tbl_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_task` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_user_master
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

-- Dumping data for table achi.tbl_user_master: ~0 rows (approximately)
DELETE FROM `tbl_user_master`;
/*!40000 ALTER TABLE `tbl_user_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_user_master` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
