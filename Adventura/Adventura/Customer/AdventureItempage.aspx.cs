using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Adventura.Customer
{
    public partial class AdventureItempage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ddlvhcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlvhcategory.SelectedIndex != 0)
            {
                SqlDataSource1.SelectCommand = "SELECT [AdventureItemid], [AdventureItemName], [AdventureItemType], [Itemdescription], [itemcolor], [itemCategory], [rent], [per], [itemimage] FROM [AdventureItemDetailView] where itemcategory='" + ddlvhcategory.SelectedItem.Text + "'";
                SqlDataSource1.DataBind();
                DataList1.DataBind();


            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT [AdventureItemid], [AdventureItemName], [AdventureItemType], [Itemdescription], [itemcolor], [itemCategory], [rent], [per], [itemimage] FROM [AdventureItemDetailView]";
                SqlDataSource1.DataBind();
                DataList1.DataBind();

            }
        }

        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {
            if (txtsearch.Text == "")
            {
                SqlDataSource1.SelectCommand = "SELECT [AdventureItemid], [AdventureItemName], [AdventureItemType], [Itemdescription], [itemcolor], [itemCategory], [rent], [per], [itemimage] FROM [AdventureItemDetailView]";
                SqlDataSource1.DataBind();
                DataList1.DataBind();
            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT [AdventureItemid], [AdventureItemName], [AdventureItemType], [Itemdescription], [itemcolor], [itemCategory], [rent], [per], [itemimage] FROM [AdventureItemDetailView] where AdventureItemName like '%" + txtsearch.Text + "%'";
                SqlDataSource1.DataBind();
                DataList1.DataBind();
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Label lblitemid = new Label();
            lblitemid = (Label)e.Item.FindControl("AdventureItemidLabel");
            Session["itemid"] = lblitemid.Text;

            MultiView1.ActiveViewIndex = 1;
        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Label lblitemid = new Label();
            lblitemid = (Label)e.Item.FindControl("Label2");
            Session["itemid"] = lblitemid.Text;
            Session["itemtype"] = "Adventure";
            MultiView1.ActiveViewIndex = 2;
           
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string str;
            Connectionclass obj = new Connectionclass();
            str = "set dateformat dmy;insert into Adventure_item_bookingDetail values('" + Session["itemid"].ToString() + "','" + ViewState["renderid"].ToString() + "','" + Session["uid"].ToString()
                + "','" + txtqty.Text + "','" + DateTime.Now.ToShortDateString() + "','" + txtdateofpick.Text + "','" + txttime.Text + "','" + txtreturn.Text + "','Booked')";
            obj.exe_command(str);
            Response.Write("<script>alert('Item Booked Sucessfully')</script>");
            Session["itemid"] = null;
        }
    }
}