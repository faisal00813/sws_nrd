<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="MaintainUser.aspx.cs" Inherits="Admin_MaintainUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="LabelMessage" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">User Name
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBoxUserName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">Password
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">Confirm Password
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBoxConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">Name
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBoxName" runat="server" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">Designation
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBoxDesignation" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">

                <asp:SqlDataSource ID="SqlDataSourceUser" runat="server" ConnectionString="<%$ ConnectionStrings:SWSDBConnectionString %>" SelectCommand="SELECT [UserID], [UserName], [Password], [Name], [Designation], [IsSuperAdmin] FROM [AdminUser]"></asp:SqlDataSource>

            </td>
            <td style="text-align: left">
                <asp:Button ID="ButtonSave" Text="Save" runat="server" OnClick="ButtonSave_Click"></asp:Button>
            </td>
        </tr>
    </table>
</asp:Content>

