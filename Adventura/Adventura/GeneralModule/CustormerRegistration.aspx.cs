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
    public partial class CustormerRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Btncustomerreg_Click(object sender, EventArgs e)
        {
            
                string str;
                str = "insert into customerdetail values ('"
                    + TxtcustomerName.Text + "','"
                    + TxtcustomerEmail.Text + "','"
                    + TxtcustomerAddress.Text + "','"
                    + TxtcustomerCno.Text + "')";
                Connectionclass obj = new Connectionclass();
                obj.exe_command(str);
                Random r = new Random();
                string password = "ADVENTURA-" + r.Next(1234, 5678987).ToString();
                str = "select max(customerid) from customerdetail";
                obj.datareader(str);
                if (obj.dr.HasRows)
                {
                    obj.dr.Read();
                    string userid = obj.dr[0].ToString();
                    str = "insert into logintable values('" + userid + "','" + TxtcustomerEmail.Text + "','" + password + "','Customer')";
                    obj.exe_command(str);

                    var accountSid = "ACbf5acabf3f8834bff95b6a0965251f20";
                    var authToken = "420fff90a833f48c4683ed9849a445e7";
                    TwilioClient.Init(accountSid, authToken);
                    string mobileno = "+91" + TxtcustomerCno.Text;

                    var messageOptions = new CreateMessageOptions(
                      new PhoneNumber(mobileno));
                    messageOptions.From = new PhoneNumber("+12569523454");

                    messageOptions.Body = "Login ID: " + TxtcustomerEmail.Text + " and Password is ;" + password;
                    var message = MessageResource.Create(messageOptions);
                    Response.Write("<script>alert('You are Registered Sucessfully, Login Detail send on your Moblie No')</script>)");
                    Response.Redirect("../loginmodule/loginpage.aspx");
                }

            }
        }
    }