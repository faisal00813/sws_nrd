<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucKnowYourStatus.ascx.cs" Inherits="UserControls_ucKnowYourStatus" %>
<table>
    <tr>
        <td style="text-align:left;width:150px">Enter SWS Number</td>
        <td style="text-align:left">
            <asp:TextBox ID="TextBoxSWSNumber" runat="server">     </asp:TextBox>
            <asp:Button Text="Search" runat="server" ID="ButtonSearch" OnClick="ButtonSearch_Click" CssClass="abutton" ></asp:Button>
        </td>
        
    </tr>
    <tr>
        <td colspan="2" style="text-align:right">
            <br />
            <asp:LinkButton ID ="LinkButtonExport" runat="server" OnClick="LinkButtonExport_Click">Export All Grievances To Excel</asp:LinkButton>
            <asp:LinkButton ID ="LinkButtonAddNewGrievance" runat="server" OnClick="LinkButtonAddNewGrievance_Click">Add New Grievance</asp:LinkButton></td>
    </tr>
    <tr>
        <td colspan="2"><asp:Label ID="LabelMessage" runat="server"></asp:Label>&nbsp; </td>
        </tr>
    <tr>
        <td colspan="2">
            <asp:GridView ID="GridView1" Width="900px" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="GrievanceID" DataSourceID="SqlDataSource1" PageSize="6" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="kysGrid">
                <Columns>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonEdit" runat="server"
                                CommandArgument='<%# Eval("GrievanceID") %>' CommandName="Edit">Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete" Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonDelete" runat="server" OnClientClick="javascript:return confirm('Are you sure you want to delete this record?')"
                                CommandArgument='<%# Eval("GrievanceID") %>' CommandName="delete">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="SWSNumber" HeaderText="SWSNumber" SortExpression="SWSNumber" />
                    <asp:BoundField DataField="SWSDate" HeaderText="SWSDate" SortExpression="SWSDate" />
                    <asp:BoundField DataField="EmpName" HeaderText="EmpName" SortExpression="EmpName"/>
                    <asp:BoundField DataField="EmpFHName" HeaderText="EmpFHName" SortExpression="EmpFHName" />
                    <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
                    <asp:BoundField DataField="Station" HeaderText="Station" SortExpression="Station" />
                    <asp:BoundField DataField="Subject" HeaderText="Subject"  SortExpression="Subject" />
                    <asp:BoundField DataField="MarkedSection" HeaderText="MarkedSection" SortExpression="MarkedSection" />
                    <asp:BoundField DataField="ActionTaken" HeaderText="ActionTaken" SortExpression="ActionTaken" ItemStyle-Width="9" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:TemplateField HeaderText="DeptReplyLetter" SortExpression="DeptReplyLetter">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDownload" runat="server"
                                CommandArgument='<%# Eval("DeptReplyLetter") %>' CommandName="cmd">Download Reply Letter</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
        </td>
    </tr>
</table>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SWSDBConnectionString %>" SelectCommand="SELECT [EmpName], [GrievanceID], [EmpFHName], [Designation], [Station], [Subject], [SWSNumber], [MarkedSection], [SWSDate], [ActionTaken], [Status], [DeptReplyLetter] FROM [Grievance] order by createddate desc"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SWSDBConnectionString %>" SelectCommand="SELECT [GrievanceID], [EmpName], [EmpFHName], [Designation], [Station], [MarkedSection], [SWSNumber], [DeptReplyLetter], [ActionTaken], [Status] FROM [Grievance]  order by createddate desc"></asp:SqlDataSource>

