<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="ChoosedAdventureItempage.aspx.cs" Inherits="Adventura.Customer.ChoosedAdventureItempage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>

    </style>
    <div>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <div>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" DataKeyField="itemDetailID">
            <ItemTemplate>

                <div class="row">
                    <div class="col-5">
                          <asp:Image class="img-fluid" ID="Image1" runat="server"  ImageUrl='<%# "../ItemImages/" + Eval("itemimage") %>'/>
                    </div>

                    <div class="col-5">
               <div class="card">
                    <div class="card-body">
                <asp:Label ID="AdventureItemidLabel" runat="server" Text='<%# Eval("AdventureItemid") %>' />
                <br />
               <b>
                <asp:Label ID="AdventureItemNameLabel" runat="server" Text='<%# Eval("AdventureItemName") %>' /></b>
                <br />
                AdventureItemType:
                <asp:Label ID="AdventureItemTypeLabel" runat="server" Text='<%# Eval("AdventureItemType") %>' />
                <br />
                Itemdescription:
                <asp:Label ID="ItemdescriptionLabel" runat="server" Text='<%# Eval("Itemdescription") %>' />
                <br />
                itemcolor:
                <asp:Label ID="itemcolorLabel" runat="server" Text='<%# Eval("itemcolor") %>' />
                <br />
                itemCategory:
                <asp:Label ID="itemCategoryLabel" runat="server" Text='<%# Eval("itemCategory") %>' />
                <br />
                rent:
                <asp:Label ID="rentLabel" runat="server" Text='<%# Eval("rent") %>' />
                
                per:
                <asp:Label ID="perLabel" runat="server" Text='<%# Eval("per") %>' />
                        <asp:Label ID="renderid" Visible="false" runat="server" Text='<%# Eval("renderid") %>' />
                <br />
                        </div>
                    <div class="card-footer">
                    <asp:LinkButton class="btn btn-success w-100" ID="LinkButton1" runat="server">Book Now</asp:LinkButton>
                        </div>
                    </div>
                        </div>
                    </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AdventureDatabaseConnectionString2 %>" 
            SelectCommand="SELECT * FROM [AdventureItemDetailView] WHERE ([AdventureItemid] = @AdventureItemid)">
            <SelectParameters>
                <asp:SessionParameter Name="AdventureItemid" SessionField="itemid" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                         Date of Pick :<asp:TextBox ID="txtdateofpick" runat="server" class="form-control" TextMode="Date">
                        </asp:TextBox> 
                        Time:<asp:TextBox ID="txttime" runat="server" class="form-control" TextMode="Time"></asp:TextBox>
                    
                    </div>
                    <div class="col-sm-4">
                         Date of Return:<asp:TextBox ID="txtreturn" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="col-sm-2">
                         Quantity <asp:TextBox ID="txtqty" TextMode="Number" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-2">
                    <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-success mt-4" OnClick="Button1_Click" />
                    </div>
                </div>
                    </div>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <div>
                    Your Booking Detail
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
