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
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    MySqlCommand command = conn.CreateCommand();
                    command.CommandText = "SELECT * FROM users";
                    MySqlDataReader reader = command.ExecuteReader();
                    bool userExists = false;
                    while (reader.Read())
                    {
                        string login = reader.GetString("login");
                        string password = reader.GetString("password");

                        if (login == tbLogin.Text.Trim() && password == hashPassword(tbPassword.Text.Trim()))
                        {
                            Session["Login"] = login;
                            string isAdmin = reader.GetString("isAdmin");
                            userExists = true;

                            if (isAdmin == "True")
                            {
                                Response.Redirect("AdminUsersForm.aspx");
                            }
                            else
                            {
                                Response.Redirect("UserForm.aspx");
                            }
                        }
                    }
                    reader.Close();
                    if (!userExists) lblErrorMessage.Text = "Błędny login lub hasło";

                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = ex.Message;
                }
            }
        }

        protected string hashPassword(string password)
        {
            byte[] data = System.Text.Encoding.ASCII.GetBytes(password);
            data = new System.Security.Cryptography.SHA256Managed().ComputeHash(data);
            String hash = System.Text.Encoding.ASCII.GetString(data);
            return hash;
        }
    }
}