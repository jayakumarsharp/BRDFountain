-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.57 - MySQL Community Server (GPL)
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

-- Dumping structure for procedure achi.delete_RoleRight
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_RoleRight`(
	IN `i_roleid` INT


)
BEGIN
delete from tbl_roleright_mapping where RoleID=i_roleid;

END//
DELIMITER ;

-- Dumping structure for procedure achi.Get_ApprovaltransferByuser
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_ApprovaltransferByuser`(
	IN `i_user` VARCHAR(50)


)
BEGIN
Select * from tbl_approvaltransfer where Originalapprover=i_user;

END//
DELIMITER ;

-- Dumping structure for procedure achi.Get_DelegateApprovalByUser
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_DelegateApprovalByUser`(
	IN `i_user` VARCHAR(50)
)
BEGIN

 Select  `Id`, `RefNumber`, `Version`, `Approver`, '' `OriginalApprover`, `Comments`, `ApprovedDate`, `Status`, `ActionStatus`, `IsActive`, `IsTransfered`, `IsDelegateAccepted`, `IsViewed`, `IsModified`, `Type`
 from tbl_strategyapproval  where OriginalApprover=i_user and IsActive='Y';
 

END//
DELIMITER ;

-- Dumping structure for procedure achi.Get_StrategyApprovalById
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_StrategyApprovalById`(
	IN `i_RefNumber` VARCHAR(50),
	IN `i_Version` INT

)
BEGIN
Select * from tbl_strategyApproval where RefNumber=i_RefNumber and Version=i_Version and IsActive='Y';
END//
DELIMITER ;

-- Dumping structure for procedure achi.Get_StrategyApprovalByUser
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_StrategyApprovalByUser`(
	IN `i_user` VARCHAR(50)

)
BEGIN

SELECT 
`Id`, `RefNumber`, `Version`, `Approver`, `OriginalApprover`, `Comments`, `ApprovedDate`, `Status`, `ActionStatus`, `IsActive`, `IsTransfered`, `IsDelegateAccepted`, `IsViewed`, `IsModified`, `Type`
 FROM achi.tbl_approvaltransfer  where approver=i_user and IsActive='Y'
 
union
 Select 
 `Id`, `RefNumber`, `Version`, `Approver`, '' `OriginalApprover`, `Comments`, `ApprovedDate`, `Status`, `ActionStatus`, `IsActive`, `IsTransfered`, `IsDelegateAccepted`, `IsViewed`, `IsModified`, `Type`
 from tbl_strategyapproval  where approver=i_user and IsActive='Y';
 

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

-- Dumping structure for procedure achi.SP_AddRole
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AddRole`()
BEGIN

END//
DELIMITER ;

-- Dumping structure for procedure achi.Sp_AddRoleRightMapping
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_AddRoleRightMapping`()
BEGIN

END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_adduser
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_adduser`(
	IN `i_userid` VARCHAR(50),
	IN `i_username` VARCHAR(50),
	IN `i_emailid` VARCHAR(50),
	IN `i_Roleid` VARCHAR(50),
	IN `i_countryid` INT,
	IN `i_regionid` INT,
	IN `i_businesssectorid` INT
,
	IN `i_password` VARCHAR(4000),
	IN `i_IsADUser` VARCHAR(50)

)
BEGIN
if(i_IsADUser ='Yes') then
insert into tbl_user_master (Userid,UserName,EmailId,RoleId,CountryId,RegionId,BusinessSectorId,Status,IsADUser) values(i_userid,i_username,i_emailid,i_Roleid,i_countryid,i_regionid,i_businesssectorid,'Active',i_IsADUser);
else
insert into tbl_user_master (Userid,UserName,EmailId,RoleId,CountryId,RegionId,BusinessSectorId,Status,password,IsADUser) values(i_userid,i_username,i_emailid,i_Roleid,i_countryid,i_regionid,i_businesssectorid,'Active',i_password,i_IsADUser);
end if;
END//
DELIMITER ;

-- Dumping structure for procedure achi.SP_DeleteRole
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DeleteRole`(
	IN `i_id` INT
)
BEGIN

delete from tbl_role_master where id=i_id;

END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_delete_ApplicationMaster
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_ApplicationMaster`(
	IN `i_id` INT

)
BEGIN
delete from tbl_ApplicationMaster where id=i_id;
END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_delete_BusinessSector
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_BusinessSector`(
	IN `i_id` INT

)
BEGIN
delete from tbl_BusinessSector where id=i_id;
END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_delete_country
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_country`(
	IN `i_id` INT

)
BEGIN
delete from tbl_country_master where id=i_id;
END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_delete_ProductType
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_ProductType`(
	IN `i_id` INT
)
BEGIN
delete from tbl_ProductTypemaster where id=i_id;
END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_delete_region
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_region`(
	IN `i_id` INT

)
BEGIN
delete from tbl_region_master where id=i_id;
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

update tbl_StrategyApproval set IsActive='N' where RefNumber=i_RefNumber and Version=i_Version  and Approver=i_Approver;
END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_delete_transfersetting
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_transfersetting`(
	IN `i_owner` VARCHAR(50)

)
BEGIN
update tbl_transfersetting set isactive='N' where Owneruser=i_owner;
END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_getallApplicationMaster
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getallApplicationMaster`(
	IN `i_Id` VARCHAR(50)
)
BEGIN
if(i_Id !='') then

select * from tbl_ApplicationMaster where Id=i_id;
else
select * from tbl_ApplicationMaster;
end if;
END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_getallBusinessSector
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getallBusinessSector`(
	IN `i_Id` VARCHAR(50)

)
BEGIN

if(i_Id !='') then

select * from tbl_BusinessSector where Id=i_id;
else
select * from tbl_BusinessSector;
end if;

END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_getallcountry
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getallcountry`(
	IN `i_Id` VARCHAR(50)
)
BEGIN


if(i_Id !='') then

