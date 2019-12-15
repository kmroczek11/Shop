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
    public partial class AdminUsersForm : System.Web.UI.Page
    {
        string connectionString = "Server=localhost;" +
                //"Port=8080;" + 
                "Database=shop;" +
                "User=root;" +
                "Password=;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Clear();
                GridFill();
            }
        }

        void Clear()
        {
            hfUserID.Value = "";
            txtLogin.Text = txtPassword.Text = txtCity.Text = txtGender.Text = txtEmail.Text = txtAdmin.Text = "";
            btnSave.Text = "Zapisz";
            btnDelete.Enabled = false;
            lblErrorMessage.Text = lblSuccessMessage.Text = "";
        }

        void GridFill()
        {
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();
                MySqlDataAdapter sqlData = new MySqlDataAdapter("UserViewAll", sqlCon);
                sqlData.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
                DataTable dtbl = new DataTable();
                sqlData.Fill(dtbl);
                gvUsers.DataSource = dtbl;
                gvUsers.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
                {
                    sqlCon.Open();
                    MySqlCommand sqlCmd = new MySqlCommand("UserAddOrEdit", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("_userid", Convert.ToInt32(hfUserID.Value == "" ? "0" : hfUserID.Value));
                    sqlCmd.Parameters.AddWithValue("_login", txtLogin.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_password", hashPassword(txtPassword.Text.Trim()));
                    sqlCmd.Parameters.AddWithValue("_city", txtCity.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_gender", txtGender.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_email", txtEmail.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_isAdmin", txtAdmin.Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    GridFill();
                    Clear();
                    lblSuccessMessage.Text = "Operacja powiodła się";
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void lnkSelect_OnClick(object sender, EventArgs e)
        {
            int productID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("UserViewByID", sqlCon);
                sqlDa.SelectCommand.Parameters.AddWithValue("_userid", productID);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);

                txtLogin.Text = dtbl.Rows[0][1].ToString();
                txtPassword.Text = dtbl.Rows[0][2].ToString();
                txtCity.Text = dtbl.Rows[0][3].ToString();
                txtGender.Text = dtbl.Rows[0][4].ToString();
                txtEmail.Text = dtbl.Rows[0][5].ToString();
                txtAdmin.Text = dtbl.Rows[0][6].ToString();

                hfUserID.Value = dtbl.Rows[0][0].ToString();

                btnSave.Text = "Aktualizuj";
                btnDelete.Enabled = true;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();
                MySqlCommand sqlCmd = new MySqlCommand("UserDeleteByID", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("_userid", Convert.ToInt32(hfUserID.Value == "" ? "0" : hfUserID.Value));
                sqlCmd.ExecuteNonQuery();
                GridFill();
                Clear();
                lblSuccessMessage.Text = "Usunięto pomyślnie";
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        protected string hashPassword(string password)
        {
            byte[] data = System.Text.Encoding.ASCII.GetBytes(password);
            data = new System.Security.Cryptography.SHA256Managed().ComputeHash(data);
            String hash = System.Text.Encoding.ASCII.GetString(data);
            return hash;
        }

        protected void logout(object sender, EventArgs e)
        {
            Response.Cookies.Clear();
            Response.Redirect("UserForm.aspx");
        }
    }
}