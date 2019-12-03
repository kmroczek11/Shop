<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterForm.aspx.cs" Inherits="Shop.RegisterForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</head>  
    <body>  
    <form id="form1" runat="server" style="width: 500px; margin: 50px auto">
        <asp:HiddenField ID="hfUserID" runat="server" />
        <div>  
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Hasło jest wymagane" ControlToValidate="tbPassword" ForeColor="Red" CssClass="form-text text-danger">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Podane hasło nie spełnia wymagań co do złożoności hasła" ForeColor="Red" CssClass="form-text text-danger" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" ControlToValidate="tbPassword">*</asp:RegularExpressionValidator>
                     </div>                    
                </div>  
                <div class="form-group row">  
                    <label class="col-sm-2 col-form-label">Potwierdź hasło</label>  
                    <div class="col-sm-10">  
                        <asp:TextBox ID="tbConfirm" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>  
                    </div>  
                </div>  
                <div class="form-group row">  
                    <label class="col-sm-2 col-form-label">Miasto</label>  
                    <div class="col-sm-10">  
                        <asp:DropDownList ID="ddlCities" runat="server" CssClass="form-control">  
                            <asp:ListItem Text="Wybierz miasto" Value="select"></asp:ListItem>  
                            <asp:ListItem Text="Kraków" Value="Kraków" Selected="True"></asp:ListItem>  
                            <asp:ListItem Text="Warszawa" Value="Warszawa"></asp:ListItem>  
                            <asp:ListItem Text="Bochnia" Value="Bochnia"></asp:ListItem>  
                        </asp:DropDownList>  
                    </div>  
                </div>  
                <div class="form-group row">  
                    <label class="col-sm-2 col-form-label">Płeć</label>  
                    <div class="form-check">  
                        <asp:RadioButtonList ID="rblGender" runat="server" AutoPostBack="True">  
                            <asp:ListItem Selected="True">Mężczyzna</asp:ListItem>  
                            <asp:ListItem>Kobieta</asp:ListItem>  
                        </asp:RadioButtonList>  
                    </div>  
               </div>  
                <div class="form-group row">  
                    <label class="col-sm-2 col-form-label">Email</label>  
                    <div class="col-sm-10">  
                        <asp:TextBox ID="tbEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email jest wymagany" ControlToValidate="tbEmail" ForeColor="Red" CssClass="form-text text-danger">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbEmail" ErrorMessage="Wpisany email jest błędny" ForeColor="Red" CssClass="form-text text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </div>  
                </div>
                <div class="form-group row col-sm-10">
                        <asp:Label Text="" ID="lblSuccessMessage" runat="server" ForeColor="Green" CssClass="form-text text-succes"/>
                </div>
                 <div class="form-group row col-sm-10">
                        <asp:Label Text="" ID="lblErrorMessage" runat="server" ForeColor="Red" CssClass="form-text text-danger"/>
                </div>
                <div class="col text-center">  
                        <asp:Button ID="btRegister" runat="server" Text="Zarejestruj" OnClick="btRegister_Click" CssClass="btn btn-primary"/>  
                </div>  
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Pola oznaczone na czerwono są wymagane" />
    </form>  
</body>
</html>
