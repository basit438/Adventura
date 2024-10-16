<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralModule/GeneralMasterPage.Master" AutoEventWireup="true" CodeBehind="CustormerRegistration.aspx.cs" Inherits="Adventura.GeneralModule.CustormerRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <div class="row d-flex justify-content-center">
        
            <div class="col-4  mt-3 shadow p-3 mb-5  bg-white rounded register">
                <img style="width:600px; height:500px;" src="../Project images/ai-generated-8226491_1280.jpg" img/>
            </div>

            <div class="col-4 mt-3 shadow p-3 mb-5 bg-white rounded register">
                 
              
                 <h1 class="heading">Sign Up</h1>
                      <h5 class="pb-3 heading">Register Yourself with Adventura</h5>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TxtcustomerCno" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:TextBox class="input-group w-75 px-4 form-control" ID="TxtcustomerName" placeholder="Enter Name"  runat="server"></asp:TextBox><br />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TxtcustomerEmail" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:TextBox class="input-group w-75 px-4 form-control" ID="TxtcustomerEmail" placeholder="Enter Email" runat="server"></asp:TextBox><br />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtcustomerAddress" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:TextBox class="input-group w-75 px-4 form-control" ID="TxtcustomerAddress" placeholder="Enter ADDRESS" runat="server"></asp:TextBox><br />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtcustomerCno" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:TextBox class="input-group w-75 px-4 form-control" ID="TxtcustomerCno" placeholder="Enter contact" runat="server"></asp:TextBox><br />
                <asp:Button Class="btn btn-success w-75" ID="Btncustomerreg" runat="server" Text="Register" OnClick="Btncustomerreg_Click" />
                
            </div>
               
       </div>
</asp:Content>
