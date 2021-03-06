﻿using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace Project
{
    public partial class Dashboard : System.Web.UI.Page
    {
        // tranfer data from db to json file
        protected void Page_Load(object sender, EventArgs e)
        {
            name.InnerText = Request.QueryString["Email"];
            string ConnectionString = "Data Source=DESKTOP-TDEU838;Initial Catalog=DoctorDB;Integrated Security=True";
            string text = CreateCommandSelect("SELECT * FROM TblDates WHERE Checked = 1", ConnectionString);
            System.IO.File.WriteAllText(@"C:\Users\User-pc\source\repos\Project\Project\test.json", text);

        }

        //redirect link with post request
        protected void LinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageApp.aspx?Email=" + name.InnerText);
        }


        // web method that works with ajax post request to excute sql
        [System.Web.Services.WebMethod]
        public static string TestMethod(string id, string email)
        {
            CreateCommand("UPDATE TblDates SET Checked = 0 WHERE ID = " + id + " ", "Data Source=DESKTOP-TDEU838;Initial Catalog=DoctorDB;Integrated Security=True");
            CreateCommand("UPDATE TblClient SET TblClient.ID =" + id + "WHERE E_Mail = "+"'"+email+"'"+" ", "Data Source=DESKTOP-TDEU838;Initial Catalog=DoctorDB;Integrated Security=True");
            return id.ToString()+" "+email.ToString();
        }

        //class for date object
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


        // method that serialses object to json format
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
                    Output += JsonConvert.SerializeObject(addtoJson)+", ";
                }
                Output = Output.Remove(Output.Length-2, 2);
                Output = Output.Insert(0, "[");
                Output = Output.Insert(Output.Length, "]");
                return Output;
            }
        }


        private static void CreateCommand(string queryString,string connectionString)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Connection.Open();
                command.ExecuteNonQuery();
            }
        }

        protected void LinkButton_Click1(object sender, EventArgs e)
        {
            Response.Redirect("ManagePro.aspx?Email=" + name.InnerText);
        }
    }
}