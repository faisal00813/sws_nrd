<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageNew.master" AutoEventWireup="true" CodeFile="ShowGrievance.aspx.cs" Inherits="ShowGrievance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SWSDBConnectionString %>" SelectCommand="SELECT [EmpName], [EmpFHName], [Designation], [Station], [Subject], [MarkedSection], [SWSNumber], [DeptReplyLetter], [ActionTaken], [Status] FROM [Grievance]"></asp:SqlDataSource>
</asp:Content>

