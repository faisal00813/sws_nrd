<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucRequestedGrievances.ascx.cs" Inherits="UserControls_ucRequestedGrievances" %>
<asp:Label ID="LabelMessage" runat="server"></asp:Label>
<asp:GridView ID="GridView1" OnRowDataBound="GridView1_RowDataBound"
    OnRowCommand="GridView1_RowCommand" Width="1200px" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
    DataKeyNames="GrievanceOnlineRequestID" DataSourceID="SqlDataSource1" PageSize="10" CssClass="kysGrid">
    <Columns>
        <asp:TemplateField HeaderText="Accept">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButtonAccept" runat="server"
                    CommandArgument='<%# Eval("GrievanceOnlineRequestID") %>' 
                    CommandName="accept">Accept</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Reject">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButtonReject" runat="server"
                    CommandArgument='<%# Eval("GrievanceOnlineRequestID") %>' 
                    CommandName="reject">Reject</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="EmpName" HeaderText="EmpName" SortExpression="EmpName" />
        <asp:BoundField DataField="EmpFHName" HeaderText="EmpFHName" SortExpression="EmpFHName" />
        <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
        <asp:BoundField DataField="Station" HeaderText="Station" ItemStyle-Width="100" SortExpression="Station">

        </asp:BoundField>

        <asp:BoundField DataField="MobileNumber" HeaderText="MobileNumber" SortExpression="MobileNumber" />
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="Subject" HeaderText="Subject" ItemStyle-Width="300" SortExpression="Subject">

        </asp:BoundField>

        <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate" />
        <asp:TemplateField HeaderText="EmpRequestLetter" SortExpression="EmpRequestLetter">
            <ItemTemplate>
                <asp:LinkButton ID="lnkDownload" runat="server"
                    CommandArgument='<%# Eval("EmpRequestLetter") %>' CommandName="cmd">Download Request Letter</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>

</asp:GridView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SWSDBConnectionString %>" SelectCommand="SELECT [EmpName], [GrievanceOnlineRequestID], [EmpFHName], [Designation], [Station], [MobileNumber], [Email], [Subject], [CreatedDate], [EmpRequestLetter] FROM [GrievanceOnlineRequest]"></asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSourceAcceptReject" runat="server" ConnectionString="<%$ ConnectionStrings:SWSDBConnectionString %>" SelectCommand="SELECT * FROM [GrievanceOnlineRequest]"></asp:SqlDataSource>


