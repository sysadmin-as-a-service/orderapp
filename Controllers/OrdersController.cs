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
                List<Order> Orders = (await db.QueryAsync<Order>("sp_GetOrdersByCustomerId" , param: new {customerId}, commandType: CommandType.StoredProcedure)).ToList();
                return Ok(Orders);
            }
            
        }


    }
}
