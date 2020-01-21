<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="API.aspx.cs" Inherits="Application.TestAPI" %>

<%@ Register Assembly="Application" Namespace="Application.ServerControls" TagPrefix="Tcontrol" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>API</title>
    <link rel="stylesheet" href="/CSS/bootstrap.min.css" />
    <script src="/Scripts/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.tmpl.min.js" type="text/javascript"></script>
</head>
<body>
    <div>
       
        <h2>All Products</h2>
        <%--<ul id="products" />--%>
         <div id="results">
            <table>
                <tbody>
                </tbody>
            </table>
        </div>

        <div class="navPanel">
            <a href="#" id="firstPage" class="navBtn">Первая страница</a>
            <a href="#" id="prevPage" class="navBtn">&laquo;</a>
            <%--<div id="pageIndicator">Loading...</div>--%>
            <a id="pageIndicator">Loading...</a>
            <a href="#" id="nextPage" class="navBtn">&raquo;</a>
            <a href="#" id="lastPage" class="navBtn">Последняя страница</a>
        </div>

        <form id="form1" runat="server">
            <div>
                <asp:Label runat="server" Text="Name"></asp:Label>
                <asp:TextBox runat="server" ID="txtName"></asp:TextBox>
            </div>
            <div>
                <asp:Label runat="server" Text="Cost"></asp:Label>
                <Tcontrol:CostTextbox runat="server" ID="txtCost" MinCost="29"></Tcontrol:CostTextbox>
            </div>
            <div>
                <asp:Label runat="server" Text="Description"></asp:Label>
                <asp:TextBox runat="server" ID="txtDescription"></asp:TextBox>
            </div>
            <div>
                <asp:DropDownList runat="server" ID="productTypes" DataTextField="product_type" DataValueField="product_type_id">
                    <asp:ListItem Value="o" Selected="true">Select Type</asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Button runat="server" Text="Add" ID="addButton" />
        </form>
    </div>
    <div>
        <h2>Search by ID</h2>
        <input type="text" id="prodId" size="5" />
        <input type="button" value="Search" onclick="find();" />
        <p id="product" />
    </div>


    <script type="text/javascript">
        var serverURL = '<%=APIServerURL%>';
        var _page = 1;

        var _pageLen = <%=PageLen%>;
        var _pageCount = 0;

        $(window).on('load', function () {
            loadTemplates();
            loadData(1, _pageLen);

              $('#deleteButton').click(function (e) {
                        console.log(e);
                        var id = $(e.target).attr("productID");
                        if (confirm("Do you really want to delete product with ID = " + id)) {
                            deleteEntity(id);
                        }
                    });
            $('#firstPage').click(function () {
                loadData(1, _pageLen);
            });

            $('#prevPage').click(function () {
                if (_page == 1)
                    alert("It's a first page!");
                else
                    loadData(_page - 1, _pageLen);
            });

            $('#nextPage').click(function () {
                if (_page == _pageCount + 1)
                    alert("No more pages!");
                else
                    loadData(_page + 1, _pageLen);
            });

            $('#lastPage').click(function () {
                loadData(_pageCount, _pageLen);
            });

        });

        function loadTemplates() {
            $.get("Templates/ItemTemplate.html", function f(data) {
                $.template("productItem", data);
            });
        }

        function loadData(page, pageLen) {
            var url = serverURL + "/api/Products?";

            $("#results>table>tbody").html("");

            _page = page;

            if (page)
                url += "page=" + page + "&";
            if (pageLen)
                url += "pageLen=" + pageLen + "&";

            $.getJSON(url)
                .done(function (obj) {
                    _pageCount = obj.PageCount;
                    $("#pageIndicator").html(_page + " of " + _pageCount);
                    //$.tmpl("productItem", obj.Page).appendTo($('#products'));
                    $.tmpl("productItem", obj.Page).appendTo($("#results>table>tbody"));


                    //$("a").click(function (e) {
                    //    console.log(e);
                    //    var id = $(e.target).attr("productID");
                    //    if (confirm("Do you really want to delete product with ID = " + id)) {
                    //        deleteEntity(id);
                    //    }
                    //});

                    //$.each(data, function (key, item) {
                    //    $('<li>', { text: formatItem(item) }).appendTo($('#products'));
                    //});
                });
        }

        function deleteEntity(id) {
            $.ajax({
                url: serverURL + "/api/Products?id=" + id,
                type: 'DELETE',
                success: function (result) {
                    console.log("deleted " + id);
                    location.reload();
                }
            });
        }

        function find() {
            var id = $('#prodId').val();
            $.getJSON(serverURL + "/api/Products/" + id)
                .done(function (data) {
                    $.tmpl("productItem", data).appendTo($('#product'));
                    //$.each(data, function (key, item) {
                    //    $('#product').text(formatItem(item));
                    //});
                })
                .fail(function (jqXHR, textStatus, err) {
                    $('#product').text('Error: ' + err);
                });
        }
    </script>
</body>
</html>


<%--<section class="lattest-product-area pb-40 category-list">
     <div class="row">
         <div class="col-lg-4 col-md-6">
             <div class="single-product">
                 <div class="product-details">
                     <h6>addidas New Hammer sole
		//						for Sports person</h6>
                     <div class="price">
                         <h6>$150.00</h6>
                     </div>
                     <div class="prd-bottom">
                         <a href = "#" class="social-info">
                             Delete
                         </a>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </section>--%>