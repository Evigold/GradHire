<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MakeStudent.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" runat="server" media="screen" href="~/css/style2.css" />
    <title>Adding a student</title>
</head>
<body>

    <form id="form1" runat="server">
    <title>Adding a student</title>
        <img src="images/logo.png" alt="GradHire" />
        <p>
            &nbsp;</p>
        <p>
            Student Name (First M Last):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Name" runat="server" Width="415px"></asp:TextBox>
        </p>
        <p>
            School Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="school_name" DataValueField="id" Width="426px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [SCHOOLS]"></asp:SqlDataSource>
        </p>
        <p>
            Expected Graduation Date (YYYY-MM-DD):<asp:TextBox ID="Date" runat="server" style="margin-right: 0px" Width="398px"></asp:TextBox>
        </p>
        <p>
            Past Experiance:</p>
        <p>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
            </asp:DropDownList>
        </p>
        <asp:Button ID="Button1" runat="server" Text="Submit" />
    </form>
</body>
</html>
