<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="Shop.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</head>
<body>
    <form id="loginForm" runat="server" style="width: 500px; margin: 50px auto">
        <div >
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Login</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="tbLogin" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Hasło</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row col-sm-10">
                <asp:Label Text="" ID="lblSuccessMessage" runat="server" ForeColor="Green" CssClass="form-text text-succes"/>
            </div>
            <div class="form-group row col-sm-10">
                <asp:Label Text="" ID="lblErrorMessage" runat="server" ForeColor="Red" CssClass="form-text text-danger"/>
            </div>
            <div class="col text-center">
                <asp:Button ID="btLogin" runat="server" Text="Zaloguj" OnClick="btLogin_Click" CssClass="btn btn-primary"/>
            </div>
        </div>
    </form>
</body>
</html>
