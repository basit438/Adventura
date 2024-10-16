using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Adventura.Rendermodule
{
    public partial class AddVehichlespage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            string str;
            str = "insert into Adventureitems values ('"
                + Session["uid"].ToString() + "','"
                + TxtVhName.Text + "','"
                + TxtVhType.Text.ToString() + "','"
                + TxtVhQuantity.Text + "'"
                  + ",'Partial')";
            Connectionclass obj = new Connectionclass();
            obj.exe_command(str);
            str = "select max(Adventureitemid) from Adventureitems";
            obj.datareader(str);
            if (obj.dr.HasRows)
            {
                obj.dr.Read();
                ViewState["itemid"] = obj.dr[0].ToString();
            }
            Response.Write("<script>alert('New Vehicle Added')</script> ");
            MultiView2.ActiveViewIndex = 1;
        }

        protected void BtnVhDetail_Click(object sender, EventArgs e)
        {
            if (FileUploadvhdt.HasFile)
            {
                FileUploadvhdt.SaveAs(Server.MapPath("~/ItemImages/" + FileUploadvhdt.FileName.ToString()));

                string str;
                str = "insert into Adventureitemdetail values('"
                    + ViewState["itemid"].ToString() + "','"
                    + TxtVhregNo.Text + "','"
                    + TxtVhDescription.Text + "','"
                    + TxtvhCapacity.Text + "','"
                    + TxtVHcolor.Text + "','"
                    + Txtvhqauntitydt.Text + "','"
                    + ddlvhcategory.SelectedItem.Text+"','"
                    +TxtVhPrice.Text+"','"
                    + ddlrentper.SelectedItem.Text +"','"
                    + FileUploadvhdt.FileName.ToString() + "')";

                Connectionclass obj = new Connectionclass();
                obj.exe_command(str);
                Response.Write("<script>alert('New Vehicle Added')</script> ");

            }
        }

        protected void TxtVhName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}