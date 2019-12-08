<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminUsersForm.aspx.cs" Inherits="Shop.AdminUsersForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</head>
<body>
    <form id="main" runat="server">
        <div>
            <asp:HiddenField ID="hfUserID" runat="server" />
            <table>
                <tr>
                    <td>
                        <asp:Label Text="Login" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtLogin" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="Hasło" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtPassword" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="Miasto" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtCity" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="Płeć" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtGender" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="Email" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtEmail" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="Admin" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtAdmin" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <asp:Button Text="Zapisz" ID="btnSave" runat="server" OnClick="btnSave_Click" />
                        <asp:Button Text="Usuń" ID="btnDelete" runat="server" OnClick="btnDelete_Click" />
                        <asp:Button Text="Wyczyść" ID="btnClear" runat="server" OnClick="btnClear_Click" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <asp:Label Text="" ID="lblSuccessMessage" runat="server" ForeColor="Green" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <asp:Label Text="" ID="lblErrorMessage" runat="server" ForeColor="Red" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="login" HeaderText="Login" />
                    <asp:BoundField DataField="password" HeaderText="Hasło" />
                    <asp:BoundField DataField="city" HeaderText="Miasto" />
                    <asp:BoundField DataField="gender" HeaderText="Płeć" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="isAdmin" HeaderText="Prawa admina" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton Text="Select" ID="lnkSelect" CommandArgument='<%# Eval("UserID") %>' runat="server" OnClick="lnkSelect_OnClick" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
