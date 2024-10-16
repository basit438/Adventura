<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="AdventureOrderDetails.aspx.cs" Inherits="Adventura.Customer.AdventureOrderDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="alert alert-info">
        <asp:LinkButton ID="LinkButton2" class="btn btn-primary" runat="server" OnClick="LinkButton2_Click">Booked</asp:LinkButton>
        <asp:LinkButton ID="LinkButton4" class="btn btn-primary" runat="server" OnClick="LinkButton4_Click">Returned</asp:LinkButton>
    </div>
    <div>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" DataKeyField="Adventurebookingid">
            <ItemTemplate>
                <div class="row alert alert-primary me-2 ms-4" >
                    <div class="col-sm-4">
                        AdventureItemid:
                        <asp:Label ID="AdventureItemidLabel" runat="server" Text='<%# Eval("AdventureItemid") %>' />
                        <br />
                        AdventureItemName:
                        <asp:Label ID="AdventureItemNameLabel" runat="server" Text='<%# Eval("AdventureItemName") %>' />
                        <br />
                        AdventureItemType:
                        <asp:Label ID="AdventureItemTypeLabel" runat="server" Text='<%# Eval("AdventureItemType") %>' />
                        <br />
                        itemRegistrationNO:
                        <asp:Label ID="itemRegistrationNOLabel" runat="server" Text='<%# Eval("itemRegistrationNO") %>' />
                        <br />
                        Itemdescription:
                        <asp:Label ID="ItemdescriptionLabel" runat="server" Text='<%# Eval("Itemdescription") %>' />
                        <br />
                        itemCapacity:
                        <asp:Label ID="itemCapacityLabel" runat="server" Text='<%# Eval("itemCapacity") %>' />
                        <br />
                    </div>
                    <div class="col-sm-4">
                         itemcolor:
                        <asp:Label ID="itemcolorLabel" runat="server" Text='<%# Eval("itemcolor") %>' />
                        <br />
                        itemCategory:
                        <asp:Label ID="itemCategoryLabel" runat="server" Text='<%# Eval("itemCategory") %>' />
                        <br />
                        rent:
                        <asp:Label ID="rentLabel" runat="server" Text='<%# Eval("rent") %>' />
                        <br />
                        per:
                        <asp:Label ID="perLabel" runat="server" Text='<%# Eval("per") %>' />
                        <br />
                        itemimage:
                        <asp:Label ID="itemimageLabel" runat="server" Text='<%# Eval("itemimage") %>' />
                        <br />
                        qty:
                        <asp:Label ID="qtyLabel" runat="server" Text='<%# Eval("qty") %>' />
                        <br />
                        date_of_booking:
                        <asp:Label ID="date_of_bookingLabel" runat="server" Text='<%# Eval("date_of_booking") %>' />
                        <br />
                    </div>
                    <div class="col-sm-4">
                        Date_Of_Pick:
                        <asp:Label ID="Date_Of_PickLabel" runat="server" Text='<%# Eval("Date_Of_Pick") %>' />
                        <br />
                        time_of_pic:
                        <asp:Label ID="time_of_picLabel" runat="server" Text='<%# Eval("time_of_pic") %>' />
                        <br />
                        Date_of_Return:
                        <asp:Label ID="Date_of_ReturnLabel" runat="server" Text='<%# Eval("Date_of_Return") %>' />
                        <br />
                        status:
                        <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                        <br />
                        customerid:
                        <asp:Label ID="customeridLabel" runat="server" Text='<%# Eval("customerid") %>' />
                        <br />
                        renderid:
                        <asp:Label ID="renderidLabel" runat="server" Text='<%# Eval("renderid") %>' />
        <br />
                        <asp:Label ID="AdventurebookingidLabel" runat="server" Text='<%# Eval("Adventurebookingid") %>' />
                        <br />
                         <asp:LinkButton ID="LinkButton5" runat="server" class="btn btn-danger mt-3">Return</asp:LinkButton>
                        <br />
                    </div>

                </div>
                
               
                
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureDatabaseConnectionString %>" 
            SelectCommand="SELECT * FROM [AdventrueItemBookingDetailView] WHERE ([customerid] = @customerid) and status='Booked'">
            <SelectParameters>
                <asp:SessionParameter Name="customerid" SessionField="uid" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
