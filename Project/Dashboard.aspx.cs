﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace Project
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ConnectionString = "Data Source=DESKTOP-TDEU838;Initial Catalog=DoctorDB;Integrated Security=True";
            Response.Write ( CreateCommandSelect("SELECT * FROM TblDates", ConnectionString));
        }

        protected void Confirm_Click(object sender, EventArgs e)
        {

        }

        public class Values 
        {
            public string ID;
            public string Date;
            public string Time;

            public Values(string id, string date, string time)
            {
                ID = id;
                Date = date;
                Time = time;
            }

        }

        private static string CreateCommandSelect(string queryString, string connectionString)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                string Output = "";
                while (reader.Read())
                {
                    // Output += reader["ID"].ToString()+" "+ reader["Date"].ToString()+" "+reader["Time"].ToString() ;
                    Values addtoJson = new Values(reader["ID"].ToString(), reader["Date"].ToString(), reader["Time"].ToString());
                    Output += JsonConvert.SerializeObject(addtoJson);
                }
                return Output;
            }
        }
    }
}