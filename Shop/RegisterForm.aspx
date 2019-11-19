<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterForm.aspx.cs" Inherits="Shop.RegisterForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>  
    <body>  
    <form id="form1" runat="server">
        <asp:HiddenField ID="hfUserID" runat="server" />
        <div>  
            <table class="auto-style1">  
                <tr>  
                    <td>Login</td>  
                    <td>  
                        <asp:TextBox ID="tbLogin" runat="server"></asp:TextBox>  
                    </td>  
  
               </tr>  
                <tr>  
                    <td>Hasło</td>  
                     <td>
                        <asp:TextBox ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Hasło jest wymagane" ControlToValidate="tbPassword" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Podane hasło nie spełnia wymagań co do złożoności hasła" ForeColor="Red" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" ControlToValidate="tbPassword">*</asp:RegularExpressionValidator>
                     </td>                    
                </tr>  
                <tr>  
                    <td>Potwierdź hasło</td>  
                    <td>  
                        <asp:TextBox ID="tbConfirm" runat="server" TextMode="Password"></asp:TextBox>  
                    </td>  
                </tr>  
                <tr>  
                    <td>Miasto</td>  
                    <td>  
                        <asp:DropDownList ID="ddlCities" runat="server">  
                            <asp:ListItem Text="Wybierz miasto" Value="select"></asp:ListItem>  
                            <asp:ListItem Text="Kraków" Value="Kraków" Selected="True"></asp:ListItem>  
                            <asp:ListItem Text="Warszawa" Value="Warszawa"></asp:ListItem>  
                            <asp:ListItem Text="Bochnia" Value="Bochnia"></asp:ListItem>  
                        </asp:DropDownList>  
                    </td>  
                </tr>  
                <tr>  
                    <td>Płeć</td>  
                    <td>  
                        <asp:RadioButtonList ID="rblGender" runat="server" AutoPostBack="True">  
                            <asp:ListItem Selected="True">Mężczyzna</asp:ListItem>  
                            <asp:ListItem>Kobieta</asp:ListItem>  
                        </asp:RadioButtonList>  
                    </td>  
               </tr>  
                <tr>  
                    <td>Email</td>  
                    <td>  
                        <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email jest wymagany" ControlToValidate="tbEmail" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbEmail" ErrorMessage="Wpisany email jest błędny" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
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
                <tr>  
                    <td>  
                        <asp:Button ID="btRegister" runat="server" Text="Zarejestruj" OnClick="btRegister_Click" />  
                    </td>  
                </tr>  
            </table>  
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Pola oznaczone na czerwono są wymagane" />
    </form>  
</body>
</html>
