using BLService;
using DbProject;
using DeliveryModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace DeliveryAPI.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ProductsController : ApiController
    {
        ProductService productService;

        public ProductsController()
        {
            productService = DataFactory.GetProductService();
        }

        public HttpResponseMessage GetAllProducts()
        {
            using (var context = new DeliveryAppEntities())
            {
                var data = productService.GetAllProducts();
                return Request.CreateResponse(HttpStatusCode.OK, data, Configuration.Formatters.JsonFormatter);
            }
        }

        public HttpResponseMessage GetProduct(int id)
        {
            var data = productService.GetProduct(id);
            if (data == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }
            return Request.CreateResponse(HttpStatusCode.OK, data, Configuration.Formatters.JsonFormatter);
        }
   
        public HttpResponseMessage DeleteProduct(int id)
        {
            try
            {
                bool ok = productService.DeleteProduct(id);
                if (ok == false)
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound);
                }
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError,
#if DEBUG
                    ex.ToString()
#else
                    "Server error occured"
#endif
                    );
            }
        }

        public HttpResponseMessage PostUpdateProduct([FromBody]product curProduct)
        {
            productService.UpdateProduct(curProduct);
            return Request.CreateResponse(HttpStatusCode.OK);

        }

        public HttpResponseMessage PutAddProduct([FromBody]product curProduct)
        {
            productService.AddProduct(curProduct);
            return Request.CreateResponse(HttpStatusCode.OK);
        }
    }
}
