<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ItemControl.ascx.cs" Inherits="Application.Controls.ItemControl" %>
<%@ Register Assembly="Application" Namespace="Application.ServerControls" TagPrefix="Tcontrol" %>

<div>
    <asp:Label runat="server" Text="Name"></asp:Label>
    <asp:TextBox runat="server" ID="txtName"></asp:TextBox>
</div>
<div>
    <asp:Label runat="server" Text="Cost"></asp:Label>
    <Tcontrol:CostTextbox runat="server" ID="txtCost" MinCost="29"></Tcontrol:CostTextbox>

 <%--   <script type="text/javascript">
            $("#<%=txtCost.ClientID%>").on("change", function (e) { console.log(e);});
    </script>--%>
</div>
<div>
    <asp:Label runat="server" Text="Description"></asp:Label>
    <asp:TextBox runat="server" ID="txtDescription"></asp:TextBox>
</div>
