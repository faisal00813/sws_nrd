<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="RequestedGrievance.aspx.cs" Inherits="Admin_RequestedGrievance" %>

<%@ Register src="../UserControls/ucRequestedGrievances.ascx" tagname="ucRequestedGrievances" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:ucRequestedGrievances ID="ucRequestedGrievances1" runat="server" />

</asp:Content>

