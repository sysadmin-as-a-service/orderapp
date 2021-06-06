using System;
using orderapp.Models;

namespace orderapp.Models
{
    public class OrderItem
    {
        public int Id {get; set; }
        public Product Product {get; set;}
        public int Quantity {get; set;}

    }
}