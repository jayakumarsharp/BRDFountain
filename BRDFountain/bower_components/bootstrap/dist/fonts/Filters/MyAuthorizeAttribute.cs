using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using WebMatrix.WebData;
using System.Web.Script.Serialization;
using System.Data.SqlClient;
using System.Data;

namespace CRUserManagement.Filters
{
    public class MyAuthorizeAttribute : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {

            var authorized = base.AuthorizeCore(httpContext);
            if (!authorized)
            {
                // The user is not authorized => no need to go any further
                return false;
            }
            // We have an authenticated user, let's get his username
            //string authenticatedUser = httpContext.User.Identity.Name;

            //using (var db = new TclContext())
            //{
            //    var rolename = System.Web.Security.Roles.GetRolesForUser(WebSecurity.CurrentUserName).FirstOrDefault();                
            //    var query = (from r in db.Roles
            //                 select new RoleViewModel
            //                 {
            //                     RoleId = r.RoleId,
            //                     RoleName = r.RoleName,
            //                     MenuItems = r.MenuItems.ToList()

            //                 }).Where(x=>x.RoleName == rolename) .ToList();

            //    List<MenuItem> menus = query.SelectMany(x => x.MenuItems).ToList();
            //    List<string> controllers = menus.Select(x => x.ControllerName).ToList();


            //    RouteData  rd = httpContext.Request.RequestContext.RouteData;
            //    string current_controller = rd.GetRequiredString("controller");                
            //    if (controllers.Contains(current_controller))
            //    {
            //        return true;
            //    }
            //    else
            //    {
            //        return false;
            //    }

            //}      
            return false;
        }


        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            var ctrl = filterContext.Controller;

            var routeValues = new RouteValueDictionary(new
            {
                controller = "Home",
                action = "LoginDisplay"
            });
            filterContext.Result = new RedirectToRouteResult(routeValues);

        }

    }

    public class SqlExceptionAttribute : HandleErrorAttribute
    {
        public override void OnException(ExceptionContext ex)
        {

            base.OnException(ex);
        }
    }

    public class NoCacheAttribute : ActionFilterAttribute
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


    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, Inherited = true, AllowMultiple = true)]
    public class SessionExpireFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            HttpContext ctx = HttpContext.Current;

            // If the browser session or authentication session has expired...
            if (ctx.Session["UserName"] == null || !filterContext.HttpContext.Request.IsAuthenticated)
            {
                if (filterContext.HttpContext.Request.IsAjaxRequest())
                {
                    // For AJAX requests, we're overriding the returned JSON result with a simple string,
                    // indicating to the calling JavaScript code that a redirect should be performed.
                    filterContext.Result = new JsonResult { Data = "_Logon_" };
                }
                else
                {
                    // For round-trip posts, we're forcing a redirect to Home/TimeoutRedirect/, which
                    // simply displays a temporary 5 second notification that they have timed out, and
                    // will, in turn, redirect to the logon page.
                    filterContext.Result = new RedirectToRouteResult(
                        new RouteValueDictionary {
                        { "Controller", "Home" },
                        { "Action", "LoginDisplay" }
                });
                }
            }

            base.OnActionExecuting(filterContext);
        }
    }

    public class RequireAuthorizeAttribute : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            var identity = filterContext.HttpContext.User.Identity;

            if (identity.IsAuthenticated == true)
            {
                //get use login session object
                var loginSession = HttpContext.Current.Session["UserName"];
                if (loginSession == null)
                {
                    filterContext.Result = new RedirectResult("~/Home/LoginDisplay");

                    return;
                }
            }
            base.OnAuthorization(filterContext);
        }
    }

}