select * from tbl_country_master where Id=i_id;
else
select * from tbl_country_master;
end if;



END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_getallProduct
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getallProduct`(
	IN `i_Id` VARCHAR(50)

)
BEGIN

if(i_Id !='') then

select * from tbl_ProductTypemaster where Id=i_id;
else
select * from tbl_ProductTypemaster;
end if;



END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_getallregion
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getallregion`(
	IN `i_Id` VARCHAR(50)
)
BEGIN

if(i_Id !='') then

select * from tbl_region_master where Id=i_id;
else
select * from tbl_region_master;
end if;



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

-- Dumping structure for procedure achi.sp_getmenuforuser
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getmenuforuser`(
	IN `i_UserId` VARCHAR(50)


)
BEGIN
select distinct MenuName, Path, RM.RightID, RM.ShowMenu, RM.Icon from TBL_RIGHT_MASTER RM inner join TBL_ROLERIGHT_MAPPING RR on RM.RightID=RR.RightID inner join TBL_USER_MASTER UM on RR.RoleID=UM.RoleId where UM.Userid = i_UserId and RM.IsActive='Y' order by RM.RightID;
END//
DELIMITER ;

-- Dumping structure for procedure achi.SP_GetRightForUser
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetRightForUser`(
	IN `i_userid` VARCHAR(50)
)
BEGIN

select distinct RightName, Path from TBL_RIGHT_MASTER RM inner join TBL_ROLERIGHT_MAPPING RR on RM.RightID=RR.RightID inner join TBL_USER_MASTER UM on RR.RoleID=UM.RoleId where UM.Userid = i_userid;
END//
DELIMITER ;

-- Dumping structure for procedure achi.Sp_GetRights
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_GetRights`(
	IN `i_roleid` VARCHAR(50)



)
BEGIN

if(i_roleid!='') then
Select * from tbl_right_master where RightId=i_roleid  and Isactive='Y';
else
Select * from tbl_right_master where  Isactive='Y';
end if;
END//
DELIMITER ;

-- Dumping structure for procedure achi.SP_GetRoleRights
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetRoleRights`(
	IN `i_roleId` INT
)
BEGIN
select * from tbl_roleright_mapping where roleId=i_roleId;
END//
DELIMITER ;

-- Dumping structure for procedure achi.Sp_GetRoles
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_GetRoles`(
	IN `i_roleId` VARCHAR(50)
)
BEGIN

if(i_roleId !='') then
select * from tbl_Role_Master where Id=i_roleId;
else
select * from tbl_Role_Master ;
End if;

END//
DELIMITER ;

-- Dumping structure for procedure achi.Sp_getRolesbyuserassigned
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_getRolesbyuserassigned`(
	IN `i_roleid` VARCHAR(50)

)
BEGIN
select u.Userid,u.UserName,u.EmailId,u.RegionId,r.RegionName,u.CountryId,c.CountryName,u.BusinessSectorId,b.Name,u.RoleId,rm.RoleName,u.Status from tbl_user_master u join tbl_businesssector b on u.BusinessSectorId=b.Id join tbl_region_master r  on u.RegionId=r.Id join tbl_country_master c  on u.CountryId=c.id join tbl_role_master rm on u.RoleId=rm.Id
where u.RoleId=i_roleid;

END//
DELIMITER ;

-- Dumping structure for procedure achi.SP_GetStrategy
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetStrategy`()
BEGIN

SELECT S.Id, RefNumber, S.Name, Type, S.ApplicationId,A.ApplicationID as AppId,A.ApplicationName,S.ApplicationId, S.BusinessSector,B.Name  as BusinessSectorName, S.Country , C.CountryName, S.Region,R.RegionName, S.ProductType,P.ProductType as ProductTypeName, Ranking, Objective, Description, RiskRating, BusinessImpact, ExchangeDetails, DetailsOfChanges, ChangesBusinessImpact, SupportingDocument, DateChangeInitiated, DateChangeImplemented, ChangesCompletionStatus, AdditionalParam1, AdditionalParam2, AdditionalParam3, AdditionalParam4, AdditionalParam5, AdditionalParam6, AdditionalParam7, AdditionalParam8, AdditionalParam9, AdditionalParam10, AdditionalParam11, AdditionalParam12, AdditionalParam13, Attribute1, Attribute2, Attribute3, Attribute4, NoOfApprover, Version,FinalSignOff, SignOffDate, SignoffBy, IsActive, CreatedDate, CreatedBy, LastModifiedDate, LastModifiedBy FROm
(select * from tbl_strategy ORDER BY Version DESC) AS S join tbl_ApplicationMaster A  On S.ApplicationId=A.Id 
JOin tbl_country_master C on S.Country=C.id 
join tbl_region_master R on S.Region= R.Id
Join tbl_businesssector	B on S.BusinessSector =B.Id
JOIN tbl_producttypemaster P on S.ProductType=P.Id 

 GROUP BY RefNumber;

END//
DELIMITER ;

-- Dumping structure for procedure achi.SP_GetStrategyById
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetStrategyById`(
	IN `i_RefNumber` VARCHAR(250)








)
BEGIN
select S.Id, RefNumber, S.Name, Type, S.ApplicationId,A.ApplicationID as AppId,A.ApplicationName,S.ApplicationId, S.BusinessSector,B.Name  as BusinessSectorName, S.Country , C.CountryName, S.Region,R.RegionName, S.ProductType ,P.ProductType as ProductTypeName, Ranking, Objective, Description, RiskRating, BusinessImpact, ExchangeDetails, DetailsOfChanges, ChangesBusinessImpact, SupportingDocument, DateChangeInitiated, DateChangeImplemented, ChangesCompletionStatus, AdditionalParam1, AdditionalParam2, AdditionalParam3, AdditionalParam4, AdditionalParam5, AdditionalParam6, AdditionalParam7, AdditionalParam8, AdditionalParam9, AdditionalParam10, AdditionalParam11, AdditionalParam12, AdditionalParam13, Attribute1, Attribute2, Attribute3, Attribute4, NoOfApprover, Version,FinalSignOff, SignOffDate, SignoffBy, IsActive, CreatedDate, CreatedBy, LastModifiedDate, LastModifiedBy
from tbl_strategy S join tbl_ApplicationMaster A  On S.ApplicationId=A.Id 
JOin tbl_country_master C on S.Country=C.id 
join tbl_region_master R on S.Region= R.Id
Join tbl_businesssector	B on S.BusinessSector =B.Id
JOIN tbl_producttypemaster P on S.ProductType=P.Id
 WHERE S.Id=i_RefNumber;
