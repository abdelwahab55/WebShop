using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Web.Http;

namespace WebShop.Controllers
{
    public class OrderController : ApiController
    {
        public HttpResponseMessage Post([FromBody]FormDataCollection formbody)
        {
            // Process the formbody 
            var field1Values = formbody.GetValues("field1");
            var field2Values = formbody.GetValues("field2");

            return new HttpResponseMessage(HttpStatusCode.Created);
        } 
    }
}
