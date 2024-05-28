using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace techblog
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkId=254726
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/admin").Include("~/Scripts/sb-admin.js"));
            bundles.Add(new StyleBundle("~/Content/css").Include("~/Content/Style.css", "~/Content/Site.css"));
            bundles.Add(new StyleBundle("~/Content/admin").Include("~/Content/sb-admin.css"));

            BundleTable.EnableOptimizations = true;
        }
    }
}