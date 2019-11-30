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
    public partial class UserForm : System.Web.UI.Page
    {
        string connectionString = "Server=localhost;" +
                //"Port=8080;" + 
                "Database=shop;" +
                "User=root;" +
                "Password=;";

        protected void Page_Load(object sender, EventArgs e)
        {
            //lbLogin.Text = Global.login;
            lbLogin.Text = "Witaj " + Session["Login"];

            
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}