<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Admin_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td colspan="2" style="text-align:center">
                <asp:Label ID="LabelMessage" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:right">
                User Name
            </td>
            <td style="text-align:left">
                <asp:TextBox ID="TextBoxUserName" runat="server" ReadOnly="true" Enabled="false" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align:right">
               Current Password
            </td>
            <td style="text-align:left">
                <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align:right">
                New Password
            </td>
            <td style="text-align:left">
                <asp:TextBox ID="TextBoxNewPassword" runat="server" TextMode="Password" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align:right">
                Confirm Password
            </td>
            <td style="text-align:left">
                <asp:TextBox ID="TextBoxConfirmPassword" runat="server" TextMode="Password" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align:right">
               
                <asp:SqlDataSource ID="SqlDataSourceUser" runat="server" ConnectionString="<%$ ConnectionStrings:SWSDBConnectionString %>" SelectCommand="SELECT [UserID], [UserName], [Password], [Name], [Designation], [IsSuperAdmin] FROM [AdminUser]"></asp:SqlDataSource>
               
            </td>
            <td style="text-align:left">
                <asp:Button ID="ButtonChangePassword" Text="Change Password" runat="server" OnClick="ButtonChangePassword_Click" ></asp:Button>
            </td>
        </tr>
    </table>
</asp:Content>

