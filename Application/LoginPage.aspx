<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Application.LoginPage" %>

<!DOCTYPE html>
<html>
<head>
    <title>Delivery App</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="CSS/LoginStyle.css" rel="stylesheet" type="text/css" media="all" />
    <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
    <script src="/Scripts/jquery-3.4.1.min.js" type="text/javascript"></script>
</head>
<body>
    <div class="login-page">
        <div class="form">
            <form class="auth-form" runat="server" defaultbutton="btnLogin">
                <div class="register-form">
                    <asp:TextBox runat="server" ID="txtName" placeholder="Name"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txtSurname" placeholder="Surname"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txtRegUsername" placeholder="Username"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" placeholder="Email"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txtRegPassword" TextMode="Password" placeholder="Password"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txtRegConfirmPassword" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                    <asp:Button runat="server" ID="btnSignUp" Text="SIGN UP" />
                    <p class="message">Already registered? <a href="#">Sign In</a></p>
                </div>

                <div class="login-form">
                    <asp:TextBox runat="server" ID="txtLogin" placeholder="Username"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" placeholder="Password" />
                    <asp:Button runat="server" ID="btnLogin" Text="LOGIN" />
                    <p class="message">Not registered? <a href="#">Create an account</a></p>
                </div>

            </form>
        </div>
    </div>




    <script type="text/javascript">
        $(".message").click(function () {
            $('.register-form').animate({ height: "toggle", opacity: "toggle" }, "slow");
            $('.login-form').animate({ height: "toggle", opacity: "toggle" }, "slow");
        });


    </script>
    <script type="text/javascript">

        const Http = new XMLHttpRequest();
        const url = 'https://api.weather.yandex.ru/v1/forecast/';
        Http.open("GET", url);
        Http.setRequestHeader("X-Yandex-API-Key", "eb5930e0-d5aa-4acd-adc3-bb4bf7dbd92b")
        Http.setRequestHeader("Access-Control-Allow-Origin", "https://api.weather.yandex.ru")

        Http.send();

        Http.onreadystatechange = (e) => {
            var obj = JSON.parse(Http.responseText)
            alert('Текущая температура = '+ obj['fact']['temp'])
            //console.log(Http.responseText)
        }
    </script>
</body>
</html>
