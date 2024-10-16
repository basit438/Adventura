using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Adventura.GeneralModule
{
    public partial class Campingitems : System.Web.UI.Page
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
           
           
            Session["itemtype"] = "Camping";
            Response.Redirect("choicepage.aspx");
        }

        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {
            if (txtsearch.Text == "")
            {
                SqlDataSource1.SelectCommand = "SELECT * FROM [View_camp]";
                SqlDataSource1.DataBind();
                DataList1.DataBind();
            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT * FROM [View_camp] where CitemName like '%" + txtsearch.Text + "%'";
                SqlDataSource1.DataBind();
                DataList1.DataBind();
            }
        }
    }
}