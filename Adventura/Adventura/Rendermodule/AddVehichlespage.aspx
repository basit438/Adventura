<%@ Page Title="" Language="C#" MasterPageFile="~/Rendermodule/RenderMasterpage.Master" AutoEventWireup="true" CodeBehind="AddVehichlespage.aspx.cs" Inherits="Adventura.Rendermodule.AddVehichlespage" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <style>
                .vhadd{
                    margin-left:1%;
                }
                .vhdetail{
                    margin:5%;
                    
                }
            </style>
            
            <div class="row vhadd ">
          <div class="row mb-3">
                  
    <h1>Add Your Vehicle</h1>
    <p> <b>Kindly complete the following details to enlist your vehicle for rental on our Platform.</b></p>     
              </div>
            <div class="row">
                <div class="col-2">
                   Enter Vehicle Name:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TxtVhName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="col-7">
    <asp:TextBox class="input-group form-control w-100 mb-3 " ID="TxtVhName" placeholder="Vehicle Name" runat="server" OnTextChanged="TxtVhName_TextChanged"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2">Enter Vehicle Type:<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TxtVhType" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-7">
    <asp:TextBox class="input-group w-100  form-control mb-3" ID="TxtVhType" placeholder="e.g: 4x4 OR 2x4" runat="server"></asp:TextBox> 
                        </div>
                    </div>
                <div class="row">
                    <div class="col-2">Enter Quantity:<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TxtVhType" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-7">
    <asp:TextBox class="input-group w-100 form-control mb-3" ID="TxtVhQuantity" placeholder="No. of Vehicles you want to Add" runat="server"></asp:TextBox> 
                        </div>
                    </div>
                <div class="col-9">
                        <asp:Button Class="btn btn-success w-100" ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
                </div>

                      
              </div>

        </asp:View>

        <asp:View ID="View2" runat="server">
            
            <div class="row vhdetail">
                <div class="row">
                    
       <h1>Enter Each Vehicle detail</h1>
       <p><b>Kindly complete the following details to enlist your vehicle for rental on our Platform.</b></p>     
                     
                    </div>

                <div class="row">
          <div class="col-3">
              Enter Vehicle Reg NO:
              <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="TxtVhregNo" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
          </div>
                   <div class="col-7">
  <asp:TextBox  class="input-group w-100 px-4 mb-2 form-control" ID="TxtVhregNo" placeholder="Vehicle rg no" runat="server"></asp:TextBox>
                       </div>
                    </div>
            <div class="row">
                <div class="col-3">
                    Enter vehicle Description:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="TxtVhDescription" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
                <div class="col-7">
 <asp:TextBox class="input-group w-100 px-4 mb-2 form-control" ID="TxtVhDescription" placeholder=" Vehicle Description" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
            <div class="row">
                <div class="col-3">
                    Enter Vehicle Capacity:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtvhCapacity" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
                <div class="col-7">
 <asp:TextBox  class="input-group w-100 px-4 mb-2 form-control" ID="TxtvhCapacity" placeholder="Vehicle Capacity" runat="server"></asp:TextBox>
                    </div>
                </div>
            <div class="row">
                <div class="col-3">
                Enter Vehicle Color:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TxtVHcolor" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </div>
            <div class="col-7">
<asp:TextBox  class="input-group w-100 px-4 mb-2 form-control" ID="TxtVHcolor" placeholder="Vehicle Color" runat="server"></asp:TextBox> 
                </div>
                </div>
            <div class="row">
                <div class="col-3">
                    Enter Quantity:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TxtVhQuantity" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
                <div class="col-7">
<asp:TextBox  class="input-group w-100 px-4 mb-2 form-control" ID="Txtvhqauntitydt" placeholder="Quantity" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-3">
                    Enter Category:
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="ddlvhcategory" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>
                    <div class="col-7">
               
<asp:DropDownList class="input-group w-100 px-4 mb-2 form-control" id="ddlvhcategory" runat="server" height="33px" width="452px">
    <asp:ListItem>2 Wheeler</asp:ListItem>
    <asp:ListItem>4 wheeler</asp:ListItem>
                </asp:DropDownList> 
                         </div>
            </div>
                <div class="row">
                    <div class="col-3">Rent per:<asp:DropDownList class="px-2"  id ="ddlrentper" runat="server" height="25px">
                    <asp:ListItem>Day</asp:ListItem>
                    <asp:ListItem>Hour</asp:ListItem>
                </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="ddlrentper" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-7">
<asp:TextBox  class="input-group form-control w-100 px-4  mb-2" ID="TxtVhPrice" placeholder="Describe Rent" runat="server"></asp:TextBox> 
                        </div>
                </div>
            <div class="row">
                <div class="col-3">
                upload Vehicle Picture:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="FileUploadvhdt" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
                <div class="col-7">
                    <asp:FileUpload  class="form-control w-100 mb-2" type="file" ID="FileUploadvhdt" placeholder="Upload a vehicle image" runat="server" /> 
                </div>
            </div>

                <div class="row">
                    <div class="col-10">
                        <asp:Button Class="btn btn-success w-100" ID="BtnVhDetail"  runat="server" Text="Submit" OnClick="BtnVhDetail_Click" Width="247px"/>
                    </div>

                    </div>

                </div>
            
            
                
    
        </asp:View>
    </asp:MultiView>
</asp:Content>
