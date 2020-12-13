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
               <div class="Sidebar">
                    <h1>Dashboard</h1>
                    <hr/>
                    <div class="Links">
                       <asp:LinkButton id="LinkButton1" 
                       Text="Manage appointments" 
                       OnClick="LinkButton_Click" 
                       runat="server"/>
                        <a href ="#">Manage Profile
                        </a>
                    </div>
               </div>
               <div class="focus">
                    <h1 class="viewheading">View Appointment</h1>
                    <div class="ViewAppointment">
                        <div class="heading">
                            <p>x</p>
                            <p id="ticketID" runat="server">y</p>
                        </div>
                        <hr/>
                        <div>
                            <p id="viewDate" runat="server">z</p>
                            <p id ="viewTime" runat="server">a</p>
                        </div>
                    </div>
                   <asp:Button id="b1" Text="Submit" runat="server" />
                   <asp:Button id="Button1" Text="Submit" runat="server" />
                   <asp:Button id="Button2" Text="Submit" runat="server" />
               </div>
           </div>
        </div>
    </form>
</body>
</html>
