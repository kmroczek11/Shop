using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Shop
{
    public class Product
    {
        public Product(int id, string name, double price, string imageUrl, int quantity)
        {
            this.id = id;
            this.name = name;
            this.price = price;
            this.imageUrl = imageUrl;
            this.quantity = quantity;
        }

        public Product(int id, string name, double price, string imageUrl, int quantity, int selectedQuantity)
        {
            this.id = id;
            this.name = name;
            this.price = price;
            this.imageUrl = imageUrl;
            this.quantity = quantity;
            this.selectedQuantity = selectedQuantity;
        }

        public int id { get; set; }
        public string name { get; set; }
        public double price { get; set; }
        public string imageUrl { get; set; }
        public int quantity { get; set; }
        public int selectedQuantity { get; set; }
    }
}