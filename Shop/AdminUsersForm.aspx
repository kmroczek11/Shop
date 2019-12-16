<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminUsersForm.aspx.cs" Inherits="Shop.AdminUsersForm" %>

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
                    <li class="nav-item active"><a class="nav-link" href="AdminUsersForm.aspx">Użytkownicy<span class="sr-only">(current)</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="AdminOrdersForm.aspx">Zamówienia<span class="sr-only">(current)</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="AdminProductsForm.aspx">Produkty<span class="sr-only">(current)</span></a></li>
                    <li class="nav-item">
                        <a class="nav-link ml-auto">
                            <asp:Button OnClick="logout" Text="Wyloguj" runat="server" CssClass="logout" /></a>
                    </li>
                </ul>
            </div>
        </nav>

        <div style="width: 50%; margin: 50px auto">
            <asp:HiddenField ID="hfUserID" runat="server" />
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">
                    Login
                </label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtLogin" runat="server" CssClass="form-control" />
                </div>
                <div class="col-sm-1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Login jest wymagany" ControlToValidate="txtLogin" CssClass="form-text text-danger">*</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">
                    Hasło
                </label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" />
                </div>
                <div class="col-sm-1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Hasło jest wymagane" ControlToValidate="txtPassword" CssClass="form-text text-danger">*</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">
                    Miasto
                </label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" />
                </div>
                <div class="col-sm-1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Miasto jest wymagane" ControlToValidate="txtCity" CssClass="form-text text-danger">*</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">
                    Płeć
                </label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtGender" runat="server" CssClass="form-control" />
                </div>
                <div class="col-sm-1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Płeć jest wymagana" ControlToValidate="txtGender" CssClass="form-text text-danger">*</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">
                    Email
                </label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                </div>
                <div class="col-sm-1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email jest wymagany" ControlToValidate="txtEmail" CssClass="form-text text-danger">*</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">
                    <asp:Label Text="Admin" runat="server" />
                </label>
                <div class="col-sm-9">
                    <asp:TextBox ID="txtAdmin" runat="server" CssClass="form-control" />
                </div>
                <div class="col-sm-1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Prawa admina są wymagane" ControlToValidate="txtAdmin" CssClass="form-text text-danger">*</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group row">
                <div class="ml-auto">
                    <asp:Button Text="Zapisz" ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="btn btn-primary" />
                    <asp:Button Text="Usuń" ID="btnDelete" runat="server" OnClick="btnDelete_Click" CssClass="btn btn-primary" />
                    <asp:Button Text="Wyczyść" CausesValidation="false" ID="btnClear" runat="server" OnClick="btnClear_Click" CssClass="btn btn-primary" />
                </div>
            </div>
            <div class="form-group row">
                <asp:Label ID="lblSuccessMessage" runat="server" CssClass="form-text text-success" />
            </div>
            <div class="form-group row">
                <asp:Label ID="lblErrorMessage" runat="server" CssClass="form-text text-danger" />
            </div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Pola oznaczone na czerwono są wymagane" CssClass="form-text text-danger" />
            <br />
        </div>
        <div style="width: 80%; margin: 50px auto">
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-hover">
                <Columns>
                    <asp:BoundField DataField="login" HeaderText="Login" />
                    <asp:BoundField DataField="password" HeaderText="Hasło" />
                    <asp:BoundField DataField="city" HeaderText="Miasto" />
                    <asp:BoundField DataField="gender" HeaderText="Płeć" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="isAdmin" HeaderText="Prawa admina" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton CausesValidation="false" Text="Select" ID="lnkSelect" CommandArgument='<%# Eval("UserID") %>' runat="server" OnClick="lnkSelect_OnClick" CssClass="card-link" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
