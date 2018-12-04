<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" runat="server" media="screen" href="~/css/style1.css" />
    <title>GradHire</title>

</head>
<body>
    <form id="form1" runat="server">
    <img src="images/logo.png" alt="GradHire" />
        
        <p>
            <asp:TextBox ID="keyword" runat="server" Height="22px" style="text-align: center; margin-left: 0px" Width="289px"></asp:TextBox>
            <asp:RadioButtonList ID="typeSelector" runat="server" Width="295px">
                <asp:ListItem Selected="True">internship</asp:ListItem>
                <asp:ListItem>job</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Button ID="submit" runat="server" Height="26px" OnClick="submit_Click" style="text-align: center; margin-left: 123px" Text="Button" />
        </p>
        <asp:GridView ID="DisplayJobs" runat="server">
        </asp:GridView>
    </form>
    </body>
</html>
