using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace BRDFountain.App_Start
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/defaultscripts").Include(
                     "~/plugins/moment.js",                     
                        "~/Lib/bootstrap.js",
                        "~/Lib/jquery-1.11.0.min.js",
                        "~/Lib/bootstrap-datetimepicker.js",
                        "~/Lib/jquery.dataTables.min.js",
                        "~/Lib/angular.min.js",
                        "~/Lib/underscore-min.js",
                        "~/Lib/angulardatatabes.js",
                        "~/Assert/angular-animate.min.js",
                         "~/Assert/toaster.js",
                         "~/plugins/ng-file-upload/dist/ng-file-upload.min.js",
                         "~/plugins/ng-file-upload/dist/ng-file-upload-shim.min.js"

                    ));

            const string ANGULAR_APP_ROOT = "~/js/";
            var scriptBundle = new ScriptBundle("~/bundles/customscripts")
                .IncludeDirectory(ANGULAR_APP_ROOT, "*.js", searchSubdirectories: true);
            bundles.Add(scriptBundle);

            BundleTable.EnableOptimizations = true;
        }
    }
}