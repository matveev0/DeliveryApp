using DbProject;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application
{
    public partial class EditPage : System.Web.UI.Page
    {
        protected string APIServerURL
        {
            get
            {
                return ConfigurationManager.AppSettings["APIServerURL"];
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
          
            btnSave.Click += BtnSave_ClickAsync;
            btnCancel.Click += BtnCancel_Click;
            itemEditor.ProductID = ID;
        }

        private void BtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }

        public int ID
        {
            get
            {
                return int.Parse(Request.Params["ID"]);
            }
        }

        private async void BtnSave_ClickAsync(object sender, EventArgs e)
        {
            await saveProd();

            //using (var context = new DeliveryAppEntities())
            //{
            //    var product = (from c in context.product where c.product_id == ID select c).First();
            //    product.product_name = itemEditor.Name;
            //    product.description = itemEditor.Description;
            //    product.cost = itemEditor.Cost;
            //    context.SaveChanges();
            //    Response.Redirect("MainPage.aspx");
            //}
        }


        private async System.Threading.Tasks.Task saveProd() {
            var product = new product
            {
                product_id = ID,
                product_name = itemEditor.Name,
                cost = itemEditor.Cost,
                description = itemEditor.Description
            };

            HttpClient client = new HttpClient();
            var response = await client.PostAsJsonAsync(APIServerURL + "/api/Products", product);
            if (response.IsSuccessStatusCode)
            {
                Console.Write("Success");
                Response.Redirect("MainPage.aspx");
            }
            else
                Console.Write("Error");
        }
    }
}