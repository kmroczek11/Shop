using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Net.Mail;
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
        public enum MessageType { Success, Error, Info, Warning };
        public int userId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            getId();
            refreshItems();
            getProducts();
            lbLogin.Text = "Witaj " + Session["Login"];
            //lbLogin.Text = "Witaj Kamil";

            if (!IsPostBack)
            {
                loadCart();
            }
        }

        /*protected void Page_UnLoad(object sender, EventArgs e)
        {
            addOrders();
        }
        */

        protected void getProducts()
        {
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
                    int quantity = reader.GetInt16("count");
                    allProducts.Add(new Product(product_id, name, price, imageUrl, quantity));
                }

                reader.Close();
            }
        }

        protected void refreshItems()
        {
            double wholeCost = 0.0;
            foreach (Product product in cart.products)
            {
                double sum = product.price * product.selectedQuantity;
                wholeCost += sum;
                TableRow rw = new TableRow();
                TableCell name = new TableCell();
                name.Text = product.name;
                rw.Cells.Add(name);

                TableCell quantity = new TableCell();
                quantity.Text = "Ilość: " + product.selectedQuantity;
                rw.Cells.Add(quantity);

                TableCell price = new TableCell();
                price.Text = "Cena: " + product.price + " zł";
                rw.Cells.Add(price);

                TableCell sm = new TableCell();
                sm.Text = "Suma: " + sum + " zł";
                rw.Cells.Add(sm);

                TableCell remove = new TableCell();
                Button rmvButton = new Button();
                rmvButton.Text = "Usuń";
                rmvButton.CommandArgument = product.id.ToString();
                rmvButton.Click += new EventHandler(removeFromCart);
                remove.Controls.Add(rmvButton);
                rw.Cells.Add(remove);
                cardProducts.Rows.Add(rw);
            }

            TableRow sw = new TableRow();
            TableCell summary = new TableCell();
            summary.Attributes.Add("style", "font-size:20px; font-weight: bold;");
            summary.Text = "Łącznie: " + wholeCost + " zł";
            summary.ColumnSpan = 5;
            sw.Cells.Add(summary);

            cardProducts.Rows.Add(sw);
        }

        protected void addToCart(object sender, EventArgs e)
        {
            selectedProduct.selectedQuantity = Convert.ToInt16(selectQuantity.Value);
            cart.addToCart(selectedProduct);
            refreshItems();
            addOrders();//dodanie produktów do bazy przy dodawaniu do koszyka
            showMessage("Dodano do koszyka", MessageType.Success);
        }

        protected void showMessage(string Message, MessageType type)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
        }

        protected void removeFromCart(object sender, EventArgs e)
        {
            int productID = Convert.ToInt32((sender as Button).CommandArgument);
            cart.removeFromCart(productID);
            refreshItems();
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();

                //usunięcie zamówienia
                MySqlCommand removebasket = sqlCon.CreateCommand();
                removebasket.CommandText = "DELETE FROM basket WHERE customer_id='" + userId + "' AND product_id='" + productID + "'";
                removebasket.ExecuteNonQuery();
            }
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
            int quantity = selectedProduct.quantity;

            for (int i = 1; i < quantity + 1; i++)
            {
                selectQuantity.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }

            //Debug.WriteLine("Produkt:" + name);

            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + name + "', '" + price + "', '" + imageUrl + "');", true);
        }

        protected void order(object sender, EventArgs e)
        {
            if (cart.getSizeOfCart() == 0)
            {
                showMessage("Zamówienie nie może być puste!", MessageType.Warning);
            }
            else
            {
                saveOrders();
                showMessage("Złożono zamówienie", MessageType.Success);
            }
        }

        protected void getId()
        {
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();
                MySqlCommand getid = sqlCon.CreateCommand();
                getid.CommandText = "SELECT userid FROM users WHERE login='" + Session["Login"] + "';";
                //getid.CommandText = "SELECT userid FROM users WHERE login='Kamil';";

                MySqlDataReader rdid = getid.ExecuteReader();

                while (rdid.Read())
                {
                    userId = rdid.GetInt16("userid");
                }
                rdid.Close();
            }
        }

        protected void loadCart()
        {
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();
                MySqlCommand command = sqlCon.CreateCommand();
                command.CommandText = "SELECT * FROM basket INNER JOIN product ON basket.product_id = product.productid WHERE customer_id = " + userId + ";";
                MySqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int product_id = reader.GetInt16("productid");
                    string name = reader.GetString("product");
                    double price = reader.GetDouble("price");
                    string imageUrl = reader.GetString("image");
                    int quantity = reader.GetInt16("count");
                    int selectedQuantity = reader.GetInt16("quantity");
                    string status = reader.GetString("status");
                    if (status != "ordered")
                        cart.addToCart(new Product(product_id, name, price, imageUrl, quantity, selectedQuantity));
                }

                reader.Close();
            }
        }

        protected void saveOrders()
        {
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();

                for (int i = 0; i < cart.getSizeOfCart(); i++)
                {
                    MySqlCommand addbasket = sqlCon.CreateCommand();
                    DateTime theDate = DateTime.Now;
                    string date = theDate.ToString("yyyy-MM-dd H:mm:ss");
                    addbasket.CommandText = "UPDATE basket SET order_date='" + date + "',  status='ordered' WHERE customer_id='" + userId + "' AND product_id='" + cart.products[i].id + "'";
                    addbasket.ExecuteNonQuery();
                }
            }

            sendOrderEmail();

            //opróżnienie koszyka po zamówieniu
            cart.products = new List<Product>();
        }

        protected void addOrders()
        {
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();

                //usunięcie starych zamówień
                for (int i = 0; i < cart.getSizeOfCart(); i++)
                {
                    MySqlCommand removebasket = sqlCon.CreateCommand();
                    removebasket.CommandText = "DELETE FROM basket WHERE customer_id='" + userId + "' AND product_id='" + cart.products[i].id + "' AND status='unordered'";
                    removebasket.ExecuteNonQuery();
                }

                //dodawanie nowych do koszyka
                for (int j = 0; j < cart.getSizeOfCart(); j++)
                {
                    Debug.WriteLine("Rozmiar koszyka przy dodawaniu: " + cart.getSizeOfCart());
                    MySqlCommand addbasket = sqlCon.CreateCommand();
                    addbasket.CommandText = "INSERT INTO basket (customer_id, product_id, quantity, status) VALUES ('" + userId + "', '" + cart.products[j].id + "', '" + cart.products[j].selectedQuantity + "', 'unordered')";
                    addbasket.ExecuteNonQuery();
                }
            }
        }

        protected void logout(object sender, EventArgs e)
        {
            addOrders();
            cart.products = new List<Product>();
            Session.Abandon();
            Session.Clear();
            Response.Cookies.Clear();
            Response.Redirect("LoginForm.aspx");
        }

        protected void sendOrderEmail()
        {
            try
            {
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                MailMessage message;

                string email = "";
                using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
                {
                    sqlCon.Open();
                    MySqlCommand findemail = sqlCon.CreateCommand();
                    findemail.CommandText = "SELECT email FROM users WHERE login='" + Session["Login"] + "'";
                    MySqlDataReader reader = findemail.ExecuteReader();

                    while (reader.Read())
                    {
                        email = reader.GetString("email");
                    }
                    reader.Close();
                }

                Debug.WriteLine("Email: " + email);

                message = new MailMessage("kamil.m.mroczek@gmail.com", email);
                message.Subject = "Potwierdzenie zamówienia";

                double wholeCost = 0.0;
                foreach (Product product in cart.products)
                {
                    double sum = product.price * product.selectedQuantity;
                    wholeCost += sum;
                    message.Body += "Produkt: " + product.name + " Cena: " + product.price + " Ilość: " + product.selectedQuantity + " Suma: "  + sum + Environment.NewLine;
                }
                message.Body += "Łącznie: " + wholeCost;

                client.UseDefaultCredentials = false;
                client.EnableSsl = true;
                client.Credentials = new System.Net.NetworkCredential("kamil.m.mroczek@gmail.com", "123Kamil!");

                client.Send(message);
            }
            catch (Exception ex)
            {
                showMessage(ex.Message, MessageType.Warning);
            }
        }
    }
}