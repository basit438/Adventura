<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralModule/GeneralMasterPage.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="Adventura.GeneralModule.ForgetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <center style="margin-top:200px;">
                Enter Registered Molile no:<br />
                <asp:TextBox ID="txtmobno" runat="server"></asp:TextBox> <br />
            <asp:Button runat="server" id ="btnsub" Text="Submit" OnClick="btnsub_Click" /> 
            </center>
        </asp:View>
        <br />
        <asp:View ID="View2" runat="server">
            Enter OTP:<asp:TextBox id ="txtotp" runat="server"></asp:TextBox>
            <asp:Button runat="server" id="btnoptsubmit" Text="Button" OnClick="btnoptsubmit_Click" />
        </asp:View>
    </asp:MultiView>
    
    
</asp:Content>
