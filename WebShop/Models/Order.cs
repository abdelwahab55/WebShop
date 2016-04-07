using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebShop.Models
{
    public class Order
    {
        public int OrderID { get; set; }
        public Customer Customer { get; set; }
        public decimal OrderFinalTotalPrice { get; set; }
        public decimal OrderTotalPrice { get; set; }
        public decimal OrderTotalVat { get; set; }
        public DateTime OrderDate { get; set; }
    }
}