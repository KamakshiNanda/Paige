<%-- 
    Document   : index
    Created on : 4 Nov, 2019, 5:13:11 PM
    Author     : KAMAKSHI
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Connectivity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>Paige | Home</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="css/core-style.css">
        <link rel="stylesheet" href="style.css">
        <%
            Connectivity c=new Connectivity();
            Connection con=c.createConnection();
            PreparedStatement pst=con.prepareStatement("SELECT sellingPrice FROM seller_book_details WHERE category=? ORDER BY sellingPrice");
            pst.setString(1,"best sellers");
            ResultSet rs=pst.executeQuery();
            if(rs.next())
            %>
    </head>

    <body>

        <!-- ##### Main Content Wrapper Start ##### -->
        <div class="main-content-wrapper d-flex clearfix">

            <!-- Mobile Nav (max width 767px)-->
            <div class="mobile-nav">
                <!-- Navbar Brand -->
                <div class="amado-navbar-brand">
                    <a href="index.jsp"><img src="img/core-img/logo2.jpeg" alt=""></a>
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
                    <a href="index.jsp"><img src="img/core-img/logo2.jpeg" alt=""></a>
                </div>
                <!-- Amado Nav -->
                <nav class="amado-nav">
                    <ul>
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li><a href="shop.jsp">Shop</a></li>
                        <li><a href="SellerForm.jsp">Sell</a></li>
                        <!--<li><a href="wishlist.jsp">Wishlist</a></li>-->
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
                    <!--<a href="NewBooks.jsp" class="btn amado-btn active">New this week</a>-->
                </div>
                <!-- Cart Menu -->
                <div class="cart-fav-search mb-100">
                   <!-- <a href="wishlist.jsp" class="cart-nav"><img src="img/core-img/cart.png" alt=""> Wishlist</a>-->
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

            <!-- Product Catagories Area Start -->
            <div class="products-catagories-area clearfix">
                <div class="amado-pro-catagory clearfix">

                    <!-- Single Catagory -->
                    <div class="single-products-catagory clearfix">
                        <a href="shop.jsp?category='best sellers'">
                            <img src="bookImages/a bestsellers5.jpg" style="height: auto; width: fit-content;" alt="Bestsellers image">
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <div class="line"></div>
                                <p class="frm">From ₹<%=rs.getString(1)%></p>
                                <h4>Best Sellers</h4>
                            </div>
                        </a>
                    </div>

                    <!-- Single Catagory -->
                    <%
                        pst=con.prepareStatement("SELECT sellingPrice FROM seller_book_details WHERE category=? ORDER BY sellingPrice");
                        pst.setString(1,"literature and fiction");
                        rs=pst.executeQuery();
                        if(rs.next())
                    %>
                    <div class="single-products-catagory clearfix">
                        <a href="shop.jsp?category='literature and fiction'">
                            <img src="bookImages/a literature and fiction.jfif" alt="Literature and fiction">
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <div class="line"></div>
                                <p class="frm">From ₹<%=rs.getString(1)%></p>
                                <h4>Literature and Fiction</h4>
                            </div>
                        </a>
                    </div>
                    <%
                        pst=con.prepareStatement("SELECT sellingPrice FROM seller_book_details WHERE category=? ORDER BY sellingPrice");
                        pst.setString(1,"textbook");
                        rs=pst.executeQuery();
                        if(rs.next())
                    %>
                    <!-- Single Catagory -->
                    <div class="single-products-catagory clearfix">
                        <a href="shop.jsp?category='textbook'">
                            <img src="bookImages/a textbook3.jpg" alt="Textbooks image">
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <div class="line"></div>
                                <p class="frm">From ₹<%=rs.getString(1)%></p>
                                <h4>Textbooks</h4>
                            </div>
                        </a>
                    </div>
                    <%
                        pst=con.prepareStatement("SELECT sellingPrice FROM seller_book_details WHERE category=? ORDER BY sellingPrice");
                        pst.setString(1,"children");
                        rs=pst.executeQuery();
                        if(rs.next())
                    %>
                    <!-- Single Catagory -->
                    <div class="single-products-catagory clearfix">
                        <a href="shop.jsp?category='children'">
                            <img src="bookImages/a children2.jpg" alt="Children">
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <div class="line"></div>
                                <p class="frm">From ₹<%=rs.getString(1)%></p>
                                <h4>Children</h4>
                            </div>
                        </a>
                    </div>
                     <%
                        pst=con.prepareStatement("SELECT sellingPrice FROM seller_book_details WHERE category=? ORDER BY sellingPrice");
                        pst.setString(1,"nonfiction");
                        rs=pst.executeQuery();
                        if(rs.next())
                    %>
                    <!-- Single Catagory -->
                    <div class="single-products-catagory clearfix">
                        <a href="shop.jsp?category='nonfiction'">
                            <img src="bookImages/a nonfiction2.jpeg" alt="Nonfiction image">
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <div class="line"></div>
                                <p>From ₹<%=rs.getString(1)%></p>
                                <h4>Nonfiction</h4>
                            </div>
                        </a>
                    </div>
                    <%
                        pst=con.prepareStatement("SELECT sellingPrice FROM seller_book_details WHERE category=? ORDER BY sellingPrice");
                        pst.setString(1,"classics");
                        rs=pst.executeQuery();
                        if(rs.next())
                    %>
                    <!-- Single Catagory -->
                    <div class="single-products-catagory clearfix">
                        <a href="shop.jsp?category='classics'">
                            <img src="bookImages/images4.jpg" alt="">
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <div class="line"></div>
                                <p>From ₹<%=rs.getString(1)%></p>
                                <h4>Classics</h4>
                            </div>
                        </a>
                    </div>
                    <%
                        pst=con.prepareStatement("SELECT sellingPrice FROM seller_book_details WHERE category=? ORDER BY sellingPrice");
                        pst.setString(1,"crime and thriller");
                        rs=pst.executeQuery();
                        if(rs.next())
                    %>
                    <!-- Single Catagory -->
                    <div class="single-products-catagory clearfix">
                        <a href="shop.jsp?category='crime and thriller'">
                            <img src="bookImages/a crime and thrillers.jpg" alt="Crime and Thriller">
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <div class="line"></div>
                                <p>From ₹<%=rs.getString(1)%></p>
                                <h4>Crime and Thriller</h4>
                            </div>
                        </a>
                    </div>
                    <%
                        pst=con.prepareStatement("SELECT sellingPrice FROM seller_book_details WHERE category=? ORDER BY sellingPrice");
                        pst.setString(1,"romantic");
                        rs=pst.executeQuery();
                        if(rs.next())
                    %>
                    <!-- Single Catagory -->
                    <div class="single-products-catagory clearfix">
                        <a href="shop.jsp?category='romantic'">
                            <img src="bookImages/a romantic3.jpg" alt="">
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <div class="line"></div>
                                <p>From ₹<%=rs.getString(1)%></p>
                                <h4>Romantic</h4>
                            </div>
                        </a>
                    </div>
                    <%
                        pst=con.prepareStatement("SELECT sellingPrice FROM seller_book_details WHERE category=? ORDER BY sellingPrice");
                        pst.setString(1,"science and fiction");
                        rs=pst.executeQuery();
                        if(rs.next())
                    %>
                    <!-- Single Catagory -->
                    <div class="single-products-catagory clearfix">
                        <a href="shop.jsp?category='science and fiction'">
                            <img src="bookImages/a science_fiction3.jpg" alt="science and fiction image">
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <div class="line"></div>
                                <p>From ₹<%=rs.getString(1)%></p>
                                <h4>Science and Fiction</h4>
                            </div>
                        </a>
                    </div>

                </div>
            </div>
            <!-- Product Catagories Area End -->
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
                            <form action="login_signup.jsp" method="post">
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
                                                <a class="nav-link" href="index.jsp">Home</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="shop.jsp">Shop</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="product-description.jsp">Product</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="wishlist.jsp">WishList</a>
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
