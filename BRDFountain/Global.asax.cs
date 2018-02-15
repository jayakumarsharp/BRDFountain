using BRDFountain.App_Start;
using BRDFountain.Filters;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using WebMatrix.WebData;

namespace BRDFountain
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            try
            {
                AreaRegistration.RegisterAllAreas();
                WebApiConfig.Register(GlobalConfiguration.Configuration);
                FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);

                RouteConfig.RegisterRoutes(RouteTable.Routes);
                BundleConfig.RegisterBundles(BundleTable.Bundles);
                //WebSecurity.InitializeDatabaseConnection("CDRConn", "TBL_UserMaster", "UserId", "UserName", autoCreateTables: true);
                log4net.Config.XmlConfigurator.Configure();
                BundleTable.Bundles.ForEach(x => x.Transforms.Clear());
            }
            //catch (SqlException ex1)
            //{
            //}
            catch (Exception ex)
            {
            }

        }

        void Session_Start(object sender, EventArgs e)
        {
            Session["UserName"] = null;
            string sessionId = Session.SessionID;
        }

        //void Session_End(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        HttpContext.Current.Response.Redirect("Home/LoginDisplay");
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //}

    }
}