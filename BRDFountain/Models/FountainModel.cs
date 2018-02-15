using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

namespace BRDFountain.Models
{




    public class TransferSetting
    {
        public string Id { get; set; }
        public string OwnerUser { get; set; }
        public string Transferuser { get; set; }
        public string TransferFrom { get; set; }
        public string TransferTo { get; set; }
        public string IsActive { get; set; }
    }


    public class StrategyVersionLog
    {
        public int Id { get; set; }
        public string RefNumber { get; set; }
        public string Version { get; set; }
        public string ChangeDesc { get; set; }
        public string FTAShortCode { get; set; }
        public string CreatedDateTime { get; set; }
        public string Createdby { get; set; }

    }



    public class StrategyDetails
    {
        public Strategy Strategy { get; set; }
        public List<StrategyApprover> lst { get; set; }
    }
    public class Emails
    {
        public string IsMappedToTask { get; set; }
        public string IsActive { get; set; }
        public string IsProcessed { get; set; }
        public string TaskId { get; set; }
        public string TaskAttachement { get; set; }
        public string TaskComments { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public string TaskAssignedBy { get; set; }
        public string TaskAssignedDate { get; set; }
        public string LastModifiedDate { get; set; }
        public string LastModifiedBy { get; set; }
        public int Id { get; set; }
        public string UniqueEmailId { get; set; }
        public string EmailId { get; set; }
        public string StrategyNumber { get; set; }
        public string EmailSubject { get; set; }
        public string EmailContent { get; set; }
        public string EmailAttachment { get; set; }

    }



    public class MapTasks
    {
        public string IsMappedToTask { get; set; }
        public string IsActive { get; set; }
        public string IsProcessed { get; set; }
        public string TaskId { get; set; }
        public string TaskName { get; set; }
        public string TaskAttachement { get; set; }
        public string TaskComments { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public string TaskAssignedBy { get; set; }
        public string TaskAssignedDate { get; set; }
        public string LastModifiedDate { get; set; }
        public string LastModifiedBy { get; set; }
        public int Id { get; set; }
        public string UniqueEmailId { get; set; }
        public string EmailId { get; set; }
        public string RefNumber { get; set; }
        public string Version { get; set; }
        public string EmailSubject { get; set; }
        public string EmailContent { get; set; }
        public string EmailAttachment { get; set; }

    }





    public class OnboardingTasks
    {

        public string filename { get; set; }
        public string IsMappedToTask { get; set; }
        public string IsActive { get; set; }
        public string IsProcessed { get; set; }
        public string TaskId { get; set; }
        public string TaskName { get; set; }
        public string TaskAttachement { get; set; }
        public string TaskComments { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public string TaskAssignedBy { get; set; }
        public string TaskAssignedDate { get; set; }
        public string LastModifiedDate { get; set; }
        public string LastModifiedBy { get; set; }
        public int Id { get; set; }
        public string UniqueEmailId { get; set; }
        public string EmailId { get; set; }
        public string RefNumber { get; set; }
        public string Version { get; set; }
        public string EmailSubject { get; set; }
        public string EmailContent { get; set; }
        public string EmailAttachment { get; set; }

        public HttpPostedFileBase Attachment { get; set; }
    }


    public class Tasks
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string IsSignOff { get; set; }
        public string SignOffDate { get; set; }
        public string SignoffBy { get; set; }
        public string IsActive { get; set; }

    }

    public class StrategyApprover
    {

        public string Id { get; set; }
        public string RefNumber { get; set; }
        public string Version { get; set; }
        public string Approver { get; set; }
        public string Comments { get; set; }
        public string ApprovedDate { get; set; }
        public string CreatedDate { get; set; }

        public string Status { get; set; }
        public string OriginalApprover { get; set; }
        public string Type { get; set; }
        public string Uploadedby { get; set; }

    }


