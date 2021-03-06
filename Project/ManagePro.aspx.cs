﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class ManagePro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void b1_Click(object sender, EventArgs e)
        {
            string newEmail = tb1.Text;
            string EmailValue = Request.QueryString["Email"];

            if (tb1.Text != "")
            {

                if (CheckUnique(string.Format("SELECT E_Mail FROM TblClient WHERE E_Mail = '{0}'", newEmail), "Data Source=DESKTOP-TDEU838;Initial Catalog=DoctorDB;Integrated Security=True") == "Unique")
                {
                    CreateCommand(string.Format("UPDATE TblClient SET E_Mail = '{0}' WHERE E_Mail = '{1}'", newEmail, EmailValue), "Data Source=DESKTOP-TDEU838;Initial Catalog=DoctorDB;Integrated Security=True");
                    tb1.Text = "Email updated";
                    tb1.Style.Add("border", "2px solid green");
                }

                else
                {
                    tb1.Text = "This Email is in use";
                    tb1.Style.Add("border", "2px solid red");
                }
            }
            else {
                tb1.Text = "Enter a valid email";
                tb1.Style.Add("border", "2px solid red");
            }
               
        }

        private static void CreateCommand(string queryString, string connectionString)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Connection.Open();
                command.ExecuteNonQuery();
            }
        }
        //method to check if value is unique in db
        private static string CheckUnique(string queryString, string connectionString)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Connection.Open();
                object value = command.ExecuteScalar();
                if (value != null)
                {
                    return value.ToString();
                }

                else
                {
                    return "Unique";
                }
            }
        }
        // method to update password
        protected void b2_Click(object sender, EventArgs e)
        {
            string newpassword = tb2.Text;
            string EmailValue = Request.QueryString["Email"];
            if (newpassword != "")
            {
                CreateCommand(string.Format("UPDATE TblClient SET Password ='{0}' WHERE E_Mail ='{1}'", newpassword, EmailValue), "Data Source=DESKTOP-TDEU838;Initial Catalog=DoctorDB;Integrated Security=True");
                tb2.Text = "Password updated";
                tb2.Style.Add("border", "2px solid green");
            }
            else {
                tb2.Text = "enter password";
                tb2.Style.Add("border", "2px solid red");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx?Email=" + Request.QueryString["Email"]);
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageApp.aspx?Email=" + Request.QueryString["Email"]);
        }
    }
}