using Adventura.GeneralModule;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Adventura.LoginModule
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string str;
            Connectionclass obj = new Connectionclass();
            str = "select * from logintable where loginid ='" + txtusername.Text 
                + "' and password='" + txtpassword.Text + "'";
            obj.datareader(str);
            if(obj.dr.HasRows)
            {
                obj.dr.Read();
                string usertype = obj.dr["usertype"].ToString();
                Session["uid"] = obj.dr["userid"].ToString();
                if (usertype == "Admin")
                    Response.Redirect("../AdminModule/RenderInformation.aspx"); 
                else if (usertype == "Render")
                    Response.Redirect("../RenderModule/renderHomepage.aspx");
                else if (usertype == "Customer")
                {
                    if (Session["itemid"] == null)
                        Response.Redirect("../Customer/customerHomepage.aspx");
                    else if(Session["itemtype"].ToString() == "Adventure")

                        Response.Redirect("../customer/choosedadventureitempage.aspx");
                    else if (Session["itemtype"].ToString() == "Camping")

                        Response.Redirect("../customer/chosedcampingitempage.aspx");
                }
                    
            }
            else
            {
                Response.Write("<script>alert('Invalid UserName Or Password')</script>");
                txtpassword.Text = string.Empty;
                txtpassword.Focus();

            }

        }

        protected void linkRegister_Click(object sender, EventArgs e)
        {
            
        }
    }
}