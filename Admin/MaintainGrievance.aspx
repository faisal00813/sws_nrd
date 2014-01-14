<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageAdminNew.master" AutoEventWireup="true" CodeFile="MaintainGrievance.aspx.cs" Inherits="Admin_MaintainGrievance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        input {
            width: 300px;
        }
    </style>
    <table>
        <tr>
            <td>
                <asp:Label ID="Label9" Text="SWS Number" runat="server"></asp:Label>

            </td>
            <td></td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxSWSNumber"></asp:TextBox>
                <asp:Label ID="LabelLastSWSNumber" runat="server">Last SWS Number: </asp:Label>
                <asp:TextBox runat="server" ID="TextBoxLastSWSNumber" TabIndex="-1" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" Text="Name" runat="server"></asp:Label>

            </td>
            <td></td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxName"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" Text="Father/ Husband Name" runat="server"></asp:Label>

            </td>
            <td></td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxFHName"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" Text="Designation" runat="server"></asp:Label>

            </td>
            <td></td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxDesignation"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" Text="Station" runat="server"></asp:Label>

            </td>
            <td></td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxStation"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" Text="Mobile Number" runat="server"></asp:Label>

            </td>
            <td></td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxMobileNumber"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" Text="Email" runat="server"></asp:Label>

            </td>
            <td></td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxEmail"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label10" Text="Marked Section" runat="server"></asp:Label>

            </td>
            <td></td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxMarkedSection"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label11" Text="Letter Ref. Number" runat="server"></asp:Label>

            </td>
            <td></td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxLetterRefNumber"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" Text="Letter Date" runat="server"></asp:Label>

            </td>
            <td></td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxLetterDate"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label13" Text="SWS Date" runat="server"></asp:Label>

            </td>
            <td></td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxSWSDate"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" Text="Subject" runat="server"></asp:Label>

            </td>
            <td></td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxSubject" TextMode="MultiLine" Height="69px" Width="295px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label14" Text="Action Taken" runat="server"></asp:Label>

            </td>
            <td></td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxActionTaken" TextMode="MultiLine" Height="69px" Width="295px"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label8" Text="Upload Reply Letter" runat="server"></asp:Label>
            </td>
            <td></td>
            <td class="auto-style1">
                <asp:FileUpload ID="FileUploader" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label15" Text="Status" runat="server"></asp:Label>
            </td>
            <td></td>
            <td class="auto-style1">
               <asp:DropDownList runat="server" ID="DroDownListStatus" Width="295px">
                   <asp:ListItem Selected="True" Value="PENDING">Pending</asp:ListItem>
                   <asp:ListItem Value="FINAL">Final</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
                <asp:Button ID="ButtonRegister" Width="120" Text="Save Above" runat="server" OnClick="ButtonRegister_Click" />
                &nbsp;
                <asp:Button ID="ButtonReset" Width="120" Text="Add New" runat="server" OnClick="ButtonReset_Click" />

            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label Text="" ID="LabelMessage" ForeColor="Red" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSourceGrievance" runat="server" ConnectionString="<%$ ConnectionStrings:SWSDBConnectionString %>" SelectCommand="SELECT [GrievanceID], [EmpName], [EmpFHName], [Designation], [Station], [Subject], [MobileNumber], [Email], [Status], [ActionTaken], [DeptReplyLetter], [LetterDate], [LetterRefNumber], [SWSDate], [SWSNumber], [MarkedSection] FROM [Grievance]"></asp:SqlDataSource>
</asp:Content>

