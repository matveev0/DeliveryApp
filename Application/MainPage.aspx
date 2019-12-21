<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Application.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900" rel="stylesheet" />
    <link rel="stylesheet" href="CSS/open-iconic-bootstrap.min.css" />
    <link rel="stylesheet" href="CSS/animate.css" />
    <link rel="stylesheet" href="CSS/owl.carousel.min.css" />
    <link rel="stylesheet" href="CSS/owl.theme.default.min.css" />
    <link rel="stylesheet" href="CSS/magnific-popup.css" />
    <link rel="stylesheet" href="CSS/aos.css" />
    <link rel="stylesheet" href="CSS/ionicons.min.css" />
    <link rel="stylesheet" href="CSS/flaticon.css" />
    <link rel="stylesheet" href="CSS/icomoon.css" />
    <link rel="stylesheet" href="CSS/style.css" />
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar">
        <div class="container">
            <a class="navbar-brand" href="MainPage.aspx">DeliApp</a>
            <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span>Menu
            </button>
            <span id="myweather"></span>
            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav nav ml-auto">
                    <li class="nav-item"><a href="#burgers-section" class="nav-link"><span>Burgers</span></a></li>
                    <li class="nav-item"><a href="#sushi-section" class="nav-link"><span>Sushi</span></a></li>
                    <li class="nav-item"><a href="#pizza-section" class="nav-link"><span>Pizza</span></a></li>
                    <li class="nav-item"><a href="#drinks-section" class="nav-link"><span>Drinks</span></a></li>
                    <li class="nav-item"><a href="#snacks-section" class="nav-link"><span>Snacks</span></a></li>
                    <li class="nav-item"><a href="#desserts-section" class="nav-link"><span>Desserts</span></a></li>
                </ul>
            </div>
        </div>
    </nav>

    <form id="form1" runat="server">
        <section id="burgers-section" class="hero">
            <div class="home-slider js-fullheight owl-carousel">
                <div class="slider-item js-fullheight">
                    <div class="overlay"></div>
                    <div class="container-fluid p-0">
                        <div class="row d-md-flex no-gutters slider-text js-fullheight align-items-center justify-content-end" data-scrollax-parent="true">
                            <div class="one-third order-md-last img js-fullheight" style="background-image: url(images/burger2.jpg);">
                                <h3 class="vr" style="background-image: url(images/divider.jpg);">Burgers</h3>
                            </div>
                            <div class="one-forth d-flex js-fullheight align-items-center" data-scrollax=" properties: { translateY: '70%' }">
                                <div>
                                    <asp:Repeater ID="burgerRepeater" runat="server">
                                        <HeaderTemplate>
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>ProductName
                                                        </th>
                                                        <th>Cost
                                                        </th>
                                                        <th>Description
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <%# DataBinder.Eval(Container.DataItem, "ProductName") %>               

                                                </td>
                                                <td>
                                                    <%# DataBinder.Eval(Container.DataItem, "Cost") %>
                                                </td>
                                                <td>
                                                    <%# DataBinder.Eval(Container.DataItem, "Description") %>
                                                </td>
                                                <td>
                                                    <a href="EditPage.aspx?ID=<%# DataBinder.Eval(Container.DataItem, "ID") %>">Edit Product</a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </tbody>
	</table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="sushi-section" class="hero">
            <div class="home-slider js-fullheight owl-carousel">
                <div class="slider-item js-fullheight">
                    <div class="overlay"></div>
                    <div class="container-fluid p-0">
                        <div class="row d-md-flex no-gutters slider-text js-fullheight align-items-center justify-content-end" data-scrollax-parent="true">
                            <div class="one-third order-md-last img js-fullheight" style="background-image: url(images/sushi2.jpg);">
                                <h3 class="vr" style="background-image: url(images/divider.jpg);">sushi</h3>
                            </div>
                            <div class="one-forth d-flex js-fullheight align-items-center" data-scrollax=" properties: { translateY: '70%' }">
                                <div>
                                    <asp:DataGrid ID="sushiDatagrid" runat="server" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundColumn DataField="ProductName" HeaderText="Product name"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="Cost" HeaderText="Cost"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="Description" HeaderText="Description"></asp:BoundColumn>
                                            <asp:ButtonColumn Text="Edit" CommandName="Edit"></asp:ButtonColumn>

                                        </Columns>
                                    </asp:DataGrid>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="pizza-section" class="hero">
            <div class="home-slider js-fullheight owl-carousel">
                <div class="slider-item js-fullheight">
                    <div class="overlay"></div>
                    <div class="container-fluid p-0">
                        <div class="row d-md-flex no-gutters slider-text js-fullheight align-items-center justify-content-end" data-scrollax-parent="true">
                            <div class="one-third order-md-last img js-fullheight" style="background-image: url(images/pizza.jpg);">
                                <h3 class="vr" style="background-image: url(images/divider.jpg);">pizza</h3>
                            </div>
                            <div class="one-forth d-flex js-fullheight align-items-center" data-scrollax=" properties: { translateY: '70%' }">
                                <div>
                                    <asp:Repeater ID="pizzaRepeater" runat="server">
                                        <HeaderTemplate>
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>ProductName
                                                        </th>
                                                        <th>Cost
                                                        </th>
                                                        <th>Description
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <%# DataBinder.Eval(Container.DataItem, "ProductName") %>               

                                                </td>
                                                <td>
                                                    <%# DataBinder.Eval(Container.DataItem, "Cost") %>
                                                </td>
                                                <td>
                                                    <%# DataBinder.Eval(Container.DataItem, "Description") %>
                                                </td>
                                                <td>
                                                    <a href="EditPage.aspx?ID=<%# DataBinder.Eval(Container.DataItem, "ID") %>">Edit Product</a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </tbody>
	</table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>

    <script type="text/javascript">

        const Http = new XMLHttpRequest();
        const url = 'https://api.weather.yandex.ru/v1/forecast/';
        Http.open("GET", url);
        Http.setRequestHeader("X-Yandex-API-Key", "eb5930e0-d5aa-4acd-adc3-bb4bf7dbd92b")
        Http.setRequestHeader("Access-Control-Allow-Origin", "https://api.weather.yandex.ru")

        Http.send();

        Http.onreadystatechange = (e) => {
            var obj = JSON.parse(Http.responseText)
            $("#myweather").text("Weather in Moscow = " + obj['fact']['temp']);
        }
    </script>

    <script src="Scripts/jquery.min.js"></script>
    <script src="Scripts/jquery-migrate-3.0.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery.easing.1.3.js"></script>
    <script src="Scripts/jquery.waypoints.min.js"></script>
    <script src="Scripts/jquery.stellar.min.js"></script>
    <script src="Scripts/owl.carousel.min.js"></script>
    <script src="Scripts/jquery.magnific-popup.min.js"></script>
    <script src="Scripts/aos.js"></script>
    <script src="Scripts/jquery.animateNumber.min.js"></script>
    <script src="Scripts/scrollax.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
    <script src="Scripts/google-map.js"></script>
    <script src="Scripts/main.js"></script>
</body>
</html>
