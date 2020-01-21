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
        IService productService;

        public ProductsController(IService service)
        {
            productService = service;
        }

        public HttpResponseMessage GetProducts(int page = 1, int pageLen = 3)
        {
            using (var context = new DeliveryAppEntities())
            {
                var data = productService.GetMany(page, pageLen);
                return Request.CreateResponse(HttpStatusCode.OK, data, Configuration.Formatters.JsonFormatter);
            }
        }

        public HttpResponseMessage GetProduct(int id)
        {
            var data = productService.Get(id);
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
                bool ok = productService.Delete(id);
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
            productService.Update(curProduct);
            return Request.CreateResponse(HttpStatusCode.OK);

        }

        public HttpResponseMessage PutAddProduct([FromBody]product curProduct)
        {
            productService.Add(curProduct);
            return Request.CreateResponse(HttpStatusCode.OK);
        }
    }
}
