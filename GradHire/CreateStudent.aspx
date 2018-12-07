<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateStudent.aspx.cs" Inherits="CreateStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" runat="server" media="screen" href="~/css/style3.css" />
    <title>Adding a student</title>
</head>
<body>

    <form id="form1" runat="server">
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
        <img src="images/logo.png" alt="GradHire" />

        <div class="outer">

            <div class ="inner">
                            <asp:Label runat="server" Text="" style="font-size: medium">Student Name (First M Last):</asp:Label><br />
            <asp:TextBox ID="Name" runat="server" Width="300px"></asp:TextBox><br />

            <asp:Label runat="server" Text="" style="font-size: medium">School Name:</asp:Label> <br />
            <asp:DropDownList ID="SchoolDDL" runat="server" DataSourceID="SqlDataSource1" DataTextField="school_name" DataValueField="id" Width="300px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [SCHOOLS]"></asp:SqlDataSource>
            <br />
            <asp:Label runat="server" Text="" style="font-size: medium">Expected Graduation Date (YYYY-MM-DD):</asp:Label><br />
            <asp:TextBox ID="Date" runat="server" style="margin-right: 0px" Width="300px"></asp:TextBox><br />
        
            <br /><br />
      
            <asp:Label runat="server" Text="" style="font-size: medium">Past Experience:</asp:Label>
            <asp:DropDownList ID="ExpDDL" runat="server" AutoPostBack="True">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
            </asp:DropDownList>

            <asp:Button ID="Submit" runat="server" Text="Submit" OnClick ="Submit_OnClick"/>
            </div>
        </div>
        
    </form>
</body>
</html>
