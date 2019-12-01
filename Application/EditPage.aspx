<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditPage.aspx.cs" Inherits="Application.EditPage" %>

<%@ Register Src="~/Controls/ItemControl.ascx" TagName="ItemControl" TagPrefix="Titem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <Titem:ItemControl ID="itemEditor" runat="server" />
        <asp:Label ID="test" runat="server"></asp:Label>
        <asp:Button runat="server" Text="Save" ID="btnSave" />
        <asp:Button runat="server" Text="Cancel" ID="btnCancel" />
    </form>
</body>
</html>