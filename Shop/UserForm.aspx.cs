using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
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

        public static List<Product> allProducts = new List<Product>();
        public static Product selectedProduct = null;
        public static Cart cart = new Cart();

        protected void Page_Load(object sender, EventArgs e)
        {
            refreshItems();
            lbLogin.Text = "Witaj " + Session["Login"];
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();
                MySqlCommand command = sqlCon.CreateCommand();
                command.CommandText = "SELECT * FROM product";
                MySqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int product_id = reader.GetInt16("productid");
                    string name = reader.GetString("product");
                    double price = reader.GetDouble("price");
                    string imageUrl = reader.GetString("image");
                    allProducts.Add(new Product(product_id, name, price, imageUrl));
                }

                reader.Close();
            }
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void refreshItems()
        {
            foreach (Product product in cart.products)
            {
                Debug.WriteLine(product.name);
                TableRow rw = new TableRow();
                TableCell name = new TableCell();
                name.Text = product.name;
                rw.Cells.Add(name);

                TableCell price = new TableCell();
                price.Text = product.price.ToString() + " zł";
                rw.Cells.Add(price);

                TableCell remove = new TableCell();
                Button rmvButton = new Button();
                rmvButton.Text = "Usuń z koszyka";
                rmvButton.CommandArgument = product.id.ToString();
                rmvButton.Click += new EventHandler(removeFromCart);
                remove.Controls.Add(rmvButton);
                rw.Cells.Add(remove);

                cardProducts.Rows.Add(rw);
            }
        }

        protected void addToCart(object sender, EventArgs e)
        {
            cart.addToCart(selectedProduct);
            refreshItems();
        }

        protected void removeFromCart(object sender, EventArgs e)
        {
            int productID = Convert.ToInt32((sender as Button).CommandArgument);
            cart.removeFromCart(productID);
            refreshItems();
        }

        protected void openCart(object sender, EventArgs e)
        {
            int productID = Convert.ToInt32((sender as Button).CommandArgument);

            foreach (Product product in allProducts)
            {
                if (product.id == productID)
                {
                    selectedProduct = product;
                    break;
                }
            }

            string name = selectedProduct.name;
            string price = selectedProduct.price + " zł";
            string imageUrl = selectedProduct.imageUrl;

            //Debug.WriteLine("Produkt:" + name);

            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + name + "', '" + price + "', '" + imageUrl + "');", true);
        }
    }
}