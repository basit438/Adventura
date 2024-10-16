using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;


namespace Adventura.AdminModule
{
    public partial class RenderInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string str;
                str = "select * from DistrictTable";
                Connectionclass obj = new Connectionclass();
                obj.datareader(str);
                if (obj.dr.HasRows)
                {
                    while (obj.dr.Read())
                    {
                        ListItem itm = new ListItem();
                        itm.Text = obj.dr["DistrictName"].ToString();
                        itm.Value = obj.dr[0].ToString();
                        DropDownList1.Items.Add(itm);
                    }
                }
            }
        }

        protected void BtnallRenders_Click(object sender, EventArgs e)
        {
            string str;
            Getconnection obj = new Getconnection();
            str = "Select companyid as [ID],COMPANYNAME AS [COMPANY TITLE],COMPANYEMAILID AS [EMAIL ID],STATUS AS STATUS from RenderCompany";
            obj.Groupdata(str);
            GridView1.DataSource = obj.ds.Tables["temptable"];
            GridView1.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblid.Text = GridView1.SelectedRow.Cells[1].Text;
            string str;
            Connectionclass obj = new Connectionclass();
            str = "select * from rendercompany where companyid =" + lblid.Text;
            obj.datareader(str);
            if(obj.dr.HasRows)
            {
                obj.dr.Read();
                txtbyname.Text = obj.dr[1].ToString();
                lblstatus.Text = obj.dr["status"].ToString();
                lblemailid.Text = obj.dr["companyemailid"].ToString();
                MultiView1.ActiveViewIndex = 3;
            }
        }

        protected void BtnbyDistrict_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void BtnbyName_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void BtnGo_Click(object sender, EventArgs e)
        {
            string str;
            Getconnection obj = new GetConnection();
            str = "Select Companyid as Cid, CompanyName, CompanyContact, CompanyEmailid from RenderCompany where Districtid =" + DropDownList1.SelectedValue.ToString();
            obj.groupdata(str);
            GridView1.DataSource = obj.ds.Tables["temptable"];
            GridView1.DataBind();
            if (GridView1.Rows.Count == 0)
            {
                Response.Write("<script> alert('NO SUCH RECORD FOUND') </script>");

            }
            MultiView1.ActiveViewIndex = 0;
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            string str;
            Getconnection obj = new GetConnection();
            str = "select * from RenderCompany where CompanyName like '%" + txtbyname.Text + "%'";
            obj.groupdata(str);
            GridView1.DataSource = obj.ds.Tables["temptable"];
            GridView1.DataBind();
            if (GridView1.Rows.Count == 0)
            {
                Response.Write("<script> alert('NO SUCH RECORD FOUND') </script>");
                txtbyname.Focus();
                txtbyname.Text = string.Empty;

            }
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string str;
            Connectionclass obj = new Connectionclass();
            if(lblstatus.Text == "Active")
            {
                Response.Write("<script>alert('User is Already Active')</script>");
            }
            else
            {
                str = "update rendercompany set status ='Active' where companyid =" + lblid.Text;
                obj.exe_command(str);
                Random r = new Random();
                string password = "ADVENTURA-" + r.Next(1234, 5678987).ToString();

                str = "insert into logintable values('" + lblid.Text + "','" + lblemailid.Text + "','" + password + "','Render')";
                obj.exe_command(str);
                ///// sms coding
              
                Response.Write("<script>alert('Status Updated')</script>");
            }
            
            MultiView1.ActiveViewIndex = -1;
        }
    }
}