    public class StrategyReportFilter
    {
        public string Region { get; set; }
        public string FTAApplicationCode { get; set; }
        public string FTAStrategyCode { get; set; }
        public string BusinessLine { get; set; }
        public string Country { get; set; }
        public string FTAApplicationOwner { get; set; }
        public string SystemFlow { get; set; }
        public string ApplicationCategory { get; set; }
        public string VenuetypeId { get; set; }
        public string ChildID { get; set; }
        public string ParentID { get; set; }
        public string FTAApplicationNameId { get; set; }
        public string ThirdPartyAppId { get; set; }

    }

    public class Strategy
    {
        public int Id { get; set; }
        public string RefNumber { get; set; }

        public string CountryId { get; set; }
        public string CountryNameList { get; set; }

        public string Country { get; set; }
        public string CountryName { get; set; }
        public string Region { get; set; }
        public string RegionName { get; set; }
        public string Description { get; set; }

        public string NoOfApprover { get; set; }
        public int Version { get; set; }
        public string SignOff { get; set; }
        public string SignOffDate { get; set; }
        public string SignoffBy { get; set; }
        public string IsActive { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public string LastModifiedDate { get; set; }
        public string LastModifiedBy { get; set; }
        public string Page { get; set; }
        public int FTAApplicationCodeId { get; set; }
        public string FTAApplicationCode { get; set; }
        public int BusinessSuffixId { get; set; }
        public string BusinessSuffix { get; set; }
        public int ChildIDValue { get; set; }
        public string ChildID { get; set; }
        public int FTAStrategyNameId { get; set; }
        public string FTAStrategyName { get; set; }
        public int StrategytypeId { get; set; }
        public string Strategytype { get; set; }
        public string GOLiveDate { get; set; }
        public int FTAStrategyCodeId { get; set; }
        public string FTAStrategyCode { get; set; }
        public int FTAShortCodeId { get; set; }
        public string FTAShortCode { get; set; }
        public int BusinessLineId { get; set; }
        public string BusinessLine { get; set; }
        public int FTAApplicationNameId { get; set; }
        public string FTAApplicationName { get; set; }
        public string FTAStrategyOwnerId { get; set; }
        public string FTAStrategyOwner { get; set; }
        public int ApplicationCategoryId { get; set; }
        public string ApplicationCategory { get; set; }
        public string DecomissionedDate { get; set; }
        public int DiscretionaryCodeId { get; set; }
        public string DiscretionaryCode { get; set; }
        public string ParentIDValue { get; set; }
        public string ParentID { get; set; }
        public string FTAApplicationOwnerId { get; set; }
        public string FTAApplicationOwner { get; set; }
        public string PriorityScore { get; set; }
        public string Priority { get; set; }
        public int CapacityId { get; set; }
        public string Capacity { get; set; }
        public int VenueTypeId { get; set; }
        public string VenueType { get; set; }

        public int ThirdPartyAppId { get; set; }
        public string ThirdPartyValue { get; set; }
        public int BusinessId { get; set; }
        public string Business { get; set; }
        public string FTAApplicationMappingId { get; set; }
        public string FTAStrategyMappingId { get; set; }
        public string BusinessMappingId { get; set; }
        public string Systemflowfile { get; set; }
        public string Decommissionedfile { get; set; }

        public string ExistingSystemflowfile { get; set; }
        public string ExistingDecommissionedfile { get; set; }

    }


    public class RoleRightMapping
    {
        public string id { get; set; }
        public string RoleID { get; set; }
        public string RightID { get; set; }
        public string selectedRole { get; set; }
        public List<RightMaster> Rights { get; set; }
    }

    public class RightMaster
    {
        public string Icon { get; set; }
        public string MenuName { get; set; }
        public string Path { get; set; }
        public string RightID { get; set; }
        public string RightName { get; set; }
        public string ShowMenu { get; set; }
        public string id { get; set; }

    }

