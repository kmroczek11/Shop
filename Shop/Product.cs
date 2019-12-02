using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Shop
{
    public class Product
    {
        public Product(string name, double price, string imageUrl, int quantity)
        {
            this.name = name;
            this.price = price;
            this.imageUrl = imageUrl;
            this.quantity = quantity;
        }

        public string name { get; set; }
        public double price { get; set; }
        public string imageUrl { get; set; }
        public int quantity { get; set; }
    }
}