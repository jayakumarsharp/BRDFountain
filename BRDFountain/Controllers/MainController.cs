using BRDFountain.Models;
using log4net;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;

namespace BRDFountain.Controllers
{
    [NoCache]
    public class MainController : Controller
    {
        private DbOperations _dbOperations = new DbOperations();
        private static readonly ILog log = LogManager.GetLogger(typeof(MainController));
        //
        // GET: /Main/
        //[SessionTimeout]

        #region Partial Views
        public ActionResult ShowApplicationDetails()
        {
            return PartialView();
        }

        public ActionResult ConfirmModal()
        {
            return PartialView();
        }

        public ActionResult ViewApprovals()
        {
            return PartialView();
        }
        public ActionResult ShowApprovalDetails()
        {
            return PartialView();
        }

        #endregion PArtial Views

        #region View displays

        [SessionTimeout]
        public ActionResult Index()
        {
            return View();
        }

        [SessionTimeout]
        public ActionResult TransferSettings()
        {
            return View();
        }

        [SessionTimeout]
        public ActionResult Country()
        {
            return View();
        }

        [SessionTimeout]
        public ActionResult BusinessSector()
        {
            return View();
        }
        [SessionTimeout]
        public ActionResult ProductType()
        {
            return View();
        }
        [SessionTimeout]
        public ActionResult RoleManagement()
        {
            return View();
        }
        [SessionTimeout]
        public ActionResult UserManagement()
        {
            return View();
        }
        [SessionTimeout]
        public ActionResult ApplicationMaster()
        {
            return View();
        }


        [SessionTimeout]
        public ActionResult Region()
        {
            return View();
        }
        [SessionTimeout]
        public ActionResult Reports()
        {
            return View();
        }


        [SessionTimeout]
        public ActionResult ModelAlgoManagement()
        {
            return View();
        }
        [SessionTimeout]
        public ActionResult ChangeManagement()
        {
            return View();
        }

        [SessionTimeout]
        public ActionResult Approvals()
        {
            return View();
        }


        [SessionTimeout]
        public ActionResult FTAApplicationCode()
        {
            return View();
        }

        [SessionTimeout]
        public ActionResult FTAStrategyCode()
        {
            return View();
        }

        [SessionTimeout]
        public ActionResult DiscretionaryCode()
        {
            return View();
        }


        [SessionTimeout]
        public ActionResult BusinessSuffix()
        {
            return View();
        }

        [SessionTimeout]
        public ActionResult Business()
        {
            return View();
        }

        [SessionTimeout]
        public ActionResult MappingMaster()
        {
            return View();
        }

        [SessionTimeout]
        public ActionResult FTAApplicationMapping()
        {
            return View();
        }

        public ActionResult ReportApplicationMapping()
        {
            return View();
        }

        [SessionTimeout]
        public ActionResult FTAStrategyMapping()
        {
            return View();
        }

        [SessionTimeout]
        public ActionResult BusinessMapping()
        {
            return View();
        }

        [SessionTimeout]
        public ActionResult ParentID()
        {
            return View();
        }

        [SessionTimeout]
        public ActionResult ChildID()
        {
            return View();
        }
        [SessionTimeout]
        public ActionResult BusinessLine()
        {
            return View();
        }
        [SessionTimeout]
        public ActionResult FTAApplicationName()
        {
            return View();
        }
        [SessionTimeout]
        public ActionResult FTAApplicationOwner()
        {
            return View();
        }

        [SessionTimeout]
        public ActionResult FTAStrategyName()
        {
            return View();
        }

        [SessionTimeout]
        public ActionResult FTAStrategyOwner()
        {
            return View();
        }
        [SessionTimeout]
        public ActionResult SystemFlow()
        {
            return View();
        }


        [SessionTimeout]
        public ActionResult ApplicationCategory()
        {
            return View();
        }


        [SessionTimeout]
        public ActionResult Strategytype()
        {
            return View();
        }


        [SessionTimeout]
        public ActionResult Venuetype()
        {
            return View();
        }


        [SessionTimeout]
        public ActionResult Capacity()
        {
            return View();
        }

        [SessionTimeout]
        public ActionResult PriorityScore()
        {
            return View();
        }


        [SessionTimeout]
        public ActionResult MasterPage()
        {
            return View();
        }


        #endregion View displays

        public string getloggedusername()
        {
            try
            {
                return Convert.ToString(Session["UserName"]);
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error in strategy insert {0}", e);
                return "";
            }
        }

        #region TransferSetting
        public JsonResult Get_ApprovaltransferByuser()
        {
            List<StrategyApprover> lst = _dbOperations.Get_ApprovaltransferByuser(Convert.ToString(Session["UserName"]));
            return Json(lst, JsonRequestBehavior.AllowGet);
        }


        #endregion TransferSetting

        #region Strategy

