using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Adventura.Customer
{
    public partial class AdventureOrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM [AdventrueItemBookingDetailView] WHERE [customerid] =  " + Session["uid"].ToString();
            SqlDataSource1.DataBind();
            DataList1.DataBind();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM [AdventrueItemBookingDetailView] WHERE [customerid] =  " + Session["uid"].ToString() + "and status ='Booked'";
            SqlDataSource1.DataBind();
            DataList1.DataBind();
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM [AdventrueItemBookingDetailView] WHERE [customerid] =  " + Session["uid"].ToString() + " and status ='Recieved'";
            SqlDataSource1.DataBind();
            DataList1.DataBind();
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM [AdventrueItemBookingDetailView] WHERE [customerid] =  " + Session["uid"].ToString() + " and status ='Returned'";
            SqlDataSource1.DataBind();
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Label lblid = new Label();
            lblid = (Label)e.Item.FindControl("AdventurebookingidLabel");
            string str;
            Connectionclass obj = new Connectionclass();
            str = "update Adventure_item_BookingDetail set status ='Returned' where Adventurebookingid =" + lblid.Text;
            obj.exe_command(str);
            Response.Write("<script>alert('Item Returned ')</script>");
            SqlDataSource1.DataBind();
            DataList1.DataBind();
        }
    }
}