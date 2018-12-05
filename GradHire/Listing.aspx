<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listing.aspx.cs" Inherits="Listing" %>
<%@ PreviousPageType VirtualPath="~/home.aspx" %> 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" runat="server" media="screen" href="~/css/style1.css" />
    <title>GradHire</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>

    <h1 id = "listingHeader" runat ="server"></h1>

    <form id="form1" runat="server">
    <p class="filters">
        Filter by:
        <asp:DropDownList ID="filterDDL" runat="server" AutoPostBack="True" OnSelectedIndexChanged ="FilterDDL_SelectedIndexChanged">
            <asp:ListItem Value="0">--select filter--</asp:ListItem>
            <asp:ListItem Value="1">Company(A-Z)</asp:ListItem>
            <asp:ListItem Value="2">Company (Z-A)</asp:ListItem>
            <asp:ListItem Value="3">Experience (low to high)</asp:ListItem>
            <asp:ListItem Value="4">Experience (high to low)</asp:ListItem>
            <asp:ListItem Value="5">Start Date (low to high)</asp:ListItem>
            <asp:ListItem Value="6">Start Date (high to low)</asp:ListItem>
            <asp:ListItem Value="7">Salary (high to low)</asp:ListItem>
        </asp:DropDownList>

    </p>
        <div>
            <asp:GridView ID="DisplayListing" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" style="text-align: center">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
    </form>
    <h1 id ="resultsHeader" runat ="server">

    </h1>
    <p class="auto-style1">
        <a href="home.aspx">home </a>
    </p>
</body>
</html>
