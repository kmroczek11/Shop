<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserForm.aspx.cs" Inherits="Shop.UserForm" %>

<!DOCTYPE html>
<script runat="server">
</script>


<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <style type="text/css">
        .auto-style2 {
            text-align: center;
        }

        .messagealert {
            width: 100%;
            position: fixed;
            top: 0px;
            z-index: 100000;
            padding: 0;
            font-size: 15px;
        }

        .logout {
            background: none;
            border: none;
        }
    </style>
    <script type="text/javascript">
        function ShowMessage(message, messagetype) {
            var cssclass;
            switch (messagetype) {
                case 'Success':
                    cssclass = 'alert-success'
                    break;
                case 'Error':
                    cssclass = 'alert-danger'
                    break;
                case 'Warning':
                    cssclass = 'alert-warning'
                    break;
                default:
                    cssclass = 'alert-info'
            }
            $('#alert_container').append('<div id="alert_div" style="margin: 0 0.5%; -webkit-box-shadow: 3px 4px 6px #999;" class="alert fade in ' + cssclass + '"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><span>' + message + '</span></div>');
        }

        function ShowPopup(name, price, url) {
            $(".name").html(name);
            $(".price").html(price);
            $(".cover").attr("src", url);
            $("#MyPopup").modal("show");
        }
    </script>
</head>

<body>
    <form id="userForm" runat="server">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link ml-auto"><asp:Button OnClick="logout" Text="Wyloguj" runat="server" CssClass="logout" /></a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="messagealert" id="alert_container">
        </div>

        <div class="MessagePanelDiv">
            <asp:Panel ID="Message" runat="server" CssClass="hidepanel">
                &nbsp;<asp:Label ID="labelMessage" runat="server" />
            </asp:Panel>
        </div>

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
                                    <img class="cover" width="80" height="80" src="none" />
                                </td>
                                <td class="price" />
                                <td>
                                    <select id="selectQuantity" runat="server">
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <hr />
                        <h5>Twój koszyk</h5>
                        <asp:Table CellPadding="4" ID="cardProducts" runat="server" CssClass="table"></asp:Table>
                    </div>
                    <div class="modal-footer">
                        <asp:Button OnClick="order" class="btn btn-primary" Text="Zamów" runat="server"
                            CssClass="btn btn-primary" />
                        <asp:Button OnClick="addToCart" class="btn btn-primary" Text="Dodaj" runat="server"
                            CssClass="btn btn-primary" />
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Zamknij</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Popup -->

        <!-- Reklama -->
        <div class="card" style="margin: auto 5%; padding: 0 15px">
            <asp:Label ID="lbAd" runat="server" CssClass="h3 font-weight-bold"></asp:Label>
            <p class="h3 font-weight-bold" style="text-align: center">Mogą Ci się spodobać również...</p>
            <asp:GridView ID="gvAd" runat="server" AutoGenerateColumns="false" CssClass="table">
                <Columns>
                    <asp:BoundField DataField="product" HeaderText="Produkt" />
                    <asp:BoundField DataField="price" HeaderText="Cena" />
                    <asp:BoundField DataField="description" HeaderText="Opis" />
                </Columns>
            </asp:GridView>
        </div>

        <div style="text-align: center">
            <div style="height: 20px">
            </div>
            <asp:Label ID="lbLogin" runat="server" CssClass="h2 font-weight-bold"></asp:Label>
        </div>
        <br />

        <!-- Wyszukiwarka -->
        <div style="width: 80%; margin: 50px auto">
            <div class="row">
                <div class="col-sm-5">
                    <asp:TextBox ID="txtFind" runat="server" placeholder="Wyszukaj produkt" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-0">
                    <asp:ImageButton ID="btnFind" OnClick="findProduct" Text="Wyszukaj" runat="server" ImageUrl="./Assets/search.svg" ImageAlign="Middle" Width="30px" />
                </div>
            </div>

            <asp:GridView ID="gvFindProducts" runat="server" AutoGenerateColumns="false" CssClass="table" OnSelectedIndexChanged="gvFindProducts_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="product" HeaderText="Produkt" />
                    <asp:ImageField HeaderText="Okładka" DataImageUrlField="image" ControlStyle-Width="100px" />
                    <asp:BoundField DataField="price" HeaderText="Cena" />
                    <asp:BoundField DataField="count" HeaderText="Ilość" />
                    <asp:BoundField DataField="description" HeaderText="Opis" />
                </Columns>
            </asp:GridView>
        </div>

        <asp:DataList ID="DataList1" runat="server" DataKeyField="productid" DataSourceID="SqlDataSource1"
            RepeatColumns="4" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div class="card" style="margin: 5px">
                    <table class="table">
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="lbProduct" runat="server" Style="text-align: center"
                                    Text='<%# Eval("product") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="lbDescription" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Image ID="imgImage" runat="server" Height="150px" ImageUrl='<%# Eval("image") %>'
                                    Width="150px" />
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
                                <asp:Button CommandArgument='<%# Eval("productid") %>' OnClick="openCart" ID="addToCart"
                                    runat="server" Text="Dodaj do koszyka" CssClass="btn btn-primary" />
                            </td>
                        </tr>
                    </table>
                    <br />
                </div>
            </ItemTemplate>
        </asp:DataList>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:getProducts %>"
            ProviderName="<%$ ConnectionStrings:getProducts.ProviderName %>" SelectCommand="SELECT * FROM product"></asp:SqlDataSource>
        <br />



    </form>

</body>

</html>
