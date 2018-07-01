using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MentalHealth3
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["User"] = null;

            ButtonLogin.ServerClick += ButtonLogin_ServerClick;
        }

        private void ButtonLogin_ServerClick(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                List<FirebaseData> Data = Firebase.Read(System.Configuration.ConfigurationManager.AppSettings["Firebase"]);

                foreach (var D in Data)
                {
                    if (D.Name == "Client" && D.Value.Split('|')[0] == TextboxUsername.Value && D.Value.Split('|')[1] == TextboxPassword.Value)
                    {
                        Session["User"] = TextboxUsername.Value;

                        if (Session["User"].ToString() == "Admin")
                        {
                            Response.Redirect("./AdminPanel.aspx");
                        }
                        Response.Redirect("./CampPanel.aspx");
                    }
                }

                ClientScript.RegisterStartupScript(GetType(), "Key", "alert('Either your username or your password is wrong. Please try again.');", true);
            }
        }
    }
}