        public JsonResult GetData()
        {
            List<Strategy> lst = _dbOperations.GetStrategyData();
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetDatabyId(string Strategynumber)
        {
            List<Strategy> lst = _dbOperations.GetStrategyDatabyId(Strategynumber);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetStrategyReport(StrategyReportFilter filter)
        {
            List<Strategy> lst = _dbOperations.GetStrategyReport(filter);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }


        public string ExportReport(StrategyReportFilter filter)
        {
            List<Strategy> lst = _dbOperations.GetStrategyReport(filter);
            if (lst.Count > 0)
            {
                string[] columns = { "RegionName", "FTAApplicationCode", "FTAStrategyCode", "FTAApplicationName", "Discretionarycode", "BusinessSuffix", "ParentIdValue", "ChildIdValue", "BusinessLine", "CountryNameList", "FTAApplicationOwnerId", "ApplicationCategory", "FTAStrategyOwnerId", "FTAStrategyName", "StrategyType", "VenueType", "Capacity", "SignOff", "Priority", "PriorityScore", "business", "ThirdPartyAppName", "DecomissionedDate", "GoLiveDate" };
                byte[] filecontent = ExcelExportHelper.ExportExcel(lst, "Strategy Report", true, columns);
                //return File(, System.Net.Mime.MediaTypeNames.Application.Octet, "Report.xlsx");
                string mailbox = ConfigurationManager.AppSettings["FilePath"];
                string filepath = mailbox + "/Report/";
                bool exists = System.IO.Directory.Exists(@filepath);
                if (!exists)
                    System.IO.Directory.CreateDirectory(@filepath);
                string filename = Convert.ToString(Guid.NewGuid()) + ".xlsx";
                if (!System.IO.File.Exists(filepath))
                {
                    FileStream fileStream = System.IO.File.Create(filepath + filename, filecontent.Length);
                    fileStream.Write(filecontent, 0, filecontent.Length);
                    fileStream.Close();

                }
                return filename;
            }
            else
                return "No Records";
        }

        public JsonResult GetStrategyApprovalByuser()
        {
            List<StrategyApprover> lst = _dbOperations.Get_StrategyApprovalByuser(Convert.ToString(Session["UserName"]));
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetStrategyDelegatesApprovalByuser()
        {
            List<StrategyApprover> lst = _dbOperations.GetStrategyDelegatesApprovalByuser(Convert.ToString(Session["UserName"]));
            return Json(lst, JsonRequestBehavior.AllowGet);
        }


        public JsonResult GetDelegatedApprovalByuser()
        {
            List<StrategyApprover> lst = _dbOperations.Get_DelegatedApprovalByuser(Convert.ToString(Session["UserName"]));
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetStrategyApprovalById(string Strategynumber, string Version)
        {
            List<StrategyApprover> lst = _dbOperations.Get_StrategyApprovalById(Strategynumber, Version);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult InsertStrategy(Strategy strategy)
        {
            try
            {
                log.Info("inside method");
                strategy.Version = 1;
                strategy.RefNumber = DateTime.Now.ToString("yyyyMMddHHmmssfff");
                string mailbox = ConfigurationManager.AppSettings["FilePath"];
                string filepath = mailbox + "/" + strategy.RefNumber + "/";
                string errordesc = "";
                int errorcode = 0;
                List<StrategyApprover> lstfiles = new List<StrategyApprover>();
                bool exists = System.IO.Directory.Exists(@filepath);
                if (!exists)
                    System.IO.Directory.CreateDirectory(@filepath);
                if (Request.Files.Count > 0)
                {
                    StrategyApprover files = null;

                    foreach (string file in Request.Files)
                    {
                        files = new StrategyApprover();
                        files.Uploadedby = getloggedusername();
                        var fileContent = Request.Files[file];
                        if (file.Contains("Systemflowfilelist"))
                        {
                            files.Status = "S";
                            if (strategy.ExistingSystemflowfile != null)
                                strategy.ExistingSystemflowfile += "," + fileContent.FileName;
                            else
                                strategy.ExistingSystemflowfile = fileContent.FileName;
                        }
                        else
                        {
                            files.Status = "D";
                            if (strategy.ExistingDecommissionedfile != null)
                                strategy.ExistingDecommissionedfile += "," + fileContent.FileName;
                            else
                                strategy.ExistingDecommissionedfile = fileContent.FileName;
                        }
                        if (fileContent != null && fileContent.ContentLength > 0)
                        {
                            files.Comments = Convert.ToString(Guid.NewGuid()) + "." + Path.GetExtension(fileContent.FileName).Substring(1);
                            files.Approver = fileContent.FileName;
                            files.Version = strategy.Version.ToString();
                            files.RefNumber = strategy.RefNumber;
                            filepath = filepath + files.Comments;
                            if (!System.IO.File.Exists(filepath))
                            {
                                FileStream fileStream = System.IO.File.Create(filepath, (int)fileContent.InputStream.Length);
                                byte[] bytesInStream = new byte[fileContent.InputStream.Length];
                                fileContent.InputStream.Read(bytesInStream, 0, bytesInStream.Length);
                                fileStream.Write(bytesInStream, 0, bytesInStream.Length);
                                fileStream.Close();
                            }
                            else
                                return Json("File already exists", JsonRequestBehavior.AllowGet);
                        }
                        lstfiles.Add(files);
                    }
                    log.Info("insert approver");
                    _dbOperations.InsertStrategyApprover(lstfiles, lstfiles[0].RefNumber, lstfiles[0].Version, out errorcode, out errordesc);
                }
                strategy.CreatedBy = getloggedusername();
                log.Info("insert strategy");
                _dbOperations.InsertStrategydata(strategy, out errorcode, out errordesc);
                log.Info("insert strategy completed");
                _dbOperations.insertStrategyVersionChange(strategy.RefNumber, 1, "Version Created", getloggedusername());
                return Json(errordesc, JsonRequestBehavior.AllowGet);

            }
            catch (Exception e)
            {
                log.ErrorFormat("Error in strategy insert {0}", e);
                return Json("error", JsonRequestBehavior.AllowGet);
            }
        }

        public FileResult DownLoadFile(string FileName, string RefNumber, string Version)
        {
            try
            {
                log.InfoFormat("Called DownLoadFile method with param FileName {0}", FileName);
                string mailbox = ConfigurationManager.AppSettings["FilePath"];
                string filepath = mailbox + "/" + RefNumber + "/";
                string filePath1 = filepath + FileName;

                if (!System.IO.File.Exists(filePath1))
                {
                    throw new Exception();
                }

                byte[] fileBytes = System.IO.File.ReadAllBytes(filePath1);
                return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Octet, filePath1);

            }
            catch (Exception ex)
            {
                log.ErrorFormat("Error in DownLoadFile {0}", ex);
                return null;
            }
        }

        public FileResult DownLoadReportFile(string FileName)
        {
            try
            {
                log.InfoFormat("Called DownLoadFile method with param FileName {0}", FileName);
                string mailbox = ConfigurationManager.AppSettings["FilePath"];
                string filepath = mailbox + "/Report/";
                string filePath1 = filepath + FileName;

                if (!System.IO.File.Exists(filePath1))
                {
                    throw new Exception();
                }

                byte[] fileBytes = System.IO.File.ReadAllBytes(filePath1);
                return File(fileBytes, ExcelExportHelper.ExcelContentType, "Report.xlsx");

            }
            catch (Exception ex)
            {
                log.ErrorFormat("Error in DownLoadFile {0}", ex);
                return null;
            }
        }

        public JsonResult InsertStrategyApprover(List<StrategyApprover> strategy)
        {
            //if (Strategy.FirstInterestPaymentDate != "" && Strategy.FirstInterestPaymentDate != null)
            //{
            //    DateTime FirstInterestPaymentDate = DateTime.ParseExact(Strategy.FirstInterestPaymentDate, "MM/dd/yyyy", CultureInfo.InvariantCulture);
            //    Strategy.FirstInterestPaymentDate = FirstInterestPaymentDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            //}
            string errordesc = "";
            int errorcode = 0;
            if (strategy.Count > 0)
                _dbOperations.InsertStrategyApprover(strategy, strategy[0].RefNumber, strategy[0].Version, out errorcode, out errordesc);
            return Json(errordesc, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ModifyStrategyApprover(List<StrategyApprover> strategy)
        {
            //if (Strategy.FirstInterestPaymentDate != "" && Strategy.FirstInterestPaymentDate != null)
            //{
            //    DateTime FirstInterestPaymentDate = DateTime.ParseExact(Strategy.FirstInterestPaymentDate, "MM/dd/yyyy", CultureInfo.InvariantCulture);
            //    Strategy.FirstInterestPaymentDate = FirstInterestPaymentDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            //}
            string errordesc = "";
            int errorcode = 0;
            if (strategy.Count > 0)
                _dbOperations.InsertStrategyApprover(strategy, strategy[0].RefNumber, strategy[0].Version, out errorcode, out errordesc);
            return Json(errordesc, JsonRequestBehavior.AllowGet);
        }

        public JsonResult DeleteStrategyApprover(List<StrategyApprover> strategy)
        {
            //if (Strategy.FirstInterestPaymentDate != "" && Strategy.FirstInterestPaymentDate != null)
            //{
            //    DateTime FirstInterestPaymentDate = DateTime.ParseExact(Strategy.FirstInterestPaymentDate, "MM/dd/yyyy", CultureInfo.InvariantCulture);
            //    Strategy.FirstInterestPaymentDate = FirstInterestPaymentDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            //}
            string errordesc = "";
            int errorcode = 0;
            if (strategy != null && strategy.Count > 0)
                _dbOperations.DeleteStrategyApprover(strategy, strategy[0].RefNumber, out errorcode, out errordesc);
            return Json(errordesc, JsonRequestBehavior.AllowGet);
        }

        public JsonResult UpdateStrategyApprover(StrategyApprover strategy)
        {
            //if (Strategy.FirstInterestPaymentDate != "" && Strategy.FirstInterestPaymentDate != null)
            //{
            //    DateTime FirstInterestPaymentDate = DateTime.ParseExact(Strategy.FirstInterestPaymentDate, "MM/dd/yyyy", CultureInfo.InvariantCulture);
            //    Strategy.FirstInterestPaymentDate = FirstInterestPaymentDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            //}
            string errordesc = "";
            int errorcode = 0;
            _dbOperations.UpdateStrategyApprover(strategy, out errorcode, out errordesc);
            return Json(errordesc, JsonRequestBehavior.AllowGet);
        }

        public JsonResult updatedelegateAcceptance(StrategyApprover strategy)
        {
            string errordesc = "";
            int errorcode = 0;
            _dbOperations.updatedelegateAcceptance(strategy, out errorcode, out errordesc);
            return Json(errordesc, JsonRequestBehavior.AllowGet);
        }

        public JsonResult UpdateStrategy(List<Strategy> Strategy)
        {
            string errordesc = "";
            int errorcode = 0;

            var diffs = SimpleComparer.Differences(Strategy[0], Strategy[1]);

            var data = diffs.FindAll(x => x.Item1.Equals("Region") || x.Item1.Equals("BusinessSuffix") || x.Item1.Equals("FTAApplicationCode") || x.Item1.Equals("ChildIDValue")
            || x.Item1.Equals("FTAStrategyName") || x.Item1.Equals("Strategytype") || x.Item1.Equals("GOLiveDate") || x.Item1.Equals("FTAStrategyCode") || x.Item1.Equals("FTAShortCode") || x.Item1.Equals("BusinessLine") || x.Item1.Equals("FTAApplicationName") || x.Item1.Equals("FTAStrategyOwner") || x.Item1.Equals("ApplicationCategory") || x.Item1.Equals("Venuetype") || x.Item1.Equals("DecomissionedDate") || x.Item1.Equals("DiscretionaryCode")
            || x.Item1.Equals("ParentIDValue") || x.Item1.Equals("FTAApplicationOwner") || x.Item1.Equals("PriorityScore") || x.Item1.Equals("Priority") || x.Item1.Equals("Capacity")
            || x.Item1.Equals("Description") || x.Item1.Equals("SignOff"));
            string Changedata = "";
            if (data.Count() > 0)
            {
                //x.Item1.Equals("CountryName") ||
                foreach (var diff in data)
                {
                    Changedata += " " + diff.Item1 + " - " + diff.Item3 + " - Changed to " + diff.Item2;
                }

                Strategy[0].RefNumber = Strategy[1].RefNumber;
                Strategy[0].Version = Strategy[1].Version + 1;
                Strategy[0].CreatedBy = Convert.ToString(Session["UserName"]);
                _dbOperations.InsertStrategydata(Strategy[0], out errorcode, out errordesc);
                _dbOperations.insertStrategyVersionChange(Strategy[0].RefNumber, Strategy[0].Version, Changedata, Convert.ToString(Session["UserName"]));
            }

            return Json(errordesc, JsonRequestBehavior.AllowGet);
        }

        public JsonResult UpdateStrategyFile(Strategy strategy)
        {
            try
            {
                string mailbox = ConfigurationManager.AppSettings["FilePath"];
                string filepath = mailbox + "/" + strategy.RefNumber + "/";
                string errordesc = "";
                int errorcode = 0;
                List<StrategyApprover> lstfiles = new List<StrategyApprover>();
                bool exists = System.IO.Directory.Exists(@filepath);
                if (!exists)
                    System.IO.Directory.CreateDirectory(@filepath);
                if (Request.Files.Count > 0)
                {
                    StrategyApprover files = null;
                    foreach (string file in Request.Files)
                    {
                        files = new StrategyApprover();
                        files.Uploadedby = getloggedusername();
                        var fileContent = Request.Files[file];
                        if (file.Contains("Systemflowfilelist"))
                        {
                            files.Status = "S";
                            if (strategy.ExistingSystemflowfile != null)
                                strategy.ExistingSystemflowfile += "," + fileContent.FileName;
                            else
                                strategy.ExistingSystemflowfile = fileContent.FileName;
                        }
                        else
                        {
                            files.Status = "D";
                            if (strategy.ExistingDecommissionedfile != null)
                                strategy.ExistingDecommissionedfile += "," + fileContent.FileName;
                            else
                                strategy.ExistingDecommissionedfile = fileContent.FileName;
                        }
                        if (fileContent != null && fileContent.ContentLength > 0)
                        {
                            files.Comments = Convert.ToString(Guid.NewGuid()) + "." + Path.GetExtension(fileContent.FileName).Substring(1);
                            files.Approver = fileContent.FileName;
                            files.Version = strategy.Version.ToString();
                            files.RefNumber = strategy.RefNumber;
                            filepath = filepath + files.Comments;
                            if (!System.IO.File.Exists(filepath))
                            {
                                FileStream fileStream = System.IO.File.Create(filepath, (int)fileContent.InputStream.Length);
                                byte[] bytesInStream = new byte[fileContent.InputStream.Length];
                                fileContent.InputStream.Read(bytesInStream, 0, bytesInStream.Length);
                                fileStream.Write(bytesInStream, 0, bytesInStream.Length);
                                fileStream.Close();

                            }
                            else
                                return Json("File already exists", JsonRequestBehavior.AllowGet);
                        }
                        lstfiles.Add(files);
                    }
                    _dbOperations.InsertStrategyApprover(lstfiles, lstfiles[0].RefNumber, lstfiles[0].Version, out errorcode, out errordesc);
                }
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return Json("error", JsonRequestBehavior.AllowGet);
            }
        }

        #endregion Strategy

        #region Roles

        public JsonResult GetUserRoles(string userId)
        {
            if (userId != "")
            {
                if (Session["MenuList"] != null)
                {
                    List<RightMaster> ls = Session["MenuList"] as List<RightMaster>;
                    return Json(ls, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    List<RightMaster> lst = _dbOperations.GetMenuList(userId);
                    Session["MenuList"] = lst;
                    return Json(lst, JsonRequestBehavior.AllowGet);
                }
            }
            else
                return null;
        }
        public JsonResult GetUsersByRoles(string Roleid)
        {
            List<UserMaster> lst = _dbOperations.GetUsersByRoles(Roleid);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetUserRights(string userId)
        {
            List<RightMaster> lst = _dbOperations.GetRightsList(userId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetRoleRightMapping(string roleId)
        {
            List<RoleRightMapping> lst = _dbOperations.GetRoleRightMapping(roleId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }
        public JsonResult roles(string roleId)
        {
            List<Roles> lst = _dbOperations.GetRoles(roleId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetRights(string right)
        {
            List<RightMaster> lst = _dbOperations.GetRights(right);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddRole(RoleRightMapping obj)
        {
            string errordesc = "";
            int errocode = 0;
            int id = _dbOperations.AddRole(obj.selectedRole, out errocode, out errordesc);
            return Json(id, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddRoleRightMapping([FromBody]RoleRightMapping obj)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.AddRoleRightMapping(obj, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult ModifyRoleRight([FromBody]RoleRightMapping obj)
        {
            try
            {
                string errordesc = "";
                _dbOperations.ModifyRoleRight(obj);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult DeleteRole(RoleRightMapping obj)
        {
            try
            {
                string errordesc = "";
                _dbOperations.DeleteRole(obj.id);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        #endregion Roles

        #region User

        public JsonResult getusers(string userid)
        {
            List<UserMaster> lst = _dbOperations.GetUser(userid);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult profile(string userId)
        {
            try
            {
                string errordesc = "";
                _dbOperations.GetUserProfile(userId);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }
        public JsonResult GetUserSessionInfo(string createdOn)
        {
            try
            {
                string errordesc = "";

                _dbOperations.GetUserSessionInfo(createdOn);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }



        public JsonResult GetUserbyFilter(string RegionId, string BusinessLineId)
        {
            List<UserMaster> lst = _dbOperations.GetUserbyFilter(RegionId, BusinessLineId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }



        public JsonResult CreateUser(UserMaster user)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.CreateUser(user, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult CreateTempUser(UserMaster user)
        {
            string errordesc = "";
            int errocode = 0;
            _dbOperations.CreateTempUser(user, out errocode, out errordesc);
            return Json(errordesc, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetusercountryMapping(string userId)
        {
            List<CountryMaster> lst = _dbOperations.GetusercountryMapping(userId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetuserRegionMapping(string userId)
        {
            List<RegionMaster> lst = _dbOperations.GetuserregionMapping(userId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetBusinessMapping(string userId)
        {
            List<BusinessLineMaster> lst = _dbOperations.GetuserbusinessMapping(userId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ModifyUser(UserMaster user)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.ModifyUser(user, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult DeleteUser(string user)
        {
            try
            {
                string errordesc = "";

                _dbOperations.DeleteUser(user);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }
        #endregion User

        #region Country

        public JsonResult GetAllCountry(string CountryId)
        {
            try
            {

                List<CountryMaster> lst = _dbOperations.GetCountryList(CountryId);
                return Json(lst, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
                return null;
            }
        }

        public JsonResult AddCountry(CountryMaster taskInfo)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.AddCountry(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult ModifyCountry(CountryMaster opp)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.ModifyCountry(opp, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult DeleteCountry(string CountryId)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.DeleteCountry(CountryId, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        #endregion Country

        #region Region

        public JsonResult GetAllRegion(string RegionId)
        {
            List<RegionMaster> lst = _dbOperations.GetRegionList(RegionId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddRegion(RegionMaster taskInfo)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.AddRegion(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult ModifyRegion(RegionMaster opp)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.ModifyRegion(opp, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult DeleteRegion(string RegionId)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.DeleteRegion(RegionId, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        #endregion Region

        public JsonResult getADuser()
        {
            List<UserMaster> ls = new List<UserMaster>();
            ls.Add(new UserMaster { userId = "John", EmailId = "John@coba.com", UserName = "John Albert" });
            ls.Add(new UserMaster { userId = "Daniel", EmailId = "Daniel@coba.com", UserName = "Daniel" });
            ls.Add(new UserMaster { userId = "Sivakumar", EmailId = "Sivakumar@coba.com", UserName = "SivaKumar" });
            ls.Add(new UserMaster { userId = "George", EmailId = "George@coba.com", UserName = "George" });
            ls.Add(new UserMaster { userId = "Oliver", EmailId = "Oliver@coba.com", UserName = "Oliver" });


            List<UserMaster> lst = _dbOperations.GetUser("");

            foreach (UserMaster u in lst)
            {
                List<UserMaster> um = ls.Where(le => le.userId == u.userId).ToList();
                if (um.Count > 0)
                    ls.Remove(um[0]);
            }

            return Json(ls, JsonRequestBehavior.AllowGet);
        }

        #region FTAApplicationCode

        public JsonResult GetAllFTAApplicationCode(string FTAApplicationCodeId)
        {
            try
            {
                log.Info("Get All FTA Application - Begin ");
                List<FTAApplicationCodeMaster> lst = _dbOperations.GetFTAApplicationCodeList(FTAApplicationCodeId);
                log.Info("Get All FTA Application Called - End");
                return Json(lst, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                log.Error(e);
                return null;
            }
        }

        public JsonResult AddFTAApplicationCode(FTAApplicationCodeMaster taskInfo)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.AddFTAApplicationCode(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                log.Error(e);
                return null;
            }
        }

        public JsonResult ModifyFTAApplicationCode(FTAApplicationCodeMaster opp)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.ModifyFTAApplicationCode(opp, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                log.Error(e);
                return null;
            }
        }

        public JsonResult DeleteFTAApplicationCode(string FTAApplicationCodeId)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.DeleteFTAApplicationCode(FTAApplicationCodeId, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                log.Error(e);
                return null;
            }
        }

        #endregion FTAApplicationCode

        #region FTAStrategyCode

        public JsonResult GetAllFTAStrategyCode(string FTAStrategyCodeId)
        {
            try
            {
                List<FTAStrategyCodeMaster> lst = _dbOperations.GetFTAStrategyCodeList(FTAStrategyCodeId);
                return Json(lst, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                log.Error(e);
                return null;
            }

        }

        public JsonResult AddFTAStrategyCode(FTAStrategyCodeMaster taskInfo)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.AddFTAStrategyCode(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                log.Error(e);
                return null;
            }
        }

        public JsonResult ModifyFTAStrategyCode(FTAStrategyCodeMaster opp)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.ModifyFTAStrategyCode(opp, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                log.Error(e);
                return null;
            }
        }

        public JsonResult DeleteFTAStrategyCode(string FTAStrategyCodeId)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.DeleteFTAStrategyCode(FTAStrategyCodeId, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                log.Error(e);
                return null;
            }
        }

        #endregion FTAStrategyCode

        #region FTAStrategyOwner

        public JsonResult GetAllFTAStrategyOwner(string FTAStrategyOwnerId)
        {
            List<FTAStrategyOwnerMaster> lst = _dbOperations.GetFTAStrategyOwnerList(FTAStrategyOwnerId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddFTAStrategyOwner(FTAStrategyOwnerMaster taskInfo)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.AddFTAStrategyOwner(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult ModifyFTAStrategyOwner(FTAStrategyOwnerMaster opp)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.ModifyFTAStrategyOwner(opp, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult DeleteFTAStrategyOwner(string FTAStrategyOwnerId)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.DeleteFTAStrategyOwner(FTAStrategyOwnerId, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        #endregion FTAStrategyOwner

        #region DiscretionaryCode

        public JsonResult GetAllDiscretionaryCode(string DiscretionaryCodeId)
        {
            List<DiscretionaryCodeMaster> lst = _dbOperations.GetDiscretionaryCodeList(DiscretionaryCodeId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddDiscretionaryCode(DiscretionaryCodeMaster taskInfo)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.AddDiscretionaryCode(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult ModifyDiscretionaryCode(DiscretionaryCodeMaster opp)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.ModifyDiscretionaryCode(opp, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult DeleteDiscretionaryCode(string DiscretionaryCodeId)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.DeleteDiscretionaryCode(DiscretionaryCodeId, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        #endregion DiscretionaryCode

        #region BusinessSuffix

        public JsonResult GetAllBusinessSuffix(string BusinessSuffixId)
        {
            List<BusinessSuffixMaster> lst = _dbOperations.GetBusinessSuffixList(BusinessSuffixId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddBusinessSuffix(BusinessSuffixMaster taskInfo)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.AddBusinessSuffix(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult ModifyBusinessSuffix(BusinessSuffixMaster opp)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.ModifyBusinessSuffix(opp, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult DeleteBusinessSuffix(string BusinessSuffixId)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.DeleteBusinessSuffix(BusinessSuffixId, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        #endregion BusinessSuffix

        #region Business

        public JsonResult GetAllBusiness(string BusinessId)
        {
            List<BusinessMaster> lst = _dbOperations.GetBusinessList(BusinessId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddBusiness(BusinessMaster taskInfo)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.AddBusiness(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult ModifyBusiness(BusinessMaster opp)
        {

            try
            {
                string errordesc = ""; int errocode = 0;
                _dbOperations.ModifyBusiness(opp, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult DeleteBusiness(string BusinessId)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.DeleteBusiness(BusinessId, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        #endregion Business

        #region ParentID

        public JsonResult GetAllParentID(string ParentIDId)
        {
            List<ParentIDMaster> lst = _dbOperations.GetParentIDList(ParentIDId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddParentID(ParentIDMaster taskInfo)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.AddParentID(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult ModifyParentID(ParentIDMaster opp)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.ModifyParentID(opp, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult DeleteParentID(string ParentIDId)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.DeleteParentID(ParentIDId, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        #endregion ParentID

        #region ChildID

        public JsonResult GetAllChildID(string ChildIDId)
        {
            List<ChildIDMaster> lst = _dbOperations.GetChildIDList(ChildIDId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddChildID(ChildIDMaster taskInfo)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.AddChildID(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult ModifyChildID(ChildIDMaster opp)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.ModifyChildID(opp, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult DeleteChildID(string ChildIDId)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.DeleteChildID(ChildIDId, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        #endregion ChildID

        #region BusinessLine

        public JsonResult GetAllBusinessLine(string BusinessLineId)
        {
            List<BusinessLineMaster> lst = _dbOperations.GetBusinessLineList(BusinessLineId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddBusinessLine(BusinessLineMaster taskInfo)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.AddBusinessLine(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult ModifyBusinessLine(BusinessLineMaster opp)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.ModifyBusinessLine(opp, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult DeleteBusinessLine(string BusinessLineId)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.DeleteBusinessLine(BusinessLineId, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        #endregion BusinessLine

        #region FTAApplicationName

        public JsonResult GetAllFTAApplicationName(string FTAApplicationNameId)
        {
            List<FTAApplicationNameMaster> lst = _dbOperations.GetFTAApplicationNameList(FTAApplicationNameId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddFTAApplicationName(FTAApplicationNameMaster taskInfo)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.AddFTAApplicationName(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult ModifyFTAApplicationName(FTAApplicationNameMaster opp)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.ModifyFTAApplicationName(opp, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult DeleteFTAApplicationName(string FTAApplicationNameId)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.DeleteFTAApplicationName(FTAApplicationNameId, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        #endregion FTAApplicationName

        #region FTAApplicationOwner

        public JsonResult GetAllFTAApplicationOwner(string FTAApplicationOwnerId)
        {
            List<FTAApplicationOwnerMaster> lst = _dbOperations.GetFTAApplicationOwnerList(FTAApplicationOwnerId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddFTAApplicationOwner(FTAApplicationOwnerMaster taskInfo)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.AddFTAApplicationOwner(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult ModifyFTAApplicationOwner(FTAApplicationOwnerMaster opp)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.ModifyFTAApplicationOwner(opp, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult DeleteFTAApplicationOwner(string FTAApplicationOwnerId)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.DeleteFTAApplicationOwner(FTAApplicationOwnerId, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        #endregion FTAApplicationOwner

        #region FTAStrategyName

        public JsonResult GetAllFTAStrategyName(string FTAStrategyNameId)
        {
            List<FTAStrategyNameMaster> lst = _dbOperations.GetFTAStrategyNameList(FTAStrategyNameId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddFTAStrategyName(FTAStrategyNameMaster taskInfo)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.AddFTAStrategyName(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult ModifyFTAStrategyName(FTAStrategyNameMaster opp)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.ModifyFTAStrategyName(opp, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult DeleteFTAStrategyName(string FTAStrategyNameId)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.DeleteFTAStrategyName(FTAStrategyNameId, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        #endregion FTAStrategyName

        #region ApplicationCategory

        public JsonResult GetAllApplicationCategory(string ApplicationCategoryId)
        {
            List<ApplicationCategoryMaster> lst = _dbOperations.GetApplicationCategoryList(ApplicationCategoryId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddApplicationCategory(ApplicationCategoryMaster taskInfo)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.AddApplicationCategory(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult ModifyApplicationCategory(ApplicationCategoryMaster opp)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.ModifyApplicationCategory(opp, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult DeleteApplicationCategory(string ApplicationCategoryId)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.DeleteApplicationCategory(ApplicationCategoryId, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        #endregion ApplicationCategory

        #region Strategytype

        public JsonResult GetAllStrategytype(string StrategytypeId)
        {
            List<StrategytypeMaster> lst = _dbOperations.GetStrategytypeList(StrategytypeId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddStrategytype(StrategytypeMaster taskInfo)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.AddStrategytype(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult ModifyStrategytype(StrategytypeMaster opp)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.ModifyStrategytype(opp, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult DeleteStrategytype(string StrategytypeId)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.DeleteStrategytype(StrategytypeId, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        #endregion Strategytype

        #region Venuetype

        public JsonResult GetAllVenuetype(string VenuetypeId)
        {
            List<VenuetypeMaster> lst = _dbOperations.GetVenuetypeList(VenuetypeId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddVenuetype(VenuetypeMaster taskInfo)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.AddVenuetype(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult ModifyVenuetype(VenuetypeMaster opp)
        {
            try
            {
                string errordesc = "";

                int errocode = 0;
                _dbOperations.ModifyVenuetype(opp, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult DeleteVenuetype(string VenuetypeId)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.DeleteVenuetype(VenuetypeId, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        #endregion Venuetype

        #region Capacity

        public JsonResult GetAllCapacity(string CapacityId)
        {
            List<CapacityMaster> lst = _dbOperations.GetCapacityList(CapacityId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddCapacity(CapacityMaster taskInfo)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.AddCapacity(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult ModifyCapacity(CapacityMaster opp)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.ModifyCapacity(opp, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e) { log.Error(e); return null; }
        }

        public JsonResult DeleteCapacity(string CapacityId)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.DeleteCapacity(CapacityId, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                log.Error(e);
                return null;
            }
        }

        #endregion Capacity

        public JsonResult GetAllThirdPartyAppList(string Id)
        {
            List<ThirdPartyApp> lst = _dbOperations.GetThirdPartyAppList(Id);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAllBusinessMappingbyId(string Id)
        {
            List<BusinessMappingMaster> lst = _dbOperations.GetBusinessMappingListbyId(Id);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAllFTAStrategyMappingbyId(string Id)
        {
            List<FTAStrategyMappingMaster> lst = _dbOperations.GetFTAStrategyMappingListbyId(Id);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAllFTAApplicationMappingbyId(string Id)
        {
            List<FTAApplicationMappingMaster> lst = _dbOperations.GetFTAApplicationMappingListbyId(Id);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        #region BusinessMapping

        public JsonResult GetAllBusinessMapping(string BusinessId)
        {
            List<BusinessMappingMaster> lst = _dbOperations.GetBusinessMappingList(BusinessId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddBusinessMapping(BusinessMappingMaster taskInfo)
        {
            string errordesc = "";
            int errocode = 0;
            _dbOperations.AddBusinessMapping(taskInfo, out errocode, out errordesc);
            return Json(errordesc, JsonRequestBehavior.AllowGet);
        }

        public JsonResult DeleteBusinessMapping(string BusinessId)
        {
            string errordesc = "";
            int errocode = 0;
            _dbOperations.DeleteBusinessMapping(BusinessId, out errocode, out errordesc);
            return Json(errordesc, JsonRequestBehavior.AllowGet);
        }

        #endregion BusinessMapping

        #region FTAStrategyMapping

        public JsonResult GetStrategyVersionLog(string Id)
        {
            List<StrategyVersionLog> lst = _dbOperations.GetStrategyVersionLog(Id);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAllFTAStrategyMapping(string FTAStrategyId)
        {
            List<FTAStrategyMappingMaster> lst = _dbOperations.GetFTAStrategyMappingList(FTAStrategyId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddFTAStrategyMapping(FTAStrategyMappingMaster taskInfo)
        {
            string errordesc = "";
            int errocode = 0;
            _dbOperations.AddFTAStrategyMapping(taskInfo, out errocode, out errordesc);
            return Json(errordesc, JsonRequestBehavior.AllowGet);
        }

        public JsonResult DeleteFTAStrategyMapping(string Id)
        {
            string errordesc = "";
            int errocode = 0;
            _dbOperations.DeleteFTAStrategyMapping(Id, out errocode, out errordesc);
            return Json(errordesc, JsonRequestBehavior.AllowGet);
        }

        #endregion FTAStrategyMapping

        #region FTAApplicationMapping

        public JsonResult GetAllFTAApplicationMapping(string BusinessId)
        {
            List<FTAApplicationMappingMaster> lst = _dbOperations.GetFTAApplicationMappingList(BusinessId);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddFTAApplicationMapping(FTAApplicationMappingMaster taskInfo)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.AddFTAApplicationMapping(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public JsonResult DeleteFTAApplicationMapping(string Id)
        {
            string errordesc = "";
            int errocode = 0;
            _dbOperations.DeleteFTAApplicationMapping(Id, out errocode, out errordesc);
            return Json(errordesc, JsonRequestBehavior.AllowGet);
        }

        #endregion FTAApplicationMapping


        #region ReportApplicationMapping

        public JsonResult GetAllReportApplicationMapping(string Id)
        {
            List<ReportAppMapping> lst = _dbOperations.GetReportApplicationMappingList(Id);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddReportMapping(ReportAppMapping taskInfo)
        {
            try
            {
                string errordesc = "";
                int errocode = 0;
                _dbOperations.AddReportApplicationMapping(taskInfo, out errocode, out errordesc);
                return Json(errordesc, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public JsonResult DeleteReportApplicationMapping(string Id)
        {
            string errordesc = "";
            int errocode = 0;
            _dbOperations.DeleteReportApplicationMapping(Id, out errocode, out errordesc);
            return Json(errordesc, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAllReportApplicationAutofill(string Id)
        {
            List<ReportAppMapping> lst = _dbOperations.GetReportApplicationfilter(Id);
            return Json(lst, JsonRequestBehavior.AllowGet);
        }




        #endregion ReportApplicationMapping
    }
}

public class SessionTimeoutAttribute : ActionFilterAttribute
{
    public override void OnActionExecuting(ActionExecutingContext filterContext)
    {
        HttpContext ctx = HttpContext.Current;
        if (HttpContext.Current.Session["UserName"] == null)
        {
            filterContext.Result = new RedirectResult("~/Home/LoginDisplay");
            return;
        }
        base.OnActionExecuting(filterContext);
    }
}

public static class Utilities
{
    public static string IsActive(this HtmlHelper html,
                                  string control,
                                  string action)
    {
        var routeData = html.ViewContext.RouteData;

        var routeAction = (string)routeData.Values["action"];
        var routeControl = (string)routeData.Values["controller"];

        // both must match
        var returnActive = control == routeControl &&
                           action == routeAction;

        return returnActive ? "active" : "";
    }
}


[AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
public sealed class NoCacheAttribute : ActionFilterAttribute
{
    public override void OnResultExecuting(ResultExecutingContext filterContext)
    {
        filterContext.HttpContext.Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
        filterContext.HttpContext.Response.Cache.SetValidUntilExpires(false);
        filterContext.HttpContext.Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
        filterContext.HttpContext.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        filterContext.HttpContext.Response.Cache.SetNoStore();

        base.OnResultExecuting(filterContext);
    }
}

