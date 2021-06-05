using System;
using orderapp.Models;

namespace orderapp.Models
{
    public class Product
    {
        public int Id {get; set; }
        public string Name {get; set;}
        public string ProductType { get; set; }
        public decimal SellPrice { get; set; }
        public decimal CostPrice {get; set;}

    }
}