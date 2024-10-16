using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Adventura.Rendermodule
{
    public partial class CampingItemOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM [camping_item_bookingdetail] WHERE [renderid] =  " + Session["uid"].ToString();
            SqlDataSource1.DataBind();
            DataList1.DataBind();
            foreach (DataListItem itm in DataList1.Items)
            {
                LinkButton lnkbtn = new LinkButton();
                lnkbtn = (LinkButton)itm.FindControl("lnkmessage");
                lnkbtn.Visible = false;

            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM [camping_item_bookingdetail] WHERE [renderid] =  "
                + Session["uid"].ToString() + "and status ='Booked'";
            SqlDataSource1.DataBind();
            DataList1.DataBind();
            foreach (DataListItem itm in DataList1.Items)
            {
                LinkButton lnkbtn = new LinkButton();
                lnkbtn = (LinkButton)itm.FindControl("lnkmessage");
                lnkbtn.Visible = true;
                lnkbtn.Text = "Click Here To Deliver/HandedOver";

            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM [camping_item_bookingdetail] WHERE [renderid] =  "
                + Session["uid"].ToString() + " and status ='Deliverd'";
            SqlDataSource1.DataBind();
            DataList1.DataBind();
            foreach (DataListItem itm in DataList1.Items)
            {
                LinkButton lnkbtn = new LinkButton();
                lnkbtn = (LinkButton)itm.FindControl("lnkmessage");
                lnkbtn.Visible = false;
                //  lnkbtn.Text = "Click Here On Recieve Back Items";

            }
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM [camping_item_bookingdetail] WHERE [renderid] =  " + Session["uid"].ToString() + " and status ='Returned'";
            SqlDataSource1.DataBind();
            DataList1.DataBind();
            foreach (DataListItem itm in DataList1.Items)
            {
                LinkButton lnkbtn = new LinkButton();
                lnkbtn = (LinkButton)itm.FindControl("lnkmessage");
                lnkbtn.Visible = false;


            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Label lblid = new Label();
            lblid = (Label)e.Item.FindControl("campingbookingidLabel");
            string str;
            Connectionclass obj = new Connectionclass();
            str = "update camping_item_bookingdetail set status ='Deliverd' where [campingbookingid]=" + lblid.Text;
            obj.exe_command(str);
            Response.Write("<script>alert('Status Updated')</script>");
            SqlDataSource1.DataBind();
            DataList1.DataBind();

        }
    }
}