END//
DELIMITER ;

-- Dumping structure for procedure achi.SP_GetStrategyByRefnumber
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetStrategyByRefnumber`(
	IN `i_RefNumber` VARCHAR(50)




)
BEGIN

select S.Id, RefNumber, S.Name, Type, S.ApplicationId,A.ApplicationID as AppId,A.ApplicationName,S.ApplicationId, S.BusinessSector,B.Name  as BusinessSectorName, S.Country , C.CountryName, S.Region,R.RegionName, S.ProductType ,P.ProductType as ProductTypeName, Ranking, Objective, Description, RiskRating, BusinessImpact, ExchangeDetails, DetailsOfChanges, ChangesBusinessImpact, SupportingDocument, DateChangeInitiated, DateChangeImplemented, ChangesCompletionStatus, AdditionalParam1, AdditionalParam2, AdditionalParam3, AdditionalParam4, AdditionalParam5, AdditionalParam6, AdditionalParam7, AdditionalParam8, AdditionalParam9, AdditionalParam10, AdditionalParam11, AdditionalParam12, AdditionalParam13, Attribute1, Attribute2, Attribute3, Attribute4, NoOfApprover, Version,FinalSignOff, SignOffDate, SignoffBy, IsActive, CreatedDate, CreatedBy, LastModifiedDate, LastModifiedBy
from tbl_strategy S join tbl_ApplicationMaster A  On S.ApplicationId=A.Id 
JOin tbl_country_master C on S.Country=C.id 
join tbl_region_master R on S.Region= R.Id
Join tbl_businesssector	B on S.BusinessSector =B.Id
JOIN tbl_producttypemaster P on S.ProductType=P.Id
WHERE RefNumber=i_RefNumber;
END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_gettransfersettingbyuser
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_gettransfersettingbyuser`(
	IN `i_Owner` VARCHAR(50)

)
BEGIN
select * from tbl_transfersetting where Owneruser=i_Owner and IsActive='Y';
END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_getusers
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getusers`(
	IN `i_userid` VARCHAR(50)


)
BEGIN

if(i_userid ='') then
select u.Id,u.Userid,u.UserName,u.EmailId,u.RegionId,r.RegionName,u.CountryId,c.CountryName,u.BusinessSectorId,b.Name,u.RoleId,rm.RoleName,u.Status,u.Password,u.IsADUser from tbl_user_master u join tbl_businesssector b on u.BusinessSectorId=b.Id join tbl_region_master r  on u.RegionId=r.Id join tbl_country_master c  on u.CountryId=c.id join tbl_role_master rm on u.RoleId=rm.Id;
else
select u.Id,u.Userid,u.UserName,u.EmailId,u.RegionId,r.RegionName,u.CountryId,c.CountryName,u.BusinessSectorId,b.Name,u.RoleId,rm.RoleName,u.Status,u.Password,u.IsADUser from tbl_user_master u join tbl_businesssector b on u.BusinessSectorId=b.Id join tbl_region_master r  on u.RegionId=r.Id join tbl_country_master c  on u.CountryId=c.id join tbl_role_master rm on u.RoleId=rm.Id  where u.userid=i_userid;
end if;


END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_getusersbycondition
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getusersbycondition`(
	IN `i_regionId` VARCHAR(50),
	IN `i_countryId` VARCHAR(50),
	IN `i_businesssectorId` VARCHAR(50)

)
BEGIN
select u.Id,u.Userid,u.UserName,u.EmailId,u.RegionId,r.RegionName,u.CountryId,c.CountryName,u.BusinessSectorId,b.Name,u.RoleId,rm.RoleName,u.Status from tbl_user_master u join tbl_businesssector b on u.BusinessSectorId=b.Id join tbl_region_master r  on u.RegionId=r.Id join tbl_country_master c  on u.CountryId=c.id join tbl_role_master rm on u.RoleId=rm.Id  
where u.CountryId=i_countryId and u.RegionId=i_regionId and u.BusinessSectorId=i_businesssectorId;
END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_insert_ApplicationMaster
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_ApplicationMaster`(
	IN `i_ApplicationId` VARCHAR(50)
,
	IN `i_ApplicationName` VARCHAR(50)

)
BEGIN

insert into tbl_ApplicationMaster (ApplicationID,ApplicationName) values(i_ApplicationId,i_ApplicationName);

END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_insert_BusinessSector
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_BusinessSector`(
	IN `i_BusinessSectorName` VARCHAR(50)

)
BEGIN

insert into tbl_BusinessSector (Name) values(i_BusinessSectorName);

END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_insert_Country
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_Country`(
	IN `i_CountryName` VARCHAR(50)

)
BEGIN

insert into tbl_country_master (Countryname) values(i_CountryName);

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

-- Dumping structure for procedure achi.sp_insert_Product
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_Product`(
	IN `i_ProductName` VARCHAR(50)


)
BEGIN

insert into tbl_ProductTypemaster (ProductType) values(i_ProductName);

END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_insert_Region
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_Region`(
	IN `i_RegionName` VARCHAR(50)


)
BEGIN

insert into tbl_region_master (regionname) values(i_RegionName);

END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_insert_role
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_role`(
	IN `i_role` VARCHAR(50),
	OUT `param_auto_id` INT
)
BEGIN
insert into tbl_role_master (RoleName) values(i_role);
  set param_auto_id := last_insert_id();
