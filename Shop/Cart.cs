using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Shop
{
    public class Cart
    {
        public List<Product> products = new List<Product>();

        public void addToCart(Product product) {
            products.Add(product);
        }

        public void removeFromCart(Product product)
        {
            products.Remove(product);
        }

        public void showCart()
        {
            foreach (object product in products)
            {
                Console.WriteLine(product);
            }
        }

    }
}