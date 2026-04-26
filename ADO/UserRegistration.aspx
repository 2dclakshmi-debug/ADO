<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="ADO.UserRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center">
                <tr>
                    <td><h2><u>User Registration</u></h2></td>
                </tr>
            </table>
            <table align="center">
                <tr>
                    <td><asp:Label ID="lblfname" runat="server" Text="FirstName :"></asp:Label></td>
                    <td><asp:TextBox ID="txtfname" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvfname" runat="server" ControlToValidate="txtfname"
                            ErrorMessage=" plese enter firstname" ForeColor="Red"></asp:RequiredFieldValidator> </td>
                </tr>
                  <tr>
                        <td><asp:Label ID="lbllname" runat="server" Text="LastName :"></asp:Label></td>
                          <td><asp:TextBox ID="txtlname" runat="server"></asp:TextBox></td>
                     <td>
                      <asp:RequiredFieldValidator ID="rfvlname" runat="server" ControlToValidate="txtlname"
                              ErrorMessage =" plese enter Lastname" ForeColor="Red"></asp:RequiredFieldValidator> </td>
                </tr>
                 <tr>
                       <td><asp:Label ID="lblgender" runat="server" Text="Gender :"></asp:Label></td>
                        <td>
                            <asp:RadioButtonList ID="rblgender" runat="server" AutoPostBack="true">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                <asp:ListItem>Others</asp:ListItem>
                            </asp:RadioButtonList></td>
                  <td>
                         <asp:RequiredFieldValidator ID="rfvgender" runat="server" ControlToValidate="rblgender"
                          ErrorMessage=" plese select gender" ForeColor="Red"></asp:RequiredFieldValidator> </td>
               </tr>
                  <tr>
                               <td><asp:Label ID="lbldob" runat="server" Text="DateOfBirth :"></asp:Label><br />
                                   <asp:DropDownList ID= "ddlday" runat="server" AutoPostBack="true"></asp:DropDownList>
                               </td>
                                 <td><asp:DropDownList ID="ddlmonth" runat="server" AutoPostBack="true"></asp:DropDownList> </td>
                 <td>
                             <asp:DropDownList ID="ddlyear" runat="server" AutoPostBack="true"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvdob" runat="server" ControlToValidate="ddlday"
                            ErrorMessage =" plese select dob" ForeColor="Red"></asp:RequiredFieldValidator> </td>
              </tr>
                  <tr>
                        <td><asp:Label ID="lblpwd" runat="server" Text="Password :"></asp:Label></td>
                           <td><asp:TextBox ID="txtpwd" runat="server"></asp:TextBox></td>
                 <td>
                          <asp:RequiredFieldValidator ID="rfvpwd" runat="server" ControlToValidate="txtpwd"
                             ErrorMessage =" plese enter password" ForeColor="Red"></asp:RequiredFieldValidator> </td>
                 </tr>
                  <tr>
                                 <td><asp:Label ID="lblconfirmpwd" runat="server" Text="ConfirmPassword :"></asp:Label></td>
                               <td><asp:TextBox ID="txtconfirmpwd" runat="server"></asp:TextBox></td>
                                <td>
                                 <asp:RequiredFieldValidator ID="rfvconfirmpwd" runat="server" ControlToValidate="txtconfirmpwd"
                               ErrorMessage =" plese enter confirm password" ForeColor="Red"></asp:RequiredFieldValidator>
                              <asp:CompareValidator ID="cvpwd" runat="server" ControlToValidate="txtconfirmpwd" ControlToCompare="txtpwd"
                                        ForeColor="Red" ErrorMessage="please enter valid password"></asp:CompareValidator>
                                </td>
                 </tr>
                  <tr>
                                 <td><asp:Label ID="lblage" runat="server" Text="Age :"></asp:Label></td>
                                        <td><asp:TextBox ID="txtage" runat="server"></asp:TextBox></td>
                       <td>
                                <asp:RequiredFieldValidator ID="rfvage" runat="server" ControlToValidate="txtage"
                              ErrorMessage =" plese enter age" ForeColor="Red"></asp:RequiredFieldValidator>
                           <asp:RangeValidator ID="rvage" runat="server" ControlToValidate="txtage"
                               ErrorMessage="pleade enter valid age" Type="Integer" ForeColor="Red" MaximumValue="30" MinimumValue="18"></asp:RangeValidator>
                       </td>
                   </tr>
                  <tr>
                              <td><asp:Label ID="lblhobbies" runat="server" Text="Hobbies :"></asp:Label></td>
                                      <td>
                                          <asp:CheckBoxList ID="cblhobbies" runat="server" AutoPostBack="true">
                                              <asp:ListItem>Reading</asp:ListItem>
                                              <asp:ListItem>Coding</asp:ListItem>
                                              <asp:ListItem>Browsing</asp:ListItem>
                                          </asp:CheckBoxList></td>
                                    <td> <asp:CustomValidator ID="customvhobbies" runat="server" 
                                        ErrorMessage ="CustomValidator" OnServerValidate="customvhobbies_ServerValidate" ForeColor="Red"></asp:CustomValidator></td>
                </tr>
                  <tr>
                                   <td><asp:Label ID="lblmobile" runat="server" Text="Mobile :"></asp:Label></td>
                                    <td><asp:TextBox ID="txtmobile" runat="server"></asp:TextBox></td>
                  <td>
                             <asp:RequiredFieldValidator ID="rfvmobile" runat="server" ControlToValidate="txtmobile"
                               ErrorMessage =" plese enter mobile" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revmobile" runat="server" ControlToValidate="txtmobile"
                                        ErrorMessage ="please enter valid mobile number" ForeColor="Red" ValidationExpression="^[6-9][0-9]{9}$"></asp:RegularExpressionValidator>

                  </td>
               </tr>
                  <tr>
                              <td><asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" /></td>
                                   <td><asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click" /></td>
                    <td><asp:Button ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click" />
                              </td>
                  </tr>
            </table><br /><br />
            <table align="center">
                <tr>
                    <td><asp:TextBox ID="txtsearch" runat="server" PlaceHolder="data search here"></asp:TextBox></td>
                    <td><asp:Button ID="btnsearch" runat="server" Text="Search"  CausesValidation="false" OnClick="btnsearch_Click" style="height: 29px" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="griddata" runat="server"></asp:GridView>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
