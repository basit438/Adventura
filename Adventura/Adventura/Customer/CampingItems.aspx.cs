using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Adventura.Customer
{
    public partial class CampingItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Label lblitemid = new Label();
            lblitemid = (Label)e.Item.FindControl("CitemidLabel");
            Session["itemid"] = lblitemid.Text;

            MultiView1.ActiveViewIndex = 1;
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {

            Label lblitemid = new Label();
            lblitemid = (Label)e.Item.FindControl("CitemidLabel");
            Session["itemid"] = lblitemid.Text;
            Session["itemtype"] = "Camping";
            Label lblrenderid = new Label();
            lblrenderid = (Label)e.Item.FindControl("renderidLabel");
            ViewState["renderid"] = lblrenderid.Text;
            MultiView1.ActiveViewIndex = 2;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string str;
            Connectionclass obj = new Connectionclass();
            str = "set dateformat dmy;insert into [camping_item_BookingDetail] values('" + Session["itemid"].ToString() + "','" 
                + ViewState["renderid"].ToString() + "','" + Session["uid"].ToString()
                + "','" + txtqty.Text + "','" + DateTime.Now.ToShortDateString() + "','" + txtdateofpick.Text + "','" + txttime.Text + "','" + txtreturn.Text + "','Booked')";
            obj.exe_command(str);
            Response.Write("<script>alert('Item Booked Sucessfully')</script>");
            Session["itemid"] = null;
        }
    }
}