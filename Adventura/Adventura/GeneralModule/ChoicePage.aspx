<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralModule/GeneralMasterPage.Master" AutoEventWireup="true" CodeBehind="ChoicePage.aspx.cs" Inherits="Adventura.GeneralModule.ChoicePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card logincard">

        <div class="card-header">
            <center>
            <h2>To Continue Log in to</h2>
            <h1>Adventura</h1>
                </center>
        </div>
        <div class="card-body">
        <asp:LinkButton class="btn btn-success w-100 px-5 mb-4" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">LOG IN</asp:LinkButton>
        <asp:LinkButton class="btn btn-success w-100 px-5 " ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">SignUp</asp:LinkButton>

            </div>
    </div>
</asp:Content>
