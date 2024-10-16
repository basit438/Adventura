<%@ Page Title="" Language="C#" MasterPageFile="~/AdminModule/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="RenderInformation.aspx.cs" Inherits="Adventura.AdminModule.RenderInformation" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">

    <div class="row mt-2 alert alert-info">
        <div class="col-4">
                <asp:Button  class="btn btn-dark mb-3 mt-2" ID="BtnallRenders" runat="server" Text="Show All Renders" Height="40px" OnClick="BtnallRenders_Click" style="margin-left: 0px" Width="192px" />
        </div>
        <div class="col-4">
             <asp:Button  class="btn btn-dark mb-4 mt-2" ID="BtnbyDistrict" runat="server" height="40px" styText="Search by District" width="192px" OnClick="BtnbyDistrict_Click" Text="Search by District" />
        </div>
        <div class="col-4">
              <asp:Button  class="btn btn-dark mb-4 mt-2" ID="BtnbyName" runat="server" height="40px"  Text="Search by Name" width="192px" OnClick="BtnbyName_Click" />
        </div>
    </div>


    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
        <center>        
    <asp:GridView ID="GridView1" class="table table-striped p-2" runat="server"  OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateSelectButton="True">
    </asp:GridView>
            </center>
        </asp:View>
        <asp:View ID="View2" runat="server">
             <div class="row m-2">
                <div class="col-sm-10">
            select district :<asp:DropDownList ID="DropDownList1" class="form-control" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
           </div>
           <div class="col-sm-2">
               <asp:Button ID="BtnGo" runat="server" OnClick="BtnGo_Click" class="btn btn-success mt-4" Text="Go" />
           </div>
                 </div>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <div class="row">
                <div class="col-sm-10">
                      Enter Render Company Name :<asp:TextBox ID="txtbyname"  class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:Button ID="btnsearch" runat="server" OnClick="btnsearch_Click" class="btn btn-success mt-4" Text="search" />
                </div>
            </div>
            
        </asp:View>
        <asp:View ID="View4" runat="server">
            <div>
                Company ID:<asp:Label ID="lblid" runat="server" Text="Label"></asp:Label><br />
                Company Name:<asp:Label ID="lblcompanyname" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="lblemailid" runat="server" Text="Label"></asp:Label>
                <br />
                Status <asp:Label ID="lblstatus" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Button ID="BtnrenderAccept" runat="server" Text="Accept" OnClick="Button1_Click" />
                <asp:Button ID="Btnrenderreject" runat="server" Text="Reject" />

            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>

