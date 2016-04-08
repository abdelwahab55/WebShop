using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using WebShop.Models;

namespace WebShop.Controllers
{
    public class OrderAPIController : ApiController
    {
        // GET api/orderapi
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/orderapi/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/orderapi
        public bool CheckOut([FromBody] Customer Customer)
        {
            if (System.Web.HttpContext.Current.Session["Cart"] != null)
            {
                //fill customer 
                int CustomerID = DataAccess.AddCustomer(Customer);

                //fill order data
                List<Books> CartBooksList = new List<Books>();
                List<string> CartBookIDs = (List<string>)System.Web.HttpContext.Current.Session["Cart"];

                decimal TotalPrice, TotalVat, TotalFinalPrice;
                TotalPrice = TotalVat = TotalFinalPrice = 0;
                CartBooksList = Utilities.GetBooksAddedToCart(CartBookIDs);

                for (int i = 0; i < CartBooksList.Count; i++)
                {
                    TotalVat += (CartBooksList[i].VatPercentage * CartBooksList[i].Price);
                    TotalPrice += CartBooksList[i].Price;

                }
                TotalFinalPrice = TotalPrice + TotalVat;
                Order Order = new Models.Order();
                Order.Customer = new Models.Customer();
                Order.Customer.CustomerID = CustomerID;
                Order.OrderFinalTotalPrice = TotalFinalPrice;
                Order.OrderTotalPrice = TotalPrice;
                Order.OrderTotalVat = TotalVat;
                Order.OrderDate = DateTime.Now;

                int OrderID = DataAccess.AddOrder(Order);

                //fill order-items data
                List<OrderItem> OrderItems = new List<OrderItem>();
                for (int i = 0; i < CartBookIDs.Count; i++)
                {
                    OrderItem OrderItem = new Models.OrderItem();
                    OrderItem.Book = new Books();
                    OrderItem.Book.BookID = int.Parse(CartBookIDs[i]);
                    OrderItem.Order = new Models.Order();
                    OrderItem.Order.OrderID = OrderID;
                    OrderItems.Add(OrderItem);
                }
                DataAccess.AddOrderItem(OrderItems);
                System.Web.HttpContext.Current.Session["Cart"] = null;
                return true;
            }
            else
            {
                return false;
            }
        }

        // PUT api/orderapi/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/orderapi/5
        public void Delete(int id)
        {
        }
    }
}