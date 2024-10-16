<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="CampingOrderDetials.aspx.cs" Inherits="Adventura.Customer.CampingOrderDetials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="alert alert-info">
        <asp:LinkButton ID="LinkButton2" class="btn btn-primary" runat="server" OnClick="LinkButton2_Click">Booked</asp:LinkButton>
        &nbsp;<asp:LinkButton ID="LinkButton4" class="btn btn-primary" runat="server" OnClick="LinkButton4_Click">Returned</asp:LinkButton>
    </div>
    <div>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" DataKeyField="campingbookingid" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                 <div class="row alert alert-primary me-2 ms-4">
                    <div class="col-sm-4">
                        campingbookingid:
                        <asp:Label ID="campingbookingidLabel" runat="server" Text='<%# Eval("campingbookingid") %>' />
                        <br />
                        itemid:
                        <asp:Label ID="itemidLabel" runat="server" Text='<%# Eval("itemid") %>' />
                        <br />
                        renderid:
                        <asp:Label ID="renderidLabel" runat="server" Text='<%# Eval("renderid") %>' />
                        <br />
                        customerid:
                        <asp:Label ID="customeridLabel" runat="server" Text='<%# Eval("customerid") %>' />
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
                        CitemName:
                        <asp:Label ID="CitemNameLabel" runat="server" Text='<%# Eval("CitemName") %>' />
                        <br />
                        CitemQuantity:
                        <asp:Label ID="CitemQuantityLabel" runat="server" Text='<%# Eval("CitemQuantity") %>' />
                        <br />
                        CitemCapacity:
                        <asp:Label ID="CitemCapacityLabel" runat="server" Text='<%# Eval("CitemCapacity") %>' />
                        <br />
                     </div>

                     <div class="col-sm-4 ">
                         Expr1:
                        <asp:Label ID="Expr1Label" runat="server" Text='<%# Eval("Expr1") %>' />
                        <br />
                        Citemdescription:
                        <asp:Label ID="CitemdescriptionLabel" runat="server" Text='<%# Eval("Citemdescription") %>' />
                        <br />
                        Citemcolor:
                        <asp:Label ID="CitemcolorLabel" runat="server" Text='<%# Eval("Citemcolor") %>' />
                        <br />
                        Expr2:
                        <asp:Label ID="Expr2Label" runat="server" Text='<%# Eval("Expr2") %>' />
                        <br />
                        rent:
                        <asp:Label ID="rentLabel" runat="server" Text='<%# Eval("rent") %>' />
                        <br />
                        per:
                        <asp:Label ID="perLabel" runat="server" Text='<%# Eval("per") %>' />
        <br />
                        Citemimage:
                        <asp:Label ID="CitemimageLabel" runat="server" Text='<%# Eval("Citemimage") %>' />
                        <br />
                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-danger mt-2">Click To Return</asp:LinkButton>
                        <br />
                     </div>
                </div>
                
                
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureDatabaseConnectionString %>" 
            SelectCommand="SELECT * FROM [CampingItemBookingDetailView] WHERE ([customerid] = @customerid) and status ='Booked'">
            <SelectParameters>
                <asp:SessionParameter Name="customerid" SessionField="uid" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
