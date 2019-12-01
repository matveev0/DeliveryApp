using DbProject;
using DeliveryModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            fill();
        }

        private void fill()
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
                dbProducts.DataSource = data;
                dbProducts.DataBind();

                rpt.DataSource = data;
                rpt.DataBind();
            }
        }
    }
}