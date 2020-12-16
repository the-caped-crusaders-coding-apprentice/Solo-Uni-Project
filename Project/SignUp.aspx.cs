using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void ButtonSignUp_Click(object sender, EventArgs e)
        {
            string ConnectionString = "Data Source=DESKTOP-TDEU838;Initial Catalog=DoctorDB;Integrated Security=True";

            if (CheckNotEmpty())
            {
                string EmailValue = Username.Text;
                string NameValue =  Name.Text;
                string PasswordValue = Password.Text;
                string SurnameValue = Surname.Text;
                string IdValue = IdNumber.Text;

                if (CheckUnique(string.Format("SELECT E_Mail FROM TblClient WHERE E_Mail = '{0}'", EmailValue), ConnectionString) == "Unique")
                {
                    int ConvertIdNumber = int.Parse(IdValue);

                    CreateCommand("INSERT INTO TblClient (E_Mail, SA_ID, Name, Surname, Password) VALUES (@email, @id, @name, @surname, @password)", ConnectionString,
                    EmailValue, ConvertIdNumber, NameValue, SurnameValue, PasswordValue);
                    Response.Redirect("Dashboard.aspx?Email="+EmailValue);
                   

                }
                else
                {
                    Username.Text = "Email already used";
                    Username.Style.Add("border", "2px solid red");
                }

               
            }
        }

        // method to validate textbox state
        public bool CheckNotEmpty()
        {
            if (Username.Text == "")
            {
                Username.Text = "Enter Email";
                Username.Style.Add("border", "2px solid red");
            }
            if (Name.Text == "")
            {
                Name.Text = "Enter Name";
                Name.Style.Add("border", "2px solid red");
            }
            if (IdNumber.Text == "")
            {
                IdNumber.Text = "Enter ID Number";
                IdNumber.Style.Add("border", "2px solid red");
            }
            if (Surname.Text == "")
            {
                Surname.Text = "Enter Surname";
                Surname.Style.Add("border", "2px solid red");
            }
            if (Password.Text == "")
            {
                Password.Text = "Enter Password";
                Password.Style.Add("border", "2px solid red");
            }
            else
            {
                return true;
            }

            return false;


        }

        // sql method for update
        private static void CreateCommand(string queryString, string connectionString, string email, int id, string name, string surname, string password)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Connection.Open();
                command.Parameters.Add("@email", System.Data.SqlDbType.VarChar);
                command.Parameters.Add("@id", System.Data.SqlDbType.Int);
                command.Parameters.Add("@name", System.Data.SqlDbType.VarChar);
                command.Parameters.Add("@surname", System.Data.SqlDbType.VarChar);
                command.Parameters.Add("@password", System.Data.SqlDbType.VarChar);
                command.Parameters["@email"].Value = email;
                command.Parameters["@id"].Value = id;
                command.Parameters["@name"].Value = name;
                command.Parameters["@surname"].Value = surname;
                command.Parameters["@password"].Value = password;
                command.ExecuteNonQuery();
            }
        }


        // sql method to check unique
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



        protected void ButtonSignUp_Click1(object sender, EventArgs e)
        {

        }
    }
}