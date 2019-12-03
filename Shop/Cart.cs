using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace Shop
{
    public class Cart
    {
        public List<Product> products = new List<Product>();

        public void addToCart(Product product)
        {
            products.Add(product);
            Debug.WriteLine("Dodano: " + product.name);
        }

        public void removeFromCart(int id)
        {
            for (int i = 0; i < products.Count(); i++)
            {
                if (products[i].id == id) products.Remove(products[i]);
            }
        }

        public void showCart()
        {
            foreach (Product product in products)
            {
                Debug.WriteLine(product.name);
            }
        }

    }
}