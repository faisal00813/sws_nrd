<%@ Page Language="C#" AutoEventWireup="true" CodeFile="smsrec.aspx.cs" Inherits="smsrec" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
<asp:SqlDataSource ID="SqlDataSourceGrievance" runat="server"
     ConnectionString="<%$ ConnectionStrings:SWSDBConnectionString %>" 
    SelectCommand="SELECT [EmpName], [EmpFHName], [Designation], [Station],
     [MobileNumber], [Email], [Subject], [EmpRequestLetter] 
    FROM [GrievanceOnlineRequest]"></asp:SqlDataSource>
    </form>
</body>
</html>
