<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdminNew.master" AutoEventWireup="true" CodeFile="AdminAcceptedGrievance.aspx.cs" Inherits="Admin_AdminAcceptedGrievance" %>

<%@ Register src="../UserControls/ucKnowYourStatus.ascx" tagname="ucKnowYourStatus" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
    <uc1:ucKnowYourStatus ID="ucKnowYourStatus1" runat="server" CanExportGrievances="true" CanEditGrievance="true" CanAddNewGrievance="true" />
   
</asp:Content>

