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

                string xmlData = Server.MapPath("~/App_Data/Books.xml");
                DataSet ds = new DataSet();
                ds.ReadXml(xmlData);
                List<Books> BooksList = new List<Books>();
                BooksList = (from rows in ds.Tables[0].AsEnumerable()
                             select new Books
                             {
                                 BookID = Convert.ToInt32(rows["id"].ToString()),
                                 Author = rows["author"].ToString(),
                                 Title = rows["title"].ToString(),
                                 Genre = rows["genre"].ToString(),
                                 Price = decimal.Parse(rows["price"].ToString()),
                                 PublishDate = DateTime.Parse(rows["publish_date"].ToString()),
                                 Description = rows["description"].ToString(),
                                 VatPercentage = decimal.Parse(rows["VAT"].ToString()),
                             }).ToList();

                for (int i = 0; i < BooksList.Count; i++)
                {
                    for (int j = 0; j < CartBookIDs.Count; j++)
                    {
                        if (BooksList[i].BookID.ToString() == CartBookIDs[j])
                        {
                            Books Book=new Books();
                            Book.Title=BooksList[i].Title;
                            Book.Author=BooksList[i].Author;
                            Book.Price=BooksList[i].Price;
                            Book.VatPercentage=BooksList[i].VatPercentage;
                            CartBooksList.Add(Book);
                            TotalVat += (BooksList[i].VatPercentage * BooksList[i].Price);
                            TotalPrice += BooksList[i].Price;
                        }
                    }
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
