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
    public class BookAPIController : ApiController
    {
        // GET api/bookapi
        //public IEnumerable<Books> Get()
        public IEnumerable<Books> GetBooksList()
        {
            return Utilities.ReadBooksListFromXML();
        }

        // GET api/bookapi/5
        public Books GetBook(int id)
        {
            Books Book=new Books();
            XmlDocument doc = new XmlDocument();
            doc.Load(HttpContext.Current.Server.MapPath("~/App_Data/Books.xml"));
            XmlNode Node = doc.DocumentElement.SelectSingleNode(@"//book[@id='" + id + "']");
            
            Book.BookID = id;
            Book.Author = Node["author"].InnerText;
            Book.Title = Node["title"].InnerText;
            Book.Genre = Node["genre"].InnerText;
            Book.Price = decimal.Parse(Node["price"].InnerText);
            Book.PublishDate = DateTime.Parse(Node["publish_date"].InnerText);
            Book.Description = Node["description"].InnerText;
            Book.VatPercentage = decimal.Parse(Node["VAT"].InnerText);

            return Book;
        }

        // POST api/bookapi
        public void AddToCart(string id)
        {
            if (System.Web.HttpContext.Current.Session["Cart"] == null)
            {
                List<string> CartBookIDs = new List<string>();
                CartBookIDs.Add(id);
                System.Web.HttpContext.Current.Session["Cart"] = CartBookIDs;
            }
            else
            {
                List<string> CartBookIDs = (List<string>)System.Web.HttpContext.Current.Session["Cart"];
                CartBookIDs.Add(id);
                System.Web.HttpContext.Current.Session["Cart"] = CartBookIDs;
            }
        }

        // PUT api/bookapi/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/bookapi/5
        public void Delete(int id)
        {
        }

    }
}
