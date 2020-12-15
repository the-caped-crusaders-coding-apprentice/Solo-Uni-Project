<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageApp.aspx.cs" Inherits="Project.ManageApp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="StyleSheetManageApp.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
               <p id="name" runat="server"></p>
           </header>
           <div class ="main">
               <div id="sidebar" class="Sidebar">
                    <h1 id="dash">Dashboard</h1>
                    <hr/>
                    <div class="Links">
                       <asp:LinkButton id="LinkButton1" 
                       Text="Make appointment" 
                       OnClick="LinkButton_Click" 
                       runat="server"/>
                       <asp:LinkButton id="LinkButton2" 
                       Text="Manage Profile" 
                       OnClick="LinkButton2_Click" 
                       runat="server"/>
                    </div>
               </div>
               <div class="focus">
                    <h1 class="viewheading">View Active Appointments</h1>
                    <div id="view" class="ViewAppointment">
                        <div class="heading">
                            <p></p>
                            <p id="ticketID" runat="server">No Active Appointments</p>
                        </div>
                        <hr/>
                        <div>
                            <p id="viewDate" runat="server"></p>
                            <p id ="viewTime" runat="server"></p>
                        </div>
                    </div>
                   <div class="buttons">
                    <asp:Button id="Delete" class="buttonsIN" Text="Remove" runat="server" OnClick="Delete_Click" />
                    <button type="button" id="show" class="buttonsIN" onclick="addshow()" >Click Me!</button>
                    <button type="button" class="buttonsIN" id="Hide" onclick="addhide()">Click Me!</button>
                   </div>
               </div>
           </div>
            <script>
                function addshow() {
                    document.getElementById("show").addEventListener(onmouseover, hide());
                    function hide() {
                        document.getElementById("view").style.display = "none";
                        document.getElementById("Delete").style.display = "none";
                    }
                }

                function addhide() {
                    document.getElementById("Hide").addEventListener(onmouseover, hide());
                    function hide() {
                        document.getElementById("view").style.display = "block";
                        document.getElementById("Delete").style.display = "block";
                    }
                }
            </script>
        </div>
    </form>
</body>
</html>
