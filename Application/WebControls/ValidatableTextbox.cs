using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

[assembly: WebResource("Application.js.jquery-control.js", "text/javascript")]
namespace Application.ServerControls
{
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:ValidatableTextbox runat=server></{0}:ValidatableTextbox >")]
    public class ValidatableTextbox : WebControl
    {
        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        [Localizable(true)]

        public string Text
        {
            get
            {
                String s = (String)ViewState["Text"];
                return ((s == null) ? "[" + this.ID + "]" : s);
            }

            set
            {
                ViewState["Text"] = value;
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            Page.ClientScript.RegisterClientScriptResource(typeof(ValidatableTextbox), "js.jquery-control.js");
            //   Page.ClientScript.RegisterStartupScript(typeof(Page), "Validate", "document.getElementById('" + this.ClientID + "').focus();", true);
        }

        protected override void RenderContents(HtmlTextWriter output)
        {
            output.AddAttribute(HtmlTextWriterAttribute.Type, "text");
            output.AddAttribute(HtmlTextWriterAttribute.Id, this.ClientID);
            output.AddAttribute("onBlur", "validateField(this);");
            output.AddAttribute(HtmlTextWriterAttribute.Class, "validateble");
            //            output.AddAttribute("validator", "validateField");
            output.RenderBeginTag(HtmlTextWriterTag.Input);
            output.RenderEndTag();
        }
    }
}