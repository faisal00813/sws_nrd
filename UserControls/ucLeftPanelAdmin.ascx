<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucLeftPanelAdmin.ascx.cs" Inherits="UserControls_ucLeftPanelAdmin" %>
<style type="text/css">
    .auto-style1 {
        height: 19px;
    }
    .auto-style2 {
        height: 23px;
    }
</style>
<p>
    <br />
</p>
<table style="width: 100%;vertical-align:top;text-align:left">
    <tr>
        <td>
          
            <a href="RequestedGrievance.aspx"><asp:Button ID="Button1" runat="server" Text="Requested Grievances" Width="159px" OnClick="Button1_Click" Height="40px" CssClass="abutton" />
            </a></td>

    </tr>
    <tr>
        <td>
          
            <a href="AdminAcceptedGrievance.aspx"> <asp:Button ID="Button2" runat="server" Text="SWS Grievances" Width="159px" OnClick="Button2_Click" Height="40px" CssClass="abutton" />
            </a></td>

    </tr>
    
    <tr>
        <td>
           
            <a href="RequestedGrievance.aspx"><asp:Button ID="Button3" runat="server" Text="Change Password" Width="159px" OnClick="Button3_Click1" Height="40px" CssClass="abutton" />
            </a></td>

    </tr>
    <tr>
        <td>
            <a href="RequestedGrievance.aspx"><asp:Button ID="Button4" runat="server" Text="Manage Users" Width="159px" OnClick="Button4_Click" Height="40px" CssClass="abutton" />
            </a></td>

    </tr>
    <tr>
        <td>
         
            <a href="RequestedGrievance.aspx"><asp:Button ID="Button5" runat="server" Text="Show Contact Details" Width="159px" OnClick="Button5_Click" Height="40px" CssClass="abutton" />
            </a></td>

    </tr>
 

    <tr>
        <td>

            <asp:Button ID="Button6" runat="server" Height="40px" Text="Report" Width="161px" OnClick="Button6_Click" CssClass="abutton" />

        </td>
    </tr>
 



 
</table>