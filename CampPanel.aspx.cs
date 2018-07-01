using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MentalHealth3
{
    public partial class CampPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("./MainPage.aspx");
            }

            if (Session["User"].ToString() == "Admin")
            {
                Response.Redirect("./MainPage.aspx");
            }

            ButtonAttend.ServerClick += ButtonAttend_ServerClick;
            ButtonRequest.ServerClick += ButtonRequest_ServerClick;
        }

        private void ButtonRequest_ServerClick(object sender, EventArgs e)
        {
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.Credentials = new System.Net.NetworkCredential("soroushkhoubyarian@gmail.com", "*****");
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("soroushkhoubyarian@gmail.com", string.Format("Event Request From {0}", Session["User"].ToString()));
            mail.Subject = "Journey+ Event Request";
            mail.Body = string.Format("Hello, the company {0} has requested for an even in the date {1}. They have decided to give {2} XP points to the users. The discription of the even are as following:\n{3}", Session["User"].ToString(), TextboxDate.Value, TextboxXP.Value, TextareaDescription.Value);
            mail.To.Add("xutony05@gmail.com");
            

            smtpClient.Send(mail);

            ClientScript.RegisterStartupScript(GetType(), "Key", "alert('Request was sent successfully!');", true);
        }

        private void ButtonAttend_ServerClick(object sender, EventArgs e)
        {
            List<int> Recommendation = new List<int>();
            List<int> Users = new List<int>();
            List<FirebaseData> Inputs = Firebase.Read(ConfigurationManager.AppSettings["Firebase"]);

            int i = 0, xp = 0;
            foreach (var D in Firebase.Read(ConfigurationManager.AppSettings["Firebase"]))
            {
                if (D.Name == "Recommendation")
                {
                    if (D.Value.Split('|')[2] == Session["User"].ToString() && D.Value.Split('|')[1] == TextboxCode.Value)
                    {
                        Users.Add(i);
                    }
                }
                i++;        

                if (D.Name == "Event")
                {
                    if (D.Value.Split('|')[0] == Session["User"].ToString())
                    {
                        xp = int.Parse(D.Value.Split('|')[2]);
                    }
                }
            }
            if (Users.Count == 0)
            {
                ClientScript.RegisterStartupScript(GetType(), "Key", "alert('Your data is wrong.');", true);
                return;
            }

            for (int t = 0; t < Inputs.Count; t++)
            {
                for (int k = 0; k < Users.Count; k++)
                {
                    if (Inputs[t].Name == "User")
                    {
                        if (Inputs[t].Value.Split('|')[1] == Inputs[Users[k]].Value.Split('|')[0])
                        {
                            Inputs[t].Value = Inputs[t].Value.Split('|')[0] + "|" + Inputs[t].Value.Split('|')[1] + "|" + Inputs[t].Value.Split('|')[2] + "|" + Inputs[t].Value.Split('|')[3] + "|" + (int.Parse(Inputs[t].Value.Split('|')[4]) + xp).ToString(); 
                            }
                    }
                }
            }

            foreach (var index in Users)
            {
                Inputs.RemoveAt(index);
            }
                
            Firebase.EditUser(ConfigurationManager.AppSettings["Firebase"], Inputs);

            ClientScript.RegisterStartupScript(GetType(), "Key", "alert('Database updated successfully!!');", true);
        }
    }
}