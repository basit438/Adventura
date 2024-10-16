<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralModule/GeneralMasterPage.Master" AutoEventWireup="true" CodeBehind="AdventureItems.aspx.cs" Inherits="Adventura.GeneralModule.AdventureItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
      
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                  <div class="col-4">
<asp:DropDownList style="height:40px; margin-left:30px; margin-top:10px;" class="input-group w-75 form-control" id="ddlvhcategory" runat="server" height="33px" width="452px" AutoPostBack="True" OnSelectedIndexChanged="ddlvhcategory_SelectedIndexChanged">
    <asp:ListItem>Select vehicle type</asp:ListItem>
    <asp:ListItem>2 Wheeler</asp:ListItem>
    <asp:ListItem>4 wheeler</asp:ListItem>
                </asp:DropDownList> 
            </div>
        <div class="col-4">
             <asp:TextBox style="margin-top:10px;" class="input-group w-75 px-4 form-control" placeholder="search items"  ID="txtsearch" runat="server" AutoPostBack="True" OnTextChanged="txtsearch_TextChanged"></asp:TextBox>
            </div>
                 <div>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
            <ItemTemplate>
                <div class="card cardd">
                    <div class="card-header crdhead">
                <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# "../ItemImages/" + Eval("itemimage") %>'/>

                    </div>
                    <div class="card-body">
                        <center>
                ID:<asp:Label ID="AdventureItemidLabel" runat="server" Text='<%# Eval("AdventureItemid") %>' />
                <br />
               <b>
                <asp:Label ID="AdventureItemNameLabel" runat="server" Text='<%# Eval("AdventureItemName") %>' /></b
               
                
                <asp:Label ID="rentLabel" runat="server" Text='<%# Eval("rent") %>' />
                per/
                <asp:Label ID="perLabel" runat="server" Text='<%# Eval("per") %>' />
                            </center>
                        </div>
                
                        <div class="card-footer">
                        <asp:LinkButton class="btn btn-success w-100" ID="LinkButton1" runat="server">Rent</asp:LinkButton>
                            </div>
                        </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AdventureDatabaseConnectionString2 %>" 
            SelectCommand="SELECT [AdventureItemid], [AdventureItemName], [AdventureItemType], [Itemdescription], [itemcolor], [itemCategory], [rent], [per], [itemimage] 
            FROM [AdventureItemDetailView]"></asp:SqlDataSource>
    </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div>
                    <asp:DataList ID="DataList2" runat="server" DataKeyField="itemDetailID" DataSourceID="SqlDataSource2" OnItemCommand="DataList2_ItemCommand">
                        <ItemTemplate>
                            <div class="row">
                                <div class="col-6 m-2">
                                      
                            <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# "../ItemImages/" + Eval("itemimage") %>'/>

                                </div>
                                <div class="col-5">
                                <div class="card">
                                <div class="card-body">


                            <center>
                        <h1> <asp:Label ID="AdventureItemNameLabel" runat="server" Text='<%# Eval("AdventureItemName") %>' />
                           

                            
                            <asp:Label ID="AdventureItemTypeLabel" runat="server" Text='<%# Eval("AdventureItemType") %>' /></h1>
                            <br />
                                </center>
                                      ID:<asp:Label ID="AdventureItemidLabel" runat="server" Text='<%# Eval("AdventureItemid") %>' /> <br />
                                    Rent:
                            <asp:Label ID="rentLabel" runat="server" Text='<%# Eval("rent") %>' />
                            
                            per/
                            <asp:Label ID="perLabel" runat="server" Text='<%# Eval("per") %>' /> <br />

                            itemRegistrationNO:
                            <asp:Label ID="itemRegistrationNOLabel" runat="server" Text='<%# Eval("itemRegistrationNO") %>' />
                            <br />
                            description:
                            <asp:Label ID="ItemdescriptionLabel" runat="server" Text='<%# Eval("Itemdescription") %>' />
                            <br />
                            Capacity:
                            <asp:Label ID="itemCapacityLabel" runat="server" Text='<%# Eval("itemCapacity") %>' />
                            <br />
                            color:
                            <asp:Label ID="itemcolorLabel" runat="server" Text='<%# Eval("itemcolor") %>' />
                            <br />
                          
                            Category:
                            <asp:Label ID="itemCategoryLabel" runat="server" Text='<%# Eval("itemCategory") %>' />
                            <br />
                            
                            <br />
                          
                            
                                    </div>
                            <div class="card-footer">
                            <asp:LinkButton class="btn btn-success w-100" ID="LinkButton2" runat="server">BOOK NOW</asp:LinkButton>
                                </div>
                                </div>

                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureDatabaseConnectionString2 %>" SelectCommand="SELECT * FROM [AdventureItemDetailView] WHERE ([AdventureItemid] = @AdventureItemid)">
                        <SelectParameters>
                            <asp:SessionParameter Name="AdventureItemid" SessionField="itemid" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </asp:View>
        </asp:MultiView> </div>

   
</asp:Content>
