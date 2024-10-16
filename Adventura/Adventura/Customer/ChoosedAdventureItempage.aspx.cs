using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Adventura.Customer
{
    public partial class ChoosedAdventureItempage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["itemid"] == null)
            {
                MultiView1.ActiveViewIndex = -1;
                Response.Write("<script>alert('Please Select item before Booking ')</script>");
                //Response.Redirect("")
                    
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Label rid = new Label();
            rid = (Label)e.Item.FindControl("renderid");
            ViewState["renderid"] = rid.Text;
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string str;
            Connectionclass obj = new Connectionclass();
            str = "set dateformat dmy;insert into Adventure_item_bookingDetail values('" + Session["itemid"].ToString() + "','" + ViewState["renderid"].ToString() + "','" + Session["uid"].ToString()
                + "','" + txtqty.Text +"','" + DateTime.Now.ToShortDateString() + "','" + txtdateofpick.Text + "','" + txttime.Text + "','" + txtreturn.Text + "','Booked')";
            obj.exe_command(str);
            Response.Write("<script>alert('Item Booked Sucessfully')</script>");
            Session["itemid"] = null;
           // MultiView1.ActiveViewIndex = 2;

        }
    }
}