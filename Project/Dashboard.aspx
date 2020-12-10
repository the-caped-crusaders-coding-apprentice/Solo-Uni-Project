<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Project.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="StyleSheetDashboard.css"/>
</head>
<body onload="loadtext()">
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
                            <p id="ticketID">y</p>
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
                    <table id ="tab">
                        <tr>
                            <th>ID</th>
                            <th>Date</th>
                            <th>Time</th>
                        </tr>
                    </table>
                </div>
                <asp:Button ID="Confirm" runat="server" Text="Confirm" OnClick="Confirm_Click" />
            </div>
            <script>
                var table = document.getElementById("tab");
               // table.insertAdjacentHTML("beforeend", "<tr><td>test</td><td>test</td><td>test</td></tr>");
                function loadtext() {
                    var xhr = new XMLHttpRequest;
                    xhr.open("GET", "test.json", true);

                    xhr.onload = function () {
                        if (this.status == 200) {
                            var data = JSON.parse(this.responseText);
                            var value = '"'+"ticketID"+'"';
                            for (i in data) {
                                table.insertAdjacentHTML("beforeend", "<tr " + " id = " + data[i].ID + " ><td>" + data[i].ID + "</td><td>" + data[i].Date + "</td><td>" + data[i].Time + "</td></tr>");
                                document.getElementById(data[i].ID).setAttribute("onclick","document.getElementById("+value+").innerHTML=5")
                            }
                        }
                    }
                    xhr.send();
                }
            </script>
        </div>
    </form>
</body>
</html>
