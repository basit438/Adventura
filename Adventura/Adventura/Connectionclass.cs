using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Adventura
{
    public class Connectionclass
    {
        SqlConnection conn;
        SqlCommand cmd;
        public SqlDataReader dr;
        

        public void Create_Connection()
        {
            conn = new SqlConnection();
            conn.ConnectionString = "Data Source=.;initial Catalog = AdventureDatabase;Integrated Security=True;";

            conn.Open();
        }

        public void exe_command(string sql)
        {
            Create_Connection();
            cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = sql;
            cmd.ExecuteNonQuery();
        }
        public void datareader(string sql)
        {
            Create_Connection();
            cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = sql;

            dr = cmd.ExecuteReader();
        }
   
    }
}