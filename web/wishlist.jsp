<%-- 
    Document   : wishlist
    Created on : 24 Dec, 2019, 4:05:10 AM
    Author     : KAMAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("uid") == null) {
        response.sendRedirect("login_signup.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>Paige | Cart</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="css/core-style.css">
        <link rel="stylesheet" href="style.css">
        <script>
            var total=0,items=0;
            function getData()
            {
                if (window.XMLHttpRequest)
                {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject)
                {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                    //alert("ActiveXObject object created");
                }
                try
                {
                    request.onreadystatechange = displayData;
                    request.open("POST", "WishList", true);
                    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    request.send();
                } catch (e)
                {
                    alert("Unable to connect to server." + e);
                }
            }
            function displayData()
            {
                //console.log("getsignin called" + request.readyState);
                if (request.readyState === 4)
                {
                    var text = request.responseText;
                    console.log(text);
                    var obj = JSON.parse(text);
                    json = JSON.parse(text);
                    if (obj.length > 0)
                    {
                        for(var i=0;i<obj.length;i++)
                        {
                            items++;
                            total+=obj[i].price;
                            insertRow(obj[i].thumbnail,obj[i].ISBN,obj[i].title,obj[i].price);
                        }
                    }
                    else
                    {
                        document.getElementById("wish").style.display="none";
                        document.getElementById("w2").style.display="none";
                        document.getElementById("ew").style.display="block";
                    }
                }
              
            }
            function insertRow(image,isbn,title,price) {
                var table = document.getElementById("table");
                var row = table.insertRow(1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                cell1.innerHTML = "<a href='#'><img src='"+image+"' alt='Product'></a>";
                cell1.className="cart_product_img";
                cell2.innerHTML = "<h5>"+isbn+"</h5>";
                cell2.className="cart_product_desc";
                cell3.innerHTML = "<span>"+title+"</span>";
                cell1.className="price";
                cell4.innerHTML = "<span>₹"+price+"</span>";
                document.getElementById("items").innerHTML=items;
                document.getElementById("total").innerHTML="₹"+total;
            }
        </script>

    </head>

    <body onload="getData()">
        <!-- Search Wrapper Area Start -->
        <div class="search-wrapper section-padding-100">
            <div class="search-close">
                <i class="fa fa-close" aria-hidden="true"></i>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="search-content">
                            <form action="#" method="get">
                                <input type="search" name="search" id="search" placeholder="Type your keyword...">
                                <button type="submit"><img src="img/core-img/search.png" alt=""></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Search Wrapper Area End -->

        <!-- ##### Main Content Wrapper Start ##### -->
        <div class="main-content-wrapper d-flex clearfix">

            <!-- Mobile Nav (max width 767px)-->
            <div class="mobile-nav">
                <!-- Navbar Brand -->
                <div class="amado-navbar-brand">
                    <a href="index.html"><img src="img/core-img/logo2.jpeg" alt=""></a>
                </div>
                <!-- Navbar Toggler -->
                <div class="amado-navbar-toggler">
                    <span></span><span></span><span></span>
                </div>
            </div>

            <!-- Header Area Start -->
            <header class="header-area clearfix">
                <!-- Close Icon -->
                <div class="nav-close">
                    <i class="fa fa-close" aria-hidden="true"></i>
                </div>
                <!-- Logo -->
                <div class="logo">
                    <a href="index.html"><img src="img/core-img/logo2.jpeg" alt=""></a>
                </div>
                <!-- Amado Nav -->
                <nav class="amado-nav">
                    <ul>
                        <li ><a href="index.jsp">Home</a></li>
                        <li><a href="shop.jsp">Shop</a></li>
                        <li><a href="SellerForm.jsp">Sell</a></li>
                        <li class="active"><a href="wishlist.jsp">Wishlist</a></li>
                        <li><a href="LogOut" onclick="signOut();">
                                <%
                                    if (session.getAttribute("uid") == null) {
                                        out.print("Login / Signup");
                                    } else {
                                        out.print("Logout");
                                    } 
                                %>
                            </a></li>
                    </ul>
                </nav>
                <script>
                    function signOut() {
                        var auth2 = gapi.auth2.getAuthInstance();
                        auth2.signOut().then(function () {
                            console.log('User signed out.');
                        });
                    }
                </script>
                <!-- Button Group -->
                <div class="amado-btn-group mt-30 mb-100">
                    <a href="MyBooks.jsp" class="btn amado-btn mb-15">My Books</a>
                    <a href="NewBooks.jsp" class="btn amado-btn active">New this week</a>
                </div>
                <!-- Cart Menu -->
                <div class="cart-fav-search mb-100">
                    <a href="wishlist.jsp" class="cart-nav"><img src="img/core-img/cart.png" alt=""> Wishlist</a>
                    <a href="AccountDetails.jsp" class="fav-nav"><img src="img/core-img/user.png" alt=""> User</a>
                </div>
                <!-- Social Button -->
                <div class="social-info d-flex justify-content-between">
                    <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                    <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                    <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                    <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                </div>
            </header>
            <!-- Header Area End -->

            <div class="cart-table-area section-padding-100">
                <div class="container-fluid">
                    <div class="row">
                        <div id="ew" class="col-12 col-lg-12" style="display:none;">
                            <h1>Your Wishlist is empty.</h1>
                        </div>
                        <div class="col-12 col-lg-8" id="wish">
                            <div class="cart-title mt-50">
                                <h2>Wishlist</h2>
                            </div>

                            <div class="cart-table clearfix">
                                <table class="table table-responsive" id="table">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>ISBN</th>
                                            <th>Title</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr style="display:none;">
                                            <td class="cart_product_img">
                                                <a href="#"><img src="http://books.google.com/books/content?id=8xClQgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api" alt="Product"></a>
                                            </td>
                                            <td class="cart_product_desc">
                                                <h5>0140366687</h5>
                                            </td>
                                            <td class="price">
                                                <span>Little Woman</span>
                                            </td>
                                            <td>
                                                <span>₹95</span>
                                            </td>
                                        </tr>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-12 col-lg-4" id="w2">
                            <div class="cart-summary">
                                <h5>Total</h5>
                                <ul class="summary-table">
                                    <li><span>items:</span> <span id="items">3</span></li>
                                    <li><span>total:</span> <span id="total">₹291</span></li>
                                </ul>
                                <div class="cart-btn mt-100">
                                    <a href="cart.html" class="btn amado-btn w-100">Checkout</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ##### Main Content Wrapper End ##### -->

        <!-- ##### Newsletter Area Start ##### -->
        <section class="newsletter-area section-padding-100-0">
            <div class="container">
                <div class="row align-items-center">
                    <!-- Newsletter Text -->
                    <div class="col-12 col-lg-6 col-xl-7">
                        <div class="newsletter-text mb-100">
                            <h2>Get yourself <span>Registered</span></h2>
                            <p>Get yourself registered to get access to our services.</p>
                        </div>
                    </div>
                    <!-- Newsletter Form -->
                    <div class="col-12 col-lg-6 col-xl-5">
                        <div class="newsletter-form mb-100">
                            <form action="#" method="post">
                                <input type="email" name="email" class="nl-email" placeholder="Your E-mail">
                                <input type="submit" value="Register">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Newsletter Area End ##### -->

        <!-- ##### Footer Area Start ##### -->
        <footer class="footer_area clearfix">
            <div class="container">
                <div class="row align-items-center">
                    <!-- Single Widget Area -->
                    <div class="col-12 col-lg-4">
                        <div class="single_widget_area">
                            <!-- Logo -->
                            <div class="footer-logo mr-50">
                                <a href="index.html"><img src="img/core-img/logo2.png" alt=""></a>
                            </div>
                            <!-- Copywrite Text -->
                            <p class="copywrite"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made by <a href="https://www.msu-cyberia.com" target="_blank">Team Paige. </a>
                            </p>
                        </div>
                    </div>
                    <!-- Single Widget Area -->
                    <div class="col-12 col-lg-8">
                        <div class="single_widget_area">
                            <!-- Footer Menu -->
                            <div class="footer_menu">
                                <nav class="navbar navbar-expand-lg justify-content-end">
                                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#footerNavContent" aria-controls="footerNavContent" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
                                    <div class="collapse navbar-collapse" id="footerNavContent">
                                        <ul class="navbar-nav ml-auto">
                                            <li class="nav-item active">
                                                <a class="nav-link" href="index.html">Home</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="shop.html">Shop</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="product-description.html">Product</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="cart.html">Cart</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="checkout.html">Checkout</a>
                                            </li>
                                        </ul>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- ##### Footer Area End ##### -->

        <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <!-- Popper js -->
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Plugins js -->
        <script src="js/plugins.js"></script>
        <!-- Active js -->
        <script src="js/active.js"></script>

    </body>

</html>