END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_insert_roleright
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_roleright`(
	IN `i_RoleId` INT,
	IN `i_RightId` INT

)
BEGIN
insert into tbl_roleright_mapping (RoleId,RightId) values(i_RoleId,i_RightId);
END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_insert_Strategy
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_Strategy`(
	IN `i_RefNumber` VARCHAR(50),
	IN `i_Name` VARCHAR(50),
	IN `i_Type` VARCHAR(50),
	IN `i_ApplicationId` VARCHAR(50),
	IN `i_BusinessSectorId` VARCHAR(50),
	IN `i_CountryId` VARCHAR(50),
	IN `i_RegionId` VARCHAR(50),
	IN `i_ProductTypeId` VARCHAR(50),
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
	IN `i_AdditionalParam13` VARCHAR(50),
	IN `i_Attribute1` VARCHAR(50),
	IN `i_Attribute2` VARCHAR(50),
	IN `i_Attribute3` VARCHAR(50),
	IN `i_Attribute4` VARCHAR(50)

)
BEGIN
insert into tbl_strategy	 (RefNumber, Name, Type, ApplicationId, BusinessSector, Country, Region, ProductType, Ranking, Objective, Description, RiskRating, BusinessImpact, ExchangeDetails,AdditionalParam1, AdditionalParam2, AdditionalParam3, AdditionalParam4, AdditionalParam5, AdditionalParam6, AdditionalParam7, AdditionalParam8, AdditionalParam9, AdditionalParam10, AdditionalParam11, AdditionalParam12, AdditionalParam13,IsActive,Version) 
values(i_RefNumber, i_Name, i_Type, i_ApplicationId,i_BusinessSectorId, i_CountryId, i_RegionId, i_ProductTypeId, i_Ranking, i_Objective, i_Description, i_RiskRating, i_BusinessImpact, i_ExchangeDetails, i_AdditionalParam1, i_AdditionalParam2, i_AdditionalParam3, i_AdditionalParam4, i_AdditionalParam5, i_AdditionalParam6, i_AdditionalParam7, i_AdditionalParam8, i_AdditionalParam9, i_AdditionalParam10, i_AdditionalParam11, i_AdditionalParam12, i_AdditionalParam13, 'Y',1);
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

declare transstatus varchar(50);
declare transto varchar(50);
set transstatus='N';
 IF (SELECT count(*) FROM tbl_transfersetting  WHERE Owneruser=i_Approver and IsActive='Y')>0 THEN
 Begin
 set transstatus='Y';
SELECT 
    TransferTo
INTO transto FROM
    tbl_transfersetting
WHERE
    Owneruser = i_Approver
        AND IsActive = 'Y';
        
 INSERT INTO tbl_approvaltransfer(RefNumber, Version,Approver,OriginalApprover,IsActive,IsTransfered,IsDelegateAccepted,IsViewed,IsModified) VALUES (i_RefNumber, i_Version,transto,i_Approver,'Y','N','N','N','N');
 end;
  END IF;

 IF (SELECT count(*) FROM tbl_StrategyApproval  WHERE RefNumber=i_RefNumber and  Version=i_Version and Approver=i_Approver and IsActive='Y')<=0 THEN
BEGIN
INSERT INTO tbl_StrategyApproval (RefNumber, Version,Approver,IsActive,IsTransfered,IsDelegateAccepted,IsViewed,IsModified) VALUES (i_RefNumber, i_Version,i_Approver,'Y',transstatus,'N','N','N');
END;
ELSE
BEGIN 
	UPDATE tbl_StrategyApproval SET Isviewed='N', IsModified='N',IsTransfered=transstatus  WHERE RefNumber=i_RefNumber and  Version=i_Version and Approver=i_Approver and IsActive='Y';
END;
END IF;
END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_insert_Strategy_Version
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_Strategy_Version`(
	IN `i_RefNumber` VARCHAR(50),
	IN `i_Name` VARCHAR(50),
	IN `i_Type` VARCHAR(50),
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
insert into tbl_strategy(RefNumber, Name, Type, ApplicationId, BusinessSector, Country, Region, ProductType, Ranking, Objective, Description, RiskRating, BusinessImpact, ExchangeDetails,AdditionalParam1, AdditionalParam2, AdditionalParam3, AdditionalParam4, AdditionalParam5, AdditionalParam6, AdditionalParam7, AdditionalParam8, AdditionalParam9, AdditionalParam10, AdditionalParam11, AdditionalParam12, AdditionalParam13,Attribute1,Attribute2,Attribute3,Attribute4,IsActive,Version) 
values(i_RefNumber, i_Name, i_Type, i_ApplicationId,i_BusinessSector, i_Country, i_Region, i_ProductType, i_Ranking, i_Objective, i_Description, i_RiskRating, i_BusinessImpact, i_ExchangeDetails, i_AdditionalParam1, i_AdditionalParam2, i_AdditionalParam3, i_AdditionalParam4, i_AdditionalParam5, i_AdditionalParam6, i_AdditionalParam7, i_AdditionalParam8, i_AdditionalParam9, i_AdditionalParam10, i_AdditionalParam11, i_AdditionalParam12, i_AdditionalParam13,i_Attribute1,i_Attribute2,i_Attribute3,i_Attribute4, 'Y',i_Version);
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

-- Dumping structure for procedure achi.sp_insert_transfersetting
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_transfersetting`(
	IN `i_Owneruser` VARCHAR(50),
	IN `i_TransferTo` VARCHAR(50),
	IN `i_DurationFrom` VARCHAR(50),
	IN `i_DurationTo` VARCHAR(50)

)
BEGIN

update tbl_transfersetting set IsActive='N' where Owneruser=i_Owneruser;

