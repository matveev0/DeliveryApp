<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Application.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      
        <asp:DataGrid ID="dbProducts" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundColumn DataField="ProductName" HeaderText="Product name"></asp:BoundColumn>
                <asp:BoundColumn DataField="Cost" HeaderText="Cost"></asp:BoundColumn>
                <asp:BoundColumn DataField="Description" HeaderText="Description"></asp:BoundColumn>
                <%--/<asp:ButtonColumn Text="Edit" CommandName="Edit" ></asp:ButtonColumn>--%>
            </Columns>
        </asp:DataGrid>

        <asp:Repeater ID="rpt" runat="server">
            <HeaderTemplate>
                <table>
                    <thead>
                        <tr>
                            <th>ProductName
                            </th>
                            <th>Cost
                            </th>
                            <th>Description
                            </th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem, "ProductName") %>               

                    </td>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem, "Cost") %>
                    </td>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem, "Description") %>
                    </td>
                     <td>
                        <a href="EditPage.aspx?ID=<%# DataBinder.Eval(Container.DataItem, "ID") %>">Edit Product</a>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
	</table>
            </FooterTemplate>
        </asp:Repeater>
    </form>


    <hr />
    <div class="block">


        <asp:Repeater ID="rpt2" runat="server">
            <ItemTemplate>
                <form <%--action="/addBasket?id=${item.productId}" method="post"--%>>
                    <div class="top">
                        <strong>
                            <%# DataBinder.Eval(Container.DataItem, "ProductName") %>
            
                     DETAILS 
                        </strong>
                    </div>
                    <div class="middle">
                        IMAGE
                <%-- IMAGE --%>
                    </div>
                    <div class="bottom">
                        <strong>
                            <div>
                                <%# DataBinder.Eval(Container.DataItem, "Cost") %>
            
                                COST
                        <%-- COST --%>₽
                            </div>
                        </strong>
                        <div class="info">
                            <div class="number">
                                <span class="minus">-</span>
                                <input type="text" class="quantity" id="count" name="count" value="1" size="5" />
                                <span class="plus">+</span>
                            </div>
                        </div>

                        <div class="style">
                            ADD TO ORDER
                    <%-- ADD TO ORDER --%>
                        </div>
                    </div>
                </form>
            </ItemTemplate>

        </asp:Repeater>

        <form <%--action="/addBasket?id=${item.productId}" method="post"--%>>
            <div class="top">
                <strong>DETAILS
                    <%-- DETAILS --%>
                </strong>
            </div>
            <div class="middle">
                IMAGE
                <%-- IMAGE --%>
            </div>
            <div class="bottom">
                <strong>
                    <div>
                        COST
                        <%-- COST --%>₽
                    </div>
                </strong>
                <div class="info">
                    <div class="number">
                        <span class="minus">-</span>
                        <input type="text" class="quantity" id="count" name="count" value="1" size="5" />
                        <span class="plus">+</span>
                    </div>
                </div>

                <div class="style">
                    ADD TO ORDER
                    <%-- ADD TO ORDER --%>
                </div>
            </div>
        </form>
    </div>


</body>
</html>
