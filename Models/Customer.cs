using System;
using System.ComponentModel.DataAnnotations;

namespace orderapp.Models
{
    public class Customer
    {
        public int Id {get; set; }
        public string Name {get; set;}
        public string Address { get; set; }
        public List<Orders> Orders { get; set; }

    }
}