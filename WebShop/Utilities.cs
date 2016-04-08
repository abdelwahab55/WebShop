using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using WebShop.Models;

namespace WebShop
{
    static public class Utilities
    {
        public static int PagesNumberOfRecords = 5;
        static public List<Books> ReadBooksListFromXML()
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

        static public List<Books> ReadBooksListFromXML(int PageIndex)
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
            if (((PageIndex - 1) * PagesNumberOfRecords) + PagesNumberOfRecords <= BooksList.Count)
            {
                BooksList = BooksList.GetRange((PageIndex - 1) * PagesNumberOfRecords, PagesNumberOfRecords);
            }
            else
            {
                BooksList = BooksList.GetRange((PageIndex - 1) * PagesNumberOfRecords, BooksList.Count - ((PageIndex - 1) * PagesNumberOfRecords));
            }
            return BooksList;

        }

        static public List<Books> GetBooksAddedToCart(List<string> CartBookIDs)
        {
            List<Books> BooksList = new List<Books>();
            BooksList = Utilities.ReadBooksListFromXML();

            List<Books> CartBooksList = new List<Books>();
            
            for (int i = 0; i < BooksList.Count; i++)
            {
                for (int j = 0; j < CartBookIDs.Count; j++)
                {
                    if (BooksList[i].BookID.ToString() == CartBookIDs[j])
                    {
                        Books Book = new Books();
                        Book.Title = BooksList[i].Title;
                        Book.Author = BooksList[i].Author;
                        Book.Price = BooksList[i].Price;
                        Book.VatPercentage = BooksList[i].VatPercentage;
                        CartBooksList.Add(Book);
                    }
                }
            }
            return CartBooksList;
        }
    }
}