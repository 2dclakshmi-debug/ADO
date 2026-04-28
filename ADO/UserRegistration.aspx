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
                           <asp:TextBox ID="txtgender" runat="server"></asp:TextBox></td>
                      <td>
                         <asp:RequiredFieldValidator ID="rfvgender" runat="server" ControlToValidate="txtgender"
                          ErrorMessage=" plese enter gender" ForeColor="Red"></asp:RequiredFieldValidator> </td>
               </tr>
                  <tr>
                               <td><asp:Label ID="lbldob" runat="server" Text="DateOfBirth :"></asp:Label></td>
                                <td ><asp:TextBox ID="txtdob" runat="server"></asp:TextBox></td> 
                           <td> <asp:RequiredFieldValidator ID="rfvdob" runat="server" ControlToValidate="txtdob"
                            ErrorMessage =" plese enter dob" ForeColor="Red"></asp:RequiredFieldValidator> </td>
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
                                      <td><asp:TextBox ID="txthobbies" runat="server"></asp:TextBox></td>
                     <td>  <asp:RequiredFieldValidator ID="rfvhibbies" runat="server" ControlToValidate="txthobbies"
                             ErrorMessage =" plese enter hobbies" ForeColor="Red"></asp:RequiredFieldValidator></td>
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
                </table><br />
            <table align="center">
                <tr>
                    <td>
                        <asp:GridView ID="griddata" runat="server" 
                            AllowPaging="true" PageSize="5" 
                            AutoGenerateColumns="false" OnPageIndexChanging="griddata_PageIndexChanging" DataKeyNames="mobilenumber"
                            OnRowCancelingEdit="griddata_RowCancelingEdit" OnRowDeleting="griddata_RowDeleting"
                            OnRowEditing="griddata_RowEditing" OnRowUpdating="griddata_RowUpdating">
                            <Columns>
                                <asp:TemplateField HeaderText="FirstName">
                                 <ItemTemplate>
                                     <asp:Label ID="lblfname" runat="server" Text='<%#Bind("firstname")%>'></asp:Label>
                                 </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtfirstname" runat="server" Text='<%#Bind("firstname") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                   </asp:TemplateField>
                                 <asp:TemplateField HeaderText="LaststName">
                                   <ItemTemplate>
                                   <asp:Label ID="lbllname" runat="server" Text='<%#Bind("lastname")%>'></asp:Label>
                                      </ItemTemplate>
                                   <EditItemTemplate>
                                 <asp:TextBox ID="txtlastname" runat="server" Text='<%#Bind("lastname") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                       </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Gender">
                                      <ItemTemplate>
                                        <asp:Label ID="lblgender" runat="server" Text='<%#Bind("gender")%>'></asp:Label>
                                       </ItemTemplate>
                                     <EditItemTemplate>
                                        <asp:TextBox ID="txtgender" runat="server" Text='<%#Bind("gender") %>'></asp:TextBox>
                                    </EditItemTemplate>
                               </asp:TemplateField>
                                 <asp:TemplateField HeaderText="DateofBirth">
                                <ItemTemplate>
                                   <asp:Label ID="lbldob" runat="server" Text='<%#Bind("dateofbirth")%>'></asp:Label>
                                </ItemTemplate>
                             <EditItemTemplate>
                               <asp:TextBox ID="txtdob" runat="server" Text='<%#Bind("dateofbirth") %>'></asp:TextBox>
                             </EditItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="password">
                         <ItemTemplate>
                            <asp:Label ID="lblpwd" runat="server" Text='<%#Bind("password")%>'></asp:Label>
                         </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtpwd" runat="server" Text='<%#Bind("password") %>'></asp:TextBox>
                        </EditItemTemplate>
                       </asp:TemplateField>
               
                  <asp:TemplateField HeaderText="Age">
                         <ItemTemplate>
                         <asp:Label ID="lblage" runat="server" Text='<%#Bind("age")%>'></asp:Label>
                         </ItemTemplate>
                    <EditItemTemplate>
                    <asp:TextBox ID="txtage" runat="server" Text='<%#Bind("age") %>'></asp:TextBox>
                  </EditItemTemplate>
              </asp:TemplateField>

                     <asp:TemplateField HeaderText="Hobbies">
                       <ItemTemplate>
                          <asp:Label ID="lblhobbies" runat="server" Text='<%#Bind("hobbies")%>'></asp:Label>
                      </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txthobbies" runat="server" Text='<%#Bind("hobbies") %>'></asp:TextBox>
                    </EditItemTemplate>
                      </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mobilenumber">
                      <ItemTemplate>
                         <asp:Label ID="lblmobile" runat="server" Text='<%#Bind("mobilenumber")%>'></asp:Label>
                     </ItemTemplate>
                      <EditItemTemplate>
                            <asp:TextBox ID="txtmobile" runat="server" Text='<%#Bind("mobilenumber") %>'></asp:TextBox>
                      </EditItemTemplate>
                     </asp:TemplateField>
                       <asp:TemplateField HeaderText="Actions">
                         <ItemTemplate>
                             <asp:Button ID="btnedit" runat="server" Text="Edit" CommandName="Edit" />
                             <asp:Button ID="btndelete" runat="server" Text="Delete" CommandName="Delete" />
                        </ItemTemplate>
                      <EditItemTemplate>
                         <asp:Button ID="btnupdate" runat="server" Text="Update" CommandName="Update" />
                          <asp:Button ID="btncancel" runat="server" Text="Cancel" CommandName="Cancel" />
                       </EditItemTemplate>
                       </asp:TemplateField>
                            </Columns>
                            
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            

        </div>
    </form>
</body>
</html>
