﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Adventura.AdminModule
{
    public class Getconnection
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter da;
        public DataSet ds;

        public void Create_Connection()
        {
            conn = new SqlConnection();
            conn.ConnectionString = "Data Source=.;initial Catalog = AdventureDatabase;Integrated Security=True;";
            if(conn.State == ConnectionState.Open)

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

        public void Groupdata(string sql)
        {
            Create_Connection();
            da = new SqlDataAdapter(sql,conn);
            ds = new DataSet();
            da.Fill(ds, "temptable");
        }
        

    public void groupdata(string sql)
    {
        Create_Connection();
            da = new SqlDataAdapter(sql,conn);
            ds = new DataSet();
            da.Fill(ds, "temptable");
       
    }
}
}