using DbProject;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application
{
    public partial class TestAPI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillProductTypes();
            }
            addButton.Click += AddButton_Click;
        }

      

        private void fillProductTypes()
        {
            using (var context = new DeliveryAppEntities())
            {


                productTypes.DataSource = context.product_types.ToList();
                productTypes.DataBind();
            }
        }


        private void AddButton_Click(object sender, EventArgs e)
        {
            var product = new product
            {
                product_name = txtName.Text,
                cost = int.Parse(txtCost.Text),
                product_type_id = int.Parse(productTypes.SelectedItem.Value),
                description = txtDescription.Text
            };

            addProduct(product);

        }

        protected string APIServerURL
        {
            get
            {
                return ConfigurationManager.AppSettings["APIServerURL"];
            }
        }

        private void addProduct(product data)
        {

            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(APIServerURL);
                var response = client.PutAsJsonAsync("/api/Products", data).Result;
                if (response.IsSuccessStatusCode)
                {
                    Console.Write("Success");
                }
                else
                    Console.Write("Error");
            }
        }
        protected string PageLen
        {
            get
            {
                return "6";
            }
        }
    }
}