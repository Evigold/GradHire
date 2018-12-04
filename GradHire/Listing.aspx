<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listing.aspx.cs" Inherits="Listing" %>
<%@ PreviousPageType VirtualPath="~/home.aspx" %> 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="DisplayListing" runat="server">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
