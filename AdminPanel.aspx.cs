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
    public partial class AdminPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("./Mainpage.aspx");
            }

            if (Session["User"].ToString() != "Admin")
            {
                Response.Redirect("./Mainpage.aspx");
            }

            ButtonRegister.ServerClick += ButtonRegister_ServerClick;
            ButtonEvent.ServerClick += ButtonEvent_ServerClick;
        }

        private void ButtonEvent_ServerClick(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Firebase.Write(ConfigurationManager.AppSettings["Firebase"], "Event", string.Format("{0}|{1}|{2}|{3}|{4}", TextboxCampEvent.Value, TextboxDateEvent.Value, TextboxXPEvent.Value, TextAreaDescription.Value, TextboxLink.Value));

                string Code;
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);  
                smtpClient.Credentials = new System.Net.NetworkCredential("soroushkhoubyarian@gmail.com", "****");
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.EnableSsl = true;

                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("soroushkhoubyarian@gmail.com", string.Format("New Event at {0}", TextboxCampEvent.Value)); 
                mail.Subject = "Journey+ Presents";

                foreach (var D in Firebase.Read(ConfigurationManager.AppSettings["Firebase"]))
                {
                    if (D.Name == "User")
                    {
                        Code = Guid.NewGuid().ToString().Replace('&', '*').Substring(0, 6);
                        Firebase.Write(ConfigurationManager.AppSettings["Firebase"], "Recommendation", string.Format("{0}|{1}|{2}|{3}|{4}|{5}", D.Value.Split('|')[1], Code, TextboxCampEvent.Value, TextboxXPEvent.Value, TextAreaDescription.Value, TextboxLink.Value));
                        mail.Body = string.Format("Hi! There's a huge event on {0}, taking place at {1}! Please come! You will get {2} datapoints! CU there...\nYour shared code: {3}", TextboxDateEvent.Value, TextboxCampEvent.Value, TextboxXPEvent.Value, Code);

                        mail.CC.Add(new MailAddress(D.Value.Split('|')[1]));
                    }
                }

                if (mail.CC.Count> 0 || mail.To.Count > 0)
                {
                    smtpClient.Send(mail);

                }

                ClientScript.RegisterStartupScript(GetType(), "Key", "alert('Event was added successfully!');", true);
            }
        }

        private void ButtonRegister_ServerClick(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Firebase.Write(ConfigurationManager.AppSettings["Firebase"], "Client", string.Format("{0}|{1}", TextboxCompany.Value, TextboxPassword.Value));

                ClientScript.RegisterStartupScript(GetType(), "Key", "alert('Registration successful!!');", true);
            }
        }
    }
}
