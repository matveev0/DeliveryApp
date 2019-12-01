using DbProject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (authenticated())
            {
                Response.Redirect("MainPage.aspx");
            }
            btnLogin.Click += BtnLogin_Click;
            btnSignUp.Click += BtnSignUp_Click;
        }

        private void BtnSignUp_Click(object sender, EventArgs e)
        {
            if (signUp())
            {
                Response.Cookies["token"].Value = makeToken(txtRegUsername.Text, txtRegPassword.Text);
                Response.Redirect("MainPage.aspx");
                return;
            }
        }

        private void BtnLogin_Click(object sender, EventArgs e)
        {
            if (login(txtLogin.Text, txtPassword.Text))
            {
                Response.Cookies["token"].Value = makeToken(txtLogin.Text, txtPassword.Text);
                Response.Redirect("MainPage.aspx");
                return;
            }
        }

        private bool login(string login, string password)
        {
#warning ADD ERROR HANDLING
            using (var context = new DeliveryAppEntities())
            {
                var user = (from c in context.users
                            where c.username == login && c.password == password
                            select c
                            );
                return user.Any() ? true : false;
            }
        }

        private bool signUp()
        {
            if (txtRegPassword.Text.Equals(txtRegConfirmPassword.Text))
            {
                using (var context = new DeliveryAppEntities())
                {

                    var user = new users
                    {
                        name = txtName.Text,
                        surname = txtSurname.Text,
                        password = txtRegPassword.Text,
                        username = txtRegUsername.Text,
                        email = txtEmail.Text,
                        role_id = 2
                    };
                    context.users.Add(user);
                    context.SaveChanges();
                };
                return true;
            }
            else
            {
                return false;
            }
        }

        private bool authenticated()
        {
            if (Request.Cookies["token"] != null && !string.IsNullOrEmpty(Request.Cookies["token"].Value))
            {
                //var token = makeToken(
                //    ConfigurationManager.AppSettings["adminLogin"],
                //    ConfigurationManager.AppSettings["adminPassword"]);
                //return token == Request.Cookies["token"].Value;
                return true;
            }
            return false;
        }

        private string makeToken(string login, string password)
        {
            var alg = MD5.Create();
            var bytes = Encoding.ASCII.GetBytes(login + password);
            return Convert.ToBase64String(alg.ComputeHash(bytes));
        }
    }
}