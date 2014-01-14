<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdminNew.master" AutoEventWireup="true" CodeFile="AdminSWSStatus.aspx.cs" Inherits="Admin_AdminSWSStatus" %>

<%@ Register src="../UserControls/ucKnowYourStatus.ascx" tagname="ucKnowYourStatus" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ucKnowYourStatus ID="ucKnowYourStatus1" runat="server" />
</asp:Content>

