using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebShop.Models
{
    [Serializable]
    public class Books
    {
        public int BookID { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string Genre { get; set; }
        public decimal Price { get; set; }
        public decimal VatPercentage { get; set; }
        public DateTime PublishDate { get; set; }
        public string Description { get; set; }
    }
}