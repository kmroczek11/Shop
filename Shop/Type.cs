using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Shop
{
    public class Type
    {
        public Type(string name)
        {
            this.name = name;
            this.count = 1;
        }

        public string name { get; set; }
        public int count { get; set; }
    }
}