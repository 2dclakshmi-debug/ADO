<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginform practice.aspx.cs" Inherits="ADO.loginform_practice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

           <%-- <table class="auto-style1" align="center">
                <tr>
                    <td>
                        <asp:Label ID="lbluname" runat="server" Text="Username :"></asp:Label></td>
                    <td><asp:TextBox ID="txtuname" runat="server"></asp:TextBox></td>
                          <td>
                            <asp:RequiredFieldValidator ID="rfvuname" runat="server"
                                ControlToValidate="txtuname" ForeColor="Red" 
                                ErrorMessage="please enter username"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>
             <asp:Label ID="lblpwd" runat="server" Text="password :"></asp:Label></td>
               <td><asp:TextBox ID="txtpwd" runat="server"></asp:TextBox></td>
       <td>
           <asp:RequiredFieldValidator ID="rfvpd" runat="server"
               ErrorMessage="please enter password" ControlToValidate="txtpwd" 
               ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="btnsubmit" runat="server" Text="Submit" /></td>
                    <td></td>
                </tr>
            </table><br /><br />
            <table align="center">
                <tr>
                    <td><asp:TextBox ID="txtsearch" runat="server" 
                        PlaceHolder="search here"></asp:TextBox>
                        <asp:Button ID="btnsearch" runat="server" Text="Search" />
                    </td>
                </tr>
            </table><br /><br />
            <table align="center">
                <tr>
                    <td>
                        <asp:GridView ID="grdData" runat="server" AllowPaging="true" PageSize="5" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField HeaderText="username">
                                    <ItemTemplate>
                                        <asp:Label ID="lbluname" runat="server" Text='<%#Bind("username") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtuname" runat="server" Text='<%#Bind("password") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="password">
                                    <ItemTemplate>
                                        <asp:Label ID="lblpwd" runat="server" Text='<%#Bind("password") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtpwd" runat="server" Text='<%#Bind("password") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:Button ID="btnedit" runat="server" Text="EDIT" />
                                        <asp:Button ID="btndelete" runat="server" Text="DELETE" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Button ID="btnupdate" runat="server" Text="Update" />
                                        <asp:Button ID="btncancel" runat="server" Text="Cancel" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>--%>

            <table>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="uid" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" />
                                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LogindbConnectionString %>" ProviderName="<%$ ConnectionStrings:LogindbConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Logins]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            

        </div>
    </form>
</body>
</html>
