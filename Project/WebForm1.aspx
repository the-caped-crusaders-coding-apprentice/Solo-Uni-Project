<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Project.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="Style1.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div id ="links">
            <a href="login.aspx" class ="linkTextHead">Log in</a>
            <a href="SignUp.aspx" id ="HeadLog" class ="linkTextHead">Sign up</a>
            </div>
        </header>
    <div class ="Focus">
        <main>
            <div id ="Content">
            <h1>SKIP THE WAIT...</h1>
            <h2>Book medical appointments <br/> online and skip the lines.</h2>
            <div class ="Linksmain">
            <a href="login.aspx" id ="Log" class ="linkTextMain">Log in</a>
            <a href="SignUp.aspx" id ="Sign"  class ="linkTextMain">Sign up</a>
            </div>
            </div>
        </main>
        <div class ="image">
            <div class="wrap">
        <div class="cube">
            <div class="front">
                <img src="Untitled-1.png" alt="s"/>
            </div>
            <div class="back">
                <img src="Untitled-1.png" alt="s"/>
            </div>
            <div class="top"></div>
            <div class="bottom"></div>
            <div class="left"><img src="pill.png" alt="s"/>
            </div>
            <div class="right"><img src="pill.png" alt="s"/>
            </div>
        </div>
    </div>
        </div>
    </div>
    </form>
</body>
</html>