    public class ADUserMaster
    {
        public string Userid { get; set; }
        public string UserName { get; set; }
        public string EmailId { get; set; }
    }
    public class UserMaster
    {
        public string ApprovedDate { get; set; }
        public string Approvedby { get; set; }
        public int AttemptedTries { get; set; }
        public string BusinessSectorId { get; set; }
        public string BusinessSector { get; set; }
        public string RegionId { get; set; }
        public string RegionName { get; set; }
        public string CountryId { get; set; }
        public string CountryName { get; set; }
        public string RoleId { get; set; }
        public string RoleName { get; set; }
        public string CheckerComment { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string CustomData { get; set; }
        public string EmailId { get; set; }
        public string FirstWorkingDate { get; set; }
        public string IsADUser { get; set; }
        public string LastAuthenticatedDate { get; set; }
        public string LastUsedDate { get; set; }
        public string LastWorkingDate { get; set; }
        public int LocationId { get; set; }
        public string MakerComment { get; set; }
        public string MobileNumber { get; set; }
        public string ModifiedBy { get; set; }
        public string ModifiedDate { get; set; }
        public string Password { get; set; }
        public string PasswordExpiryDate { get; set; }
        public string Status { get; set; }
        public string UserBlockDate { get; set; }
        public string UserExpiryDate { get; set; }
        public string UserImage { get; set; }
        public string UserName { get; set; }
        public string userId { get; set; }
        public string Id { get; set; }

        public List<CountryMaster> CountryList { get; set; }
        public List<RegionMaster> RegionList { get; set; }
        public List<BusinessSector> BusinessSectorList { get; set; }
    }

    public class Roles
    {
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public string ModifiedDate { get; set; }
        public string RoleName { get; set; }
        public string id { get; set; }
    }


    public class ApplicationMaster
    {
        public string Id { get; set; }
        public string ApplicationId { get; set; }
        public string ApplicationName { get; set; }

    }


    public class CountryMaster
    {
        public string Id { get; set; }
        public string CountryName { get; set; }

    }

    public class RegionMaster
    {
        public string Id { get; set; }
        public string RegionName { get; set; }

    }

    public class ProductMaster
    {
        public string Id { get; set; }
        public string ProductName { get; set; }

    }


    public class BusinessSector
    {
        public string Id { get; set; }
        public string BusinessSectorName { get; set; }

    }



    public class FTAStrategyCodeMaster
    {
        public string Id { get; set; }
        public string FTAStrategyCode { get; set; }

    }
    public class DiscretionaryCodeMaster
    {
        public string Id { get; set; }
        public string DiscretionaryCode { get; set; }

    }

    public class BusinessSuffixMaster
    {
        public string Id { get; set; }
        public string BusinessSuffix { get; set; }

    }
    public class BusinessMaster
    {
        public string Id { get; set; }
        public string Business { get; set; }

    }

    public class ParentIDMaster
    {
        public string Id { get; set; }
        public string ParentID { get; set; }

    }
    public class ChildIDMaster
    {
        public string Id { get; set; }
        public string ChildID { get; set; }

    }
    public class BusinessLineMaster
    {
        public string Id { get; set; }
        public string BusinessLine { get; set; }

    }



    public class FTAApplicationNameMaster
    {
        public string Id { get; set; }
        public string FTAApplicationName { get; set; }

    }
    public class FTAApplicationOwnerMaster
    {
        public string Id { get; set; }
        public string FTAApplicationOwner { get; set; }

    }
    public class FTAStrategyNameMaster
    {
        public string Id { get; set; }
        public string FTAStrategyName { get; set; }

    }
    public class FTAStrategyOwnerMaster
    {
        public string Id { get; set; }
        public string FTAStrategyOwner { get; set; }

    }
    public class SystemFlowMaster
    {
        public string Id { get; set; }
        public string SystemFlow { get; set; }

    }

    public class ApplicationCategoryMaster
    {
        public string Id { get; set; }
        public string ApplicationCategory { get; set; }

    }
    public class StrategytypeMaster
    {
        public string Id { get; set; }
        public string Strategytype { get; set; }

    }
    public class VenuetypeMaster
    {
        public string Id { get; set; }
        public string Venuetype { get; set; }

    }
    public class CapacityMaster
    {
        public string Id { get; set; }
        public string Capacity { get; set; }

    }
    public class PriorityScoreMaster
    {
        public string Id { get; set; }
        public string PriorityScore { get; set; }

    }
    public class FTAApplicationCodeMaster
    {
        public string Id { get; set; }
        public string FTAApplicationCode { get; set; }

    }

