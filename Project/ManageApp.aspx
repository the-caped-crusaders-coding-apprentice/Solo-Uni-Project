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
                    <h1 class="viewheading">View Appointment</h1>
                    <div class="ViewAppointment">
                        <div class="heading">
                            <p></p>
                            <p id="ticketID" runat="server">No Appointments</p>
                        </div>
                        <hr/>
                        <div>
                            <p id="viewDate" runat="server"></p>
                            <p id ="viewTime" runat="server"></p>
                        </div>
                    </div>
                   <div class="buttons">
                    <asp:Button id="Delete" class="buttonsIN" Text="Submit" runat="server" OnClick="Delete_Click" />
                    <button type="button" class="buttonsIN" id="show">Click Me!</button>
                    <button type="button" class="buttonsIN" id="Hide">Click Me!</button>
                   </div>
               </div>
           </div>
        </div>
    </form>
</body>
</html>
