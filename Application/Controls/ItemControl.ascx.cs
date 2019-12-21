using DbProject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application.Controls
{
    public partial class ItemControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (EditMode)
                    fillData();
            }
        }

        bool EditMode
        {
            get
            {
                return ProductID != 0;
            }
        }

        public int ProductID
        {
            get;
            set;
        }

        public string ProductTypeID
        {
            get;
            set;
        }

        public string Name
        {
            get { return txtName.Text; }
            set { txtName.Text = value; }
        }

        public int Cost
        {
            get { return txtCost.Cost; }
            set { txtCost.Text = value.ToString(); }
        }

        public string Description
        {
            get { return txtDescription.Text; }
            set { txtDescription.Text = value; }
        }

        private void fillData()
        {
            using (var context = new DeliveryAppEntities())
            {
                var product = (from c in context.product where c.product_id == ProductID select c).First();
                txtName.Text = product.product_name;
                txtCost.Text = product.cost.ToString();
                txtDescription.Text = product.description;
                context.SaveChanges();
            }
        }
    }
}