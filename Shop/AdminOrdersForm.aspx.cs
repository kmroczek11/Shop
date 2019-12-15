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
    public partial class AdminOrdersForm : System.Web.UI.Page
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
            hfOrderID.Value = "";
            txtID.Text = txtStatus.Text = "";
            btnSave.Text = "Zapisz";
            btnDelete.Enabled = false;
            lblErrorMessage.Text = lblSuccessMessage.Text = "";
        }

        void GridFill()
        {
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();
                MySqlDataAdapter sqlData = new MySqlDataAdapter("OrdersViewAll", sqlCon);
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
                    MySqlCommand sqlCmd = new MySqlCommand("OrderAddOrEdit", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("_orderid", Convert.ToInt32(hfOrderID.Value == "" ? "0" : hfOrderID.Value));
                    sqlCmd.Parameters.AddWithValue("_status", txtStatus.Text.Trim());
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
            int orderID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("OrderViewByID", sqlCon);
                sqlDa.SelectCommand.Parameters.AddWithValue("_orderid", orderID);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);

                txtID.Text = dtbl.Rows[0][0].ToString();
                txtStatus.Text = dtbl.Rows[0][1].ToString();

                hfOrderID.Value = dtbl.Rows[0][0].ToString();

                btnSave.Text = "Aktualizuj";
                btnDelete.Enabled = true;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();
                MySqlCommand sqlCmd = new MySqlCommand("OrderDeleteByID", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("_orderid", Convert.ToInt32(hfOrderID.Value == "" ? "0" : hfOrderID.Value));
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

        protected void logout(object sender, EventArgs e)
        {
            Response.Cookies.Clear();
            Response.Redirect("UserForm.aspx");
        }
    }
}