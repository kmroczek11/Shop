using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shop
{
    public partial class RegisterForm : System.Web.UI.Page
    {
        string connectionString = "Server=localhost;" +
                //"Port=8080;" + 
                "Database=shop;" +
                "User=root;" +
                "Password=;";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                try
                {
                    using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        MySqlCommand sqlCmd = new MySqlCommand("UserAddOrEdit", sqlCon);
                        sqlCmd.CommandType = CommandType.StoredProcedure;
                        sqlCmd.Parameters.AddWithValue("_userid", Convert.ToInt32(hfUserID.Value == "" ? "0" : hfUserID.Value));
                        sqlCmd.Parameters.AddWithValue("_login", tbLogin.Text.Trim());
                        sqlCmd.Parameters.AddWithValue("_password", tbPassword.Text.Trim());
                        sqlCmd.Parameters.AddWithValue("_city", ddlCities.SelectedValue.Trim());
                        sqlCmd.Parameters.AddWithValue("_gender", rblGender.SelectedValue.Trim());
                        sqlCmd.Parameters.AddWithValue("_email", tbEmail.Text.Trim());
                        sqlCmd.ExecuteNonQuery();
                        lblSuccessMessage.Text = "Zarejestrowano pomyślnie";
                    }
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = ex.Message;
                }
            }
        }
    }
}