insert into tbl_transfersetting(Owneruser,TransferTo,DurationFrom,DurationTo,IsActive)values(i_Owneruser,i_TransferTo,i_DurationFrom,i_DurationTo,'Y');

END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_updateuser
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateuser`(
	IN `i_userid` VARCHAR(50),
	IN `i_username` VARCHAR(50),
	IN `i_emailid` VARCHAR(50),
	IN `i_Roleid` VARCHAR(50),
	IN `i_countryid` INT,
	IN `i_regionid` INT,
	IN `i_businesssectorid` INT,
	IN `i_status` VARCHAR(50)
)
BEGIN

update tbl_user_master set UserName=i_username,EmailId=i_emailid,RoleId=i_Roleid,CountryId=i_countryid,RegionId=i_regionid,BusinessSectorId=i_businesssectorid,Status=i_status 
where Userid=i_userid;

END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_update_Applicationmaster
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_Applicationmaster`(
	IN `i_id` INT,
	IN `i_ApplicationId` VARCHAR(50),
	IN `i_ApplicationName` VARCHAR(50)
)
BEGIN

update tbl_ApplicationMaster set ApplicationName=i_ApplicationName , ApplicationId=i_ApplicationId where id=i_id;

END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_update_BusinessSector
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_BusinessSector`(
	IN `i_id` INT,
	IN `i_BusinessSectorname` VARCHAR(50)

)
BEGIN

update tbl_BusinessSector set  name=i_BusinessSectorname where id=i_id;

END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_update_countrymaster
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_countrymaster`(
	IN `i_id` INT,
	IN `i_countryname` VARCHAR(50)
)
BEGIN

update tbl_country_master set countryname=i_countryname where id=i_id;

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

-- Dumping structure for procedure achi.sp_update_Productmaster
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_Productmaster`(
	IN `i_id` INT,
	IN `i_ProductName` VARCHAR(50)

)
BEGIN

update tbl_ProductTypemaster set ProductType =i_ProductName where id=i_id;

END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_update_regionmaster
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_regionmaster`(
	IN `i_id` INT,
	IN `i_regionname` VARCHAR(50)
)
BEGIN

update tbl_region_master set regionname=i_regionname where id=i_id;

END//
DELIMITER ;

-- Dumping structure for procedure achi.sp_update_Strategy
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_Strategy`(
	IN `i_RefNumber` VARCHAR(50),
	IN `i_Name` VARCHAR(50),
	IN `i_Type` VARCHAR(50),
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
update tbl_strategy set RefNumber=i_RefNumber, Name =i_Name,  Type=i_Type, ApplicationId= i_ApplicationId,BusinessSector=i_BusinessSector, Country=   i_Country, Region=i_Region,  ProductType=i_ProductType,  Ranking=i_Ranking, Objective= i_Objective,Description=i_Description, RiskRating=   i_RiskRating, BusinessImpact=   i_BusinessImpact,ExchangeDetails=i_ExchangeDetails,AdditionalParam1= i_AdditionalParam1,AdditionalParam2=i_AdditionalParam2, AdditionalParam3=    i_AdditionalParam3, AdditionalParam4=i_AdditionalParam4, AdditionalParam5=  i_AdditionalParam5,AdditionalParam6=i_AdditionalParam6, AdditionalParam7=i_AdditionalParam7,  AdditionalParam8=i_AdditionalParam8,  AdditionalParam9=i_AdditionalParam9, AdditionalParam10=i_AdditionalParam10,  AdditionalParam11=i_AdditionalParam11,   AdditionalParam12=i_AdditionalParam12, AdditionalParam13= i_AdditionalParam13,Attribute1=i_Attribute1,Attribute2=i_Attribute2,Attribute3=i_Attribute3,Attribute4=i_Attribute4,DetailsOfChanges=i_DetailsOfChanges where Id=i_id; 
else
update tbl_strategy set RefNumber=i_RefNumber, Name =i_Name,  Type=i_Type,  ApplicationId= i_ApplicationId,BusinessSector=i_BusinessSector, Country=   i_Country, Region=i_Region,  ProductType=i_ProductType,  Ranking=i_Ranking, Objective= i_Objective,Description=i_Description, RiskRating=   i_RiskRating, BusinessImpact=   i_BusinessImpact,ExchangeDetails=i_ExchangeDetails,AdditionalParam1= i_AdditionalParam1,AdditionalParam2=i_AdditionalParam2, AdditionalParam3=    i_AdditionalParam3, AdditionalParam4=i_AdditionalParam4, AdditionalParam5=  i_AdditionalParam5,AdditionalParam6=i_AdditionalParam6, AdditionalParam7=i_AdditionalParam7,  AdditionalParam8=i_AdditionalParam8,  AdditionalParam9=i_AdditionalParam9, AdditionalParam10=i_AdditionalParam10,  AdditionalParam11=i_AdditionalParam11,   AdditionalParam12=i_AdditionalParam12, AdditionalParam13= i_AdditionalParam13 where Id=i_id; 
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

-- Dumping structure for table achi.tbl_aduser_master
CREATE TABLE IF NOT EXISTS `tbl_aduser_master` (
  `Userid` varchar(255) CHARACTER SET utf8 NOT NULL,
  `UserName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EmailId` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MobileNumber` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `st` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `postalCode` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `physicalDeliveryOfficeName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `telephoneNumber` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `streetAddress` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `manager` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `homePhone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`Userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_aduser_master: ~0 rows (approximately)
DELETE FROM `tbl_aduser_master`;
/*!40000 ALTER TABLE `tbl_aduser_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_aduser_master` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_applicationmaster
CREATE TABLE IF NOT EXISTS `tbl_applicationmaster` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ApplicationID` varchar(50) DEFAULT NULL,
  `ApplicationName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_applicationmaster: ~4 rows (approximately)
DELETE FROM `tbl_applicationmaster`;
/*!40000 ALTER TABLE `tbl_applicationmaster` DISABLE KEYS */;
INSERT INTO `tbl_applicationmaster` (`Id`, `ApplicationID`, `ApplicationName`) VALUES
	(1, '1001', 'app1'),
	(2, '1002', 'app2'),
	(3, '1003', 'app3'),
	(4, '1004', 'appplicaton 4');
/*!40000 ALTER TABLE `tbl_applicationmaster` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_approvaltransfer
CREATE TABLE IF NOT EXISTS `tbl_approvaltransfer` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `RefNumber` varchar(50) DEFAULT '0',
  `Version` varchar(50) DEFAULT '0',
  `Approver` varchar(50) DEFAULT '0',
  `OriginalApprover` varchar(50) DEFAULT '0',
  `Comments` varchar(50) DEFAULT '0',
  `ApprovedDate` varchar(50) DEFAULT '0',
  `Status` varchar(50) DEFAULT '0',
  `ActionStatus` varchar(50) DEFAULT '0',
  `IsActive` varchar(50) DEFAULT NULL,
  `IsTransfered` varchar(50) DEFAULT NULL,
  `IsDelegateAccepted` varchar(45) DEFAULT NULL,
  `IsViewed` varchar(50) DEFAULT NULL,
  `IsModified` varchar(50) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_approvaltransfer: ~0 rows (approximately)
DELETE FROM `tbl_approvaltransfer`;
/*!40000 ALTER TABLE `tbl_approvaltransfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_approvaltransfer` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_businesssector
CREATE TABLE IF NOT EXISTS `tbl_businesssector` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_businesssector: ~1 rows (approximately)
DELETE FROM `tbl_businesssector`;
/*!40000 ALTER TABLE `tbl_businesssector` DISABLE KEYS */;
INSERT INTO `tbl_businesssector` (`Id`, `Name`) VALUES
	(1, 'sector');
/*!40000 ALTER TABLE `tbl_businesssector` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_country_master
CREATE TABLE IF NOT EXISTS `tbl_country_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_country_master: ~2 rows (approximately)
DELETE FROM `tbl_country_master`;
/*!40000 ALTER TABLE `tbl_country_master` DISABLE KEYS */;
INSERT INTO `tbl_country_master` (`id`, `CountryName`) VALUES
	(1, 'India'),
	(2, 'England');
