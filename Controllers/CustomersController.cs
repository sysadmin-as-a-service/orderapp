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
    public class CustomersController : ControllerBase
    {
        private readonly string _connectionString;
        public CustomersController(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Default");
        }

        // get api/Customers
        [HttpGet]
        public async Task<IActionResult> OnGetAsync()
        {
            
            Console.WriteLine("Getting customers");

            using (IDbConnection db = new SqlConnection(_connectionString))
            {
                List<Customer> customers = (await db.QueryAsync<Customer>("sp_GetCustomers", commandType: CommandType.StoredProcedure)).ToList();
                return Ok(customers);
            }
            
        }


    }
}
