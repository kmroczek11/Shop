<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserForm.aspx.cs" Inherits="Shop.UserForm" %>

<!DOCTYPE html>
<script runat="server">
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="Scripts/jquery-3.0.0.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <!--<script src="Scripts/popper.min.js"></script>-->

    <style type="text/css">
        .auto-style2 {
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        function ShowPopup(name, price, url) {
            $(".name").html(name);
            $(".price").html(price);
            $(".cover").attr("src", url);
            $("#MyPopup").modal("show");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="30px" ImageUrl="~/Assets/shopping-cart.svg" ImageAlign="Middle"/>
                </li>
                <li class="nav-item">
                    <asp:HyperLink ID="NavLink1" runat="server" NavigateUrl="<% %>" CssClass="nav-link">Logout</asp:HyperLink>
                </li>
            </ul>
        </div>
    </nav>

        <!-- Modal Popup -->
        <div id="MyPopup" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Dodawanie do koszyka</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table style="text-align: center; width: 100%">
                            <tr>
                                <td class="name" />
                                <td>
                                    <img class="cover" width="50" height="80" src="none" />
                                </td>
                                <td class="price" />
                            </tr>
                        </table>
                        <hr />
                        <h5>Twój koszyk</h5>
                        <asp:Table CellPadding="4" ID="cardProducts" runat="server"></asp:Table>
                    </div>
                    <div class="modal-footer">
                        <asp:Button OnClick="addToCart" class="btn btn-primary" Text="Dodaj" runat="server" CssClass="btn btn-primary" />
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Zamknij</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Popup -->

        <div style="text-align: center">
            <div style="height: 20px">
            </div>
            <asp:Label ID="lbLogin" runat="server" CssClass="h2 font-weight-bold"></asp:Label>
        </div>
        <br />
        <asp:DataList ID="DataList1" runat="server" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" DataKeyField="productid" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal" CssClass="table">
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
                            <asp:Button CommandArgument='<%# Eval("productid") %>' OnClick="openCart" ID="addToCart" runat="server" Text="Dodaj do koszyka" CssClass="btn btn-primary" />
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
