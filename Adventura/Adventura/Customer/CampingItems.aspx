<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="CampingItems.aspx.cs" Inherits="Adventura.Customer.CampingItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            
       <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="3" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
           <ItemTemplate>
               <div class="card cardd">
                   <div class="card-header crdhead">
               <asp:Image class="img-fluid" ID="Image2" runat="server"  ImageUrl='<%# "../itemimages/" + Eval("Citemimage") %>' />
                       </div>
               <div class="card-body">
               CitemName:
               <asp:Label ID="CitemNameLabel" runat="server" Text='<%# Eval("CitemName") %>' />
               
               Citemid:
               <asp:Label ID="CitemidLabel" runat="server" Text='<%# Eval("Citemid") %>' />
               
               rent:
               <asp:Label ID="rentLabel" runat="server" Text='<%# Eval("rent") %>' />
               
               per:
               <asp:Label ID="perLabel" runat="server" Text='<%# Eval("per") %>' />
               </div>
<br /> <div class="card-footer">
                        <asp:LinkButton class="btn btn-success w-100" ID="LinkButton1" runat="server">Rent</asp:LinkButton>
                            </div>
                   </div>
           </ItemTemplate>
       </asp:DataList>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureDatabaseConnectionString8 %>" 
           SelectCommand="SELECT [Citemimage], [CitemName], [Citemid], [rent], [per] FROM [View_camp]"></asp:SqlDataSource>

        </asp:View>
        <asp:View ID="View2" runat="server">

            <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="DataList2_ItemCommand">
                <ItemTemplate>
                    CitemName:
                    <asp:Label ID="CitemNameLabel" runat="server" Text='<%# Eval("CitemName") %>' />
                    <br />
                    Citemid:
                    <asp:Label ID="CitemidLabel" runat="server" Text='<%# Eval("Citemid") %>' />
                    <br />
                    rent:
                    <asp:Label ID="rentLabel" runat="server" Text='<%# Eval("rent") %>' />
                    <br />
                    per:
                    <asp:Label ID="perLabel" runat="server" Text='<%# Eval("per") %>' />
                    <br />
                    CitemQuantity:
                    <asp:Label ID="CitemQuantityLabel" runat="server" Text='<%# Eval("CitemQuantity") %>' />
                    <br />
                    renderid:
                    <asp:Label ID="renderidLabel" runat="server" Text='<%# Eval("renderid") %>' />
                    <br />
                    CitemCapacity:
                    <asp:Label ID="CitemCapacityLabel" runat="server" Text='<%# Eval("CitemCapacity") %>' />
                    <br />
                    Expr1:
                    <asp:Label ID="Expr1Label" runat="server" Text='<%# Eval("Expr1") %>' />
                    <br />
                    Citemcolor:
                    <asp:Label ID="CitemcolorLabel" runat="server" Text='<%# Eval("Citemcolor") %>' />
                    <br />
                    Citemimage:
                    <asp:Label ID="CitemimageLabel" runat="server" Text='<%# Eval("Citemimage") %>' />
                    <br />
                    <asp:Image ID="Image1" runat="server"  width="200px" ImageUrl ='<%# "../itemimages/"  +Eval("Citemimage") %>'/>
                    <br />
                    <div class="card-footer">
                            <asp:LinkButton class="btn btn-success w-100" ID="LinkButton2" runat="server">BOOK NOW</asp:LinkButton>
                                </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureDatabaseConnectionString %>" SelectCommand="SELECT * FROM [View_camp] WHERE ([Citemid] = @Citemid)">
                <SelectParameters>
                    <asp:SessionParameter Name="Citemid" SessionField="itemid" Type="Int64" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />

        </asp:View>
         <asp:View ID="View3" runat="server">
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
    </asp:MultiView>
</asp:Content>

