<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="StyleSheetLogin.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <section>
            <div id ="TextMain">
                <h2>Log-</h2>
                <h1>in</h1>
            </div>
            <div id ="main">
                <p class ="email">E-mail</p>
                <asp:TextBox ID="Username" runat="server" Font-Size="Medium"></asp:TextBox>
                <p>Password</p>
                <asp:TextBox ID="Password" runat="server" Font-Size="Medium"></asp:TextBox>
                <asp:Button ID="LoginButton" runat="server" Text="Log in" OnClick="LoginButton_Click" />
            </div>
        </section>
    </form>
</body>
</html>
