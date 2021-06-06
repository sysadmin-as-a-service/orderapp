using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Configuration;
using Microsoft.Data.SqlClient;
using Dapper;
using orderapp.Models;

namespace orderapp.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class OrdersController : ControllerBase
    {
        private readonly string _connectionString;
        public OrdersController(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Default");
        }

        // get api/Orders
        [HttpGet]
        public async Task<IActionResult> OnGetAsync(int customerId)
        {
            
            Console.WriteLine("Getting Orders");

            using (IDbConnection db = new SqlConnection(_connectionString))
            {
                string sql = @"
                    SELECT *
                    FROM orders
                    LEFT JOIN orderitems ON orders.id=orderitems.orderid
                    LEFT JOIN customers ON orders.customerId=customers.id
                    WHERE orders.customerId = @CustomerId
                    ";

                var parameters = new { CustomerId = customerId };

                // need to create this outside the lambda
                var orderDictionary = new Dictionary<int, Order>();

                var data = (await db.QueryAsync<Order, OrderItem, Customer, Order>(
                    sql,
                    (order, orderItem, customer) => 
                    { 
                        // create a new dummy obj
                        Order orderEntry;

                        // check if we've already added this order ID to our orderDictionary
                        // if we haven't, add it and make orderItems a new empty list
                        // then make orderEntry the matching order from our dictionary
                        if(!orderDictionary.TryGetValue(order.Id, out orderEntry))
                        {
                            orderEntry = order;
                            orderEntry.OrderItems = new List<OrderItem>();
                            orderEntry.Customer = customer;
                            orderDictionary.Add(orderEntry.Id, orderEntry);
                        }

                        // add orderItem to the list of orderItems for 
                        orderEntry.OrderItems.Add(orderItem);
                        orderEntry.Customer = customer;
                        return orderEntry;
                    },
                    parameters
                ))
                .Distinct()
                .ToList();


                return Ok(data);
            }

            // using (IDbConnection db = new SqlConnection(_connectionString))
            // {
            //     List<Order> Orders = (await db.QueryAsync<Order>("sp_GetOrdersByCustomerId" , param: new {customerId}, commandType: CommandType.StoredProcedure)).ToList();
            //     return Ok(Orders);
            // }
            
        }


    }
}
