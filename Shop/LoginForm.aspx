<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="Shop.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="loginForm" runat="server">
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
                        <asp:Button ID="btLogin" runat="server" Text="Zaloguj" OnClick="btLogin_Click"/>  
                    </td>  
                </tr>  
            </table>  
        </div>
    </form>  
</body>
</html>
