<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeForm.aspx.cs" Inherits="Shop.HomeForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="main" runat="server">
        <div>
            <asp:HiddenField ID="hfProductID" runat="server" />
            <table>
                <tr>
                    <td>
                        <asp:Label Text="Product" runat="server"/>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtProduct" runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label Text="Price" runat="server"/>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtPrice" runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label Text="Count" runat="server"/>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtCount" runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label Text="Description" runat="server"/>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtDescription" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <asp:Button Text="Save" ID="btnSave" runat="server" OnClick="btnSave_Click" />
                        <asp:Button Text="Delete" ID="btnDelete" runat="server" OnClick="btnDelete_Click" />
                        <asp:Button Text="Clear" ID="btnClear" runat="server" />
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
            <br/. />
            <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="product" HeaderText="Produkt" />
                    <asp:BoundField DataField="price" HeaderText="Cena" />
                    <asp:BoundField DataField="count" HeaderText="Ilość" />
                    <asp:BoundField DataField="description" HeaderText="Opis" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton Text="Select" ID="lnkSelect" CommandArgument='<%# Eval("ProductID") %>' runat="server" onClick="lnkSelect_OnClick"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
