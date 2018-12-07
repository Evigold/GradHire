<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <link rel="stylesheet" runat="server" media="screen" href="~/css/style1.css" />
        <title>GradHire</title>
    </head>

    <body>
        <form id="form1" runat="server">
        <div style="margin:0 auto 0 auto; width:750px; padding-bottom:10px">
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

        <img src="images/logo.png" alt="GradHire" />

            <div class ="input">
                <asp:TextBox ID="keyword" runat="server" Height="22px" style="text-align: center; margin-left: 0px" Width="289px"></asp:TextBox>
                <asp:RadioButtonList ID="typeSelector" runat="server" Width="295px" style="font-size: medium; text-align: left">
                    <asp:ListItem Selected="True">internship</asp:ListItem>
                    <asp:ListItem>job</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Button ID="submit" runat="server" Height="26px" OnClick="submit_Click" style="text-align: center; margin-left: 123px" Text="Search" />
            </div>
         

        </form>
    </body>
</html>
