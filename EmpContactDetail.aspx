<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="EmpContactDetail.aspx.cs" Inherits="EmpContactDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 346px;
        }
        .auto-style3 {
            width: 81px;
        }
        .auto-style4 {
            width: 260px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <br />
                <br />
                <br />
        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Contact Details "></asp:Label>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style4">

                &nbsp;</td>
            <td class="auto-style3"></td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
            <asp:Label ID="Label1" runat="server" Text="Employee Name"></asp:Label> </td>
            <td class="auto-style3"></td>
            <td class="auto-style2">
    
          
           

        <asp:TextBox ID="TextBoxName" runat="server" Width="211px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">


            <asp:Label ID="Label3" runat="server" Text="Employee Father/Husband Name"></asp:Label>


            </td>
            <td class="auto-style3"></td>
            <td class="auto-style2">
    

        <asp:TextBox ID="TextBoxFHName" runat="server" Width="211px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">


            <asp:Label ID="Label4" runat="server" Text="Designation"></asp:Label>


            </td>
            <td class="auto-style3"></td>
            <td class="auto-style2">
    

        <asp:TextBox ID="TextBoxDesignation" runat="server" Width="211px"></asp:TextBox>
            </td>
        </tr>
            <tr>
            <td class="auto-style4">


            <asp:Label ID="Label5" runat="server" Text="Station"></asp:Label>


                </td>
            <td class="auto-style3"></td>
            <td class="auto-style2">
    

        <asp:TextBox ID="TextBoxStation" runat="server" Width="211px"></asp:TextBox>
                </td>
        </tr>
            <tr>
            <td class="auto-style4">


            <asp:Label ID="Label2" runat="server" Text="Mobile Number"></asp:Label>


                </td>
            <td class="auto-style3"></td>
            <td class="auto-style2">
    

        <asp:TextBox ID="TextBoxMobile" runat="server" Width="211px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style4">


            <asp:Label ID="Label6" runat="server" Text="Email ID"></asp:Label>


            </td>
            <td class="auto-style3"></td>
            <td class="auto-style2">
    

        <asp:TextBox ID="TextBoxEmail" runat="server" Width="211px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style3"></td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style3"></td>
            <td class="auto-style2">

            <asp:Label ID="LabelMessage" runat="server" Visible="false"></asp:Label>
              </td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style2">

        <asp:Button ID="Button1" runat="server" Text="Register" Width="100px" OnClick="Button1_Click" Height="40px" />
            &nbsp;&nbsp; <asp:Button ID="Button2" runat="server" Text="Reset" Width="100px" OnClick="Button2_Click" Height="40px" />

                <br />

            </td>
        </tr>
    
    
    </table>

    <asp:SqlDataSource ID="SqlDataSourceGrievance" runat="server"
        ConnectionString="<%$ ConnectionStrings:SWSDBConnectionString %>"
        SelectCommand="SELECT [EmpName], [EmpFHName], [Designation], [Station], [MobileNumber], [Email] FROM [EmpContactDetail]"></asp:SqlDataSource>

</asp:Content>

