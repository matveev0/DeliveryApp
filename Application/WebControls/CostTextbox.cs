using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application.ServerControls
{
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:CostTextbox runat=server></{0}:CostTextbox >")]
    public class CostTextbox : TextBox
    {
        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("599")]
        [Localizable(true)]
        public int Cost
        {
            get
            {
                int res = 0;
                if (!int.TryParse(Text, out res))
                    return 599;
                if (res < MinCost)
                    return MinCost;
                if (res > MaxCost)
                    return MaxCost;
                return res;
            }
            set
            {
                this.Text = value.ToString();
            }
        }

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("9999")]
        [Localizable(true)]
        public int MaxCost
        {
            get;
            set;
        }

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("1")]
        [Localizable(true)]
        public int MinCost
        {
            get;
            set;
        }
    }
}