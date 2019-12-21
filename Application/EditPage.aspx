<%@ Page Async="true" Language="C#" AutoEventWireup="true" CodeBehind="EditPage.aspx.cs" Inherits="Application.EditPage" %>

<%@ Register Src="~/Controls/ItemControl.ascx" TagName="ItemControl" TagPrefix="Titem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="/Scripts/jquery-3.4.1.min.js" type="text/javascript"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <Titem:ItemControl ID="itemEditor" runat="server" />
        <asp:Label ID="test" runat="server"></asp:Label>
        <asp:Button runat="server" Text="Save" ID="btnSave" />
        <button id="buttonSave1">Save (ajax)</button>
        <asp:Button runat="server" Text="Cancel" ID="btnCancel" />
    </form>

    <script type="text/javascript">
        var serverURL = '<%=APIServerURL%>';

        $("#buttonSave1").click(function () {
            var product = new Object();
            product.product_id = <%=ID%>;
            product.product_name = $('#itemEditor_txtName').val();
            product.cost = $('#itemEditor_txtCost').val();
            product.description = $('itemEditor_txtDescription').val();
            if (product != null) {
                $.ajax({
                    type: "POST",
                    url: serverURL + "/api/Products",
                    data: JSON.stringify(product),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        console.log('Data received: ');
                        console.log(response);
                        window.location.href = 'MainPage.aspx';
                    },
                    failure: function (response) {
                        console.log('fail');
                        alert('failure' + response.responseText);
                    },
                    error: function (response) {
                        console.log('error');
                        alert(response.responseText);
                    }
                });

            }

        });
    </script>
</body>
</html>
