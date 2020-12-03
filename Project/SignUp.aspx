<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Project.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="StyleSheetSignUp.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <section>
            <div id ="TextMain">
                <h2>Sign-</h2>
                <h1>up</h1>
            </div>
            <div id ="main">
                <p class ="email">E-mail</p>
                <asp:TextBox ID="Username" runat="server"></asp:TextBox>
                <p>Name</p>
                <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                <p>Surname</p>
                <asp:TextBox ID="Surname" runat="server"></asp:TextBox>
                <p>ID Number</p>
                <asp:TextBox ID="IdNumber" runat="server"></asp:TextBox>
                <p>Password</p>
                <asp:TextBox ID="Password" runat="server"></asp:TextBox>
                <asp:Button ID="ButtonSignUp" runat="server" Text="Register" OnClick="ButtonSignUp_Click" />
            </div>
        </section>
        </div>
    </form>
</body>
</html>
