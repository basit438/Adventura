using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Adventura.AdminModule
{
    public partial class Changepassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string str;
            Connectionclass obj = new Connectionclass();
            str = "select password from logintable where userid =" + Session["uid"].ToString();
            obj.datareader(str);
            if(obj.dr.HasRows)
            {
                obj.dr.Read();
                if(obj.dr[0].ToString() == Txtoldpass.Text )
                {
                    str = "update logintable set password ='" + txtnewpass.Text + "' where userid ='" + Session["uid"].ToString() + "'";
                    obj.exe_command(str);
                    Response.Write("<script>alert('Password Changed S;uclk;djflksld')</script>");
                    Response.Redirect("../loginmodule/loginpage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Password')</script>");
                    Txtoldpass.Text = "";
                    txtnewpass.Text = "";
                    TxtConfirmnewpass.Text = "";
                    Txtoldpass.Focus();
                }
            }
            
        }
    }
}