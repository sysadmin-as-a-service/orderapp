using System;
using System.ComponentModel.DataAnnotations;

namespace orderapp.Models
{
    public class OrderItem
    {
        public int Id {get; set; }
        public Order Order { get; set; }
        public Product Product {get; set;}
        public int Quantity {get; set;}

    }
}