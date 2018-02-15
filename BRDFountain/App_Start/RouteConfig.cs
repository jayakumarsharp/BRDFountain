using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace BRDFountain
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "LoginDisplay", id = UrlParameter.Optional }
            );

          //  routes.MapRoute(
          //    name: "RedirectToSTV",
          //    url: "{controller}/{action}/{Page}",
          //    defaults: new { controller = "ManageSTVDenomination", action = "Index", Page = UrlParameter.Optional }
          //);
        }
    }
}