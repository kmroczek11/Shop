<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserForm.aspx.cs" Inherits="Shop.UserForm" %>

<!DOCTYPE html>
<script runat="server">
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            text-align:center;
        }
        .auto-style2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lbLogin" runat="server"></asp:Label>
        </div>
        <br />
        <asp:DataList ID="DataList1" runat="server" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" CellPadding="4" DataKeyField="productid" DataSourceID="SqlDataSource1" ForeColor="#333333" RepeatColumns="4" RepeatDirection="Horizontal">
            <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbProduct" runat="server" style="text-align: center" Text='<%# Eval("product") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbDescription" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="imgImage" runat="server" Height="150px" ImageUrl='<%# Eval("image") %>' Width="150px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Dostępnych sztuk na magazynie
                            <asp:Label ID="lbCount" runat="server" Text='<%# Eval("count") %>'></asp:Label>
                            <br />
                            Cena
                            <asp:Label ID="lbPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                            &nbsp;zł</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button OnClick="add_to_cart" ID="addToCart" runat="server" Text="Dodaj do koszyka" />
                        </td>
                    </tr>
                </table>
<br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:shopConnectionString %>" ProviderName="<%$ ConnectionStrings:shopConnectionString.ProviderName %>" SelectCommand="SELECT * FROM product"></asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
