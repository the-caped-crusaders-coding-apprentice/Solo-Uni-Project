<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagePro.aspx.cs" Inherits="Project.ManagePro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="StyleSheetManagePro.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
               <p id="name" runat="server"></p>
           </header>
           <div class ="main">
               <div class="Sidebar">
                    <h1>Dashboard</h1>
                    <hr/>
                    <div class="Links">
                       <asp:LinkButton id="LinkButton1" 
                       Text="Manage appointments" 
                       runat="server"/>
                        <a href ="#">Manage Profile
                        </a>
                    </div>
               </div>
               <div class="focus">
                    <asp:TextBox id="tb1" runat="server" />
                    <asp:TextBox id="TextBox1" runat="server" />

               </div>
           </div>
        </div>
    </form>
</body>
</html>
