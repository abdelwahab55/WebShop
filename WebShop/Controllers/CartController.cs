using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Xml;
using WebShop.Models;

namespace WebShop.Controllers
{
    public class CartController : Controller
    {
        //
        // GET: /Cart/

        public ActionResult Index()
        {
            List<Books> CartBooksList = new List<Books>();
            decimal TotalPrice, TotalVat, TotalFinalPrice;
            TotalPrice = TotalVat = TotalFinalPrice = 0;
            if (HttpContext.Session["Cart"] != null)
            {
                List<string> CartBookIDs = (List<string>)HttpContext.Session["Cart"];

                CartBooksList = Utilities.GetBooksAddedToCart(CartBookIDs);
                
                for (int i = 0; i < CartBooksList.Count; i++)
                {
                    TotalVat += (CartBooksList[i].VatPercentage * CartBooksList[i].Price);
                    TotalPrice += CartBooksList[i].Price;

                }
                TotalFinalPrice = TotalPrice + TotalVat;
            }
            ViewData["TotalPrice"] = TotalPrice.ToString();
            ViewData["TotalVat"] = TotalVat.ToString();
            ViewData["TotalFinalPrice"] = TotalFinalPrice.ToString();
            return View(CartBooksList);
        }

    }
}
