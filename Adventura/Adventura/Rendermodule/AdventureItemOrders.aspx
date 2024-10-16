<%@ Page Title="" Language="C#" MasterPageFile="~/Rendermodule/RenderMasterpage.Master" AutoEventWireup="true" CodeBehind="AdventureItemOrders.aspx.cs" Inherits="Adventura.Rendermodule.AdventureItemOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="alert alert-info">
        <asp:LinkButton ID="LinkButton2" class="btn btn-primary" runat="server" OnClick="LinkButton2_Click">Booked</asp:LinkButton>
        <asp:LinkButton ID="LinkButton3" class="btn btn-primary" runat="server" OnClick="LinkButton3_Click">Deliverd/HandedOver</asp:LinkButton>
        <asp:LinkButton ID="LinkButton4" class="btn btn-primary" runat="server" OnClick="LinkButton4_Click">Returned/Recievd Back</asp:LinkButton>
    </div>
    <div>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" DataKeyField="Adventurebookingid" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                <div class="container">
                <div class="row">
                    <div class="col-3 alert alert-primary me-2 ms-2">
                        <b>AdventureItemid:</b>
                        <asp:Label ID="AdventureItemidLabel"  runat="server" Text='<%# Eval("AdventureItemid") %>' />
                        <br />
                         <b> itemRegistrationNO:</b>
                         <asp:Label ID="itemRegistrationNOLabel" runat="server" Text='<%# Eval("itemRegistrationNO") %>' />
                         <br />
                        <b>itemcolor:</b>
                         <asp:Label ID="itemcolorLabel" runat="server" Text='<%# Eval("itemcolor") %>' />
                         <br />
                        <b>itemCategory:</b>
                        <asp:Label ID="itemCategoryLabel" runat="server" Text='<%# Eval("itemCategory") %>' />
                        <br />
                         <b>rent:</b>
                        <asp:Label ID="rentLabel" runat="server" Text='<%# Eval("rent") %>' />
                        <br />
                         <b>per:</b>
                        <asp:Label ID="perLabel" runat="server" Text='<%# Eval("per") %>' />
                       
                    </div>
                
                    <div class="col-4  alert alert-primary me-2">
                         <b>AdventureItemName:</b>
                          <asp:Label ID="AdventureItemNameLabel" runat="server" Text='<%# Eval("AdventureItemName") %>' />
                         <br />
                         <b> Itemdescription:</b>
                        <asp:Label ID="ItemdescriptionLabel" runat="server" Text='<%# Eval("Itemdescription") %>' />
                        <br />
                         <b>itemCapacity:</b>
                        <asp:Label ID="itemCapacityLabel" runat="server" Text='<%# Eval("itemCapacity") %>' />
                         <br />
                        <b>itemimage:</b>
                            <asp:Label ID="itemimageLabel" runat="server" Text='<%# Eval("itemimage") %>' />
                         <br />
                             <b>qty:</b>
                            <asp:Label ID="qtyLabel" runat="server" Text='<%# Eval("qty") %>' />
                            <br />
                             <b>date_of_booking:</b>
                            <asp:Label ID="date_of_bookingLabel" runat="server" Text='<%# Eval("date_of_booking") %>' />
                            <br />
                            <b> Date_Of_Pick:</b>
                            <asp:Label ID="Date_Of_PickLabel" runat="server" Text='<%# Eval("Date_Of_Pick") %>' />
                           
                       
                    </div>
                    <div class="col-4 alert alert-primary">
                         <b> AdventureItemType:</b>
                         <asp:Label ID="AdventureItemTypeLabel" runat="server" Text='<%# Eval("AdventureItemType") %>' />
                        <br />
                     <b>time_of_pic:</b>
                        <asp:Label ID="time_of_picLabel" runat="server" Text='<%# Eval("time_of_pic") %>' />
                      <br />
                         <b>Date_of_Return:</b>
                        <asp:Label ID="Date_of_ReturnLabel" runat="server" Text='<%# Eval("Date_of_Return") %>' />
                      <br />
                        <b>status:</b>
                        <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                       <br />
                        <b>customerid:</b>
                        <asp:Label ID="customeridLabel" runat="server" Text='<%# Eval("customerid") %>' />
                       <br />
                        <b>renderid:</b>
                        <asp:Label ID="renderidLabel" runat="server" Text='<%# Eval("renderid") %>' />
        <br />
                        <b>Adventurebookingid:</b>
                        <asp:Label ID="AdventurebookingidLabel" runat="server" Text='<%# Eval("Adventurebookingid") %>' />
                        <br />
                          <asp:LinkButton runat="server" id ="lnkmessage">Update</asp:LinkButton>
                       
                </div>   
                </div>
               
                <br />
               
                <br />
               
                 
                <br />
                 
                 
                
                    </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureDatabaseConnectionString %>" 
            SelectCommand="SELECT * FROM [AdventrueItemBookingDetailView] WHERE ([renderid] = @renderid) and status='Booked'">
            <SelectParameters>
                <asp:SessionParameter Name="renderid" SessionField="uid" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
