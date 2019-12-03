<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserForm.aspx.cs" Inherits="Shop.UserForm" %>

<!DOCTYPE html>
<script runat="server">
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <style type="text/css">
        .auto-style2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Other</a>
      </li>
    </ul>
  </div>
</nav>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lbLogin" runat="server"></asp:Label>
        </div>
        <br />
        <asp:DataList ID="DataList1" runat="server" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" DataKeyField="productid" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal">
            <ItemTemplate>
                <table class="table">
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbProduct" runat="server" Style="text-align: center" Text='<%# Eval("product") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbDescription" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
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
                        <td class="auto-style2">
                            <asp:Button OnClick="add_to_cart" ID="addToCart" runat="server" Text="Dodaj do koszyka" />
                        </td>
                    </tr>
                </table>
                <br />
            </ItemTemplate>
        </asp:DataList>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:shopConnectionString %>" ProviderName="<%$ ConnectionStrings:shopConnectionString.ProviderName %>" SelectCommand="SELECT * FROM product"></asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
