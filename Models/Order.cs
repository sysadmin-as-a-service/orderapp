using System;
using System.ComponentModel.DataAnnotations;

namespace orderapp.Models
{
    public class Order
    {
        public int Id {get; set; }
        public string Reference {get; set;}
        public DateTime Date { get; set; }
        public Customer Customer { get; set; }
        public List<OrderItems> OrderItems {get; set;}

    }
}