<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ADO.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 36%;
            height: 41px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1" align="center">
                <tr>
                    <td><asp:Label ID="lblUname" runat="server" Text="username :"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtuname" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="rfvuname" runat="server" ErrorMessage="please enter username"
                        ControlToValidate="txtuname" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblpwd" runat="server" Text="password :"></asp:Label></td>
                    <td> <asp:TextBox ID="txtpwd" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="rfvpwd" runat="server" ForeColor="Red" 
                        ControlToValidate="txtpwd" 
                        ErrorMessage="Password is mandatory"></asp:RequiredFieldValidator></td>
                        
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click"  />
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
                    <asp:Button ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click" /></td>
                    <td></td>
                </tr>
            </table>
            <br /><br />
            <table align="center">
                <tr>
                    <td><asp:Label ID="lblsearch" runat="server" Text="Search :"></asp:Label>
                        <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox><br />
                    </td>
                    <td><asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" /></td>
                    
</tr>
  </table>
            <br />
            <table align="center">
                <tr>
               <td>
            <asp:GridView ID="grdData"  runat="server" 
                AutoGenerateColumns="false" DataKeyNames="uid"
                AllowPaging="true" PageSize="5"
                OnPageIndexChanging="grdData_PageIndexChanging"
                OnRowCancelingEdit="grdData_RowCancelingEdit"
                OnRowEditing="grdData_RowEditing" OnRowUpdating="grdData_RowUpdating" OnRowDeleting="grdData_RowDeleting">
                   <Columns>
                       <asp:TemplateField HeaderText="username">
                           <ItemTemplate>
                               <asp:Label ID="lbluname" runat="server" Text='<%#Bind("username") %>'></asp:Label>
                           </ItemTemplate>
                           <EditItemTemplate>
                               <asp:TextBox ID="Txtuname" runat="server" Text='<%#Bind("username") %>'></asp:TextBox>
                           </EditItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Password">
                           <ItemTemplate>
                               <asp:Label ID="lblpwd" runat="server" Text='<%#Bind("password") %>'></asp:Label>
                           </ItemTemplate>
                           <EditItemTemplate>
                               <asp:TextBox ID="txtpwd" runat="server" Text='<%#Bind("password") %>'></asp:TextBox>
                           </EditItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Actions">
                           <ItemTemplate>
                               <asp:Button ID="btnEdit" runat="server" Text="EDIT" CommandName="Edit" />
                               <asp:Button ID="btnsdelete" runat="server" Text="Delete" CommandName="Delete" />\
                           </ItemTemplate>
                           <EditItemTemplate>
                                <asp:Button ID="btnsupdate" runat="server" Text="Update" CommandName="Update" />
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
