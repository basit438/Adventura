using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Adventura
{
    public class Additemclass
    {
        SqlConnection conn;
        SqlCommand cmd;
        
        void Create_Connection()
        {
            conn = new SqlConnection();
            conn.ConnectionString= "Data Source=.;initial Catalog = AdventureDatabase;Integrated Security=True;";
            if (conn.State == ConnectionState.Open)

                conn.Close();

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
    }
}