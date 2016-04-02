using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using WebShop.Models;

namespace WebShop.Controllers
{
    public class BookAPIController : ApiController
    {
        // GET api/bookapi
        public IEnumerable<Books> Get()
        {
            string xmlData = HttpContext.Current.Server.MapPath("~/App_Data/Books.xml");
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
            return BooksList;
        }

        // GET api/bookapi/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/bookapi
        public void Post([FromBody]string value)
        {
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
