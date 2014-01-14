<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdminNew.master" AutoEventWireup="true" CodeFile="ShowAdminUser.aspx.cs" Inherits="Admin_ShowAdminUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td colspan="2" style="text-align: right">
                <asp:LinkButton ID="LinkButtonAddNew" OnClick="LinkButtonAddNew_Click" runat="server">Add New User</asp:LinkButton></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="LabelMessage" runat="server"></asp:Label></td>
        </tr>
        
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewUser" Width="800px" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand" runat="server"
                    AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlDataSourceUser" CssClass="kysGrid">
                    <Columns>
                        <asp:TemplateField HeaderText="Edit" Visible="false">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButtonEdit" runat="server"
                                    CommandArgument='<%# Eval("UserID") %>' CommandName="Edit">Edit</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete" Visible="false">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButtonDelete" runat="server"
                                    CommandArgument='<%# Eval("UserID") %>' CommandName="delete">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="UserName" HeaderText="UserName" ItemStyle-Width="50" SortExpression="UserName" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
                        <asp:TemplateField HeaderText="Super Admin" SortExpression="IsSuperAdmin">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxIsSuperAdmin" runat="server" Enabled="false"
                                    Checked='<%# Eval("IsSuperAdmin") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
            </td>
        </tr>
    </table>

    <asp:SqlDataSource ID="SqlDataSourceUser" runat="server" ConnectionString="<%$ ConnectionStrings:SWSDBConnectionString %>" SelectCommand="SELECT [UserID], [UserName], [Name], [Designation], [IsSuperAdmin] FROM [AdminUser]"></asp:SqlDataSource>

</asp:Content>

