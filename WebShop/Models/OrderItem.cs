using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebShop.Models
{
    public class OrderItem
    {
        public int OrderItemID { get; set; }
        public Order Order { get; set; }
        public Books Book { get; set; }
    }
}