<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminProductsForm.aspx.cs" Inherits="Shop.AdminProductsForm" %>

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
            <asp:HiddenField ID="hfProductID" runat="server" />
            <table>
                <tr>
                    <td>
                        <asp:Label Text="Produkt" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtProduct" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="Cena" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtPrice" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="Ilość" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtCount" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="Opis" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtDescription" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="URL Okładki" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtImage" runat="server" />
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
            <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="product" HeaderText="Produkt" />
                    <asp:BoundField DataField="price" HeaderText="Cena" />
                    <asp:BoundField DataField="count" HeaderText="Ilość" />
                    <asp:BoundField DataField="description" HeaderText="Opis" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton Text="Select" ID="lnkSelect" CommandArgument='<%# Eval("ProductID") %>' runat="server" OnClick="lnkSelect_OnClick" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <!-- Wyszukiwarka -->
            <asp:TextBox ID="txtFind" runat="server" placeholder="Wyszukaj produkt"></asp:TextBox>
            <asp:Button ID="btnFind" OnClick="findProduct" Text="Wyszukaj" runat="server"/>
            <asp:GridView ID="gvFindProducts" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="product" HeaderText="Produkt" />
                    <asp:BoundField DataField="price" HeaderText="Cena" />
                    <asp:BoundField DataField="count" HeaderText="Ilość" />
                    <asp:BoundField DataField="description" HeaderText="Opis" />
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>