/*!40000 ALTER TABLE `tbl_country_master` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_producttypemaster
CREATE TABLE IF NOT EXISTS `tbl_producttypemaster` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductType` varchar(50) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_producttypemaster: ~2 rows (approximately)
DELETE FROM `tbl_producttypemaster`;
/*!40000 ALTER TABLE `tbl_producttypemaster` DISABLE KEYS */;
INSERT INTO `tbl_producttypemaster` (`Id`, `ProductType`) VALUES
	(1, 'product1'),
	(2, 'product2');
/*!40000 ALTER TABLE `tbl_producttypemaster` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_region_master
CREATE TABLE IF NOT EXISTS `tbl_region_master` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RegionName` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_region_master: ~2 rows (approximately)
DELETE FROM `tbl_region_master`;
/*!40000 ALTER TABLE `tbl_region_master` DISABLE KEYS */;
INSERT INTO `tbl_region_master` (`Id`, `RegionName`) VALUES
	(1, 'Region2'),
	(2, 'Region1');
/*!40000 ALTER TABLE `tbl_region_master` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_right_master
CREATE TABLE IF NOT EXISTS `tbl_right_master` (
  `RightID` int(11) DEFAULT NULL,
  `RightName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Path` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Icon` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ShowMenu` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `IsActive` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_right_master: ~32 rows (approximately)
DELETE FROM `tbl_right_master`;
/*!40000 ALTER TABLE `tbl_right_master` DISABLE KEYS */;
INSERT INTO `tbl_right_master` (`RightID`, `RightName`, `MenuName`, `Path`, `Icon`, `ShowMenu`, `IsActive`) VALUES
	(1, 'Dashboard Read', 'Home', 'Index', 'fa fa-dashboard', 'true', 'Y'),
	(2, 'Dashboard Write', 'Home', 'Index', 'fa fa-dashboard', 'true', 'N'),
	(3, 'Application Read', 'Model / Algo Management', 'Strategy', 'fa fa-list', 'true', 'Y'),
	(4, 'Application Write', 'Model / Algo Management', 'Strategy', 'fa fa-list', 'true', 'Y'),
	(5, 'Map Strategy Read', 'Map Strategy', 'MapTask', 'fa fa-list-alt', 'true', 'N'),
	(6, 'Map Strategy  Write', 'Map Strategy', 'MapTask', 'fa fa-list-alt', 'true', 'N'),
	(7, 'Change Management Read', 'Change Management', 'Tasks', 'fa fa-reply-all', 'true', 'Y'),
	(8, 'Change Management Write', 'Change Management', 'Tasks', 'fa fa-reply-all', 'true', 'Y'),
	(9, 'Approvals Read', 'Approvals Management', 'Approvals', 'fa fa-list-alt', 'true', 'Y'),
	(10, 'Approvals Write', 'Approvals Management', 'Approvals', 'fa fa-list-alt', 'true', 'Y'),
	(11, 'Delegate Settings Read', 'Delegate Settings', 'TransferSettings', 'fa fa-wrench', 'true', 'Y'),
	(12, 'Delegate Settings Write', 'Delegate Settings', 'TransferSettings', 'fa fa-wrench', 'true', 'Y'),
	(13, 'Email Read', 'Email', 'Emails', 'fa fa-list-alt', 'true', 'N'),
	(14, 'Email Write', 'Email', 'Emails', 'fa fa-list-alt', 'true', 'N'),
	(15, 'Reports', 'Reports', 'Reports', 'fa fa-list-alt', 'true', 'N'),
	(16, 'Licensing Read', 'Licensing', 'Licensing', 'fa fa-list-alt', 'true', 'N'),
	(17, 'Licensing Write', 'Licensing', 'Licensing', 'fa fa-list-alt', 'true', 'N'),
	(18, 'User Management Read', 'User Management', 'UserManagement', 'fa fa-users', 'true', 'Y'),
	(19, 'User Management Write', 'User Management', 'UserManagement', 'fa fa-users', 'true', 'Y'),
	(20, 'Role Management Read', 'Role Management', 'RoleManagement', 'fa fa-list-alt', 'true', 'Y'),
	(21, 'Role Management Write', 'Role Management', 'RoleManagement', 'fa fa-list-alt', 'true', 'Y'),
	(22, 'Country Read', 'Country', 'Country', 'fa fa-globe', 'true', 'Y'),
	(23, 'Country Write', 'Country', 'Country', 'fa fa-globe', 'true', 'Y'),
	(24, 'Region Read', 'Region', 'Region', 'fa fa-crosshairs', 'true', 'Y'),
	(25, 'Region Write', 'Region', 'Region', 'fa fa-crosshairs', 'true', 'Y'),
	(26, 'Business Sector Read', 'Business Sector', 'BusinessSector', 'fa fa-handshake-o', 'true', 'Y'),
	(27, 'Business Sector Write', 'Business Sector', 'BusinessSector', 'fa fa-handshake-o', 'true', 'Y'),
	(28, 'Application Master Read', 'Application Master', 'ApplicationMaster', 'fa fa-adn', 'true', 'Y'),
	(29, 'Application Master Write', 'Application Master', 'ApplicationMaster', 'fa fa-adn', 'true', 'Y'),
	(30, 'Product Type Read', 'Product Type', 'ProductType', 'fa fa-product-hunt', 'true', 'Y'),
	(31, 'Product Type Write', 'Product Type', 'ProductType', 'fa fa-product-hunt', 'true', 'Y'),
	(32, 'Utilities', 'Utilities', 'Utilities', 'fa fa-list-alt', 'true', 'N');
