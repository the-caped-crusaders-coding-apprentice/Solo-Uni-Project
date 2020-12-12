using System;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            name.InnerText = Request.QueryString["Email"];
            string ConnectionString = "Data Source=DESKTOP-TDEU838;Initial Catalog=DoctorDB;Integrated Security=True";
            //Response.Write ( CreateCommandSelect("SELECT * FROM TblDates", ConnectionString));
            string text = CreateCommandSelect("SELECT * FROM TblDates", ConnectionString);
            System.IO.File.WriteAllText(@"C:\Users\User-pc\source\repos\Project\Project\test.json", text);

        }

        protected void LinkButton_Click(object sender, EventArgs e)
        {
        }

        [System.Web.Services.WebMethod]
        public static string TestMethod(string id)
        {
            CreateCommand("DELETE FROM TblDates WHERE ID = "+id+" ","Data Source=DESKTOP-TDEU838;Initial Catalog=DoctorDB;Integrated Security=True");
            return id.ToString();
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

    }
}