using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml;

namespace WebShop.Controllers
{
    public class ArticlesController : Controller
    {
        //
        // GET: /Articles/

        public ActionResult Index()
        {
            return View();
        }
        public string GetCartBooksCount()
        {
            if (System.Web.HttpContext.Current.Session["Cart"] != null)
            {
                return (((List<string>)System.Web.HttpContext.Current.Session["Cart"]).Count).ToString();
            }
            else
            {
                return "0";
            }
        }
        public int GetPagesCount()
        {
            string xmlPath = HttpContext.Server.MapPath("~/App_Data/Books.xml");
            
            DataSet ds = new DataSet();
            ds.ReadXml(xmlPath);
            int count = ds.Tables[0].Rows.Count;
            if (count % Utilities.PagesNumberOfRecords == 0)
            {
                return count / Utilities.PagesNumberOfRecords;
            }
            else
            {
                return (count / Utilities.PagesNumberOfRecords) + 1;
            }
        }
    }
}
