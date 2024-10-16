<%@ Page Title="" Language="C#" MasterPageFile="~/Rendermodule/RenderMasterpage.Master" AutoEventWireup="true" CodeBehind="AddCampingItespage.aspx.cs" Inherits="Adventura.Rendermodule.AddCampingItespage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .containerr{
            margin-left:2%;
        }
    </style>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
         <div class="containerr">
                   <h1>Add Your Item</h1>
    <p> <b>Kindly complete the following details to enlist your Item for rental on our Platform.</b></p>     

            <div class="row">
                <div class="col-2">
                    Enter Item Name:
                </div>
                <div class="col-7">
              <asp:TextBox class="input-group form-control w-100 px-4 mb-3" ID="TxtitemName" placeholder="Item Name" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-2">
                    Enter Quantity:
                </div>
                <div class="col-7">
                 <asp:TextBox class="input-group form-control w-100 px-4 "  ID="TxtitemQuantity" placeholder="Total No of specific item you are adding" runat="server"></asp:TextBox> <br />
                </div>
            </div>
            <div class="row">
                <div class="col-2">
                    Enter Capacity:
                </div>
                <div class="col-7">
                    <asp:TextBox class="input-group form-control w-100 px-4 mb-3"  ID="TxtitemCapacity" placeholder="Capacity of the Item you are adding(optional)" runat="server"></asp:TextBox>
                </div>
            </div>
         
           <div class="col-9">
               <asp:Button Class="btn btn-success w-100" ID="BtnCitmAdd" runat="server" Text="Add" OnClick="BtnCitmAdd_Click" />
           </div>
            </div>
            
          
        </asp:View>

        <asp:View ID="View2" runat="server">
          
         <h1><asp:Label ID="Lblitemname" runat="server" Text="Label"></asp:Label></h1>
            <div class="row">
                <div class="col-2">
                    Enter Description:
                </div>
                <div class="col-7">
                     <asp:TextBox class="input-group form-control w-100 mb-3 px-4"  ID="Txtitmdesciption" placeholder="item Description" runat="server" TextMode="MultiLine"></asp:TextBox> 
                </div>
            </div>
           <div class="row">
               <div class="col-2">
                   Enter item Capacity:
               </div>
               <div class="col-7">
            <asp:TextBox class="input-group form-control w-100 mb-3 px-4" ID="TxtitmCapacity" placeholder="Item Capacity(optional)" runat="server"></asp:TextBox> 
               </div>
           </div>
            <div class="row">
                <div class="col-2">
                    Enter Item Color:
                </div>
                <div class="col-7">
     <asp:TextBox class="input-group form-control w-100  px-4" ID="Txtitmcolor" placeholder="Item color" runat="server"></asp:TextBox> <br />
                </div>
            </div>
            <div class="row">
                <div class="col-2">
                    Enter Quantity:
                </div>
                <div class="col-7">
                      <asp:TextBox class="input-group form-control w-100 px-4 " ID="Txtitmquantity" placeholder="No of Specific Item you are adding" runat="server"></asp:TextBox> <br />
                </div>
            </div>
          
                               <div class="row">
                    <div class="col-2">Rent per:<asp:DropDownList class="px-2"  id ="ddlrentperitem" runat="server" height="25px">
                    <asp:ListItem>Day</asp:ListItem>
                    <asp:ListItem>Hour</asp:ListItem>
                </asp:DropDownList>
                    </div>
                    <div class="col-7">
<asp:TextBox  class="input-group form-control w-100 px-4  mb-3" ID="Txtcitemrent" placeholder="Describe Rent" runat="server"></asp:TextBox> 
                        </div>
                </div>
            <div class="row">
                <div class="col-2">
                    Upload Item Image:
                </div>
                <div class="col-7">
                  <asp:FileUpload class="form-control w-100 px-4 mb-3" type="file" ID="FileitemUpload" placeholder="Upload item image" runat="server" />
                </div>
            </div>
            <div class="col-8">
           <asp:Button Class="btn btn-success w-100" ID="BnCitmDetail" runat="server" Text="Submit" OnClick="BnCitmDetail_Click" />
            </div>


           
        </asp:View>
    </asp:MultiView>
</asp:Content>
