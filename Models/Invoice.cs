using System;
using System.ComponentModel.DataAnnotations;
using orderapp.Models;

namespace orderapp.Models
{
    public class Invoice
    {
        public int Id {get; set; }
        public Order Order {get; set;}
        public Customer Customer { get; set; }
        public int Quantity { get; set; }

    }
}