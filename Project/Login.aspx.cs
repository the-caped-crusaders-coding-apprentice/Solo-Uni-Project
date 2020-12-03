using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string ConnectionString = "Data Source=DESKTOP-TDEU838;Initial Catalog=DoctorDB;Integrated Security=True";
            string Email, PasswordValue;

            if (CheckNotEmpty())
            {
                Email = Username.Text;
                PasswordValue = Password.Text;

                if (CreateSqlCommand(string.Format("SELECT E_Mail FROM TblCLient WHERE E_Mail = '{0}'", Email), ConnectionString) == Email)
                {

                    if (PasswordValue == CreateSqlCommand(string.Format("SELECT Password FROM TblCLient WHERE E_Mail = '{0}'", Email), ConnectionString))
                    {
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        Password.Text = "incorrect password";
                    }

                }

                else
                {
                    Username.Text = "Enter valid email";
                }
            
            }


        }

        //a method for validation to check if input boxes are empty
        private bool CheckNotEmpty()
        {
            if (Username.Text == "")
            {
                Username.Text = "Please enter an Email address";
            }
            if (Password.Text == "")
            {
                Password.Text = "Please enter your password";
            }
            else
            {
                return true;
            }
            return false;
        }

        //function to create SQL Commands 
        private static string CreateSqlCommand(string queryString, string connectionString)
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
                    return "";
                }

            }
        }

    }




}