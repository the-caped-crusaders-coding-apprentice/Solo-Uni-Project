using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class ManageApp : System.Web.UI.Page
    {
        //display active appointments using sql on page load
        protected void Page_Load(object sender, EventArgs e)
        {
            var EmailVal = Request.QueryString["Email"];
            CreateCommand("SELECT TblDates.ID, Date, Time FROM TblDates,TblClient WHERE TblDates.ID = TblClient.ID AND E_Mail =" + "'" + EmailVal + "'", "Data Source=DESKTOP-TDEU838;Initial Catalog=DoctorDB;Integrated Security=True");
            CreateCommand("update dat set dat.Checked = 1 from TblDates dat join TblClient clt on dat.ID = clt.ID where dat.Checked = 0 and clt.E_Mail =" + "'" + EmailVal + "'", "Data Source=DESKTOP-TDEU838;Initial Catalog=DoctorDB;Integrated Security=True");
        }

        protected void LinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx?Email="+ Request.QueryString["Email"]);
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManagePro.aspx?Email=" + Request.QueryString["Email"]);
        }

        public void CreateCommand(string queryString,string connectionString)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    ticketID.InnerText = "ID:  " + reader["ID"].ToString();
                    viewDate.InnerText = "Date:  " + reader["Date"].ToString();
                    viewTime.InnerText = "Time:  " + reader["Time"].ToString();
                }
            }
        }

        //sql method for remove appointment 
        protected void Delete_Click(object sender, EventArgs e)
        {
            var EmailVal = Request.QueryString["Email"];
            CreateCommandupdate("UPDATE TblClient SET TblClient.ID = NULL WHERE E_Mail=" + "'" + EmailVal + "'", "Data Source=DESKTOP-TDEU838;Initial Catalog=DoctorDB;Integrated Security=True");
            viewDate.InnerText = "";
            ticketID.InnerText = "No Appointments";
            viewTime.InnerText = "";
            ticketID.Style.Add("text-align", "center");
        }

        private static void CreateCommandupdate(string queryString,string connectionString)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Connection.Open();
                command.ExecuteNonQuery();
            }
        }



    }
}