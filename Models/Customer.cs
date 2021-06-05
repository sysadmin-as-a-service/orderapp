using System;
using System.Collections.Generic;
using orderapp.Models;


namespace orderapp.Models
{
    public class Customer
    {
        public int Id {get; set; }
        public string Name {get; set;}
        public string Address { get; set; }
        // public List<Order> Orders { get; set; }

    }
}