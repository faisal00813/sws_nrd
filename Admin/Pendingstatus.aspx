<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdminNew.master" AutoEventWireup="true" CodeFile="Pendingstatus.aspx.cs" Inherits="Admin_Pendingstatus" %>

<%@ Register src="../UserControls/generatereport.ascx" tagname="generatereport" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:generatereport ID="generatereport1" runat="server" />
</asp:Content>

