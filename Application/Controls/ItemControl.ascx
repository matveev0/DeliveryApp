<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ItemControl.ascx.cs" Inherits="Application.Controls.ItemControl" %>

<div>
    <asp:label runat="server" text="Name"></asp:label>
    <asp:textbox runat="server" id="txtName"></asp:textbox>
</div>
<div>
    <asp:label runat="server" text="Cost"></asp:label>
    <asp:textbox runat="server" id="txtCost"></asp:textbox>
</div>
<div>
    <asp:label runat="server" text="Description"></asp:label>
    <asp:textbox runat="server" id="txtDescription"></asp:textbox>
</div>
