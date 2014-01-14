<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucRegisterGrievance.ascx.cs" Inherits="ucRegisterGrievance" %>
  
  <style type="text/css">
      .auto-style1 {
          width: 186px;
      }
      .auto-style2 {
          width: 445px;
      }
  </style>
  
  <table>
      <tr>
          <td class="auto-style2"></td>
      </tr>
      <tr>
          <td class="auto-style2">&nbsp;</td>
      </tr>
      <tr>
          <td class="auto-style2">
              <br />
              <asp:Label ID="Label9" runat="server" Font-Size="XX-Large" Text="Register Your Grievances Online" CssClass="text"></asp:Label>
              <br />
              <br />
          </td>
      </tr>
      <tr>
          <td class="auto-style2"></td>
      </tr>
      
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label1" Text="Name" runat="server" CssClass="text"></asp:Label>

            </td>
            <td>

            </td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxName"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label2" Text="Father/ Husband Name" runat="server" CssClass="text"></asp:Label>

            </td>
            <td>

            </td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxFHName"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label3" Text="Designation" runat="server" CssClass="text"></asp:Label>

            </td>
            <td>

            </td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxDesignation"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label4" Text="Station" runat="server" CssClass="text"></asp:Label>

            </td>
            <td>

            </td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxStation"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label5" Text="Mobile Number" runat="server" CssClass="text"></asp:Label>

            </td>
            <td>

            </td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxMobileNumber" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label6" Text="Email" runat="server" CssClass="text"></asp:Label>

            </td>
            <td>

            </td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxEmail"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label7" Text="Subject" runat="server" CssClass="text"></asp:Label>

            &nbsp;(Not more than 450 Letters)</td>
            <td>

            </td>
            <td class="auto-style1">
                <asp:TextBox runat="server" ID="TextBoxSubject" TextMode="MultiLine" Height="69px" Width="295px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label8" Text="Upload Your Application File" runat="server" CssClass="text"></asp:Label>
            </td>
            <td>

            </td>
            <td class="auto-style1">               
                <asp:FileUpload ID="FileUploader" runat="server" />               
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                
            </td>
            <td>

            </td>
            <td>               
                <br />
                <br />
                <asp:Button ID="ButtonRegister" Width="120" Text="Register" runat="server" OnClick="ButtonRegister_Click" CssClass="abutton" />  
                &nbsp;
                <asp:Button ID="ButtonReset" Width="120" Text="Reset" runat="server" OnClick="ButtonReset_Click" CssClass="abutton" />  
                             
            </td>
        </tr>
      <tr>
          <td colspan="3">
              <asp:Label Text="" ID="LabelMessage" ForeColor="Red" runat="server" CssClass="text"></asp:Label>
          </td>
      </tr>
    </table>
<asp:SqlDataSource ID="SqlDataSourceGrievance" runat="server"
     ConnectionString="<%$ ConnectionStrings:SWSDBConnectionString %>" 
    SelectCommand="SELECT [EmpName], [EmpFHName], [Designation], [Station],
     [MobileNumber], [Email], [Subject], [EmpRequestLetter] 
    FROM [GrievanceOnlineRequest]"></asp:SqlDataSource>
    