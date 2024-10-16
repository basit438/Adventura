<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralModule/GeneralMasterPage.Master" AutoEventWireup="true" CodeBehind="RenderRegisterationpage.aspx.cs" Inherits="Adventura.GeneralModule.RenderRegisterationpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
       

                
          <div class="row bg-color">
                          <div class="row mb-3 mt-3">
                              <h1>Register Your Business</h1>
            <p> <b>Please provide all required details to register your business with us</b></p>
                          </div>
                <div class="row">
                    <div class="col-3">
                          Enter Company Name:
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcname" ErrorMessage="*" ForeColor="Red" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtcname" ErrorMessage="invalid name" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[a-zA-Z0-9][a-zA-Z0-9.,'\-_ ]*[a-zA-Z0-9]$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-7">
           <asp:TextBox class="input-group w-100 px-3 mb-2 form-control"  ID="txtcname" placeholder="Company Name" runat="server"></asp:TextBox>
                        </div>
                    </div>


        <div class="row" >
           <div class="col-3">
      Enter Company Address: 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtaddress" ErrorMessage="*" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
               </div>
            <div class="col-7">
               <asp:TextBox class="input-group w-100 px-3 mb-2 form-control" ID="txtaddress" placeholder="Company Address" TextMode ="MultiLine" runat="server"></asp:TextBox>
                </div>
            </div>


        <div class="row">
            <div class="col-3">
                Select district:
            </div>
            <div class="col-7">
                <asp:DropDownList class="mb-2" ID="ddldistrict" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddldistrict_SelectedIndexChanged" Width="680px" height="33px">
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList><br />
            </div>
        </div>
        

        <div class="row">
            <div class="col-3">
                Select Tehsil:
            </div>
            <div class="col-7">
                <asp:DropDownList class="mb-2"  ID="ddltehsil" runat="server" OnSelectedIndexChanged="ddltehsil_SelectedIndexChanged" Width="680px" height="33px" AutoPostBack="True">
        </asp:DropDownList>
            </div>
        </div>
 <div class="row">
     <div class="col-3">
         Enter Contact NO:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtcno" Display="Dynamic" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtcno" ErrorMessage="invalid C No" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[789]\d{9}$">invalid C No</asp:RegularExpressionValidator>
     </div>
     <div class="col-7">
          <asp:TextBox class="input-group w-100 px-3 mb-2 form-control" ID="txtcno" placeholder="Contact NO" runat="server"></asp:TextBox>
     </div>
 </div>
        
        <div class="row">
     <div class="col-3">
         Enter Email:
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtemail" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtemail" Display="Dynamic" ErrorMessage="invalid email" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$">invalid email</asp:RegularExpressionValidator>
     </div>
     <div class="col-7">
         <asp:TextBox class="input-group w-100 px-3 mb-2 form-control" ID="txtemail" placeholder="Email id" runat="server"></asp:TextBox>
     </div>
 </div>

        <div class="row">
     <div class="col-3">
         Enter Reg no:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtregno" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtregno" Display="Dynamic" ErrorMessage="invalid reg no" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^-?[0-9][0-9,\.]+$"></asp:RegularExpressionValidator>
     </div>
     <div class="col-7">
 <asp:TextBox class="input-group w-100 px-3 mb-2 form-control" ID="txtregno" placeholder="Reg no" runat="server"></asp:TextBox>
     </div>
 </div>

              <div class="row mt-3">
                  <div class="col-10">
 <asp:Button class="btn btn-success w-100 px-5 " ID="Btnrenderregister" runat="server" Text="Register" OnClick="Button1_Click" />
                      </div>
                  </div>
        </div>
    
               
          
</asp:Content>