    public class ThirdPartyApp
    {
        public string Id { get; set; }
        public string Value { get; set; }

    }


    public class BusinessMappingMaster
    {
        public string Id { get; set; }
        public string BusinessId { get; set; }
        public string Business { get; set; }
        public string BusinessSuffixId { get; set; }
        public string BusinessSuffix { get; set; }

    }

    public class FTAStrategyMappingMaster
    {
        public string Id { get; set; }
        public string FTAStrategyNameId { get; set; }
        public string FTAStrategyName { get; set; }
        public string FTAStrategyCodeId { get; set; }
        public string FTAStrategyCode { get; set; }

    }

    public class FTAApplicationMappingMaster
    {
        public string Id { get; set; }
        public string ThirdPartyAppId { get; set; }
        public string ThirdPartyAppName { get; set; }
        public string ChildId { get; set; }
        public string ChildIdValue { get; set; }
        public string FTAApplicationCodeId { get; set; }
        public string FTAApplicationCode { get; set; }
        public string FTAApplicationNameId { get; set; }
        public string FTAApplicationName { get; set; }

        public string ParentID { get; set; }
        public string ParentIDValue { get; set; }

        public string ApplicationOwnerId { get; set; }
        public string ApplicationOwner { get; set; }

        public string ApplicationCategoryId { get; set; }
        public string ApplicationCategory { get; set; }

    }



    public class ReportAppMapping
    {
        public string Id { get; set; }
        public string ThirdPartyAppId { get; set; }
        public string ThirdPartyAppName { get; set; }
        public string ChildId { get; set; }
        public string ChildIdValue { get; set; }
        public string FTAApplicationCodeId { get; set; }
        public string FTAApplicationCode { get; set; }
        public string FTAApplicationNameId { get; set; }
        public string FTAApplicationName { get; set; }

        public string ParentID { get; set; }
        public string ParentIDValue { get; set; }

        public string ApplicationOwnerId { get; set; }
        public string ApplicationOwner { get; set; }

        public string ApplicationCategoryId { get; set; }
        public string ApplicationCategory { get; set; }

        public string BusinessLineId { get; set; }
        public string BusinessLine { get; set; }
        public string Country { get; set; }
        public string CountryName { get; set; }
        public string Region { get; set; }
        public string RegionName { get; set; }


    }






    public static class SimpleComparer
    {
        // Item1: property name, Item2 current, Item3 original
        public static List<Tuple<string, object, object>> Differences<T>(T current, T original)
        {
            var diffs = new List<Tuple<string, object, object>>();

            MethodInfo areEqualMethod = typeof(SimpleComparer).GetMethod("AreEqual", BindingFlags.Static | BindingFlags.NonPublic);

            foreach (PropertyInfo prop in typeof(T).GetProperties(BindingFlags.Instance | BindingFlags.Public))
            {
                object x = prop.GetValue(current);
                object y = prop.GetValue(original);
                bool areEqual = (bool)areEqualMethod.MakeGenericMethod(prop.PropertyType).Invoke(null, new object[] { x, y });

                if (!areEqual)
                {
                    diffs.Add(Tuple.Create(prop.Name, x, y));
                }
            }

            return diffs;
        }

        private static bool AreEqual<T>(T x, T y)
        {
            return EqualityComparer<T>.Default.Equals(x, y);
        }
    }


    public class ExcelExportHelper
    {
        public static string ExcelContentType
        {
            get
            { return "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"; }
        }

        public static DataTable ListToDataTable<T>(List<T> data)
        {
            PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(T));
            DataTable dataTable = new DataTable();

            for (int i = 0; i < properties.Count; i++)
            {
                PropertyDescriptor property = properties[i];
                dataTable.Columns.Add(property.Name, Nullable.GetUnderlyingType(property.PropertyType) ?? property.PropertyType);
            }

