<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Project.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="StyleSheetDashboard.css"/>
</head>
<body>
    <form id="form1" runat="server">
             <header>
                <p>Welcome back:</p>
            </header>
        <div class="Focus">
            <div class="Sidebar">
                <h1>Dashboard</h1>
                <hr/>
                <div class="Links">
                <a href ="#">Manage Appointments
                    </a>
                <a href ="#">Manage Profile
                    </a>
                </div>
            </div>
            <div class="Main">
                <div class="Uppers">
                    <div class="ViewAppointment">
                        <div class="heading">
                            <p>x</p>
                            <p>y</p>
                        </div>
                        <hr/>
                        <div>
                            <p>z</p>
                            <p>a</p>
                        </div>
                    </div>
                    <div class="News">
                    </div>
                </div>
                <div class="Table">
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Date</th>
                            <th>Time</th>
                        </tr>
                    </table>
                </div>
                <asp:Button ID="Confirm" runat="server" Text="Confirm" />
            </div>
        </div>
    </form>
</body>
</html>
