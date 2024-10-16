<%@ Page Title="" Language="C#" MasterPageFile="~/AdminModule/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Changepassword.aspx.cs" Inherits="Adventura.AdminModule.Changepassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-3">
        <div class="card">
            <div class="card-header">
                <h4>Change Password</h4>
            </div>
            <div class="card-body">
                Enter old Password<asp:TextBox ID="Txtoldpass" class="form-control" runat="server"></asp:TextBox>
                <br />
               Enter New password <asp:TextBox ID="txtnewpass" runat="server" class="form-control" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
                <br />
               COnfirm New Password <asp:TextBox ID="TxtConfirmnewpass" class="form-control" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click"  class="btn btn-info" Text="Change" />
                <br />
            </div>
        </div>
    </div>
    
</asp:Content>
