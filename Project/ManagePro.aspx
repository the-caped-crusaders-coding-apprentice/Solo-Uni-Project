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
                       <asp:LinkButton id="LinkButton2" 
                       Text="Manage appointments" 
                       runat="server"/>
                    </div>
               </div>
               <div class="ui">
                   <div class="focus">
                       <div class ="changemail">
                            <asp:Button id="b1" Text="Change Email" runat="server" OnClick="b1_Click" />
                            <asp:TextBox id="tb1" runat="server" Text="Enter new Email" onfocus="clearbox1()"/>
                       </div>
                       <div class="changepassword">
                            <asp:Button id="b2" Text="Change Password" runat="server" OnClick="b2_Click" />
                            <asp:TextBox id="tb2" runat="server" Text="Enter new Password" onfocus="clearbox2()"/>
                       </div>
                   </div>
               </div>
           </div>
            <script>
                function clearbox2() {
                    document.getElementById("tb2").value = "";
                }

                function clearbox1() {
                    document.getElementById("tb1").value = "";
                }
            </script>
        </div>
    </form>
</body>
</html>
