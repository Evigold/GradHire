<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listing.aspx.cs" Inherits="Listing" %>
<%@ PreviousPageType VirtualPath="~/home.aspx" %> 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" runat="server" media="screen" href="~/css/style1.css" />
    <title>GradHire</title>

</head>
<body>
    <form id="form1" runat="server">
            <div style="margin:0 auto 0 auto; width:750px;padding-bottom:10px">

            <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" StaticSubMenuIndent="10px" Orientation="Horizontal" Width="750px">
            <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle BackColor="#B5C7DE" />
            <DynamicSelectedStyle BackColor="#507CD1" />
            <Items>
                <asp:MenuItem NavigateUrl="~/home.aspx" Text="Home" Value="Home"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/CreateStudent.aspx" Text="Create Profile" Value="Create Profile"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/CompanyStats.aspx" Text="Statistics" Value="Statistics"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Listing.aspx" Text="Listing" Value="Listing"></asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle BackColor="#507CD1" />
        </asp:Menu>

        </div>
        <h1 id = "listingHeader" runat ="server"></h1>
        <div class="display">
            <asp:Label ID="filterLabel" runat="server" Text="Filter by: "></asp:Label>
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
            <asp:GridView ID="DisplayListing" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" style="text-align: center" HorizontalAlign="Center" Font-Size="Small">
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
    <h1 id ="resultsHeader" runat ="server"></h1>
    </form>
</body>
</html>
