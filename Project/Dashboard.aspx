<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs"  Inherits="Project.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="StyleSheetDashboard.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body onload="loadtext()">
    <form id="form1" runat="server">
             <header>
                <p id="name" runat="server">b</p>
            </header>
        <div class="Focus">
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
            <div class="Main">
                <div class="Uppers">
                    <div class="ViewAppointment">
                        <div class="heading">
                            <p>x</p>
                            <p id="ticketID" runat="server">y</p>
                        </div>
                        <hr/>
                        <div>
                            <p id="viewDate">z</p>
                            <p id ="viewTime">a</p>
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
                <button type="button" id="Confirm" onclick="senddata()" runat="server">Click Me!</button>
            </div>
            <script>
                function senddata() {
                    $.ajaxSetup({
                        cache: false
                    });

                    var selection = document.getElementById("ticketID").innerHTML;
                    var mailname = document.getElementById("name").innerText;
                    var newmail = '"' + mailname + '"';

                    $.ajax({
                        type: "POST",
                        url: 'Dashboard.aspx/TestMethod',
                        data: "{id:" + selection + ", email:" + newmail + " }",
                        contentType: "application/json; charset=utf-8",
                        dataType: 'json',
                        success: function (data) {
                            console.log(data);

                        }
                    });
                }





                var table = document.getElementById("tab");
               // table.insertAdjacentHTML("beforeend", "<tr><td>test</td><td>test</td><td>test</td></tr>");
                function loadtext() {
                    var xhr = new XMLHttpRequest;
                    xhr.open("GET", "test.json", true);

                    xhr.onload = function () {
                        if (this.status == 200) {
                            var data = JSON.parse(this.responseText);
                            var ticket = '"' + "ticketID" + '"';
                            var date = '"' + "viewTime" + '"';
                            var time = '"' + "viewDate" + '"';
                            for (i in data) {
                                table.insertAdjacentHTML("beforeend", "<tr " + " id = " + data[i].ID + " ><td>" + data[i].ID + "</td><td>" + data[i].Date + "</td><td>" + data[i].Time + "</td></tr>");
                                document.getElementById(data[i].ID).setAttribute("onclick", "document.getElementById(" + ticket + ").innerHTML=" + data[i].ID + ";document.getElementById(" + date + ").innerHTML=" + '"' + data[i].Date + '"' + ";document.getElementById(" + time + ").innerHTML=" + '"' + data[i].Time + '"' + ";");
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
