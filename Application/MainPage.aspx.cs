using BLService;
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
        ProductService productService;

        public MainPage()
        {
            productService = DataFactory.GetProductService();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            fill();
            sushiDatagrid.EditCommand += SushiDatagrid_EditCommand;
        }

        private void fill()
        {
            fillBurgersData();
            fillSushiData();
            fillPizzaData();
        }

        private void fillBurgersData()
        {
            var data = productService.getProductsByProductType(3);
            burgerRepeater.DataSource = data;
            burgerRepeater.DataBind();
        }

        private void fillSushiData()
        {
            var data = productService.getProductsByProductType(2);
            sushiDatagrid.DataSource = data;
            sushiDatagrid.DataBind();
        }

        private void fillPizzaData()
        {
            var data = productService.getProductsByProductType(1);
            pizzaRepeater.DataSource = data;
            pizzaRepeater.DataBind();
        }

        private void SushiDatagrid_EditCommand(object source, DataGridCommandEventArgs e)
        {
            int id = 0;
            var sushi = (sushiDatagrid.DataSource as List<ItemModel>);

            if (sushi != null)
            {
                id = sushi[e.Item.ItemIndex].ID;
                Response.Redirect("EditPage.aspx?ID=" + id);
            }
        }
    }
}