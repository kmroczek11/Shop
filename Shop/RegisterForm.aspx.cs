using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
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
            if (tbPassword.Text == tbConfirm.Text)
            {
                if (Page.IsValid == true)
                {
                    try
                    {
                        using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
                        {
                            sqlCon.Open();

                            MySqlCommand find = new MySqlCommand("UserExists", sqlCon);
                            find.CommandType = CommandType.StoredProcedure;
                            find.Parameters.AddWithValue("_login", tbLogin.Text.Trim());
                            var noRows = (long)find.ExecuteScalar();
                            if (noRows > 0)
                            {
                                lblErrorMessage.Text = "Podany login jest już zajęty";
                            }
                            else
                            {
                                MySqlCommand sqlCmd = new MySqlCommand("UserAddOrEdit", sqlCon);
                                sqlCmd.CommandType = CommandType.StoredProcedure;
                                sqlCmd.Parameters.AddWithValue("_userid", Convert.ToInt32(hfUserID.Value == "" ? "0" : hfUserID.Value));
                                sqlCmd.Parameters.AddWithValue("_login", tbLogin.Text.Trim());
                                sqlCmd.Parameters.AddWithValue("_password", hashPassword(tbPassword.Text.Trim()));
                                sqlCmd.Parameters.AddWithValue("_city", ddlCities.SelectedValue.Trim());
                                sqlCmd.Parameters.AddWithValue("_gender", rblGender.SelectedValue.Trim());
                                sqlCmd.Parameters.AddWithValue("_email", tbEmail.Text.Trim());
                                sqlCmd.ExecuteNonQuery();
                                lblSuccessMessage.Text = "Zarejestrowano pomyślnie. Na maila wysłaliśmy potwierdzenie rejestracji.";
                                sendConfirmationEmail();
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblErrorMessage.Text = ex.Message;
                    }
                }
            }
            else
            {
                lblErrorMessage.Text = "Hasła muszą być takie same";
            }
        }

        protected void sendConfirmationEmail()
        {
            try
            {
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                MailMessage message;

                message = new MailMessage("kamil.m.mroczek@gmail.com", tbEmail.Text.Trim());
                message.Subject = "Witamy w naszym sklepie!";
                message.Body = "Witaj, " + tbLogin.Text.Trim() + "!" + Environment.NewLine +
                    "Rejestracja przebiegła pomyślnie.";

                client.UseDefaultCredentials = false;
                client.EnableSsl = true;
                client.Credentials = new System.Net.NetworkCredential("kamil.m.mroczek@gmail.com", "123Kamil!");

                client.Send(message);
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
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