using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Globalization;
using System.Data.SqlTypes;
using WebShop.Models;
namespace WebShop
{
    public static class DataAccess
    {
        public static int AddCustomer(Customer Customer)
        {
            string Query =
                    @"insert into Customers (FirstName,LastName,Address,HouseNumber,ZipCode,City,Email)
                    values (@FirstName,@LastName,@Address,@HouseNumber,@ZipCode,@City,@Email)
                    
                    SELECT SCOPE_IDENTITY() As ID"; 
            SqlParameter[] sqlParameters = new SqlParameter[7];
            sqlParameters[0] = new SqlParameter("@FirstName", Customer.FirstName);
            sqlParameters[1] = new SqlParameter("@LastName", Customer.LastName);
            sqlParameters[2] = new SqlParameter("@Address", Customer.Address);
            sqlParameters[3] = new SqlParameter("@HouseNumber", Customer.HouseNumber);
            sqlParameters[4] = new SqlParameter("@ZipCode", Customer.ZipCode);
            sqlParameters[5] = new SqlParameter("@City", Customer.City);
            sqlParameters[6] = new SqlParameter("@Email", Customer.Email);
            return int.Parse(DBconnection.executeSelectQuery(Query, sqlParameters, false).Rows[0][0].ToString());
        }

        public static int AddOrder(Order Order)
        {
            string Query =
                    @"insert into Orders (CustomerID,OrderFinalTotalPrice,OrderTotalPrice,OrderTotalVat,OrderDate)
                    values (@CustomerID,@OrderFinalTotalPrice,@OrderTotalPrice,@OrderTotalVat,@OrderDate)
                    
                    SELECT SCOPE_IDENTITY() As ID";
            SqlParameter[] sqlParameters = new SqlParameter[5];
            sqlParameters[0] = new SqlParameter("@CustomerID", Order.Customer.CustomerID);
            sqlParameters[1] = new SqlParameter("@OrderFinalTotalPrice", Order.OrderFinalTotalPrice);
            sqlParameters[2] = new SqlParameter("@OrderTotalPrice", Order.OrderTotalPrice);
            sqlParameters[3] = new SqlParameter("@OrderTotalVat", Order.OrderTotalVat);
            sqlParameters[4] = new SqlParameter("@OrderDate", Order.OrderDate);
            return int.Parse(DBconnection.executeSelectQuery(Query, sqlParameters, false).Rows[0][0].ToString());
        }
        public static void AddOrderItem(List<OrderItem> OrderItems)
        {
            string Query = "";
            for (int i = 0; i < OrderItems.Count; i++)
            {
                Query =
                       @"insert into OrderItems (OrderID,ItemID)
                    values (@OrderID,@ItemID)";
                SqlParameter[] sqlParameters = new SqlParameter[2];
                sqlParameters[0] = new SqlParameter("@OrderID", OrderItems[i].Order.OrderID);
                sqlParameters[1] = new SqlParameter("@ItemID", OrderItems[i].Book.BookID);
                DBconnection.executeInsertQuery(Query, sqlParameters);
            }
        }
    }
}