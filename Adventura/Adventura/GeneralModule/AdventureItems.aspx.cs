using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Adventura.GeneralModule
{
    public partial class AdventureItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlvhcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlvhcategory.SelectedIndex !=0)
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
            if(txtsearch.Text =="")
            {
                SqlDataSource1.SelectCommand = "SELECT [AdventureItemid], [AdventureItemName], [AdventureItemType], [Itemdescription], [itemcolor], [itemCategory], [rent], [per], [itemimage] FROM [AdventureItemDetailView]";
                SqlDataSource1.DataBind();
                DataList1.DataBind();
            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT [AdventureItemid], [AdventureItemName], [AdventureItemType], [Itemdescription], [itemcolor], [itemCategory], [rent], [per], [itemimage] FROM [AdventureItemDetailView] where AdventureItemName like '%" + txtsearch.Text +"%'";
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
            lblitemid = (Label)e.Item.FindControl("AdventureItemidLabel");
            Session["itemid"] = lblitemid.Text;
            Session["itemtype"] = "Adventure";
            Response.Redirect("choicepage.aspx");
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}