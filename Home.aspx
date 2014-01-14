<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageNew.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ Register src="UserControls/ucKnowYourStatus.ascx" tagname="ucKnowYourStatus" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 
   
 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SWSDBConnectionString %>" SelectCommand="SELECT [EmpName], [EmpFHName], [Designation], [Station], [Subject], [MarkedSection], [SWSNumber], [DeptReplyLetter], [ActionTaken], [Status] FROM [Grievance]" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
 
    <uc1:ucKnowYourStatus ID="ucKnowYourStatus1" CanAddNewGrievance="false" CanExportGrievances="false" CanEditGrievance="false" runat="server" />
 
</asp:Content>

