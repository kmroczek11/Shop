<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminOrdersForm.aspx.cs" Inherits="Shop.AdminOrdersForm" %>

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
            <asp:HiddenField ID="hfOrderID" runat="server" />
            <table>
                <tr>
                    <td>
                        <asp:Label Text="ID zamówienia" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="Status" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtStatus" runat="server" />
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
                    <asp:BoundField DataField="order_id" HeaderText="ID zamówienia" />
                    <asp:BoundField DataField="status" HeaderText="Status zamówienia" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton Text="Select" ID="lnkSelect" CommandArgument='<%# Eval("Order_ID") %>' runat="server" OnClick="lnkSelect_OnClick" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
