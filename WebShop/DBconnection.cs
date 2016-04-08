using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
namespace WebShop
{
    public static class DBconnection
    {
        public static SqlDataAdapter myAdapter;
        public static SqlConnection conn;
        static DBconnection()
        {
            myAdapter = new SqlDataAdapter();
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebShopDB"].ConnectionString.
                Replace("{%FileName%}",AppDomain.CurrentDomain.BaseDirectory));
        }

        /// <method>
        /// Open Database Connection if Closed or Broken
        /// </method>
        private static SqlConnection openConnection()
        {
            if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken || conn.State == ConnectionState.Connecting)
            {
                conn.Open();
            }
            return conn;
        }

        public static DataTable ExecuteBooleanScalar(string _query, SqlParameter[] sqlParameter, Boolean SP)
        {
            SqlCommand myCommand = new SqlCommand();
            DataTable dataTable = new DataTable();
            dataTable = null;
            DataSet ds = new DataSet();
            try
            {
                myCommand.Connection = openConnection();
                myCommand.CommandText = _query;
                if (SP == true)
                {
                    myCommand.CommandType = CommandType.StoredProcedure;
                }

                myCommand.Parameters.Clear();
                foreach (SqlParameter parameter in sqlParameter)
                {
                    myCommand.Parameters.Add(parameter);
                }
                myAdapter.SelectCommand = myCommand;
                myAdapter.Fill(ds);
                //myCommand.ExecuteNonQuery();
                dataTable = ds.Tables[0];
                return dataTable;
            }
            catch (SqlException e)
            {
                dataTable = new DataTable();
                dataTable.Columns.Add();
                dataTable.Columns.Add();
                dataTable.Columns.Add();
                DataRow DR = dataTable.NewRow();
                ///
                DR[0] = -5;
                DR[1] = e.Message;
                DR[2] = e.Number;
                ////
                dataTable.Rows.Add(DR);
                return dataTable;
            }
            finally
            {
                conn.Close();
            }
        }

        /// <method>
        /// Select Query
        /// </method>
        public static DataTable executeSelectQuery(String _query, SqlParameter[] sqlParameter, Boolean SP)
        {
            SqlCommand myCommand = new SqlCommand();
            DataTable dataTable = new DataTable();
            dataTable = null;
            DataSet ds = new DataSet();
            try
            {
                myCommand.Connection = openConnection();
                myCommand.CommandText = _query;
                if (SP == true)
                {
                    myCommand.CommandType = CommandType.StoredProcedure;
                }
                foreach (SqlParameter parameter in sqlParameter)
                {
                    myCommand.Parameters.Add(parameter);
                }
                myAdapter.SelectCommand = myCommand;
                myAdapter.Fill(ds);
                //myCommand.ExecuteNonQuery();
                dataTable = ds.Tables[0];
            }
            catch (SqlException e)
            {
                //Console.Write("Error - Connection.executeSelectQuery - Query: " + _query + " \nException: " + e.StackTrace.ToString());
                dataTable = new DataTable();
                dataTable.Columns.Add();
                DataRow DR = dataTable.NewRow();
                DR[0] = e.ToString();
                dataTable.Rows.Add(DR);
                return dataTable;
            }
            finally
            {
                conn.Close();

            }
            return dataTable;
        }

        /// <method>
        /// Insert Query
        /// </method>
        public static bool executeInsertQuery(String _query, SqlParameter[] sqlParameter)
        {
            SqlCommand myCommand = new SqlCommand();
            try
            {
                myCommand.Connection = openConnection();
                myCommand.CommandText = _query;
                myCommand.Parameters.AddRange(sqlParameter);
                myAdapter.InsertCommand = myCommand;
                myCommand.ExecuteNonQuery();
            }
            catch (SqlException e)
            {
                Console.Write("Error - Connection.executeInsertQuery - Query: " + _query + " \nException: \n" + e.StackTrace.ToString());
                return false;
            }
            finally
            {
                conn.Close();
            }
            return true;
        }

        /// <method>
        /// Update Query
        /// </method>
        public static bool executeUpdateQuery(String _query, SqlParameter[] sqlParameter)
        {
            SqlCommand myCommand = new SqlCommand();
            try
            {
                myCommand.Connection = openConnection();
                myCommand.CommandText = _query;
                myCommand.Parameters.AddRange(sqlParameter);
                myAdapter.UpdateCommand = myCommand;
                myCommand.ExecuteNonQuery();
            }
            catch (SqlException e)
            {
                Console.Write("Error - Connection.executeUpdateQuery - Query: " + _query + " \nException: " + e.StackTrace.ToString());
                return false;
            }
            finally
            {
                conn.Close();
            }
            return true;
        }

        internal static System.Collections.Generic.List<string> SelectQuerytolist(string query, SqlParameter[] sqlParameters, string colname, bool SP)
        {
            try
            {
                List<string> list = new List<string>();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = openConnection();
                    cmd.CommandText = query;
                    if (SP == true)
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                    }
                    foreach (SqlParameter parameter in sqlParameters)
                    {
                        cmd.Parameters.Add(parameter);
                    }

                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            list.Add(sdr[colname].ToString());
                        }
                    }
                    conn.Close();
                    return list;
                }
            }
            catch (SqlException ex)
            {
                List<string> list = new List<string>();
                list.Add("Error No:" + ex.Number + " " + ex.Message);
                return list;
            }
        }

        public static bool executeDeleteQuery(String _query, SqlParameter[] sqlParameter)
        {
            SqlCommand myCommand = new SqlCommand();
            try
            {
                myCommand.Connection = openConnection();
                myCommand.CommandText = _query;
                myCommand.Parameters.AddRange(sqlParameter);
                myAdapter.DeleteCommand = myCommand;
                myCommand.ExecuteNonQuery();
            }
            catch (SqlException e)
            {
                Console.Write("Error - Connection.executeUpdateQuery - Query: " + _query + " \nException: " + e.StackTrace.ToString());
                return false;
            }
            finally
            {
                conn.Close();
            }
            return true;
        }
    }
}