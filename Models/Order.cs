using System;
using System.Collections.Generic;
using orderapp.Models;

namespace orderapp.Models
{
    public class Order
    {
        public int Id {get; set; }
        public string Reference {get; set;}
        public DateTime Date { get; set; }
        public Customer Customer { get; set; }
        public List<OrderItem> OrderItems {get; set;}

    }
}