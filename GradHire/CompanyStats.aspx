<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CompanyStats.aspx.cs" Inherits="CompanyStats" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<head runat="server">
    <link rel="stylesheet" runat="server" media="screen" href="~/css/style3.css" />

    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <div style="margin:0 auto 0 auto; width:750px;">
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
        <h1 class="auto-style1">
            GradHire Statistics
        </h1>

        <div class="parent">

            <div class="child">    
                <asp:SqlDataSource ID="CompanySelection" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [cname], [id] FROM [COMPANY]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="JobsDistribution" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT job_title, COUNT(*) AS amount
FROM COMPANY AS c, JOBS AS j
WHERE cid = c.id
AND cid = @id
GROUP BY (job_title)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="CompanyDDL" Name="id" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Chart ID="DistByCompany" runat="server" DataSourceID="JobsDistribution" BackColor="Transparent">
                    <Series>
                        <asp:Series ChartType="Pie" Name="Series1" XValueMember="job_title" YValueMembers="amount" CustomProperties="PieLabelStyle=Disabled">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1"
                                         BackColor="#FFE5D4" 
             BorderDashStyle="Solid" 
             BorderWidth="20" 
             BorderColor="#FFE5D4">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
            <div class="child">
                        <div>
  
            <p>

                <asp:Label runat="server" Text="">Jobs By Company &nbsp&nbsp&nbsp</asp:Label>
            <asp:DropDownList ID="CompanyDDL" runat="server" AutoPostBack="True" DataSourceID="CompanySelection" DataTextField="cname" DataValueField="id" OnSelectedIndexChanged ="CompanyDDL_SelectedIndexChanged">
            </asp:DropDownList>
            </p>
            
            </div>
                <ul>
                    <li>Average Salary: <asp:Label ID="salaryAvg" runat="server" Text=""></asp:Label></li>
                    <li>Earliest Application Due: <asp:Label ID="earlyApp" runat="server" Text=""></asp:Label></li>
                    <li>Number of Jobs Offered: <asp:Label ID="jobsOffered" runat="server" Text=""></asp:Label></li>
                    <li>Number of Internships Offered: <asp:Label ID="internsOffered" runat="server" Text=""></asp:Label></li>
                </ul>            
            </div>
        </div>

    </form>
</body>
</html>