            object[] values = new object[properties.Count];
            foreach (T item in data)
            {
                for (int i = 0; i < values.Length; i++)
                {
                    values[i] = properties[i].GetValue(item);
                }

                dataTable.Rows.Add(values);
            }
            return dataTable;
        }

        public static byte[] ExportExcel(DataTable dataTable, string heading = "", bool showSrNo = false, params string[] columnsToTake)
        {

            byte[] result = null;
            using (ExcelPackage package = new ExcelPackage())
            {
                ExcelWorksheet workSheet = package.Workbook.Worksheets.Add(String.Format("{0} Data", heading));
                int startRowFrom = String.IsNullOrEmpty(heading) ? 1 : 3;

                if (showSrNo)
                {
                    DataColumn dataColumn = dataTable.Columns.Add("#", typeof(int));
                    dataColumn.SetOrdinal(0);
                    int index = 1;
                    foreach (DataRow item in dataTable.Rows)
                    {
                        item[0] = index;
                        index++;
                    }
                }


                // add the content into the Excel file  
                workSheet.Cells["A" + startRowFrom].LoadFromDataTable(dataTable, true);

                // autofit width of cells with small content  
                int columnIndex = 1;
                foreach (DataColumn column in dataTable.Columns)
                {
                    ExcelRange columnCells = workSheet.Cells[workSheet.Dimension.Start.Row, columnIndex, workSheet.Dimension.End.Row, columnIndex];
                    int maxLength = columnCells.Max(cell => (cell.Value == null ? "" : Convert.ToString(cell.Value)).Count());
                    if (maxLength < 150)
                    {
                        workSheet.Column(columnIndex).AutoFit();
                    }

                    columnIndex++;
                }

                // format header - bold, yellow on black  
                using (ExcelRange r = workSheet.Cells[startRowFrom, 1, startRowFrom, dataTable.Columns.Count])
                {
                    r.Style.Font.Color.SetColor(System.Drawing.Color.White);
                    r.Style.Font.Bold = true;
                    r.Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                    r.Style.Fill.BackgroundColor.SetColor(System.Drawing.ColorTranslator.FromHtml("#1fb5ad"));
                }

                // format cells - add borders  
                using (ExcelRange r = workSheet.Cells[startRowFrom + 1, 1, startRowFrom + dataTable.Rows.Count, dataTable.Columns.Count])
                {
                    r.Style.Border.Top.Style = ExcelBorderStyle.Thin;
                    r.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                    r.Style.Border.Left.Style = ExcelBorderStyle.Thin;
                    r.Style.Border.Right.Style = ExcelBorderStyle.Thin;

                    r.Style.Border.Top.Color.SetColor(System.Drawing.Color.Black);
                    r.Style.Border.Bottom.Color.SetColor(System.Drawing.Color.Black);
                    r.Style.Border.Left.Color.SetColor(System.Drawing.Color.Black);
                    r.Style.Border.Right.Color.SetColor(System.Drawing.Color.Black);
                }

                // removed ignored columns  
                for (int i = dataTable.Columns.Count - 1; i >= 0; i--)
                {
                    if (i == 0 && showSrNo)
                    {
                        continue;
                    }
                    if (!columnsToTake.Contains(dataTable.Columns[i].ColumnName))
                    {
                        workSheet.DeleteColumn(i + 1);
                    }
                }

                if (!String.IsNullOrEmpty(heading))
                {
                    workSheet.Cells["A1"].Value = heading;
                    workSheet.Cells["A1"].Style.Font.Size = 20;

                    workSheet.InsertColumn(1, 1);
                    workSheet.InsertRow(1, 1);
                    workSheet.Column(1).Width = 5;
                }

                result = package.GetAsByteArray();
            }

            return result;
        }

        public static byte[] ExportExcel<T>(List<T> data, string Heading = "", bool showSlno = false, params string[] ColumnsToTake)
        {
            return ExportExcel(ListToDataTable<T>(data), Heading, showSlno, ColumnsToTake);
        }

    }
}