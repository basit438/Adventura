using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

namespace Adventura.GeneralModule
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsub_Click(object sender, EventArgs e)
        {
            string str;
            Connectionclass obj = new Connectionclass();
            str = "select * from customerdetail where customercontact='" + txtmobno.Text + "'";
            obj.datareader(str);
            if(obj.dr.HasRows)
            {
                sentotp();
                ViewState["usertype"] = "customer";
                MultiView1.ActiveViewIndex = 1;
            }
            else
            {
                str = "select * from rendercompany where companycontact ='" + txtmobno.Text + "'";
                obj.datareader(str);
                if(obj.dr.HasRows)
                {
                    sentotp();
                    ViewState["usertype"] = "render";
                    MultiView1.ActiveViewIndex = 1;
                }
                else
                {
                    Response.Write("<script>alert('No Such Nuber reg ')</script>");
                    txtmobno.Text = "";
                }
            }
                
        }
        void sentotp()
        {
            var accountSid = "ACbf5acabf3f8834bff95b6a0965251f20";
            var authToken = "420fff90a833f48c4683ed9849a445e7";
            TwilioClient.Init(accountSid, authToken);
            string mobileno = "+91" + txtmobno.Text;

            var messageOptions = new CreateMessageOptions(
              new PhoneNumber(mobileno));
            messageOptions.From = new PhoneNumber("+12569523454");
            Random r = new Random();
            string otp = r.Next(1000, 9999).ToString();
            ViewState["otp"] = otp.ToString();
            messageOptions.Body = "OTP :-" + otp;
            var message = MessageResource.Create(messageOptions);
        }

        protected void btnoptsubmit_Click(object sender, EventArgs e)
        {
            if(ViewState["otp"].ToString() == txtotp.Text)
            {
               
                
                string str,pwd="";
                Connectionclass obj = new Connectionclass();
                if (ViewState["usertype"].ToString() == "render")
                {
                    str = "select companyid from rendercompany where companycontact='" + txtmobno.Text + "'";
                    obj.datareader(str);
                    if(obj.dr.HasRows)
                    {
                        obj.dr.Read();
                        str = "select password from logintable where userid =" + obj.dr[0].ToString() +" and usertype='Render'";
                        obj.datareader(str);
                        if(obj.dr.HasRows)
                        {
                            obj.dr.Read();
                            pwd = obj.dr["password"].ToString();
                        }
                    }
                }
                else
                {
                    str = "select customerid from customerdetail where customercontact='" + txtmobno.Text + "'";
                    obj.datareader(str);
                    if (obj.dr.HasRows)
                    {
                        obj.dr.Read();
                        str = "select password from logintable where userid =" + obj.dr[0].ToString() + " and usertype='Customer'";
                        obj.datareader(str);
                        if (obj.dr.HasRows)
                        {
                            obj.dr.Read();
                            pwd = obj.dr["password"].ToString();
                        }
                    }
                }

                var accountSid = "ACbf5acabf3f8834bff95b6a0965251f20";
                var authToken = "420fff90a833f48c4683ed9849a445e7";
                TwilioClient.Init(accountSid, authToken);
                string mobileno = "+91" + txtmobno.Text;

                var messageOptions = new CreateMessageOptions(
                  new PhoneNumber(mobileno));
                messageOptions.From = new PhoneNumber("+12569523454");
                messageOptions.Body = "Your Password is :-" + pwd.ToString();
                var message = MessageResource.Create(messageOptions);
            }
            else
            {
                Response.Write("<script>alert('Invalid OTP')</script>");
                txtotp.Text = "";
            }
        }
    }
}