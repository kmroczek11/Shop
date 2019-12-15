<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminOrdersForm.aspx.cs" Inherits="Shop.AdminOrdersForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Admin Panel</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <style>
        .logout {
            background: none;
            border: none;
        }
    </style>
</head>
<body>
    <form id="main" runat="server">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="AdminUsersForm.aspx">Użytkownicy<span class="sr-only">(current)</span></a></li>
                    <li class="nav-item active"><a class="nav-link" href="AdminOrdersForm.aspx">Zamówienia<span class="sr-only">(current)</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="AdminProductsForm.aspx">Produkty<span class="sr-only">(current)</span></a></li>
                    <li class="nav-item">
                        <a class="nav-link ml-auto">
                            <asp:Button OnClick="logout" Text="Wyloguj" runat="server" CssClass="logout" /></a>
                    </li>
                </ul>
            </div>
        </nav>

        <div style="width: 50%; margin: 50px auto">
            <asp:HiddenField ID="hfOrderID" runat="server" />
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">
                    ID zamówienia
                </label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtID" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">
                    Status
                </label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtStatus" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="form-group row">
                <div class="ml-auto">
                    <asp:Button Text="Zapisz" ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="btn btn-primary" />
                    <asp:Button Text="Usuń" ID="btnDelete" runat="server" OnClick="btnDelete_Click" CssClass="btn btn-primary" />
                    <asp:Button Text="Wyczyść" ID="btnClear" runat="server" OnClick="btnClear_Click" CssClass="btn btn-primary" />
                </div>
            </div>
            <div class="form-group row">
                <asp:Label Text="" ID="lblSuccessMessage" runat="server" CssClass="form-text text-success" />
            </div>
            <div class="form-group row">
                <asp:Label Text="" ID="lblErrorMessage" runat="server" CssClass="form-text text-danger" />
            </div>
            <br />
        </div>
        <div style="width: 80%; margin: 50px auto">
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="false" CssClass="table">
                <Columns>
                    <asp:BoundField DataField="order_id" HeaderText="ID zamówienia" />
                    <asp:BoundField DataField="status" HeaderText="Status zamówienia" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton Text="Select" ID="lnkSelect" CssClass="card-link" CommandArgument='<%# Eval("Order_ID") %>' runat="server" OnClick="lnkSelect_OnClick" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
