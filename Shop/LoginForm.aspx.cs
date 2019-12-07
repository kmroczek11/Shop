using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Shop
{
    public partial class LoginForm : System.Web.UI.Page
    {
        string connectionString = "Server=localhost;" +
                //"Port=8080;" + 
                "Database=shop;" +
                "User=root;" +
                "Password=;" +
                "UseAffectedRows=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btLogin_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                try
                {
                    sqlCon.Open();
                    MySqlCommand sqlCmd = new MySqlCommand("UserFind", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("_login", tbLogin.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_password", tbPassword.Text.Trim());
                    var noRows = (long)sqlCmd.ExecuteScalar();
                    if (noRows > 0)
                    {
                        //lblSuccessMessage.Text = "Zalogowano pomyślnie";
                        //Global.login = tbLogin.Text;
                        string login = tbLogin.Text;
                        Session["Login"] = login;
                        Response.Redirect("UserForm.aspx");
                    }
                    else
                    {
                        lblErrorMessage.Text = "Błędny login lub hasło";
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