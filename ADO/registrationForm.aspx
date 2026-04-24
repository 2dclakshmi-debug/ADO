<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registrationForm.aspx.cs" Inherits="ADO.registrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 64%;
            height: 64px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>


            <table class="auto-style1" align="center">
                <tr>
                    <td>
                        <asp:Label ID="lblFname" runat="server" Text="FirstName"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfname" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvfname" runat="server" ForeColor="Red"
                       ControlToValidate="txtfname" ErrorMessage="first name is mandatory">
                        </asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>
                   <asp:Label ID="lbllastname" runat="server" Text="lastName"></asp:Label></td>
                    <td>
                    <asp:TextBox ID="txtlname" runat="server"></asp:TextBox></td>
                   <td>
                    <asp:RequiredFieldValidator ID="rfvlname" runat="server" ForeColor="Red"
                    ControlToValidate="txtlname" ErrorMessage="last name is mandatory">
                          </asp:RequiredFieldValidator></td>
                 </tr>
                <tr>
                       <td>
                     <asp:Label ID="lblpassword" runat="server" Text="Password"></asp:Label></td>
                     <td>
                 <asp:TextBox ID="txtpwd" runat="server"></asp:TextBox></td>
                     <td>
                      <asp:RequiredFieldValidator ID="rfvpwd" runat="server" ForeColor="Red"
                      ControlToValidate ="txtpwd" ErrorMessage="password is mandatory">
                     </asp:RequiredFieldValidator></td>
               </tr>
                <tr>
                      <td>
                  <asp:Label ID="lblconfirmpwd" runat="server" Text="ConfirmPassword"></asp:Label></td>
                    <td>
               <asp:TextBox ID="txtconfirmpwd" runat="server"></asp:TextBox></td>
                   <td>
                <asp:RequiredFieldValidator ID="rfvconfirmpwd" runat="server" ForeColor="Red"
                ControlToValidate="txtconfirmpwd" ErrorMessage="confirm password mandatory">
                   </asp:RequiredFieldValidator>
                       <asp:CompareValidator ID="cvpwd" runat="server" ForeColor="Red" ControlToValidate="txtconfirmpwd" ControlToCompare="txtpwd" ErrorMessage="please enter valid password"></asp:CompareValidator>
                   </td>

                 </tr>
                <tr>
                       <td>
               <asp:Label ID="lblage" runat="server" Text="Age"></asp:Label></td>
              <td>
               <asp:TextBox ID="txtage" runat="server"></asp:TextBox></td>
               <td>
               <asp:RequiredFieldValidator ID="rfvage" runat="server" ForeColor="Red"
                   ControlToValidate ="txtage" ErrorMessage="age is mandatory">
                  </asp:RequiredFieldValidator>
                   <asp:RangeValidator ID="rvage" runat="server" ErrorMessage="please enter valid age" 
                       ControlToValidate="txtage"  MaximumValue="30" MinimumValue="18" ForeColor="Red"></asp:RangeValidator>
               </td>
</tr>
                
                <tr>
                   <td>
                  <asp:Label ID="lblmobile" runat="server" Text="Mobile Number"></asp:Label></td>
               <td>
                   <asp:TextBox ID="txtmobile" runat="server"></asp:TextBox></td>
                 <td>
                     <asp:RequiredFieldValidator ID="rfvmobile" runat="server" ForeColor="Red"
                     ControlToValidate="txtmobile" ErrorMessage="phone number is mandatory">
                  </asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="revmobile" runat="server" ValidationExpression="^[0-9]{10}$"
                      ErrorMessage="please enter valid phonenumber" ForeColor="Red" ControlToValidate="txtmobile">
                  </asp:RegularExpressionValidator>

                 </td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" /></td>
                </tr>
            </table>


        </div>
    </form>
</body>
</html>
