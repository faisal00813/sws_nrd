<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdminNew.master" AutoEventWireup="true" CodeFile="ShowContacts.aspx.cs" Inherits="Admin_ShowContacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 322px; text-align:left ">
    
        <br />

        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Registered Contact Details"></asp:Label>

        <asp:Button ID ="ButtonExport"  runat ="server" Text="Export to MS-Excel" OnClick="ButtonExport_Click"/>
        <br />
        <asp:label ID="LabelMessage" runat ="server"  ></asp:label>
        <asp:GridView ID="GridView1" Width ="100%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand">
            <Columns>
               
                    <asp:TemplateField HeaderText="Delete" >
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonDelete" runat="server"
                                CommandArgument='<%# Eval("EmpID") %>' CommandName="delete" OnClientClick="javascript:return confirm('Are you sure you want to delete this record?')">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                <asp:BoundField DataField="EmpName" HeaderText="EmpName" SortExpression="EmpName" />
                <asp:BoundField DataField="EmpFHName" HeaderText="EmpFHName" SortExpression="EmpFHName" />
                <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
                <asp:BoundField DataField="Station" HeaderText="Station" SortExpression="Station" />
                <asp:BoundField DataField="MobileNumber" HeaderText="MobileNumber" SortExpression="MobileNumber" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:TemplateField>

                    <ItemTemplate>


                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SWSDBConnectionString %>" SelectCommand="SELECT [EmpID], [EmpName], [EmpFHName], [Designation], [Station], [MobileNumber], [Email] FROM [EmpContactDetail]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SWSDBConnectionString %>" SelectCommand="SELECT * FROM [AdminUser]" ></asp:SqlDataSource>

    </div>
</asp:Content>

