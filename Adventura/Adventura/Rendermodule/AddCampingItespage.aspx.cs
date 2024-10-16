using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Adventura.Rendermodule
{
    public partial class AddCampingItespage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnCitmAdd_Click(object sender, EventArgs e)
        {
            
                string str;
            str = "insert into campingitems values ('"
                + Session["uid"].ToString() + "','"
                + TxtitemName.Text + "','"
                + TxtitemQuantity.Text + "','"
                + TxtitemCapacity.Text + "'"
                +  ",'Partial')";
            Connectionclass  obj = new Connectionclass();
            obj.exe_command(str);
            str = "select max(citemid) from campingitems"; 
            obj.datareader(str);
            if(obj.dr.HasRows)
            {
                obj.dr.Read();
                ViewState["itemid"] = obj.dr[0].ToString();
            }
            Response.Write("<script>alert('New Item Added')</script> ");
            MultiView1.ActiveViewIndex = 1;

            Lblitemname.Text = "Enter" + " " + TxtitemName.Text + " " +"details";
        }

        protected void BnCitmDetail_Click(object sender, EventArgs e)
        {
            if (FileitemUpload.HasFile)
            {
                FileitemUpload.SaveAs(Server.MapPath("~/ItemImages/" + FileitemUpload.FileName.ToString()));

                string str;
                Connectionclass obj = new Connectionclass();
                str = "insert into citemdetails values('"
                    + ViewState["itemid"].ToString() + "','"
                    + Txtitmdesciption.Text + "','"
                    + Txtitmcolor.Text + "','"
                    + TxtitemQuantity.Text + "','"
                     + Txtcitemrent.Text + "','"
                    + ddlrentperitem.SelectedItem.Text + "','"
                    + FileitemUpload.FileName.ToString() + "')";
                obj.exe_command(str);
                Response.Write("<script>alert('New Item Uploaded')</script>)");

            }

        }
    }
}