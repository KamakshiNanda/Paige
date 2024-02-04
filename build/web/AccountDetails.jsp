<%-- 
    Document   : AccountDetails
    Created on : 24 Dec, 2019, 7:39:09 AM
    Author     : KAMAKSHI
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Connectivity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Paige | User</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">
    <!--javascript-->
    <script src="js/checkMob.js" type="text/javascript"></script>
</head>

<body>
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
                   <!-- <a href="NewBooks.jsp" class="btn amado-btn active">New this week</a>-->
                </div>
                <!-- Cart Menu -->
                <div class="cart-fav-search mb-100">
                    <!--<a href="wishlist.jsp" class="cart-nav"><img src="img/core-img/cart.png" alt=""> Wishlist</a>-->
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
                    <div class="col-12 col-lg-12">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h2>Account details</h2>
                            </div>
                            <form action="StoreSellerData" method="post" onSubmit="return validateMobile()">
                                
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control" id="first_name" 
                                        <%
                                            PreparedStatement pst;
                                            ResultSet rs;
                                            int l=0;
                                            if(session.getAttribute("uid")!=null)
                                            {
                                                String id=session.getAttribute("uid").toString();
                                                Connectivity c=new Connectivity();
                                                Connection con = c.createConnection();
                                                    id=session.getAttribute("uid").toString();
                                                    pst=con.prepareStatement("Select full_name from user_details where id=?");
                                                    pst.setString(1,id);
                                                    rs=pst.executeQuery(); 
                                                    if(rs.next())
                                                    {
                                                        l=rs.getString(1).indexOf(" ");
                                                        out.print("value='"+rs.getString(1).substring(0,l+1)+"'");
                                                
                                        %>
                                        placeholder="First Name" style="background-color: rgb(232, 240, 254) ;cursor:pointer;color: rgb(0, 0, 0);" readonly>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control" id="last_name" 
                                        <%  
                                                    out.print("value='"+rs.getString(1).substring(l,rs.getString(1).length())+"'");
                                                    c.closeConnection(con);
                                                    
                                                }
                                            }
                                            else
                                            {
                                                response.sendRedirect("login_signup.jsp");
                                            }

                                         %>
                                        placeholder="Last Name" style="background-color: rgb(232, 240, 254) ;cursor:pointer;color: rgb(0, 0, 0);" readonly>
                                    </div>
                                    
                                    <div class="col-12 mb-3">
                                        <input type="email" class="form-control" id="email" placeholder="Email" 
                                         <%
                                            if(session.getAttribute("uid")!=null)
                                            {
                                                String id=session.getAttribute("uid").toString();
                                                Connectivity c=new Connectivity();
                                                Connection con = c.createConnection();
                                                pst=con.prepareStatement("Select email from user_details where id=?");
                                                pst.setString(1,id);
                                                rs=pst.executeQuery(); 
                                                if(rs.next())
                                                {
                                                    out.print("value='"+rs.getString(1)+"'");
                                                }
                                                c.closeConnection(con);
                                            }
                                        %>
                                        style="background-color: rgb(232, 240, 254) ;cursor:pointer;color: rgb(0, 0, 0);" readonly>
                                    </div>			
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control" id="state" 
                                        <%
                                            if(session.getAttribute("uid")!=null)
                                            {
                                                String id=session.getAttribute("uid").toString();
                                                Connectivity c=new Connectivity();
                                                Connection con = c.createConnection();
                                                pst=con.prepareStatement("Select state from seller_details where id=?");
                                                pst.setString(1,id);
                                                rs=pst.executeQuery(); 
                                                if(rs.next())
                                                {
                                                    out.print("value='"+rs.getString(1)+"'");
                                                }
                                                else
                                                {
                                                    response.sendRedirect("SellerForm.jsp");
                                                }
                                                c.closeConnection(con);
                                            }
                                        %> placeholder="India" required="true" style="background-color: rgb(232, 240, 254);color: rgb(0, 0, 0);">
                                    </div>
                                   <div class="col-12 mb-3">
                                        <input type="text" class="form-control" id="city" <%
                                            if(session.getAttribute("uid")!=null)
                                            {
                                                String id=session.getAttribute("uid").toString();
                                                Connectivity c=new Connectivity();
                                                Connection con = c.createConnection();
                                                pst=con.prepareStatement("Select city from seller_details where id=?");
                                                pst.setString(1,id);
                                                rs=pst.executeQuery(); 
                                                if(rs.next())
                                                {
                                                    out.print("value='"+rs.getString(1)+"'");
                                                }
                                                else
                                                {
                                                    response.sendRedirect("SellerForm.jsp");
                                                }
                                                c.closeConnection(con);
                                            }
                                        %> placeholder="India" required="true" style="background-color: rgb(232, 240, 254);color: rgb(0, 0, 0);">
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control" id="country" value="India" placeholder="India" required="true" style="background-color: rgb(232, 240, 254);color: rgb(0, 0, 0);">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control" id="zipCode" placeholder="Pin Code" name="pincode" 
                                        <%
                                            if(session.getAttribute("uid")!=null)
                                            {
                                                String id=session.getAttribute("uid").toString();
                                                Connectivity c=new Connectivity();
                                                Connection con = c.createConnection();
                                                pst=con.prepareStatement("Select pincode from seller_details where id=?");
                                                pst.setString(1,id);
                                                rs=pst.executeQuery(); 
                                                if(rs.next())
                                                {
                                                    out.print("value='"+rs.getString(1)+"'");
                                                }
                                                else
                                                {
                                                    response.sendRedirect("SellerForm.jsp");
                                                }
                                                c.closeConnection(con);
                                            }
                                        %>
                                        style="background-color: rgb(232, 240, 254);color: rgb(0, 0, 0);">
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <input type="text" class="form-control" id="phone_number" name="mobileNumber"
                                               <%
                                            if(session.getAttribute("uid")!=null)
                                            {
                                                String id=session.getAttribute("uid").toString();
                                                Connectivity c=new Connectivity();
                                                Connection con = c.createConnection();
                                                pst=con.prepareStatement("Select mob_number from seller_details where id=?");
                                                pst.setString(1,id);
                                                rs=pst.executeQuery(); 
                                                if(rs.next())
                                                {
                                                    out.print("value='"+rs.getString(1)+"'");
                                                }
                                                else
                                                {
                                                    response.sendRedirect("SellerForm.jsp");
                                                }
                                                c.closeConnection(con);
                                            }
                                        %>placeholder="Mobile No" style="background-color: rgb(232, 240, 254);color: rgb(0, 0, 0);">
                                        <p id="dispError" style="color:red;display: none;"></p>
                                    </div>
                                    <div class="col-12 mb-4">
                                        <div class="custom-control custom-checkbox d-block mb-3">
                                            <input type="checkbox" class="custom-control-input" id="customCheck2" name="checkboxes" value="de" 
                                        <%
                                            if(session.getAttribute("uid")!=null)
                                            {
                                                String id=session.getAttribute("uid").toString();
                                                Connectivity c=new Connectivity();
                                                Connection con = c.createConnection();
                                                pst=con.prepareStatement("Select displayEmail from seller_details where id=?");
                                                pst.setString(1,id);
                                                rs=pst.executeQuery(); 
                                                if(rs.next())
                                                {
                                                    if(rs.getBoolean(1)==true)
                                                    {
                                                        out.print("checked");
                                                    }
                                                }
                                                else
                                                {
                                                    response.sendRedirect("SellerForm.jsp");
                                                }
                                                c.closeConnection(con);
                                            }
                                        %>>
                                            <label class="custom-control-label" for="customCheck2">Show my email address on my ads</label>
                                        </div>
                                        <div class="custom-control custom-checkbox d-block">
                                            <input type="checkbox" class="custom-control-input" id="customCheck3"
                                            <%
                                            if(session.getAttribute("uid")!=null)
                                            {
                                                String id=session.getAttribute("uid").toString();
                                                Connectivity c=new Connectivity();
                                                Connection con = c.createConnection();
                                                pst=con.prepareStatement("Select displayPhone from seller_details where id=?");
                                                pst.setString(1,id);
                                                rs=pst.executeQuery(); 
                                                if(rs.next())
                                                {
                                                    if(rs.getBoolean(1)==true)
                                                    {
                                                        out.print("checked");
                                                    }
                                                }
                                                else
                                                {
                                                    response.sendRedirect("SellerForm.jsp");
                                                }
                                                c.closeConnection(con);
                                            }
                                        %>
                                                   name="checkboxes" value="dm">
                                            <label class="custom-control-label" for="customCheck3">Show my phone number on my ads</label>
                                        </div>
                                    </div>
                                </div>
                            </form>
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
    <script src="js/active.js"></script><a id="scrollUp" href="#top" style="display: none; position: fixed; z-index: 2147483647;"><i class="fa fa-angle-up" aria-hidden="true"></i></a><a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647; display: none;"><i class="fa fa-angle-up" aria-hidden="true"></i></a><a id="scrollUp" href="#top" style="display: none; position: fixed; z-index: 2147483647;"><i class="fa fa-angle-up" aria-hidden="true"></i></a>


</body>
</html>