/*!40000 ALTER TABLE `tbl_right_master` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_roleright_mapping
CREATE TABLE IF NOT EXISTS `tbl_roleright_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` int(11) DEFAULT NULL,
  `RightID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=440 DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_roleright_mapping: ~22 rows (approximately)
DELETE FROM `tbl_roleright_mapping`;
/*!40000 ALTER TABLE `tbl_roleright_mapping` DISABLE KEYS */;
INSERT INTO `tbl_roleright_mapping` (`id`, `RoleID`, `RightID`) VALUES
	(418, 5, 1),
	(419, 5, 3),
	(420, 5, 7),
	(421, 5, 8),
	(422, 5, 9),
	(423, 5, 10),
	(424, 5, 11),
	(425, 5, 12),
	(426, 5, 18),
	(427, 5, 19),
	(428, 5, 20),
	(429, 5, 21),
	(430, 5, 22),
	(431, 5, 24),
	(432, 5, 26),
	(433, 5, 28),
	(434, 5, 30),
	(435, 5, 23),
	(436, 5, 25),
	(437, 5, 27),
	(438, 5, 29),
	(439, 5, 31);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_role_master: ~1 rows (approximately)
DELETE FROM `tbl_role_master`;
/*!40000 ALTER TABLE `tbl_role_master` DISABLE KEYS */;
INSERT INTO `tbl_role_master` (`id`, `RoleName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`) VALUES
	(5, 'Super user', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `tbl_role_master` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_strategy
CREATE TABLE IF NOT EXISTS `tbl_strategy` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RefNumber` varchar(30) NOT NULL,
  `Name` varchar(300) DEFAULT NULL,
  `Type` varchar(50) NOT NULL,
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
  `AdditionalParam1` varchar(100) DEFAULT NULL,
  `AdditionalParam2` varchar(100) DEFAULT NULL,
  `AdditionalParam3` varchar(100) DEFAULT NULL,
  `AdditionalParam4` varchar(100) DEFAULT NULL,
  `AdditionalParam5` varchar(100) DEFAULT NULL,
  `AdditionalParam6` varchar(100) DEFAULT NULL,
  `AdditionalParam7` varchar(100) DEFAULT NULL,
  `AdditionalParam8` varchar(100) DEFAULT NULL,
  `AdditionalParam9` varchar(100) DEFAULT NULL,
  `AdditionalParam10` varchar(100) DEFAULT NULL,
  `AdditionalParam11` varchar(100) DEFAULT NULL,
  `AdditionalParam12` varchar(100) DEFAULT NULL,
  `AdditionalParam13` varchar(100) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_strategy: ~2 rows (approximately)
DELETE FROM `tbl_strategy`;
/*!40000 ALTER TABLE `tbl_strategy` DISABLE KEYS */;
INSERT INTO `tbl_strategy` (`Id`, `RefNumber`, `Name`, `Type`, `ApplicationId`, `BusinessSector`, `Country`, `Region`, `ProductType`, `Ranking`, `Objective`, `Description`, `RiskRating`, `BusinessImpact`, `ExchangeDetails`, `DetailsOfChanges`, `ChangesBusinessImpact`, `SupportingDocument`, `DateChangeInitiated`, `DateChangeImplemented`, `ChangesCompletionStatus`, `AdditionalParam1`, `AdditionalParam2`, `AdditionalParam3`, `AdditionalParam4`, `AdditionalParam5`, `AdditionalParam6`, `AdditionalParam7`, `AdditionalParam8`, `AdditionalParam9`, `AdditionalParam10`, `AdditionalParam11`, `AdditionalParam12`, `AdditionalParam13`, `Attribute1`, `Attribute2`, `Attribute3`, `Attribute4`, `NoOfApprover`, `Version`, `FinalSignOff`, `SignOffDate`, `SignoffBy`, `IsActive`, `CreatedDate`, `CreatedBy`, `LastModifiedDate`, `LastModifiedBy`, `Res1`, `Res2`, `Res3`, `Res4`, `Res5`, `Res6`, `Res7`, `Res8`, `Res9`, `Res10`) VALUES
	(1, '1234', 'strategy 1', 'type', '1', '1', '2', '1', '1', 'risk', 'none', 'none', 'test', 'test', 'test', '28-10-2017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, '1234', 'strategy 1', 'type', '1', '1', '2', '1', '1', 'risk', 'none', 'none', 'test', 'test', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `tbl_strategy` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_strategyapproval
CREATE TABLE IF NOT EXISTS `tbl_strategyapproval` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `RefNumber` varchar(50) DEFAULT '0',
  `Version` varchar(50) DEFAULT NULL,
  `Approver` varchar(50) DEFAULT NULL,
  `Comments` varchar(50) DEFAULT NULL,
  `ApprovedDate` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `ActionStatus` varchar(50) DEFAULT NULL,
  `IsActive` varchar(50) DEFAULT NULL,
  `IsTransfered` varchar(50) DEFAULT NULL,
  `IsDelegateAccepted` varchar(45) DEFAULT NULL,
  `IsViewed` varchar(50) DEFAULT NULL,
  `IsModified` varchar(50) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_strategyapproval: ~4 rows (approximately)
DELETE FROM `tbl_strategyapproval`;
/*!40000 ALTER TABLE `tbl_strategyapproval` DISABLE KEYS */;
INSERT INTO `tbl_strategyapproval` (`Id`, `RefNumber`, `Version`, `Approver`, `Comments`, `ApprovedDate`, `Status`, `ActionStatus`, `IsActive`, `IsTransfered`, `IsDelegateAccepted`, `IsViewed`, `IsModified`, `Type`) VALUES
	(1, '1234', '1', 'Daniel', NULL, NULL, NULL, NULL, 'Y', 'N', 'N', 'N', 'N', NULL),
	(2, '1234', '1', 'Sivakumar', 'Incorrect data', NULL, 'N', NULL, 'Y', 'N', 'N', 'N', 'N', NULL),
	(3, '1234', '2', 'Daniel', NULL, NULL, NULL, NULL, 'Y', 'N', 'N', 'N', 'N', NULL),
	(4, '1234', '2', 'Sivakumar', NULL, NULL, 'Y', NULL, 'Y', 'N', 'N', 'N', 'N', NULL);
/*!40000 ALTER TABLE `tbl_strategyapproval` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_transfersetting
CREATE TABLE IF NOT EXISTS `tbl_transfersetting` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Owneruser` varchar(50) DEFAULT NULL,
  `TransferTo` varchar(50) DEFAULT NULL,
  `DurationFrom` varchar(50) DEFAULT NULL,
  `DurationTo` varchar(50) DEFAULT NULL,
  `IsActive` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_transfersetting: ~6 rows (approximately)
DELETE FROM `tbl_transfersetting`;
/*!40000 ALTER TABLE `tbl_transfersetting` DISABLE KEYS */;
INSERT INTO `tbl_transfersetting` (`Id`, `Owneruser`, `TransferTo`, `DurationFrom`, `DurationTo`, `IsActive`) VALUES
	(1, 'John', '09/22/2017', '09/12/2017', '09/22/2017', 'N'),
	(2, 'John', '09/22/2017', '09/12/2017', '09/22/2017', 'N'),
	(3, 'John', 'George', '09/12/2017', '09/22/2017', 'N'),
	(4, 'John', 'Sivakumar', '09/17/2017', '09/29/2017', 'Y'),
	(5, 'Sivakumar', 'John', '09/05/2017', '09/14/2017', 'N'),
	(6, 'Sivakumar', 'John', '09/05/2017', '09/05/2017', 'N');
/*!40000 ALTER TABLE `tbl_transfersetting` ENABLE KEYS */;

-- Dumping structure for table achi.tbl_user_master
CREATE TABLE IF NOT EXISTS `tbl_user_master` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Userid` varchar(255) CHARACTER SET utf8 NOT NULL,
  `UserName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `BusinessSectorId` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `RoleId` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Password` varchar(4000) CHARACTER SET utf8 DEFAULT NULL,
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
  `RegionId` int(11) DEFAULT NULL,
  `CountryId` int(11) DEFAULT NULL,
  `FirstWorkingDate` datetime DEFAULT NULL,
  `LastWorkingDate` datetime DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Userid`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table achi.tbl_user_master: ~5 rows (approximately)
DELETE FROM `tbl_user_master`;
/*!40000 ALTER TABLE `tbl_user_master` DISABLE KEYS */;
INSERT INTO `tbl_user_master` (`Id`, `Userid`, `UserName`, `BusinessSectorId`, `RoleId`, `Password`, `EmailId`, `MobileNumber`, `CustomData`, `Status`, `UserExpiryDate`, `PasswordExpiryDate`, `UserBlockDate`, `AttemptTries`, `LastAuthenticatedDate`, `LastUsedDate`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `ApprovedDate`, `Approvedby`, `MakerComment`, `CheckerComment`, `IsADUser`, `RegionId`, `CountryId`, `FirstWorkingDate`, `LastWorkingDate`, `LocationId`) VALUES
	(1, 'Daniel', 'Daniel', '1', '5', NULL, 'Daniel@coba.com', NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', 1, 2, NULL, NULL, NULL),
	(2, 'John', 'John', '1', '5', '', 'John@coba.com', NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', 1, 2, NULL, NULL, NULL),
	(3, 'Michael', NULL, '1', '5', 'd2VsY29tZQ==', 'Michael@coba.com', NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', 2, 1, NULL, NULL, NULL),
	(4, 'Oliver', 'Oliver', '1', '5', NULL, 'Oliver@coba.com', NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', 1, 2, NULL, NULL, NULL),
	(5, 'Sivakumar', 'SivaKumar', '1', '5', NULL, 'Sivakumar@coba.com', NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', 1, 2, NULL, NULL, NULL);
/*!40000 ALTER TABLE `tbl_user_master` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
