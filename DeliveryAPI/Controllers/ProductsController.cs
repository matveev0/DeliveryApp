using DbProject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace DeliveryAPI.Controllers
{
    [EnableCors(origins: "http://localhost:52384", headers: "*", methods: "*")]
    //[EnableCors(origins: "http://myclient.azurewebsites.net", headers: "*", methods: "*")]
    public class ProductsController : ApiController
    {
        product[] products = new product[]
         {
            new product { product_id = 1, product_name = "Tomato Soup", cost = 1 },
            new product { product_id = 2, product_name = "Yo-yo", cost = 4 },
            new product { product_id = 3, product_name = "Hammer", cost = 3 }
         };

        public IEnumerable<product> GetAllProducts()
        {
            return products;
        }

        public IHttpActionResult GetProduct(int id)
        {
            var product = products.FirstOrDefault((p) => p.product_id == id);
            if (product == null)
            {
                return NotFound();
            }
            return Ok(product);
        }
    }
}
