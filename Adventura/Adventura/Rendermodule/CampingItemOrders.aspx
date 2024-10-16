<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="CampingItemOrders.aspx.cs" Inherits="Adventura.Rendermodule.CampingItemOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="alert alert-info">
        <asp:LinkButton ID="LinkButton2" class="btn btn-primary" runat="server" OnClick="LinkButton2_Click">Booked</asp:LinkButton>
        <asp:LinkButton ID="LinkButton3"  class="btn btn-primary" runat="server" OnClick="LinkButton3_Click">Deliverd/HandedOver</asp:LinkButton>
        <asp:LinkButton ID="LinkButton4"  class="btn btn-primary" runat="server" OnClick="LinkButton4_Click">Returned/Recievd Back</asp:LinkButton>
    </div>
    <div>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" DataKeyField="campingbookingid" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                <div class="alert alert-warning ms-3">
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
                 <asp:LinkButton runat="server" id ="lnkmessage">LinkButton</asp:LinkButton>
                <br />
                    </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureDatabaseConnectionString %>" 
            SelectCommand="SELECT * FROM [camping_item_bookingdetail] WHERE ([renderid] = @renderid) and status='Booked'">
            <SelectParameters>
                <asp:SessionParameter Name="renderid" SessionField="uid" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
