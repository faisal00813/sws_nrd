<%@ Control Language="C#" AutoEventWireup="true" CodeFile="generatereport.ascx.cs" Inherits="UserControls_generatereport" %>
 
<style type="text/css">
    .auto-style4 {
        width: 189px;
    }
    .auto-style5 {
        width: 248px;
    }
    .auto-style6 {
        width: 248px;
        height: 24px;
    }
    .auto-style8 {
        width: 189px;
        height: 24px;
    }
    .auto-style9 {
        width: 248px;
        height: 26px;
    }
    .auto-style11 {
        width: 189px;
        height: 26px;
    }
    .auto-style12 {
        width: 173px;
    }
    .auto-style13 {
        width: 173px;
        height: 26px;
    }
    .auto-style14 {
        width: 173px;
        height: 24px;
    }
</style>
 
<table style="height: 165px">
        <tr>
            <td class="auto-style5">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="Select Status"></asp:Label>
            </td>
            <td class="auto-style12">

            </td>
            <td class="auto-style4">
                <asp:DropDownList ID="DropDownList1" runat="server" style="margin-left: 0px" DataSourceID="SqlDataSource1" DataTextField="Field1" DataValueField="Field1">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Field1], [Field2], [Field4], [Field3], [Field5], [Field6], [Field7], [Field8], [Field9] FROM [GRIEVANCE]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
                </td>
            <td class="auto-style13">

            </td>
            <td class="auto-style11">
                </td>
        </tr>
        <tr>
            <td class="auto-style5">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Text="Select Section"></asp:Label>
            </td>
            <td class="auto-style12">

            </td>
            <td class="auto-style4">
                <asp:DropDownList ID="DropDownList2" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                &nbsp;</td>
            <td class="auto-style12">

            </td>
            <td class="auto-style4">               
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">
                
            </td>
            <td class="auto-style14">

                <asp:Button ID="Button1" runat="server" Height="34px" OnClick="Button1_Click" Text="Generate Report" Width="174px" />

            </td>
            <td class="auto-style8">                                                         
            </td>
        </tr>
      <tr>
          <td colspan="3">
              &nbsp;</td>
      </tr>
    </table>