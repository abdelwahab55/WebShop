using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebShop.Models;

namespace WebShop.Controllers
{
    public class PaginationController : ApiController
    {
        // GET api/pagination
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/pagination/5
        public IEnumerable<Books> Get(int id)
        {
            return Utilities.ReadBooksListFromXML(id);
        }

        // POST api/pagination
        public void Post([FromBody]string value)
        {
        }

        // PUT api/pagination/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/pagination/5
        public void Delete(int id)
        {
        }
    }
}
