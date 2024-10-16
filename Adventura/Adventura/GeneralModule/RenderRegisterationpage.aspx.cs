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
    public partial class RenderRegisterationpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            
            if(!IsPostBack)
            {
                string str;
                Connectionclass obj = new Connectionclass();
                str = "select * from districttable" ;
                obj.datareader(str);
                if(obj.dr.HasRows)
                {
                    ddldistrict.Items.Clear();
                    while(obj.dr.Read())
                    {
                        ListItem itm = new ListItem();
                        itm.Text = obj.dr[1].ToString();
                        itm.Value = obj.dr[0].ToString();
                        ddldistrict.Items.Add(itm);
                    }
                }
                str = "Select * from tehsiltable where Districtid= " + ddldistrict.SelectedValue.ToString();

                obj.datareader(str);
                if (obj.dr.HasRows == true)
                {
                    ddltehsil.Items.Clear();
                    while (obj.dr.Read())
                    {
                        ListItem itm = new ListItem();
                        itm.Text = obj.dr[2].ToString();
                        itm.Value = obj.dr[0].ToString();
                        ddltehsil.Items.Add(itm);
                    }

                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string str;
            str = "insert into Rendercompany values('"
                + txtcname.Text + "','"
                + txtaddress.Text + "','"
                + ddldistrict.SelectedValue.ToString() + "','"
                + ddltehsil.SelectedValue.ToString() + "','"
                + txtemail.Text + "','"
                + txtcno.Text + "','"
                + txtregno.Text + "','In Active')";

            Connectionclass obj = new Connectionclass();
            obj.exe_command(str);
            Random r = new Random();
            string password = "ADVENTURA-" + r.Next(1234, 5678987).ToString();
            str = "select max(companyid) from Rendercompany";


            var accountSid = "ACbf5acabf3f8834bff95b6a0965251f20";
            var authToken = "420fff90a833f48c4683ed9849a445e7";
            TwilioClient.Init(accountSid, authToken);
            string mobileno = "+91" + txtcno.Text;

            var messageOptions = new CreateMessageOptions(
              new PhoneNumber(mobileno));
            messageOptions.From = new PhoneNumber("+12569523454");
            messageOptions.Body = "Login ID: " + txtemail.Text + " and Password is ;" + password; 



             var message = MessageResource.Create(messageOptions);
            Console.WriteLine(message.Body);
            Response.Write("<script>alert('Your Registration is in process- You will be informed soon through SMS')</script>");
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            
        }

        protected void ddldistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            string str;
            Connectionclass obj = new Connectionclass();
            str = "Select * from tehsiltable where Districtid= " + ddldistrict.SelectedValue.ToString();

            obj.datareader(str);
            if (obj.dr.HasRows == true)
            {
                ddltehsil.Items.Clear();
                while( obj.dr.Read())
                {
                    ListItem itm = new ListItem();
                    itm.Text = obj.dr[2].ToString();
                    itm.Value = obj.dr[0].ToString();
                    ddltehsil.Items.Add(itm);
                }

            }
        }

        protected void ddltehsil_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}