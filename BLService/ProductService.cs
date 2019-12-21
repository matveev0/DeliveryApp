using DbProject;
using DeliveryModels;
using System.Collections.Generic;
using System.Linq;

namespace BLService
{
    public class ProductService : IService
    {
        public void AddProduct(product curProduct)
        {
            using (var context = new DeliveryAppEntities())
            {
                context.product.Add(curProduct);
                context.SaveChanges();
            }
        }

        public bool DeleteProduct(int ID)
        {
            using (var context = new DeliveryAppEntities())
            {
                var product = (from c in context.product where c.product_id == ID select c).FirstOrDefault();
                if (product == null)
                {
                    return false;
                }
                context.product.Remove(product);
                context.SaveChanges();
                return true;
            }
        }

        public void UpdateProduct(product curProduct)
        {
            using (var context = new DeliveryAppEntities())
            {
                product productForUpdate = context.product
                  .Where(product => product.product_id == curProduct.product_id)
                  .First();
                
                productForUpdate.product_name = curProduct.product_name;
                productForUpdate.cost = curProduct.cost;
                productForUpdate.description = curProduct.description;

                context.SaveChanges();
            }

        }

        public ItemModel GetProduct(int ID)
        {
            using (var context = new DeliveryAppEntities())
            {
                var data = (from c in context.product
                            where c.product_id == ID
                            select new ItemModel()
                            {
                                ID = c.product_id,
                                ProductName = c.product_name,
                                Cost = c.cost,
                                Description = c.description
                            }
                                            ).FirstOrDefault();

                return data;
            }
        }

        public List<ItemModel> getProductsByProductType(int typeID)
        {
            using (var context = new DeliveryAppEntities())
            {
                var data = (from c in context.product
                            where c.product_type_id == typeID
                            select new ItemModel()
                            {
                                ID = c.product_id,
                                ProductName = c.product_name,
                                Cost = c.cost,
                                Description = c.description
                            }
                                            ).ToList();
                return data;
            }
        }

        public List<ItemModel> GetAllProducts()
        {
            using (var context = new DeliveryAppEntities())
            {
                var data = (from c in context.product
                            select new ItemModel()
                            {
                                ID = c.product_id,
                                ProductName = c.product_name,
                                Cost = c.cost,
                                Description = c.description
                            }
                                           ).ToList();
                return data;
            }
        }
    }
}
