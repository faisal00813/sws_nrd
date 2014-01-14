<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageNew.master" AutoEventWireup="true" CodeFile="RegisterGrievance.aspx.cs" Inherits="RegisterGrievance" %>
<%@ Register Src="~/UserControls/ucRegisterGrievance.ascx" TagName="ucRegisterGrievance" TagPrefix="uc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SWSDBConnectionString %>" SelectCommand="SELECT [EmpName], [EmpFHName], [Designation], [Station], [MobileNumber], [Email], [Subject], [EmpRequestLetter] FROM [GrievanceOnlineRequest]"></asp:SqlDataSource>
    <uc2:ucRegisterGrievance ID="ucRegisterGrievance1" runat="server" />

</asp:Content>

