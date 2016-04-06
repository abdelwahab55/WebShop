using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebShop.Models;

namespace WebShop.Controllers
{
    public class PopUpController : Controller
    {
        // GET: /PopUp/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetPopUp(string Title, string Author, string Genre, string Price, string PublishDate, string Description, string Vat)
        {
            ViewData["Title"] = Title;
            ViewData["Author"] = Author;
            ViewData["Genre"] = Genre;
            ViewData["Price"] = decimal.Parse(Price);
            ViewData["PublishDate"] = DateTime.Parse(PublishDate);
            ViewData["Description"] = Description;
            ViewData["Vat"] = decimal.Parse(Vat);

            return View("GetPopUp");
        }
    }
}
