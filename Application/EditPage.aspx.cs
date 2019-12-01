using DbProject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application
{
    public partial class EditPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnSave.Click += BtnSave_Click;
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

        private void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                using (var context = new DeliveryAppEntities())
                {
                    var product = (from c in context.product where c.product_id == ID select c).First();
                    product.product_name = itemEditor.Name;
                    product.description = itemEditor.Description;
                    product.cost = System.Convert.ToInt32(itemEditor.Cost);
                    context.SaveChanges();
                    Response.Redirect("MainPage.aspx");
                }
            }

            catch (FormatException)
            {
                test.Text = "Format exception!";
                // the FormatException is thrown when the string text does 
                // not represent a valid integer.
            }
            catch (OverflowException)
            {
                test.Text = "OverflowException exception!";

                // the OverflowException is thrown when the string is a valid integer, 
                // but is too large for a 32 bit integer.  Use Convert.ToInt64 in
                // this case.
            }
        }
    }
}